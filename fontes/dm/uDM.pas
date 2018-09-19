unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.DBClient;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    qryAux: TFDQuery;
    qryPesq: TFDQuery;
    cdsRest: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure FDPhysFBDriverLinkDriverCreated(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses uBiblioteca, uMsg, Forms, uConst;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Params.Clear;
  FDConnection.Params.Add('drivername=Firebird');
  FDConnection.Params.Add('Database='+fnCaminhoBD);
  FDConnection.Params.Add('DriverID=FB');
  FDConnection.Params.Add('rolename=RoleName');
  FDConnection.Params.Add('User_Name=sysdba');
  FDConnection.Params.Add('password=masterkey');
  //FDConnection.Params.Add('CharacterSet=WIN1252');
  FDConnection.Params.Add('sqldialect=3');
  FDConnection.Params.Add('localecode=0000');
  FDConnection.Params.Add('blobsize=-1');
  FDConnection.Params.Add('commitretain=False');
  FDConnection.Params.Add('waitonlocks=True');
  FDConnection.Params.Add('isolationlevel=ReadCommitted');
  FDConnection.Params.Add('trim char=False');
  FDConnection.Params.Add('Client DLL name = ' + fnCaminhoExe+DLL_BD);

  try
    FDConnection.Connected := True;
  except
    on E:Exception do
    begin
      fnException('Erro ao tentar conectar-se a base de dados. '+#13+
                  'O problema pode estar com um destes arquivos: ['+ARQUIVO_CONFIG+'], '+
                  '['+DLL_BD+']',E);
      Application.Terminate;
    end;
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  cdsRest.Close;
  qryAux.Close;
  qryPesq.Close;
  FDConnection.Close;
end;

procedure TDM.FDPhysFBDriverLinkDriverCreated(Sender: TObject);
begin
	TFDPhysFBDriverLink(Sender).VendorLib := ExtractFilePath(ParamStr(0)) + 'fbclient.dll';
end;

end.
