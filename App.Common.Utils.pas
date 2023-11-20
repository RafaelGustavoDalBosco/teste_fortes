{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Common.Utils;

interface

uses
   Vcl.Forms,
   Vcl.Controls,
   Vcl.Dialogs,
   Vcl.StdCtrls,

   Winapi.Windows,

   System.SysUtils,
   System.IniFiles,
   System.Variants,
   System.Classes,
   System.MaskUtils,
   System.DateUtils,
   System.Win.ComObj,
   System.UITypes,
   System.Math,
   System.Generics.Collections,

   App.Consts.Messages,
   App.System.Log,
   App.System.Wrapper,
   App.System.Types, App.Consts.Common;
type

   TApplicationControl = class
   public
      /// <summary>
      ///    Mostra a mensagem padrão da aplicação
      /// </summary>
      class function ShowMessage(const AType: TTypeMessage; const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de WARNING
      /// </summary>
      class function ShowWarn(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de ERROR
      /// </summary>
      class function ShowError(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de SUCESS
      /// </summary>
      class function ShowSucess(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de QUESTION
      /// </summary>
      class function ShowQuestion(const AText: UnicodeString): Boolean; static;

      /// <summary>
      ///    Mostra a tela de mensagem de INFORMATION
      /// </summary>
      class function ShowInformation(const AText: UnicodeString): Boolean; static;
   end;

   TComponentControl = class
   public
      /// <summary>
      ///    Mostra a mensagem de warning, referente ao campo vazio
      /// </summary>
      class procedure ShowWarnFocus(const AComponent: TComponent; const ACaption: UnicodeString); static;

      /// <summary>
      ///    Seta o foco a um componente
      /// </summary>
      class procedure SetFocus(const AComponent: TComponent); static;

      /// <summary>
      ///    Checagem de caracteres para numeração
      /// </summary>
      class procedure KeyPressToCurr(var AKey: Char); static;

      /// <summary>
      ///    Checagem de caracteres para numeração de inteiros
      /// </summary>
      class procedure KeyPressToInt(var AKey: Char); static;
   end;

   TDataBaseControl = class
   public
      /// <summary>
      ///    Executa uma SQL pelo objeto TQuery
      /// </summary>
      class function ExecuteSQL(const ASQL: UnicodeString): Boolean; static;

      /// <summary>
      ///    Obtém o proximo valor de um generator
      /// </summary>
      class function GetNextValueFromGenerator(const AGeneratorName: UnicodeString): Int64; static;
   end;

   TFileControl = class
   public
      /// <summary>
      ///    Cria uma pasta em um determinado caminho, apresenta mensagem, caso de erro
      /// </summary>
      class procedure CreateFolder(const APath: UnicodeString); static;

      /// <summary>
      ///    Verifica se determinado arquivo, existe no caminho
      /// </summary>
      class function FileExists(const APath: UnicodeString): Boolean; static;

      /// <summary>
      ///    Move um arquivo para outro destino
      /// </summary>
      class procedure MoveFile(const AFilePath, AFileDestiny: UnicodeString); static;

      /// <summary>
      ///    Remove um arquivo definido no seu path
      /// </summary>
      class procedure RemoveFile(const AFilePath: UnicodeString); static;

      /// <summary>
      ///    Escreve no log qualquer atividade referente a arquivo
      /// </summary>
      class procedure SetLogActivityFile(const AText: UnicodeString); static;

      /// <summary>
      ///    Obtem o caminho onde está a aplicação
      /// </summary>
      class function GetApplicationPath: UnicodeString; static;
   end;

   TIniControl = class
   public
      /// <summary>
      ///    Le o caminho do banco de dados no arquivo .ini
      /// </summary>
      class function ReadDataBasePath: UnicodeString; static;

      /// <summary>
      ///    Le o SERVER de conexão
      /// </summary>
      class function ReadServer: UnicodeString; static;

      /// <summary>
      ///    Escreve o caminho do banco de dados no arquivo .ini
      /// </summary>
      class procedure WriteDataBasePath(const AValue: UnicodeString); static;

      /// <summary>
      ///    Escreve o SERVER do banco de dados
      /// </summary>
      class procedure WriteServer(const AValue: UnicodeString); static;
   end;

   TConvertControl = class
   public
      /// <summary>
      ///    Converte uma String em Integer
      /// </summary>
      class function StringToInteger(const AValue: UnicodeString; const ADefValue: Integer = 0): Integer; static;

      /// <summary>
      ///    Converte uma String em Currency
      /// </summary>
      class function StringToCurrency(const AValue: UnicodeString): Currency; static;

      /// <summary>
      ///    Converte uma String em TDateTime
      /// </summary>
      class function StringToDateTime(const AValue: UnicodeString): TDateTime; static;

      /// <summary>
      ///    Converte uma String em Int64
      /// </summary>
      class function StringToInt64(const AValue: UnicodeString; const ADefValue: Int64 = 0): Int64; static;

      /// <summary>
      ///    Converte uma String em Boolean
      /// </summary>
      class function StringToBool(const AValue: UnicodeString): Boolean; static;

      /// <summary>
      ///    Converte um Integer em Boolean
      /// </summary>
      class function IntegerToBool(const AValue: Integer): Boolean; static;

      /// <summary>
      ///    Converte um Integer em String
      /// </summary>
      class function IntegerToString(const AValue: Integer): UnicodeString; static;

      /// <summary>
      ///    Converte um Currency em String
      /// </summary>
      class function CurrencyToString(const AValue: Currency): UnicodeString; static;

      /// <summary>
      ///    Converte um Currency em Moeda String
      /// </summary>
      class function CurrencyToMoneyStr(const AValue: Currency): UnicodeString; static;

      /// <summary>
      ///    Converte um Variant em String
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: String); overload; static;

      /// <summary>
      ///    Converte um Variant em Integer
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: Integer); overload; static;

      /// <summary>
      ///    Converte um Variant em Currency
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: Currency); overload; static;

      /// <summary>
      ///    Converte um Variant em TDateTime
      /// </summary>
      class procedure VarTo(const AVariant: Variant; out AValue: TDateTime); overload; static;

      /// <summary>
      ///    Grava no log, caso esteja configurado, o erro de conversão
      /// </summary>
      class procedure SetLogErrorConversion(const AValue: Variant; const ATypeIn, ATypeOut, AInfo: UnicodeString); static;
   end;

   TFormControl = class
   public
      /// <summary>
      ///    Limpa os componentes de um form
      /// </summary>
      class procedure ClearForm(const AForm: TForm); static;

      /// <summary>
      ///    Ativa/Desativa os componentes de um form
      /// </summary>
      class procedure EnableForm(const AForm: TForm; const AEnabled: Boolean); static;

      /// <summary>
      ///    Coloca como ReadOnly os componentes de um form
      /// </summary>
      class procedure ReadOnlyForm(const AForm: TForm; const AStatus: Boolean); static;
   end;

var
   SysFile: TFileControl;
   SysCon: TConvertControl;
   SysIni: TIniControl;
   SysFrm: TFormControl;
   SysApp: TApplicationControl;
   SysDB: TDataBaseControl;
   SysComp: TComponentControl;

implementation

{ TFileControl }

uses App.System.Vars;

class procedure TFileControl.CreateFolder(const APath: UnicodeString);
begin
   if (not DirectoryExists(APath)) then
   begin
      try
         ForceDirectories(APath);
         SysFile.SetLogActivityFile(Format(SWarnFolderCreated, [APath]));
      except
         raise Exception.CreateFmt(SErrorCreateFolder, [APath]);
      end;
   end;
end;

class procedure TFileControl.RemoveFile(const AFilePath: UnicodeString);
begin
   if (not SysFile.FileExists(AFilePath)) then
   begin
      DeleteFile(AFilePath);
      SysFile.SetLogActivityFile(Format(SWarnFileDeleted, [AFilePath]));
   end;
end;

class procedure TFileControl.SetLogActivityFile(const AText: UnicodeString);
begin
   Log.Write(UnitName, 'Alterações de arquivo', AText);
end;

class function TFileControl.FileExists(const APath: UnicodeString): Boolean;
begin
   Result := System.SysUtils.FileExists(APath);

   if (not Result) then
      SysFile.SetLogActivityFile(Format(SWarnFileDontExist, [APath]));
end;

class function TFileControl.GetApplicationPath: UnicodeString;
begin
   Result := ExtractFilePath(Application.ExeName);
end;

class procedure TFileControl.MoveFile(const AFilePath, AFileDestiny: UnicodeString);
begin
   if SysFile.FileExists(AFilePath) then
   begin
      ChangeFilePath(AFilePath, AFileDestiny);
      SysFile.RemoveFile(AFilePath);
      SysFile.SetLogActivityFile(Format(SWarnFileMoved, [AFilePath, AFileDestiny]));
   end;
end;

{ TConvertControl }

class function TConvertControl.CurrencyToMoneyStr(const AValue: Currency): UnicodeString;
begin
   if (AValue > 0) then
      Result := FormatFloat('#.00', AValue)
   else
      Result := '0';
end;

class function TConvertControl.CurrencyToString(const AValue: Currency): UnicodeString;
begin
   Result := CurrToStr(AValue);
end;

class function TConvertControl.IntegerToBool(const AValue: Integer): Boolean;
begin
   Result := (AValue <> 0);
end;

class function TConvertControl.IntegerToString(const AValue: Integer): UnicodeString;
begin
   try
      Result := AValue.ToString;
   except
      on E: Exception do
      begin
         Result := EmptyStr;
         SysCon.SetLogErrorConversion(AValue, 'Integer', 'String', 'Default Value: Empty');
      end;
   end;
end;

class procedure TConvertControl.SetLogErrorConversion(const AValue: Variant; const ATypeIn, ATypeOut, AInfo: UnicodeString);
begin
   Log.Write(UnitName, 'Erro de conversão de variavéis', Format(SErrorConvertion, [ATypeIn, AValue, ATypeOut]), AInfo);
end;

class function TConvertControl.StringToBool(const AValue: UnicodeString): Boolean;
begin
   if (not TryStrToBool(AValue, Result)) then
   begin
      Result := False;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Boolean', 'Default Value: False');
   end;
end;

class function TConvertControl.StringToCurrency(const AValue: UnicodeString): Currency;
begin
   if (not TryStrToCurr(AValue, Result)) then
   begin
      Result := 0.00;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Currency', 'Default Value: 0.00');
   end;
end;

class function TConvertControl.StringToDateTime(const AValue: UnicodeString): TDateTime;
begin
   if (not TryStrToDateTime(AValue, Result)) then
   begin
      Result := 0;
      SysCon.SetLogErrorConversion(AValue, 'String', 'TDateTime', 'Default Value: 31/12/1899');
   end;
end;

class function TConvertControl.StringToInt64(const AValue: UnicodeString; const ADefValue: Int64 = 0): Int64;
begin
   if (not TryStrToInt64(AValue, Result)) then
   begin
      Result := ADefValue;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Int64', 'Default Value: ' + ADefValue.ToString);
   end;
end;

class function TConvertControl.StringToInteger(const AValue: UnicodeString; const ADefValue: Integer): Integer;
begin
   if (not TryStrToInt(AValue, Result)) then
   begin
      Result := ADefValue;
      SysCon.SetLogErrorConversion(AValue, 'String', 'Integer', 'Default Value: ' + ADefValue.ToString);
   end;
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: Currency);
var
   LStringValue: UnicodeString;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varCurrency) then
         AValue := AValue
      else
      if VarIsFloat(AVariant) then
      begin
         SysCon.VarTo(AVariant, LStringValue);

         if (not LStringValue.IsEmpty) then
            AValue := SysCon.StringToCurrency(LStringValue)
         else
            AValue := 0.00;
      end;
   end
   else
   begin
      AValue := 0.00;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'Currency', 'VarIsNull');
   end;
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: Integer);
var
   LStringValue: UnicodeString;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varInteger) then
         AValue := AValue
      else
      if VarIsNumeric(AVariant) then
      begin
         SysCon.VarTo(AVariant, LStringValue);

         if (not LStringValue.IsEmpty) then
            AValue := SysCon.StringToInteger(LStringValue)
         else
            AValue := Null;
      end;
   end
   else
   begin
      AValue := Null;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'Integer', 'VarIsNull');
   end;
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: String);
begin
   if (not VarIsNull(AVariant)) then
      AValue := VarToStr(AVariant)
   else
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'String', 'VarIsNull');
end;

