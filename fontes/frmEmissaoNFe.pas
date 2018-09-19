unit frmEmissaoNFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, fraCliente,

  ACBrBase, ACBrDFe, ACBrNFe, ACBrNFeDANFEClass,
  ACBrDANFCeFortesFr, ACBrNFeDANFeRLClass,
  ACBrNFeNotasFiscais, pcnNFe, pcnConversao, pcnConversaoNFe, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFormEmissaoNFe = class(TForm)
    FrameCliente1: TFrameCliente;
    pnlCabecalho: TPanel;
    pnlTitulo: TPanel;
    pnlBotoes1: TPanel;
    btnGravar: TSpeedButton;
    btnLimpar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    PageControl1: TPageControl;
    tsEmitente: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitRazao: TEdit;
    edtEmitFantasia: TEdit;
    edtEmitFone: TEdit;
    edtEmitCEP: TEdit;
    edtEmitLogradouro: TEdit;
    edtEmitNumero: TEdit;
    edtEmitComp: TEdit;
    edtEmitBairro: TEdit;
    edtEmitCodCidade: TEdit;
    edtEmitCidade: TEdit;
    edtEmitUF: TEdit;
    TabSheet1: TTabSheet;
    Label29: TLabel;
    cbFormaEmissao: TComboBox;
    Label1: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    procedure GerarNFe(NumNFe: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEmissaoNFe: TFormEmissaoNFe;

implementation

{$R *.dfm}

procedure TFormEmissaoNFe.btnGravarClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ACBrNFe1.Configuracoes.Arquivos.PathSalvar;

  if OpenDialog1.Execute then
  begin
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName,False);
    ACBrNFe1.NotasFiscais.Imprimir;
  end;
end;

procedure TFormEmissaoNFe.SpeedButton1Click(Sender: TObject);
var
  vAux : String;
begin
  if not(InputQuery('WebServices Enviar', 'Numero da Nota', vAux)) then
    exit;

  ACBrNFe1.NotasFiscais.Clear;

  GerarNFe(vAux);

  ACBrNFe1.NotasFiscais.Items[0].GravarXML();
  ShowMessage('Arquivo gerado em: '+ACBrNFe1.NotasFiscais.Items[0].NomeArq);
end;

procedure TFormEmissaoNFe.GerarNFe(NumNFe : String);
Var NotaF: NotaFiscal;
    Produto: TDetCollectionItem;
    Servico: TDetCollectionItem;
    Volume: TVolCollectionItem;
    Duplicata: TDupCollectionItem;
    ObsComplementar: TobsContCollectionItem;
    ObsFisco: TobsFiscoCollectionItem;
    Referenciada: TNFrefCollectionItem;
    DI: TDICollectionItem;
    Adicao: TAdiCollectionItem;
    Rastro: TrastroCollectionItem;
    Medicamento: TMedCollectionItem;
    Arma: TArmaCollectionItem;
    Reboque: TreboqueCollectionItem;
    Lacre: TLacresCollectionItem;
    ProcReferenciado: TprocRefCollectionItem;
    InfoPgto: TpagCollectionItem;
