{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  � �           }
{=====================================================}
unit App.System.Vars;

interface

uses
  App.System.Connection, App.System.Types, System.SysUtils;

var

   /// <summary>
   ///   Objeto de Conex�o selecionado pela aplica��o
   /// </summary>
   gvApplicationConnection: TConnection;

implementation

initialization

finalization
   if Assigned(gvApplicationConnection) then
      FreeAndNil(gvApplicationConnection);

end.
