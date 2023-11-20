{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.System.Engine.DataBase;

interface

uses
   App.System.Wrapper, System.SysUtils, App.Common.Utils, App.System.Log, App.System.Vars, App.Consts.Messages;

type

   TTable = record
   public
      fName: UnicodeString;
      fScript: UnicodeString;
   end;

   TForeignKey = record
      fTableName: UnicodeString;
      fTableNameRef: UnicodeString;
      fFieldName: UnicodeString;
      fFieldNameRef: UnicodeString;
   end;

   TGenerator = record
      fName: UnicodeString;
   end;

   TSystemEngineDataBase = class
   private
      /// <summary>
      ///    Obtém a SQL que cria a FK
      /// </summary>
      function GetSQLForeignKey(const ARecord: TForeignKey): UnicodeString;

      /// <summary>
      ///    Cria as tabelas no banco de dados
      /// </summary>
      procedure CreateTables;

      /// <summary>
      ///    Cria as FK no banco de dados
      /// </summary>
      procedure CreateForeignKeys;

      /// <summary>
      ///    Cria os generators no banco de dados
      /// </summary>
      procedure CreateGenerators;
   public
      procedure Execute;
   end;

implementation

const
   AArrayTables: array [0..3] of TTable =
   (
      (fName: 'TBOMBA';
       fScript: 'CREATE TABLE TBOMBA (ID BIGINT NOT NULL, ID_TANQUE BIGINT NOT NULL, PRIMARY KEY (ID))'),

      (fName: 'TTANQUE';
       fScript: 'CREATE TABLE TTANQUE (ID BIGINT NOT NULL, ID_COMBUSTIVEL BIGINT NOT NULL,' + sLineBreak +
                'QUANTIDADE NUMERIC (15, 4), DESCRICAO_COMBUSTIVEL VARCHAR (40), PRIMARY KEY (ID))'),

      (fName: 'TCOMBUSTIVEL';
       fScript: 'CREATE TABLE TCOMBUSTIVEL (ID BIGINT NOT NULL, DESCRICAO VARCHAR (40), ALIQ_IMPOSTO NUMERIC (5,2),' + sLineBreak +
                'PRECO_VENDA NUMERIC (15,3), PRIMARY KEY (ID))'),

      (fName: 'TVENDAITEM';
       fScript: 'CREATE TABLE TVENDA_ITEM (ID BIGINT NOT NULL, ID_COMBUSTIVEL BIGINT NOT NULL,' + sLineBreak +
                'VALOR NUMERIC (15,2), VALOR_IMPOSTO NUMERIC (15,2), QUANTIDADE NUMERIC (5,4), PRECO_VENDA NUMERIC (15,3),' + sLineBreak +
                'ID_TANQUE BIGINT NOT NULL, ID_BOMBA BIGINT NOT NULL, DATA DATE, PRIMARY KEY (ID))')
   );

   AArrayForeignKeys: array [0..4] of TForeignKey =
   (
      (fTableName: 'TBOMBA';
       fTableNameRef: 'TTANQUE';
       fFieldName: 'ID_TANQUE';
       fFieldNameRef: 'ID'),

      (fTableName: 'TTANQUE';
       fTableNameRef: 'TCOMBUSTIVEL';
       fFieldName: 'ID_COMBUSTIVEL';
       fFieldNameRef: 'ID'),

      (fTableName: 'TVENDA_ITEM';
       fTableNameRef: 'TCOMBUSTIVEL';
       fFieldName: 'ID_COMBUSTIVEL';
       fFieldNameRef: 'ID'),

      (fTableName: 'TVENDA_ITEM';
       fTableNameRef: 'TTANQUE';
       fFieldName: 'ID_TANQUE';
       fFieldNameRef: 'ID'),

      (fTableName: 'TVENDA_ITEM';
       fTableNameRef: 'TBOMBA';
       fFieldName: 'ID_BOMBA';
       fFieldNameRef: 'ID')
   );

   AArrayGenerators: array [0..3] of TGenerator =
   (
      (fName: 'GEN_COMBUSTIVEL'),
      (fName: 'GEN_BOMBA'),
      (fName: 'GEN_TANQUE'),
      (fName: 'GEN_VENDA_ITEM')
   );

{ TSystemEngineDataBase }

procedure TSystemEngineDataBase.CreateForeignKeys;
var
   LLoop: TForeignKey;
begin
   for LLoop in AArrayForeignKeys do
   begin
      gvApplicationConnection.ExecuteSQL(GetSQLForeignKey(LLoop));
      Log.Write(UnitName, SActionDataBase, 'FK na tabela ' + LLoop.fTableName + ' criada com sucesso!');
   end;
end;

procedure TSystemEngineDataBase.CreateGenerators;
var
   LLoop: TGenerator;
begin
   for LLoop in AArrayGenerators do
   begin
      gvApplicationConnection.ExecuteSQL(Format('CREATE SEQUENCE %s', [LLoop.fName]));
      Log.Write(UnitName, SActionDataBase, 'Generator ' + LLoop.fName + ' criado com sucesso!');
   end;
end;

procedure TSystemEngineDataBase.CreateTables;
var
   LLoop: TTable;
begin
   for LLoop in AArrayTables do
   begin
      gvApplicationConnection.ExecuteSQL(LLoop.fScript);
      Log.Write(UnitName, SActionDataBase, 'Tabela ' + LLoop.fName + ' criada com sucesso!');
   end;
end;

procedure TSystemEngineDataBase.Execute;
begin
   CreateTables;
   CreateForeignKeys;
   CreateGenerators;
end;

function TSystemEngineDataBase.GetSQLForeignKey(const ARecord: TForeignKey): UnicodeString;
begin
   Result := 'ALTER TABLE ' + ARecord.fTableName + ' ADD CONSTRAINT FK_' + ARecord.fTableName + '_' + ARecord.fFieldName + ' FOREIGN KEY (' + ARecord.fFieldName + ') REFERENCES ' + ARecord.fTableNameRef + '(' + ARecord.fFieldNameRef + ')';
end;

end.