class procedure TConvertControl.VarTo(const AVariant: Variant; out AValue: TDateTime);
var
   LStringValue: UnicodeString;
begin
   if (not VarIsNull(AVariant)) then
   begin
      if VarIsType(AVariant, varDate) then
         AValue := AValue
      else
      if VarIsFloat(AVariant) then
      begin
         SysCon.VarTo(AVariant, LStringValue);

         if (not LStringValue.IsEmpty) then
            AValue := SysCon.StringToDateTime(LStringValue)
         else
            AValue := 0;
      end;
   end
   else
   begin
      AValue := 0;
      SysCon.SetLogErrorConversion(AVariant, 'Variant', 'TDateTime', 'VarIsNull');
   end;
end;

{ TIniControl }

class function TIniControl.ReadDataBasePath: UnicodeString;
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      Result := LIniFile.ReadString(IniSectorSystem, IniRowDataBasePath, EmptyStr);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class function TIniControl.ReadServer: UnicodeString;
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      Result := LIniFile.ReadString(IniSectorSystem, IniRowServer, EmptyStr);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class procedure TIniControl.WriteDataBasePath(const AValue: UnicodeString);
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      LIniFile.WriteString(IniSectorSystem, IniRowDataBasePath, AValue);
   finally
      FreeAndNil(LIniFile);
   end;
