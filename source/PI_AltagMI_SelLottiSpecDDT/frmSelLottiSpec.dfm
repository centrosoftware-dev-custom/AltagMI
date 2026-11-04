inherited FSelLottiSpec: TFSelLottiSpec
  Left = 391
  Top = 248
  HelpContext = 274
  BorderIcons = [biSystemMenu]
  Caption = 'Seleziona Lotto Specifico'
  ClientHeight = 502
  ClientWidth = 1020
  OnShow = CSfrmBaseShow
  ExplicitWidth = 1036
  ExplicitHeight = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlStdGen: TPanel
    Top = 461
    Width = 1020
    ExplicitTop = 461
    ExplicitWidth = 1020
    inherited PnlStdBtn: TPanel
      Left = 843
      ExplicitLeft = 843
    end
    inherited PnlStdStatus: TPanel
      Width = 843
      ExplicitWidth = 843
      inherited pnlTag: TPanel
        Width = 843
        ExplicitWidth = 843
        inherited TagList: TCSTagListEditor
          Width = 808
          ExplicitWidth = 808
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 1020
    Height = 65
    Align = alTop
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 1018
      Height = 57
      Align = alTop
      Caption = 'Informazioni Riga di Commessa'
      Enabled = False
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 17
        Width = 81
        Height = 13
        Caption = 'Articolo Generico'
      end
      object Label4: TLabel
        Left = 503
        Top = 17
        Width = 17
        Height = 13
        Caption = 'Qta'
      end
      object lblQta3: TLabel
        Left = 566
        Top = 36
        Width = 15
        Height = 13
        Caption = 'KG'
      end
      object Label2: TLabel
        Left = 588
        Top = 36
        Width = 56
        Height = 13
        Caption = 'Tot. Inserito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 332
        Top = 17
        Width = 17
        Height = 13
        Caption = 'Qta'
      end
      object Label7: TLabel
        Left = 418
        Top = 17
        Width = 17
        Height = 13
        Caption = 'Qta'
      end
      object lblQta1: TLabel
        Left = 393
        Top = 36
        Width = 15
        Height = 13
        Caption = 'KG'
      end
      object lblQta2: TLabel
        Left = 479
        Top = 36
        Width = 15
        Height = 13
        Caption = 'KG'
      end
      object Label10: TLabel
        Left = 648
        Top = 17
        Width = 17
        Height = 13
        Caption = 'Qta'
      end
      object lblQta3rim: TLabel
        Left = 889
        Top = 36
        Width = 15
        Height = 13
        Caption = 'KG'
      end
      object Label12: TLabel
        Left = 823
        Top = 17
        Width = 17
        Height = 13
        Caption = 'Qta'
      end
      object lblQta2Rim: TLabel
        Left = 799
        Top = 36
        Width = 15
        Height = 13
        Caption = 'KG'
      end
      object Label14: TLabel
        Left = 734
        Top = 17
        Width = 17
        Height = 13
        Caption = 'Qta'
      end
      object lblQta1Rim: TLabel
        Left = 709
        Top = 36
        Width = 15
        Height = 13
        Caption = 'KG'
      end
      object lblSpessore: TLabel
        Left = 929
        Top = 17
        Width = 44
        Height = 13
        Caption = 'Spessore'
      end
      object F2IDArticoGen: TF2
        Left = 3
        Top = 32
        Width = 323
        Height = 21
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
        F2Table = ArticoC
        EmptyOk = True
        OpenThread = False
        GridWidth = 500
        GridHeight = 160
        DropDownAlign = daLeft
        DropDownWidth = 500
        ReadOnly = True
        DropDownRows = 0
      end
      object edtQta3: TCSEdit
        Left = 503
        Top = 32
        Width = 55
        Height = 21
        DataType = dtNumerico
        TabOrder = 1
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
      object edtQta1Rim: TCSEdit
        Left = 648
        Top = 32
        Width = 55
        Height = 21
        DataType = dtNumerico
        TabOrder = 2
        Alignment = taRightJustify
        AllowNegative = True
        AutoMode = amDisable
        BlankWhenZero = False
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
      object edtQta2: TCSEdit
        Left = 418
        Top = 33
        Width = 55
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
      object edtQta1: TCSEdit
        Left = 332
        Top = 32
        Width = 55
        Height = 21
        DataType = dtNumerico
        TabOrder = 4
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
      object edtQta3Rim: TCSEdit
        Left = 823
        Top = 32
        Width = 55
        Height = 21
        DataType = dtNumerico
        TabOrder = 5
        Alignment = taRightJustify
        AllowNegative = True
        AutoMode = amDisable
        BlankWhenZero = False
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
      object edtQta2Rim: TCSEdit
        Left = 734
        Top = 32
        Width = 55
        Height = 21
        DataType = dtNumerico
        TabOrder = 6
        Alignment = taRightJustify
        AllowNegative = True
        AutoMode = amDisable
        BlankWhenZero = False
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
    end
    object edtSpessore: TCSEdit
      Left = 929
      Top = 33
      Width = 80
      Height = 21
      TabOrder = 1
      OnExit = edtSpessoreExit
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
  object Panel6: TPanel
    Left = 0
    Top = 65
    Width = 1020
    Height = 396
    Align = alClient
    TabOrder = 2
    object CSSplitter1: TCSSplitter
      Left = 1
      Top = 201
      Width = 1018
      Height = 5
      Cursor = crVSplit
      Align = alTop
      Appearance.BorderColor = clNone
      Appearance.BorderColorHot = clNone
      Appearance.Color = clWhite
      Appearance.ColorTo = clSilver
      Appearance.ColorHot = clWhite
      Appearance.ColorHotTo = clGray
      GripStyle = sgDots
      ExplicitWidth = 194
    end
    object Panel2: TPanel
      Left = 1
      Top = 206
      Width = 1018
      Height = 189
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1018
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 1018
          Height = 97
          Align = alClient
          Caption = 'Lotto Specifico Selezionato'
          TabOrder = 0
          object Label3: TLabel
            Left = 7
            Top = 16
            Width = 71
            Height = 13
            Caption = 'Lotto Specifico'
          end
          object Label5: TLabel
            Left = 195
            Top = 17
            Width = 44
            Height = 13
            Caption = 'Qta UMV'
            Visible = False
          end
          object lblUM1Spec: TLabel
            Left = 255
            Top = 34
            Width = 15
            Height = 13
            Caption = 'KG'
            Visible = False
          end
          object Label8: TLabel
            Left = 281
            Top = 17
            Width = 46
            Height = 13
            Caption = 'Qta UMM'
          end
          object lblUM2Spec: TLabel
            Left = 340
            Top = 34
            Width = 15
            Height = 13
            Caption = 'KG'
          end
          object lblUm3SPec: TLabel
            Left = 424
            Top = 34
            Width = 15
            Height = 13
            Caption = 'KG'
          end
          object Label13: TLabel
            Left = 365
            Top = 17
            Width = 40
            Height = 13
            Caption = 'Qta UMI'
          end
          object Label9: TLabel
            Left = 458
            Top = 17
            Width = 24
            Height = 13
            Caption = 'Base'
          end
          object Label11: TLabel
            Left = 534
            Top = 34
            Width = 7
            Height = 13
            Caption = 'X'
          end
          object Label15: TLabel
            Left = 552
            Top = 16
            Width = 34
            Height = 13
            Caption = 'Altezza'
          end
          object Label16: TLabel
            Left = 640
            Top = 16
            Width = 43
            Height = 13
            Caption = 'N. Lastre'
          end
          object Label17: TLabel
            Left = 622
            Top = 34
            Width = 7
            Height = 13
            Caption = 'X'
          end
          object Label18: TLabel
            Left = 459
            Top = 54
            Width = 62
            Height = 13
            Caption = 'Riferimento 3'
          end
          object F2IDLotSer: TF2
            Left = 5
            Top = 31
            Width = 182
            Height = 21
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            NumCol = 0
            BtnEnabled = False
            ListFieldIndex = 0
            KeyValue = 0
            MultiSelez = False
            ReadBarcode = False
            F2Table = LotSer
            EmptyOk = True
            OpenThread = False
            GridWidth = 400
            GridHeight = 160
            DropDownAlign = daLeft
            DropDownWidth = 400
            ReadOnly = True
            DropDownRows = 0
          end
          object edtQta1Sel: TCSEdit
            Left = 193
            Top = 31
            Width = 55
            Height = 21
            DataType = dtNumerico
            TabOrder = 1
            Visible = False
            OnExit = edtQta1SelExit
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
          object btnSel: TCSBitBtn
            Left = 236
            Top = 58
            Width = 181
            Height = 31
            Hint = 'Aggiungi al DDT'
            Caption = 'Aggiungi'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnSelClick
            GlyphLibraryIndex = 460
          end
          object edtQta2Sel: TCSEdit
            Left = 279
            Top = 31
            Width = 55
            Height = 21
            DataType = dtNumerico
            TabOrder = 3
            OnExit = edtQta2SelExit
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
          object edtQta3Sel: TCSEdit
            Left = 362
            Top = 31
            Width = 55
            Height = 21
            DataType = dtNumerico
            TabOrder = 4
            OnExit = edtQta3SelExit
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
          object CSBitBtn1: TCSBitBtn
            Left = 2
            Top = 58
            Width = 181
            Height = 31
            Caption = 'Elimina'
            TabOrder = 5
            OnClick = CSBitBtn1Click
            GlyphLibraryIndex = 101
          end
          object edtBase: TCSEdit
            Left = 456
            Top = 31
            Width = 66
            Height = 21
            DataType = dtNumerico
            TabOrder = 6
            Alignment = taRightJustify
            AllowNegative = True
            AutoMode = amDisable
            BlankWhenZero = False
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
          object edtAlt: TCSEdit
            Left = 549
            Top = 31
            Width = 66
            Height = 21
            DataType = dtNumerico
            TabOrder = 7
            Alignment = taRightJustify
            AllowNegative = True
            AutoMode = amDisable
            BlankWhenZero = False
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
          object CSBitBtn2: TCSBitBtn
            Left = 709
            Top = 27
            Width = 76
            Height = 26
            Caption = 'Calcola'
            TabOrder = 9
            OnClick = CSBitBtn2Click
            GlyphLibraryIndex = 0
          end
          object edtNum: TCSEdit
            Left = 638
            Top = 31
            Width = 65
            Height = 21
            DataType = dtNumerico
            TabOrder = 8
            Alignment = taRightJustify
            AllowNegative = True
            AutoMode = amDisable
            BlankWhenZero = False
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
          object edtRiferi3: TCSEdit
            Left = 458
            Top = 68
            Width = 245
            Height = 21
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
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 97
        Width = 1018
        Height = 92
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 1018
          Height = 92
          Align = alClient
          Caption = 'Lotti Specifici Selezionati'
          TabOrder = 0
          object smdbgLottiSel: TSMDBGrid
            Left = 2
            Top = 15
            Width = 1014
            Height = 75
            ExOptions = [eoKeepSelection, eoStandardPopup]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            KeyField = 'ID'
            WidthOfIndicator = 14
            ScrollBars = ssHorizontal
            ColCount = 12
            RowCount = 2
            Col = 1
            Row = 1
            Align = alClient
            DataSource = dsLottiSel
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CODICE'
                Title.Caption = 'Cod. Art.'
                Visible = True
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'DEsCR'
                Title.Caption = 'Descr. Art.'
                Visible = True
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'NUMLOT'
                Title.Caption = 'Num. Lot.'
                Visible = True
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'NUMSER'
                Title.Caption = 'Num. Ser.'
                Visible = True
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'QTAINV'
                Title.Caption = 'Qta Inv. Lotto'
                Visible = True
                DataType = dtNumerico
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'QTA1'
                Title.Caption = 'Qta 1 Bolla'
                Visible = True
                DataType = dtNumerico
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'UM1'
                Title.Caption = 'UM 1 Bolla'
                Visible = True
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'QTA2'
                Title.Caption = 'Qta 2 Bolla'
                Visible = True
                DataType = dtNumerico
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'UM2'
                Title.Caption = 'UM 2 Bolla'
                Visible = True
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'QTA3'
                Title.Caption = 'Qta 3 Bolla'
                Visible = True
                DataType = dtNumerico
                DigitsDec = 3
                DigitsInt = 15
              end
              item
                Expanded = False
                FieldName = 'UM3'
                Title.Caption = 'UM 3 Bolla'
                Visible = True
                DigitsDec = 3
                DigitsInt = 15
              end>
          end
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1018
      Height = 200
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1018
        Height = 200
        Align = alClient
        TabOrder = 0
        object CSSplitter2: TCSSplitter
          Left = 561
          Top = 1
          Width = 5
          Height = 198
          Align = alRight
          Appearance.BorderColor = clNone
          Appearance.BorderColorHot = clNone
          Appearance.Color = clWhite
          Appearance.ColorTo = clSilver
          Appearance.ColorHot = clWhite
          Appearance.ColorHotTo = clGray
          GripStyle = sgDots
          ExplicitLeft = 612
        end
        object Panel7: TPanel
          Left = 566
          Top = 1
          Width = 451
          Height = 198
          Align = alRight
          TabOrder = 0
          object GroupBox5: TGroupBox
            Left = 1
            Top = 1
            Width = 449
            Height = 196
            Align = alClient
            Caption = 'Lotti gi'#224' in spedizione per l'#39'articolo'
            TabOrder = 0
            object smdbgLottoDDT: TSMDBGrid
              Left = 2
              Top = 15
              Width = 445
              Height = 179
              ExOptions = [eoKeepSelection, eoStandardPopup]
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              KeyField = 'ID'
              WidthOfIndicator = 14
              ScrollBars = ssHorizontal
              ColCount = 13
              RowCount = 2
              Col = 1
              Row = 1
              Align = alClient
              DataSource = dsLottoDDT
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'QTA1'
                  Title.Caption = 'Qta 1'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'UM1'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'QTA2'
                  Title.Caption = 'Qta 2'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'UM2'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'QTA3'
                  Title.Caption = 'Qta 3'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'UM3'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'DEsCR1'
                  Title.Caption = 'Cliente'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'ANNDOC'
                  Title.Caption = 'Anno DDT'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'NUMDOC'
                  Title.Caption = 'Num. Doc.'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'DATDOC'
                  Title.Caption = 'Data DDT'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'NUMLOT'
                  Title.Caption = 'Lotto'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'NUMSER'
                  Title.Caption = 'Num. Ser.'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end>
            end
          end
        end
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 560
          Height = 198
          Align = alClient
          Caption = 'Panel9'
          TabOrder = 1
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 558
            Height = 196
            Align = alClient
            Caption = 'Lotti Specifici Giacenti'
            TabOrder = 0
            object smdbgLottoSpec: TSMDBGrid
              Left = 2
              Top = 15
              Width = 554
              Height = 179
              ExOptions = [eoKeepSelection, eoStandardPopup]
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              KeyField = 'ID'
              WidthOfIndicator = 14
              ScrollBars = ssHorizontal
              ColCount = 13
              RowCount = 2
              Col = 1
              Row = 1
              Align = alClient
              DataSource = dsLottoSpec
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODICE'
                  Title.Caption = 'Cod. Art.'
                  Width = 100
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'DESCR'
                  Title.Caption = 'Descr. Art.'
                  Width = 200
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'NUMLOT'
                  Title.Caption = 'Num. Lot.'
                  Width = 80
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'NUMSER'
                  Title.Caption = 'Num. Ser.'
                  Width = 70
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'CODCLASSI'
                  Title.Caption = 'Cod. Classe'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'DESCRCLASSI'
                  Title.Caption = 'Descr. Classe'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'DESCRCATOMO'
                  Title.Caption = 'Descr. Cat.'
                  Visible = True
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'QTTGIAI'
                  Title.Caption = 'Qta Giac.'
                  Width = 50
                  Visible = True
                  DataType = dtNumerico
                  BlankWhenZero = False
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'QTTSPEI'
                  Title.Caption = 'Qta Sped.'
                  Width = 50
                  Visible = True
                  DataType = dtNumerico
                  BlankWhenZero = False
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'QTTIMPI'
                  Title.Caption = 'Qta Imp.'
                  Width = 50
                  Visible = True
                  DataType = dtNumerico
                  BlankWhenZero = False
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'QTTORDI'
                  Title.Caption = 'Qta Ord.'
                  Width = 50
                  Visible = True
                  DataType = dtNumerico
                  BlankWhenZero = False
                  DigitsDec = 3
                  DigitsInt = 15
                end
                item
                  Expanded = False
                  FieldName = 'QTTDISPI'
                  Title.Caption = 'Qta Disp.'
                  Width = 50
                  Visible = True
                  DataType = dtNumerico
                  BlankWhenZero = False
                  DigitsDec = 3
                  DigitsInt = 15
                end>
            end
          end
        end
      end
    end
  end
  object dsLottoSpec: TDataSource
    DataSet = qryLottoSpec
    OnDataChange = dsLottoSpecDataChange
    Left = 48
    Top = 192
  end
  object qryLottoSpec: TQueryPars
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 80
    Top = 192
  end
  object qryLottiSel: TQueryPars
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 632
    Top = 408
  end
  object dsLottiSel: TDataSource
    DataSet = qryLottiSel
    Left = 568
    Top = 408
  end
  object dsLottoDDT: TDataSource
    DataSet = qryLottoDDT
    Left = 656
    Top = 208
  end
  object qryLottoDDT: TQueryPars
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 688
    Top = 208
  end
end
