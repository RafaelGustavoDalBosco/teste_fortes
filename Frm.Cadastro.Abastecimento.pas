{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.Cadastro.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.Cadastro,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, App.Objects.DAO, App.Objects.DTO,
  App.Common.Utils, System.Math, System.Generics.Collections, App.System.Types;

type

   TFrmCadastroAbastecimento = class(TFrmSystemAncestralCadastro)
      GrbCombustivel: TGroupBox;
      CbCombustivel: TComboBox;
      GrbPreco: TGroupBox;
      EdtPreco: TEdit;
      GrbQuantidade: TGroupBox;
      EdtQuantidade: TEdit;
      GrbTotal: TGroupBox;
      LblTotal: TLabel;
      GrbValorImposto: TGroupBox;
      LblValorImposto: TLabel;
      GrbTanque: TGroupBox;
      CbTanque: TComboBox;
      GrbBomba: TGroupBox;
      CbBomba: TComboBox;
      LblInfoImposto: TLabel;
      procedure CbCombustivelChange(Sender: TObject);
      procedure CbTanqueChange(Sender: TObject);
      procedure EdtQuantidadeChange(Sender: TObject);
   private
      FIdCombustivel: Int64;
      FIdBomba: Int64;
      FIdTanque: Int64;
      FPrecoVenda: Currency;
      FAliquotaImposto: Currency;
      FQuantidade: Currency;
      FValorImposto: Currency;
      FTotal: Currency;
      procedure SetIdBomba(const Value: Int64);
      procedure SetIdCombustivel(const Value: Int64);
      procedure SetIdTanque(const Value: Int64);
      procedure SetAliquotaImposto(const Value: Currency);
      procedure SetPrecoVenda(const Value: Currency);
      procedure SetQuantidade(const Value: Currency);
      procedure SetValorImposto(const Value: Currency);
      procedure SetTotal(const Value: Currency);

      function GetIdCombustivel: Int64;
      function GetIdTanque: Int64;
      function GetIdBomba: Int64;
      function GetQuantidade: Currency;
      function GetPrecoVenda: Currency;
      function GetValorImposto: Currency;
      function GetTotal: Currency;

      /// <summary>
      ///    Carrega os combustiveis no combobox
      /// </summary>
      procedure LoadCombustivelIntoComboBox;

      /// <summary>
      ///    Carrega os tanques no combobox
      /// </summary>
      procedure LoadTanqueIntoComboBox;

      /// <summary>
      ///    Carrega as bombas no combobox
      /// </summary>
      procedure LoadBombaIntoComboBox;

      /// <summary>
      ///    Carrega as informações do combustivel
      /// </summary>
      procedure LoadInformationCombustivel;

      /// <summary>
      ///    Calcula os totais
      /// </summary>
      procedure CalculaTotais;
   strict private
      /// <summary>
      ///    Obtém a quantidade sobrando no tanque
      /// </summary>
      function GetQuantidadeLeftTanque: Currency;

      /// <summary>
      ///    Valida a quantidade de litros no tanque
      /// </summary>
      function ValidateQuantidadeTanque: Boolean;
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
      property IdCombustivel: Int64 read GetIdCombustivel write SetIdCombustivel;
      property IdTanque: Int64 read GetIdTanque write SetIdTanque;
      property IdBomba: Int64 read GetIdBomba write SetIdBomba;
      property Quantidade: Currency read GetQuantidade write SetQuantidade;
      property PrecoVenda: Currency read GetPrecoVenda write SetPrecoVenda;
      property AliquotaImposto: Currency read FAliquotaImposto write SetAliquotaImposto;
      property ValorImposto: Currency read GetValorImposto write SetValorImposto;
      property Total: Currency read GetTotal write SetTotal;
  end;

var
  FrmCadastroAbastecimento: TFrmCadastroAbastecimento;

implementation

{$R *.dfm}

{ TFrmCadastroAbastecimento }

procedure TFrmCadastroAbastecimento.CalculaTotais;
var
   LTotal, LImposto: Currency;
begin
   if (Quantidade > 0) and (PrecoVenda > 0) then
   begin
      LTotal := SimpleRoundTo(Quantidade * PrecoVenda, -2);
      LImposto := SimpleRoundTo((LTotal / 100) * AliquotaImposto, -2);

      LblTotal.Caption := SysCon.CurrencyToMoneyStr(LTotal);
      LblValorImposto.Caption := SysCon.CurrencyToMoneyStr(LImposto);
   end
   else
   begin
      LblTotal.Caption := '0,00';
      LblValorImposto.Caption := '0,00';
   end;
end;

procedure TFrmCadastroAbastecimento.CbCombustivelChange(Sender: TObject);
begin
   inherited;
   if (IdCombustivel > 0) then
   begin
      CbTanque.ItemIndex := -1;
      CbBomba.ItemIndex := -1;
      CbTanque.Items.Clear;
      CbBomba.Items.Clear;

      CbTanque.Enabled := True;
      LoadTanqueIntoComboBox;
      CbTanqueChange(nil);
      LoadInformationCombustivel;
   end;
   CalculaTotais;
end;

procedure TFrmCadastroAbastecimento.CbTanqueChange(Sender: TObject);
begin
   inherited;
   CbBomba.ItemIndex := -1;

   if (IdTanque > 0) then
   begin
      CbBomba.Enabled := True;
      LoadBombaIntoComboBox;
   end;
end;

procedure TFrmCadastroAbastecimento.EdtQuantidadeChange(Sender: TObject);
begin
   inherited;
   CalculaTotais;
end;

function TFrmCadastroAbastecimento.GetClassOfDAO: TClass;
begin
   Result := TDAOVendaItem;
end;

function TFrmCadastroAbastecimento.GetClassOfDTO: TClass;
begin
   Result := TDTOVendaItem;
end;

function TFrmCadastroAbastecimento.GetGeneratorName: UnicodeString;
begin
   Result := 'GEN_VENDA_ITEM';
end;

function TFrmCadastroAbastecimento.GetIdBomba: Int64;
begin
   if CbBomba.ItemIndex > -1 then
      Result := Int64(CbBomba.Items.Objects[CbBomba.ItemIndex])
   else
      Result := -1;
end;

function TFrmCadastroAbastecimento.GetIdCombustivel: Int64;
begin
   if CbCombustivel.ItemIndex > -1 then
      Result := Int64(CbCombustivel.Items.Objects[CbCombustivel.ItemIndex])
   else
      Result := -1;
end;

function TFrmCadastroAbastecimento.GetIdTanque: Int64;
begin
   if CbTanque.ItemIndex > -1 then
      Result := Int64(CbTanque.Items.Objects[CbTanque.ItemIndex])
   else
      Result := -1;
end;

function TFrmCadastroAbastecimento.GetPrecoVenda: Currency;
begin
   Result := SysCon.StringToCurrency(EdtPreco.Text);
end;

function TFrmCadastroAbastecimento.GetQuantidade: Currency;
begin
   Result := SysCon.StringToCurrency(EdtQuantidade.Text);
end;

function TFrmCadastroAbastecimento.GetQuantidadeLeftTanque: Currency;
var
   LDAO: TDAOTanque;
   LDTO: TDTOTanque;
begin
   LDTO := TDTOTanque.Create;
   try
      LDTO.ID := IdTanque;
      LDAO := TDAOTanque.Create(LDTO);
      try
         LDTO := LDAO.Select as TDTOTanque; 

         Result := LDTO.Quantidade;
      finally
         FreeAndNil(LDAO);
      end;
   finally
      FreeAndNil(LDTO);
   end;
end;

function TFrmCadastroAbastecimento.GetTotal: Currency;
begin
   Result := SysCon.StringToCurrency(LblTotal.Caption);
end;

function TFrmCadastroAbastecimento.GetValorImposto: Currency;
begin
   Result := SysCon.StringToCurrency(LblValorImposto.Caption);
end;

procedure TFrmCadastroAbastecimento.LoadBombaIntoComboBox;
var
   LLoop: TCommonDataTransferObject;
   LDTO: TDTOBomba;
   LDAO: TDAOBomba;
   LList: TObjectList<TCommonDataTransferObject>;
begin
   CbBomba.Items.Clear;

   LDAO := TDAOBomba.Create;
   try
      LList := LDAO.List;

      CbBomba.Items.BeginUpdate;

      for LLoop in LList do
      begin
         LDTO := LLoop as TDTOBomba;

         if LDTO.IDTanque = IdTanque then
            CbBomba.Items.AddObject(LDTO.ID.ToString, TObject(LDTO.ID));
      end;

      if CbBomba.Items.Count = 1 then
         CbBomba.ItemIndex := 0;

      CbBomba.Items.EndUpdate;
   finally
      FreeAndNil(LDAO);
      FreeAndNil(LList);
   end;
end;

procedure TFrmCadastroAbastecimento.LoadCombustivelIntoComboBox;
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

procedure TFrmCadastroAbastecimento.LoadInformationCombustivel;
var
   LDAO: TDAOCombustivel;
   LDTO: TDTOCombustivel;
begin
   if (IdCombustivel > 0) then
   begin
      LDTO := TDTOCombustivel.Create;
      LDTO.ID := IdCombustivel;

      LDAO := TDAOCombustivel.Create(LDTO);
      try
         LDTO := LDAO.Select as TDTOCombustivel;

         AliquotaImposto := LDTO.AliquotaImposto;
         EdtPreco.Text := SysCon.CurrencyToMoneyStr(LDTO.PrecoVenda);

         if AliquotaImposto > 0 then
         begin
            LblInfoImposto.Caption := 'Atenção: será tributado o valor total em ' + SysCon.CurrencyToMoneyStr(AliquotaImposto) + '%';
            LblInfoImposto.Visible := True;
         end
         else
            LblInfoImposto.Visible := False;
      finally
         FreeAndNil(LDTO);
         FreeAndNil(LDAO);
      end;
   end
   else
      LblInfoImposto.Visible := False;
end;

procedure TFrmCadastroAbastecimento.LoadTanqueIntoComboBox;
var
   LLoop: TCommonDataTransferObject;
   LDTO: TDTOTanque;
   LDAO: TDAOTanque;
   LList: TObjectList<TCommonDataTransferObject>;
begin
   CbTanque.Items.Clear;

   LDAO := TDAOTanque.Create;
   try
      LList := LDAO.List;

      CbTanque.Items.BeginUpdate;

      for LLoop in LList do
      begin
         LDTO := LLoop as TDTOTanque;

         if LDTO.IDCombustivel = IdCombustivel then
            CbTanque.Items.AddObject(LDTO.ID.ToString, TObject(LDTO.ID));
      end;

      if CbTanque.Items.Count = 1 then
         CbTanque.ItemIndex := 0;

      CbTanque.Items.EndUpdate;
   finally
      FreeAndNil(LDAO);
      FreeAndNil(LList);
   end;
end;

procedure TFrmCadastroAbastecimento.OpeningForm;
begin
   LoadCombustivelIntoComboBox;
   inherited;
end;

procedure TFrmCadastroAbastecimento.SetAliquotaImposto(const Value: Currency);
begin
  FAliquotaImposto := Value;
end;

procedure TFrmCadastroAbastecimento.SetDTOFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   TDTOVendaItem(AObject).Data := Now;
   TDTOVendaItem(AObject).IDCombustivel := IdCombustivel;
   TDTOVendaItem(AObject).ValorImposto := ValorImposto;
   TDTOVendaItem(AObject).Valor := Total;
   TDTOVendaItem(AObject).Quantidade := Quantidade;
   TDTOVendaItem(AObject).PrecoVenda := PrecoVenda;
   TDTOVendaItem(AObject).IDBomba := IdBomba;
   TDTOVendaItem(AObject).IDTanque := IdTanque;
end;

procedure TFrmCadastroAbastecimento.SetFormFieldsValues(const AObject: TCommonDataTransferObject);
begin
   inherited;
   CbCombustivel.ItemIndex := CbCombustivel.Items.IndexOfObject(TObject(TDTOVendaItem(AObject).IDCombustivel));
   CbCombustivelChange(nil);
   CbTanque.ItemIndex := CbTanque.Items.IndexOfObject(TObject(TDTOVendaItem(AObject).IDTanque));
   CbBomba.ItemIndex := CbBomba.Items.IndexOfObject(TObject(TDTOVendaItem(AObject).IDBomba));
   EdtQuantidade.Text := SysCon.CurrencyToString(TDTOVendaItem(AObject).Quantidade);
   CalculaTotais;
end;

procedure TFrmCadastroAbastecimento.SetIdBomba(const Value: Int64);
begin
  FIdBomba := Value;
end;

procedure TFrmCadastroAbastecimento.SetIdCombustivel(const Value: Int64);
begin
  FIdCombustivel := Value;
end;

procedure TFrmCadastroAbastecimento.SetIdTanque(const Value: Int64);
begin
  FIdTanque := Value;
end;

procedure TFrmCadastroAbastecimento.SetPrecoVenda(const Value: Currency);
begin
  FPrecoVenda := Value;
end;

procedure TFrmCadastroAbastecimento.SetQuantidade(const Value: Currency);
begin
  FQuantidade := Value;
end;

procedure TFrmCadastroAbastecimento.SetTotal(const Value: Currency);
begin
   FTotal := Value;
end;

procedure TFrmCadastroAbastecimento.SetValorImposto(const Value: Currency);
begin
   FValorImposto := Value;
end;

function TFrmCadastroAbastecimento.Validate: Boolean;
begin
   if IdCombustivel <= 0 then
   begin
      SysComp.ShowWarnFocus(CbCombustivel, 'Combustível');
      Exit(False);
   end;

   if IdTanque <= 0 then
   begin
      SysComp.ShowWarnFocus(CbTanque, 'Tanque');
      Exit(False);
   end;

   if IdBomba <= 0 then
   begin
      SysComp.ShowWarnFocus(CbBomba, 'Bomba');
      Exit(False);
   end;

   if Quantidade <= 0 then
   begin
      SysComp.ShowWarnFocus(EdtQuantidade, 'Quantidade');
      Exit(False);
   end;

   if PrecoVenda <= 0 then
   begin
      SysComp.ShowWarnFocus(CbCombustivel, 'Preço');
      Exit(False);
   end;

   if (not ValidateQuantidadeTanque) then
   begin
      SysApp.ShowWarn('A quantidade disponível no Tanque está inferior a quantidade vendida!');
      SysComp.SetFocus(EdtQuantidade);
      Exit(False);
   end;

   Result := True;
end;

function TFrmCadastroAbastecimento.ValidateQuantidadeTanque: Boolean;
var
   LValueLeft: Currency;
begin
   LValueLeft := GetQuantidadeLeftTanque;

   Result := (Quantidade <= LValueLeft);
end;

end.
