unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, uDM, frxDBSet, Datasnap.Provider,
  Datasnap.DBClient, Vcl.StdCtrls, midaslib;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CadastroCRUD1: TMenuItem;
    Clientes1: TMenuItem;
    EmissoNFE1: TMenuItem;
    Reports1: TMenuItem;
    stbRodape: TStatusBar;
    EmissoNFE2: TMenuItem;
    relNFe: TMenuItem;
    relNFSe: TMenuItem;
    relProdVlMedio: TMenuItem;
    NotaFiscalEletrnicadeServioNFSe1: TMenuItem;
    dbsRelNFe: TfrxDBDataset;
    relServVlMedio: TMenuItem;
    relRankingCli: TMenuItem;
    relRankingProd: TMenuItem;
    relRankingServ: TMenuItem;
    frxReport: TfrxReport;
    qryNFSe: TFDQuery;
    dbsRelNFSe: TfrxDBDataset;
    qryNFSeCLIENTEID: TIntegerField;
    qryNFSeNOMECLIENTE: TStringField;
    qryNFSeESTADO: TIntegerField;
    qryNFSeCIDADE: TIntegerField;
    qryNFSeNOTAFISCALID: TIntegerField;
    qryNFSeDATA: TDateField;
    qryNFSeVALORTOTAL: TBCDField;
    qryNFSeSERVICOID: TIntegerField;
    qryNFSeNOMESERVICO: TStringField;
    qryNFSeQUANTIDADE: TIntegerField;
    qryNFSeVALORUNITARIO: TBCDField;
    qryNFe: TFDQuery;
    qryNFeCLIENTEID: TIntegerField;
    qryNFeNOMECLIENTE: TStringField;
    qryNFeESTADO: TIntegerField;
    qryNFeCIDADE: TIntegerField;
    qryNFeNOTAFISCALID: TIntegerField;
    qryNFeDATA: TDateField;
    qryNFeVALORTOTAL: TBCDField;
    qryNFePRODUTOID: TIntegerField;
    qryNFeNOMEPRODUTO: TStringField;
    qryNFeQUANTIDADE: TIntegerField;
    qryNFeVALORUNITARIO: TBCDField;
    qryRelProdVlMed: TFDQuery;
    dbsRelProdVlMed: TfrxDBDataset;
    qryRelSerVlMed: TFDQuery;
    dbsRelSerVlMed: TfrxDBDataset;
    qryRankCli: TFDQuery;
    dbsRankCli: TfrxDBDataset;
    qryRelProdVlMedDATA: TDateField;
    qryRelProdVlMedPRODUTOID: TIntegerField;
    qryRelProdVlMedNOMEPRODUTO: TStringField;
    qryRelProdVlMedQUANTIDADE: TIntegerField;
    qryRelProdVlMedVALORUNITARIO: TBCDField;
    qryRelProdVlMedVALORTOTAL: TBCDField;
    qryRelSerVlMedDATA: TDateField;
    qryRelSerVlMedSERVICOID: TIntegerField;
    qryRelSerVlMedNOMESERVICO: TStringField;
    qryRelSerVlMedQUANTIDADE: TIntegerField;
    qryRelSerVlMedVALORUNITARIO: TBCDField;
    qryRelSerVlMedVALORTOTAL: TBCDField;
    qryRankCliCLIENTEID: TIntegerField;
    qryRankCliNOMECLIENTE: TStringField;
    qryRankCliVALORTOTAL: TBCDField;
    cdsRankCli: TClientDataSet;
    dspRankCli: TDataSetProvider;
    cdsRankCliCLIENTEID: TIntegerField;
    cdsRankCliNOMECLIENTE: TStringField;
    cdsRankCliVALORTOTAL: TBCDField;
    VendorLibTeste1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EmissoNFE2Click(Sender: TObject);
    procedure relNFeClick(Sender: TObject);
    procedure NotaFiscalEletrnicadeServioNFSe1Click(Sender: TObject);
    procedure relNFSeClick(Sender: TObject);
    procedure relProdVlMedioClick(Sender: TObject);
    procedure relServVlMedioClick(Sender: TObject);
    procedure relRankingCliClick(Sender: TObject);
    procedure VendorLibTeste1Click(Sender: TObject);
  private
    { Private declarations }
    sAux: String;
    procedure Imprimir(sSQL, sUserName, sArqRelatorio: String);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  uFrc, uBiblioteca, uVariaveis,
  frmWeb, FrmClientes, FrmEmissaoNFe;

{$R *.dfm}

procedure TFormPrincipal.EmissoNFE2Click(Sender: TObject);
begin
  _gFormControl.prMostrarFormulario(TFormEmissaoNFe, False);
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(_gFormControl);
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
var i: integer;
begin
  _gFormControl := TFrc.Create(Self, TFormWeb);
  _gFormControl.MostrarMenuPopup := True;
  stbRodape.Panels[0].Text := '  [Caminho ->] '+fnCaminhoBD;
  Caption := '   WORK HERE DELPHI Versão ' + getVersaoExe(Application.ExeName);
  stbRodape.Panels[1].Text := '  [Executável ->] '+fnCaminhoexe+fnNomeExe;
