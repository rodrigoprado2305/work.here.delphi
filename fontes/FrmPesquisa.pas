unit FrmPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, uDM, Buttons, ExtCtrls,
  DB, DBClient, Datasnap.Provider;

type
  TFormPesquisa = class(TForm)
    gbxFiltro: TGroupBox;
    pnlBotoes1: TPanel;
    btnSelecionar: TSpeedButton;
    btnFechar: TSpeedButton;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    dsDados: TDataSource;
    dspDados: TDataSetProvider;
    cdsDados: TClientDataSet;
    grdPesquisa: TDBGrid;
    cmbOrdenar: TComboBox;
    Label3: TLabel;
    btnLimpar: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cmbOrdenarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure grdPesquisaTitleClick(Column: TColumn);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsDadosAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    bPesquisaBancoSQL: Boolean;
    { Public declarations }
    //-=-=-=-= Procedimento para carregar informações nas variáveis globais
    procedure prCarregarVar;
    //-=-=-=-= Procedimento para criar os indices para ordenar
    procedure prCriarIndicesPesquisa;
  end;

var
  FormPesquisa: TFormPesquisa;

implementation

Uses uVariaveis, uBiblioteca;

{$R *.dfm}

procedure TFormPesquisa.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPesquisa.btnLimparClick(Sender: TObject);
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  if bPesquisaBancoSQL then
      cdsDados.Filtered := False
  else
      DM.cdsRest.Filtered := False;
end;

procedure TFormPesquisa.btnSelecionarClick(Sender: TObject);
begin
  //-=-=-=-= Procedimento para carregar informações nas variáveis globais
  prCarregarVar;
  ModalResult := mrCancel;
end;

procedure TFormPesquisa.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if bPesquisaBancoSQL then
  begin
    if edtCodigo.Text = '' then
      cdsDados.Filtered := False;
  end
  else
  begin
    if edtCodigo.Text = '' then
      DM.cdsRest.Filtered := False;
  end;
end;

procedure TFormPesquisa.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if fnDigitarNum(Key) then
  begin
    key := #0;
    Exit;
  end;

  if key = #13 then
  begin
    if bPesquisaBancoSQL then
    begin
      cdsDados.Filtered := False;
      if edtCodigo.Text <> '' then
      begin
        cdsDados.Filtered := True;
        cdsDados.Filter := _gtypPesqCampos.sCampoCodigo + ' = '+edtCodigo.Text;
      end;
    end
    else
    begin
      DM.cdsRest.Filtered := False;
      if edtCodigo.Text <> '' then
      begin
        DM.cdsRest.Filtered := True;
        DM.cdsRest.Filter := _gtypPesqCampos.sCampoCodigo + ' = '+edtCodigo.Text;
      end;
    end;
  end;
end;

procedure TFormPesquisa.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if bPesquisaBancoSQL then
  begin
    if edtDescricao.Text = '' then
      cdsDados.Filtered := False;
  end
  else
  begin
    if edtDescricao.Text = '' then
      DM.cdsRest.Filtered := False;
  end;
end;

procedure TFormPesquisa.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if bPesquisaBancoSQL then
    begin
      cdsDados.Filtered := False;
      if edtDescricao.Text <> '' then
      begin
        cdsDados.Filtered := True;
        cdsDados.Filter := _gtypPesqCampos.sCampoDescricao + ' Like '+QuotedStr('%'+edtDescricao.Text+'%');
      end;
    end
    else
    begin
      DM.cdsRest.Filtered := False;
      if edtDescricao.Text <> '' then
      begin
        DM.cdsRest.Filtered := True;
        DM.cdsRest.Filter := _gtypPesqCampos.sCampoDescricao + ' Like '+QuotedStr('%'+edtDescricao.Text+'%');
      end;
    end;
  end;
end;

procedure TFormPesquisa.FormCreate(Sender: TObject);
begin
  dspDados.DataSet := dm.qryPesq;
end;

procedure TFormPesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f2 then
    btnSelecionar.click
  else if key = vk_escape then
    btnFechar.click;
end;

