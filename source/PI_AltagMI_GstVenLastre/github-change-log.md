# GitHub Change Log

## Plug-In
- Nome: `PI_Altag_GstVenLastre`
- Percorso locale: `C:\plugin_new\Altag\source\PI_Altag_GstVenLastre`
- Repository: `Altag`
- Branch: `all refs`
- Data estrazione: `2026-10-01T18:27:01.993353+00:00`

## Riepilogo
- Commit analizzati: `2`
- V500: `0`
- V600: `0`
- Misti: `1`
- Conversioni V500 -> V600: `1`

## Commit di conversione V500 -> V600
| Commit | Data | Autore | Sintesi | Evidenze |
|---|---|---|---|---|
| `029c786e2f30` | 2024-10-08T13:01:26+02:00 | Luca Tolomelli | spostamento in directory source e aggiunta README e gitignore | tcsequery |

## Tutti i commit
### `437b643d6653f681201be2a8f4adc0e9801b2226` - fix progetti con DPM
- Data: `2024-10-08T13:01:26+02:00`
- Autore: `Luca Tolomelli`
- Classificazione prima: `Non determinabile`
- Classificazione dopo: `Non determinabile`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj`
- Indicatori V500: `nessuno`
- Indicatori V600: `nessuno`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj b/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj
index a565cbc..42b946f 100644
--- a/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj
+++ b/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj
@@ -4,7 +4,7 @@
         <MainSource>PI_Altag_GstVenLastre.dpk</MainSource>
         <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
         <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
-        <DCC_DependencyCheckOutputName>C:\OutSamW2\PI_Altag_GstVenLastre.bpl</DCC_DependencyCheckOutputName>
+        <DCC_DependencyCheckOutputName>$(SAMDIROUT)\PI_Altag_GstVenLastre.bpl</DCC_DependencyCheckOutputName>
         <FrameworkType>None</FrameworkType>
         <ProjectVersion>14.4</ProjectVersion>
         <Base>True</Base>
@@ -72,7 +72,7 @@
         <Base>true</Base>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Base)'!=''">
-        <DCC_DCPOutput>C:\OutSamW2</DCC_DCPOutput>
+        <DCC_DCPOutput>$(SAMDIROUT)</DCC_DCPOutput>
         <VerInfo_MajorVer>5</VerInfo_MajorVer>
         <DCC_Optimize>false</DCC_Optimize>
         <DCC_IntegerOverflowCheck>true</DCC_IntegerOverflowCheck>
@@ -112,10 +112,10 @@
         <DCC_IntegerOverflowCheck>True</DCC_IntegerOverflowCheck>
         <DCC_RangeChecking>True</DCC_RangeChecking>
         <DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
-        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
-        <DCC_ObjOutput>C:\OutSamW2\DCU</DCC_ObjOutput>
-        <DCC_HppOutput>C:\OutSamW2\DCU</DCC_HppOutput>
-        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
+        <DCC_DcuOutput>$(SAMDIROUT)\DCU</DCC_DcuOutput>
+        <DCC_ObjOutput>$(SAMDIROUT)\DCU</DCC_ObjOutput>
+        <DCC_HppOutput>$(SAMDIROUT)\DCU</DCC_HppOutput>
+        <DCC_BplOutput>$(SAMDIROUT)</DCC_BplOutput>
         <DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
@@ -131,10 +131,10 @@
         <DCC_Description>Gestione Vendite Lastre - Debug</DCC_Description>
         <Version>7.0</Version>
         <DCC_WriteableConstants>True</DCC_WriteableConstants>
-        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
-        <DCC_ObjOutput>C:\OutSamW2\DCU</DCC_ObjOutput>
-        <DCC_HppOutput>C:\OutSamW2\DCU</DCC_HppOutput>
-        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
+        <DCC_DcuOutput>$(SAMDIROUT)\DCU</DCC_DcuOutput>
+        <DCC_ObjOutput>$(SAMDIROUT)\DCU</DCC_ObjOutput>
+        <DCC_HppOutput>$(SAMDIROUT)\DCU</DCC_HppOutput>
+        <DCC_BplOutput>$(SAMDIROUT)</DCC_BplOutput>
         <DCC_Optimize>False</DCC_Optimize>
         <DCC_GenerateStackFrames>True</DCC_GenerateStackFrames>
         <DCC_RangeChecking>True</DCC_RangeChecking>
@@ -194,15 +194,15 @@
                     <Source Name="MainSource">PI_Altag_GstVenLastre.dpk</Source>
                 </Source>
                 <Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\tmsdedxe3.bpl">TMS Component Pack design time support</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\dcldxPScxCommonRS17.bpl">ExpressPrinting System Cross Platform Library by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\dcldxPSLnksRS17.bpl">ExpressPrinting System ReportLinks (Standard) by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\DclTeeMaker117.bpl">TeeMaker</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\DM_BI.bpl">File C:\OutSamW2\DM_BI.bpl not found</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\dcldxmdsRS17.bpl">ExpressMemData by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\dclcxEditorFieldLinkRS17.bpl">ExpressEditors FieldLink by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\dcldxLayoutControlRS17.bpl">ExpressLayout Control by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="C:\OutSamW2\DCSGantt.bpl">.CS GantTime Package DT - Debug</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\tmsdedxe3.bpl">TMS Component Pack design time support</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxPScxCommonRS17.bpl">ExpressPrinting System Cross Platform Library by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxPSLnksRS17.bpl">ExpressPrinting System ReportLinks (Standard) by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\DclTeeMaker117.bpl">TeeMaker</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\DM_BI.bpl">File $(SAMDIROUT)\DM_BI.bpl not found</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxmdsRS17.bpl">ExpressMemData by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\dclcxEditorFieldLinkRS17.bpl">ExpressEditors FieldLink by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxLayoutControlRS17.bpl">ExpressLayout Control by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="$(SAMDIROUT)\DCSGantt.bpl">.CS GantTime Package DT - Debug</Excluded_Packages>
                     <Excluded_Packages Name="$(BDSBIN)\dcloffice2k170.bpl">Microsoft Office 2000 Sample Automation Server Wrapper Components</Excluded_Packages>
                     <Excluded_Packages Name="$(BDSBIN)\dclofficexp170.bpl">Microsoft Office XP Sample Automation Server Wrapper Components</Excluded_Packages>
                 </Excluded_Packages>
```

