object FrmSystemAncestral: TFrmSystemAncestral
  Left = 0
  Top = 0
  BorderStyle = bsNone
  BorderWidth = 2
  Caption = 'FrmSystemAncestral'
  ClientHeight = 630
  ClientWidth = 702
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 630
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PnlUpper: TPanel
      Left = 0
      Top = 0
      Width = 702
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Form Caption'
      Color = 16744448
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnMouseDown = PnlUpperMouseDown
      object BtClose: TSpeedButton
        Left = 672
        Top = 0
        Width = 30
        Height = 25
        Align = alRight
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000093000000EB0000009C0000009C0000
          00EA000000930000000000000000000000000000000000000000000000000000
          0000000000000000003C000000A4000000000000000000000000000000000000
          000000000000000000A30000003E000000000000000000000000000000000000
          00000000003C0000004700000000000000000000000000000000000000000000
          00000000000000000000000000450000003D0000000000000000000000000000
          0000000000A50000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000A30000000000000000000000000000
          0092000000000000000000000000000000D60000000000000000000000000000
          0000000000D80000000000000000000000000000009300000000000000000000
          00EC00000000000000000000000000000000000000F000000000000000000000
          00F000000000000000000000000000000000000000EC00000000000000000000
          009F0000000000000000000000000000000000000000000000F0000000F00000
          0000000000000000000000000000000000000000009D00000000000000000000
          009F0000000000000000000000000000000000000000000000F0000000F00000
          0000000000000000000000000000000000000000009D00000000000000000000
          00ED00000000000000000000000000000000000000F000000000000000000000
          00F000000000000000000000000000000000000000EC00000000000000000000
          0090000000000000000000000000000000D30000000000000000000000000000
          0000000000D40000000000000000000000000000009100000000000000000000
          0000000000A80000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000A60000000000000000000000000000
          00000000003A0000004A00000000000000000000000000000000000000000000
          00000000000000000000000000480000003B0000000000000000000000000000
          0000000000000000003A000000A8000000000000000000000000000000000000
          000000000000000000A70000003B000000000000000000000000000000000000
          000000000000000000000000000000000090000000EE000000A0000000A00000
          00ED000000900000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = BtCloseClick
        ExplicitHeight = 49
      end
      object BtMinimize: TSpeedButton
        Left = 642
        Top = 0
        Width = 30
        Height = 25
        Align = alRight
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000000000000000000000000000000000
          000000000000000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = BtMinimizeClick
        ExplicitLeft = 672
        ExplicitHeight = 49
      end
    end
  end
end