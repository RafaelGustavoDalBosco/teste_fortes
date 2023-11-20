inherited FrmCadastroTanque: TFrmCadastroTanque
  Caption = 'Cadastro de Tanque'
  ClientHeight = 148
  ClientWidth = 328
  ExplicitWidth = 332
  ExplicitHeight = 152
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 328
    Height = 148
    ExplicitWidth = 328
    ExplicitHeight = 148
    inherited PnlUpper: TPanel
      Width = 328
      TabOrder = 3
      ExplicitWidth = 328
      inherited BtClose: TSpeedButton
        Left = 298
        ExplicitLeft = 308
      end
      inherited BtMinimize: TSpeedButton
        Left = 268
        ExplicitLeft = 278
      end
    end
    inherited PnlFooter: TPanel
      Top = 102
      Width = 328
      TabOrder = 4
      ExplicitTop = 102
      ExplicitWidth = 328
      inherited BtConfirmar: TSpeedButton
        Left = 130
        ExplicitLeft = 140
      end
      inherited BtSair: TSpeedButton
        Left = 242
        ExplicitLeft = 252
      end
    end
    inherited GrbID: TGroupBox
      TabOrder = 0
      inherited LblID: TLabel
        Width = 29
        Height = 22
      end
    end
    inherited PnlActionText: TPanel
      Width = 328
      TabOrder = 5
      ExplicitWidth = 328
    end
    object GrbCombustivel: TGroupBox
      Left = 37
      Top = 53
      Width = 172
      Height = 41
      Caption = 'Combust'#237'vel'
      TabOrder = 1
      object CbCombustivel: TComboBox
        Left = 7
        Top = 15
        Width = 154
        Height = 23
        Style = csDropDownList
        TabOrder = 0
      end
    end
    object GrbQuantidade: TGroupBox
      Left = 215
      Top = 55
      Width = 106
      Height = 41
      Caption = 'Quantidade Litros'
      TabOrder = 2
      object EdtQuantidade: TEdit
        Left = 9
        Top = 14
        Width = 91
        Height = 23
        BorderStyle = bsNone
        NumbersOnly = True
        TabOrder = 0
      end
    end
  end
end
