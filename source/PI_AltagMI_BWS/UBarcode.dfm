object FrmBarcode: TFrmBarcode
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Lettura Barcode GS1 128...'
  ClientHeight = 101
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 11
    Width = 85
    Height = 13
    Caption = 'Lettura barcode..'
  end
  object edtBarcode: TCSEdit
    Left = 8
    Top = 26
    Width = 173
    Height = 21
    TabOrder = 0
    OnExit = edtBarcodeExit
    Alignment = taLeftJustify
    AllowNegative = False
    AutoMode = amDisable
    BlankWhenZero = False
    Century = False
    ColorOnFocus = clYellow
    DigitsDec = 0
    DigitsInt = 0
    FormatZero = fzNothing
    MaxTimeUnit = tuOre
    MinTimeUnit = tuSecondi
    PercSign = False
    Seconds = False
    ThousandSep = False
    ControlloData = True
  end
  object BitBtn1: TBitBtn
    Left = 0
    Top = 72
    Width = 189
    Height = 29
    Align = alBottom
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
end
