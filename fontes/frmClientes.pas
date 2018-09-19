unit frmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDM, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, IPPeerClient,
  Datasnap.DBClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Types, REST.Json, System.JSON, REST.Response.Adapter, fraCliente;

type
  TFormClientes = class(TForm)
    pnlBotoes1: TPanel;
    btnGravar: TSpeedButton;
    btnLimpar: TSpeedButton;
    pnlCabecalho: TPanel;
    pnlTitulo: TPanel;
    edtTelefone: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEstado: TLabeledEdit;
    btnPesqCidade: TSpeedButton;
    btnPesqUF: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    edtCidDesc: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtUFDesc: TEdit;
    FrameCliente1: TFrameCliente;
    Label4: TLabel;
    procedure btnPesqClienteClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnPesqUFClick(Sender: TObject);
    procedure btnPesqCidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure prCarregar(_rstrAux: String; sTipoPesq: String);
    procedure prCarregarInfo(sCod: String);
    {$region ' A entidade deve utilizar a API REST de Geolocation da AZ para preencher Estado e Cidade,
    conforme o manual abaixo:'}
    procedure GeolocationAZ(sTipoPesq, sIDEstado: String);
    procedure JsonToDataset(aDataset: TDataSet; aJSON: string);
    {$endregion}


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClientes: TFormClientes;

implementation

uses uVariaveis, uMetodos, uMsg, uBiblioteca;

{$R *.dfm}

procedure TFormClientes.btnGravarClick(Sender: TObject);
begin
  if FrameCliente1.edtNome.Text = '' then
  begin
    fnMsg(msgCampoObrigatorio,'Nome');
    FrameCliente1.edtNome.SetFocus;
    Exit;
  end;

  if edtCidade.Text = '' then
  begin
    fnMsg(msgCampoObrigatorio,'Cidade');
    edtCidade.SetFocus;
    Exit;
  end;

  if edtEstado.Text = '' then
  begin
    fnMsg(msgCampoObrigatorio,'Estado');
    edtEstado.SetFocus;
    Exit;
  end;

  if FrameCliente1.edtCodigo.Text = '' then
  begin
    DM.qryAux.Close;
    DM.qryAux.SQL.Text := ' select max(CLIENTEID)+1 as cod from cliente ';
    DM.qryAux.open;
    FrameCliente1.edtCodigo.Text := DM.qryAux.FieldByName('Cod').AsString;
  end;

  DM.qryAux.Close;
  DM.qryAux.SQL.Text :=
    ' update or insert into cliente (CLIENTEID,NOME,TELEFONE,CIDADE,ESTADO) ' +
    ' values (:CLIENTEID, :NOME, :TELEFONE, :CIDADE, :ESTADO) ';
  DM.qryAux.ParamByName('CLIENTEID').AsString := FrameCliente1.edtCodigo.Text;
  DM.qryAux.ParamByName('NOME').AsString := Trim(FrameCliente1.edtNome.Text);
  DM.qryAux.ParamByName('TELEFONE').AsString := Trim(edtTelefone.Text);
  DM.qryAux.ParamByName('CIDADE').AsString := edtCidade.Text;
  DM.qryAux.ParamByName('ESTADO').AsString := edtEstado.Text;

  try
    DM.qryAux.ExecSQL;
    fnMsg(msgGravar);
  except
    on E:Exception do
    begin
      fnException('Erro ao gravar o código da tabela: [Cliente]: ',E);
    end;
  end;
end;

procedure TFormClientes.btnLimparClick(Sender: TObject);
begin
  FrameCliente1.prLimpar;
  edtTelefone.Clear;
  edtCidade.Clear;
  edtCidDesc.Clear;
  edtEstado.Clear;
  edtUFDesc.Clear;
end;

procedure TFormClientes.GeolocationAZ(sTipoPesq, sIDEstado: String);
var
   sEndpoint: String;
   restClient: TRESTClient;
   restRequest: TRESTRequest;
   restResponse: TRESTResponse;
begin
  if sTipoPesq = 'states' then
    sEndpoint := 'http://azcloud.brazilsouth.cloudapp.azure.com:29204/countries/55/states'
  else
    sEndpoint := 'http://azcloud.brazilsouth.cloudapp.azure.com:29204/countries/states/'+sIDEstado+'/cities';

  restClient := TRESTClient.Create(sEndpoint);
  restRequest := TRESTRequest.Create(restClient);
  restResponse := TRESTResponse.Create(restClient);
  try
    restRequest.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    restRequest.AcceptCharset := 'UTF-8, *;q=0.8';
    restRequest.Method := rmGET;
    restRequest.Response := restResponse;
    restRequest.Params.Clear;
    restRequest.Params.Add;
    restRequest.Params[0].ContentType := ctAPPLICATION_JSON;
    restRequest.Params[0].Kind := pkREQUESTBODY;
    restRequest.Params[0].Options := [poDoNotEncode];
    restRequest.Execute;
    JsonToDataset(DM.cdsRest, restResponse.Content);
    prCarregar('',sTipoPesq);
  finally
    restClient.Free;
  end;
end;

procedure TFormClientes.btnPesqCidadeClick(Sender: TObject);
begin
  if edtEstado.Text = '' then
  begin
    fnMsg(msgCampoObrigatorio,'Estado');
    edtEstado.SetFocus;
    Exit;
  end;
  GeolocationAZ('cities', edtEstado.Text);
end;

procedure TFormClientes.btnPesqUFClick(Sender: TObject);
begin
  GeolocationAZ('states', '');
end;

procedure TFormClientes.FormShow(Sender: TObject);
begin
  FrameCliente1.edtCodigo.SetFocus;
end;

procedure TFormClientes.prCarregar(_rstrAux: String; sTipoPesq: String);
var
  _rstrCod, _rstrDesc: string; //-=-=-=-= Retorna o valor pelo VAR na função
  _rbolAtivo: Boolean;
begin
  if sTipoPesq = 'states' then
  begin
    //[{"id":12,"name":"Acre","initials":"AC","country":55}
    prCarregarPesquisa('UF','Pesquisa de Estados',_rstrCod, _rstrDesc);
    edtEstado.Text := _rstrCod;
    edtUFDesc.Text := _rstrDesc;
  end
  else if sTipoPesq = 'cities' then
  begin
    //[{"id":4100103,"name":"Abatiá","state":41}
    prCarregarPesquisa('Cidade','Pesquisa de Cidades',_rstrCod, _rstrDesc);
    edtCidade.Text := _rstrCod;
    edtCidDesc.Text := _rstrDesc;
  end;
end;

procedure TFormClientes.prCarregarInfo(sCod: String);
begin
  if sCod = '' then
    Exit;

  DM.qryAux.Close;
  DM.qryAux.SQL.Text :=
    ' select ' +
    '   TELEFONE, CIDADE, ESTADO from cliente ' +
    ' where CLIENTEID = ' + sCod;
  DM.qryAux.Open;

  edtTelefone.Text := DM.qryAux.FieldByName('TELEFONE').AsString;
  edtCidade.Text := DM.qryAux.FieldByName('CIDADE').AsString;
  edtEstado.Text := DM.qryAux.FieldByName('ESTADO').AsString;
end;

procedure TFormClientes.SpeedButton3Click(Sender: TObject);
begin
  if FrameCliente1.edtCodigo.Text = '' then
  begin
    fnMsg(msgCampoObrigatorio,'Cliente');
    FrameCliente1.edtCodigo.SetFocus;
    Exit;
  end;

  DM.qryAux.Close;
  DM.qryAux.SQL.Text :=
    ' delete from cliente where clienteid = ' + FrameCliente1.edtCodigo.Text;
  try
    DM.qryAux.ExecSQL;
    btnLimpar.Click;
    fnMsg(msgExcluir);
  except
    on E:Exception do
    begin
      fnException('Erro ao gravar o código da tabela: [Produtos]: ',E);
    end;
  end;
end;

procedure TFormClientes.btnPesqClienteClick(Sender: TObject);
begin
  prcarregar('', '');
end;

procedure TFormClientes.JsonToDataset(aDataset : TDataSet; aJSON : string);
var
  jsnObj: TJSONArray;
  jsnDS : TCustomJSONDataSetAdapter;
begin
  if (aJSON = '') then
    Exit;

  jsnObj := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  jsnDS := TCustomJSONDataSetAdapter.Create(Nil);

  try
    jsnDS.Dataset := aDataset;
    jsnDS.UpdateDataSet(jsnObj);
  finally
    jsnDS.Free;
    jsnObj.Free;
  end;
end;

end.
