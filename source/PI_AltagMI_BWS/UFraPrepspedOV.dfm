object Fra_PrepspedOV: TFra_PrepspedOV
  Left = 0
  Top = 0
  Width = 235
  Height = 281
  TabOrder = 0
  object PgcCtrl: TPageControl
    Left = 0
    Top = 0
    Width = 235
    Height = 281
    ActivePage = Testata
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object Testata: TTabSheet
      Caption = 'Testata'
      DesignSize = (
        227
        250)
      object LblNewBamTes: TLabel
        Left = 4
        Top = 8
        Width = 21
        Height = 13
        Caption = 'Rif.:'
      end
      object lblNumSpedizione: TLabel
        Left = 4
        Top = 159
        Width = 98
        Height = 13
        Caption = 'Numero Spedizione :'
      end
      object lblDesVettore: TLabel
        Left = 3
        Top = 114
        Width = 220
        Height = 36
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        WordWrap = True
        ExplicitWidth = 221
      end
      object LblVETT: TLabel
        Left = 3
        Top = 96
        Width = 43
        Height = 13
        Caption = 'Vettore :'
      end
      object EdtNewTestata: TCSEdit
        Left = 2
        Top = 27
        Width = 43
        Height = 21
        TabOrder = 0
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
      object EdtNumSpedizione: TCSEdit
        Left = 2
        Top = 175
        Width = 121
        Height = 21
        DataType = dtInt16
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
    end
    object Griglia: TTabSheet
      Caption = 'Griglia'
      ImageIndex = 3
      object GridRighepreparate: TSMDBGrid
        Left = 0
        Top = 0
        Width = 227
        Height = 200
        ExOptions = [eoDrawGraphicField, eoKeepSelection, eoStandardPopup]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        KeyField = 'ID'
        WidthOfIndicator = 14
        ScrollBars = ssHorizontal
        ColCount = 7
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
        OnColumnMoved = GridRighepreparateColumnMoved
        OnDrawColumnCell = GridRighepreparateDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'codArt'
            Title.Caption = 'Cod.Art'
            Width = 47
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'qtaComm'
            Title.Caption = 'Qta Comm.'
            Visible = True
            DataType = dtNumerico
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'qtaPrep'
            Title.Caption = 'Qta Prep.'
            Visible = True
            DataType = dtNumerico
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'kg'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DescrArt'
            Title.Caption = 'Des.Art'
            Width = 138
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'qtasped'
            Title.Caption = 'Qta Sped.'
            Visible = True
            DataType = dtNumerico
            DigitsDec = 3
            DigitsInt = 15
          end>
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 200
        Width = 227
        Height = 20
        Align = alBottom
        TabOrder = 1
        object lbl_cartoni: TLabel
          Left = 72
          Top = 3
          Width = 153
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Pnlbuttons: TPanel
        Left = 0
        Top = 220
        Width = 227
        Height = 30
        Align = alBottom
        TabOrder = 2
        object btnBarcode: TCSBitBtn
          Left = 117
          Top = 1
          Width = 109
          Height = 28
          Align = alClient
          Caption = 'GS1'
          TabOrder = 0
          GlyphLibraryIndex = 338
        end
        object btnDetail: TCSBitBtn
          Left = 1
          Top = 1
          Width = 116
          Height = 28
          Align = alLeft
          Caption = 'Dettaglio Letture'
          TabOrder = 1
          GlyphLibraryIndex = 162
        end
      end
    end
    object NewRiga: TTabSheet
      Caption = 'NewRiga'
      ImageIndex = 4
      DesignSize = (
        227
        250)
      object lbl_datalotto: TLabel
        Left = 28
        Top = 194
        Width = 63
        Height = 13
        Caption = 'Data Scad.  :'
      end
      object lblGiacenza: TLabel
        Left = 2
        Top = 10
        Width = 223
        Height = 50
        Cursor = crMultiDrag
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'Giacenza:'
      end
      object edtDataLotto: TCSEdit
        Left = 28
        Top = 211
        Width = 73
        Height = 21
        DataType = dtData
        TabOrder = 0
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
      object Btngiacenze: TButton
        Left = 155
        Top = 211
        Width = 22
        Height = 22
        Caption = 'G'
        TabOrder = 1
      end
      object btnPezzoSingolo: TBitBtn
        Left = 179
        Top = 181
        Width = 30
        Height = 24
        Caption = 'P.S.'
        TabOrder = 2
      end
    end
  end
  object QRighepreparate: TCSEQuery
    MultipleResults = False
    CommandText = #13#10
    EnableBCD = True
    Unidirectional = True
    SQL.Strings = (
      '')
    Left = 176
    Top = 96
  end
  object DS_RighePreparate: TDataSource
    DataSet = QRighepreparate
    Left = 176
    Top = 56
  end
end
