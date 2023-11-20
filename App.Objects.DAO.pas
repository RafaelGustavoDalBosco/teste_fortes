{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Objects.DAO;

interface

uses
   System.SysUtils,
   System.Generics.Collections,
   DataSnap.DBClient,
   Data.DB,
   App.Objects.DTO,
   App.System.Connection,
   App.Common.Utils,
   App.System.Wrapper,
   App.System.Connection.Transaction;

type

   TCommonDataAcessObject = class
   strict private
      FDataTransferObject: TCommonDataTransferObject;
      FListDataTransferObject: TList<TCommonDataTransferObject>;
      FConnectionTransaction: TConnectionTransaction;
      procedure SetDataTransferObject(const Value: TCommonDataTransferObject);
      procedure SetListDataTransferObject(const Value: TList<TCommonDataTransferObject>);
      procedure SetConnectionTransaction(const Value: TConnectionTransaction);
   strict protected
      /// <summary>
      ///    Cria uma instância do objeto TQuery com ou sem transação
      /// </summary>
      function CreateQuery: TQuery;

      /// <summary>
      ///    Obtém o CDS para mostrar nos CRUD
      /// </summary>
      function GetClientDataSetToView(const AQuery: TQuery): TClientDataSet;
   protected
      property DataTransferObject: TCommonDataTransferObject read FDataTransferObject write SetDataTransferObject;
      property ListDataTransferObject: TList<TCommonDataTransferObject> read FListDataTransferObject write SetListDataTransferObject;
      property ConnectionTransaction: TConnectionTransaction read FConnectionTransaction write SetConnectionTransaction;
   public
      /// <summary>
      ///    INSERT
      /// </summary>
      function Insert(const AObject: TCommonDataTransferObject = nil): Boolean; virtual; abstract;

      /// <summary>
      ///    INSERT LIST
      /// </summary>
      function InsertList: Boolean;

      /// <summary>
      ///    UPDATE
      /// </summary>
      function Update: Boolean; virtual; abstract;

      /// <summary>
      ///    SELECT
      /// </summary>
      function Select: TCommonDataTransferObject; virtual; abstract;

      /// <summary>
      ///    LIST
      /// </summary>
      function List: TObjectList<TCommonDataTransferObject>; virtual; abstract;

      /// <summary>
      ///    CLIENTDATASET VIEW CRUD
      /// </summary>
      function GetDataSetToView: TClientDataSet; virtual; abstract;

      /// <summary>
      ///    DELETE
      /// </summary>
      function Delete: Boolean; virtual; abstract;

      constructor Create; overload;
      constructor Create(const AObject: TCommonDataTransferObject; const ATransaction: TConnectionTransaction = nil); overload;
      constructor Create(const AListObject: TList<TCommonDataTransferObject>; const ATransaction: TConnectionTransaction = nil); overload;
      destructor Destroy; override;
   end;

   TDAOBomba = class(TCommonDataAcessObject)
   public
      /// <summary>
      ///    Persiste uma nova BOMBA
      /// </summary>
      function Insert(const AObject: TCommonDataTransferObject = nil): Boolean; override;

      /// <summary>
      ///    Atualiza o cadastro de uma BOMBA
      /// </summary>
      function Update: Boolean; override;

      /// <summary>
      ///    Obtém o objeto com os dados da BOMBA pelo seu ID
      /// </summary>
      function Select: TCommonDataTransferObject; override;

      /// <summary>
      ///    Obtém uma lista com todas as bombas no banco de dados
      /// </summary>
      function List: TObjectList<TCommonDataTransferObject>; override;

      /// <summary>
      ///    CLIENTDATASET VIEW CRUD
      /// </summary>
      function GetDataSetToView: TClientDataSet; override;

      /// <summary>
      ///    Realiza a exclusão de uma bomba no banco de dados
      /// </summary>
      function Delete: Boolean; override;
   end;

   TDAOTanque = class(TCommonDataAcessObject)
   public
      /// <summary>
      ///    Persiste uma novo TANQUE
      /// </summary>
      function Insert(const AObject: TCommonDataTransferObject = nil): Boolean; override;

      /// <summary>
      ///    Atualiza o cadastro de um TANQUE
      /// </summary>
      function Update: Boolean; override;

      /// <summary>
      ///    Atualiza a quantidade disponivel do TANQUE
      /// </summary>
      function UpdateQuantidade(const AValue: Currency; const AID: Int64): Boolean;

      /// <summary>
      ///    Obtém o objeto com os dados da TANQUE pelo seu ID
      /// </summary>
      function Select: TCommonDataTransferObject; override;

      /// <summary>
      ///    Obtém uma lista com todos os tanques no banco de dados
      /// </summary>
      function List: TObjectList<TCommonDataTransferObject>; override;

      /// <summary>
      ///    CLIENTDATASET VIEW CRUD
      /// </summary>
      function GetDataSetToView: TClientDataSet; override;

      /// <summary>
      ///    Realiza a exclusão de um tanque no banco de dados
      /// </summary>
      function Delete: Boolean; override;
   end;

   TDAOCombustivel = class(TCommonDataAcessObject)
   public
      /// <summary>
      ///    Persiste uma novo COMBUSTIVEL
      /// </summary>
      function Insert(const AObject: TCommonDataTransferObject = nil): Boolean; override;

      /// <summary>
      ///    Atualiza o cadastro de um COMBUSTIVEL
      /// </summary>
      function Update: Boolean; override;

      /// <summary>
      ///    Obtém o objeto com os dados da COMBUSTIVEL pelo seu ID
      /// </summary>
      function Select: TCommonDataTransferObject; override;

      /// <summary>
      ///    Obtém uma lista com todos os COMBUSTIVEIS no banco de dados
      /// </summary>
      function List: TObjectList<TCommonDataTransferObject>; override;

      /// <summary>
      ///    CLIENTDATASET VIEW CRUD
      /// </summary>
      function GetDataSetToView: TClientDataSet; override;

      /// <summary>
      ///    Realiza a exclusão de um COMBUSTIVEL no banco de dados
      /// </summary>
      function Delete: Boolean; override;
   end;

   TDAOVendaItem = class(TCommonDataAcessObject)
   private
      /// <summary>
      ///    Cria o ClientDataSet Custom
      /// </summary>
      function GetClientDataSetToViewCustom(const AQuery: TQuery): TClientDataSet;
   public
      /// <summary>
      ///    Persiste uma nova VENDA ITEM
      /// </summary>
      function Insert(const AObject: TCommonDataTransferObject = nil): Boolean; override;

      /// <summary>
      ///    Atualiza uma VENDA ITEM
      /// </summary>
      function Update: Boolean; override;

      /// <summary>
      ///    Obtém o objeto com os dados de uma VENDA ITEM pelo seu ID
      /// </summary>
      function Select: TCommonDataTransferObject; override;

      /// <summary>
      ///    Obtém uma lista com todas as VENDAS ITEM no banco de dados
      /// </summary>
      function List: TObjectList<TCommonDataTransferObject>; override;

      /// <summary>
      ///    Obtém uma lista com todas as VENDAS pela data
      /// </summary>
      function ListCustom(const AData: TDate): TObjectList<TDTOVendaItem>;

      /// <summary>
      ///    CLIENTDATASET VIEW CRUD
      /// </summary>
      function GetDataSetToView: TClientDataSet; overload; override;

      /// <summary>
      ///    CLIENTDATASET VIEW CUSTOM
      /// </summary>
      function GetDataSetToViewCustom(const AData: TDate): TClientDataSet; overload;

      /// <summary>
      ///    Realiza a exclusão de uma VENDA ITEM no banco de dados
      /// </summary>
      function Delete: Boolean; override;
   end;


implementation

{ TCommonDataAcessObject }

constructor TCommonDataAcessObject.Create(const AObject: TCommonDataTransferObject; const ATransaction: TConnectionTransaction = nil);
begin
   SetDataTransferObject(AObject);
   inherited Create;
end;

constructor TCommonDataAcessObject.Create(const AListObject: TList<TCommonDataTransferObject>; const ATransaction: TConnectionTransaction = nil);
begin
   SetListDataTransferObject(AListObject);
   inherited Create;
end;

constructor TCommonDataAcessObject.Create;
begin
   inherited Create;
end;

function TCommonDataAcessObject.CreateQuery: TQuery;
begin
   if (FConnectionTransaction <> nil) then
      Result := TQuery.Create(ConnectionTransaction)
   else
      Result := TQuery.Create;
end;

destructor TCommonDataAcessObject.Destroy;
begin
   inherited Destroy;
end;

function TCommonDataAcessObject.GetClientDataSetToView(const AQuery: TQuery): TClientDataSet;
begin
   Result := TClientDataSet.Create(nil);
   Result.Close;
   Result.FieldDefs.Add('ID', ftLargeInt);
   Result.FieldDefs.Add('DESCRICAO', ftString, 25);
   Result.CreateDataSet;

   repeat
      Result.Append;
      Result.CopyFields(AQuery.GetDataSet);
      Result.Post;

      AQuery.Next;
   until AQuery.EndOfData;
end;

function TCommonDataAcessObject.InsertList: Boolean;
var
   LDTO: TCommonDataTransferObject;
begin
   if Assigned(ListDataTransferObject) then
   begin
      for LDTO in ListDataTransferObject do
         Insert(LDTO);
   end;

   Result := True;
end;

procedure TCommonDataAcessObject.SetConnectionTransaction(const Value: TConnectionTransaction);
begin
   FConnectionTransaction := Value;
end;

procedure TCommonDataAcessObject.SetDataTransferObject(const Value: TCommonDataTransferObject);
begin
   FDataTransferObject := Value;
end;

procedure TCommonDataAcessObject.SetListDataTransferObject(const Value: TList<TCommonDataTransferObject>);
begin
   FListDataTransferObject := Value;
end;

{ TDAOBomba }

function TDAOBomba.Delete: Boolean;
const
   SQL = 'DELETE FROM TBOMBA WHERE ID = :ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', DataTransferObject.ID);
      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOBomba.GetDataSetToView: TClientDataSet;
