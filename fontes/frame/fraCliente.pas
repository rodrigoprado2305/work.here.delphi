unit fraCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrameCliente = class(TFrame)
    btnPesqCliente: TSpeedButton;
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    procedure btnPesqClienteClick(Sender: TObject);
  private
    { Private declarations }
    procedure prCarregar(_rstrAux: String; sTipoPesq: String);
  public
    { Public declarations }
    procedure prLimpar;
  end;

implementation

uses uVariaveis, uMetodos, uMsg, uBiblioteca;

{$R *.dfm}

procedure TFrameCliente.btnPesqClienteClick(Sender: TObject);
begin
  prcarregar('', '');
end;

procedure TFrameCliente.prCarregar(_rstrAux: String; sTipoPesq: String);
var
  _rstrCod, _rstrDesc: string; //-=-=-=-= Retorna o valor pelo VAR na função
  _rbolAtivo: Boolean;
begin
  _gstrSQL := '';
  if _rstrAux <> '' then
    _gstrSQL := ' AND clienteid = ' + QuotedStr(_rstrAux);
  prCarregarPesquisa('clienteid', 'nome', 'cliente', _gstrSQL,
    'Pesquisa de Clientes',_rstrCod, _rstrDesc);
  edtCodigo.Text := _rstrCod;
  edtNome.Text := _rstrDesc;
end;

procedure TFrameCliente.prLimpar;
begin
  edtCodigo.Clear;
  edtNome.Clear;
end;

end.
