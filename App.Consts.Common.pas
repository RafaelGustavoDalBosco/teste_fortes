{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Consts.Common;

interface

uses
   Vcl.Graphics;

const

{$REGION '| DIRECTORYS |'}
   /// <summary>
   ///    Diretório Padrão do Sistema
   /// </summary>
   DirectoryApplication = 'C:\Fortes';

   /// <summary>
   ///    Pasta SYSTEM da aplicação
   ///    System.ini, etc...
   /// </summary>
   DirectorySystem = DirectoryApplication + '\System';

   /// <summary>
   ///    Pasta DATABASE
   /// </summary>
   DirectoryDataBase = DirectorySystem + '\DataBase';

   /// <summary>
   ///    Pasta de LOG da aplicação
   /// </summary>
   DirectoryLog = DirectoryApplication + '\Log';

{$ENDREGION}

{$REGION '| INI FIELDS |'}
   /// <summary>
   ///    Caminho do arquivo .ini da aplicação
   /// </summary>
   IniPath = DirectorySystem + '\ApplicationSystem.ini';

   /// <summary>
   ///    SECTOR = SYSTEM
   /// </summary>
   IniSectorSystem = 'SYSTEM';

   /// <summary>
   ///    SECTOR = SYSTEM
   ///    ROW = DATABASE
   /// </summary>
   IniRowDataBasePath = 'data_base_path';

   /// <summary>
   ///    SECTOR = SYSTEM
   ///    ROW = SERVER
   /// </summary>
   IniRowServer = 'server';
{$ENDREGION}

{$REGION '| DEFAULTS |'}
   DefaultMainColor = $00FF8000;
   DefaultTitleColor = clBlack;
   DefaultColumnColor = clWhite;
{$ENDREGION}

{$REGION '| DATABASE |'}
   FBDriverName = 'FB';
   FBPort = '3050';
   FBUserName = 'SYSDBA';
   FBPassWord = 'masterkey';
   FBCharacterSet = 'win1252';
{$ENDREGION}

implementation

end.
