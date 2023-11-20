{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.WinXPickers, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  App.System.Types, DataSnap.DBClient, Frm.Cadastro.Abastecimento, App.Objects.DAO, App.Objects.DTO, System.Generics.Collections;

type

   TFrmAbastecimento = class(TFrmSystemAncestral)
      GrbFiltro: TGroupBox;
      EdtData: TDatePicker;
      GrbAbastecimento: TGroupBox;
      BtInsert: TSpeedButton;
      DBGridRecords: TDBGrid;
      BtLoad: TSpeedButton;
      BtUpdate: TSpeedButton;
      BtDelete: TSpeedButton;
      PnlFooter: TPanel;
      BtSair: TSpeedButton;
      procedure BtInsertClick(Sender: TObject);
      procedure BtUpdateClick(Sender: TObject);
      procedure BtDeleteClick(Sender: TObject);
      procedure BtLoadClick(Sender: TObject);
      procedure BtSairClick(Sender: TObject);
   private
      FData: TDate;
      FIDVendaItem: Int64;
      procedure SetData(const Value: TDate);
      procedure SetIDVendaItem(const Value: Int64);

      function GetData: TDate;
      function GetIDVendaItem: Int64;

      /// <summary>
      ///    Carrega as vendas do dia
      /// </summary>
      procedure LoadRecordsFromDataBase;

      /// <summary>
      ///    Limpa o grid
      /// </summary>
      procedure ClearGrid;
   strict private
      /// <summary>
      ///    Abre o form de abastecimento
      /// </summary>
      procedure OpenFormAbastecimento(const ATypeAction: TTypeAction);
   strict protected
      /// <summary>
      ///    Método de abertura do Form
      /// </summary>
      procedure OpeningForm; override;

      /// <summary>
      ///    Método de fechamento do Form
      /// </summary>
      procedure ClosingForm; override;
   public
      property Data: TDate read GetData write SetData;
      property IDVendaItem: Int64 read GetIDVendaItem write SetIDVendaItem;
   end;

var
  FrmAbastecimento: TFrmAbastecimento;

implementation

{$R *.dfm}

{ TFrmAbastecimento }

procedure TFrmAbastecimento.BtSairClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TFrmAbastecimento.ClearGrid;
begin
   if Assigned(DBGridRecords.DataSource) and Assigned(DBGridRecords.DataSource.DataSet) then
      DBGridRecords.DataSource.DataSet.Free;

   if Assigned(DBGridRecords.DataSource) then
      DBGridRecords.DataSource.Free;
end;

procedure TFrmAbastecimento.ClosingForm;
begin
   inherited;
   ClearGrid;
end;

function TFrmAbastecimento.GetData: TDate;
begin
   Result := EdtData.Date;
end;

function TFrmAbastecimento.GetIDVendaItem: Int64;
begin
   if Assigned(DBGridRecords.DataSource) then
      Result := DBGridRecords.DataSource.DataSet.FieldByName('ID').AsInteger
   else
      Result := 0;
end;

procedure TFrmAbastecimento.LoadRecordsFromDataBase;
var
   LDAO: TDAOVendaItem;
   LClientDataSet: TClientDataSet;
   LDataSource: TDataSource;
begin
   ClearGrid;

   LDAO := TDAOVendaItem.Create;
   try
      LClientDataSet := LDAO.GetDataSetToViewCustom(Data);

      if (LClientDataSet <> nil) then
      begin
         LDataSource := TDataSource.Create(nil);
         LDataSource.DataSet := LClientDataSet;
         DBGridRecords.DataSource := LDataSource;
      end;
   finally
      FreeAndNil(LDAO);
   end;
end;

procedure TFrmAbastecimento.OpenFormAbastecimento(const ATypeAction: TTypeAction);
var
   LForm: TFrmCadastroAbastecimento;
begin
   if (ATypeAction <> taInsert) and (IDVendaItem <= 0) then
      Exit;

   LForm := TFrmCadastroAbastecimento.Create(nil);
   try
      LForm.ID := IDVendaItem;
      LForm.TypeAction := ATypeAction;
      LForm.ShowModal;

      if (LForm.ResultAction = trConfirmed) then
         LoadRecordsFromDataBase;
   finally
      FreeAndNil(LForm);
   end;
end;

procedure TFrmAbastecimento.OpeningForm;
begin
   inherited;
   EdtData.Date := Now;
   LoadRecordsFromDataBase;
end;

procedure TFrmAbastecimento.SetData(const Value: TDate);
begin
   FData := Value;
end;

procedure TFrmAbastecimento.SetIDVendaItem(const Value: Int64);
begin
   FIDVendaItem := Value;
end;

procedure TFrmAbastecimento.BtInsertClick(Sender: TObject);
begin
   inherited;
   OpenFormAbastecimento(taInsert);
end;

procedure TFrmAbastecimento.BtLoadClick(Sender: TObject);
begin
   inherited;
   LoadRecordsFromDataBase;
end;

procedure TFrmAbastecimento.BtUpdateClick(Sender: TObject);
begin
   inherited;
   OpenFormAbastecimento(taUpdate);
end;

procedure TFrmAbastecimento.BtDeleteClick(Sender: TObject);
begin
   inherited;
   OpenFormAbastecimento(taDelete);
end;

end.
