{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Engine;

interface

uses
   App.Common.Utils, System.SysUtils, App.System.Connection.Params,
   App.System.Connection, App.Consts.Common, App.System.Vars, App.System.Log,
   App.System.Engine.DataBase, App.Consts.Messages;

type

   TSystemEngine = class
   private
      /// <summary>
      ///    Obtém a SQL que cria o banco de dados do FireBird
      /// </summary>
      function GetSQLCreateDataBaseFireBird(const ADataBasePath: UnicodeString): UnicodeString;

      /// <summary>
      ///    Obtém os parâmetros do FireBird
      /// </summary>
      function GetParamsFireBird(const ADataBasePath, AServerPath: UnicodeString): TConnectionParams;

      /// <summary>
      ///    Cria o banco de dados do FB
      /// </summary>
      procedure CreateDataBaseFirebird(const ADataBasePath: UnicodeString);

      /// <summary>
      ///    Cria os diretórios da aplicação
      /// </summary>
      procedure CreateDirectorys;

      /// <summary>
      ///    Cria a estrutura do banco de dados
      /// </summary>
      procedure CreateStructureDataBase;
   public
      /// <summary>
      ///    Inicia a aplicação
      /// </summary>
      function StartApplication: Boolean;

      /// <summary>
      ///    Inicia a conexão da aplicação
      /// </summary>
      procedure StartConnection;
   end;

implementation

{ TSystemEngine }

procedure TSystemEngine.CreateDataBaseFirebird(const ADataBasePath: UnicodeString);
var
   LSQL: UnicodeString;
begin
   LSQL := GetSQLCreateDataBaseFireBird(ADataBasePath);

   gvApplicationConnection.IncludeParamsOnConnection(False);
   gvApplicationConnection.ExecuteScript(LSQL);
   gvApplicationConnection.IncludeParamsOnConnection(True);
   Log.Write(UnitName, SActionDataBase, 'Banco do Firebird criado no caminho ' + ADataBasePath);
end;

procedure TSystemEngine.CreateDirectorys;
begin
   SysFile.CreateFolder(DirectoryApplication);
   SysFile.CreateFolder(DirectorySystem);
   SysFile.CreateFolder(DirectoryDataBase);
   SysFile.CreateFolder(DirectoryLog);
end;

procedure TSystemEngine.CreateStructureDataBase;
var
   LEngine: TSystemEngineDataBase;
begin
   LEngine := TSystemEngineDataBase.Create;
   try
      LEngine.Execute;
   finally
      FreeAndNil(LEngine);
   end;
end;

function TSystemEngine.GetParamsFireBird(const ADataBasePath, AServerPath: UnicodeString): TConnectionParams;
begin
   Result := TConnectionParams.Create;
   Result.DriverName := FBDriverName;
   Result.LoginPrompt := False;
   Result.CharacterSet := FBCharacterSet;
   Result.UserName := FBUserName;
   Result.PassWord := FBPassWord;
   Result.Port := FBPort;
   Result.ServerPath := AServerPath;
   Result.DataBasePath := ADataBasePath;
end;

function TSystemEngine.GetSQLCreateDataBaseFireBird(const ADataBasePath: UnicodeString): UnicodeString;
begin
   Result := 'CREATE DATABASE ' + QuotedStr(ADataBasePath) + sLineBreak +
             'USER ''SYSDBA'' PASSWORD ''masterkey''' + sLineBreak +
             'PAGE_SIZE 16384' + sLineBreak +
             'DEFAULT CHARACTER SET WIN1252 NOT NULL COLLATE WIN_PTBR';
end;

function TSystemEngine.StartApplication: Boolean;
begin
   CreateDirectorys;
   StartConnection;
   Result := True;
end;

procedure TSystemEngine.StartConnection;
var
   LServer, LDataBasePath: UnicodeString;
   LParams: TConnectionParams;
   LCreatedDataBase: Boolean;
begin
   LCreatedDataBase := False;
   LDataBasePath := SysIni.ReadDataBasePath;
   LServer := SysIni.ReadServer;

   if (LDataBasePath.IsEmpty) then
      LDataBasePath := DirectoryDataBase + '\FORTES.FDB';

   if (LServer.IsEmpty) then
      LServer := '127.0.0.1';

   LParams := GetParamsFireBird(LDataBasePath, LServer);

   gvApplicationConnection := TConnection.Create(LParams);

   if gvApplicationConnection.DataBaseExists then
      gvApplicationConnection.IncludeParamsOnConnection(True)
   else
   begin
      CreateDataBaseFirebird(LDataBasePath);
      LCreatedDataBase := True;
   end;

   if LCreatedDataBase then
      CreateStructureDataBase;

   if gvApplicationConnection.TryStablishConnection then
   begin
      SysIni.WriteServer(LServer);
      SysIni.WriteDataBasePath(LDataBasePath);
   end;
end;

end.
