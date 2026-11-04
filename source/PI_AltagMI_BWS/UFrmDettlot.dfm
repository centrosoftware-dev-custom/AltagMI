object FrmDettLotti: TFrmDettLotti
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Dettaglio Lotti...'
  ClientHeight = 299
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnChiudi: TBitBtn
    Left = 0
    Top = 270
    Width = 246
    Height = 29
    Align = alBottom
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object GridLottiDett: TSMDBGrid
    Left = 0
    Top = 0
    Width = 246
    Height = 270
    ExOptions = [eoKeepSelection, eoStandardPopup]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    KeyField = 'ID'
    WidthOfIndicator = 14
    ScrollBars = ssHorizontal
    RowCount = 2
    Col = 1
    Row = 1
    Align = alClient
    DataSource = DsLot
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColumnMoved = GridLottiDettColumnMoved
    Columns = <
      item
        Expanded = False
        FieldName = 'numlot'
        Title.Caption = 'Lotto'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'datrif'
        Title.Caption = 'Scad. Lotto'
        Visible = True
        DataType = dtData
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Allocazione'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'qtaLotto'
        Title.Caption = 'Q.ta Inv.'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end>
  end
  object DsLot: TDataSource
    Left = 152
    Top = 224
  end
end