begin
  NotaF := ACBrNFe1.NotasFiscais.Add;
  NotaF.NFe.Ide.cNF       := StrToInt(NumNFe); //Caso não seja preenchido será gerado um número aleatório pelo componente
  NotaF.NFe.Ide.natOp     := 'VENDA PRODUCAO DO ESTAB.';
  NotaF.NFe.Ide.indPag    := ipVista;
  NotaF.NFe.Ide.modelo    := 55;
  NotaF.NFe.Ide.serie     := 1;
  NotaF.NFe.Ide.nNF       := StrToInt(NumNFe);
  NotaF.NFe.Ide.dEmi      := Date;
  NotaF.NFe.Ide.dSaiEnt   := Date;
  NotaF.NFe.Ide.hSaiEnt   := Now;
  NotaF.NFe.Ide.tpNF      := tnSaida;
  NotaF.NFe.Ide.tpEmis    := TpcnTipoEmissao(cbFormaEmissao.ItemIndex);;
  NotaF.NFe.Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variável quando for para ambiente de produção
  NotaF.NFe.Ide.verProc   := '1.0.0.0'; //Versão do seu sistema
  NotaF.NFe.Ide.cUF       := UFtoCUF(edtEmitUF.Text);
  NotaF.NFe.Ide.cMunFG    := StrToInt(edtEmitCodCidade.Text);
  NotaF.NFe.Ide.finNFe    := fnNormal;
  if  Assigned( ACBrNFe1.DANFE ) then
    NotaF.NFe.Ide.tpImp     := ACBrNFe1.DANFE.TipoDANFE;

  NotaF.NFe.Emit.CNPJCPF           := edtEmitCNPJ.Text;
  NotaF.NFe.Emit.IE                := edtEmitIE.Text;
  NotaF.NFe.Emit.xNome             := edtEmitRazao.Text;
  NotaF.NFe.Emit.xFant             := edtEmitFantasia.Text;

  NotaF.NFe.Emit.EnderEmit.fone    := edtEmitFone.Text;
  NotaF.NFe.Emit.EnderEmit.CEP     := StrToInt(edtEmitCEP.Text);
  NotaF.NFe.Emit.EnderEmit.xLgr    := edtEmitLogradouro.Text;
  NotaF.NFe.Emit.EnderEmit.nro     := edtEmitNumero.Text;
  NotaF.NFe.Emit.EnderEmit.xCpl    := edtEmitComp.Text;
  NotaF.NFe.Emit.EnderEmit.xBairro := edtEmitBairro.Text;
  NotaF.NFe.Emit.EnderEmit.cMun    := StrToInt(edtEmitCodCidade.Text);
  NotaF.NFe.Emit.EnderEmit.xMun    := edtEmitCidade.Text;
  NotaF.NFe.Emit.EnderEmit.UF      := edtEmitUF.Text;
  NotaF.NFe.Emit.enderEmit.cPais   := 1058;
  NotaF.NFe.Emit.enderEmit.xPais   := 'BRASIL';

  NotaF.NFe.Emit.IEST              := '';
  NotaF.NFe.Emit.IM                := '2648800'; // Preencher no caso de existir serviços na nota
  NotaF.NFe.Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se é permitido
                                // a inclusão de serviços na NFe
  NotaF.NFe.Emit.CRT               := crtRegimeNormal;// (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)

  NotaF.NFe.Dest.CNPJCPF           := '05481336000137';
  NotaF.NFe.Dest.IE                := '687138770110';
  NotaF.NFe.Dest.ISUF              := '';
  NotaF.NFe.Dest.xNome             := 'D.J. COM. E LOCAÇÃO DE SOFTWARES LTDA - ME';

  NotaF.NFe.Dest.EnderDest.Fone    := '1532599600';
  NotaF.NFe.Dest.EnderDest.CEP     := 18270170;
  NotaF.NFe.Dest.EnderDest.xLgr    := 'Rua Coronel Aureliano de Camargo';
  NotaF.NFe.Dest.EnderDest.nro     := '973';
  NotaF.NFe.Dest.EnderDest.xCpl    := '';
  NotaF.NFe.Dest.EnderDest.xBairro := 'Centro';
  NotaF.NFe.Dest.EnderDest.cMun    := 3554003;
  NotaF.NFe.Dest.EnderDest.xMun    := 'Tatui';
  NotaF.NFe.Dest.EnderDest.UF      := 'SP';
  NotaF.NFe.Dest.EnderDest.cPais   := 1058;
  NotaF.NFe.Dest.EnderDest.xPais   := 'BRASIL';

