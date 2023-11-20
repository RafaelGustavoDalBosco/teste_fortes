{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.Ancestral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, App.Common.Utils,
  App.Consts.Common;

type

   TFrmSystemAncestral = class(TForm)
      PnlMain: TPanel;
      PnlUpper: TPanel;
      BtClose: TSpeedButton;
      BtMinimize: TSpeedButton;
      procedure PnlUpperMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtCloseClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure BtMinimizeClick(Sender: TObject);
   protected
      /// <summary>
      ///    Controla a digitação da tecla Alt para os atalhos
      /// </summary>
      procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;

      /// <summary>
      ///    Envia o comando para manipular a posição do Form
      /// </summary>
      procedure SendSystemCommand(const ACommand: Integer);
   strict protected
      /// <summary>
      ///    Método Call Show
      /// </summary>
      procedure OpeningForm; virtual;

      /// <summary>
      ///    Método Call Create
      /// </summary>
      procedure CreatingForm; virtual;

      /// <summary>
      ///    Método Call Close
      /// </summary>
      procedure ClosingForm; virtual;
   public
   end;

var
  FrmSystemAncestral: TFrmSystemAncestral;

implementation

{$R *.dfm}

{ TFrmSystemAncestral }

procedure TFrmSystemAncestral.ClosingForm;
begin
   // -> Cada descendente pode ter suas implementações
end;

procedure TFrmSystemAncestral.CMDialogChar(var Message: TCMDialogChar);
begin
   if (ssAlt in KeyDataToShiftState(Message.KeyData)) then
      inherited;
end;

procedure TFrmSystemAncestral.CreatingForm;
begin
  // -> Cada descendente pode ter suas implementações
end;

procedure TFrmSystemAncestral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ClosingForm;
   inherited;
end;

procedure TFrmSystemAncestral.FormCreate(Sender: TObject);
begin
   CreatingForm;
   inherited;
end;

procedure TFrmSystemAncestral.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
   begin
      if SysApp.ShowQuestion('Deseja fechar a tela?') then
         Close;
   end;

   inherited;
end;

procedure TFrmSystemAncestral.FormShow(Sender: TObject);
begin
   inherited;
   PnlUpper.Caption := Caption;
   PnlUpper.Color := DefaultMainColor;
   OpeningForm;
end;

procedure TFrmSystemAncestral.OpeningForm;
begin
  // -> Cada descendente pode ter suas implementações
end;

procedure TFrmSystemAncestral.PnlUpperMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   ReleaseCapture;
   BringToFront;
   SendSystemCommand($F012);
end;

procedure TFrmSystemAncestral.SendSystemCommand(const ACommand: Integer);
begin
   Perform(WM_SYSCOMMAND, ACommand, 0);

   if Assigned(Parent) then
      Parent.Repaint;
end;

procedure TFrmSystemAncestral.BtCloseClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFrmSystemAncestral.BtMinimizeClick(Sender: TObject);
begin
   Self.WindowState := wsMinimized;
end;

end.
