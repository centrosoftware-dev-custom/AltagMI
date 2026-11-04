object FrmBam: TFrmBam
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 291
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    234
    291)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 54
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object Label2: TLabel
    Left = 17
    Top = 91
    Width = 36
    Height = 13
    Caption = 'Vettore'
  end
  object Label3: TLabel
    Left = 17
    Top = 130
    Width = 58
    Height = 13
    Caption = 'Peso imballo'
  end
  object Label4: TLabel
    Left = 118
    Top = 130
    Width = 107
    Height = 13
    Caption = 'Aspetto esteriore beni'
  end
  object Label5: TLabel
    Left = 17
    Top = 171
    Width = 46
    Height = 13
    Caption = 'Colli Part.'
  end
  object Label6: TLabel
    Left = 87
    Top = 171
    Width = 34
    Height = 13
    Caption = 'N'#176' Colli'
  end
  object Label7: TLabel
    Left = 159
    Top = 171
    Width = 31
    Height = 13
    Caption = 'Pallets'
  end
  object Label8: TLabel
    Left = 17
    Top = 212
    Width = 73
    Height = 13
    Caption = 'Tot. peso lordo'
  end
  object Label9: TLabel
    Left = 124
    Top = 212
    Width = 75
    Height = 13
    Caption = 'Tot. peso netto'
  end
  object F2Tipidoc: TF2
    Left = 12
    Top = 69
    Width = 213
    Height = 21
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    NumCol = 0
    BtnEnabled = True
    ListFieldIndex = 0
    KeyValue = 0
    MultiSelez = False
    ReadBarcode = False
    F2Table = TipiDoc
    EmptyOk = True
    OpenThread = False
    GridWidth = 213
    GridHeight = 160
    DropDownAlign = daLeft
    DropDownWidth = 213
    ReadOnly = True
    DropDownRows = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 234
    Height = 50
    Align = alTop
    Caption = ' Tipi Documento '
    ItemIndex = 0
    Items.Strings = (
      'Ddt')
    TabOrder = 0
  end
  object F2Vettore: TF2
    Left = 12
    Top = 106
    Width = 213
    Height = 21
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    NumCol = 0
    BtnEnabled = True
    ListFieldIndex = 0
    KeyValue = 0
    MultiSelez = False
    ReadBarcode = False
    F2Table = VettoriD
    EmptyOk = True
    OpenThread = False
    GridWidth = 213
    GridHeight = 160
    DropDownAlign = daLeft
    DropDownWidth = 213
    ReadOnly = True
    DropDownRows = 0
  end
  object F2Aspbeni: TF2
    Left = 117
    Top = 144
    Width = 109
    Height = 21
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    NumCol = 0
    BtnEnabled = True
    ListFieldIndex = 0
    KeyValue = 0
    MultiSelez = False
    ReadBarcode = False
    F2Table = AspBeni
    EmptyOk = True
    OpenThread = False
    GridWidth = 207
    GridHeight = 160
    DropDownAlign = daLeft
    DropDownWidth = 207
    ReadOnly = True
    DropDownRows = 0
  end
  object edt_pesoimballo: TCSEdit
    Left = 12
    Top = 145
    Width = 98
    Height = 21
    DataType = dtNumerico
    TabOrder = 3
    Alignment = taRightJustify
    AllowNegative = True
    AutoMode = amDisable
    BlankWhenZero = True
    Century = False
    ColorOnFocus = clYellow
    DigitsDec = 3
    DigitsInt = 15
    FormatZero = fzNothing
    MaxTimeUnit = tuOre
    MinTimeUnit = tuSecondi
    PercSign = False
    Seconds = False
    ThousandSep = True
    ControlloData = True
  end
  object edt_collipart: TCSEdit
    Left = 12
    Top = 186
    Width = 67
    Height = 21
    DataType = dtInt16
    TabOrder = 5
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
  object edt_colli: TCSEdit
    Left = 85
    Top = 186
    Width = 67
    Height = 21
    DataType = dtInt32
    TabOrder = 6
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
  object edt_pallets: TCSEdit
    Left = 158
    Top = 186
    Width = 67
    Height = 21
    DataType = dtInt16
    TabOrder = 7
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
  object edt_pesolordo: TCSEdit
    Left = 12
    Top = 227
    Width = 104
    Height = 21
    DataType = dtNumerico
    TabOrder = 8
    Alignment = taRightJustify
    AllowNegative = True
    AutoMode = amDisable
    BlankWhenZero = True
    Century = False
    ColorOnFocus = clYellow
    DigitsDec = 3
    DigitsInt = 15
    FormatZero = fzNothing
    MaxTimeUnit = tuOre
    MinTimeUnit = tuSecondi
    PercSign = False
    Seconds = False
    ThousandSep = True
    ControlloData = True
  end
  object edt_pesonetto: TCSEdit
    Left = 121
    Top = 227
    Width = 104
    Height = 21
    DataType = dtNumerico
    TabOrder = 9
    Alignment = taRightJustify
    AllowNegative = True
    AutoMode = amDisable
    BlankWhenZero = True
    Century = False
    ColorOnFocus = clYellow
    DigitsDec = 3
    DigitsInt = 15
    FormatZero = fzNothing
    MaxTimeUnit = tuOre
    MinTimeUnit = tuSecondi
    PercSign = False
    Seconds = False
    ThousandSep = True
    ControlloData = True
  end
  object btnOK: TBitBtn
    Left = 12
    Top = 264
    Width = 104
    Height = 25
    Anchors = [akLeft]
    Caption = '&Yes'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btnOKClick
  end
  object BtnCancel: TBitBtn
    Left = 121
    Top = 264
    Width = 104
    Height = 25
    Anchors = [akLeft]
    Caption = 'Abort'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = BtnCancelClick
  end
end
