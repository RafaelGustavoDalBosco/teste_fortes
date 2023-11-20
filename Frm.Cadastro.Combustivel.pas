{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.Cadastro.Combustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, App.Objects.DTO,
  App.Common.Utils, App.Objects.DAO;

type

   TFrmCadastroCombustivel = class(TFrmSystemAncestralCadastro)
      GrbDescricao: TGroupBox;
      EdtDescricao: TEdit;
      GrbAliquotaImposto: TGroupBox;
      GrbPrecoVenda: TGroupBox;
      EdtPrecoVenda: TEdit;
      EdtAliquotaImposto: TEdit;
      procedure EdtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
      procedure EdtAliquotaImpostoKeyPress(Sender: TObject; var Key: Char);
      procedure EdtPrecoVendaExit(Sender: TObject);
      procedure EdtAliquotaImpostoExit(Sender: TObject);
   private
      FDescricao: UnicodeString;
      FAliquotaImposto: Currency;
      FPrecoVenda: Currency;
      procedure SetAliquotaImposto(const Value: Currency);
      procedure SetDescricao(const Value: UnicodeString);
      procedure SetPrecoVenda(const Value: Currency);

      function GetDescricao: UnicodeString;
      function GetAliquotaImposto: Currency;
      function GetPrecoVenda: Currency;
   strict protected
      /// <summary>
      ///    Obtém o nome do generator
      /// </summary>
      function GetGeneratorName: UnicodeString; override;

      /// <summary>
      ///    Obtém a classe do DTO
      /// </summary>
      function GetClassOfDTO: TClass; override;

      /// <summary>
      ///    Obtém a classe do DAO
      /// </summary>
      function GetClassOfDAO: TClass; override;

      /// <summary>
      ///    Valida as informações digitadas no Form
      /// </summary>
      function Validate: Boolean; override;

      /// <summary>
      ///    Seta os dados do form no DTO
      /// </summary>
      procedure SetDTOFieldsValues(const AObject: TCommonDataTransferObject); override;

      /// <summary>
      ///    Seta os dados do DTO no form
      /// </summary>
      procedure SetFormFieldsValues(const AObject: TCommonDataTransferObject); override;
   public
      property Descricao: UnicodeString read GetDescricao write SetDescricao;
      property AliquotaImposto: Currency read GetAliquotaImposto write SetAliquotaImposto;
      property PrecoVenda: Currency read GetPrecoVenda write SetPrecoVenda;
   end;

var
  FrmCadastroCombustivel: TFrmCadastroCombustivel;

implementation

{$R *.dfm}

{ TFrmCadastroCombustivel }

procedure TFrmCadastroCombustivel.EdtAliquotaImpostoExit(Sender: TObject);
begin
   inherited;
   EdtAliquotaImposto.Text := FormatFloat('#.00', AliquotaImposto);
end;

procedure TFrmCadastroCombustivel.EdtAliquotaImpostoKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   SysComp.KeyPressToCurr(Key);
end;

procedure TFrmCadastroCombustivel.EdtPrecoVendaExit(Sender: TObject);
begin
   inherited;
   EdtPrecoVenda.Text := FormatFloat('#.00', PrecoVenda);
end;

procedure TFrmCadastroCombustivel.EdtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   SysComp.KeyPressToCurr(Key);
end;

function TFrmCadastroCombustivel.GetAliquotaImposto: Currency;
begin
   Result := SysCon.StringToCurrency(EdtAliquotaImposto.Text);
end;

function TFrmCadastroCombustivel.GetClassOfDAO: TClass;
begin
   Result := TDAOCombustivel;
end;

function TFrmCadastroCombustivel.GetClassOfDTO: TClass;
begin
   Result := TDTOCombustivel;
end;
function TFrmCadastroCombustivel.GetDescricao: UnicodeString;
begin
   Result := EdtDescricao.Text;
end;

function TFrmCadastroCombustivel.GetGeneratorName: UnicodeString;
begin
   Result := 'GEN_COMBUSTIVEL';
end;

function TFrmCadastroCombustivel.GetPrecoVenda: Currency;
begin
   Result := SysCon.StringToCurrency(EdtPrecoVenda.Text);
end;

procedure TFrmCadastroCombustivel.SetAliquotaImposto(const Value: Currency);
begin
  FAliquotaImposto := Value;
end;

procedure TFrmCadastroCombustivel.SetDescricao(const Value: UnicodeString);
begin
  FDescricao := Value;
end;

procedure TFrmCadastroCombustivel.SetDTOFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   TDTOCombustivel(AObject).Descricao := Descricao;
   TDTOCombustivel(AObject).AliquotaImposto := AliquotaImposto;
   TDTOCombustivel(AObject).PrecoVenda := PrecoVenda;
end;

procedure TFrmCadastroCombustivel.SetFormFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   EdtDescricao.Text := TDTOCombustivel(AObject).Descricao;
   EdtAliquotaImposto.Text := SysCon.CurrencyToMoneyStr(TDTOCombustivel(AObject).AliquotaImposto);
   EdtPrecoVenda.Text := SysCon.CurrencyToMoneyStr(TDTOCombustivel(AObject).PrecoVenda);
end;

procedure TFrmCadastroCombustivel.SetPrecoVenda(const Value: Currency);
begin
   FPrecoVenda := Value;
end;

function TFrmCadastroCombustivel.Validate: Boolean;
begin
   if Descricao.IsEmpty then
   begin
      SysComp.ShowWarnFocus(EdtDescricao, 'Descrição');
      Exit(False);
   end;

   if AliquotaImposto <= 0 then
   begin
      SysComp.ShowWarnFocus(EdtAliquotaImposto, 'Alíquota Imposto');
      Exit(False);
   end;

   if PrecoVenda <= 0 then
   begin
      SysComp.ShowWarnFocus(EdtPrecoVenda, 'Preço Venda');
      Exit(False);
   end;

   if (AliquotaImposto > 100.00) then
   begin
      SysApp.ShowWarn('O valor máximo de Alíquota é 100,00 %');
      SysComp.SetFocus(EdtAliquotaImposto);
      Exit(False);
   end;

   Result := True;
end;

end.
