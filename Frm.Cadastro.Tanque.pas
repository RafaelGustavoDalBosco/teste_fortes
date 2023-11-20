{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.Cadastro.Tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, App.Objects.DAO, App.Objects.DTO, System.Generics.Collections,
  App.Common.Utils;

type

   TFrmCadastroTanque = class(TFrmSystemAncestralCadastro)
      GrbCombustivel: TGroupBox;
      CbCombustivel: TComboBox;
      GrbQuantidade: TGroupBox;
      EdtQuantidade: TEdit;
   private
      FIdCombustivel: Int64;
      FQuantidade: Currency;
      procedure SetIdCombustivel(const Value: Int64);
      procedure SetQuantidade(const Value: Currency);

      function GetIdCombustivel: Int64;
      function GetQuantidade: Currency;

      /// <summary>
      ///    Carrega os tanques cadastrados no combobox
      /// </summary>
      procedure LoadCombustiveisIntoComboBox;

      /// <summary>
      ///    Obtém a descrição do combustivel
      /// </summary>
      function GetDescricaoCombustivel: UnicodeString;
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
      ///    Obtem o nome do generator
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
      property IdCombustivel: Int64 read GetIdCombustivel write SetIdCombustivel;
      property Quantidade: Currency read GetQuantidade write SetQuantidade;
   end;

var
  FrmCadastroTanque: TFrmCadastroTanque;

implementation

{$R *.dfm}

{ TFrmCadastroTanque }

function TFrmCadastroTanque.GetClassOfDAO: TClass;
begin
   Result := TDAOTanque;
end;

function TFrmCadastroTanque.GetClassOfDTO: TClass;
begin
   Result := TDTOTanque;
end;

function TFrmCadastroTanque.GetDescricaoCombustivel: UnicodeString;
var
   LDAO: TDAOCombustivel;
   LDTO: TDTOCombustivel;
begin
   LDTO := TDTOCombustivel.Create;
   LDTO.ID := IdCombustivel;

   LDAO := TDAOCombustivel.Create(LDTO);
   try
      LDTO := LDAO.Select as TDTOCombustivel;
      Result := LDTO.Descricao;
   finally
      FreeAndNil(LDTO);
      FreeAndNil(LDAO);
   end;
end;

function TFrmCadastroTanque.GetGeneratorName: UnicodeString;
begin
   Result := 'GEN_TANQUE';
end;

function TFrmCadastroTanque.GetIdCombustivel: Int64;
begin
   Result := Int64(CbCombustivel.Items.Objects[CbCombustivel.ItemIndex]);
end;

function TFrmCadastroTanque.GetQuantidade: Currency;
begin
   Result := SysCon.StringToCurrency(EdtQuantidade.Text);
end;

procedure TFrmCadastroTanque.LoadCombustiveisIntoComboBox;
var
   LDAO: TDAOCombustivel;
   LDTO: TDTOCombustivel;
   LLoop: TCommonDataTransferObject;
   LList: TObjectList<TCommonDataTransferObject>;
begin
   LDAO := TDAOCombustivel.Create;
   try
      LList := LDAO.List;

      CbCombustivel.Items.BeginUpdate;
      try
         for LLoop in LList do
         begin
            LDTO := LLoop as TDTOCombustivel;

            CbCombustivel.Items.AddObject(LDTO.ID.ToString + '-' + LDTO.Descricao, TObject(LDTO.ID));
         end;
      finally
         CbCombustivel.Items.EndUpdate;
      end;
   finally
      FreeAndNil(LList);
      FreeAndNil(LDAO);
   end;
end;

procedure TFrmCadastroTanque.OpeningForm;
begin
   LoadCombustiveisIntoComboBox;
   inherited;
end;

procedure TFrmCadastroTanque.SetDTOFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   TDTOTanque(AObject).IDCombustivel := IdCombustivel;
   TDTOTanque(AObject).Quantidade := Quantidade;
   TDTOTanque(AObject).DescricaoCombustivel := GetDescricaoCombustivel;
end;

procedure TFrmCadastroTanque.SetFormFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   CbCombustivel.ItemIndex := CbCombustivel.Items.IndexOfObject(TObject(TDTOTanque(AObject).IDCombustivel));
   EdtQuantidade.Text := SysCon.CurrencyToString(TDTOTanque(AObject).Quantidade);
end;

procedure TFrmCadastroTanque.SetIdCombustivel(const Value: Int64);
begin
   FIdCombustivel := Value;
end;

procedure TFrmCadastroTanque.SetQuantidade(const Value: Currency);
begin
   FQuantidade := Value;
end;

function TFrmCadastroTanque.Validate: Boolean;
begin
   if IdCombustivel <= 0 then
   begin
      SysComp.ShowWarnFocus(CbCombustivel, 'Combustível');
      Exit(False);
   end;

   if Quantidade <= 0 then
   begin
      SysComp.ShowWarnFocus(EdtQuantidade, 'Quantidade');
      Exit(False);
   end;

   Result := True;
end;

end.
