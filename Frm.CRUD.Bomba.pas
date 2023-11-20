{=====================================================}
{          Developer: Rafael Gustavo Dal Bosco        }
{           2023 - All Rights Reserved  ™ ®           }
{=====================================================}
unit Frm.CRUD.Bomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frm.System.Ancestral.CRUD, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  App.Objects.DAO, Frm.Cadastro.Bomba;

type

  TFrmCRUDBombas = class(TFrmSystemAncestralCRUD)
  strict protected
      /// <summary>
      ///    Obtém a Classe de DAO
      /// </summary>
      function GetClassOfDAO: TClass; override;

      /// <summary>
      ///    Obtém a classe de Form
      /// </summary>
      function GetClassOfForm: TClass; override;
  end;

var
  FrmCRUDBombas: TFrmCRUDBombas;

implementation

{$R *.dfm}

{ TFrmCRUDBombas }

function TFrmCRUDBombas.GetClassOfDAO: TClass;
begin
   Result := TDAOBomba;
end;

function TFrmCRUDBombas.GetClassOfForm: TClass;
begin
   Result := TFrmCadastroBomba;
end;

end.