end;

class procedure TIniControl.WriteServer(const AValue: UnicodeString);
var
   LIniFile: TIniFile;
begin
   LIniFile := TIniFile.Create(IniPath);
   try
      LIniFile.WriteString(IniSectorSystem, IniRowServer, AValue);
   finally
      FreeAndNil(LIniFile);
   end;
end;

{ TApplicationControl }

class function TApplicationControl.ShowError(const AText: UnicodeString): Boolean;
begin
   Result := SysApp.ShowMessage(tmError, AText);
end;

class function TApplicationControl.ShowInformation(const AText: UnicodeString): Boolean;
begin
   Result := SysApp.ShowMessage(tmInformation, AText);
end;

class function TApplicationControl.ShowMessage(const AType: TTypeMessage; const AText: UnicodeString): Boolean;
var
  LWinTypeMessage: TMsgDlgType;
begin
  case AType of
     tmWarning: LWinTypeMessage := TMsgDlgType.mtWarning;
     tmError: LWinTypeMessage := TMsgDlgType.mtError;
     tmQuestion: LWinTypeMessage := TMsgDlgType.mtConfirmation;
     tmSucess, tmInformation, tmNone: LWinTypeMessage := TMsgDlgType.mtInformation;
  else
    LWinTypeMessage := TMsgDlgType.mtInformation;
  end;

  if (LWinTypeMessage = TMsgDlgType.mtConfirmation) then
    Result := MessageDlg(AText, LWinTypeMessage, [mbYes, mbNo], 0, mbYes) = mrYes
  else
    Result := MessageDlg(AText, LWinTypeMessage, [mbOk], 0, mbOK) > 0;
