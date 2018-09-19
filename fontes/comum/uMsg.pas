//-=-=-=-=-=
//Data de cria��o: 27/06/2008
//Programador: Rodrigo Prado -Rod-
//Fun��o: Unidade criada para Padronizar as mensagens do sistema e centralizalas em um s� local.
//-=-=-=-=-=

unit uMsg;

interface

uses SysUtils, Forms, Windows;

Type
  TTipoMsg =
    (
      //-=-=-=-=-= CAMPOS OBRIGAT�RIOS
      msgCampoObrigatorio, msgCamposObrigatorios, msgValorCampoIncorreto,
      msgCampoInvalido,
      //-=-=-=-=-= GERAL
      msgDadosAtualizados, msgGravar, msgExcluir, msgExcluido, msgRegEdicaoInsercao,
      msgNenhumRegSelecionado, msgRegJaSelecionado, msgDataInvalida, msgDataInicialMaior,
      msgNenhumRegEncontrado,  msgArqExportado, msgArqImportado, msgArqCarregado,
      msgArqGerado, msgDadosProcessados, msgCancelar, msgOperacaoSucesso, msgConfirmaOperacao, msgFinaldoArquivo,
      //-=-=-=-=-= BOLETOS/CHEQUE
      msgBoletoPago, msgChequePago, msgTitulosBaixados, msgErroBaixa, msgBaixarTitSelecionado,
      msgDupProposta, msgEmiteProposta,
      //-=-=-=-=-= Erro em msg
      msgErroCustomizado
    );
  //-=-=-=-=-= Fun��es de retorno para o tipo de mensagem escolhida
  function fnMsg(_rTipoMsg: TTipoMsg; _rstrCampo: String): Boolean;  overload;
  function fnMsg(_rTipoMsg: TTipoMsg): Boolean; overload;
  //-=-=-=-=-= Fun��o que retorna o Except de erro quando ocorrer.
  function fnException(_rstrTipo: String; E: Exception) : Boolean;

resourcestring
  msgErroIncluir = 'Erro ao tentar inserir o registro:';
  msgErroEditar = 'Erro ao tentar editar o registro:';
  msgErroExcluir = 'Erro ao tentar excluir o registro:';
  msgErroGravar = 'Erro ao tentar gravar o registro:';
  msgErroExportar = 'Erro ao exportar dados:';
  msgErroImportar = 'Erro ao importar dados:';
  msgErroCarregarArq = 'Erro ao carregar arquivo(s): ';
  msgErroGerarArq = 'Erro ao gerar arquivo(s):';
  msgErroProcessar = 'Erro ao processar dados:';
  msgErroSelecionar = 'Erro ao tentar selecionar o registro:';
  msgErroPesq = 'Erro ao tentar executar a pesquisa:';
  msgErroExecutarAcao = 'Erro ao tentar executar a a��o:';
  msgErroGerarRelatorio = 'Erro ao tentar gerar relat�rio:';
  msgErroCarregarDados = 'Erro ao carregar dados:';

implementation

//-=-=-=-=-= Fun��o de retorno para o tipo de mensagem escolhida
function fnMsg(_rTipoMsg: TTipoMsg; _rstrCampo: String): Boolean;
begin
  Result := False;
  if (msgCampoObrigatorio = _rTipoMsg) then
    Application.MessageBox(pchar('O Campo "'+_rstrCampo+'" � obrigat�rio! A��o cancelada!'),'Work here delphi', MB_ICONWARNING);

  if (msgCamposObrigatorios = _rTipoMsg) then
    Application.MessageBox(pchar('Pelo menos um desses campos "'+_rstrCampo+'" � de preenchimento obrigat�rio!'),'Work here delphi', MB_ICONWARNING);

  if (msgValorCampoIncorreto = _rTipoMsg) then
    Application.MessageBox(pchar('O valor digitado para o campo "'+_rstrCampo+'" est� incorreto! A��o cancelada!'),'Work here delphi', MB_ICONWARNING);

  //-=-=-=-=-= Ex: "Cliente" n�o cadastrado!
  if (msgCampoInvalido = _rTipoMsg) then
    Application.MessageBox(pchar('Campo "'+_rstrCampo+'" inv�lido!'),'Work here delphi',MB_ICONWARNING);

  //-=-=-=-= Erros
  if (msgErroCustomizado = _rTipoMsg) then
    Application.MessageBox(pchar('Erro: '+_rstrCampo),'Work here delphi',MB_ICONERROR);
end;

