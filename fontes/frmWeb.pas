unit frmWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw, Vcl.Imaging.jpeg,
  Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TFormWeb = class(TForm)
    pgcWeb: TPageControl;
    TabSheet1: TTabSheet;
    Net: TTabSheet;
    WebBrowser1: TWebBrowser;
    pnlCabecalho: TPanel;
    pnlImg: TPanel;
    pnlNavegacao: TPanel;
    imgHome: TImage;
    shpSelecao: TShape;
    imgVoltar: TImage;
    imgAvancar: TImage;
    imgRefresh: TImage;
    pnEndereco: TPanel;
    cmbEndereco: TComboBox;
    ImgParar: TImage;
    imgAcessar: TImage;
    Image1: TImage;
    Label1: TLabel;
    procedure cmbEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure imgHomeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgRefreshClick(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure ImgPararClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgAvancarClick(Sender: TObject);
    procedure imgAcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWeb: TFormWeb;

implementation

{$R *.dfm}

procedure TFormWeb.cmbEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    imgAcessarClick(Sender);
end;

procedure TFormWeb.FormShow(Sender: TObject);
begin
  PopupMenu := Nil;
  pgcWeb.PopupMenu := Nil;
  {imgAcessarClick(Sender); }
end;

procedure TFormWeb.imgAcessarClick(Sender: TObject);
begin
  Try
    WebBrowser1.Navigate(cmbEndereco.Text);
    pgcWeb.ActivePageIndex := 1;
  Except
    Application.MessageBox('Erro ao Atualizar Página! Ação cancelada!','MST',MB_ICONERROR);
  End;
end;

procedure TFormWeb.imgAvancarClick(Sender: TObject);
begin
  Try
    webbrowser1.GoForward;
  Except
    Application.MessageBox('Erro ao avançar para a próxima página em cache! Ação cancelada!','MST',MB_ICONERROR);
  End;
end;

procedure TFormWeb.imgHomeClick(Sender: TObject);
begin
  Try
    WebBrowser1.Navigate('www.google.com');
  Except
    Application.MessageBox('Erro ao acessar a página inicial! Ação cancelada!','MST',MB_ICONERROR);
  End;
end;

procedure TFormWeb.imgHomeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  shpSelecao.Top := TImage(Sender).Top-3;
  shpSelecao.Left := TImage(Sender).Left-3;
  shpSelecao.Parent := TImage(Sender).Parent;
  shpSelecao.SendToBack;
end;

procedure TFormWeb.ImgPararClick(Sender: TObject);
begin
  Try
    webbrowser1.Stop;
  Except
    Application.MessageBox('Erro ao parar o carregamento da página! Ação cancelada!','MST',MB_ICONERROR);
  End;
end;

procedure TFormWeb.imgRefreshClick(Sender: TObject);
begin
  Try
    webbrowser1.Refresh;
  Except
    Application.MessageBox('Erro ao atualizar página! Ação cancelada!','MST',MB_ICONERROR);
  End;
end;

procedure TFormWeb.imgVoltarClick(Sender: TObject);
begin
  Try
    webbrowser1.goback;
  Except
    Application.MessageBox('Erro ao voltar para a página anterior em cache! Ação cancelada!','MST',MB_ICONERROR);
  End;
end;

end.
