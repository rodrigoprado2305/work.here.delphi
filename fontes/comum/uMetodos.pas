unit uMetodos;

interface

uses Forms, DB, Datasnap.DBClient;

  //-=-=-=-= Função Global para Efetuar pesquisas por tabelas, totalmente dinâmica
  procedure prCarregarPesquisa(
    _rstrCod, _rstrDescricao, _rstrTabela, _rstrFiltro, _rstrTitulo: String;
    var _rstrCodRetorno, _rstrDescRetorno: String); overload;
  procedure prCarregarPesquisa(sTipoPesq, sTitulo: String; var sCodRetorno, sDescRetorno: String); overload;
  //-=-=-=-=
  Function fnDataHora: TDateTime;

implementation

uses FrmPesquisa, uDM, uVariaveis;

  //-=-=-=-= Função Global para Efetuar pesquisas por tabelas, totalmente dinâmica
procedure prCarregarPesquisa(
    _rstrCod, _rstrDescricao, _rstrTabela,
    _rstrFiltro, _rstrTitulo: String; var _rstrCodRetorno, _rstrDescRetorno: String);
var _rSQL: String;
begin
  _rSQL := ' select '+_rstrCod+', '+_rstrDescricao;
  if (_rstrFiltro = _gstrSQL) then
    _gstrSQL := '';
  _rSQL := _rSQL + ' from '+_rstrTabela + ' where 1=1 '+_rstrFiltro+_gstrSQL;

  dm.qryPesq.Close;
  dm.qryPesq.SQL.Text := _rSQL;
  dm.qryPesq.Open;

  if _rstrFiltro <> '' then
  begin
    _rstrCodRetorno := dm.qryPesq.FieldByName(_rstrCod).AsString;
    _rstrDescRetorno := dm.qryPesq.FieldByName(_rstrDescricao).AsString;
  end
  else
  begin
    Application.CreateForm(TFormPesquisa, FormPesquisa);
    FormPesquisa.dsDados.DataSet := FormPesquisa.cdsDados;
    FormPesquisa.bPesquisaBancoSQL := True;

    _gtypPesqCampos.sCampoCodigo := dm.qryPesq.Fields[0].FieldName;
    _gtypPesqCampos.sCampoDescricao  := dm.qryPesq.Fields[1].FieldName;

    FormPesquisa.Caption := _rstrTitulo;
    FormPesquisa.cdsDados.Close;
    FormPesquisa.cdsDados.Open;
    FormPesquisa.ShowModal;
    if _gtypPesquisa._gstrCodigo <> '' then
    begin
      _rstrCodRetorno := _gtypPesquisa._gstrCodigo;
      _rstrDescRetorno := _gtypPesquisa._gstrDescricao;
    end;
    _gtypPesquisa._gstrCodigo := '';
    _gtypPesquisa._gstrDescricao := '';
  end;
end;

procedure prCarregarPesquisa(sTipoPesq, sTitulo: String; var sCodRetorno, sDescRetorno: String);
begin

  Application.CreateForm(TFormPesquisa, FormPesquisa);
  FormPesquisa.dsDados.DataSet := DM.cdsRest;
  FormPesquisa.bPesquisaBancoSQL := False;

  _gtypPesqCampos.sCampoCodigo := dm.cdsRest.Fields[0].FieldName;
  _gtypPesqCampos.sCampoDescricao  := dm.cdsRest.Fields[1].FieldName;

  FormPesquisa.grdPesquisa.Columns[0].FieldName := _gtypPesqCampos.sCampoCodigo;
  //FormPesquisa.grdPesquisa.Columns[0].Alignment := taRightJustify;
  FormPesquisa.grdPesquisa.Columns[1].FieldName := _gtypPesqCampos.sCampoDescricao;
  //FormPesquisa.grdPesquisa.Columns[1].Alignment := taLeftJustify;

  FormPesquisa.Caption := sTitulo;
  FormPesquisa.ShowModal;
  if _gtypPesquisa._gstrCodigo <> '' then
  begin
    sCodRetorno := _gtypPesquisa._gstrCodigo;
    sDescRetorno := _gtypPesquisa._gstrDescricao;
  end;
  _gtypPesquisa._gstrCodigo := '';
  _gtypPesquisa._gstrDescricao := '';
end;

//-=-=-=-=
function fnDataHora: TDateTime;
begin
  dm.qryAux.Close;
  dm.qryAux.SQL.Text := 'select CURRENT_TIMESTAMP from RDB$DATABASE';
  dm.qryAux.Open;
  Result := dm.qryAux.Fields[0].AsDateTime;
  dm.qryAux.Close;
end;



end.
