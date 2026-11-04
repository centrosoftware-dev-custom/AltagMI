object FrmComrig: TFrmComrig
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Selezione riga commessa'
  ClientHeight = 309
  ClientWidth = 234
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
  object BitBtn1: TBitBtn
    Left = 0
    Top = 282
    Width = 234
    Height = 27
    Align = alBottom
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 0
    Width = 234
    Height = 282
    ExOptions = [eoKeepSelection, eoStandardPopup]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    KeyField = 'ID'
    WidthOfIndicator = 14
    ScrollBars = ssHorizontal
    ColCount = 3
    RowCount = 2
    Col = 1
    Row = 1
    Align = alClient
    DataSource = DS
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codice'
        Width = 118
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'OMASCM'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end>
  end
  object DS: TDataSource
    Left = 80
    Top = 120
  end
end
