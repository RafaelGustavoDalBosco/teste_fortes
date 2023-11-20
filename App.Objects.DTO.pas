{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit App.Objects.DTO;

interface

uses
   System.SysUtils, System.Generics.Collections;

type

   TCommonDataTransferObject = class
   strict private
      FID: Int64;
      procedure SetID(const Value: Int64);
   public
      property ID: Int64 read FID write SetID;
   end;

   TDTOBomba = class(TCommonDataTransferObject)
   strict private
      FIDTanque: Int64;
      procedure SetIDTanque(const Value: Int64);
   public
      property IDTanque: Int64 read FIDTanque write SetIDTanque;
   end;

   TDTOTanque = class(TCommonDataTransferObject)
   strict private
      FIDCombustivel: Int64;
      FQuantidade: Currency;
      FListBombas: TList<TDTOBomba>;
      FDescricaoCombustivel: UnicodeString;
      procedure SetDescricaoCombustivel(const Value: UnicodeString);
      procedure SetIDCombustivel(const Value: Int64);
      procedure SetQuantidade(const Value: Currency);
      procedure SetListBombas(const Value: TList<TDTOBomba>);
   public
      property IDCombustivel: Int64 read FIDCombustivel write SetIDCombustivel;
      property DescricaoCombustivel: UnicodeString read FDescricaoCombustivel write SetDescricaoCombustivel;
      property Quantidade: Currency read FQuantidade write SetQuantidade;
      property ListBombas: TList<TDTOBomba> read FListBombas write SetListBombas;
   end;

   TDTOCombustivel = class(TCommonDataTransferObject)
   strict private
      FDescricao: UnicodeString;
      FAliquotaImposto: Currency;
      FPrecoVenda: Currency;
      procedure SetPrecoVenda(const Value: Currency);
      procedure SetDescricao(const Value: UnicodeString);
      procedure SetAliquotaImposto(const Value: Currency);
   public
      property Descricao: UnicodeString read FDescricao write SetDescricao;
      property PrecoVenda: Currency read FPrecoVenda write SetPrecoVenda;
      property AliquotaImposto: Currency read FAliquotaImposto write SetAliquotaImposto;
   end;

   TDTOVendaItem = class(TCommonDataTransferObject)
   strict private
      FIDCombustivel: Int64;
      FValorImposto: Currency;
      FValor: Currency;
      FQuantidade: Currency;
      FPrecoVenda: Currency;
      FIDBomba: Int64;
      FIDTanque: Int64;
      FData: TDate;
      procedure SetData(const Value: TDate);
      procedure SetIDBomba(const Value: Int64);
      procedure SetIDTanque(const Value: Int64);
      procedure SetPrecoVenda(const Value: Currency);
      procedure SetIDCombustivel(const Value: Int64);
      procedure SetQuantidade(const Value: Currency);
      procedure SetValor(const Value: Currency);
      procedure SetValorImposto(const Value: Currency);
   public
      property Data: TDate read FData write SetData;
      property IDCombustivel: Int64 read FIDCombustivel write SetIDCombustivel;
      property IDTanque: Int64 read FIDTanque write SetIDTanque;
      property IDBomba: Int64 read FIDBomba write SetIDBomba;
      property ValorImposto: Currency read FValorImposto write SetValorImposto;
      property Valor: Currency read FValor write SetValor;
      property Quantidade: Currency read FQuantidade write SetQuantidade;
      property PrecoVenda: Currency read FPrecoVenda write SetPrecoVenda;
   end;


implementation

{ TDTOCombustivel }

procedure TDTOCombustivel.SetAliquotaImposto(const Value: Currency);
begin
   FAliquotaImposto := Value;
end;

procedure TDTOCombustivel.SetDescricao(const Value: UnicodeString);
begin
   FDescricao := Value;
end;

procedure TDTOCombustivel.SetPrecoVenda(const Value: Currency);
begin
  FPrecoVenda := Value;
end;

{ TCommonDataTransferObject }

procedure TCommonDataTransferObject.SetID(const Value: Int64);
begin
   FID := Value;
end;

{ TDTOTanque }

procedure TDTOTanque.SetDescricaoCombustivel(const Value: UnicodeString);
begin
   FDescricaoCombustivel := Value;
end;

procedure TDTOTanque.SetIDCombustivel(const Value: Int64);
begin
   FIDCombustivel := Value;
end;

procedure TDTOTanque.SetListBombas(const Value: TList<TDTOBomba>);
begin
   FListBombas := Value;
end;

procedure TDTOTanque.SetQuantidade(const Value: Currency);
begin
   FQuantidade := Value;
end;

{ TDTOBomba }

procedure TDTOBomba.SetIDTanque(const Value: Int64);
begin
   FIDTanque := Value;
end;

{ TDTOVendaItem }

procedure TDTOVendaItem.SetData(const Value: TDate);
begin
   FData := Value;
end;

procedure TDTOVendaItem.SetIDBomba(const Value: Int64);
begin
   FIDBomba := Value;
end;

procedure TDTOVendaItem.SetIDCombustivel(const Value: Int64);
begin
   FIDCombustivel := Value;
end;

procedure TDTOVendaItem.SetIDTanque(const Value: Int64);
begin
   FIDTanque := Value;
end;

procedure TDTOVendaItem.SetPrecoVenda(const Value: Currency);
begin
   FPrecoVenda := Value;
end;

procedure TDTOVendaItem.SetQuantidade(const Value: Currency);
begin
   FQuantidade := Value;
end;

procedure TDTOVendaItem.SetValor(const Value: Currency);
begin
   FValor := Value;
end;

procedure TDTOVendaItem.SetValorImposto(const Value: Currency);
begin
   FValorImposto := Value;
end;

end.
