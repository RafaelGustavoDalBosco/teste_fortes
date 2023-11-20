inherited FrmCadastroAbastecimento: TFrmCadastroAbastecimento
  Caption = 'Cadastro de Abastecimento'
  ClientHeight = 201
  ClientWidth = 380
  ExplicitWidth = 384
  ExplicitHeight = 205
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 380
    Height = 201
    ExplicitWidth = 380
    ExplicitHeight = 201
    object LblInfoImposto: TLabel [0]
      Left = 4
      Top = 136
      Width = 372
      Height = 15
      AutoSize = False
      Caption = 'Aten'#231#227'o: ser'#225' tributado o valor total em'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Visible = False
    end
    inherited PnlUpper: TPanel
      Width = 380
      TabOrder = 8
      ExplicitWidth = 380
      inherited BtClose: TSpeedButton
        Left = 350
        ExplicitLeft = 350
      end
      inherited BtMinimize: TSpeedButton
        Left = 320
        ExplicitLeft = 320
      end
    end
    inherited PnlFooter: TPanel
      Top = 155
      Width = 380
      TabOrder = 9
      ExplicitTop = 155
      ExplicitWidth = 380
      inherited BtConfirmar: TSpeedButton
        Left = 182
        ExplicitLeft = 182
      end
      inherited BtSair: TSpeedButton
        Left = 294
        ExplicitLeft = 294
      end
    end
    inherited GrbID: TGroupBox
      Left = 2
      TabOrder = 0
      ExplicitLeft = 2
      inherited LblID: TLabel
        Width = 29
        Height = 22
      end
    end
    inherited PnlActionText: TPanel
      Width = 380
      TabOrder = 10
      ExplicitWidth = 380
    end
    object GrbCombustivel: TGroupBox
      Left = 37
      Top = 52
      Width = 194
      Height = 39
      Caption = 'Combust'#237'vel'
      TabOrder = 1
      object CbCombustivel: TComboBox
        Left = 9
        Top = 14
        Width = 178
        Height = 23
        Style = csDropDownList
        TabOrder = 0
        OnChange = CbCombustivelChange
      end
    end
    object GrbPreco: TGroupBox
      Left = 95
      Top = 95
      Width = 90
      Height = 39
      Caption = 'Pre'#231'o Litro R$'
      TabOrder = 5
      object EdtPreco: TEdit
        Left = 2
        Top = 17
        Width = 86
        Height = 20
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Enabled = False
        TabOrder = 0
      end
    end
    object GrbQuantidade: TGroupBox
      Left = 2
      Top = 95
      Width = 87
      Height = 39
      Caption = 'Quantidade'
      TabOrder = 4
      object EdtQuantidade: TEdit
        Left = 2
        Top = 17
        Width = 83
        Height = 20
        Align = alClient
        Alignment = taCenter
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        OnChange = EdtQuantidadeChange
      end
    end
    object GrbTotal: TGroupBox
      Left = 190
      Top = 95
      Width = 77
      Height = 39
      Caption = 'Total R$'
      TabOrder = 6
      object LblTotal: TLabel
        Left = 2
        Top = 17
        Width = 73
        Height = 20
        Align = alClient
        Alignment = taCenter
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ExplicitWidth = 24
        ExplicitHeight = 17
      end
    end
    object GrbValorImposto: TGroupBox
      Left = 273
      Top = 95
      Width = 103
      Height = 39
      Caption = 'Valor Imposto R$'
      TabOrder = 7
      object LblValorImposto: TLabel
        Left = 2
        Top = 17
        Width = 99
        Height = 20
        Align = alClient
        Alignment = taCenter
        Caption = '0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 24
        ExplicitHeight = 17
      end
    end
    object GrbTanque: TGroupBox
      Left = 237
      Top = 52
      Width = 67
      Height = 39
      Caption = 'Tanque'
      TabOrder = 2
      object CbTanque: TComboBox
        Left = 10
        Top = 14
        Width = 47
        Height = 23
        Style = csDropDownList
        TabOrder = 0
        OnChange = CbTanqueChange
      end
    end
    object GrbBomba: TGroupBox
      Left = 309
      Top = 52
      Width = 67
      Height = 38
      Caption = 'Bomba'
      TabOrder = 3
      object CbBomba: TComboBox
        Left = 10
        Top = 14
        Width = 47
        Height = 23
        Style = csDropDownList
        TabOrder = 0
      end
    end
  end
end
