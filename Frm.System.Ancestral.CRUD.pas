{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.Ancestral.CRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, App.Objects.DTO,
  App.Objects.DAO, System.Generics.Collections, DataSnap.DBClient,
  App.System.Types, Frm.System.Ancestral.Cadastro;

type

   TFrmSystemAncestralCRUD = class(TFrmSystemAncestral)
      GrbDados: TGroupBox;
      DBGridRecords: TDBGrid;
      PnlFooter: TPanel;
      BtSair: TSpeedButton;
      PnlActions: TPanel;
      BtInsert: TSpeedButton;
      BtEditar: TSpeedButton;
      BtExcluir: TSpeedButton;
      procedure DBGridRecordsDblClick(Sender: TObject);
      procedure BtSairClick(Sender: TObject);
      procedure BtInsertClick(Sender: TObject);
      procedure BtEditarClick(Sender: TObject);
      procedure BtExcluirClick(Sender: TObject);
   private
      /// <summary>
      ///    Carrega os registros do banco de dados
      /// </summary>
      procedure LoadRecordsFromDataBase;

      /// <summary>
      ///    Limpa as informações do grid
      /// </summary>
      procedure ClearGrid;

      /// <summary>
      ///    Abre o form de acordo com o tipo de ação
      /// </summary>
      procedure OpenFormFromType(const ATypeAction: TTypeAction; const ASelectedID: Int64);
   strict protected
      /// <summary>
      ///    Abertura do Form
      /// </summary>
      procedure OpeningForm; override;

      /// <summary>
      ///    Fechamento do Form
      /// </summary>
      procedure ClosingForm; override;

      /// <summary>
      ///    Obtém a Classe de DAO
      /// </summary>
      function GetClassOfDAO: TClass; virtual; abstract;

      /// <summary>
      ///    Obtém a classe de Form
      /// </summary>
      function GetClassOfForm: TClass; virtual; abstract;
   public
      function GetSelectedID: Int64;
   end;

var
  FrmSystemAncestralCRUD: TFrmSystemAncestralCRUD;

implementation

{$R *.dfm}

{ TFrmSystemAncestralCRUD }

procedure TFrmSystemAncestralCRUD.BtEditarClick(Sender: TObject);
begin
   inherited;
   OpenFormFromType(taUpdate, GetSelectedID);
end;

procedure TFrmSystemAncestralCRUD.BtExcluirClick(Sender: TObject);
begin
   inherited;
   OpenFormFromType(taDelete, GetSelectedID);
end;

procedure TFrmSystemAncestralCRUD.BtInsertClick(Sender: TObject);
begin
   inherited;
   OpenFormFromType(taInsert, GetSelectedID);
end;

procedure TFrmSystemAncestralCRUD.BtSairClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TFrmSystemAncestralCRUD.ClearGrid;
begin
   if Assigned(DBGridRecords.DataSource) and Assigned(DBGridRecords.DataSource.DataSet) then
      DBGridRecords.DataSource.DataSet.Free;

   if Assigned(DBGridRecords.DataSource) then
      DBGridRecords.DataSource.Free;
end;

procedure TFrmSystemAncestralCRUD.ClosingForm;
begin
   inherited;
   ClearGrid;
end;

procedure TFrmSystemAncestralCRUD.DBGridRecordsDblClick(Sender: TObject);
begin
   inherited;
   OpenFormFromType(taUpdate, GetSelectedID);
end;

function TFrmSystemAncestralCRUD.GetSelectedID: Int64;
begin
   if Assigned(DBGridRecords.DataSource) then
      Result := DBGridRecords.DataSource.DataSet.FieldByName('ID').AsInteger
   else
      Result := 0;
end;

procedure TFrmSystemAncestralCRUD.LoadRecordsFromDataBase;
var
   LDAO: TCommonDataAcessObject;
   LClientDataSet: TClientDataSet;
   LDataSource: TDataSource;
begin
   ClearGrid;

   LDAO := TCommonDataAcessObject(GetClassOfDAO.NewInstance);
   try
      LClientDataSet := LDAO.GetDataSetToView;

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

procedure TFrmSystemAncestralCRUD.OpenFormFromType(const ATypeAction: TTypeAction; const ASelectedID: Int64);
var
   LForm: TFrmSystemAncestralCadastro;
begin
   if (ATypeAction <> taInsert) and (ASelectedID <= 0) then
      Exit;

   LForm := TFrmSystemAncestralCadastro(GetClassOfForm.NewInstance).Create(nil);
   try
      LForm.ID := ASelectedID;
      LForm.TypeAction := ATypeAction;
      LForm.ShowModal;

      if LForm.ResultAction = trConfirmed then
         LoadRecordsFromDataBase;
   finally
      FreeAndNil(LForm);
   end;
end;

procedure TFrmSystemAncestralCRUD.OpeningForm;
begin
   inherited;
   LoadRecordsFromDataBase;
end;

end.
