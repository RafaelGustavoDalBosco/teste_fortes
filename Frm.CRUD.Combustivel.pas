{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.CRUD.Combustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.CRUD, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  App.Objects.DAO, Frm.Cadastro.Combustivel;

type

   TFrmCRUDCombustivel = class(TFrmSystemAncestralCRUD)
   strict protected
      function GetClassOfDAO: TClass; override;
      function GetClassOfForm: TClass; override;
   end;

var
  FrmCRUDCombustivel: TFrmCRUDCombustivel;

implementation

{$R *.dfm}

{ TFrmCRUDCombustivel }

function TFrmCRUDCombustivel.GetClassOfDAO: TClass;
begin
   Result := TDAOCombustivel;
end;

function TFrmCRUDCombustivel.GetClassOfForm: TClass;
begin
   Result := TFrmCadastroCombustivel;
end;

end.
