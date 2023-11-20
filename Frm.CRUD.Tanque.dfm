inherited FrmCRUDTanques: TFrmCRUDTanques
  Caption = 'Tanques'
  ClientHeight = 276
  ClientWidth = 242
  ExplicitWidth = 246
  ExplicitHeight = 280
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 242
    Height = 276
    inherited PnlUpper: TPanel
      Width = 242
      inherited BtClose: TSpeedButton
        Left = 212
        ExplicitLeft = 212
      end
      inherited BtMinimize: TSpeedButton
        Left = 182
        ExplicitLeft = 182
      end
    end
    inherited GrbDados: TGroupBox
      Width = 240
      Height = 162
      ExplicitWidth = 240
      ExplicitHeight = 162
      inherited DBGridRecords: TDBGrid
        Width = 236
        Height = 143
      end
    end
    inherited PnlFooter: TPanel
      Top = 230
      Width = 242
      inherited BtSair: TSpeedButton
        Left = 156
        ExplicitLeft = 156
      end
    end
    inherited PnlActions: TPanel
      Width = 242
      ExplicitWidth = 242
      inherited BtInsert: TSpeedButton
        Left = 37
        ExplicitLeft = 37
      end
      inherited BtEditar: TSpeedButton
        Left = 103
        ExplicitLeft = 103
      end
      inherited BtExcluir: TSpeedButton
        Left = 171
        ExplicitLeft = 171
      end
    end
  end
end
