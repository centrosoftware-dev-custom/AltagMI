object FrmCaricaMag: TFrmCaricaMag
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Carico Magazzino'
  ClientHeight = 320
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BtnAnnulla: TSpeedButton
    Left = 179
    Top = 256
    Width = 58
    Height = 24
    Hint = 'Annulla'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD44444444DDD6DDDDCEEEEECDDD
      D66DDDCEEEECDDDDD66DDDCEEEEECDDD6E6DDDCEEEEEEC666E6DDDCECEEEEEEE
      E68DDDCCDCEEEEEEE6DDDDCDDDCCEEEE6DDDDDDDDDDDCCC6DDDDDDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
    ParentShowHint = False
    ShowHint = True
    OnClick = BtnAnnullaClick
  end
  object PageCtrl: TPageControl
    Left = 1
    Top = 0
    Width = 236
    Height = 250
    ActivePage = tsNuovaRiga
    Style = tsButtons
    TabOrder = 0
    OnChange = PageCtrlChange
    object tsNuovaRiga: TTabSheet
      Caption = 'Nuova Riga'
      DesignSize = (
        228
        219)
      object lbl_nr: TLabel
        Left = 1
        Top = 25
        Width = 18
        Height = 13
        Caption = 'Nr :'
      end
      object lbl_dt: TLabel
        Left = 137
        Top = 25
        Width = 23
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Data'
        ExplicitLeft = 140
      end
      object lbl_for: TLabel
        Left = 1
        Top = 47
        Width = 26
        Height = 13
        Caption = 'Forn.'
      end
      object lbl_barcode: TLabel
        Left = 1
        Top = 84
        Width = 26
        Height = 13
        Caption = 'GS1 :'
      end
      object lblArt: TLabel
        Left = 1
        Top = 106
        Width = 19
        Height = 13
        Caption = 'Art.'
      end
      object lbl_desforn: TLabel
        Left = 1
        Top = 64
        Width = 233
        Height = 16
        AutoSize = False
        WordWrap = True
      end
      object lbl_lotto: TLabel
        Left = 2
        Top = 123
        Width = 25
        Height = 13
        Caption = 'Lotto'
      end
      object lbl_umf: TLabel
        Left = 29
        Top = 160
        Width = 29
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '[UMX]'
        ExplicitLeft = 33
      end
      object lbl_umm: TLabel
        Left = 97
        Top = 160
        Width = 29
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '[UMX]'
        ExplicitLeft = 101
      end
      object lbl_umi: TLabel
        Left = 165
        Top = 160
        Width = 29
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '[UMX]'
        ExplicitLeft = 169
      end
      object lblVano: TLabel
        Left = 0
        Top = 200
        Width = 24
        Height = 13
        Caption = 'Vano'
      end
      object lblDDT: TLabel
        Left = 1
        Top = 3
        Width = 27
        Height = 13
        Caption = 'DDT :'
      end
      object lblDatalot: TLabel
        Left = 165
        Top = 123
        Width = 23
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Data'
        ExplicitLeft = 169
      end
      object lblNumser: TLabel
        Left = 80
        Top = 123
        Width = 24
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Serie'
        ExplicitLeft = 84
      end
      object Edtnumdoc: TCSEdit
        Left = 31
        Top = 20
        Width = 96
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
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
      object edtDataDoc: TCSEdit
        Left = 161
        Top = 20
        Width = 67
        Height = 21
        DataType = dtData
        Anchors = [akTop, akRight]
        TabOrder = 2
        Alignment = taLeftJustify
        AllowNegative = False
        AutoMode = amSeparator
        BlankWhenZero = False
        Century = True
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
      object edt_barcode: TCSEdit
        Left = 31
        Top = 81
        Width = 197
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        OnEnter = edt_barcodeEnter
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
      object F2forn: TF2
        Left = 51
        Top = 42
        Width = 177
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        NumCol = 0
        BtnEnabled = True
        ListFieldIndex = 0
        KeyValue = 0
        OnKeyChange = F2fornKeyChange
        MultiSelez = False
        ReadBarcode = False
        F2Table = FornitD
        EmptyOk = True
        OpenThread = False
        GridWidth = 181
        GridHeight = 160
        DropDownAlign = daLeft
        DropDownWidth = 181
        ReadOnly = True
        DropDownRows = 0
      end
      object F2Art: TF2
        Left = 31
        Top = 102
        Width = 198
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnExit = F2ArtExit
        NumCol = 0
        BtnEnabled = True
        ListFieldIndex = 0
        KeyValue = 0
        MultiSelez = False
        ReadBarcode = False
        F2Table = ArticoC
        EmptyOk = True
        OpenThread = False
        GridWidth = 212
        GridHeight = 160
        DropDownAlign = daLeft
        DropDownWidth = 212
        ReadOnly = True
        DropDownRows = 0
      end
      object edtNumser: TCSEdit
        Left = 78
        Top = 137
        Width = 82
        Height = 21
        Anchors = [akTop, akRight]
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
      object edtqtaUmf: TCSEdit
        Left = 29
        Top = 174
        Width = 67
        Height = 21
        DataType = dtNumerico
        Anchors = [akTop, akRight]
        TabOrder = 10
        OnExit = edtqtaUmfExit
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
      object edtQtaUMm: TCSEdit
        Left = 95
        Top = 174
        Width = 67
        Height = 21
        DataType = dtNumerico
        Anchors = [akTop, akRight]
        TabOrder = 11
        OnExit = edtQtaUMmExit
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
      object edtQtaUMI: TCSEdit
        Left = 161
        Top = 174
        Width = 67
        Height = 21
        DataType = dtNumerico
        Anchors = [akTop, akRight]
        TabOrder = 12
        OnExit = edtQtaUMIExit
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
      object edtForn: TCSEdit
        Left = 31
        Top = 42
        Width = 20
        Height = 21
        DataType = dtNumerico
        TabOrder = 3
        OnExit = edtFornExit
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
      object f2Allmag: TF2
        Left = 33
        Top = 197
        Width = 195
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        NumCol = 0
        BtnEnabled = True
        ListFieldIndex = 0
        KeyValue = 0
        MultiSelez = False
        ReadBarcode = False
        F2Table = AllMag
        EmptyOk = True
        OpenThread = False
        GridWidth = 212
        GridHeight = 160
        DropDownAlign = daLeft
        DropDownWidth = 212
        ReadOnly = True
        DropDownRows = 0
      end
      object f2Tipodoc: TF2
        Left = 31
        Top = -1
        Width = 197
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        NumCol = 0
        BtnEnabled = True
        ListFieldIndex = 0
        KeyValue = 0
        MultiSelez = False
        ReadBarcode = False
        F2Table = TipiDoc
        EmptyOk = True
        OpenThread = False
        GridWidth = 206
        GridHeight = 160
        DropDownAlign = daLeft
        DropDownWidth = 206
        ReadOnly = True
        DropDownRows = 0
      end
      object edtNumlot: TCSEdit
        Left = 1
        Top = 137
        Width = 77
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
      object edtDatLot: TCSEdit
        Left = 163
        Top = 137
        Width = 65
        Height = 21
        DataType = dtData
        Anchors = [akTop, akRight]
        TabOrder = 9
        Alignment = taLeftJustify
        AllowNegative = False
        AutoMode = amSeparator
        BlankWhenZero = False
        Century = True
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
    end
    object tsGriglia: TTabSheet
      Caption = 'Griglia'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GridRighepreparate: TSMDBGrid
        Left = 0
        Top = 0
        Width = 228
        Height = 192
        ExOptions = [eoDrawGraphicField, eoKeepSelection, eoStandardPopup]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        KeyField = 'ID'
        WidthOfIndicator = 14
        ScrollBars = ssHorizontal
        ColCount = 10
        RowCount = 2
        Col = 1
        Row = 1
        Align = alClient
        DataSource = DS_RighePreparate
        FixedColor = clWhite
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'codart'
            Title.Caption = 'Cod. Art.'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'descrart'
            Title.Caption = 'Descr. Art.'
            Width = 90
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'QTAORDSPA'
            Title.Caption = 'Qta. Prep.'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'umfor'
            Title.Caption = 'UM Forn.'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'QTAORDMSPA'
            Title.Caption = 'Qta Mov. Prep.'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'umMov'
            Title.Caption = 'UM Mov.'
            Width = 49
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'QTAORDISPA'
            Title.Caption = 'Qta Inv. Prep.'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'UMINV'
            Title.Caption = 'UM Inv.'
            Width = 49
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'TOTQTAORD'
            Title.Caption = 'Tot. Qta. Disp. OA'
            Width = 76
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end>
      end
      object pnlCartoni: TPanel
        Left = 0
        Top = 192
        Width = 228
        Height = 27
        Align = alBottom
        Alignment = taLeftJustify
        TabOrder = 1
        Visible = False
        object btnDetail: TCSBitBtn
          Left = 0
          Top = 1
          Width = 116
          Height = 25
          Caption = 'Dettaglio Letture'
          TabOrder = 0
          OnClick = btnDetailClick
          GlyphLibraryIndex = 162
        end
      end
    end
  end
  object BtnElabora: TBitBtn
    Left = 1
    Top = 256
    Width = 58
    Height = 24
    Hint = 'Elabora'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      0000DDD22DDDDDDDDDDDDDDDDDF77DDDDDDDDDDD0000DDD2A2DDDDDDDDDDDDDD
      DDF7F7DDDDDDDDDD0000DDD2AA2DDDDDDDDDDDDDDDF7DF7DDDDDDDDD0000DDD2
      AAA2DDDDDDDDDDDDDDF7DDF7DDDDDDDD0000DDD2AAAA2DDDDDDDDDDDDDF7DDDF
      7DDDDDDD0000DDD2AAAAA2DDDDDDDDDDDDF7DDDDF7DDDDDD0000DDD2AAAAAA2D
      DDDDDDDDDDF7DDDDDF7DDDDD0000DDD2AAAAAAA2DDDDDDDDDDF7DDDDD7FDDDDD
      0000DDD2AAAAAA2DDDDDDDDDDDF7DDDD7FDDDDDD0000DDD2AAAAA2DDDDDDDDDD
      DDF7DDD7FDDDDDDD0000DDD2AAAA2DDDDDDDDDDDDDF7DD7FDDDDDDDD0000DDD2
      AAA2DDDDDDDDDDDDDDF7D7FDDDDDDDDD0000DDD2AA2DDDDDDDDDDDDDDDF77FDD
      DDDDDDDD0000DDD2A2DDDDDDDDDDDDDDDDF7FDDDDDDDDDDD0000DDD22DDDDDDD
      DDDDDDDDDDFFDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
      0000}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BtnElaboraClick
  end
  object BtnPreparaRiga: TBitBtn
    Left = 60
    Top = 256
    Width = 58
    Height = 24
    Hint = 'Prepara riga'
    Default = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDDDDDDDDDDDDDDDDDDDDDDDDD99DDDDDD888888899998DDDD8F8FFF99F89
      9DDDD8888888888899DDD8F8FFFFFF8F899DD888888888888D9DD8F8FFFFFF8F
      8DDDD444444444444DDDD4BBBBBBBBBB4DDDD444444444444DDDD8F8FFFFFF8F
      8DDDD8F8FFFFFF8F8DDDD888888888888DDDDDDDDDDDDDDDDDDD}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BtnPreparaRigaClick
  end
  object BtnPulisci: TCSBitBtn
    Left = 119
    Top = 256
    Width = 58
    Height = 24
    TabOrder = 3
    OnClick = BtnPulisciClick
    GlyphLibraryIndex = 117
  end
  object QRighepreparate: TCSEQuery
    MultipleResults = False
    CommandText = #13#10
    EnableBCD = True
    Unidirectional = True
    SQL.Strings = (
      '')
    Left = 40
    Top = 280
  end
  object DS_RighePreparate: TDataSource
    DataSet = QRighepreparate
    Left = 160
    Top = 280
  end
end