const
   SQL = 'SELECT B.ID, T.DESCRICAO_COMBUSTIVEL AS DESCRICAO FROM TBOMBA' + sLineBreak +
         ' B INNER JOIN TTANQUE T ON B.ID_TANQUE = T.ID ORDER BY B.ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   LQuery.AddSQL(SQL);

   if LQuery.GetData then
   begin
      Result := GetClientDataSetToView(LQuery);
      FreeAndNil(LQuery);
   end
   else
   begin
      FreeAndNil(LQuery);
      Result := nil;
   end;
end;

function TDAOBomba.Insert(const AObject: TCommonDataTransferObject = nil): Boolean;
const
   SQL = 'INSERT INTO TBOMBA (ID, ID_TANQUE) VALUES (GEN_ID(GEN_BOMBA, 1), :ID_TANQUE)';
var
   LQuery: TQuery;
   LDTOBomba: TDTOBomba;
begin
   if (AObject = nil) then
      LDTOBomba := DataTransferObject as TDTOBomba
   else
      LDTOBomba := AObject as TDTOBomba;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID_TANQUE', LDTOBomba.IDTanque);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOBomba.List: TObjectList<TCommonDataTransferObject>;
const
   SQL = 'SELECT * FROM TBOMBA';
var
   LQuery: TQuery;
   LDTOBomba: TDTOBomba;