### `029c786e2f30fec12a533ab847065ab5973bfc9f` - spostamento in directory source e aggiunta README e gitignore
- Data: `2024-10-08T13:01:26+02:00`
- Autore: `Luca Tolomelli`
- Classificazione prima: `Non determinabile`
- Classificazione dopo: `Mista`
- Tipo: `Conversione`
- Conversione V500 -> V600: `Parziale`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstVenLastre/FGstVenLastre.dfm, source/PI_Altag_GstVenLastre/FGstVenLastre.pas, source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dpk, source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj, source/PI_Altag_GstVenLastre/README.md, source/PI_Altag_GstVenLastre/UGstVenLastre.pas`
- Indicatori V500: `oledb`
- Indicatori V600: `tcsequery`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstVenLastre/FGstVenLastre.dfm b/source/PI_Altag_GstVenLastre/FGstVenLastre.dfm
new file mode 100644
index 0000000..3594f8b
--- /dev/null
+++ b/source/PI_Altag_GstVenLastre/FGstVenLastre.dfm
@@ -0,0 +1,81 @@
+object FrmGstVenLastre: TFrmGstVenLastre
+  Left = 223
+  Top = 227
+  Caption = 'Visualizza viste'
+  ClientHeight = 266
+  ClientWidth = 456
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'MS Sans Serif'
+  Font.Style = []
+  OldCreateOrder = False
+  OnCreate = FormCreate
+  PixelsPerInch = 96
+  TextHeight = 13
+  object Panel1: TPanel
+    Left = 0
+    Top = 0
+    Width = 456
+    Height = 41
+    Align = alTop
+    BevelOuter = bvNone
+    TabOrder = 0
+    object Label1: TLabel
+      Left = 6
+      Top = 9
+      Width = 57
+      Height = 13
+      Caption = 'Nome Vista:'
+    end
+    object cbxViste: TSelBox
+      Left = 68
+      Top = 7
+      Width = 245
+      Height = 21
+      Style = csDropDownList
+      TabOrder = 0
+      OnChange = cbxVisteChange
+    end
+  end
+  object DBGrid1: TSMDBGrid
+    Left = 0
+    Top = 41
+    Width = 456
+    Height = 225
+    ExOptions = [eoNoLayout, eoStandardPopup, eoDisableOrder]
+    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgMultiSelect]
+    KeyField = 'ID'
+    WidthOfIndicator = 14
+    ScrollBars = ssHorizontal
+    ColCount = 2
+    RowCount = 2
+    Col = 1
+    Row = 1
+    Align = alClient
+    DataSource = SrcList
+    ReadOnly = True
+    TabOrder = 1
+    TitleFont.Charset = DEFAULT_CHARSET
+    TitleFont.Color = clWindowText
+    TitleFont.Height = -11
+    TitleFont.Name = 'MS Sans Serif'
+    TitleFont.Style = []
+  end
+  object SrcList: TDataSource
+    DataSet = QryList
+    Left = 318
+    Top = 49
+  end
+  object QryList: TQueryPars
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    SQL.Strings = (
+      '')
+    Left = 358
+    Top = 49
+  end
+end
diff --git a/source/PI_Altag_GstVenLastre/FGstVenLastre.pas b/source/PI_Altag_GstVenLastre/FGstVenLastre.pas
new file mode 100644
index 0000000..57bb03d
--- /dev/null
+++ b/source/PI_Altag_GstVenLastre/FGstVenLastre.pas
@@ -0,0 +1,223 @@
+unit FGstVenLastre;
+
+interface
+
+uses
+  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
+  SMDBGrid, Data.DB, QueryPars, OLEDBComponents, Vcl.Grids, Vcl.DBGrids,
+  Vcl.Controls, Vcl.StdCtrls, Compf2, Vcl.ExtCtrls, UCoreDB, CSETables, UCoreTipi;
+
+type
+  TFrmGstVenLastre = class(TForm)
+    Panel1: TPanel;
+    cbxViste: TSelBox;
+    Label1: TLabel;
+    DBGrid1: TSMDBGrid;
+    SrcList: TDataSource;
+    QryList: TQueryPars;
+    procedure FormCreate(Sender: TObject);
+    procedure cbxVisteChange(Sender: TObject);
+  private
+    lsNomiViste: String;
+    procedure SettaCombo;
+    function Leggi_Ini: Boolean;
+    procedure PreparaGrid;
+  public
+    IdComRig: Integer;
+  end;
+
+implementation
+
+uses RString, RSQL, CSTipiCommon, CSFileCfg;
+
+
+{$R *.DFM}
+
+
+{ TFrmGstVenLastre }
+
+function TFrmGstVenLastre.Leggi_Ini: Boolean;
+var strPath,Percorso, NomeFile : String;
+    INIF:TCSFileCfg;
+begin
+  NomeFile:= 'PI_Altag.ini';
+  strPath := ExtractFilePath(Application.ExeName);
+  Percorso := strPath +  NomeFile; // da leggere nell .ini
+  Result:= False;
+  // Valori di Default dal .ini (idvaluta Euro, percorso dat articolo/qta)
+  If FileExists(Percorso) then
+  begin
+    INIF := TCSFileCfg.Create(Percorso);
+    If Assigned(INIF) then begin
+      lsNomiViste:= INIF.ReadString('Viste', 'lsNomiViste', '');
+
+      if lsNomiViste='' then
+          MessageDlg('Inserire i parametri obbligatori nel file '+NomeFile+'.'+CRLF+
+                     '[Viste]'+CRLF+
+                     'lsNomiViste='+ lsNomiViste, mtError, [mbOK], 0)
+
+      else
+        Result:= True;
+
+      INIF.free;
+    end;
+  end
+  else
+    Showmessage('Il file di configurazione '+NomeFile+' non � presente nella directory del plugin');
+end;
+
+procedure TFrmGstVenLastre.SettaCombo;
+var I: Integer;
+begin
+  // Assegno combo
+  for I := 0 to (CS_Count_Values(lsNomiViste) - 1) do
+  begin
+    cbxViste.Items.Add(CS_Extract_SubStr(lsNomiViste,';', I));
+    cbxViste.ItemsDeco.Add(CS_Extract_SubStr(lsNomiViste,';', I));
+  end;
+
+end;
+
+procedure TFrmGstVenLastre.FormCreate(Sender: TObject);
+begin
+  Leggi_Ini;
+  SettaCombo;
+  QryList.DatabaseName:= Azienda.DatabaseName;
+end;
+
+procedure TFrmGstVenLastre.cbxVisteChange(Sender: TObject);
+var ls : TstringList;
+begin
+  QryList.Close;
+  PreparaGrid;
+
+  if CSTableExists(Azienda, cbxViste.Text) <> '' then
+  begin
+    MessageDlg('Attenzione!'+CRLF+'La vista non esiste.', mtWarning, [mbOK], 0);
+    exit;
+  end;
+
+  ls:=Tstringlist.create;
+  ls.add('ORD=ASC');
+  DBGrid1.SetOrderListCol(ls);
+  ls.free;
+
+  QryList.SQL.Text:= 'Select * from '+cbxViste.Text+' '+
+                     'where IdComRig='+CS_KeyValueTo_SqlStr(IdComRig);
+  DBGrid1.RefreshData;
+end;
+
+procedure TFrmGstVenLastre.PreparaGrid;
+var QryCampi: TCSEQuery;
+    NewCampiGrid : TGridCampi;
+
+  procedure ImpostaCampo(nome,titolo:String; Tipo:Tipodato);
+  begin
+    NewCampiGrid.FieldName := nome;
+    NewCampiGrid.Titolo    := titolo;
+    NewCampiGrid.Tipo      := tipo;
+    NewCampiGrid.Width     := 100;
+    NewCampiGrid.Align     := taLeftJustify;
+    NewCampiGrid.EnableOrd := true;
+    NewCampiGrid.EnableTot := true;
+  end;
+
+  procedure AggiungiCampoSMDBGrid(Grid: TSMDBGrid; campo: TGridCampi);
+  var i:smallint;
+  begin
+    for i:= 0 to Grid.Columns.count-1 do
+    begin
+      // se la colonna esiste non la creo
+      if uppercase(Grid.Columns[i].FieldName)=uppercase(campo.FieldName) then
+        exit;
+    end;
+    Grid.Columns.Add;
+    i:=Grid.Columns.count-1;
+    Grid.Columns[i].Expanded        := False;
+    Grid.Columns[i].Visible         := True;
+    Grid.Columns[i].Alignment       := campo.Align;
+    Grid.Columns[i].FieldName       := campo.FieldName;
+    Grid.Columns[i].Width           := campo.Width;
+    Grid.Columns[i].Color           := clWhite;
+    Grid.Columns[i].Title.Caption   := campo.Titolo;
+    Grid.Columns[i].Title.Alignment := taCenter;
+    if (campo.Tipo=DareAvere)then
+    begin
+      TS3Column(Grid.Columns[i]).DataType := dtCombinato;
+      TS3Column(Grid.Columns[i]).MappaValori.add('-1=A');
+      TS3Column(Grid.Columns[i]).MappaValori.add('1=D');
+    end
+    else if (campo.Tipo=Stringa) or (campo.Tipo=Anno) then
+    begin
+      TS3Column(Grid.Columns[i]).DataType := dtTesto;
+    end
+    else if (campo.Tipo=Int16) or (campo.Tipo=Int32) then
+    begin
+      TS3Column(Grid.Columns[i]).DataType := dtNumerico;
+      TS3Column(Grid.Columns[i]).ThousandSep := False;
+    end
+    else if (campo.Tipo=Importo) or (campo.Tipo=Quantita) then
+    begin
+      TS3Column(Grid.Columns[i]).DataType  := dtNumerico;
+      TS3Column(Grid.Columns[i]).FormatZero:= fzDecimal;
+      if (campo.Tipo=Importo) then
+        TS3Column(Grid.Columns[i]).DigitsDec:= 5;
+    end
+    else if campo.Tipo=Perc then
+    begin
+      TS3Column(Grid.Columns[i]).DataType   := dtNumerico;
+      TS3Column(Grid.Columns[i]).PercSign   := True;
+      TS3Column(Grid.Columns[i]).FormatZero := fzDecimal;
+    end
+    else if campo.Tipo=SoloData then
+    begin
+      TS3Column(Grid.Columns[i]).DataType   := dtData;
+    end
+    else if campo.Tipo=Booleano then
+    begin
+      TS3Column(Grid.Columns[i]).DataType   := dtSiNo;
+    end;
+  end;
+
+begin
+  QryCampi:= TCSEQuery.Create(nil);
+  QryCampi.DatabaseName:= Azienda.DatabaseName;
+  try // finally
+    DBGrid1.Columns.Clear;
+
+    QryCampi.SQL.Text:= 'Select o.name, c.name NomeCol, t.name, c.xType '+
+                        'From SysColumns c '+
+                        'inner join SysObjects o on c.Id=o.id '+
+                        'inner join SysTypes t on c.xType=t.xType '+
+                        'where o.name='+CS_VariantTo_SqlStr(cbxViste.Text)+' '+
+                        'order by c.colid';
+    QryCampi.Open;
+
+    while not QryCampi.Eof do
+    begin
+      // - Aggiunge i campi alla griglia
+      if (QryCampi.fieldByName('xType').AsInteger=175)
+        or (QryCampi.fieldByName('xType').AsInteger=167)
+        or (QryCampi.fieldByName('xType').AsInteger=35) then
+        ImpostaCampo(QryCampi.fieldByName('NomeCol').AsString, QryCampi.fieldByName('NomeCol').AsString, stringa)
+      else
+      if (QryCampi.fieldByName('xType').AsInteger=56)
+        or (QryCampi.fieldByName('xType').AsInteger=108)
+        or (QryCampi.fieldByName('xType').AsInteger=52) then
+        ImpostaCampo(QryCampi.fieldByName('NomeCol').AsString, QryCampi.fieldByName('NomeCol').AsString, Int16)
+      else
+      if (QryCampi.fieldByName('xType').AsInteger=106)
+        or (QryCampi.fieldByName('xType').AsInteger=62) then
+        ImpostaCampo(QryCampi.fieldByName('NomeCol').AsString, QryCampi.fieldByName('NomeCol').AsString, Importo);
+
+      AggiungiCampoSMDBGrid(DBGrid1, NewCampiGrid);
+      QryCampi.Next;
+    end;
+
+  finally
+    FreeAndNil(QryCampi);
+  end;
+
+end;
+
+end.
diff --git a/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dpk b/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dpk
new file mode 100644
index 0000000..c4b9553
--- /dev/null
+++ b/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dpk
@@ -0,0 +1,40 @@
+package PI_Altag_GstVenLastre;
+
+{$R *.res}
+{$IFDEF IMPLICITBUILDING This IFDEF should not be used by users}
+{$ALIGN 8}
+{$ASSERTIONS ON}
+{$BOOLEVAL OFF}
+{$DEBUGINFO ON}
+{$EXTENDEDSYNTAX ON}
+{$IMPORTEDDATA ON}
+{$IOCHECKS ON}
+{$LOCALSYMBOLS ON}
+{$LONGSTRINGS ON}
+{$OPENSTRINGS ON}
+{$OPTIMIZATION OFF}
+{$OVERFLOWCHECKS ON}
+{$RANGECHECKS ON}
+{$REFERENCEINFO ON}
+{$SAFEDIVIDE OFF}
+{$STACKFRAMES ON}
+{$TYPEDADDRESS OFF}
+{$VARSTRINGCHECKS ON}
+{$WRITEABLECONST ON}
+{$MINENUMSIZE 1}
+{$IMAGEBASE $400000}
+{$ENDIF IMPLICITBUILDING}
+{$DESCRIPTION 'Gestione Vendite Lastre'}
+{$RUNONLY}
+{$IMPLICITBUILD OFF}
+
+requires
+  CSApplication;
+
+contains
+  UGstVenLastre in 'UGstVenLastre.pas',
+  FGstVenLastre in 'FGstVenLastre.pas' {FrmGstVenLastre};
+
+  {$SetPEFlags $0800}
+end.
+
diff --git a/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj b/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj
new file mode 100644
index 0000000..a565cbc
--- /dev/null
+++ b/source/PI_Altag_GstVenLastre/PI_Altag_GstVenLastre.dproj
@@ -0,0 +1,241 @@
+﻿<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
+    <PropertyGroup>
+        <ProjectGuid>{6c502f04-5ba0-4bda-a73e-f568bb7101a6}</ProjectGuid>
+        <MainSource>PI_Altag_GstVenLastre.dpk</MainSource>
+        <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
+        <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
+        <DCC_DependencyCheckOutputName>C:\OutSamW2\PI_Altag_GstVenLastre.bpl</DCC_DependencyCheckOutputName>
+        <FrameworkType>None</FrameworkType>
+        <ProjectVersion>14.4</ProjectVersion>
+        <Base>True</Base>
+        <Config Condition="'$(Config)'==''">Debug</Config>
+        <Platform Condition="'$(Platform)'==''">Win32</Platform>
+        <TargetedPlatforms>1</TargetedPlatforms>
+        <AppType>Package</AppType>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Config)'=='Base' or '$(Base)'!=''">
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='OSX32' and '$(Base)'=='true') or '$(Base_OSX32)'!=''">
+        <Base_OSX32>true</Base_OSX32>
+        <CfgParent>Base</CfgParent>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='Win32' and '$(Base)'=='true') or '$(Base_Win32)'!=''">
+        <Base_Win32>true</Base_Win32>
+        <CfgParent>Base</CfgParent>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='Win64' and '$(Base)'=='true') or '$(Base_Win64)'!=''">
+        <Base_Win64>true</Base_Win64>
+        <CfgParent>Base</CfgParent>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Config)'=='Release' or '$(Cfg_1)'!=''">
+        <Cfg_1>true</Cfg_1>
+        <CfgParent>Base</CfgParent>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='Win32' and '$(Cfg_1)'=='true') or '$(Cfg_1_Win32)'!=''">
+        <Cfg_1_Win32>true</Cfg_1_Win32>
+        <CfgParent>Cfg_1</CfgParent>
+        <Cfg_1>true</Cfg_1>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='Win64' and '$(Cfg_1)'=='true') or '$(Cfg_1_Win64)'!=''">
+        <Cfg_1_Win64>true</Cfg_1_Win64>
+        <CfgParent>Cfg_1</CfgParent>
+        <Cfg_1>true</Cfg_1>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Config)'=='Debug' or '$(Cfg_2)'!=''">
+        <Cfg_2>true</Cfg_2>
+        <CfgParent>Base</CfgParent>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='OSX32' and '$(Cfg_2)'=='true') or '$(Cfg_2_OSX32)'!=''">
+        <Cfg_2_OSX32>true</Cfg_2_OSX32>
+        <CfgParent>Cfg_2</CfgParent>
+        <Cfg_2>true</Cfg_2>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='Win32' and '$(Cfg_2)'=='true') or '$(Cfg_2_Win32)'!=''">
+        <Cfg_2_Win32>true</Cfg_2_Win32>
+        <CfgParent>Cfg_2</CfgParent>
+        <Cfg_2>true</Cfg_2>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="('$(Platform)'=='Win64' and '$(Cfg_2)'=='true') or '$(Cfg_2_Win64)'!=''">
+        <Cfg_2_Win64>true</Cfg_2_Win64>
+        <CfgParent>Cfg_2</CfgParent>
+        <Cfg_2>true</Cfg_2>
+        <Base>true</Base>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base)'!=''">
+        <DCC_DCPOutput>C:\OutSamW2</DCC_DCPOutput>
+        <VerInfo_MajorVer>5</VerInfo_MajorVer>
+        <DCC_Optimize>false</DCC_Optimize>
+        <DCC_IntegerOverflowCheck>true</DCC_IntegerOverflowCheck>
+        <DCC_OutputNeverBuildDcps>true</DCC_OutputNeverBuildDcps>
+        <VerInfo_Build>64</VerInfo_Build>
+        <DCC_WriteableConstants>true</DCC_WriteableConstants>
+        <DCC_Namespace>System;Xml;Data;Datasnap;Web;Soap;$(DCC_Namespace)</DCC_Namespace>
+        <DCC_ImageBase>00400000</DCC_ImageBase>
+        <VerInfo_IncludeVerInfo>True</VerInfo_IncludeVerInfo>
+        <RuntimeOnlyPackage>true</RuntimeOnlyPackage>
+        <GenPackage>true</GenPackage>
+        <DCC_Description>Gestione Vendite Lastre</DCC_Description>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Gestione Vendite Lastre;FileVersion=5.0.0.64;InternalName=PI_Altag_GstVenLastre;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstVenLastre.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <GenDll>true</GenDll>
+        <DCC_RangeChecking>true</DCC_RangeChecking>
+        <VerInfo_Locale>1040</VerInfo_Locale>
+        <DCC_GenerateStackFrames>true</DCC_GenerateStackFrames>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_Win32)'!=''">
+        <DCC_Namespace>Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;$(DCC_Namespace)</DCC_Namespace>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Gestione Vendite Lastre - x64;FileVersion=5.0.0.64;InternalName=PI_Altag_GstVenLastre;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstVenLastre.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Gestione Vendite Lastre - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Gestione Vendite Lastre;FileVersion=5.0.0.63;InternalName=PI_Altag_GstVenLastre;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstVenLastre.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <VerInfo_Build>63</VerInfo_Build>
+        <Version>7.0</Version>
+        <DCC_DebugInformation>False</DCC_DebugInformation>
+        <DCC_WriteableConstants>True</DCC_WriteableConstants>
+        <DCC_LocalDebugSymbols>False</DCC_LocalDebugSymbols>
+        <DCC_Optimize>False</DCC_Optimize>
+        <DCC_IntegerOverflowCheck>True</DCC_IntegerOverflowCheck>
+        <DCC_RangeChecking>True</DCC_RangeChecking>
+        <DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
+        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
+        <DCC_ObjOutput>C:\OutSamW2\DCU</DCC_ObjOutput>
+        <DCC_HppOutput>C:\OutSamW2\DCU</DCC_HppOutput>
+        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
+        <DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
+        <DCC_OutputDRCFile>true</DCC_OutputDRCFile>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Gestione Vendite Lastre - x64;FileVersion=5.0.0.64;InternalName=PI_Altag_GstVenLastre;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstVenLastre.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Gestione Vendite Lastre - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2)'!=''">
+        <VerInfo_Debug>True</VerInfo_Debug>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Gestione Vendite Lastre - Debug;FileVersion=5.0.0.64;InternalName=PI_Altag_GstVenLastre;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstVenLastre.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Gestione Vendite Lastre - Debug</DCC_Description>
+        <Version>7.0</Version>
+        <DCC_WriteableConstants>True</DCC_WriteableConstants>
+        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
+        <DCC_ObjOutput>C:\OutSamW2\DCU</DCC_ObjOutput>
+        <DCC_HppOutput>C:\OutSamW2\DCU</DCC_HppOutput>
+        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
+        <DCC_Optimize>False</DCC_Optimize>
+        <DCC_GenerateStackFrames>True</DCC_GenerateStackFrames>
+        <DCC_RangeChecking>True</DCC_RangeChecking>
+        <DCC_IntegerOverflowCheck>True</DCC_IntegerOverflowCheck>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win32)'!=''">
+        <DCC_Description>Gestione Vendite Lastre</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Gestione Vendite Lastre - Debug - x64;FileVersion=5.0.0.64;InternalName=PI_Altag_GstVenLastre;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstVenLastre.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Gestione Vendite Lastre - Debug - x64</DCC_Description>
+    </PropertyGroup>
+    <ProjectExtensions>
+        <Borland.Personality>Delphi.Personality.12</Borland.Personality>
+        <Borland.ProjectType>Package</Borland.ProjectType>
+        <BorlandProject>
+            <Delphi.Personality>
+                <Parameters>
+                    <Parameters Name="UseLauncher">False</Parameters>
+                    <Parameters Name="LoadAllSymbols">True</Parameters>
+                    <Parameters Name="LoadUnspecifiedSymbols">False</Parameters>
+                </Parameters>
+                <Language>
+                    <Language Name="ProjectLang">$00000410</Language>
+                </Language>
+                <VersionInfo>
+                    <VersionInfo Name="IncludeVerInfo">True</VersionInfo>
+                    <VersionInfo Name="AutoIncBuild">False</VersionInfo>
+                    <VersionInfo Name="MajorVer">4</VersionInfo>
+                    <VersionInfo Name="MinorVer">2</VersionInfo>
+                    <VersionInfo Name="Release">0</VersionInfo>
+                    <VersionInfo Name="Build">64</VersionInfo>
+                    <VersionInfo Name="Debug">False</VersionInfo>
+                    <VersionInfo Name="PreRelease">False</VersionInfo>
+                    <VersionInfo Name="Special">False</VersionInfo>
+                    <VersionInfo Name="Private">False</VersionInfo>
+                    <VersionInfo Name="DLL">False</VersionInfo>
+                    <VersionInfo Name="Locale">1040</VersionInfo>
+                    <VersionInfo Name="CodePage">1252</VersionInfo>
+                </VersionInfo>
+                <VersionInfoKeys>
+                    <VersionInfoKeys Name="CompanyName">Centro Software srl</VersionInfoKeys>
+                    <VersionInfoKeys Name="FileDescription">analisi vendite gestione lastre</VersionInfoKeys>
+                    <VersionInfoKeys Name="FileVersion">4.2.0.64</VersionInfoKeys>
+                    <VersionInfoKeys Name="InternalName">PI_Altag_GstVenLastre</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalCopyright">Centro Software srl</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalTrademarks"/>
+                    <VersionInfoKeys Name="OriginalFilename">PI_Altag_GstVenLastre.dproj</VersionInfoKeys>
+                    <VersionInfoKeys Name="ProductName"/>
+                    <VersionInfoKeys Name="ProductVersion"/>
+                    <VersionInfoKeys Name="Comments">fsignorato</VersionInfoKeys>
+                </VersionInfoKeys>
+                <Source>
+                    <Source Name="MainSource">PI_Altag_GstVenLastre.dpk</Source>
+                </Source>
+                <Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\tmsdedxe3.bpl">TMS Component Pack design time support</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxPScxCommonRS17.bpl">ExpressPrinting System Cross Platform Library by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxPSLnksRS17.bpl">ExpressPrinting System ReportLinks (Standard) by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\DclTeeMaker117.bpl">TeeMaker</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\DM_BI.bpl">File C:\OutSamW2\DM_BI.bpl not found</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxmdsRS17.bpl">ExpressMemData by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dclcxEditorFieldLinkRS17.bpl">ExpressEditors FieldLink by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxLayoutControlRS17.bpl">ExpressLayout Control by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\DCSGantt.bpl">.CS GantTime Package DT - Debug</Excluded_Packages>
+                    <Excluded_Packages Name="$(BDSBIN)\dcloffice2k170.bpl">Microsoft Office 2000 Sample Automation Server Wrapper Components</Excluded_Packages>
+                    <Excluded_Packages Name="$(BDSBIN)\dclofficexp170.bpl">Microsoft Office XP Sample Automation Server Wrapper Components</Excluded_Packages>
+                </Excluded_Packages>
+            </Delphi.Personality>
+            <Platforms>
+                <Platform value="OSX32">False</Platform>
+                <Platform value="Win32">True</Platform>
+                <Platform value="Win64">False</Platform>
+            </Platforms>
+        </BorlandProject>
+        <ProjectFileVersion>12</ProjectFileVersion>
+    </ProjectExtensions>
+    <Import Project="$(BDS)\Bin\CodeGear.Delphi.Targets"/>
+    <ItemGroup>
+        <DelphiCompile Include="$(MainSource)">
+            <MainSource>MainSource</MainSource>
+        </DelphiCompile>
+        <DCCReference Include="CSApplication.dcp"/>
+        <DCCReference Include="UGstVenLastre.pas"/>
+        <DCCReference Include="FGstVenLastre.pas">
+            <Form>FrmGstVenLastre</Form>
+        </DCCReference>
+        <BuildConfiguration Include="Debug">
+            <Key>Cfg_2</Key>
+            <CfgParent>Base</CfgParent>
+        </BuildConfiguration>
+        <BuildConfiguration Include="Base">
+            <Key>Base</Key>
+        </BuildConfiguration>
+        <BuildConfiguration Include="Release">
+            <Key>Cfg_1</Key>
+            <CfgParent>Base</CfgParent>
+        </BuildConfiguration>
+    </ItemGroup>
+    <Import Project="$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj" Condition="Exists('$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj')"/>
+</Project>
diff --git a/source/PI_Altag_GstVenLastre/README.md b/source/PI_Altag_GstVenLastre/README.md
new file mode 100644
index 0000000..5cdadd4
--- /dev/null
+++ b/source/PI_Altag_GstVenLastre/README.md
@@ -0,0 +1 @@
+# plugin PI_Altag_GstVenLastre
diff --git a/source/PI_Altag_GstVenLastre/UGstVenLastre.pas b/source/PI_Altag_GstVenLastre/UGstVenLastre.pas
new file mode 100644
index 0000000..4388522
--- /dev/null
+++ b/source/PI_Altag_GstVenLastre/UGstVenLastre.pas
@@ -0,0 +1,186 @@
+// Cliente: Altag   RI 5045
+// Autore: Signorato Federica   30/07/2007
+
+// Gestione Vendite Lastre
+
+// SAM.CFG
+// [Moduli]
+// PI_Altag_GstVenLastre=Gestione Vendite Lastre
+
+// Extfun.ini
+// [FrmComTes]
+// AUTORUN=PI_Altag_GstVenLastre.GstVenLastre
+// btnPromettibilita=PI_Altag_GstVenLastre.VisVista
+
+// PI_Altag.ini
+// [Viste]
+// lsNomiViste=v_pippo;v_pluto
+
+
+unit UGstVenLastre;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
+  FRMSTD, Vcl.StdCtrls, Vcl.ExtCtrls, UCoreTipi, UVarie, Vcl.Menus, Vcl.DBCtrls, CompF2, Data.DB,
+  Vcl.ComCtrls, CSMemo, CSButtons, RSQL, CSETables, CStd, MemoEx, Vcl.Mask, S3PlugIn,
+ CSLinkFile, S3Registry, S3DB, UCoreDB, SMDBGrid, QueryPars;
+
+type
+  TLastre = class(TCustomPlugIn)
+  public
+  private
+    FOldRiferi1Exit: TNotifyEvent;
+    FOldQta1Exit: TNotifyEvent;
+    FOldQta3Exit: TNotifyEvent;
+    FOldQta2Exit: TNotifyEvent;
+    Procedure RicalcolaQta2;
+  published
+    procedure GstVenLastre;
+    procedure NewRiferi1Exit(Sender: TObject);
+    property  OldRiferi1Exit : TNotifyEvent read FOldRiferi1Exit write FOldRiferi1Exit;
+
+    procedure NewQta1Exit(Sender: TObject);
+    property  OldQta1Exit : TNotifyEvent read FOldQta1Exit write FOldQta1Exit;
+    procedure NewQta2Exit(Sender: TObject);
+    property  OldQta2Exit : TNotifyEvent read FOldQta2Exit write FOldQta2Exit;
+    procedure NewQta3Exit(Sender: TObject);
+    property  OldQta3Exit : TNotifyEvent read FOldQta3Exit write FOldQta3Exit;
+
+    procedure VisVista;
+  end;
+
+implementation
+
+uses FGstVenLastre;
+
+procedure TLastre.GstVenLastre;
+begin
+  RedirEvent('cbxRiferi1', 'OnExit', 'OldRiferi1Exit', 'NewRiferi1Exit');
+  RedirEvent('edtQta1', 'OnExit', 'OldQta1Exit', 'NewQta1Exit');
+  RedirEvent('edtQta2', 'OnExit', 'OldQta2Exit', 'NewQta2Exit');
+  RedirEvent('edtQta3', 'OnExit', 'OldQta3Exit', 'NewQta3Exit');
+end;
+
+procedure TLastre.NewQta1Exit(Sender: TObject);
+begin
+  if (Assigned(OldQta1Exit)) then
+    OldQta1Exit(Sender);
+
+  RicalcolaQta2;
+end;
+
+procedure TLastre.NewQta2Exit(Sender: TObject);
+begin
+  if (Assigned(OldQta2Exit)) then
+    OldQta2Exit(Sender);
+
+  RicalcolaQta2;
+end;
+
+procedure TLastre.NewQta3Exit(Sender: TObject);
+begin
+  if (Assigned(OldQta3Exit)) then
+    OldQta3Exit(Sender);
+
+  RicalcolaQta2;
+end;
+
+procedure TLastre.NewRiferi1Exit(Sender: TObject);
+begin
+  if (Assigned(OldRiferi1Exit)) then
+    OldRiferi1Exit(Sender);
+
+  RicalcolaQta2;
+end;
+
+procedure TLastre.RicalcolaQta2;
+var cbxRiferi1: TComboBox;
+    Peso, part1, part2: Double;
+    PosX: Integer;
+    edtQta1, edtQta2: TGet;
+    F2IdArtico: TF2;
+    QryArt: TCSEQuery;
+begin
+
+  GetFormComp('cbxRiferi1', cbxRiferi1);
+  GetFormComp('F2IdArtico', F2IdArtico);
+  GetFormComp('edtQta1', edtQta1);
+  GetFormComp('edtQta2', edtQta2);
+
+  if F2IdArtico.KeyValue=0 then
+    exit;
+
+  if cbxRiferi1.Text='' then
+    exit;
+
+  // Se non c'� la X esco
+  PosX:= pos('X', UpperCase(cbxRiferi1.Text));
+  if PosX=0 then
+    exit;
+
+  QryArt:= TCSEQuery.Create(nil);
+  QryArt.DatabaseName:= Azienda.DatabaseName;
+  try // finally
+    QryArt.SQL.Text:= 'Select GLOTTI, GEAMAT, UMI, UMM, UMV, UMRPRE, UMCO1 '+
+                      'From lotser l '+
+                      'inner join artico a on a.id=l.idartico '+
+                      'where l.id='+CS_KeyValueTo_SqlStr(F2IdArtico.KeyValue);
+    QryArt.Open;
+
+    if not ((QryArt.FieldByName('GLOTTI').AsInteger=-1)
+      and (QryArt.FieldByName('GEAMAT').AsInteger=0)
+      and (UpperCase(QryArt.FieldByName('UMM').AsString)='KG')
+      and (QryArt.FieldByName('UMRPRE').AsString='M')
+      and (QryArt.FieldByName('UMV').AsString=QryArt.FieldByName('UMI').AsString)) then
+    exit;
+
+    try // except
+
+      part1:= StrToFloat(copy(cbxRiferi1.Text, 1, (PosX-1)));
+      part2:= StrToFloat(copy(cbxRiferi1.Text, PosX+1, length(cbxRiferi1.Text)-PosX));
+
+      Peso:= (((part1*part2)/1000000)*QryArt.FieldByName('UMCO1').AsFloat)*edtQta1.GetValue;
+
+      edtQta2.SetText(Peso);
+      if (Assigned(OldQta2Exit)) then
+        OldQta2Exit(nil);
+
+      // edtQta2.onexit(Sender);
+    except
+      ShowMessage('Errore nel calcolo del peso.'+CRLF+
+                  'Controllare che nel testo del Riferi1 prima e dopo il caratere X ci siano valori numerici.');
+    end;
+
+  finally
+    FreeAndNil(QryArt);
+  end;
+end;
+
+procedure TLastre.VisVista;
+var QryComRig: TQueryPars;
+    frmGstLastre: TFrmGstVenLastre;
+begin
+  GetFormComp('QryComRig',QryComRig);
+  frmGstLastre:= TFrmGstVenLastre.Create(nil);
+  try // finally
+    frmGstLastre.IdComRig:= qryComRig.fieldByName('Id').AsInteger;
+    frmGstLastre.ShowModal;
+  finally
+    frmGstLastre.Free;
+  end;
+end;
+
+initialization
+  // Identificativo modulo
+  CSW___BPL_Identity :='PI_Altag_GstVenLastre';
+
+
+  RegisterPlugIn('PI_Altag_GstVenLastre', TLastre);
+
+finalization
+  UnRegisterPlugIn('PI_Altag_GstVenLastre');
+
+end.
+
```
