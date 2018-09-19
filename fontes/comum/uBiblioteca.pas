unit uBiblioteca;

interface

uses
  Windows, SysUtils, Forms, IniFiles;


  function getVersaoExe(sNomeArq: String): String;
  Function fnCaminhoExe: String;
  Function fnNomeExe: String;
  Function fnCaminhoBD: String;
  function fnDigitarNum(_rstrKey: Char): Boolean;

implementation

Uses uMsg, uConst;

function getVersaoExe(sNomeArq: String): String;
type 
  PFFI = ^vs_FixedFileInfo;
var
  F : PFFI;
  Handle : Dword;
  Len : Longint;
  Data : Pchar;
  Buffer : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;
  Arquivo : String;
begin
  Arquivo := sNomeArq;//Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
    begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d',
      [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs),
      HiWord(F^.dwFileVersionLs),
      Loword(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function fnCaminhoExe: String;
begin
   result := ExtractFilePath(Application.ExeName);
end;

function fnNomeExe: String;
begin
   result := ExtractFileName(Application.ExeName);
end;

function fnCaminhoBD: String;
var
   sDir: String;
   IniFile  : TiniFile;
begin
  sDir := fnCaminhoExe;
  try
    IniFile := TIniFile.Create(sDir + ARQUIVO_CONFIG);
    result := IniFile.ReadString('Firebird', 'Caminho', '');
  finally
    IniFile.Free;
  end;
  //D:\Desenvolvimento\Prova Delphi\nfeExemplo\BD
  //result := ''fnCaminhoExe + 'BD\AZDATABASE.FDB';
end;

function fnDigitarNum(_rstrKey: Char): Boolean;
begin                //#8 Backspace
  result := False;
  if not (_rstrKey in ['0'..'9', #8, #13, #27]) then
    result := True;
end;

end.