begin
   Result := TObjectList<TCommonDataTransferObject>.Create;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);

      if LQuery.GetData then
      begin
         repeat
            LDTOBomba := TDTOBomba.Create;
            LDTOBomba.IDTanque := LQuery.FieldToInt64('ID_TANQUE');
            LDTOBomba.ID := LQuery.FieldToInt64('ID');

            Result.Add(LDTOBomba);
            LQuery.Next;
         until LQuery.EndOfData;
      end;

   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOBomba.Select: TCommonDataTransferObject;
const
   SQL = 'SELECT * FROM TBOMBA WHERE ID = :ID';
var
   LQuery: TQuery;
   LDTOBomba: TDTOBomba;
begin
   LDTOBomba := DataTransferObject as TDTOBomba;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', LDTOBomba.ID);

      if LQuery.GetData then
         LDTOBomba.IDTanque := LQuery.FieldToInt64('ID_TANQUE');

      Result := LDTOBomba;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOBomba.Update: Boolean;
const
   SQL = 'UPDATE TBOMBA SET ID_TANQUE = :ID_TANQUE, ID_COMBUSTIVEL = :ID_COMBUSTIVEL WHERE ID = :ID';
var
   LQuery: TQuery;
   LDTOBomba: TDTOBomba;
begin
   LDTOBomba := DataTransferObject as TDTOBomba;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID_TANQUE', LDTOBomba.IDTanque);
      LQuery.ParamValue('ID', LDTOBomba.ID);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

