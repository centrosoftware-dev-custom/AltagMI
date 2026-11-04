object FrmDetailScarico: TFrmDetailScarico
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Preparazione Spedizioni'
  ClientHeight = 320
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GrpBx1: TGroupBox
    Left = 0
    Top = 294
    Width = 240
    Height = 26
    Align = alBottom
    TabOrder = 0
    object Btneliminariga: TCSBitBtn
      Left = 92
      Top = 0
      Width = 70
      Height = 25
      Caption = 'Elimina'
      TabOrder = 0
      OnClick = BtneliminarigaClick
      GlyphLibraryIndex = 161
    end
    object BtnChiudi: TCSBitBtn
      Left = 168
      Top = 0
      Width = 70
      Height = 25
      Caption = 'Esci'
      TabOrder = 1
      OnClick = BtnChiudiClick
      GlyphLibraryIndex = 127
    end
  end
  object griddettaglio: TSMDBGrid
    Left = 0
    Top = 0
    Width = 240
    Height = 294
    ExOptions = [eoBooleanAsCheckBox, eoCheckBoxSelect, eoKeepSelection, eoStandardPopup]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    KeyField = 'ID'
    WidthOfIndicator = 23
    ScrollBars = ssHorizontal
    ColCount = 9
    RowCount = 2
    Col = 1
    Row = 1
    Align = alClient
    DataSource = ds_dettaglio
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColumnMoved = griddettaglioColumnMoved
    Columns = <
      item
        Expanded = False
        FieldName = 'articolo'
        Title.Caption = 'Articolo'
        Width = 65
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'lotto'
        Title.Caption = 'Lotto'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'serie'
        Title.Caption = 'Serie'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'data_lotto'
        Title.Caption = 'Scad. Lotto'
        Visible = True
        DataType = dtData
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'qta1'
        Title.Caption = 'Q.ta 1'
        Visible = True
        DataType = dtNumerico
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'qta2'
        Title.Caption = 'Q.ta 2'
        Visible = True
        DataType = dtNumerico
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'qta3'
        Title.Caption = 'Q.ta 3'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'Um3'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end>
  end
  object qr_dettaglio: TCSEQuery
    MultipleResults = False
    CommandText = #13#10
    EnableBCD = True
    Unidirectional = True
    SQL.Strings = (
      '')
    Left = 88
    Top = 88
  end
  object ds_dettaglio: TDataSource
    DataSet = qr_dettaglio
    Left = 152
    Top = 80
  end
end
