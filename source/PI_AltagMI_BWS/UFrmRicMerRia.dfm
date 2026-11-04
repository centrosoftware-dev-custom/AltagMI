inherited FrmFuncStd: TFrmFuncStd
  Caption = 'FrmFuncStd'
  OnDestroy = FormDestroy
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  object PnlData: TPanel [0]
    Left = 0
    Top = 0
    Width = 234
    Height = 244
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ScbData: TScrollBox
      Left = 0
      Top = 0
      Width = 234
      Height = 244
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      TabOrder = 0
    end
  end
  inherited PnlStdGen: TPanel
    TabOrder = 2
    object BvlStdGen: TBevel [0]
      Left = 0
      Top = 0
      Width = 234
      Height = 2
      Align = alTop
      ExplicitTop = 241
    end
    inherited PnlStdBtn: TPanel
      Top = 2
      Height = 39
      ExplicitTop = 2
      ExplicitHeight = 39
    end
    inherited PnlStdStatus: TPanel
      Top = 2
      Height = 39
      ExplicitTop = 2
      ExplicitHeight = 39
    end
  end
  inherited PnlStato: TPanel
    TabOrder = 1
  end
end