{ TDAOTanque }

function TDAOTanque.Delete: Boolean;
const
   SQL = 'DELETE FROM TTANQUE WHERE ID = :ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', DataTransferObject.ID);
      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOTanque.GetDataSetToView: TClientDataSet;
const
   SQL = 'SELECT ID, DESCRICAO_COMBUSTIVEL AS DESCRICAO FROM TTANQUE ORDER BY ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   LQuery.AddSQL(SQL);

   if LQuery.GetData then
   begin
      Result := GetClientDataSetToView(LQuery);
      FreeAndNil(LQuery);
   end
   else
   begin
      FreeAndNil(LQuery);
      Result := nil;
   end;
end;

function TDAOTanque.Insert(const AObject: TCommonDataTransferObject): Boolean;
const
   SQL = 'INSERT INTO TTANQUE (ID, ID_COMBUSTIVEL, QUANTIDADE, DESCRICAO_COMBUSTIVEL) VALUES' + sLineBreak +
         '(GEN_ID(GEN_TANQUE, 1), :ID_COMBUSTIVEL, :QUANTIDADE, :DESCRICAO_COMBUSTIVEL)';
var
   LQuery: TQuery;
   LDTOTanque: TDTOTanque;
begin
   if (AObject = nil) then
      LDTOTanque := DataTransferObject as TDTOTanque
   else
      LDTOTanque := AObject as TDTOTanque;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID_COMBUSTIVEL', LDTOTanque.IDCombustivel);
      LQuery.ParamValue('QUANTIDADE', LDTOTanque.Quantidade);
      LQuery.ParamValue('DESCRICAO_COMBUSTIVEL', LDTOTanque.DescricaoCombustivel);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOTanque.List: TObjectList<TCommonDataTransferObject>;
const
   SQL = 'SELECT * FROM TTANQUE';
var
   LQuery: TQuery;
   LDTOTanque: TDTOTanque;
begin
   Result := TObjectList<TCommonDataTransferObject>.Create;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);

      if LQuery.GetData then
      begin
         repeat
            LDTOTanque := TDTOTanque.Create;
            LDTOTanque.Quantidade := LQuery.FieldToCurr('QUANTIDADE');
            LDTOTanque.IDCombustivel := LQuery.FieldToInt64('ID_COMBUSTIVEL');
            LDTOTanque.ID := LQuery.FieldToInt64('ID');
            LDTOTanque.DescricaoCombustivel := LQuery.FieldToString('DESCRICAO_COMBUSTIVEL');

            Result.Add(LDTOTanque);
            LQuery.Next;
         until LQuery.EndOfData;
      end;

   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOTanque.Select: TCommonDataTransferObject;
