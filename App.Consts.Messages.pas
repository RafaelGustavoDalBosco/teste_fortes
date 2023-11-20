{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  � �           }
{=====================================================}
unit App.Consts.Messages;

interface

uses
  System.SysUtils;

const

{$REGION '| MESSAGE TEXTS |'}
   SMessageSucess = 'Opera��o realizada com sucesso!';
   SMessageError = 'Erro ao realizar a opera��o!' + sLineBreak + 'Motivo: %s';
   SMessageInformation = 'Informativo: %s';
   SMessageConfirm = 'Confirma a opera��o?';
   SMessageCancel = 'Deseja realmente cancelar?';
   SMessageExitScreen = 'Deseja sair da tela?';
{$ENDREGION}

{$REGION '| ERRORS |'}
   SErrorFocusControl = 'O componente %s n�o pode ser focado! Form %s';
   SErrorExecSQL = 'Erro ao executar a SQL:' + sLineBreak + '%s' + sLineBreak + 'Motivo: %s';
   SErrorConnectionDB = 'Erro ao tentar conectar ao banco de dados! Motivo: %s';
   SErrorNotEnoughResource = 'N�o h� recursos dispon�veis para executar a a��o %s';
   SErrorCreateFolder = 'N�o foi poss�vel criar a pasta no caminho %s!' + sLineBreak + 'Motivo: %s';
   SErrorConvertion = 'Erro ao converter o tipo de vari�vel %s com o valor %s para %s!' + sLineBreak;
   SErrorPersistentObject = 'Action: %s' + sLineBreak + 'Erro ao persistir os dados do objeto %s! Motivo:' + sLineBreak + '%s';
{$ENDREGION}

{$REGION '| EMPTY |'}
   SEmptyObjectParamsConnection = 'N�o h� par�metros para a Conex�o ao banco de dados!';
   SEmptyObjectTransaction = 'N�o h� uma transa��o criada!';
   SEmptyParamName = 'Nome do par�metro est� em branco!';
   SEmptyFieldName = 'Nome do campo est� em branco!';
   SEmptyParamOnQuery = 'Par�metro %s n�o encontrado na query!';
   SEmptyFieldOnQuery = 'Campo %s n�o encontrado na query!';
   SEmptySQLOnQuery = 'N�o h� uma SQL adicionada na query!';
   SEmptyFieldValue = 'O campo %s est� vazio!';
{$ENDREGION}

{$REGION '| WARN |'}
   SWarnFileDontExist = 'Arquivo n�o encontrado no caminho %s';
   SWarnFileDeleted = 'Arquivo %s deletado';
   SWarnFileMoved = 'Arquivo %s movido para o caminho %s';
   SWarnFolderCreated = 'Pasta criada no caminho %s';
{$ENDREGION}

{$REGION '| ACTIONS |'}
   SActionSQLExecuted = 'Execution SQL: %s';
   SActionDataBase = 'DataBaseAction';
{$ENDREGION}

implementation

end.
