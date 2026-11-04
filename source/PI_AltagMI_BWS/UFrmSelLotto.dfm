object FrmSelLotto: TFrmSelLotto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Selezione Lotto....'
  ClientHeight = 248
  ClientWidth = 195
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
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 195
    Height = 218
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 185
    ExplicitHeight = 121
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 1
      Width = 193
      Height = 216
      ExOptions = [eoKeepSelection, eoStandardPopup]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      KeyField = 'ID'
      WidthOfIndicator = 14
      ScrollBars = ssHorizontal
      ColCount = 2
      RowCount = 2
      Col = 1
      Row = 1
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'numser'
          Width = 153
          Visible = True
          DigitsDec = 3
          DigitsInt = 15
        end>
    end
  end
  object pnlBtn: TPanel
    Left = 0
    Top = 218
    Width = 195
    Height = 30
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 217
    object btnOk: TBitBtn
      Left = 4
      Top = 2
      Width = 99
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnAnnulla: TBitBtn
      Left = 107
      Top = 2
      Width = 82
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    Left = 40
    Top = 56
  end
end
