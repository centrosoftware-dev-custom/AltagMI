object FrmGstPI: TFrmGstPI
  Left = 316
  Top = 122
  Caption = 'Preventivo Industriale'
  ClientHeight = 449
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 101
    Width = 605
    Height = 314
    ActivePage = TabDatiTec
    Align = alBottom
    TabOrder = 1
    OnChange = PageControl1Change
    object TabDatiTec: TTabSheet
      Caption = 'Dati Tecnici'
      object Label4: TLabel
        Left = 14
        Top = 55
        Width = 43
        Height = 13
        Caption = 'Materiale'
      end
      object Label5: TLabel
        Left = 14
        Top = 105
        Width = 44
        Height = 13
        Caption = 'Spessore'
      end
      object Label6: TLabel
        Left = 64
        Top = 105
        Width = 40
        Height = 13
        Caption = 'Quantit'#224
      end
      object Label7: TLabel
        Left = 114
        Top = 105
        Width = 34
        Height = 13
        Caption = 'Finitura'
      end
      object Lab_Spessore: TLabel
        Left = 14
        Top = 130
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Lab_Qta: TLabel
        Left = 64
        Top = 130
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Lab_finitura: TLabel
        Left = 114
        Top = 130
        Width = 6
        Height = 13
        Caption = '0'
      end
      object Label2: TLabel
        Left = 164
        Top = 105
        Width = 46
        Height = 13
        Caption = 'F mm/min'
      end
      object Label8: TLabel
        Left = 224
        Top = 105
        Width = 56
        Height = 13
        Caption = 'Spazio Rall.'
      end
      object Label9: TLabel
        Left = 284
        Top = 105
        Width = 32
        Height = 13
        Caption = '% Rall.'
      end
      object Label10: TLabel
        Left = 342
        Top = 105
        Width = 89
        Height = 13
        Caption = 'Tempo Forat. (sec)'
      end
      object Label17: TLabel
        Left = 451
        Top = 97
        Width = 60
        Height = 26
        Caption = 'Tempo Attrezz. (min)'
        WordWrap = True
      end
      object Label14: TLabel
        Left = 517
        Top = 97
        Width = 63
        Height = 26
        Caption = 'Tempo Previsto (min)'
        WordWrap = True
      end
      object Label24: TLabel
        Left = 14
        Top = 11
        Width = 92
        Height = 13
        Caption = 'Lavorazione / Cella'
      end
      object Label26: TLabel
        Left = 451
        Top = 55
        Width = 27
        Height = 13
        Caption = 'Costo'
      end
      object Label27: TLabel
        Left = 517
        Top = 55
        Width = 51
        Height = 13
        Caption = 'Tipo Costo'
      end
      object Label28: TLabel
        Left = 319
        Top = 55
        Width = 44
        Height = 13
        Caption = 'Peso uni.'
      end
      object Label29: TLabel
        Left = 382
        Top = 55
        Width = 57
        Height = 13
        Caption = 'Peso Totale'
      end
      object lblPesoUni: TLabel
        Left = 319
        Top = 73
        Width = 27
        Height = 13
        Caption = '0       '
      end
      object lblPesoTot: TLabel
        Left = 382
        Top = 73
        Width = 27
        Height = 13
        Caption = '0       '
      end
      object F2Materiale: TF2
        Left = 14
        Top = 70
        Width = 303
        Height = 21
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OrderColIndex = 1
        NumCol = 0
        BtnEnabled = True
        ListFieldTypes = 'Stringa;Stringa'
        ListFieldIndex = 1
        KeyValue = 0
        OnKeyChange = F2MaterialeKeyChange
        MultiSelez = False
        ReadBarcode = False
        F2Table = ArticoD
        EmptyOk = True
        OpenThread = False
        GridWidth = 481
        GridHeight = 160
        DropDownAlign = daLeft
        GridColTypes = 'Stringa;Stringa'
        GridColTitles = 'Codice;Descrizione'
        DropDownWidth = 481
        ReadOnly = True
        DropDownRows = 0
      end
      object GB_Sviluppo: TCSGroupBox
        Left = 12
        Top = 165
        Width = 185
        Height = 120
        Caption = ' Dati Svilpuppo '
        ParentCtl3D = True
        TabOrder = 10
        object Label11: TLabel
          Left = 16
          Top = 33
          Width = 79
          Height = 13
          Caption = 'Sviluppo Lineare'
        end
        object Label12: TLabel
          Left = 16
          Top = 76
          Width = 45
          Height = 13
          Caption = 'N. Spigoli'
        end
        object Label13: TLabel
          Left = 16
          Top = 55
          Width = 39
          Height = 13
          Caption = 'N. Profili'
        end
        object Label22: TLabel
          Left = 16
          Top = 98
          Width = 74
          Height = 13
          Caption = 'Sviluppo Cerchi'
        end
        object Edt_SvilLin: TEdit
          Left = 104
          Top = 29
          Width = 69
          Height = 21
          TabOrder = 0
          Text = '0'
          OnChange = Edt_SvilLinChange
          OnExit = Edt_SvilLinExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object Edt_NProf: TEdit
          Left = 104
          Top = 51
          Width = 69
          Height = 21
          TabOrder = 1
          Text = '0'
          OnChange = Edt_SvilLinChange
          OnExit = Edt_NProfExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object Edt_NSpig: TEdit
          Left = 104
          Top = 72
          Width = 69
          Height = 21
          TabOrder = 2
          Text = '0'
          OnChange = Edt_SvilLinChange
          OnExit = Edt_NProfExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object edt_SvilCerchi: TEdit
          Left = 104
          Top = 94
          Width = 69
          Height = 21
          TabOrder = 3
          Text = '0'
          OnChange = Edt_SvilLinChange
          OnExit = Edt_SvilLinExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
      end
      object GB_CostoTaglio: TCSGroupBox
        Left = 195
        Top = 165
        Width = 215
        Height = 120
        Caption = ' Calcolo Sviluppo '
        ParentCtl3D = True
        TabOrder = 11
        object Label15: TLabel
          Left = 16
          Top = 33
          Width = 78
          Height = 13
          Caption = 'Tot. Taglio 1 Pz.'
        end
        object Label16: TLabel
          Left = 16
          Top = 59
          Width = 64
          Height = 13
          Caption = 'Totale Ordine'
        end
        object Edt_TotTaglio1Pz: TEdit
          Left = 104
          Top = 29
          Width = 69
          Height = 21
          TabOrder = 0
          Text = '0'
          OnExit = Edt_TotTaglio1PzExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object Edt_TotOrd: TEdit
          Left = 104
          Top = 55
          Width = 69
          Height = 21
          TabOrder = 1
          Text = '0'
          OnExit = Edt_TotTaglio1PzExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object SG_CSvil: TStringGrid
          Left = 3
          Top = 16
          Width = 209
          Height = 101
          Align = alClient
          ColCount = 3
          DefaultRowHeight = 15
          FixedCols = 0
          RowCount = 21
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
          TabOrder = 2
          OnKeyPress = SG_CSvilKeyPress
          OnSetEditText = SG_CSvilSetEditText
          ColWidths = (
            64
            54
            64)
        end
      end
      object GB_Lastre: TCSGroupBox
        Left = 407
        Top = 165
        Width = 186
        Height = 120
        Caption = ' Lastre  '
        ParentCtl3D = True
        TabOrder = 12
        object Label18: TLabel
          Left = 16
          Top = 33
          Width = 34
          Height = 13
          Caption = 'Altezza'
        end
        object Label19: TLabel
          Left = 16
          Top = 55
          Width = 52
          Height = 13
          Caption = 'Lunghezza'
        end
        object Label20: TLabel
          Left = 16
          Top = 98
          Width = 43
          Height = 13
          Caption = 'N. Lastre'
        end
        object Label21: TLabel
          Left = 16
          Top = 76
          Width = 79
          Height = 13
          Caption = 'N. Pezzi x Lastra'
        end
        object edt_Altezza: TEdit
          Left = 104
          Top = 29
          Width = 69
          Height = 21
          TabOrder = 0
          Text = '0'
          OnExit = Edt_SvilLinExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object edt_Lunghezza: TEdit
          Left = 104
          Top = 51
          Width = 69
          Height = 21
          TabOrder = 1
          Text = '0'
          OnExit = Edt_SvilLinExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object edt_NLastre: TEdit
          Left = 104
          Top = 94
          Width = 69
          Height = 21
          TabOrder = 3
          Text = '0'
          OnExit = edt_NLastreExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
        object Edt_PezziLastra: TEdit
          Left = 104
          Top = 72
          Width = 69
          Height = 21
          TabOrder = 2
          Text = '0'
          OnChange = Edt_PezziLastraChange
          OnExit = Edt_NProfExit
          OnKeyPress = Edt_SvilLinKeyPress
        end
      end
      object Edt_Fmmmin: TEdit
        Left = 164
        Top = 126
        Width = 58
        Height = 21
        TabOrder = 4
        Text = '0'
        OnChange = Edt_SvilLinChange
        OnExit = Edt_SvilLinExit
        OnKeyPress = Edt_SvilLinKeyPress
      end
      object Edt_SpazioRall: TEdit
        Left = 224
        Top = 126
        Width = 58
        Height = 21
        TabOrder = 5
        Text = '0'
        OnChange = Edt_SvilLinChange
        OnExit = Edt_SvilLinExit
        OnKeyPress = Edt_SvilLinKeyPress
      end
      object Edt_Rall: TEdit
        Left = 284
        Top = 126
        Width = 58
        Height = 21
        TabOrder = 6
        Text = '0'
        OnChange = Edt_SvilLinChange
        OnExit = Edt_RallExit
        OnKeyPress = Edt_SvilLinKeyPress
      end
      object Edt_TForat: TEdit
        Left = 344
        Top = 126
        Width = 58
        Height = 21
        TabOrder = 7
        Text = '0'
        OnChange = Edt_SvilLinChange
        OnExit = Edt_SvilLinExit
        OnKeyPress = Edt_SvilLinKeyPress
      end
      object Edt_TAttr: TEdit
        Left = 451
        Top = 126
        Width = 58
        Height = 21
        TabOrder = 8
        Text = '0'
        OnExit = Edt_SvilLinExit
        OnKeyPress = Edt_SvilLinKeyPress
      end
      object Edt_TempoPrev: TEdit
        Left = 517
        Top = 126
        Width = 58
        Height = 21
        TabOrder = 9
        Text = '0'
        OnExit = Edt_SvilLinExit
        OnKeyPress = Edt_SvilLinKeyPress
      end
      object F2Lav: TF2
        Left = 14
        Top = 26
        Width = 303
        Height = 21
        BevelOuter = bvNone
        BorderStyle = bsSingle
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OrderColIndex = 1
        NumCol = 0
        BtnEnabled = True
        ListFieldTypes = 'Stringa;Stringa'
        ListFieldIndex = 1
        KeyValue = 0
        OnKeyChange = F2LavKeyChange
        MultiSelez = False
        ReadBarcode = False
        F2Table = Lavorazioni
        EmptyOk = True
        OpenThread = False
        GridWidth = 481
        GridHeight = 160
        DropDownAlign = daLeft
        GridColTypes = 'Stringa;Stringa'
        GridColTitles = 'Codice;Descrizione'
        DropDownWidth = 481
        ReadOnly = True
        DropDownRows = 0
      end
      object edt_Costo: TEdit
        Left = 451
        Top = 70
        Width = 58
        Height = 21
        TabOrder = 2
        Text = '0'
        OnKeyPress = edt_CostoKeyPress
      end
      object edt_TCosto: TEdit
        Left = 517
        Top = 70
        Width = 58
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = '0'
        OnExit = Edt_SvilLinExit
      end
    end
    object TabDatiCom: TTabSheet
      Caption = 'Dati Comerciali'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblMat: TLabel
        Left = 4
        Top = 26
        Width = 67
        Height = 13
        Caption = 'Materie Prime:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblRicarico: TLabel
        Left = 316
        Top = 4
        Width = 48
        Height = 13
        Caption = 'Ricarico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblImpRicarico: TLabel
        Left = 372
        Top = 4
        Width = 94
        Height = 13
        Caption = 'Importo Ricarico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLavInt: TLabel
        Left = 4
        Top = 50
        Width = 75
        Height = 13
        Caption = 'Lavorazioni Int.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblLavEst: TLabel
        Left = 4
        Top = 74
        Width = 78
        Height = 13
        Caption = 'Lavorazioni Est.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTotali: TLabel
        Left = 4
        Top = 112
        Width = 41
        Height = 13
        Caption = 'Totale:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl: TLabel
        Left = 4
        Top = 152
        Width = 182
        Height = 13
        Caption = 'Ricarico ulteriore su totale precedente:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label23: TLabel
        Left = 4
        Top = 176
        Width = 137
        Height = 13
        Caption = 'Sconto su totale precedente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LblCostoUni: TLabel
        Left = 88
        Top = 4
        Width = 111
        Height = 13
        Caption = 'Costo Unitario (ric.)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 4
        Top = 216
        Width = 94
        Height = 13
        Caption = 'Totale generale:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCostoTot: TLabel
        Left = 202
        Top = 4
        Width = 73
        Height = 13
        Caption = 'Costo Totale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCostoRic: TLabel
        Left = 484
        Top = 4
        Width = 95
        Height = 13
        Caption = 'Costo Ricaricato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtMa: TEdit
        Left = 202
        Top = 20
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object edtPeMCMa: TEdit
        Left = 316
        Top = 20
        Width = 50
        Height = 21
        TabOrder = 2
        OnExit = edtPeMCMaExit
        OnKeyPress = edtPeMCMaKeyPress
      end
      object edtImpMa: TEdit
        Left = 370
        Top = 20
        Width = 110
        Height = 21
        TabOrder = 3
        OnExit = edtImpMaExit
        OnKeyPress = edtImpMaKeyPress
      end
      object edtLI: TEdit
        Left = 202
        Top = 44
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
      end
      object edtPeMCLI: TEdit
        Left = 316
        Top = 44
        Width = 50
        Height = 21
        TabOrder = 7
        OnExit = edtPeMCMaExit
        OnKeyPress = edtPeMCMaKeyPress
      end
      object edtImpLI: TEdit
        Left = 370
        Top = 44
        Width = 110
        Height = 21
        TabOrder = 8
        OnExit = edtImpMaExit
        OnKeyPress = edtImpMaKeyPress
      end
      object edtLE: TEdit
        Left = 202
        Top = 68
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 11
      end
      object edtPeMCLE: TEdit
        Left = 316
        Top = 68
        Width = 50
        Height = 21
        TabOrder = 12
        OnExit = edtPeMCMaExit
        OnKeyPress = edtPeMCMaKeyPress
      end
      object edtImpLE: TEdit
        Left = 370
        Top = 68
        Width = 110
        Height = 21
        TabOrder = 13
        OnExit = edtImpMaExit
        OnKeyPress = edtImpMaKeyPress
      end
      object edtTot: TEdit
        Left = 202
        Top = 108
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 15
      end
      object edtTotImp: TEdit
        Left = 370
        Top = 108
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 17
      end
      object edtTotPrec1: TEdit
        Left = 484
        Top = 108
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 18
      end
      object edtPeUlMC: TEdit
        Left = 316
        Top = 148
        Width = 50
        Height = 21
        TabOrder = 19
        OnExit = edtPeMCMaExit
        OnKeyPress = edtPeMCMaKeyPress
      end
      object edtImpUl: TEdit
        Left = 370
        Top = 148
        Width = 110
        Height = 21
        TabOrder = 20
        OnExit = edtImpMaExit
        OnKeyPress = edtImpMaKeyPress
      end
      object edtTotPrec2: TEdit
        Left = 484
        Top = 148
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 21
      end
      object edtPeUlSc: TEdit
        Left = 316
        Top = 172
        Width = 50
        Height = 21
        TabOrder = 22
        OnExit = edtPeMCMaExit
        OnKeyPress = edtPeMCMaKeyPress
      end
      object edtImpSc: TEdit
        Left = 370
        Top = 172
        Width = 110
        Height = 21
        TabOrder = 23
        OnExit = edtImpMaExit
        OnKeyPress = edtImpMaKeyPress
      end
      object Panel1: TPanel
        Left = 481
        Top = 210
        Width = 116
        Height = 26
        BevelInner = bvLowered
        TabOrder = 27
        object edtTotale: TEdit
          Left = 2
          Top = 2
          Width = 110
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object edtTotMC: TEdit
        Left = 316
        Top = 108
        Width = 50
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 16
      end
      object edtTotGen: TEdit
        Left = 202
        Top = 212
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 24
      end
      object edtTotMCGen: TEdit
        Left = 316
        Top = 212
        Width = 50
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 25
      end
      object edtTotImpGen: TEdit
        Left = 370
        Top = 212
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        MaxLength = 110
        ReadOnly = True
        TabOrder = 26
      end
      object edtLEUni: TEdit
        Left = 88
        Top = 68
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 10
      end
      object edtLIUni: TEdit
        Left = 88
        Top = 44
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
      end
      object edtMaUni: TEdit
        Left = 88
        Top = 20
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edtLERic: TEdit
        Left = 484
        Top = 68
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 14
      end
      object edtLIRic: TEdit
        Left = 484
        Top = 44
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
      end
      object edtMaRic: TEdit
        Left = 484
        Top = 20
        Width = 110
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
      end
    end
    object TabStorico: TTabSheet
      Caption = 'Storico ultimi carichi'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SMDBGridStorico: TSMDBGrid
        Left = 0
        Top = 0
        Width = 597
        Height = 286
        ExOptions = [eoKeepSelection, eoStandardPopup]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        KeyField = 'ID'
        WidthOfIndicator = 14
        ScrollBars = ssHorizontal
        ColCount = 32
        RowCount = 2
        Col = 1
        Row = 1
        Align = alClient
        DataSource = DsStorico
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODFOR'
            Title.Caption = 'Codice fornitore'
            Width = 72
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DESCRFOR'
            Title.Caption = 'Descr fornitore'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DESCRDDT'
            Title.Caption = 'Descrizione DDT'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'NUMDDT'
            Title.Alignment = taRightJustify
            Title.Caption = 'Numero DDT'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'ANNDDT'
            Title.Alignment = taRightJustify
            Title.Caption = 'Anno DDT'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DATDDT'
            Title.Caption = 'Data DDT'
            Visible = True
            DataType = dtData
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DESCRFAT'
            Title.Caption = 'Tipo doc Fatt'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'NUMFAT'
            Title.Alignment = taRightJustify
            Title.Caption = 'Num. Fattura'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'ANNFAT'
            Title.Alignment = taRightJustify
            Title.Caption = 'Anno Fattura'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DATFAT'
            Title.Caption = 'Data Fattura'
            Visible = True
            DataType = dtData
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'CODCAU'
            Title.Caption = 'Codice causale'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DESCRCAU'
            Title.Caption = 'Descrizione causale'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'CODART'
            Title.Caption = 'Codice Articolo'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DESCRART'
            Title.Caption = 'Descrizione Articolo'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'NUMLOT'
            Title.Caption = 'Numero lotto'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'NUMSER'
            Title.Caption = 'Numero serie'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'DATMOV'
            Title.Caption = 'Data movimento'
            Visible = True
            DataType = dtData
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'QTAINV'
            Title.Alignment = taRightJustify
            Title.Caption = 'Q.t'#224' Inv'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'QTAMOV'
            Title.Alignment = taRightJustify
            Title.Caption = 'Q.t'#224' mov'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'QTAFOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Q.t'#224' For'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'VALUNI'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valore UNI'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'VALORE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Totale UNI'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'VALOREFOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valore UNI For'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'UMI'
            Title.Caption = 'U.M. Inv'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'CODVALUNI'
            Title.Caption = 'Valuta UNI'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'CAMBIO'
            Title.Alignment = taRightJustify
            Title.Caption = 'Cambio'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'VALUNIVAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valore UNI Valuta'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'VALVAL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Totale UNI Valuta'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'VALVALFOR'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valore UNI For'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'UMF'
            Title.Caption = 'U.M. For'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end
          item
            Expanded = False
            FieldName = 'CODVALVAL'
            Title.Caption = 'Valuta UNI For'
            Visible = True
            DigitsDec = 3
            DigitsInt = 15
          end>
      end
    end
  end
  object Pan_datitestata: TPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 101
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 15
      Width = 53
      Height = 20
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lab_Cliente: TLabel
      Left = 83
      Top = 15
      Width = 49
      Height = 20
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Codice'
    end
    object Lab_PF: TLabel
      Left = 59
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Codice'
    end
    object lblTipDoc: TLabel
      Left = 14
      Top = 78
      Width = 75
      Height = 13
      Caption = 'Tipo Preventivo'
    end
    object Lab_numPrev: TLabel
      Left = 294
      Top = 78
      Width = 3
      Height = 13
    end
    object F2IdTipiDoc: TF2
      Left = 101
      Top = 74
      Width = 182
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
      F2Table = TipiDoc
      EmptyOk = False
      OpenThread = False
      GridWidth = 300
      GridHeight = 160
      DropDownAlign = daLeft
      DropDownWidth = 300
      ReadOnly = True
      DropDownRows = 0
    end
    object edtTotaleUni: TEdit
      Left = 488
      Top = 74
      Width = 110
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Pan_CSButtons: TPanel
    Left = 0
    Top = 415
    Width = 605
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnStdAnnulla: TButton
      Left = 521
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Chiudi'
      TabOrder = 3
      OnClick = BtnStdAnnullaClick
    end
    object BtnAggOV: TButton
      Left = 403
      Top = 6
      Width = 112
      Height = 25
      Caption = 'Aggiorna OV e Chiudi'
      Default = True
      TabOrder = 2
      OnClick = BtnAggOVClick
    end
    object BtnCopia: TButton
      Left = 5
      Top = 6
      Width = 56
      Height = 25
      Caption = 'Copia'
      Default = True
      TabOrder = 0
      OnClick = BtnCopiaClick
    end
    object BtnIncolla: TButton
      Left = 67
      Top = 6
      Width = 57
      Height = 25
      Caption = 'Incolla'
      Default = True
      TabOrder = 1
      OnClick = BtnIncollaClick
    end
    object BtnStdOk: TButton
      Left = 241
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Salva PI'
      Default = True
      TabOrder = 4
      OnClick = BtnStdOkClick
    end
    object BtnStd2Ok: TButton
      Left = 322
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Salva e apri PI'
      Default = True
      TabOrder = 5
      OnClick = BtnStd2OkClick
    end
    object btStorico: TButton
      Left = 130
      Top = 6
      Width = 105
      Height = 25
      Caption = 'Storico ultimi carichi'
      Default = True
      TabOrder = 6
      OnClick = btStoricoClick
    end
  end
  object QryextvelAltatg: TCSEQuery
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 255
    Top = 24
  end
  object QrySelCompPrinc: TCSEQuery
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 330
    Top = 6
  end
  object QrySelOPDP: TCSEQuery
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 525
    Top = 9
  end
  object QrySelSdlMat: TCSEQuery
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 417
    Top = 63
  end
  object QrySelOPDTpf: TCSEQuery
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 183
    Top = 6
  end
  object QryNextNumOP: TCSEQuery
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 420
    Top = 3
  end
  object QrySelSdlFas: TCSEQuery
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 342
    Top = 63
  end
  object QryUpdtOpdtPF: TCSEQuery
    MultipleResults = False
    CommandText = #13#10
    EnableBCD = True
    Unidirectional = True
    SQL.Strings = (
      '')
    Left = 204
    Top = 99
  end
  object QryUpdtOpSDLMatPF: TCSEQuery
    MultipleResults = False
    CommandText = #13#10
    EnableBCD = True
    Unidirectional = True
    SQL.Strings = (
      '')
    Left = 102
    Top = 33
  end
  object QryStorico: TQueryPars
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    Left = 481
    Top = 9
  end
  object DsStorico: TDataSource
    DataSet = QryStorico
    Left = 480
    Top = 43
  end
end
