object FrmGstVenLastre: TFrmGstVenLastre
  Left = 223
  Top = 227
  Caption = 'Visualizza viste'
  ClientHeight = 266
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 57
      Height = 13
      Caption = 'Nome Vista:'
    end
    object cbxViste: TSelBox
      Left = 68
      Top = 7
      Width = 245
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbxVisteChange
    end
  end
  object DBGrid1: TSMDBGrid
    Left = 0
    Top = 41
    Width = 456
    Height = 225
    ExOptions = [eoNoLayout, eoStandardPopup, eoDisableOrder]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgMultiSelect]
    KeyField = 'ID'
    WidthOfIndicator = 14
    ScrollBars = ssHorizontal
    ColCount = 2
    RowCount = 2
    Col = 1
    Row = 1
    Align = alClient
    DataSource = SrcList
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object SrcList: TDataSource
    DataSet = QryList
    Left = 318
    Top = 49
  end
  object QryList: TQueryPars
    MultipleResults = False
    CommandText = ''
    EnableBCD = True
    Unidirectional = True
    SQL.Strings = (
      '')
    Left = 358
    Top = 49
  end
end
