inherited FrmSystemMain: TFrmSystemMain
  Caption = 'Fortes'
  ClientHeight = 451
  ClientWidth = 672
  ExplicitWidth = 676
  ExplicitHeight = 455
  TextHeight = 15
  inherited PnlMain: TPanel
    Width = 672
    Height = 451
    ExplicitWidth = 672
    ExplicitHeight = 451
    inherited PnlUpper: TPanel
      Width = 672
      ExplicitWidth = 672
      inherited BtClose: TSpeedButton
        Left = 642
        ExplicitLeft = 940
      end
      inherited BtMinimize: TSpeedButton
        Left = 612
        ExplicitLeft = 910
      end
    end
    object PnlToolBar: TPanel
      Left = 0
      Top = 25
      Width = 672
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      Color = 10485760
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 8
      object ImgMenu: TImage
        Left = 10
        Top = 10
        Width = 32
        Height = 32
        Cursor = crHandPoint
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF40000002B744558744372656174696F6E2054696D65
          0053756E20322041756720323031352031373A30353A3430202D30363030AB9D
          78EE0000000774494D4507DF0802160936B3167602000000097048597300002E
          2300002E230178A53F760000000467414D410000B18F0BFC61050000003B4944
          415478DAEDD3310100200C0341EA5F3454020BA1C3BD81DC925A9F2B00809180
          DD3D19EB00AE00C9000066BE00201900C0CC1700240300003859BE2421B37CDF
          370000000049454E44AE426082}
        OnClick = ImgMenuClick
      end
      object lblTitle: TLabel
        Left = 50
        Top = 12
        Width = 476
        Height = 21
        Caption = 'Case de teste para Fortes Tecnologia: Rafael Gustavo Dal Bosco'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object SplitView: TSplitView
      Left = 0
      Top = 75
      Width = 175
      Height = 376
      Color = 10485760
      OpenedWidth = 175
      Placement = svpLeft
      TabOrder = 2
      OnClosed = SplitViewClosed
      OnOpened = SplitViewOpened
      OnOpening = SplitViewOpening
      ExplicitTop = 65
      object CategoryButtons: TCategoryButtons
        Left = 0
        Top = -20
        Width = 193
        Height = 149
        BorderStyle = bsNone
        ButtonFlow = cbfVertical
        ButtonHeight = 40
        ButtonWidth = 100
        ButtonOptions = [boFullSize, boShowCaptions, boCaptionOnlyBorder]
        Categories = <
          item
            Caption = 'Cadastros'
            Color = clNone
            Collapsed = False
            Items = <
              item
                Caption = 'Cadastros'
                ImageIndex = 7
                OnClick = CategoryButtonsCategories0Items0Click
              end
              item
                Caption = 'Abastecimento'
                ImageIndex = 2
                OnClick = CategoryButtonsCategories0Items1Click
              end
              item
                Caption = 'Sair'
                OnClick = CategoryButtonsCategories0Items2Click
              end>
          end>
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        HotButtonColor = 12477460
        RegularButtonColor = clNone
        SelectedButtonColor = clNone
        TabOrder = 0
      end
    end
  end
end
