{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.Cadastro.Bomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, App.Objects.DAO, App.Objects.DTO, System.Generics.Collections,
  App.Common.Utils;

type

   TFrmCadastroBomba = class(TFrmSystemAncestralCadastro)
      GrbTanque: TGroupBox;
      CbTanques: TComboBox;
   private
      FIdTanque: Int64;
      procedure SetIdTanque(const Value: Int64);
      function GetIdTanque: Int64;
      /// <summary>
      ///    Carrega os tanques cadastrados no combobox
      /// </summary>
      procedure LoadTanquesIntoComboBox;
   strict protected
      /// <summary>
      ///    Método Call Show
      /// </summary>
      procedure OpeningForm; override;

      /// <summary>
      ///    Obtém a classe do DTO
      /// </summary>
      function GetClassOfDTO: TClass; override;

      /// <summary>
      ///    Obtém a classe do DAO
      /// </summary>
      function GetClassOfDAO: TClass; override;

      /// <summary>
      ///    Valida as informações digitadas no form
      /// </summary>
      function Validate: Boolean; override;

      /// <summary>
      ///    Obtém o nome do generator
      /// </summary>
      function GetGeneratorName: UnicodeString; override;

      /// <summary>
      ///    Seta os valores do form no DTO
      /// </summary>
      procedure SetDTOFieldsValues(const AObject: TCommonDataTransferObject); override;

      /// <summary>
      ///    Seta os valores do DTP no FORM
      /// </summary>
      procedure SetFormFieldsValues(const AObject: TCommonDataTransferObject); override;
   public
      property IdTanque: Int64 read GetIdTanque write SetIdTanque;
   end;

var
  FrmCadastroBomba: TFrmCadastroBomba;

implementation

{$R *.dfm}

{ TFrmCadastroBomba }

function TFrmCadastroBomba.GetClassOfDAO: TClass;
begin
   Result := TDAOBomba;
end;

function TFrmCadastroBomba.GetClassOfDTO: TClass;
begin
   Result := TDTOBomba;
end;

function TFrmCadastroBomba.GetGeneratorName: UnicodeString;
begin
   Result := 'GEN_BOMBA';
end;

function TFrmCadastroBomba.GetIdTanque: Int64;
begin
   Result := Int64(CbTanques.Items.Objects[CbTanques.ItemIndex]);
end;

procedure TFrmCadastroBomba.LoadTanquesIntoComboBox;
var
   LDAO: TDAOTanque;
   LDTO: TDTOTanque;
   LLoop: TCommonDataTransferObject;
   LList: TObjectList<TCommonDataTransferObject>;
begin
   LDAO := TDAOTanque.Create;
   try
      LList := LDAO.List;

      CbTanques.Items.BeginUpdate;
      try
         for LLoop in LList do
         begin
            LDTO := LLoop as TDTOTanque;

            CbTanques.Items.AddObject(LDTO.ID.ToString + '-' + LDTO.DescricaoCombustivel, TObject(LDTO.ID));
         end;
      finally
         CbTanques.Items.EndUpdate;
      end;
   finally
      FreeAndNil(LList);
      FreeAndNil(LDAO);
   end;
end;

procedure TFrmCadastroBomba.OpeningForm;
begin
   LoadTanquesIntoComboBox;
   inherited;
end;

procedure TFrmCadastroBomba.SetDTOFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   TDTOBomba(AObject).IDTanque := IdTanque;
end;

procedure TFrmCadastroBomba.SetFormFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   CbTanques.ItemIndex := CbTanques.Items.IndexOfObject(TObject(AObject.ID));
end;

procedure TFrmCadastroBomba.SetIdTanque(const Value: Int64);
begin
   FIdTanque := Value;
end;

function TFrmCadastroBomba.Validate: Boolean;
begin
   if (CbTanques.ItemIndex < 0) then
   begin
      SysComp.ShowWarnFocus(CbTanques, 'Tanque');
      Exit(False);
   end;

   Result := True;
end;

end.