//Adicionando Produtos
  Produto := NotaF.NFe.Det.Add;
  Produto.Prod.nItem    := 1; // Número sequencial, para cada item deve ser incrementado
  Produto.Prod.cProd    := '123456';
  Produto.Prod.cEAN     := '7896523206646';
  Produto.Prod.xProd    := 'TESTE DE PRODUTO';
  Produto.Prod.NCM      := '94051010'; // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
  Produto.Prod.EXTIPI   := '';
  Produto.Prod.CFOP     := '5101';
  Produto.Prod.uCom     := 'UN';
  Produto.Prod.qCom     := 1;
  Produto.Prod.vUnCom   := 100;
  Produto.Prod.vProd    := 100;

  Produto.Prod.cEANTrib  := '7896523206646';
  Produto.Prod.uTrib     := 'UN';
  Produto.Prod.qTrib     := 1;
  Produto.Prod.vUnTrib   := 100;

  Produto.Prod.vOutro    := 0;
  Produto.Prod.vFrete    := 0;
  Produto.Prod.vSeg      := 0;
  Produto.Prod.vDesc     := 0;

  Produto.Prod.CEST := '1111111';

  Produto.infAdProd := 'Informacao Adicional do Produto';
            // lei da transparencia nos impostos
  Produto.Imposto.vTotTrib := 0;
  Produto.Imposto.ICMS.CST          := cst00;
  Produto.Imposto.ICMS.orig    := oeNacional;
  Produto.Imposto.ICMS.modBC   := dbiValorOperacao;
  Produto.Imposto.ICMS.vBC     := 100;
  Produto.Imposto.ICMS.pICMS   := 18;
  Produto.Imposto.ICMS.vICMS   := 18;
  Produto.Imposto.ICMS.modBCST := dbisMargemValorAgregado;
  Produto.Imposto.ICMS.pMVAST  := 0;
  Produto.Imposto.ICMS.pRedBCST:= 0;
  Produto.Imposto.ICMS.vBCST   := 0;
  Produto.Imposto.ICMS.pICMSST := 0;
  Produto.Imposto.ICMS.vICMSST := 0;
  Produto.Imposto.ICMS.pRedBC  := 0;

       // partilha do ICMS e fundo de probreza
  Produto.Imposto.ICMSUFDest.vBCUFDest      := 0.00;
  Produto.Imposto.ICMSUFDest.pFCPUFDest     := 0.00;
  Produto.Imposto.ICMSUFDest.pICMSUFDest    := 0.00;
  Produto.Imposto.ICMSUFDest.pICMSInter     := 0.00;
  Produto.Imposto.ICMSUFDest.pICMSInterPart := 0.00;
  Produto.Imposto.ICMSUFDest.vFCPUFDest     := 0.00;
  Produto.Imposto.ICMSUFDest.vICMSUFDest    := 0.00;
  Produto.Imposto.ICMSUFDest.vICMSUFRemet   := 0.00;

  NotaF.NFe.Total.ICMSTot.vBC     := 100;
  NotaF.NFe.Total.ICMSTot.vICMS   := 18;
  NotaF.NFe.Total.ICMSTot.vBCST   := 0;
  NotaF.NFe.Total.ICMSTot.vST     := 0;
  NotaF.NFe.Total.ICMSTot.vProd   := 100;
  NotaF.NFe.Total.ICMSTot.vFrete  := 0;
  NotaF.NFe.Total.ICMSTot.vSeg    := 0;
  NotaF.NFe.Total.ICMSTot.vDesc   := 0;
  NotaF.NFe.Total.ICMSTot.vII     := 0;
  NotaF.NFe.Total.ICMSTot.vIPI    := 0;
  NotaF.NFe.Total.ICMSTot.vPIS    := 0;
  NotaF.NFe.Total.ICMSTot.vCOFINS := 0;
  NotaF.NFe.Total.ICMSTot.vOutro  := 0;
  NotaF.NFe.Total.ICMSTot.vNF     := 100;

  // lei da transparencia de impostos
  NotaF.NFe.Total.ICMSTot.vTotTrib := 0;

  // partilha do icms e fundo de probreza
  NotaF.NFe.Total.ICMSTot.vFCPUFDest   := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFDest  := 0.00;
  NotaF.NFe.Total.ICMSTot.vICMSUFRemet := 0.00;

  NotaF.NFe.Transp.modFrete := mfContaEmitente;
  NotaF.NFe.Transp.Transporta.CNPJCPF  := '';
  NotaF.NFe.Transp.Transporta.xNome    := '';
  NotaF.NFe.Transp.Transporta.IE       := '';
  NotaF.NFe.Transp.Transporta.xEnder   := '';
  NotaF.NFe.Transp.Transporta.xMun     := '';
  NotaF.NFe.Transp.Transporta.UF       := '';


  NotaF.NFe.Transp.veicTransp.placa := '';
  NotaF.NFe.Transp.veicTransp.UF    := '';
  NotaF.NFe.Transp.veicTransp.RNTC  := '';


  Volume := NotaF.NFe.Transp.Vol.Add;
  Volume.qVol  := 1;
  Volume.esp   := 'Especie';
  Volume.marca := 'Marca';
  Volume.nVol  := 'Numero';
  Volume.pesoL := 100;
  Volume.pesoB := 110;

  NotaF.NFe.Cobr.Fat.nFat  := 'Numero da Fatura';
  NotaF.NFe.Cobr.Fat.vOrig := 100;
  NotaF.NFe.Cobr.Fat.vDesc := 0;
  NotaF.NFe.Cobr.Fat.vLiq  := 100;

  Duplicata := NotaF.NFe.Cobr.Dup.Add;
  Duplicata.nDup  := '1234';
  Duplicata.dVenc := now+10;
  Duplicata.vDup  := 50;

  Duplicata := NotaF.NFe.Cobr.Dup.Add;
  Duplicata.nDup  := '1235';
  Duplicata.dVenc := now+10;
  Duplicata.vDup  := 50;


  NotaF.NFe.InfAdic.infCpl     :=  '';
  NotaF.NFe.InfAdic.infAdFisco :=  '';

  ObsComplementar := NotaF.NFe.InfAdic.obsCont.Add;
  ObsComplementar.xCampo := 'ObsCont';
  ObsComplementar.xTexto := 'Texto';

  ObsFisco := NotaF.NFe.InfAdic.obsFisco.Add;
  ObsFisco.xCampo := 'ObsFisco';
  ObsFisco.xTexto := 'Texto';

  NotaF.NFe.exporta.UFembarq   := '';;
  NotaF.NFe.exporta.xLocEmbarq := '';

  NotaF.NFe.compra.xNEmp := '';
  NotaF.NFe.compra.xPed  := '';
  NotaF.NFe.compra.xCont := '';

// YA. Informações de pagamento

  InfoPgto := NotaF.NFe.pag.Add;
  InfoPgto.indPag := ipVista;
  InfoPgto.tPag   := fpDinheiro;
  InfoPgto.vPag   := 100;

  ACBrNFe1.NotasFiscais.GerarNFe;
end;



end.