const
   SQL = 'SELECT * FROM TTANQUE WHERE ID = :ID';
var
   LQuery: TQuery;
   LDTOTanque: TDTOTanque;
begin
   LDTOTanque := DataTransferObject as TDTOTanque;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', LDTOTanque.ID);

      if LQuery.GetData then
      begin
         LDTOTanque.Quantidade := LQuery.FieldToCurr('QUANTIDADE');
         LDTOTanque.IDCombustivel := LQuery.FieldToInt64('ID_COMBUSTIVEL');
      end;

      Result := LDTOTanque;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOTanque.Update: Boolean;
const
   SQL = 'UPDATE TTANQUE SET ID_COMBUSTIVEL = :ID_COMBUSTIVEL, QUANTIDADE = :QUANTIDADE WHERE ID = :ID';
var
   LQuery: TQuery;
   LDTOTanque: TDTOTanque;
begin
   LDTOTanque:= DataTransferObject as TDTOTanque;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID_COMBUSTIVEL', LDTOTanque.IDCombustivel);
      LQuery.ParamValue('QUANTIDADE', LDTOTanque.Quantidade);
      LQuery.ParamValue('ID', LDTOTanque.ID);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOTanque.UpdateQuantidade(const AValue: Currency; const AID: Int64): Boolean;
const
   SQL = 'UPDATE TTANQUE SET QUANTIDADE = QUANTIDADE - :VALOR WHERE ID = :ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('QUANTIDADE', AValue);
      LQuery.ParamValue('ID', AID);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

{ TDAOCombustivel }

function TDAOCombustivel.Delete: Boolean;
const
   SQL = 'DELETE FROM TCOMBUSTIVEL WHERE ID = :ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', DataTransferObject.ID);
      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOCombustivel.GetDataSetToView: TClientDataSet;
const
   SQL = 'SELECT ID, DESCRICAO FROM TCOMBUSTIVEL ORDER BY ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   LQuery.AddSQL(SQL);

   if LQuery.GetData then
   begin
      Result := GetClientDataSetToView(LQuery);
      FreeAndNil(LQuery);
   end
   else
   begin
      FreeAndNil(LQuery);
      Result := nil;
   end;
end;

function TDAOCombustivel.Insert(const AObject: TCommonDataTransferObject): Boolean;
const
   SQL = 'INSERT INTO TCOMBUSTIVEL (ID, DESCRICAO, PRECO_VENDA, ALIQ_IMPOSTO) VALUES (GEN_ID(GEN_COMBUSTIVEL, 1),' + sLineBreak +
        ' :DESCRICAO, :PRECO_VENDA, :ALIQ_IMPOSTO)';
var
   LQuery: TQuery;
   LDTOCombustivel: TDTOCombustivel;
begin
   if (AObject = nil) then
      LDTOCombustivel := DataTransferObject as TDTOCombustivel
   else
      LDTOCombustivel := AObject as TDTOCombustivel;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('DESCRICAO', LDTOCombustivel.Descricao);
      LQuery.ParamValue('PRECO_VENDA', LDTOCombustivel.PrecoVenda);
      LQuery.ParamValue('ALIQ_IMPOSTO', LDTOCombustivel.AliquotaImposto);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOCombustivel.List: TObjectList<TCommonDataTransferObject>;
const
   SQL = 'SELECT * FROM TCOMBUSTIVEL';
var
   LQuery: TQuery;
   LDTOCombustivel: TDTOCombustivel;
