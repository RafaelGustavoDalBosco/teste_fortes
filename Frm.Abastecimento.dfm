inherited FrmAbastecimento: TFrmAbastecimento
  Caption = 'Abastecimento'
  ClientHeight = 461
  ClientWidth = 413
  ExplicitWidth = 417
  ExplicitHeight = 465
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 413
    Height = 461
    ExplicitWidth = 413
    ExplicitHeight = 461
    inherited PnlUpper: TPanel
      Width = 413
      ExplicitWidth = 413
      inherited BtClose: TSpeedButton
        Left = 383
        ExplicitLeft = 409
      end
      inherited BtMinimize: TSpeedButton
        Left = 353
        ExplicitLeft = 379
      end
    end
    object GrbFiltro: TGroupBox
      Left = 0
      Top = 25
      Width = 413
      Height = 57
      Align = alTop
      Caption = 'Filtro'
      TabOrder = 1
      object BtLoad: TSpeedButton
        Left = 169
        Top = 13
        Width = 238
        Height = 41
        Caption = 'Carregar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000006E000000FD000000FF000000FF0000
          00F0000000430000000000000000000000000000000000000000000000000000
          00000000000000000011000000FF000000EB0000002E00000000000000000000
          005A000000FE000000F800000000000000000000000000000000000000000000
          000000000008000000FF00000051000000000000000000000000000000000000
          0000000000000000008B000000FF0000000000000005000000DA000000000000
          0000000000FD0000007400000000000000000000000000000000000000000000
          00000000000000000000000000AD000000C5000000DF00000054000000000000
          001E000000FE0000000000000000000000000000000000000000000000000000
          000000000058000000FF00000088000000FF000000FF00000000000000000000
          0087000000450000000000000000000000000000000000000000000000000000
          00000000000000000001000000A2000000FF0000005400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0033000000D20000004300000000000000000000000000000000000000000000
          0000000000000000000000000000000000940000000000000000000000000000
          00FD000000FF000000DC000000FF0000005C0000000000000000000000000000
          0000000000000000000000000000000000FF00000000000000000000001F0000
          00FC000000FC0000007500000000000000000000000000000000000000000000
          00000000000000000000000000C0000000C40000000000000000000000F00000
          003200000008000000FF0000003F000000000000000000000000000000000000
          00000000000000000090000000FF000000000000000000000000000000000000
          00000000000000000012000000FF000000E00000002700000000000000000000
          003F000000F9000000F800000000000000000000000000000000000000000000
          00000000000000000000000000000000006D000000FC000000FF000000FF0000
          00EF000000410000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = BtLoadClick
      end
      object EdtData: TDatePicker
        Left = 13
        Top = 18
        Date = 45247.000000000000000000
        DateFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 0
      end
    end
    object GrbAbastecimento: TGroupBox
      Left = 0
      Top = 82
      Width = 413
      Height = 333
      Align = alClient
      Caption = 'Abastecimento'
      TabOrder = 2
      object BtInsert: TSpeedButton
        Left = 3
        Top = 16
        Width = 78
        Height = 33
        Caption = '&Incluir'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000004000000B2000000CD00000089000000890000
          00CE000000B00000000400000000000000000000000000000000000000000000
          000000000000000000B80000003C000000000000000000000000000000000000
          0000000000000000003F000000B4000000000000000000000000000000000000
          0000000000E70000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000E60000000000000000000000000000
          00B7000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000B100000000000000040000
          003D0000000000000000000000000000000000000000000000820000007C0000
          0000000000000000000000000000000000000000004300000003000000B10000
          00000000000000000000000000000000000000000000000000820000007C0000
          00000000000000000000000000000000000000000000000000AA000000CE0000
          00000000000000000000000000000000000000000000000000820000007C0000
          00000000000000000000000000000000000000000000000000D50000008B0000
          00000000000000000000000000840000008400000084000000C3000000C00000
          00840000008400000084000000000000000000000000000000910000008B0000
          000000000000000000000000007A0000007A0000007A000000BE000000BA0000
          007A0000007A0000007A00000000000000000000000000000092000000D10000
          00000000000000000000000000000000000000000000000000820000007C0000
          00000000000000000000000000000000000000000000000000D8000000AE0000
          00000000000000000000000000000000000000000000000000820000007C0000
          00000000000000000000000000000000000000000000000000A7000000030000
          00420000000000000000000000000000000000000000000000820000007C0000
          0000000000000000000000000000000000000000004900000002000000000000
          00B1000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000AA00000000000000000000
          0000000000E50000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000E30000000000000000000000000000
          000000000000000000AE00000046000000000000000000000000000000000000
          0000000000000000004A000000AA000000000000000000000000000000000000
          0000000000000000000000000002000000A8000000D800000093000000940000
          00D9000000A60000000200000000000000000000000000000000}
        OnClick = BtInsertClick
      end
      object BtUpdate: TSpeedButton
        Left = 87
        Top = 16
        Width = 78
        Height = 33
        Caption = '&Editar'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000004200000043000000430000004300000043000000430000
          0043000000430000004300000027000000000000000000000000000000000000
          0000000000D5000000440000003C0000003C0000003C0000003C0000003C0000
          003C0000003C0000003C000000AB0000001A0000000000000000000000000000
          0000000000F00000000000000000000000000000000000000000000000000000
          0000000000000000000000000050000000310000000000000000000000000000
          0000000000F00000000000000000000000FC000000FF000000A7000000000000
          0000000000000000000000000050000000310000000000000000000000000000
          0000000000F000000000000000000000008400000062000000AC000000D90000
          0000000000000000000000000050000000310000000000000000000000000000
          0000000000F0000000000000000000000005000000FE000000000000003A0000
          00D9000000000000000000000050000000310000000000000000000000000000
          0000000000F00000000000000000000000000000000F000000F9000000000000
          003A000000D90000000000000050000000310000000000000000000000000000
          0000000000F0000000000000000000000000000000000000000F000000F90000
          00000000003A000000D900000000000000000000000000000000000000000000
          0000000000F000000000000000000000000000000000000000000000000F0000
          00F900000000000000BC000000D9000000000000000000000000000000000000
          0000000000F00000000000000000000000000000000000000000000000000000
          000F000000FF000000880000004C000000480000000000000000000000000000
          0000000000D4000000470000003F0000003F0000003F0000003F0000003F0000
          00030000000F000000F9000000F8000000000000000000000000000000000000
          0000000000000000003F00000040000000400000004000000040000000400000
          0003000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = BtUpdateClick
      end
      object BtDelete: TSpeedButton
        Left = 171
        Top = 16
        Width = 78
        Height = 33
        Caption = 'E&xcluir'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000D0000000AF000000AF000000AF000000AF0000
          00AF000000AF000000CD00000000000000000000000000000000000000000000
          00000000000000000000000000C9000000000000001000000001000000020000
          000F00000000000000BD00000000000000000000000000000000000000000000
          00000000000000000000000000A100000000000000AF00000009000000150000
          00A3000000000000009600000000000000000000000000000000000000000000
          000000000000000000000000007A000000000000009F00000009000000150000
          0093000000000000006E00000000000000000000000000000000000000000000
          0000000000000000000000000053000000000000008F00000009000000150000
          0083000000000000004700000000000000000000000000000000000000000000
          000000000000000000000000002C000000000000007F00000009000000150000
          0074000000000000002000000003000000000000000000000000000000000000
          0000000000000000001C00000005000000000000006F00000009000000150000
          0064000000000000000000000027000000000000000000000000000000000000
          0000000000000000004300000000000000000000005F00000009000000150000
          005400000000000000000000004F000000000000000000000000000000000000
          0000000000000000006A00000000000000000000005000000009000000150000
          0044000000000000000000000076000000000000000000000000000000000000
          0000000000000000009100000000000000000000004000000009000000150000
          003400000000000000000000009D000000000000000000000000000000000000
          000000000000000000B8000000000000000000000024000000060000000F0000
          001C0000000000000000000000C4000000000000000000000000000000000000
          000000000000000000E000000006000000060000000600000006000000060000
          00060000000600000006000000EC000000010000000000000000000000000000
          00000000000200000018000000180000008A0000001800000018000000180000
          0018000000950000001800000018000000030000000000000000000000000000
          000000000000000000000000000000000024000000B7000000AD000000AD0000
          00B50000002C0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = BtDeleteClick
      end
      object DBGridRecords: TDBGrid
        Left = 6
        Top = 55
        Width = 400
        Height = 272
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor R$'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_BOMBA'
            Title.Caption = 'Bomba'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_TANQUE'
            Title.Caption = 'Tanque'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMBUSTIVEL'
            Title.Caption = 'Combust'#237'vel'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE'
            Title.Caption = 'Quantidade'
            Width = 70
            Visible = True
          end>
      end
    end
    object PnlFooter: TPanel
      Left = 0
      Top = 415
      Width = 413
      Height = 46
      Align = alBottom
      BevelKind = bkTile
      TabOrder = 3
      object BtSair: TSpeedButton
        Left = 327
        Top = 1
        Width = 81
        Height = 40
        Align = alRight
        Caption = '&Sair'
        Glyph.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000D000000610000006600000007000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000025000000910000
          00F1000000FF000000FF00000093000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000100000048000000B5000000FD000000FE0000
          00BE00000051000000D4000000CA000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000D0000006C000000D8000000FF000000F50000009A0000002D0000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          007C000000F1000000FF000000DF000000750000001200000000000000000000
          000000000000000000CC000000D6000000330000003300000033000000320000
          0016000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000720000
          00FF000000C50000005000000003000000000000000000000000000000000000
          000000000000000000CC000000FF000000FF000000FF000000FF000000FF0000
          00FB000000720000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000E40000
          00CF000000040000000000000000000000000000000000000000000000000000
          000000000000000000CC000000E0000000660000006600000066000000670000
          00C7000000FB0000001600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0067000000FF0000003200000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0066000000FF000000330000000000000000000000000000007F0000008E0000
          0002000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000090000000FF0000
          009E000000020000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0063000000FF0000002F00000000000000000000000000000002000000A00000
          00FF0000009E0000000200000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          000D000000560000000200000000000000000000000000000000000000020000
          00A0000000FF0000009E00000002000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0002000000A0000000FF0000009E000000020000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000DA0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000780000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000770000
          0099000000990000009900000099000000990000009900000099000000990000
          0099000000BB000000FF000000F60000003F0000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0024000000E3000000F600000045000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0032000000BA0000001200000000000000000000000000000000000000240000
          00E3000000F60000004500000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CC000000CC000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000024000000E30000
          00F6000000450000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          000000000000000000CF000000CA000000000000000000000000000000000000
          0066000000FF00000033000000000000000000000000000000B9000000F60000
          0045000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000000000000000000000000000000000
          00000000002E000000FA000000A1000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000030000000320000
          0000000000000000000000000000000000000000000000000000000000FF0000
          00990000000000000000000000000000000000000000000000000000002C0000
          0098000000F5000000F300000028000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000000000000000000000030000004F000000BD000000FE0000
          00FE000000B70000003000000000000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF0000
          0099000000000000001100000074000000DE000000FF000000F2000000920000
          0027000000000000000000000000000000000000000000000000000000000000
          0066000000FF0000003300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FB0000
          00BA00000098000000F4000000FF000000D90000006E0000000E000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0073000000FF0000002E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000B50000
          00FF000000FF000000FF000000FA000000CD000000CC000000CC000000CC0000
          00CC000000CC000000CC000000CC000000CC000000CC000000CC000000CC0000
          00F6000000E10000000600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000130000
          009A000000CB000000CC000000CC000000CC000000CC000000CC000000CC0000
          00CC000000CC000000CC000000CC000000CC000000CC000000CC000000CC0000
          00AC000000270000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = BtSairClick
        ExplicitLeft = 294
      end
    end
  end
end