end;

class function TApplicationControl.ShowQuestion(const AText: UnicodeString): Boolean;
begin
   Result := SysApp.ShowMessage(tmQuestion, AText);
end;

class function TApplicationControl.ShowSucess(const AText: UnicodeString): Boolean;
begin
   Result := SysApp.ShowMessage(tmSucess, AText);
end;

class function TApplicationControl.ShowWarn(const AText: UnicodeString): Boolean;
begin
   Result := SysApp.ShowMessage(tmWarning, AText);
end;

{ TDataBaseControl }

class function TDataBaseControl.ExecuteSQL(const ASQL: UnicodeString): Boolean;
var
   LQuery: TQuery;
begin
   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(ASQL);
      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

class function TDataBaseControl.GetNextValueFromGenerator(const AGeneratorName: UnicodeString): Int64;
const
   SQL = 'SELECT GEN_ID(%s, 0) AS ID FROM RDB$DATABASE';
var
   LQuery: TQuery;
begin
   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(Format(SQL, [AGeneratorName]));

      if LQuery.GetData then
         Result := LQuery.FieldToInt64('ID') + 1
      else
         Result := 1;
   finally
      FreeAndNil(LQuery);
   end;
end;

{ TFormControl }

class procedure TFormControl.ClearForm(const AForm: TForm);
var
   LComponent: TComponent;
begin
   for LComponent in AForm do
   begin
      if (LComponent is TEdit) then
         TEdit(LComponent).Text := EmptyStr;
   end;
end;

class procedure TFormControl.EnableForm(const AForm: TForm; const AEnabled: Boolean);
var
   LComponent: TComponent;
   LWinControl: TWinControl;
begin
   for LComponent in AForm do
   begin
      LWinControl := TWinControlClass.Create(LComponent);
      LWinControl.Enabled := AEnabled;
   end;
end;

class procedure TFormControl.ReadOnlyForm(const AForm: TForm; const AStatus: Boolean);
var
   LComponent: TComponent;
begin
   for LComponent in AForm do
   begin
      if LComponent is TEdit then
         TEdit(LComponent).ReadOnly := AStatus;

      if LComponent is TComboBox then
         TComboBox(LComponent).Enabled := (not AStatus);
   end;
end;

{ TComponentControl }

class procedure TComponentControl.KeyPressToCurr(var AKey: Char);
begin
   if (not CharInSet(AKey,['0'..'9', ',', #8])) then
      AKey := #0
end;

class procedure TComponentControl.KeyPressToInt(var AKey: Char);
begin
   if (not CharInSet(AKey,['0'..'9', #8])) then
      AKey := #0
end;

class procedure TComponentControl.SetFocus(const AComponent: TComponent);
var
   LControl: TWinControl;
begin
   LControl := TWinControl(AComponent);

   if (LControl.CanFocus) then
      LControl.SetFocus
   else
     Log.Write(UnitName, 'Focus [Component]', Format(SErrorFocusControl, [LControl.Name, LControl.Owner.Name]));
end;

class procedure TComponentControl.ShowWarnFocus(const AComponent: TComponent; const ACaption: UnicodeString);
begin
   SysApp.ShowWarn(Format(SEmptyFieldValue, [ACaption]));
   SysComp.SetFocus(AComponent);
end;

end.
