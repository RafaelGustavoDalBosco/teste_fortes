{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Log;

interface

uses
   System.SysUtils,
   System.Classes;

type

   TWriterLog = class sealed (TObject)
   protected
      /// <summary>
      ///    Obtém o nome do arquivo de LOG
      /// </summary>
      function GetLogName: UnicodeString;

      /// <summary>
      ///    Obtém o mês que será criado a pasta para o LOG
      /// </summary>
      function GetMonthDirectory(const ADirectory: UnicodeString): UnicodeString;

      /// <summary>
      ///    Monta o texto da mensagem de LOG
      /// </summary>
      function BuildLogMessage(const AUnitName, ATitle, AText: UnicodeString; const AInfo: UnicodeString = ''): UnicodeString;

      /// <summary>
      ///    Cria o fim da linha da mensagem de log
      /// </summary>
      function EndMessageString: UnicodeString;
   private
      FWriter: TStringList;
   public
      /// <summary>
      ///    Procedimento responsável por persistir o LOG
      /// </summary>
      procedure Write(const AUnitName, ATitle: UnicodeString; const AText: UnicodeString = ''; const AInfo: UnicodeString = '');

      /// <summary>
      ///    Obtém o caminho do arquivo de LOG
      /// </summary>
      function GetLogPath: UnicodeString;

      /// <summary>
      ///    Obtém a instância do objeto TWriterLog
      /// </summary>
      class function GetInstance: TWriterLog;

      /// <summary>
      ///    Cria a instância do objeto TWriterLog
      /// </summary>
      class function NewInstance: TObject; override;

      constructor Create;
      destructor Destroy; override;
   end;


   /// <summary>
   ///   Função que retorna a instância atual do TWriterLog
   /// </summary>
   function Log: TWriterLog;

   /// <summary>
   ///    Função responsável por liberar a instância do objeto TWriterLog
   /// </summary>
   function FreeLog: Boolean;

var
   FWriterLog: TWriterLog;

implementation

uses
   App.Common.Utils, App.System.Vars, App.Consts.Common;


function Log: TWriterLog;
begin
   Result := TWriterLog.GetInstance;
end;

function FreeLog: Boolean;
begin
   FreeAndNil(FWriterLog);
   Result := True;
end;

function TWriterLog.BuildLogMessage(const AUnitName, ATitle, AText: UnicodeString; const AInfo: UnicodeString): UnicodeString;
var
   LUserAlias: UnicodeString;
   LStringBuilder: TStringBuilder;
begin
   LStringBuilder := TStringBuilder.Create;
   try
      LStringBuilder.Append('[HORA] ' + TimeToStr(Now)).AppendLine;
      LStringBuilder.Append('[UNIT] ' + AUnitName).AppendLine;
      LStringBuilder.Append('[TITL] ' + ATitle).AppendLine;

      if (not AText.IsEmpty) then
         LStringBuilder.Append('[TEXT] ' + AText).AppendLine;

      if (not AInfo.IsEmpty) then
         LStringBuilder.Append('[INFO] ' + AInfo).AppendLine;

      if (not LUserAlias.IsEmpty) then
         LStringBuilder.Append('[USER] ' + LUserAlias).AppendLine;

      LStringBuilder.Append(EndMessageString);
   finally
      Result := LStringBuilder.ToString;
      FreeAndNil(LStringBuilder);
   end;
end;

constructor TWriterLog.Create;
begin
   if (not Assigned(FWriter)) then
      FWriter := TStringList.Create;

   if FileExists(GetLogPath) then
      FWriter.LoadFromFile(GetLogPath);
end;

destructor TWriterLog.Destroy;
begin
   FreeAndNil(FWriter);
   inherited;
end;

function TWriterLog.EndMessageString: UnicodeString;
begin
   Result := '[' + StringOfChar('=', 150) + ']';
end;

function TWriterLog.GetLogName: UnicodeString;
var
   D, M, Y: Word;
   Data: String;
begin
   DecodeDate(Now, Y, M, D);

   Data := FormatDateTime('dd-mm-yyyy', Now);

   Result := '\LogText-' + Data + '.log';
end;

function TWriterLog.GetLogPath: UnicodeString;
var
   LDirectory: UnicodeString;
   LMonthDirectory: UnicodeString;
begin
   LDirectory := DirectoryLog + '\';
   LMonthDirectory := GetMonthDirectory(LDirectory);

   SysFile.CreateFolder(LMonthDirectory);

   Result := LMonthDirectory + GetLogName;
end;

function TWriterLog.GetMonthDirectory(const ADirectory: UnicodeString): UnicodeString;
var
   D, M, Y: Word;
begin
   DecodeDate(Now, Y, M, D);

   Result := ADirectory + FormatDateTime('mm-yyyy', Now);
end;

class function TWriterLog.NewInstance: TObject;
begin
   if not Assigned(FWriterLog) then
    FWriterLog := TWriterLog(inherited NewInstance);

   Result := FWriterLog;
end;

class function TWriterLog.GetInstance: TWriterLog;
begin
   Result := TWriterLog.Create;
end;

procedure TWriterLog.Write(const AUnitName, ATitle, AText: UnicodeString; const AInfo: UnicodeString);
begin
   FWriter.Add(BuildLogMessage(AUnitName, ATitle, AText, AInfo));
   FWriter.SaveToFile(GetLogPath);
end;

initialization
   AddTerminateProc(FreeLog);
end.
