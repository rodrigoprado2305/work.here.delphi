unit uVariaveis;

interface

Uses uFrc;

type
  TtypPesquisa = record
    _gstrCodigo: String;
    _gstrDescricao: String;
    _gstrProposta: String;
  end;

  TtypPesqCampos = record
    sCampoCodigo: String;
    sCampoDescricao: String;
    sCampoAtivo: String;
  end;

var
  _gtypPesquisa: TtypPesquisa;
  _gtypPesqCampos: TtypPesqCampos;
  _gstrSQL: String;
  _gintCodUsuario: Integer;
  _gstrNomeUsuario: String;
  _gFormControl: TFrc;

implementation

end.
