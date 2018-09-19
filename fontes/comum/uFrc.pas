unit uFrc;
//-=-=-=-=-=
//Classe FRC = FormControl ou [Formulário de controle]
//Baseado em uma TPageControl
//Data de criação: 09/04/2009
//Programador: Rodrigo Alves de Campos Prado -Rod-
//Objetivo: Criar form como se fossem abas, igual aos navegadores utilizam hoje em dia, suas paginas em abas.

interface

uses ComCtrls, Forms, Messages, Controls, Classes, Menus, Windows;

const
  WM_CLOSE_TAB = WM_USER + 1;

type
  //-=-=-=-= Classe FRC = FormControl ou [Formulário de controle]
  //-=-=-=-= Baseado em uma TPageControl
  TFRC = class(TWinControl)
  private
    FPageControl: TPageControl;
    FFormPadrao: TFormClass;
    FPopup: TPopupMenu;

    procedure prSetMostrarMenuPopup(const Value: Boolean);
    procedure prSetFormPadrao(const Value: TFormClass);
    procedure prOnTabHide(Sender: TObject);
    procedure prMenuFechar(Sender: TObject);
    procedure prMenuFecharTodas(Sender: TObject);
    procedure prMenuAddAba(Sender: TObject);
    procedure prCriarFormulario(Classe: TFormClass);
    procedure prCriarPageControl;
    procedure prOnWm_Close_Tav(var Msg: TMessage); message WM_CLOSE_TAB;

    function fnNovaAba: TTabSheet;
    function fnPagina(aClasseForm: TFormClass): TTabSheet;
    function fnFormulario(Pagina: Integer): TForm;
    function fnGetFormPadrao: TFormClass;
    function fnGetMostrarMenuPopup: Boolean;
    function fnGetPageControl: TPageControl;
  public
    constructor Create(AOwner: TWinControl; aFormPadrao: TFormClass);
    destructor Destroy; override;
    procedure prMostrarFormulario(Classe: TFormClass; Multi: Boolean);
    procedure prFechar(Todas: Boolean);
    function fnRetornaNomeAba: String;
  published
    property MostrarMenuPopup: Boolean read fnGetMostrarMenuPopup write prSetMostrarMenuPopup;
    property PageControl: TPageControl read fnGetPageControl;
    property FormPadrao: TFormClass read fnGetFormPadrao write prSetFormPadrao;
  end;

implementation

uses Math, SysUtils;

const
  INDEX_FORM = 00;

procedure TFRC.prMostrarFormulario(Classe: TFormClass; Multi: Boolean);
begin
  if not Multi then
  begin
    PageControl.ActivePage := fnPagina(Classe);
    if PageControl.ActivePage <> nil then
      Exit;
  end;
  prCriarFormulario(Classe);
end;

constructor TFRC.Create(AOwner: TWinControl; aFormPadrao: TFormClass);
begin
  inherited Create(AOwner);

  Parent       := AOwner;
  ParentWindow := AOwner.Handle;

  if aFormPadrao <> nil then
    FFormPadrao := aFormPadrao;

  prCriarPageControl;
  if FFormPadrao <> nil then
    prMostrarFormulario(FFormPadrao, True);
end;

function TFRC.fnNovaAba: TTabSheet;
var
  _rNovaTab: TTabSheet;
begin
  _rNovaTab := TTabSheet.Create(PageControl);
  _rNovaTab.PageControl := PageControl;
  _rNovaTab.TabVisible  := True;
  _rNovaTab.Caption     := 'Carregando...';
  _rNovaTab.OnHide      := prOnTabHide;
  _rNovaTab.PopupMenu := nil;
  PageControl.ActivePageIndex := _rNovaTab.PageIndex;
  Result := _rNovaTab;
end;

function TFRC.fnPagina(aClasseForm: TFormClass): TTabSheet;
var
  vC: Integer;
begin
  Result := nil;
  vC := 0;

  if PageControl.ActivePage <> nil then
    if fnFormulario(PageControl.ActivePageIndex) is aClasseForm then
      vC := PageControl.ActivePageIndex;

  for vC := vC to PageControl.PageCount - 1 do
    if fnFormulario(vC) is aClasseForm then
    begin
      Result := PageControl.Pages[vC];
      if not (PageControl.ActivePage = Result) then
        Break;
    end;
end;

procedure TFRC.prSetFormPadrao(const Value: TFormClass);
begin
  if FFormPadrao <> Value then
  begin
    prMostrarFormulario(Value, False);
    FFormPadrao := Value;
  end;
end;

function TFRC.fnGetFormPadrao: TFormClass;
begin
  Result := FFormPadrao;
end;

