inherited FrmCRUDCombustivel: TFrmCRUDCombustivel
  Caption = 'Combust'#237'veis'
  ClientWidth = 317
  ExplicitWidth = 321
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 317
    ExplicitWidth = 317
    inherited PnlUpper: TPanel
      Width = 317
      ExplicitWidth = 317
      inherited BtClose: TSpeedButton
        Left = 287
        ExplicitLeft = 287
      end
      inherited BtMinimize: TSpeedButton
        Left = 257
        ExplicitLeft = 257
      end
    end
    inherited GrbDados: TGroupBox
      Width = 313
      ExplicitWidth = 313
      inherited DBGridRecords: TDBGrid
        Width = 309
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 240
            Visible = True
          end>
      end
    end
    inherited PnlFooter: TPanel
      Width = 317
      ExplicitWidth = 317
      inherited BtSair: TSpeedButton
        Left = 231
        ExplicitLeft = 231
      end
    end
    inherited PnlActions: TPanel
      Width = 317
      ExplicitWidth = 317
      inherited BtInsert: TSpeedButton
        Left = 112
        ExplicitLeft = 112
      end
      inherited BtEditar: TSpeedButton
        Left = 178
        ExplicitLeft = 178
      end
      inherited BtExcluir: TSpeedButton
        Left = 246
        ExplicitLeft = 246
      end
    end
  end
end