begin
   Result := TObjectList<TCommonDataTransferObject>.Create;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);

      if LQuery.GetData then
      begin
         repeat
            LDTOCombustivel := TDTOCombustivel.Create;
            LDTOCombustivel.ID := LQuery.FieldToInt64('ID');
            LDTOCombustivel.Descricao := LQuery.FieldToString('DESCRICAO');
            LDTOCombustivel.PrecoVenda := LQuery.FieldToCurr('PRECO_VENDA');
            LDTOCombustivel.AliquotaImposto := LQuery.FieldToCurr('ALIQ_IMPOSTO');

            Result.Add(LDTOCombustivel);
            LQuery.Next;
         until LQuery.EndOfData;
      end;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOCombustivel.Select: TCommonDataTransferObject;
const
   SQL = 'SELECT * FROM TCOMBUSTIVEL WHERE ID = :ID';
var
   LQuery: TQuery;
   LDTOCombustivel: TDTOCombustivel;
begin
   LDTOCombustivel := DataTransferObject as TDTOCombustivel;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', LDTOCombustivel.ID);

      if LQuery.GetData then
      begin
         LDTOCombustivel.Descricao := LQuery.FieldToString('DESCRICAO');
         LDTOCombustivel.PrecoVenda := LQuery.FieldToCurr('PRECO_VENDA');
         LDTOCombustivel.AliquotaImposto := LQuery.FieldToCurr('ALIQ_IMPOSTO');
      end;

      Result := LDTOCombustivel;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOCombustivel.Update: Boolean;
const
   SQL = 'UPDATE TCOMBUSTIVEL SET DESCRICAO = :DESCRICAO, PRECO_VENDA = :PRECO_VENDA, ALIQ_IMPOSTO = :ALIQ_IMPOSTO' + sLineBreak +
         ' WHERE ID = :ID';
var
  LQuery: TQuery;
  LDTOCombustivel: TDTOCombustivel;
begin
   LDTOCombustivel := DataTransferObject as TDTOCombustivel;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('DESCRICAO', LDTOCombustivel.Descricao);
      LQuery.ParamValue('PRECO_VENDA', LDTOCombustivel.PrecoVenda);
      LQuery.ParamValue('ALIQ_IMPOSTO', LDTOCombustivel.AliquotaImposto);
      LQuery.ParamValue('ID', LDTOCombustivel.ID);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

{ TDAOVendaItem }

function TDAOVendaItem.Delete: Boolean;
const
   SQL = 'DELETE FROM TVENDA_ITEM WHERE ID = :ID';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', DataTransferObject.ID);
      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOVendaItem.GetDataSetToView: TClientDataSet;
const
   SQL = 'SELECT * FROM TVENDA_ITEM';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   LQuery.AddSQL(SQL);

   if LQuery.GetData then
   begin
      Result := GetClientDataSetToView(LQuery);
      FreeAndNil(LQuery);
   end
   else
   begin
      FreeAndNil(LQuery);
      Result := nil;
   end;
end;

function TDAOVendaItem.GetClientDataSetToViewCustom(const AQuery: TQuery): TClientDataSet;
begin
   Result := TClientDataSet.Create(nil);
   Result.Close;
   Result.FieldDefs.Add('ID', ftLargeInt);
   Result.FieldDefs.Add('VALOR', ftCurrency);
   Result.FieldDefs.Add('ID_BOMBA', ftLargeint);
   Result.FieldDefs.Add('ID_TANQUE',  ftLargeint);
   Result.FieldDefs.Add('COMBUSTIVEL', ftString, 40);
   Result.FieldDefs.Add('QUANTIDADE', ftFloat);
   Result.CreateDataSet;

   repeat
      Result.Append;
      Result.CopyFields(AQuery.GetDataSet);
      Result.Post;

      AQuery.Next;
   until AQuery.EndOfData;
end;

function TDAOVendaItem.GetDataSetToViewCustom(const AData: TDate): TClientDataSet;
const
   SQL = 'SELECT COM.DESCRICAO AS COMBUSTIVEL, VEN.* FROM TVENDA_ITEM VEN INNER JOIN TCOMBUSTIVEL COM ON VEN.ID_COMBUSTIVEL = COM.ID' + sLineBreak +
         ' WHERE DATA = :DATA';
