inherited FrmCadastroBomba: TFrmCadastroBomba
  Caption = 'Cadastro de Bombas'
  ClientHeight = 154
  ClientWidth = 218
  ExplicitWidth = 222
  ExplicitHeight = 158
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 218
    Height = 154
    ExplicitWidth = 218
    ExplicitHeight = 154
    inherited PnlUpper: TPanel
      Width = 218
      ExplicitWidth = 218
      inherited BtClose: TSpeedButton
        Left = 188
        ExplicitLeft = 188
      end
      inherited BtMinimize: TSpeedButton
        Left = 158
        ExplicitLeft = 158
      end
    end
    inherited PnlFooter: TPanel
      Top = 108
      Width = 218
      ExplicitTop = 108
      ExplicitWidth = 218
      inherited BtConfirmar: TSpeedButton
        Left = 20
        ExplicitLeft = 20
      end
      inherited BtSair: TSpeedButton
        Left = 132
        ExplicitLeft = 132
      end
    end
    inherited GrbID: TGroupBox
      inherited LblID: TLabel
        Width = 29
        Height = 22
      end
    end
    inherited PnlActionText: TPanel
      Width = 218
      ExplicitWidth = 218
    end
    object GrbTanque: TGroupBox
      Left = 37
      Top = 53
      Width = 172
      Height = 41
      Caption = 'Tanque'
      TabOrder = 4
      object CbTanques: TComboBox
        Left = 7
        Top = 15
        Width = 154
        Height = 23
        Style = csDropDownList
        TabOrder = 0
      end
    end
  end
end