procedure TFRC.prSetMostrarMenuPopup(const Value: Boolean);
  procedure Add_Fechar;
  begin
    FPopup.Items.Add(TMenuItem.Create(FPopup));
    with FPopup.Items[0] do
    begin
      ParentWindow := PageControl.Handle;
      OnClick := prMenuFechar;
      ShortCut := 16499;//CTRL + F4
      Caption := 'Fechar janela';
    end;
  end;

  procedure Add_FecharTodas;
  begin
    FPopup.Items.Add(TMenuItem.Create(FPopup));
    with FPopup.Items[1] do
    begin
      ParentWindow := PageControl.Handle;
      OnClick := prMenuFecharTodas;
      Caption := 'Fechar todas as janelas';
    end;
  end;

  procedure Add_Aba;
  begin
    FPopup.Items.Add(TMenuItem.Create(FPopup));
    with FPopup.Items[2] do
    begin
      ParentWindow := PageControl.Handle;
      OnClick := prMenuAddAba;
      Caption := 'Adicionar Formulário em Favoritos';
      Visible := False;
    end;
  end;
begin
  if Value then
  begin
    if not Assigned(FPopup) then
    begin
      FPopup := TPopupMenu.Create(PageControl);
      FPopup.Name := 'pop';
      Add_Fechar;
      Add_FecharTodas;
      Add_Aba;
    end;

    PageControl.PopupMenu := FPopup;
  end
  else
    PageControl.PopupMenu := nil
end;

function TFRC.fnGetMostrarMenuPopup: Boolean;
begin
  Result := Assigned(PageControl.PopupMenu);
end;

procedure TFRC.prFechar(Todas: Boolean);
var
  vC: Integer;
begin
  if PageControl.ActivePageIndex = -1 then
    Exit;
  case Todas of
    True:
    begin
      for vC := PageControl.PageCount - 1 downto 0 do
        PostMessage(Self.Handle, WM_CLOSE_TAB, vC, 0);
    end;
    False: PostMessage(Self.Handle, WM_CLOSE_TAB, PageControl.ActivePageIndex, 0);
  end;
end;

function TFRC.fnFormulario(Pagina: Integer): TForm;
begin
  Result := nil;
  with PageControl.Pages[Pagina] do
    if ComponentCount > 0 then
      if Components[INDEX_FORM] is TForm then
        Result := TForm(Components[INDEX_FORM]);
end;

procedure TFRC.prOnTabHide(Sender: TObject);
begin
  if PageControl.PageCount = 0 then
    PageControl.Visible := False;
  if (FormPadrao <> nil) and (PageControl.PageCount = 1) then
  begin
    prMostrarFormulario(FormPadrao, False);
    PageControl.ActivePage := fnPagina(FormPadrao);
  end;
end;

procedure TFRC.prOnWm_Close_Tav(var Msg: TMessage);
begin
  if fnFormulario(Msg.WParam) <> nil then
  begin
    with fnFormulario(Msg.WParam) do
    begin
      Close;

      if CloseQuery then
        Free;
    end;

    if fnFormulario(Msg.WParam) = nil then
    begin
      PageControl.ActivePage := NIL;
      PageControl.Pages[Msg.WParam].Free;
    end;
  end;
end;

procedure TFRC.prMenuFechar(Sender: TObject);
begin
  prFechar(False);
end;

procedure TFRC.prMenuFecharTodas(Sender: TObject);
begin
  prFechar(True);
end;

procedure TFRC.prCriarFormulario(Classe: TFormClass);
begin
  with TFormClass(Classe).Create(fnNovaAba) do
  begin
    Align       := alClient;
    BorderStyle := bsNone;
    Parent      := PageControl.ActivePage;
    PageControl.ActivePage.OnEnter := OnActivate;
    PageControl.ActivePage.Caption := Caption;
    Show;
  end;
end;

procedure TFRC.prCriarPageControl;
begin
  FPageControl := TPageControl.Create(Self.Parent);
  with PageControl do
  begin
    Align        := alClient;
    Parent       := Self.Parent;
    ParentWindow := Self.Parent.Handle;
  end;
end;

function TFRC.fnGetPageControl: TPageControl;
begin
  Result := FPageControl;
end;

destructor TFRC.Destroy;
begin
  try
    try
      prFechar(True);
    finally
      FPageControl.Free;
    end;
  except
    { TODO : ACABAR ESTA EXCEÇÃO ACOTECE SEMPRE QUE A APLICAÇÃO É FECHADA }
    //-=-=-=-= Erro ao liberar memória da classe uFRC
  end;
  inherited;
end;

procedure TFRC.prMenuAddAba(Sender: TObject);
begin
  if PageControl.ActivePageIndex = -1 then
    Exit;
end;

function TFRC.fnRetornaNomeAba: String;
begin
  result := PageControl.ActivePage.Caption;
end;

end.