var
   LQuery: TQuery;
begin
   LQuery := CreateQuery;
   LQuery.AddSQL(SQL);
   LQuery.ParamValue('DATA', AData);

   if LQuery.GetData then
   begin
      Result := GetClientDataSetToViewCustom(LQuery);
      FreeAndNil(LQuery);
   end
   else
   begin
      FreeAndNil(LQuery);
      Result := nil;
   end;
end;

function TDAOVendaItem.Insert(const AObject: TCommonDataTransferObject): Boolean;
const
   SQL = 'INSERT INTO TVENDA_ITEM (ID, DATA, ID_COMBUSTIVEL, VALOR_IMPOSTO,' + sLineBreak +
         'VALOR, QUANTIDADE, PRECO_VENDA, ID_BOMBA, ID_TANQUE) VALUES (GEN_ID(GEN_VENDA_ITEM, 1),' + sLineBreak +
         ':DATA, :ID_COMBUSTIVEL, :VALOR_IMPOSTO, :VALOR, :QUANTIDADE, :PRECO_VENDA, :ID_BOMBA, :ID_TANQUE)';
var
   LQuery: TQuery;
   LDTOVendaItem: TDTOVendaItem;
begin
   if AObject = nil then
      LDTOVendaItem := DataTransferObject as TDTOVendaItem
   else
      LDTOVendaItem := AObject as TDTOVendaItem;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('DATA', LDTOVendaItem.Data);
      LQuery.ParamValue('ID_COMBUSTIVEL', LDTOVendaItem.IDCombustivel);
      LQuery.ParamValue('VALOR_IMPOSTO', LDTOVendaItem.ValorImposto);
      LQuery.ParamValue('VALOR', LDTOVendaItem.Valor);
      LQuery.ParamValue('QUANTIDADE', LDTOVendaItem.Quantidade);
      LQuery.ParamValue('PRECO_VENDA', LDTOVendaItem.PrecoVenda);
      LQuery.ParamValue('ID_TANQUE', LDTOVendaItem.IDTanque);
      LQuery.ParamValue('ID_BOMBA', LDTOVendaItem.IDBomba);
      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOVendaItem.List: TObjectList<TCommonDataTransferObject>;
const
   SQL = 'SELECT * FROM TVENDA_ITEM';
var
   LQuery: TQuery;
   LLoop: TDTOVendaItem;
begin
   Result := TObjectList<TCommonDataTransferObject>.Create;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);

      if LQuery.GetData then
      begin
         repeat
            LLoop := TDTOVendaItem.Create;
            LLoop.Data := LQuery.FieldToDate('DATA');
            LLoop.IDCombustivel := LQuery.FieldToInt64('ID_COMBUSTIVEL');
            LLoop.ValorImposto := LQuery.FieldToCurr('VALOR_IMPOSTO');
            LLoop.Valor := LQuery.FieldToCurr('VALOR');
            LLoop.Quantidade := LQuery.FieldToCurr('QUANTIDADE');
            LLoop.PrecoVenda := LQuery.FieldToCurr('PRECO_VENDA');
            LLoop.IDTanque := LQuery.FieldToInt64('ID_TANQUE');
            LLoop.IDBomba := LQuery.FieldToInt64('ID_BOMBA');

            Result.Add(LLoop);
         until LQuery.EndOfData;
      end;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOVendaItem.ListCustom(const AData: TDate): TObjectList<TDTOVendaItem>;
const
   SQL = 'SELECT * FROM TVENDA_ITEM WHERE DATA = :DATA';
var
   LQuery: TQuery;
   LLoop: TDTOVendaItem;