end;

procedure TFormPrincipal.Imprimir(sSQL, sUserName, sArqRelatorio: String);
begin
  {DM.qryAux.Close;
  DM.qryAux.SQL.Text := sSQL;
  DM.qryAux.Open;

  dbsDataSet.UserName := sUserName;
  dbsDataSet.DataSet := DM.qryAux;

  frxReport.Clear;
  frxReport.LoadFromFile(fnCaminhoExe+'report\'+sArqRelatorio);
  frxReport.PrepareReport(true);
  frxReport.Print;  }
end;

procedure TFormPrincipal.NotaFiscalEletrnicadeServioNFSe1Click(Sender: TObject);
begin
  //_gFormControl.prMostrarFormulario(TFormEmissaoNFSe, False);
  ShowMessage('Não implementado - FDS correria...   :( ');
end;

procedure TFormPrincipal.relNFeClick(Sender: TObject);
begin
  {sAux :=
    'select '+
    '  cli.clienteid, cli.nome as NomeCliente, cli.estado, cli.cidade, '+
    '  nf.notafiscalid, nf.data, nf.valortotal, '+
    '  nfp.produtoid, p.nome as NomeProduto, nfp.quantidade, nfp.valorunitario '+
    'from '+
    '  notafiscal nf '+
    '  inner join cliente as cli on (cli.clienteid = nf.clienteid) '+
    '  inner join notafiscalproduto as nfp on (nfp.notafiscalid = nf.notafiscalid) '+
    '  inner join produto as p on (p.produtoid = nfp.produtoid) ';
  Imprimir(sAux, 'dbsRelNFe', 'nfe.fr3'); }
  qryNFe.Close;
  qryNFe.Open;
  frxReport.Clear;
  frxReport.LoadFromFile(fnCaminhoExe+'report\nfe.fr3');
  frxReport.PrepareReport(true);
  frxReport.Print;
end;

procedure TFormPrincipal.relNFSeClick(Sender: TObject);
begin
 { sAux :=
    ' select ' +
    '   cli.clienteid, cli.nome as NomeCliente, cli.estado, cli.cidade, ' +
    '   nf.notafiscalid, nf.data, nf.valortotal,  ' +
    '   nfs.servicoid, s.nome as NomeServico, nfs.quantidade, nfs.valorunitario  ' +
    ' from   ' +
    '  notafiscal nf  ' +
    '   inner join cliente as cli on (cli.clienteid = nf.clienteid) ' +
    '   inner join notafiscalservico as nfs on (nfs.notafiscalid = nf.notafiscalid) ' +
    '   inner join servico as s on (s.servicoid = nfs.servicoid) ' ;
  Imprimir(sAux, 'dbsRelNFSe', 'nfse.fr3');  }

  qryNFSe.Close;
  qryNFSe.Open;
  frxReport.Clear;
  frxReport.LoadFromFile(fnCaminhoExe+'report\nfse.fr3');
  frxReport.PrepareReport(true);
  frxReport.Print;
end;

procedure TFormPrincipal.relProdVlMedioClick(Sender: TObject);
begin
  qryRelProdVlMed.Close;
  qryRelProdVlMed.Open;
  frxReport.Clear;
  frxReport.LoadFromFile(fnCaminhoExe+'report\PRODRELMEDIO.fr3');
  frxReport.PrepareReport(true);
  frxReport.Print;
end;

procedure TFormPrincipal.relRankingCliClick(Sender: TObject);
begin
  cdsRankCli.Close;
  cdsRankCli.Open;
  frxReport.Clear;
  frxReport.LoadFromFile(fnCaminhoExe+'report\RankCli.fr3');
  frxReport.PrepareReport(true);
  frxReport.Print;
end;

procedure TFormPrincipal.relServVlMedioClick(Sender: TObject);
begin
  qryRelSerVlMed.Close;
  qryRelSerVlMed.Open;
  frxReport.Clear;
  frxReport.LoadFromFile(fnCaminhoExe+'report\SERVRELMEDIO.fr3');
  frxReport.PrepareReport(true);
  frxReport.Print;
end;

procedure TFormPrincipal.VendorLibTeste1Click(Sender: TObject);
begin
  showmessage('VendorLib: '+dm.FDPhysFBDriverLink.VendorLib);
  showmessage('BD: '+dm.FDConnection.ConnectionName);
end;

procedure TFormPrincipal.Clientes1Click(Sender: TObject);
begin
  _gFormControl.prMostrarFormulario(TFormClientes, False);
end;

Initialization
	{$IFDEF DEBUG}
	ReportMemoryLeaksOnShutdown := True;
	{$ENDIF}

end.
