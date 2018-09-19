program prjNFE;

uses
  Vcl.Forms,
  frmPrincipal in 'fontes\frmPrincipal.pas' {FormPrincipal},
  frmClientes in 'fontes\frmClientes.pas' {FormClientes},
  frmWeb in 'fontes\frmWeb.pas' {FormWeb},
  uDM in 'fontes\dm\uDM.pas' {DM: TDataModule},
  uBiblioteca in 'fontes\comum\uBiblioteca.pas',
  uConst in 'fontes\comum\uConst.pas',
  uFrc in 'fontes\comum\uFrc.pas',
  uMsg in 'fontes\comum\uMsg.pas',
  uVariaveis in 'fontes\comum\uVariaveis.pas',
  uMetodos in 'fontes\comum\uMetodos.pas',
  FrmPesquisa in 'fontes\FrmPesquisa.pas' {FormPesquisa},
  frmEmissaoNFe in 'fontes\frmEmissaoNFe.pas' {FormEmissaoNFe},
  fraCliente in 'fontes\frame\fraCliente.pas' {FrameCliente: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
