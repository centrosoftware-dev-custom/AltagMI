object FrameClav: TFrameClav
  Left = 0
  Top = 0
  Width = 210
  Height = 263
  TabOrder = 0
  DesignSize = (
    210
    263)
  object Label1: TLabel
    Left = 3
    Top = 77
    Width = 27
    Height = 13
    Caption = 'DDT :'
  end
  object Label2: TLabel
    Left = 2
    Top = 10
    Width = 23
    Height = 13
    Caption = 'For :'
  end
  object Label3: TLabel
    Left = 3
    Top = 100
    Width = 27
    Height = 13
    Caption = 'BCU :'
  end
  object Label4: TLabel
    Left = 3
    Top = 222
    Width = 31
    Height = 13
    Caption = 'Vano :'
  end
  object Label5: TLabel
    Left = 3
    Top = 125
    Width = 22
    Height = 13
    Caption = 'Art :'
  end
  object Label6: TLabel
    Left = 16
    Top = 174
    Width = 48
    Height = 13
    Caption = 'Sacatole :'
  end
  object Label7: TLabel
    Left = 77
    Top = 174
    Width = 54
    Height = 13
    Caption = 'Q.ta x sca.'
  end
  object lbl_umx: TLabel
    Left = 145
    Top = 174
    Width = 29
    Height = 13
    Caption = '[UMX]'
  end
  object Label8: TLabel
    Left = 2
    Top = 151
    Width = 32
    Height = 13
    Caption = 'Lotto :'
  end
  object lbl_forn: TLabel
    Left = 3
    Top = 34
    Width = 202
    Height = 30
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object f2DDT: TF2
    Left = 56
    Top = 73
    Width = 150
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    NumCol = 0
    BtnEnabled = True
    ListFieldIndex = 0
    KeyValue = 0
    MultiSelez = False
    ReadBarcode = False
    F2Table = BamTes
    EmptyOk = True
    OpenThread = False
    GridWidth = 169
    GridHeight = 160
    DropDownAlign = daLeft
    DropDownWidth = 169
    ReadOnly = True
    DropDownRows = 0
  end
  object edt_for: TCSEdit
    Left = 36
    Top = 7
    Width = 19
    Height = 21
    DataType = dtInt32
    TabOrder = 0
    OnExit = edt_forExit
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
  object F2Forn: TF2
    Left = 56
    Top = 7
    Width = 150
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    NumCol = 0
    BtnEnabled = True
    ListFieldIndex = 0
    KeyValue = 0
    OnKeyChange = F2FornKeyChange
    MultiSelez = False
    ReadBarcode = False
    F2Table = FornitD
    EmptyOk = True
    OpenThread = False
    GridWidth = 170
    GridHeight = 160
    DropDownAlign = daLeft
    DropDownWidth = 170
    ReadOnly = True
    DropDownRows = 0
  end
  object edt_lotto: TCSEdit
    Left = 36
    Top = 97
    Width = 169
    Height = 21
    ParentCustomHint = False
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    OnExit = edt_lottoExit
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
  object F2Art: TF2
    Left = 36
    Top = 121
    Width = 169
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    NumCol = 0
    BtnEnabled = True
    ListFieldIndex = 0
    KeyValue = 0
    OnKeyChange = F2ArtKeyChange
    MultiSelez = False
    ReadBarcode = False
    F2Table = ArticoC
    EmptyOk = True
    OpenThread = False
    GridWidth = 171
    GridHeight = 160
    DropDownAlign = daLeft
    DropDownWidth = 171
    ReadOnly = True
    DropDownRows = 0
  end
  object edt_qtatot: TCSEdit
    Left = 143
    Top = 190
    Width = 62
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 8
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
  object edt_qta_x_scatola: TCSEdit
    Left = 77
    Top = 190
    Width = 55
    Height = 21
    Enabled = False
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
  object edt_scatole: TCSEdit
    Left = 12
    Top = 190
    Width = 55
    Height = 21
    TabOrder = 6
    OnChange = edt_scatoleChange
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
  object F2Vano: TF2
    Left = 36
    Top = 218
    Width = 169
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    NumCol = 0
    BtnEnabled = True
    ListFieldIndex = 0
    KeyValue = 0
    MultiSelez = False
    ReadBarcode = False
    F2Table = AllMag
    EmptyOk = True
    OpenThread = False
    GridWidth = 171
    GridHeight = 160
    DropDownAlign = daLeft
    DropDownWidth = 171
    ReadOnly = True
    DropDownRows = 0
  end
  object edt_bolla: TCSEdit
    Left = 36
    Top = 73
    Width = 19
    Height = 21
    DataType = dtInt32
    TabOrder = 2
    OnExit = edt_bollaExit
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
  object edt_numlot: TCSEdit
    Left = 36
    Top = 148
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 10
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
  object edt_numser: TCSEdit
    Left = 124
    Top = 148
    Width = 81
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    TabOrder = 11
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
  object TimerFor: TTimer
    Enabled = False
    OnTimer = TimerForTimer
    Left = 151
    Top = 219
  end
end