procedure TFormPesquisa.FormShow(Sender: TObject);
begin
  prCriarIndicesPesquisa;
  cmbOrdenarChange(Sender);
  edtDescricao.SetFocus;
end;

procedure TFormPesquisa.grdPesquisaDblClick(Sender: TObject);
begin
  btnSelecionar.click;
end;

procedure TFormPesquisa.grdPesquisaTitleClick(Column: TColumn);
begin
  if bPesquisaBancoSQL then
  begin
    if column.FieldName = _gtypPesqCampos.sCampoCodigo then
    begin
      cdsDados.IndexName := 'idCod';
      cmbOrdenar.ItemIndex := 0;
    end
    else if column.FieldName = _gtypPesqCampos.sCampoDescricao then
    begin
      cdsDados.IndexName := 'idDesc';
      cmbOrdenar.ItemIndex := 1;
    end;
    cdsDados.First;
  end
  else
  begin
    if column.FieldName = _gtypPesqCampos.sCampoCodigo then
    begin
      DM.cdsRest.IndexName := 'idCod';
      cmbOrdenar.ItemIndex := 0;
    end
    else if column.FieldName = _gtypPesqCampos.sCampoDescricao then
    begin
      DM.cdsRest.IndexName := 'idDesc';
      cmbOrdenar.ItemIndex := 1;
    end;
    DM.cdsRest.First;
  end;
end;

//-=-=-=-= Procedimento para carregar informações nas variáveis globais
procedure TFormPesquisa.prCarregarVar;
begin
  if bPesquisaBancoSQL then
  begin
    _gtypPesquisa._gstrCodigo := cdsDados.FieldByName(_gtypPesqCampos.sCampoCodigo).AsString;
    _gtypPesquisa._gstrDescricao := cdsDados.FieldByName(_gtypPesqCampos.sCampoDescricao).AsString;
  end
  else
  begin
    _gtypPesquisa._gstrCodigo := DM.cdsRest.FieldByName(_gtypPesqCampos.sCampoCodigo).AsString;
    _gtypPesquisa._gstrDescricao := DM.cdsRest.FieldByName(_gtypPesqCampos.sCampoDescricao).AsString;
  end;
end;

procedure TFormPesquisa.prCriarIndicesPesquisa;
begin
  if bPesquisaBancoSQL then
  begin
    cdsDados.IndexDefs.Clear;
    cdsDados.IndexDefs.Add('idCod', _gtypPesqCampos.sCampoCodigo,[]);
    cdsDados.IndexDefs.Add('idDesc', _gtypPesqCampos.sCampoDescricao,[]);
  end
  else
  begin
    DM.cdsRest.IndexDefs.Clear;
    DM.cdsRest.IndexDefs.Add('idCod', _gtypPesqCampos.sCampoCodigo,[]);
    DM.cdsRest.IndexDefs.Add('idDesc', _gtypPesqCampos.sCampoDescricao,[]);
  end;
end;

procedure TFormPesquisa.cdsDadosAfterOpen(DataSet: TDataSet);
begin
  cdsDados.FieldByName(_gtypPesqCampos.sCampoCodigo).DisplayLabel := 'Código';
  grdPesquisa.Columns[0].FieldName := _gtypPesqCampos.sCampoCodigo;
  grdPesquisa.Columns[0].Alignment := taRightJustify;

  cdsDados.FieldByName(_gtypPesqCampos.sCampoDescricao).DisplayLabel := 'Descrição';
  grdPesquisa.Columns[1].FieldName := _gtypPesqCampos.sCampoDescricao;
  grdPesquisa.Columns[1].Alignment := taLeftJustify;
end;

procedure TFormPesquisa.cmbOrdenarChange(Sender: TObject);
begin
  if bPesquisaBancoSQL then
  begin
    case cmbOrdenar.ItemIndex of
      0: cdsDados.IndexName := 'idCod';
      1: cdsDados.IndexName := 'idDesc';
    end;
    cdsDados.First;
  end
  else
  begin
    case cmbOrdenar.ItemIndex of
      0: DM.cdsRest.IndexName := 'idCod';
      1: DM.cdsRest.IndexName := 'idDesc';
    end;
    DM.cdsRest.First;
  end;
end;

end.