begin
   Result := TObjectList<TDTOVendaItem>.Create;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('DATA', AData);

      if LQuery.GetData then
      begin
         repeat
            LLoop := TDTOVendaItem.Create;
            LLoop.Data := LQuery.FieldToDate('DATA');
            LLoop.IDCombustivel := LQuery.FieldToInt64('ID_COMBUSTIVEL');
            LLoop.ValorImposto := LQuery.FieldToCurr('VALOR_IMPOSTO');
            LLoop.Valor := LQuery.FieldToCurr('VALOR');
            LLoop.Quantidade := LQuery.FieldToCurr('QUANTIDADE');
            LLoop.PrecoVenda := LQuery.FieldToCurr('PRECO_VENDA');
            LLoop.IDTanque := LQuery.FieldToInt64('ID_TANQUE');
            LLoop.IDBomba := LQuery.FieldToInt64('ID_BOMBA');

            Result.Add(LLoop);
         until LQuery.EndOfData;
      end;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOVendaItem.Select: TCommonDataTransferObject;
const
   SQL = 'SELECT * FROM TVENDA_ITEM WHERE ID = :ID';
var
   LQuery: TQuery;
   LDTOVendaItem: TDTOVendaItem;
begin
   LDTOVendaItem := DataTransferObject as TDTOVendaItem;

   LQuery := CreateQuery;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('ID', LDTOVendaItem.ID);

      if LQuery.GetData then
      begin
         LDTOVendaItem.Data := LQuery.FieldToDate('DATA');
         LDTOVendaItem.IDCombustivel := LQuery.FieldToInt64('ID_COMBUSTIVEL');
         LDTOVendaItem.ValorImposto := LQuery.FieldToCurr('VALOR_IMPOSTO');
         LDTOVendaItem.Valor := LQuery.FieldToCurr('VALOR');
         LDTOVendaItem.Quantidade := LQuery.FieldToCurr('QUANTIDADE');
         LDTOVendaItem.PrecoVenda := LQuery.FieldToCurr('PRECO_VENDA');
         LDTOVendaItem.IDTanque := LQuery.FieldToInt64('ID_TANQUE');
         LDTOVendaItem.IDBomba := LQuery.FieldToInt64('ID_BOMBA');
      end;

      Result := LDTOVendaItem;
   finally
      FreeAndNil(LQuery);
   end;
end;

function TDAOVendaItem.Update: Boolean;
const
   SQL = 'UPDATE TVENDA_ITEM SET ID_COMBUSTIVEL = :ID_COMBUSTIVEL, VALOR_IMPOSTO = :VALOR_IMPOSTO, VALOR = :VALOR,' + sLineBreak +
         'QUANTIDADE = :QUANTIDADE, PRECO_VENDA = :PRECO_VENDA, ID_TANQUE = :ID_TANQUE, ID_BOMBA = :ID_BOMBA, DATA = :DATA WHERE ID = :ID';
var
   LQuery: TQuery;
   LDTOVendaItem: TDTOVendaItem;
begin
   LDTOVendaItem := DataTransferObject as TDTOVendaItem;

   LQuery := TQuery.Create;
   try
      LQuery.AddSQL(SQL);
      LQuery.ParamValue('DATA', LDTOVendaItem.Data);
      LQuery.ParamValue('ID_COMBUSTIVEL', LDTOVendaItem.IDCombustivel);
      LQuery.ParamValue('VALOR_IMPOSTO', LDTOVendaItem.ValorImposto);
      LQuery.ParamValue('VALOR', LDTOVendaItem.Valor);
      LQuery.ParamValue('QUANTIDADE', LDTOVendaItem.Quantidade);
      LQuery.ParamValue('PRECO_VENDA', LDTOVendaItem.PrecoVenda);
      LQuery.ParamValue('ID_TANQUE', LDTOVendaItem.IDTanque);
      LQuery.ParamValue('ID_BOMBA', LDTOVendaItem.IDBomba);
      LQuery.ParamValue('ID', LDTOVendaItem.ID);

      Result := LQuery.Execute;
   finally
      FreeAndNil(LQuery);
   end;
end;

end.
