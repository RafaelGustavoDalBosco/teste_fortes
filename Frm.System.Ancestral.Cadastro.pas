{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.Ancestral.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, App.Common.Utils,
  App.Objects.DTO, App.System.Types, App.Objects.DAO, App.Consts.Common,
  App.Consts.Messages;

type

   TFrmSystemAncestralCadastro = class(TFrmSystemAncestral)
      PnlFooter: TPanel;
      BtConfirmar: TSpeedButton;
      BtSair: TSpeedButton;
      GrbID: TGroupBox;
      LblID: TLabel;
      PnlActionText: TPanel;
      procedure BtConfirmarClick(Sender: TObject);
      procedure BtSairClick(Sender: TObject);
   private
      FID: Int64;
      FTypeAction: TTypeAction;
      FResultAction: TTypeResult;
      procedure SetResultAction(const Value: TTypeResult);
      procedure SetID(const Value: Int64);
      procedure SetTypeAction(const Value: TTypeAction);

      function GetID: Int64;

      /// <summary>
      ///    Seta os valores do DTO padrão no form
      /// </summary>
      procedure SetValuesOnForm;
   strict private
      /// <summary>
      ///    Persiste as informações no DB
      /// </summary>
      procedure Persist;

      /// <summary>
      ///    Insere um novo registro
      /// </summary>
      procedure InsertRecord;

      /// <summary>
      ///    Atualiza um registro
      /// </summary>
      procedure UpdateRecord;

      /// <summary>
      ///    Exclui um registro
      /// </summary>
      procedure DeleteRecord;
   protected
      /// <summary>
      ///    Altera o form para se comportar de acordo com o modo selecionado
      /// </summary>
      procedure ShapeShiftForm;

      /// <summary>
      ///    Altera o Form para se comportar no modo INSERT
      /// </summary>
      procedure ShapeShiftOnInsert;

      /// <summary>
      ///    Altera o Form para se comportar no modo UPDATE
      /// </summary>
      procedure ShapeShiftOnUpdate;

      /// <summary>
      ///    Altera o form para se comportar no modo DELETE
      /// </summary>
      procedure ShapeShiftOnDelete;

      /// <summary>
      ///    Cria o DTO respectivo
      /// </summary>
      function CreateDTO: TCommonDataTransferObject;

      /// <summary>
      ///    Cria o DAO respectivo
      /// </summary>
      function CreateDAO(const ADTO: TCommonDataTransferObject): TCommonDataAcessObject;
   strict protected
      /// <summary>
      ///    Abre o FORM
      /// </summary>
      procedure OpeningForm; override;

      /// <summary>
      ///    Obtém o nome do generator
      /// </summary>
      function GetGeneratorName: UnicodeString; virtual; abstract;

      /// <summary>
      ///    Obtém a classe do DTO
      /// </summary>
      function GetClassOfDTO: TClass; virtual; abstract;

      /// <summary>
      ///    Obtém a classe do DAO
      /// </summary>
      function GetClassOfDAO: TClass; virtual; abstract;

      /// <summary>
      ///    Valida as informações digitadas no Form
      /// </summary>
      function Validate: Boolean; virtual; abstract;

      /// <summary>
      ///    Seta os dados do form no DTO
      /// </summary>
      procedure SetDTOFieldsValues(const AObject: TCommonDataTransferObject); virtual;

      /// <summary>
      ///    Seta os dados do DTO no form
      /// </summary>
      procedure SetFormFieldsValues(const AObject: TCommonDataTransferObject); virtual;
   public
      property ID: Int64 read GetID write SetID;
      property TypeAction: TTypeAction read FTypeAction write SetTypeAction;
      property ResultAction: TTypeResult read FResultAction write SetResultAction;
   end;

var
  FrmSystemAncestralCadastro: TFrmSystemAncestralCadastro;

implementation

{$R *.dfm}

{ TFrmSystemAncestralCadastro }

procedure TFrmSystemAncestralCadastro.BtConfirmarClick(Sender: TObject);
begin
   inherited;
   Persist;
end;

procedure TFrmSystemAncestralCadastro.BtSairClick(Sender: TObject);
begin
   inherited;
   ResultAction := trCanceled;
   Close;
end;

function TFrmSystemAncestralCadastro.CreateDAO(const ADTO: TCommonDataTransferObject): TCommonDataAcessObject;
begin
   Result := TCommonDataAcessObject(GetClassOfDAO.NewInstance).Create(ADTO);
end;

function TFrmSystemAncestralCadastro.CreateDTO: TCommonDataTransferObject;
begin
   Result := TCommonDataTransferObject(GetClassOfDTO.NewInstance).Create;
end;

procedure TFrmSystemAncestralCadastro.DeleteRecord;
var
   LDAO: TCommonDataAcessObject;
   LDTO: TCommonDataTransferObject;
begin
   LDTO := CreateDTO;
   try
      SetDTOFieldsValues(LDTO);
      LDAO := CreateDAO(LDTO);
      LDAO.Delete;
   finally
      FreeAndNil(LDTO);
      FreeAndNil(LDAO);
   end;
end;

function TFrmSystemAncestralCadastro.GetID: Int64;
begin
   Result := FID;
end;

procedure TFrmSystemAncestralCadastro.InsertRecord;
var
   LDAO: TCommonDataAcessObject;
   LDTO: TCommonDataTransferObject;
begin
   LDTO := CreateDTO;
   try
      SetDTOFieldsValues(LDTO);
      LDAO := CreateDAO(LDTO);
      LDAO.Insert;
   finally
      FreeAndNil(LDTO);
      FreeAndNil(LDAO);
   end;
end;

procedure TFrmSystemAncestralCadastro.OpeningForm;
begin
   inherited;
   ShapeShiftForm;
end;

procedure TFrmSystemAncestralCadastro.Persist;
begin
   if Validate and SysApp.ShowQuestion(SMessageConfirm) then
   begin
      case TypeAction of
         taInsert: InsertRecord;
         taUpdate: UpdateRecord;
         taDelete: DeleteRecord;
      end;

      ResultAction := trConfirmed;
      SysApp.ShowSucess(SMessageSucess);
      Self.Close;
   end;
end;

procedure TFrmSystemAncestralCadastro.SetDTOFieldsValues(const AObject: TCommonDataTransferObject);
begin
   AObject.ID := ID;
end;

procedure TFrmSystemAncestralCadastro.SetFormFieldsValues(const AObject: TCommonDataTransferObject);
begin
   LblID.Caption := SysCon.IntegerToString(AObject.ID);
end;

procedure TFrmSystemAncestralCadastro.SetID(const Value: Int64);
begin
   FID := Value;
end;

procedure TFrmSystemAncestralCadastro.SetResultAction(const Value: TTypeResult);
begin
   FResultAction := Value;
end;

procedure TFrmSystemAncestralCadastro.SetTypeAction(const Value: TTypeAction);
begin
   FTypeAction := Value;
end;

procedure TFrmSystemAncestralCadastro.SetValuesOnForm;
var
   LDTO: TCommonDataTransferObject;
   LDAO: TCommonDataAcessObject;
begin
   LDTO := CreateDTO;
   LDTO.ID := ID;
   LDAO := CreateDAO(LDTO);
   try
      LDTO := LDAO.Select as TCommonDataTransferObject;
      SetFormFieldsValues(LDTO);
   finally
      FreeAndNil(LDAO);
      FreeAndNil(LDTO);
   end;
end;

procedure TFrmSystemAncestralCadastro.ShapeShiftForm;
begin
   case TypeAction of
      taInsert: ShapeShiftOnInsert;
      taUpdate: ShapeShiftOnUpdate;
      taDelete: ShapeShiftOnDelete;
   end;
end;

procedure TFrmSystemAncestralCadastro.ShapeShiftOnDelete;
begin
   PnlActionText.Caption := 'EXCLUIR';
   PnlActionText.Color := clWebOrangeRed;
   SetValuesOnForm;
   SysFrm.ReadOnlyForm(Self, True);
end;

procedure TFrmSystemAncestralCadastro.ShapeShiftOnInsert;
begin
   LblID.Caption := SysDB.GetNextValueFromGenerator(GetGeneratorName).ToString;
   PnlActionText.Caption := 'INCLUIR';
   PnlActionText.Color := clWebGreen;
end;

procedure TFrmSystemAncestralCadastro.ShapeShiftOnUpdate;
begin
   PnlActionText.Caption := 'EDITAR';
   PnlActionText.Color := clWebOrange;
   SetValuesOnForm;
end;

procedure TFrmSystemAncestralCadastro.UpdateRecord;
var
   LDAO: TCommonDataAcessObject;
   LDTO: TCommonDataTransferObject;
begin
   LDTO := CreateDTO;
   try
      SetDTOFieldsValues(LDTO);
      LDAO := CreateDAO(LDTO);
      LDAO.Update;
   finally
      FreeAndNil(LDTO);
      FreeAndNil(LDAO);
   end;
end;

end.
