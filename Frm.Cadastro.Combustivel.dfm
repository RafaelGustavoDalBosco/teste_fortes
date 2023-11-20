inherited FrmCadastroCombustivel: TFrmCadastroCombustivel
  Caption = 'Cadastro de Combust'#237'vel'
  ClientHeight = 185
  ClientWidth = 277
  ExplicitWidth = 281
  ExplicitHeight = 189
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 277
    Height = 185
    ExplicitWidth = 277
    ExplicitHeight = 185
    inherited PnlUpper: TPanel
      Width = 277
      ExplicitWidth = 277
      inherited BtClose: TSpeedButton
        Left = 247
        ExplicitLeft = 319
      end
      inherited BtMinimize: TSpeedButton
        Left = 217
        ExplicitLeft = 289
      end
    end
    inherited PnlFooter: TPanel
      Top = 139
      Width = 277
      ExplicitTop = 139
      ExplicitWidth = 277
      inherited BtConfirmar: TSpeedButton
        Left = 79
        ExplicitLeft = 151
      end
      inherited BtSair: TSpeedButton
        Left = 191
        ExplicitLeft = 263
      end
    end
    inherited PnlActionText: TPanel
      Width = 277
      ExplicitWidth = 277
    end
    object GrbDescricao: TGroupBox
      Left = 37
      Top = 52
      Width = 236
      Height = 41
      Caption = 'Descri'#231#227'o do Combust'#237'vel'
      TabOrder = 4
      object EdtDescricao: TEdit
        Left = 7
        Top = 15
        Width = 221
        Height = 23
        CharCase = ecUpperCase
        MaxLength = 40
        TabOrder = 0
        TextHint = '< digite o nome do combust'#237'vel >'
      end
    end
    object GrbAliquotaImposto: TGroupBox
      Left = 0
      Top = 94
      Width = 130
      Height = 41
      Caption = 'Al'#237'quota Imposto (%)'
      TabOrder = 5
      object EdtAliquotaImposto: TEdit
        Left = 12
        Top = 14
        Width = 118
        Height = 23
        Alignment = taCenter
        MaxLength = 6
        TabOrder = 0
        Text = '0'
        OnExit = EdtAliquotaImpostoExit
        OnKeyPress = EdtAliquotaImpostoKeyPress
      end
    end
    object GrbPrecoVenda: TGroupBox
      Left = 136
      Top = 94
      Width = 137
      Height = 41
      Caption = 'Pre'#231'o de Venda R$'
      TabOrder = 6
      object EdtPrecoVenda: TEdit
        Left = 2
        Top = 17
        Width = 133
        Height = 22
        Align = alClient
        Alignment = taCenter
        MaxLength = 9
        TabOrder = 0
        Text = '0,00'
        OnExit = EdtPrecoVendaExit
        OnKeyPress = EdtPrecoVendaKeyPress
        ExplicitHeight = 23
      end
    end
  end
end
