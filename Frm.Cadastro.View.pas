{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.Cadastro.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, Vcl.Buttons,
  Vcl.ExtCtrls, Frm.CRUD.Bomba, Frm.CRUD.Combustivel, Frm.CRUD.Tanque;

type

   TFrmCadastrosView = class(TFrmSystemAncestral)
      BtOpenCRUDCombustivel: TSpeedButton;
      BtOpenCRUDBomba: TSpeedButton;
      BtOpenCRUDTanque: TSpeedButton;
      PnlFooter: TPanel;
      BtSair: TSpeedButton;
      procedure BtSairClick(Sender: TObject);
      procedure BtOpenCRUDCombustivelClick(Sender: TObject);
      procedure BtOpenCRUDTanqueClick(Sender: TObject);
      procedure BtOpenCRUDBombaClick(Sender: TObject);
   private
      /// <summary>
      ///    Abre o CRUD de combustivel
      /// </summary>
      procedure OpenCRUDCombustivel;

      /// <summary>
      ///    Abre o CRUD de Tanque
      /// </summary>
      procedure OpenCRUDTanque;

      /// <summary>
      ///   Abre o CRUD de Bomba
      /// </summary>
      procedure OpenCRUDBomba;
   end;

var
  FrmCadastrosView: TFrmCadastrosView;

implementation

{$R *.dfm}

procedure TFrmCadastrosView.BtOpenCRUDBombaClick(Sender: TObject);
begin
   inherited;
   OpenCRUDBomba;
end;

procedure TFrmCadastrosView.BtOpenCRUDCombustivelClick(Sender: TObject);
begin
   inherited;
   OpenCRUDCombustivel;
end;

procedure TFrmCadastrosView.BtOpenCRUDTanqueClick(Sender: TObject);
begin
   inherited;
   OpenCRUDTanque;
end;

procedure TFrmCadastrosView.BtSairClick(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TFrmCadastrosView.OpenCRUDBomba;
var
   LForm: TFrmCRUDBombas;
begin
   LForm := TFrmCRUDBombas.Create(nil);
   try
      LForm.ShowModal;
   finally
      FreeAndNil(LForm);
   end;
end;

procedure TFrmCadastrosView.OpenCRUDCombustivel;
var
   LForm: TFrmCRUDCombustivel;
begin
   LForm := TFrmCRUDCombustivel.Create(nil);
   try
      LForm.ShowModal;
   finally
      FreeAndNil(LForm);
   end;
end;

procedure TFrmCadastrosView.OpenCRUDTanque;
var
   LForm: TFrmCRUDTanques;
begin
   LForm := TFrmCRUDTanques.Create(nil);
   try
      LForm.ShowModal;
   finally
      FreeAndNil(LForm);
   end;
end;

end.