//-=-=-=-=-= Rodrigo 27/06/2008
//-=-=-=-=-= Fun��es de retorno para o tipo de mensagem escolhida
function fnMsg(_rTipoMsg: TTipoMsg): Boolean;
begin
  Result := False;
  if (msgDadosAtualizados = _rTipoMsg) then
    Application.MessageBox('Dados atualizados com sucesso!','Work here delphi',MB_ICONINFORMATION);

  if (msgGravar = _rTipoMsg) then
    Application.MessageBox('Dados salvos corretamente!','Work here delphi',MB_ICONINFORMATION);

  //-=-=-=-=-= Excluir Registro
  if _rTipoMsg = msgExcluir then
    if Application.MessageBox('Deseja realmente excluir este registro?', 'Work here delphi', MB_YESNO+MB_ICONQUESTION) = IDYes then
      Result := True
    else
      Result := False;

  if _rTipoMsg = msgDupProposta then
    if Application.MessageBox('Deseja realmente duplicatar est� proposta?', 'Work here delphi', MB_YESNO+MB_ICONQUESTION) = IDYes then
      Result := True
    else
      Result := False;

  if _rTipoMsg = msgEmiteProposta then
    if Application.MessageBox('Deseja realmente emitir Nota Fiscal para esta proposta?', 'Work here delphi', MB_YESNO+MB_ICONQUESTION) = IDYes then
      Result := True
    else
      Result := False;

  if (msgExcluido = _rTipoMsg) then
    Application.MessageBox('Registro exclu�do com sucesso!','Work here delphi',MB_ICONINFORMATION);

  if (msgRegEdicaoInsercao = _rTipoMsg) then
    Application.MessageBox('Existem dados sendo inseridos ou editados! Grave ou cancele a a��o antes de sair!','Work here delphi',MB_ICONEXCLAMATION);

  if (msgNenhumRegSelecionado = _rTipoMsg) then
    Application.MessageBox('Nenhum registro selecionado!', 'Work here delphi', MB_ICONWARNING);

  if (msgRegJaSelecionado = _rTipoMsg) then
    Application.MessageBox('Registro j� selecionado!', 'Work here delphi', MB_ICONWARNING);

  if (msgDataInvalida = _rTipoMsg) then
    Application.MessageBox('Data Inv�lida! A��o cancelada!', 'Work here delphi', MB_ICONERROR);

  if (msgDataInicialMaior = _rTipoMsg) then
    Application.MessageBox('Data inicial maior que a data final! A��o cancelada!', 'Work here delphi', MB_ICONWARNING);

  if (msgNenhumRegEncontrado = _rTipoMsg) then
    Application.MessageBox('Nenhum registro encontrado!', 'Work here delphi', MB_ICONINFORMATION);

  if (msgArqExportado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) exportado(s) com sucesso!', 'Work here delphi', MB_ICONINFORMATION);

  if (msgArqImportado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) importado(s) com sucesso!', 'Work here delphi', MB_ICONINFORMATION);

  if (msgArqCarregado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) carregado(s) com sucesso!', 'Work here delphi', MB_ICONINFORMATION);

  if (msgArqGerado = _rTipoMsg) then
    Application.MessageBox('Arquivo(s) gerado(s) com sucesso!', 'Work here delphi', MB_ICONINFORMATION);

  if (msgDadosProcessados = _rTipoMsg) then
    Application.MessageBox('Dados processados com sucesso!', 'Work here delphi', MB_ICONINFORMATION);

  //-=-=-=-=-= Cancelar a Inser��o ou Edi��o de um registro
  if _rTipoMsg = msgCancelar then
    if Application.MessageBox('Cancelar a inser��o/edi��o do registro!', 'Work here delphi', MB_YESNO + MB_ICONQUESTION) = IDYES then
      Result := True
    else
      Result := False;

  if (msgOperacaoSucesso = _rTipoMsg) then
    Application.MessageBox('Opera��o conclu�da com sucesso!','Work here delphi',MB_ICONINFORMATION);

  if (msgConfirmaOperacao = _rTipoMsg) then
    if Application.MessageBox('Confirma esta opera��o?', 'Work here delphi', MB_YESNO + MB_ICONQUESTION) = IDYES then
      Result := True
    else
      Result := False;

  if (msgFinaldoArquivo = _rTipoMsg) then
    Application.MessageBox('N�o h� mais nenhum registro para ser movimentado! A��o cancelada!', 'Work here delphi', MB_ICONINFORMATION);

  //-=-=-=-=-= BOLETOS/CHEQUE
  if (msgBoletoPago = _rTipoMsg) then
    Application.MessageBox('Boleto j� pago! A��o cancelada!','Work here delphi',MB_ICONINFORMATION);

  if (msgChequePago = _rTipoMsg) then
    Application.MessageBox('Cheque j� pago! A��o cancelada!','Work here delphi',MB_ICONINFORMATION);

  if (msgTitulosBaixados = _rTipoMsg) then
    Application.MessageBox('T�tulo(s) baixado(s) com sucesso!','Work here delphi',MB_ICONINFORMATION);

  if (msgErroBaixa = _rTipoMsg) then
    Application.MessageBox('Erro na(s) baixa(s) do(s) t�tulo(s)! A��o cancelada!','Work here delphi',MB_ICONINFORMATION);

  if (msgBaixarTitSelecionado = _rTipoMsg) then
    if Application.MessageBox('Tem certeza que deseja excluir  selecionados?', 'Work here delphi', MB_YESNO + MB_ICONQUESTION) = IDYES then
      Result := True
    else
      Result := False;
end;

//-=-=-=-=-= Fun��o que retorna o Exception de erro quando ocorrer
function  fnException(_rstrTipo: String; E: Exception) : Boolean;
begin
  Application.MessageBox(PChar(_rstrTipo + #13#10 + E.Message), 'Work here delphi', MB_ICONERROR);
  Result := False;
end;

end.
