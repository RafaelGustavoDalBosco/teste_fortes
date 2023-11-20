{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  � �           }
{=====================================================}
unit App.System.Types;

interface

type

  /// <summary>
  ///    Tipos de mensagens
  /// </summary>
  TTypeMessage = (tmWarning, tmError, tmQuestion, tmSucess, tmInformation, tmNone);

  /// <summary>
  ///    Tipos de Resultado de confirma��o
  /// </summary>
  TTypeResult = (trConfirmed, trCanceled, trAborted, trNone);

  /// <summary>
  ///    Tipos de a��es de dados
  /// </summary>
  TTypeAction = (taInsert, taUpdate, taSelect, taDelete, taList);

implementation

end.
