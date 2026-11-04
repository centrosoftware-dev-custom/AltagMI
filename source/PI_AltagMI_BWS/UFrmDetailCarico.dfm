object FrmDetailCarico: TFrmDetailCarico
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Carico a Magazzino'
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
    DesignSize = (
      240
      26)
    object Btneliminariga: TCSBitBtn
      Left = 92
      Top = 0
      Width = 70
      Height = 25
      Anchors = [akTop, akRight]
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
      Anchors = [akTop, akRight]
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    KeyField = 'ID'
    WidthOfIndicator = 23
    ScrollBars = ssHorizontal
    ColCount = 15
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
    Columns = <
      item
        Expanded = False
        FieldName = 'articolo'
        Title.Caption = 'Articolo'
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
        Title.Caption = 'Data Lot.'
        Visible = True
        DataType = dtData
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'tipoOA'
        Title.Caption = 'Descr. OA'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'Annoac'
        Title.Caption = 'Anno OA'
        Visible = True
        DataType = dtInt16
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'numoac'
        Title.Caption = 'Num OA'
        Visible = True
        DataType = dtInt16
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'datemi'
        Title.Caption = 'Data OA'
        Visible = True
        DataType = dtData
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'qtafor'
        Title.Caption = 'Qta Forn'
        Visible = True
        DataType = dtNumerico
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'umfor'
        Title.Caption = 'UM Forn'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'qtamov'
        Title.Caption = 'Qta Mov'
        Visible = True
        DataType = dtNumerico
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'ummov'
        Title.Caption = 'UM Mov'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'qtainv'
        Title.Caption = 'Qta Inv.'
        Visible = True
        DataType = dtNumerico
        DigitsDec = 3
        DigitsInt = 15
      end
      item
        Expanded = False
        FieldName = 'uminv'
        Title.Caption = 'UM Inv.'
        Visible = True
        DigitsDec = 3
        DigitsInt = 15
      end>
  end
  object qr_dettaglio: TCSEQuery
    MultipleResults = False
    CommandText = 
      'select '#13#10'  pra.id,'#13#10'  art.codice as articolo,'#13#10'  ls.NUMLOT as lo' +
      'tto,'#13#10'  ls.NUMSER as serie,'#13#10'  ls.Datrif as data_lotto,'#13#10'  td.DE' +
      'SCR as tipoOa, '#13#10'  oat.ANNOAC,'#13#10'  oat.NUMOAC,'#13#10'  oat.DATEMI,'#13#10'  ' +
      'pra.QTAORD as Qtafor, '#13#10'  pra.QTAORDI as Qtainv,'#13#10'  pra.QTAORDM ' +
      'as QtaMov,'#13#10'  um.CODICE as umFor,'#13#10'  um1.CODICE as umMov,'#13#10'  um2' +
      '.codice as umInv'#13#10'from PDTRIGACQ Pra '#13#10'join lotser ls on ls.id =' +
      ' pra.IDLOTSER'#13#10'join artico art on art.id = ls.IDARTICO'#13#10'left joi' +
      'n OACRIG oar on oar.id = pra.IDOACRIG'#13#10'left join OACTES oat on o' +
      'at.id = oar.IDOACTES'#13#10'left join tipidoc td on td.id = oat.IDTIPI' +
      'DOC'#13#10'left join umart um on um.id = pra.IDUMF'#13#10'left join umart um' +
      '1 on um1.id = pra.IDUMM'#13#10'left join umart um2 on um2.id = pra.IDU' +
      'MI'#13#10'where art.codice = ?'#13#10'and pra.ext_idfor = ?'#13#10'and pra.ext_idt' +
      'ipidoc =?'#13#10'and pra.ext_datdoc = ?'#13#10'and ext_numdoc = ?'#13#10'order by ' +
      'oat.ANNOAC,oat.NUMOAC,oat.DATEMI,oar.rigadoc'#13#10#0'doc'#13#10#0'adoc'#13#10#0'igad' +
      'oc'#13#10#0'oc'#13#10#0'doc'#13#10
    EnableBCD = True
    Unidirectional = True
    SQL.Strings = (
      'select '
      '  pra.id,'
      '  art.codice as articolo,'
      '  ls.NUMLOT as lotto,'
      '  ls.NUMSER as serie,'
      '  ls.Datrif as data_lotto,'
      '  td.DESCR as tipoOa, '
      '  oat.ANNOAC,'
      '  oat.NUMOAC,'
      '  oat.DATEMI,'
      '  pra.QTAORD as Qtafor, '
      '  pra.QTAORDI as Qtainv,'
      '  pra.QTAORDM as QtaMov,'
      '  um.CODICE as umFor,'
      '  um1.CODICE as umMov,'
      '  um2.codice as umInv'
      'from PDTRIGACQ Pra '
      'join lotser ls on ls.id = pra.IDLOTSER'
      'join artico art on art.id = ls.IDARTICO'
      'left join OACRIG oar on oar.id = pra.IDOACRIG'
      'left join OACTES oat on oat.id = oar.IDOACTES'
      'left join tipidoc td on td.id = oat.IDTIPIDOC'
      'left join umart um on um.id = pra.IDUMF'
      'left join umart um1 on um1.id = pra.IDUMM'
      'left join umart um2 on um2.id = pra.IDUMI'
      'where art.codice = :codice'
      'and pra.ext_idfor = :idfor'
      'and pra.ext_idtipidoc =:idtipidoc'
      'and pra.ext_datdoc = :datadoc'
      'and ext_numdoc = :numdoc'
      'order by oat.ANNOAC,oat.NUMOAC,oat.DATEMI,oar.rigadoc')
    Left = 88
    Top = 88
  end
  object ds_dettaglio: TDataSource
    DataSet = qr_dettaglio
    Left = 152
    Top = 80
  end
end
