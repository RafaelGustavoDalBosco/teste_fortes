{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.System.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.CategoryButtons, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Frm.Cadastro.Bomba, Frm.Cadastro.Tanque, Frm.CRUD.Combustivel, Frm.CRUD.Tanque,
  Frm.CRUD.Bomba, Frm.Cadastro.Abastecimento, Frm.Abastecimento, Vcl.WinXCtrls,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Frm.Cadastro.View, MidasLib;

type

   TFrmSystemMain = class(TFrmSystemAncestral)
      PnlToolBar: TPanel;
      ImgMenu: TImage;
      lblTitle: TLabel;
      SplitView: TSplitView;
      CategoryButtons: TCategoryButtons;
      procedure SplitViewClosed(Sender: TObject);
      procedure SplitViewOpened(Sender: TObject);
      procedure SplitViewOpening(Sender: TObject);
      procedure CategoryButtonsCategories0Items0Click(Sender: TObject);
      procedure CategoryButtonsCategories0Items1Click(Sender: TObject);
      procedure CategoryButtonsCategories0Items2Click(Sender: TObject);
      procedure ImgMenuClick(Sender: TObject);
   private
      /// <summary>
      ///    Controla a bertura do splitview
      /// </summary>
      procedure SplitViewOpen;
   end;

var
  FrmSystemMain: TFrmSystemMain;

implementation

{$R *.dfm}

procedure TFrmSystemMain.CategoryButtonsCategories0Items0Click(Sender: TObject);
var
   LForm: TFrmCadastrosView;
begin
   LForm := TFrmCadastrosView.Create(nil);
   try
      LForm.ShowModal;
   finally
      FreeAndNil(LForm);
   end;
end;

procedure TFrmSystemMain.CategoryButtonsCategories0Items1Click(Sender: TObject);
var
   LForm: TFrmAbastecimento;
begin
   LForm := TFrmAbastecimento.Create(nil);
   try
      LForm.ShowModal;
   finally
      FreeAndNil(LForm);
   end;

end;

procedure TFrmSystemMain.CategoryButtonsCategories0Items2Click(Sender: TObject);
begin
   inherited;
   Close;
end;

procedure TFrmSystemMain.ImgMenuClick(Sender: TObject);
begin
   inherited;
   if SplitView.Opened then
     SplitView.Close
   else
     SplitView.Open;
end;

procedure TFrmSystemMain.SplitViewClosed(Sender: TObject);
begin
   inherited;
   CategoryButtons.ButtonOptions := CategoryButtons.ButtonOptions - [boShowCaptions];
   if (SplitView.CloseStyle = svcCompact) then
      CategoryButtons.Width := SplitView.CompactWidth;
end;

procedure TFrmSystemMain.SplitViewOpen;
begin
   CategoryButtons.ButtonOptions := CategoryButtons.ButtonOptions + [boShowCaptions];
   CategoryButtons.Width := SplitView.OpenedWidth;
end;

procedure TFrmSystemMain.SplitViewOpened(Sender: TObject);
begin
   inherited;
   SplitViewOpen;
end;

procedure TFrmSystemMain.SplitViewOpening(Sender: TObject);
begin
   inherited;
   SplitViewOpen;
end;

end.
