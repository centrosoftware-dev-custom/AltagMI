# GitHub Change Log

## Plug-In
- Nome: `pi_Altag_PrevInd`
- Percorso locale: `C:\plugin_new\Altag\source\pi_Altag_PrevInd`
- Repository: `Altag`
- Branch: `all refs`
- Data estrazione: `2026-10-01T18:27:03.787645+00:00`

## Riepilogo
- Commit analizzati: `3`
- V500: `0`
- V600: `0`
- Misti: `2`
- Conversioni V500 -> V600: `1`

## Commit di conversione V500 -> V600
| Commit | Data | Autore | Sintesi | Evidenze |
|---|---|---|---|---|
| `029c786e2f30` | 2024-10-08T13:01:26+02:00 | Luca Tolomelli | spostamento in directory source e aggiunta README e gitignore | tcsequery, imageindex |

## Tutti i commit
### `1732bf9f14e35e6492b9e3bf3506427384975bcb` - RI 53799 - PI_Altag_PrevInd - Modifica peso totale in caso di colore
- Data: `2025-03-04T10:12:41+01:00`
- Autore: `Iliass Kharbouchi`
- Classificazione prima: `Mista`
- Classificazione dopo: `Mista`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/pi_Altag_PrevInd/FPrevInd.dfm, source/pi_Altag_PrevInd/FPrevInd.pas`
- Indicatori V500: `dbexec, oledb`
- Indicatori V600: `tcsequery, imageindex`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/pi_Altag_PrevInd/FPrevInd.dfm b/source/pi_Altag_PrevInd/FPrevInd.dfm
index 2c40234..81b14be 100644
--- a/source/pi_Altag_PrevInd/FPrevInd.dfm
+++ b/source/pi_Altag_PrevInd/FPrevInd.dfm
@@ -540,10 +540,6 @@ object FrmPrevInd: TFrmPrevInd
     object TabDatiCom: TTabSheet
       Caption = 'Dati Comerciali'
       ImageIndex = 1
-      ExplicitLeft = 0
-      ExplicitTop = 0
-      ExplicitWidth = 0
-      ExplicitHeight = 0
       object lblMat: TLabel
         Left = 4
         Top = 26
diff --git a/source/pi_Altag_PrevInd/FPrevInd.pas b/source/pi_Altag_PrevInd/FPrevInd.pas
index 80d8ac8..10b6e14 100644
--- a/source/pi_Altag_PrevInd/FPrevInd.pas
+++ b/source/pi_Altag_PrevInd/FPrevInd.pas
@@ -1457,19 +1457,71 @@ begin
 end;
 
 function TFrmPrevInd.CalcolaPeso(msg: boolean): double;
-// var
+var
+  LTmp,
+  LCOORD: Double;
+
 //   spessore: double;
+  // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
+  function GetCOORD(const AIdArtico: Integer): Integer;
+  var
+    LQTmp: TCSEQuery;
+  begin
+    Result := 0;
+    LQTmp := TCSEQuery.Create(nil);
+    try
+      LQTmp.DataBaseName := Azienda.DatabaseName;
+
+      LQTmp.sql.clear;
+      LQTmp.SQL.Text := ''
+                      + ' SELECT C.COORD '
+                      + ' FROM ARTICO A '
+                      + ' INNER JOIN MAGCOLORI C ON C.ID=A.IDMAGCOLORI '
+                      + ' WHERE A.ID = ' + CS_VariantTo_SqlStr(AIdArtico);
+
+      LQTmp.open;
+
+      if not LQTmp.Eof then
+      begin
+        Result := LQTmp.FieldByName('COORD').AsInteger;
+      end;
+    finally
+      FreeAndNil(LQTmp);
+    end;
+  end;
+  // IK 06/12/2024
+
 begin
   {try
     spessore:=zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
   except
     spessore:=0;
   end;}
+  // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
+//  result  := (zeroifnull(ExtractVariant(edt_Altezza.text, Importo))*
+//              zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo))/1000000)*
+//              zeroifnull(ExtractVariant(edt_NLastre.text, Importo))*
+//              F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;
+
 
-  result:= (zeroifnull(ExtractVariant(edt_Altezza.text, Importo))*
+  LTmp  := (zeroifnull(ExtractVariant(edt_Altezza.text, Importo))*
             zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo))/1000000)*
             zeroifnull(ExtractVariant(edt_NLastre.text, Importo))*
             F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;
+
+  LCOORD := GetCOORD(F2Materiale.KeyValue);
+
+  if LCOORD = 0 then
+  begin
+    result := LTmp;
+  end
+  else
+  begin
+     result := CSRoundImp(((LTmp/ LCOORD) * 1000000),6);
+  end;
+
+  // IK 06/12/2024 RI 53799
+
   if result=0 then begin
     if msg then begin
       if messagedlg('ATTENZIONE:'+#13#10#10+'Non � stata indicata la quantit� di materia prima.'+#13#10#10+
@@ -1954,7 +2006,37 @@ begin
 end;
 
 procedure TFrmPrevInd.AggiornaPesi(IdOpTes, IdArtico: Integer);
-var QryArt: TCSEQuery;
+var
+  QryArt: TCSEQuery;
+  LCoOrd : integer;
+  // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
+  function GetCOORD(const AIdArtico: Integer): Integer;
+  var
+    LQTmp: TCSEQuery;
+  begin
+    Result := 0;
+    LQTmp := TCSEQuery.Create(nil);
+    try
+      LQTmp.DataBaseName := Azienda.DatabaseName;
+
+      LQTmp.sql.clear;
+      LQTmp.SQL.Text := ''
+                      + ' SELECT C.COORD '
+                      + ' FROM ARTICO A '
+                      + ' INNER JOIN MAGCOLORI C ON C.ID=A.IDMAGCOLORI '
+                      + ' WHERE A.ID = ' + CS_VariantTo_SqlStr(AIdArtico);
+
+      LQTmp.open;
+
+      if not LQTmp.Eof then
+      begin
+        Result := LQTmp.FieldByName('COORD').AsInteger;
+      end;
+    finally
+      FreeAndNil(LQTmp);
+    end;
+  end;
+  // IK 06/12/2024
 begin
   // SF...31/07/2007 : Estraggo il peso unitario e totale
   QryArt:=TCSEQuery.Create(nil);
@@ -1972,16 +2054,48 @@ begin
                       'Group by t.QtaOP ';
     QryArt.open;
 
+    // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
+    if IdArtico = 0 then
+    begin
+      LCoOrd := 0;
+    end
+    else
+    begin
+      LCoOrd := GetCOORD(IdArtico);
+    end;
+
+//    try
+//      lblPesoUni.Caption:=trim(formatvariant((QryArt.fieldbyname('QtImCo').AsFloat/QryArt.fieldbyname('QtaOP').AsFloat), Quantita));
+//    except
+//      lblPesoUni.Caption:='0';
+//    end;
+//    try
+//      lblPesoTot.Caption:=trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
+//    except
+//      lblPesoTot.Caption:='0';
+//    end;
+
     try
       lblPesoUni.Caption:=trim(formatvariant((QryArt.fieldbyname('QtImCo').AsFloat/QryArt.fieldbyname('QtaOP').AsFloat), Quantita));
     except
       lblPesoUni.Caption:='0';
     end;
     try
-      lblPesoTot.Caption:=trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
+      // Quando si effettua il calcolo del peso se la materia prima indicata ha il campo
+      // Colore Indicato il valore indicato va diviso per il campo CoOrd della
+      // Tabella colore e moltiplicato per 1000000 (il campo � indicato in mm quadrati)
+      if LCoOrd = 0 then
+      begin
+        lblPesoTot.Caption:=trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
+      end
+      else
+      begin
+        lblPesoTot.Caption:=trim(formatvariant(((QryArt.fieldbyname('QtImCo').AsFloat/ LCoOrd) * 1000000 ), Quantita));
+      end;
     except
       lblPesoTot.Caption:='0';
     end;
+     // ...IK 06/12/2024 RI 53799
   finally
     FreeAndNil(QryArt);
   end;
```

### `437b643d6653f681201be2a8f4adc0e9801b2226` - fix progetti con DPM
- Data: `2024-10-08T13:01:26+02:00`
- Autore: `Luca Tolomelli`
- Classificazione prima: `Non determinabile`
- Classificazione dopo: `Non determinabile`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj`
- Indicatori V500: `nessuno`
- Indicatori V600: `nessuno`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj b/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj
index 3ffa40b..4bc58b9 100644
--- a/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj
+++ b/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj
@@ -4,7 +4,7 @@
         <MainSource>pi_Altag_PrevInd.dpk</MainSource>
         <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
         <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
-        <DCC_DependencyCheckOutputName>C:\outsamw2\pi_Altag_PrevInd.bpl</DCC_DependencyCheckOutputName>
+        <DCC_DependencyCheckOutputName>$(SAMDIROUT)\pi_Altag_PrevInd.bpl</DCC_DependencyCheckOutputName>
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
@@ -95,7 +95,7 @@
         <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Base_Win32)'!=''">
-        <Debugger_HostApplication>C:\OutSamW2\SAM.exe</Debugger_HostApplication>
+        <Debugger_HostApplication>$(SAMDIROUT)\SAM.exe</Debugger_HostApplication>
         <DCC_Namespace>Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;$(DCC_Namespace)</DCC_Namespace>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Base_Win64)'!=''">
@@ -113,10 +113,10 @@
         <DCC_IntegerOverflowCheck>True</DCC_IntegerOverflowCheck>
         <DCC_RangeChecking>True</DCC_RangeChecking>
         <DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
-        <DCC_DcuOutput>c:\outsamw2\dcu</DCC_DcuOutput>
-        <DCC_ObjOutput>c:\outsamw2\dcu</DCC_ObjOutput>
-        <DCC_HppOutput>c:\outsamw2\dcu</DCC_HppOutput>
-        <DCC_BplOutput>C:\outsamw2</DCC_BplOutput>
+        <DCC_DcuOutput>$(SAMDIROUT)\dcu</DCC_DcuOutput>
+        <DCC_ObjOutput>$(SAMDIROUT)\dcu</DCC_ObjOutput>
+        <DCC_HppOutput>$(SAMDIROUT)\dcu</DCC_HppOutput>
+        <DCC_BplOutput>$(SAMDIROUT)</DCC_BplOutput>
         <DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
@@ -132,10 +132,10 @@
         <DCC_Description>Plugin Preventivi Industriali - Debug</DCC_Description>
         <Version>7.0</Version>
         <DCC_WriteableConstants>True</DCC_WriteableConstants>
-        <DCC_DcuOutput>c:\outsamw2\dcu</DCC_DcuOutput>
-        <DCC_ObjOutput>c:\outsamw2\dcu</DCC_ObjOutput>
-        <DCC_HppOutput>c:\outsamw2\dcu</DCC_HppOutput>
-        <DCC_BplOutput>C:\outsamw2</DCC_BplOutput>
+        <DCC_DcuOutput>$(SAMDIROUT)\dcu</DCC_DcuOutput>
+        <DCC_ObjOutput>$(SAMDIROUT)\dcu</DCC_ObjOutput>
+        <DCC_HppOutput>$(SAMDIROUT)\dcu</DCC_HppOutput>
+        <DCC_BplOutput>$(SAMDIROUT)</DCC_BplOutput>
         <DCC_Optimize>False</DCC_Optimize>
         <DCC_GenerateStackFrames>True</DCC_GenerateStackFrames>
         <DCC_RangeChecking>True</DCC_RangeChecking>
@@ -157,7 +157,7 @@
         <BorlandProject>
             <Delphi.Personality>
                 <Parameters>
-                    <Parameters Name="HostApplication">C:\OutSamW2\SAM.exe</Parameters>
+                    <Parameters Name="HostApplication">$(SAMDIROUT)\SAM.exe</Parameters>
                     <Parameters Name="UseLauncher">False</Parameters>
                     <Parameters Name="LoadAllSymbols">True</Parameters>
                     <Parameters Name="LoadUnspecifiedSymbols">False</Parameters>
@@ -196,15 +196,15 @@
                     <Source Name="MainSource">pi_Altag_PrevInd.dpk</Source>
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
- File modificati: `source/pi_Altag_PrevInd/FPrevInd.dfm, source/pi_Altag_PrevInd/FPrevInd.pas, source/pi_Altag_PrevInd/Oext_pialtatg.pas, source/pi_Altag_PrevInd/README.md, source/pi_Altag_PrevInd/UPrevInd.pas, source/pi_Altag_PrevInd/pi_Altag_PrevInd.dpk, source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj`
- Indicatori V500: `dbexec, rnote, getnota, memotext, oledb`
- Indicatori V600: `tcsequery, imageindex`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/pi_Altag_PrevInd/FPrevInd.dfm b/source/pi_Altag_PrevInd/FPrevInd.dfm
new file mode 100644
index 0000000..2c40234
--- /dev/null
+++ b/source/pi_Altag_PrevInd/FPrevInd.dfm
@@ -0,0 +1,1218 @@
+object FrmPrevInd: TFrmPrevInd
+  Left = 316
+  Top = 122
+  Caption = 'Preventivo Industriale'
+  ClientHeight = 449
+  ClientWidth = 605
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'MS Sans Serif'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poDesktopCenter
+  OnCreate = FormCreate
+  OnDestroy = FormDestroy
+  OnShow = FormShow
+  PixelsPerInch = 96
+  TextHeight = 13
+  object PageControl1: TPageControl
+    Left = 0
+    Top = 101
+    Width = 605
+    Height = 314
+    ActivePage = TabDatiTec
+    Align = alBottom
+    TabOrder = 1
+    OnChange = PageControl1Change
+    object TabDatiTec: TTabSheet
+      Caption = 'Dati Tecnici'
+      object Label4: TLabel
+        Left = 14
+        Top = 55
+        Width = 43
+        Height = 13
+        Caption = 'Materiale'
+      end
+      object Label5: TLabel
+        Left = 14
+        Top = 105
+        Width = 44
+        Height = 13
+        Caption = 'Spessore'
+      end
+      object Label6: TLabel
+        Left = 64
+        Top = 105
+        Width = 40
+        Height = 13
+        Caption = 'Quantit'#224
+      end
+      object Label7: TLabel
+        Left = 114
+        Top = 105
+        Width = 34
+        Height = 13
+        Caption = 'Finitura'
+      end
+      object Lab_Spessore: TLabel
+        Left = 14
+        Top = 130
+        Width = 6
+        Height = 13
+        Caption = '0'
+      end
+      object Lab_Qta: TLabel
+        Left = 64
+        Top = 130
+        Width = 6
+        Height = 13
+        Caption = '0'
+      end
+      object Lab_finitura: TLabel
+        Left = 114
+        Top = 130
+        Width = 6
+        Height = 13
+        Caption = '0'
+      end
+      object Label2: TLabel
+        Left = 164
+        Top = 105
+        Width = 46
+        Height = 13
+        Caption = 'F mm/min'
+      end
+      object Label8: TLabel
+        Left = 224
+        Top = 105
+        Width = 56
+        Height = 13
+        Caption = 'Spazio Rall.'
+      end
+      object Label9: TLabel
+        Left = 284
+        Top = 105
+        Width = 32
+        Height = 13
+        Caption = '% Rall.'
+      end
+      object Label10: TLabel
+        Left = 342
+        Top = 105
+        Width = 89
+        Height = 13
+        Caption = 'Tempo Forat. (sec)'
+      end
+      object Label17: TLabel
+        Left = 451
+        Top = 97
+        Width = 60
+        Height = 26
+        Caption = 'Tempo Attrezz. (min)'
+        WordWrap = True
+      end
+      object Label14: TLabel
+        Left = 517
+        Top = 97
+        Width = 63
+        Height = 26
+        Caption = 'Tempo Previsto (min)'
+        WordWrap = True
+      end
+      object Label24: TLabel
+        Left = 14
+        Top = 11
+        Width = 92
+        Height = 13
+        Caption = 'Lavorazione / Cella'
+      end
+      object Label26: TLabel
+        Left = 451
+        Top = 55
+        Width = 27
+        Height = 13
+        Caption = 'Costo'
+      end
+      object Label27: TLabel
+        Left = 517
+        Top = 55
+        Width = 51
+        Height = 13
+        Caption = 'Tipo Costo'
+      end
+      object Label28: TLabel
+        Left = 319
+        Top = 55
+        Width = 44
+        Height = 13
+        Caption = 'Peso uni.'
+      end
+      object Label29: TLabel
+        Left = 382
+        Top = 55
+        Width = 57
+        Height = 13
+        Caption = 'Peso Totale'
+      end
+      object lblPesoUni: TLabel
+        Left = 319
+        Top = 73
+        Width = 27
+        Height = 13
+        Caption = '0       '
+      end
+      object lblPesoTot: TLabel
+        Left = 382
+        Top = 73
+        Width = 27
+        Height = 13
+        Caption = '0       '
+      end
+      object F2Materiale: TF2
+        Left = 14
+        Top = 70
+        Width = 303
+        Height = 21
+        BevelOuter = bvNone
+        BorderStyle = bsSingle
+        ParentShowHint = False
+        ShowHint = True
+        TabOrder = 1
+        OrderColIndex = 1
+        NumCol = 0
+        BtnEnabled = True
+        ListFieldTypes = 'Stringa;Stringa'
+        ListFieldIndex = 1
+        KeyValue = 0
+        OnKeyChange = F2MaterialeKeyChange
+        MultiSelez = False
+        ReadBarcode = False
+        F2Table = ArticoD
+        EmptyOk = True
+        OpenThread = False
+        GridWidth = 481
+        GridHeight = 160
+        DropDownAlign = daLeft
+        GridColTypes = 'Stringa;Stringa'
+        GridColTitles = 'Codice;Descrizione'
+        DropDownWidth = 481
+        ReadOnly = True
+        DropDownRows = 0
+      end
+      object GB_Sviluppo: TCSGroupBox
+        Left = 12
+        Top = 165
+        Width = 185
+        Height = 120
+        Caption = ' Dati Svilpuppo '
+        ParentCtl3D = True
+        TabOrder = 10
+        object Label11: TLabel
+          Left = 16
+          Top = 33
+          Width = 79
+          Height = 13
+          Caption = 'Sviluppo Lineare'
+        end
+        object Label12: TLabel
+          Left = 16
+          Top = 76
+          Width = 45
+          Height = 13
+          Caption = 'N. Spigoli'
+        end
+        object Label13: TLabel
+          Left = 16
+          Top = 55
+          Width = 39
+          Height = 13
+          Caption = 'N. Profili'
+        end
+        object Label22: TLabel
+          Left = 16
+          Top = 98
+          Width = 74
+          Height = 13
+          Caption = 'Sviluppo Cerchi'
+        end
+        object Edt_SvilLin: TEdit
+          Left = 104
+          Top = 29
+          Width = 69
+          Height = 21
+          TabOrder = 0
+          Text = '0'
+          OnChange = Edt_SvilLinChange
+          OnExit = Edt_SvilLinExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object Edt_NProf: TEdit
+          Left = 104
+          Top = 51
+          Width = 69
+          Height = 21
+          TabOrder = 1
+          Text = '0'
+          OnChange = Edt_SvilLinChange
+          OnExit = Edt_NProfExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object Edt_NSpig: TEdit
+          Left = 104
+          Top = 72
+          Width = 69
+          Height = 21
+          TabOrder = 2
+          Text = '0'
+          OnChange = Edt_SvilLinChange
+          OnExit = Edt_NProfExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object edt_SvilCerchi: TEdit
+          Left = 104
+          Top = 94
+          Width = 69
+          Height = 21
+          TabOrder = 3
+          Text = '0'
+          OnChange = Edt_SvilLinChange
+          OnExit = Edt_SvilLinExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+      end
+      object GB_CostoTaglio: TCSGroupBox
+        Left = 195
+        Top = 165
+        Width = 215
+        Height = 120
+        Caption = ' Calcolo Sviluppo '
+        ParentCtl3D = True
+        TabOrder = 11
+        object Label15: TLabel
+          Left = 16
+          Top = 33
+          Width = 78
+          Height = 13
+          Caption = 'Tot. Taglio 1 Pz.'
+        end
+        object Label16: TLabel
+          Left = 16
+          Top = 59
+          Width = 64
+          Height = 13
+          Caption = 'Totale Ordine'
+        end
+        object Edt_TotTaglio1Pz: TEdit
+          Left = 104
+          Top = 29
+          Width = 69
+          Height = 21
+          TabOrder = 0
+          Text = '0'
+          OnExit = Edt_TotTaglio1PzExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object Edt_TotOrd: TEdit
+          Left = 104
+          Top = 55
+          Width = 69
+          Height = 21
+          TabOrder = 1
+          Text = '0'
+          OnExit = Edt_TotTaglio1PzExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object SG_CSvil: TStringGrid
+          Left = 3
+          Top = 16
+          Width = 209
+          Height = 101
+          Align = alClient
+          ColCount = 3
+          DefaultRowHeight = 15
+          FixedCols = 0
+          RowCount = 21
+          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs]
+          TabOrder = 2
+          OnKeyPress = SG_CSvilKeyPress
+          OnSetEditText = SG_CSvilSetEditText
+          ColWidths = (
+            64
+            54
+            64)
+        end
+      end
+      object GB_Lastre: TCSGroupBox
+        Left = 407
+        Top = 165
+        Width = 186
+        Height = 120
+        Caption = ' Lastre  '
+        ParentCtl3D = True
+        TabOrder = 12
+        object Label18: TLabel
+          Left = 16
+          Top = 33
+          Width = 34
+          Height = 13
+          Caption = 'Altezza'
+        end
+        object Label19: TLabel
+          Left = 16
+          Top = 55
+          Width = 52
+          Height = 13
+          Caption = 'Lunghezza'
+        end
+        object Label20: TLabel
+          Left = 16
+          Top = 98
+          Width = 43
+          Height = 13
+          Caption = 'N. Lastre'
+        end
+        object Label21: TLabel
+          Left = 16
+          Top = 76
+          Width = 79
+          Height = 13
+          Caption = 'N. Pezzi x Lastra'
+        end
+        object edt_Altezza: TEdit
+          Left = 104
+          Top = 29
+          Width = 69
+          Height = 21
+          TabOrder = 0
+          Text = '0'
+          OnExit = Edt_SvilLinExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object edt_Lunghezza: TEdit
+          Left = 104
+          Top = 51
+          Width = 69
+          Height = 21
+          TabOrder = 1
+          Text = '0'
+          OnExit = Edt_SvilLinExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object edt_NLastre: TEdit
+          Left = 104
+          Top = 94
+          Width = 69
+          Height = 21
+          TabOrder = 3
+          Text = '0'
+          OnExit = edt_NLastreExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+        object Edt_PezziLastra: TEdit
+          Left = 104
+          Top = 72
+          Width = 69
+          Height = 21
+          TabOrder = 2
+          Text = '0'
+          OnChange = Edt_PezziLastraChange
+          OnExit = Edt_NProfExit
+          OnKeyPress = Edt_SvilLinKeyPress
+        end
+      end
+      object Edt_Fmmmin: TEdit
+        Left = 164
+        Top = 126
+        Width = 58
+        Height = 21
+        TabOrder = 4
+        Text = '0'
+        OnChange = Edt_SvilLinChange
+        OnExit = Edt_SvilLinExit
+        OnKeyPress = Edt_SvilLinKeyPress
+      end
+      object Edt_SpazioRall: TEdit
+        Left = 224
+        Top = 126
+        Width = 58
+        Height = 21
+        TabOrder = 5
+        Text = '0'
+        OnChange = Edt_SvilLinChange
+        OnExit = Edt_SvilLinExit
+        OnKeyPress = Edt_SvilLinKeyPress
+      end
+      object Edt_Rall: TEdit
+        Left = 284
+        Top = 126
+        Width = 58
+        Height = 21
+        TabOrder = 6
+        Text = '0'
+        OnChange = Edt_SvilLinChange
+        OnExit = Edt_RallExit
+        OnKeyPress = Edt_SvilLinKeyPress
+      end
+      object Edt_TForat: TEdit
+        Left = 344
+        Top = 126
+        Width = 58
+        Height = 21
+        TabOrder = 7
+        Text = '0'
+        OnChange = Edt_SvilLinChange
+        OnExit = Edt_SvilLinExit
+        OnKeyPress = Edt_SvilLinKeyPress
+      end
+      object Edt_TAttr: TEdit
+        Left = 451
+        Top = 126
+        Width = 58
+        Height = 21
+        TabOrder = 8
+        Text = '0'
+        OnExit = Edt_SvilLinExit
+        OnKeyPress = Edt_SvilLinKeyPress
+      end
+      object Edt_TempoPrev: TEdit
+        Left = 517
+        Top = 126
+        Width = 58
+        Height = 21
+        TabOrder = 9
+        Text = '0'
+        OnExit = Edt_SvilLinExit
+        OnKeyPress = Edt_SvilLinKeyPress
+      end
+      object F2Lav: TF2
+        Left = 14
+        Top = 26
+        Width = 303
+        Height = 21
+        BevelOuter = bvNone
+        BorderStyle = bsSingle
+        ParentShowHint = False
+        ShowHint = True
+        TabOrder = 0
+        OrderColIndex = 1
+        NumCol = 0
+        BtnEnabled = True
+        ListFieldTypes = 'Stringa;Stringa'
+        ListFieldIndex = 1
+        KeyValue = 0
+        OnKeyChange = F2LavKeyChange
+        MultiSelez = False
+        ReadBarcode = False
+        F2Table = Lavorazioni
+        EmptyOk = True
+        OpenThread = False
+        GridWidth = 481
+        GridHeight = 160
+        DropDownAlign = daLeft
+        GridColTypes = 'Stringa;Stringa'
+        GridColTitles = 'Codice;Descrizione'
+        DropDownWidth = 481
+        ReadOnly = True
+        DropDownRows = 0
+      end
+      object edt_Costo: TEdit
+        Left = 451
+        Top = 70
+        Width = 58
+        Height = 21
+        TabOrder = 2
+        Text = '0'
+        OnKeyPress = edt_CostoKeyPress
+      end
+      object edt_TCosto: TEdit
+        Left = 517
+        Top = 70
+        Width = 58
+        Height = 21
+        Enabled = False
+        TabOrder = 3
+        Text = '0'
+        OnExit = Edt_SvilLinExit
+      end
+    end
+    object TabDatiCom: TTabSheet
+      Caption = 'Dati Comerciali'
+      ImageIndex = 1
+      ExplicitLeft = 0
+      ExplicitTop = 0
+      ExplicitWidth = 0
+      ExplicitHeight = 0
+      object lblMat: TLabel
+        Left = 4
+        Top = 26
+        Width = 67
+        Height = 13
+        Caption = 'Materie Prime:'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = []
+        ParentFont = False
+      end
+      object lblRicarico: TLabel
+        Left = 316
+        Top = 4
+        Width = 48
+        Height = 13
+        Caption = 'Ricarico'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = [fsBold]
+        ParentFont = False
+      end
+      object lblImpRicarico: TLabel
+        Left = 372
+        Top = 4
+        Width = 94
+        Height = 13
+        Caption = 'Importo Ricarico'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = [fsBold]
+        ParentFont = False
+      end
+      object lblLavInt: TLabel
+        Left = 4
+        Top = 50
+        Width = 75
+        Height = 13
+        Caption = 'Lavorazioni Int.:'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = []
+        ParentFont = False
+      end
+      object lblLavEst: TLabel
+        Left = 4
+        Top = 74
+        Width = 78
+        Height = 13
+        Caption = 'Lavorazioni Est.:'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = []
+        ParentFont = False
+      end
+      object lblTotali: TLabel
+        Left = 4
+        Top = 112
+        Width = 41
+        Height = 13
+        Caption = 'Totale:'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = [fsBold]
+        ParentFont = False
+      end
+      object lbl: TLabel
+        Left = 4
+        Top = 152
+        Width = 182
+        Height = 13
+        Caption = 'Ricarico ulteriore su totale precedente:'
+        Color = clBtnFace
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clBlack
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = []
+        ParentColor = False
+        ParentFont = False
+      end
+      object Label23: TLabel
+        Left = 4
+        Top = 176
+        Width = 137
+        Height = 13
+        Caption = 'Sconto su totale precedente:'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clBlack
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = []
+        ParentFont = False
+      end
+      object LblCostoUni: TLabel
+        Left = 88
+        Top = 4
+        Width = 111
+        Height = 13
+        Caption = 'Costo Unitario (ric.)'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = [fsBold]
+        ParentFont = False
+      end
+      object Label25: TLabel
+        Left = 4
+        Top = 216
+        Width = 94
+        Height = 13
+        Caption = 'Totale generale:'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = [fsBold]
+        ParentFont = False
+      end
+      object lblCostoTot: TLabel
+        Left = 202
+        Top = 4
+        Width = 73
+        Height = 13
+        Caption = 'Costo Totale'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = [fsBold]
+        ParentFont = False
+      end
+      object lblCostoRic: TLabel
+        Left = 484
+        Top = 4
+        Width = 95
+        Height = 13
+        Caption = 'Costo Ricaricato'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = [fsBold]
+        ParentFont = False
+      end
+      object edtMa: TEdit
+        Left = 202
+        Top = 20
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 1
+      end
+      object edtPeMCMa: TEdit
+        Left = 316
+        Top = 20
+        Width = 50
+        Height = 21
+        TabOrder = 2
+        OnExit = edtPeMCMaExit
+        OnKeyPress = edtPeMCMaKeyPress
+      end
+      object edtImpMa: TEdit
+        Left = 370
+        Top = 20
+        Width = 110
+        Height = 21
+        TabOrder = 3
+        OnExit = edtImpMaExit
+        OnKeyPress = edtImpMaKeyPress
+      end
+      object edtLI: TEdit
+        Left = 202
+        Top = 44
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 6
+      end
+      object edtPeMCLI: TEdit
+        Left = 316
+        Top = 44
+        Width = 50
+        Height = 21
+        TabOrder = 7
+        OnExit = edtPeMCMaExit
+        OnKeyPress = edtPeMCMaKeyPress
+      end
+      object edtImpLI: TEdit
+        Left = 370
+        Top = 44
+        Width = 110
+        Height = 21
+        TabOrder = 8
+        OnExit = edtImpMaExit
+        OnKeyPress = edtImpMaKeyPress
+      end
+      object edtLE: TEdit
+        Left = 202
+        Top = 68
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 11
+      end
+      object edtPeMCLE: TEdit
+        Left = 316
+        Top = 68
+        Width = 50
+        Height = 21
+        TabOrder = 12
+        OnExit = edtPeMCMaExit
+        OnKeyPress = edtPeMCMaKeyPress
+      end
+      object edtImpLE: TEdit
+        Left = 370
+        Top = 68
+        Width = 110
+        Height = 21
+        TabOrder = 13
+        OnExit = edtImpMaExit
+        OnKeyPress = edtImpMaKeyPress
+      end
+      object edtTot: TEdit
+        Left = 202
+        Top = 108
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 15
+      end
+      object edtTotImp: TEdit
+        Left = 370
+        Top = 108
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 17
+      end
+      object edtTotPrec1: TEdit
+        Left = 484
+        Top = 108
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 18
+      end
+      object edtPeUlMC: TEdit
+        Left = 316
+        Top = 148
+        Width = 50
+        Height = 21
+        TabOrder = 19
+        OnExit = edtPeMCMaExit
+        OnKeyPress = edtPeMCMaKeyPress
+      end
+      object edtImpUl: TEdit
+        Left = 370
+        Top = 148
+        Width = 110
+        Height = 21
+        TabOrder = 20
+        OnExit = edtImpMaExit
+        OnKeyPress = edtImpMaKeyPress
+      end
+      object edtTotPrec2: TEdit
+        Left = 484
+        Top = 148
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 21
+      end
+      object edtPeUlSc: TEdit
+        Left = 316
+        Top = 172
+        Width = 50
+        Height = 21
+        TabOrder = 22
+        OnExit = edtPeMCMaExit
+        OnKeyPress = edtPeMCMaKeyPress
+      end
+      object edtImpSc: TEdit
+        Left = 370
+        Top = 172
+        Width = 110
+        Height = 21
+        TabOrder = 23
+        OnExit = edtImpMaExit
+        OnKeyPress = edtImpMaKeyPress
+      end
+      object Panel1: TPanel
+        Left = 481
+        Top = 210
+        Width = 116
+        Height = 26
+        BevelInner = bvLowered
+        TabOrder = 27
+        object edtTotale: TEdit
+          Left = 2
+          Top = 2
+          Width = 110
+          Height = 21
+          TabStop = False
+          Color = clBtnFace
+          ReadOnly = True
+          TabOrder = 0
+        end
+      end
+      object edtTotMC: TEdit
+        Left = 316
+        Top = 108
+        Width = 50
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 16
+      end
+      object edtTotGen: TEdit
+        Left = 202
+        Top = 212
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 24
+      end
+      object edtTotMCGen: TEdit
+        Left = 316
+        Top = 212
+        Width = 50
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 25
+      end
+      object edtTotImpGen: TEdit
+        Left = 370
+        Top = 212
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        MaxLength = 110
+        ReadOnly = True
+        TabOrder = 26
+      end
+      object edtLEUni: TEdit
+        Left = 88
+        Top = 68
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 10
+      end
+      object edtLIUni: TEdit
+        Left = 88
+        Top = 44
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 5
+      end
+      object edtMaUni: TEdit
+        Left = 88
+        Top = 20
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 0
+      end
+      object edtLERic: TEdit
+        Left = 484
+        Top = 68
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 14
+      end
+      object edtLIRic: TEdit
+        Left = 484
+        Top = 44
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 9
+      end
+      object edtMaRic: TEdit
+        Left = 484
+        Top = 20
+        Width = 110
+        Height = 21
+        TabStop = False
+        Color = clBtnFace
+        ReadOnly = True
+        TabOrder = 4
+      end
+    end
+  end
+  object Pan_datitestata: TPanel
+    Left = 0
+    Top = 0
+    Width = 605
+    Height = 101
+    Align = alClient
+    BevelOuter = bvNone
+    TabOrder = 0
+    object Label1: TLabel
+      Left = 14
+      Top = 15
+      Width = 53
+      Height = 20
+      Caption = 'Cliente:'
+      Font.Charset = DEFAULT_CHARSET
+      Font.Color = clWindowText
+      Font.Height = -16
+      Font.Name = 'MS Sans Serif'
+      Font.Style = []
+      ParentFont = False
+    end
+    object Lab_Cliente: TLabel
+      Left = 83
+      Top = 15
+      Width = 49
+      Height = 20
+      Caption = 'Cliente'
+      Font.Charset = DEFAULT_CHARSET
+      Font.Color = clWindowText
+      Font.Height = -16
+      Font.Name = 'MS Sans Serif'
+      Font.Style = []
+      ParentFont = False
+    end
+    object Label3: TLabel
+      Left = 14
+      Top = 52
+      Width = 33
+      Height = 13
+      Caption = 'Codice'
+    end
+    object Lab_PF: TLabel
+      Left = 59
+      Top = 52
+      Width = 33
+      Height = 13
+      Caption = 'Codice'
+    end
+    object lblTipDoc: TLabel
+      Left = 14
+      Top = 78
+      Width = 75
+      Height = 13
+      Caption = 'Tipo Preventivo'
+    end
+    object Lab_numPrev: TLabel
+      Left = 294
+      Top = 78
+      Width = 3
+      Height = 13
+    end
+    object F2IdTipiDoc: TF2
+      Left = 101
+      Top = 74
+      Width = 182
+      Height = 21
+      BevelOuter = bvNone
+      BorderStyle = bsSingle
+      ParentShowHint = False
+      ShowHint = True
+      TabOrder = 0
+      NumCol = 0
+      BtnEnabled = True
+      ListFieldIndex = 0
+      KeyValue = 0
+      MultiSelez = False
+      ReadBarcode = False
+      F2Table = TipiDoc
+      EmptyOk = False
+      OpenThread = False
+      GridWidth = 300
+      GridHeight = 160
+      DropDownAlign = daLeft
+      DropDownWidth = 300
+      ReadOnly = True
+      DropDownRows = 0
+    end
+    object edtTotaleUni: TEdit
+      Left = 488
+      Top = 74
+      Width = 110
+      Height = 21
+      TabStop = False
+      Color = clBtnFace
+      ReadOnly = True
+      TabOrder = 1
+    end
+  end
+  object Pan_CSButtons: TPanel
+    Left = 0
+    Top = 415
+    Width = 605
+    Height = 34
+    Align = alBottom
+    BevelOuter = bvNone
+    TabOrder = 2
+    object BtnStdAnnulla: TButton
+      Left = 521
+      Top = 6
+      Width = 75
+      Height = 25
+      Caption = 'Chiudi'
+      TabOrder = 3
+      OnClick = BtnStdAnnullaClick
+    end
+    object BtnAggOV: TButton
+      Left = 438
+      Top = 6
+      Width = 75
+      Height = 25
+      Caption = 'Aggiorna OV'
+      Default = True
+      TabOrder = 2
+      OnClick = BtnAggOVClick
+    end
+    object BtnCopia: TButton
+      Left = 5
+      Top = 6
+      Width = 75
+      Height = 25
+      Caption = 'Copia'
+      Default = True
+      TabOrder = 0
+      OnClick = BtnCopiaClick
+    end
+    object BtnIncolla: TButton
+      Left = 83
+      Top = 6
+      Width = 75
+      Height = 25
+      Caption = 'Incolla'
+      Default = True
+      TabOrder = 1
+      OnClick = BtnIncollaClick
+    end
+    object BtnStdOk: TButton
+      Left = 357
+      Top = 6
+      Width = 75
+      Height = 25
+      Caption = 'Salva PI'
+      Default = True
+      TabOrder = 4
+      OnClick = BtnStdOkClick
+    end
+  end
+  object QryextvelAltatg: TCSEQuery
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 255
+    Top = 24
+  end
+  object QrySelCompPrinc: TCSEQuery
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 330
+    Top = 6
+  end
+  object QrySelOPDP: TCSEQuery
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 525
+    Top = 9
+  end
+  object QrySelSdlMat: TCSEQuery
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 417
+    Top = 63
+  end
+  object QrySelOPDTpf: TCSEQuery
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 183
+    Top = 6
+  end
+  object QryNextNumOP: TCSEQuery
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 420
+    Top = 3
+  end
+  object QrySelSdlFas: TCSEQuery
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 342
+    Top = 63
+  end
+  object QryUpdtOpdtPF: TCSEQuery
+    MultipleResults = False
+    CommandText = #13#10
+    EnableBCD = True
+    Unidirectional = True
+    SQL.Strings = (
+      '')
+    Left = 204
+    Top = 99
+  end
+  object QryUpdtOpSDLMatPF: TCSEQuery
+    MultipleResults = False
+    CommandText = #13#10
+    EnableBCD = True
+    Unidirectional = True
+    SQL.Strings = (
+      '')
+    Left = 102
+    Top = 33
+  end
+end
diff --git a/source/pi_Altag_PrevInd/FPrevInd.pas b/source/pi_Altag_PrevInd/FPrevInd.pas
new file mode 100644
index 0000000..80d8ac8
--- /dev/null
+++ b/source/pi_Altag_PrevInd/FPrevInd.pas
@@ -0,0 +1,1991 @@
+unit FPrevInd;
+
+interface
+
+uses
+  Winapi.Windows, Vcl.Forms, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Compf2,
+  Data.DB, CSETables, UCoreTipi, Vcl.Grids, Oext_pialtatg, IProduzione, Vcl.ComCtrls,
+  CSGroupBox, OLEDBComponents, AdvGroupBox;
+
+type
+  TDatiPI = record
+    idcliente: integer;
+    IdArticoPF: integer;
+    idmarche: integer;
+    idmagpre: integer;
+    DatRic: double;
+    VarDb: string;
+    Notapf: string;
+    IdArticoC: integer;
+    IdOPDTC: integer;
+    idopsdlfas: integer;
+    NoMat: Boolean;
+  end;
+  TFrmPrevInd = class(TForm)
+    QryextvelAltatg: TCSEQuery;
+    QrySelCompPrinc: TCSEQuery;
+    QrySelOPDP: TCSEQuery;
+    QrySelSdlMat: TCSEQuery;
+    QrySelOPDTpf: TCSEQuery;
+    QryNextNumOP: TCSEQuery;
+    QrySelSdlFas: TCSEQuery;
+    PageControl1: TPageControl;
+    TabDatiTec: TTabSheet;
+    TabDatiCom: TTabSheet;
+    Pan_datitestata: TPanel;
+    Label1: TLabel;
+    Lab_Cliente: TLabel;
+    Label3: TLabel;
+    Lab_PF: TLabel;
+    F2IdTipiDoc: TF2;
+    lblTipDoc: TLabel;
+    Lab_numPrev: TLabel;
+    Pan_CSButtons: TPanel;
+    BtnStdAnnulla: TButton;
+    BtnAggOV: TButton;
+    Label4: TLabel;
+    Label5: TLabel;
+    Label6: TLabel;
+    Label7: TLabel;
+    Lab_Spessore: TLabel;
+    Lab_Qta: TLabel;
+    Lab_finitura: TLabel;
+    Label2: TLabel;
+    Label8: TLabel;
+    Label9: TLabel;
+    Label10: TLabel;
+    Label17: TLabel;
+    Label14: TLabel;
+    F2Materiale: TF2;
+    GB_Sviluppo: TCSGroupBox;
+    Label11: TLabel;
+    Label12: TLabel;
+    Label13: TLabel;
+    Label22: TLabel;
+    Edt_SvilLin: TEdit;
+    Edt_NProf: TEdit;
+    Edt_NSpig: TEdit;
+    edt_SvilCerchi: TEdit;
+    GB_CostoTaglio: TCSGroupBox;
+    Label15: TLabel;
+    Label16: TLabel;
+    Edt_TotTaglio1Pz: TEdit;
+    Edt_TotOrd: TEdit;
+    SG_CSvil: TStringGrid;
+    GB_Lastre: TCSGroupBox;
+    Label18: TLabel;
+    Label19: TLabel;
+    Label20: TLabel;
+    Label21: TLabel;
+    edt_Altezza: TEdit;
+    edt_Lunghezza: TEdit;
+    edt_NLastre: TEdit;
+    Edt_PezziLastra: TEdit;
+    Edt_Fmmmin: TEdit;
+    Edt_SpazioRall: TEdit;
+    Edt_Rall: TEdit;
+    Edt_TForat: TEdit;
+    Edt_TAttr: TEdit;
+    Edt_TempoPrev: TEdit;
+    lblMat: TLabel;
+    lblRicarico: TLabel;
+    lblImpRicarico: TLabel;
+    lblLavInt: TLabel;
+    lblLavEst: TLabel;
+    lblTotali: TLabel;
+    lbl: TLabel;
+    Label23: TLabel;
+    LblCostoUni: TLabel;
+    Label25: TLabel;
+    edtMa: TEdit;
+    edtPeMCMa: TEdit;
+    edtImpMa: TEdit;
+    edtLI: TEdit;
+    edtPeMCLI: TEdit;
+    edtImpLI: TEdit;
+    edtLE: TEdit;
+    edtPeMCLE: TEdit;
+    edtImpLE: TEdit;
+    edtTot: TEdit;
+    edtTotImp: TEdit;
+    edtTotPrec1: TEdit;
+    edtPeUlMC: TEdit;
+    edtImpUl: TEdit;
+    edtTotPrec2: TEdit;
+    edtPeUlSc: TEdit;
+    edtImpSc: TEdit;
+    Panel1: TPanel;
+    edtTotale: TEdit;
+    edtTotMC: TEdit;
+    edtTotGen: TEdit;
+    edtTotMCGen: TEdit;
+    edtTotImpGen: TEdit;
+    edtLEUni: TEdit;
+    edtLIUni: TEdit;
+    edtMaUni: TEdit;
+    edtLERic: TEdit;
+    edtLIRic: TEdit;
+    edtMaRic: TEdit;
+    lblCostoTot: TLabel;
+    lblCostoRic: TLabel;
+    BtnCopia: TButton;
+    BtnIncolla: TButton;
+    edtTotaleUni: TEdit;
+    Label24: TLabel;
+    F2Lav: TF2;
+    edt_Costo: TEdit;
+    Label26: TLabel;
+    edt_TCosto: TEdit;
+    Label27: TLabel;
+    BtnStdOk: TButton;
+    QryUpdtOpdtPF: TCSEQuery;
+    QryUpdtOpSDLMatPF: TCSEQuery;
+    Label28: TLabel;
+    Label29: TLabel;
+    lblPesoUni: TLabel;
+    lblPesoTot: TLabel;
+    procedure FormShow(Sender: TObject);
+    procedure F2MaterialeKeyChange(Sender: TObject; NewKey,
+      OldKey: Integer);
+    procedure Edt_SvilLinKeyPress(Sender: TObject; var Key: WideChar);
+    procedure Edt_SvilLinExit(Sender: TObject);
+    procedure Edt_NProfExit(Sender: TObject);
+    procedure Edt_TotTaglio1PzExit(Sender: TObject);
+    procedure BtnStdAnnullaClick(Sender: TObject);
+    procedure BtnAggOVClick(Sender: TObject);
+    procedure Edt_RallExit(Sender: TObject);
+    procedure FormCreate(Sender: TObject);
+    procedure FormDestroy(Sender: TObject);
+    procedure SG_CSvilKeyPress(Sender: TObject; var Key: WideChar);
+    procedure SG_CSvilSetEditText(Sender: TObject; ACol, ARow: Integer;
+      const Value: String);
+    procedure Edt_SvilLinChange(Sender: TObject);
+    procedure Edt_PezziLastraChange(Sender: TObject);
+    procedure edtPeMCMaKeyPress(Sender: TObject; var Key: WideChar);
+    procedure edtImpMaKeyPress(Sender: TObject; var Key: WideChar);
+    procedure edtPeMCMaExit(Sender: TObject);
+    procedure edtImpMaExit(Sender: TObject);
+    procedure edt_NLastreExit(Sender: TObject);
+    procedure BtnCopiaClick(Sender: TObject);
+    procedure BtnIncollaClick(Sender: TObject);
+    procedure PageControl1Change(Sender: TObject);
+    procedure edt_CostoKeyPress(Sender: TObject; var Key: WideChar);
+    procedure F2LavKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+    procedure BtnStdOkClick(Sender: TObject);
+  private
+    // isInIns: Boolean;
+    DatiPI: TDatiPI;
+    NtabtmpCopia: String;
+    DiametroMin: Double;
+    IDlavorazione: Integer;
+    IDCompDefault: Integer;
+    ext_pialtatg: Text_pialtatg;
+    UtentiAbilitati: String;
+    IDTipiDocVendita : TStrings;
+    function cercaextvelAltatg(idgruppi, idmarche, idLav: integer; spessore: Double): boolean;
+    procedure PulisciDatiPI(myDatiPI: TDatiPI);
+    procedure AssegnaCampiExtRig(idoptes: integer);
+    procedure AssegnaControlliExtRig;
+    procedure CalcolaSvilLin;
+    procedure CalcolaSvilCerchi;
+    procedure CalcolaTempo;
+    procedure CalcolaNLastre;
+    function cercaCompPrinc(ParidComrig: integer): boolean;
+    function CalcolaPeso(msg: boolean): double;
+    function MinToSecS(Minuti: double): double;
+    function SecSToMin(Secondi: double): double;
+    function SecCToSecS(MinSecC: double): double;
+    function cercaOPDP(idOptes, idArtico: integer): boolean;
+    function cercaSdlMat(idopdtPadre, idArtico: integer): boolean;
+    procedure AggOPTES(FOP: IPrev);
+    function cercaOPDTpf(idoptes, idArticoPF: integer): boolean;
+    procedure AggOPDT(FOP: IPrev; idoptes, idDTpadre: integer; var isInIns: Boolean);
+    procedure AggOPDP(FOP: IPrev; idoptes, idDTpadre: integer; isInIns: Boolean);
+    procedure AggSdlMat(FOP: IPrev; idoptes, idDTpadre: integer);
+    procedure AggSdlFas(FOP: IPrev; idoptes, idDTpadre: integer);
+    function cercaSdlFas(idopdtPadre, idArtico: integer): boolean;
+    function SecSToSecC(MinSecS: double): double;
+    procedure CalcolaTotDatiCom;
+    procedure AggOPTESDatiCont;
+    procedure AssegnaControlliDatiComPI(FOP: IPrev);
+    procedure AssegnaCampiOptesDatiCont(FOP: IPrev);
+    procedure LeggiMateriale;
+    procedure AggiornaCosti;
+    procedure AggiornaComtes(ask: Boolean);
+    procedure AggiornaPesi(IdOpTes, IdArtico: Integer);
+    //SD 04/10/2010 : RI #9595
+    function ValidaControlli : Boolean;
+    function getTipDocOV(IdComRig : Integer ): Integer;
+    { Private declarations }
+  public
+    { Public declarations }
+    idcomrig: integer;
+    livello: Tlivello;
+    AskAggPrezzoComRig: Integer;
+    //CostoTot: double;
+    Abort: Boolean;
+    function ValidaUtente: Boolean;
+  end;
+
+var
+  FrmPrevInd: TFrmPrevInd;
+
+implementation
+
+uses
+ RNumb, UCoreUtils,RMiscComp, RDate,
+ S3DB, UCoreDB, Vcl.Dialogs, System.SysUtils, RSQL, RString, S3Registry, OOrPr, CSFileCfg;
+
+{$R *.DFM}
+
+procedure TFrmPrevInd.FormShow(Sender: TObject);
+var
+  QryTmp: TCSEQuery;
+  ini: TCSFileCfg;
+  idCauMovR, i: Integer;
+  ValStr, chiave: string;
+
+  //SD 04/10/2010 : RI #9595
+  QrytmpArt : TCSEQuery;
+  MsgErr : String;
+  IDGruppo : Integer; 
+begin
+  Abort:=True;
+  // isInIns:=True;
+  AskAggPrezzoComRig:=0;  //  nessuna azione
+
+  // Conversione alla 03.02 ...  Riporto le stringa SQL che prima erano nell'oggetto
+  QryextvelAltatg.databasename:=Azienda.DatabaseName;
+  QryextvelAltatg.SQL.Text:= 'select * from extvelAltatg '+
+                             'where idgruppi= :idgruppi '+
+                               'and idmarche= :idmarche '+
+                               'and idlav= :idlav '+
+                               'and spessore= :spessore ';
+  QryextvelAltatg.prepare;
+
+  QrySelOPDTpf.databasename:=Azienda.DatabaseName;
+  QrySelOPDTpf.SQL.Text:= 'select id, idartico from opdt '+
+                          'where idoptes= :idoptes and livello=0 and idpadre is null ';
+  QrySelOPDTpf.prepare;
+
+  QrySelCompPrinc.databasename:=Azienda.DatabaseName;
+  QrySelCompPrinc.SQL.Text:= 'select opdt.id, opdt.idartico '+
+                             'from opdt inner join optes on opdt.idoptes=optes.id '+
+                             'where optes.idcomrig= :idcomrig and opdt.livello=1 '+
+                               'and opdt.idpadre=(select opdtp.id '+
+                                                 'from opdt opdtp '+
+                                                 'inner join optes optesp on opdtp.idoptes=optesp.id '+
+                                                 'where optesp.id=optes.id '+
+                                                   'and opdtp.livello=0 '+
+                                                   'and opdtp.idpadre is null) '+
+                             'order by opdt.sequen ';
+  QrySelCompPrinc.prepare;
+
+  QrySelOPDP.databasename:=Azienda.DatabaseName;
+  QrySelOPDP.SQL.Text:= 'select top 1 opdp.id, opdp.qtimco, opdp.tipord, '+
+                           'opdp.cosuni, opdp.tipcos from opdp '+
+                        'where opdp.idoptes= :idoptes '+
+                          'and opdp.idartico= :idartico '+
+                        'order by id ';
+  QrySelOPDP.prepare;
+
+  QrySelSdlMat.databasename:=Azienda.DatabaseName;
+  QrySelSdlMat.SQL.Text:= 'select id from opsdlmat '+
+                          'where idopdt= :idopdt and idartico= :idartico '+
+                          'order by sequen ';
+  QrySelSdlMat.prepare;
+
+  QrySelSdlFas.databasename:=Azienda.DatabaseName;
+  QrySelSdlFas.SQL.Text:= 'select id, idlav from opsdlfas '+
+                          'where idopsdlmat= :idopsdlmat '+
+                          'order by sequen ';
+  QrySelSdlFas.prepare;
+
+  QryNextNumOP.databasename:=Azienda.DatabaseName;
+  QryNextNumOP.SQL.Text:= 'SELECT MAX(NUMOP) ULTIMO FROM OPTES '+
+                          'WHERE (ANNOP= :ANNOP) AND (IDTIPIDOC= :IDTIPIDOC) ';
+  QryNextNumOP.prepare;
+
+  QryUpdtOpdtPF.databasename:=Azienda.DatabaseName;
+  QryUpdtOpdtPF.SQL.Text:= 'update opdt set idartico= :idartico where id= :id ';
+
+  QryUpdtOpSDLMatPF.databasename:=Azienda.DatabaseName;
+  QryUpdtOpSDLMatPF.SQL.Text:= 'update opsdlmat set idartico= :idartico where idopdt= :idopdt';
+  // ...Conversione alla 03.02
+
+
+
+  //SD 04/10/2010 : RI #9595
+  QryTmpArt := TCSEQuery.Create(nil);
+  try
+    QryTmpArt.DatabaseName := DBExec.DatabaseName;
+    QrytmpArt.SQL.Text := 'select '+
+                            'a.IDGRUPPI ' +
+                          'from ' +
+                            'ARTICO a ' +
+                          'inner join ' +
+                            'Lotser l on l.IDARTICO=a.ID ' +
+                          'inner join ' +
+                            'ComRig cr on cr.IDARTICO=l.ID ' +
+                          'where ' +
+                            'cr.ID = '+CS_Keyvalueto_SQLStr(idcomrig);
+    Try
+      QrytmpArt.Open;
+    Except on e:Exception Do
+      Begin
+        MsgErr := 'ATTENZIONE'+CRLF+ 'Operazione fallita.' + CRLF + CRLF +
+                  E.Message + CRLF + CRLF +
+                  'SQL:' + CRLF + QrytmpArt.SQL.Text;
+      End;
+    End;
+    if MsgErr <> '' then
+    begin
+      Application.MessageBox( PChar( MsgErr ), PChar( APPTITLE ), MB_OK + MB_ICONERROR );
+    end;
+    IDGruppo := QrytmpArt.FieldByName('IDGruppi').AsInteger;
+  finally
+    FreeAndNil(QryTmpArt);
+  end;
+  //SD 04/10/2010 : fine
+  F2Materiale.DBSAM := Azienda.DatabaseName;
+  F2Materiale.WhereSql:=' (a.TipArt=''S'' or a.TipArt=''C'') ';
+  //SD 04/10/2010 : RI #9595
+  if IDGruppo > 0 then
+    F2Materiale.WhereSql := F2Materiale.WhereSql + ' and (a.IDGRUPPI='+CS_Keyvalueto_SQLStr(IDGruppo)+')';
+  F2Materiale.open;
+  F2Lav.DBSAM := Azienda.DatabaseName;
+  F2Lav.open;
+  F2IdTipiDoc.DBSAM := Azienda.DatabaseName;
+  F2IdTipiDoc.WhereSql:=' (a.TIPDOC=''D'') ';
+  F2IdTipiDoc.open;
+
+  edtPeMCMa.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCMA', Azienda.Databasename)), Perc, 2);
+  edtPeMCLi.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCLI', Azienda.Databasename)), Perc, 2);
+  edtPeMCLe.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCLE', Azienda.Databasename)), Perc, 2);
+  edtPeUlMC.text:=formatvariant(ZeroifNull(GetParDef('PIPEULMC', Azienda.Databasename)), Perc, 2);
+  edtPeUlSc.text:=formatvariant(ZeroifNull(GetParDef('PIPEULSC', Azienda.Databasename)), Perc, 2);
+
+  PageControl1.ActivePage:=TabDatiTec;
+
+  PulisciDatiPI(DatiPI);
+  ext_pialtatg.found:=false;
+  idCauMovR:=0;
+  NtabtmpCopia:='TmpPIAltag'+IntToStr(Utente.Id);
+
+  QryTmp:=TCSEQuery.Create(nil);
+  try
+    QryTmp.DataBaseName := Azienda.DataBaseName;
+    QryTmp.sql.clear;
+    QryTmp.sql.add('select artico.id artico_id, artico.codice artico_codice, artico.descr artico_descr, '+
+                     'artico.idmarche, persone.codice persone_codice, persone.descr1, '+
+                     'clienti.id clienti_id, tipidoc.descr tipidoc_descr, '+
+                     'comtes.numdoc, comtes.anndoc, comrig.qta3, comrig.DatRic, '+
+                     'comrig.descr comrig_descr, comrig.idcaumov, comrig.idmagpre, '+
+                     'marche.descr marche_descr, vardb.codice vardb_codice, '+
+                     'ext_pialtatg.id ext_pialtatg_id, ext_pialtatg.idoptes, ext_pialtatg.idopsdlfas, '+
+                     'optes.idtipidoc, optes.annop, optes.numop, optes.peulmc, optes.ricmc, optes.peulsc, optes.impsc, '+
+                     'optes.CosMA, optes.pemcma, optes.RicMA, optes.CosLI, optes.pemcli, '+
+                     'optes.RicLI, optes.CosLE, optes.pemcle, optes.RicLE '+
+                   'from comrig '+
+                     'inner join comtes on comtes.id=comrig.idcomtes inner join tipidoc on comtes.idtipidoc=tipidoc.id '+
+                     'inner join lotser on lotser.id=comrig.idartico inner join artico on lotser.idartico=artico.id '+
+                     'inner join clienti on comtes.idcliente=clienti.id inner join persone on persone.id=clienti.idpersona '+
+                     'left outer join marche on artico.idmarche=marche.id '+
+                     'left outer join vardb on comrig.idvardb=vardb.id '+
+                     'left outer join optes on comrig.id=optes.idcomrig '+
+                     'left outer join ext_pialtatg on ext_pialtatg.idoptes=optes.id '+  //LR_CH16565_2024
+                   'where tipidoc.tipdoc <> ''P'' and comrig.id='+inttostr(idcomrig)+
+                   ' order by ext_pialtatg.idoptes desc');
+    QryTmp.open;
+    if not QryTmp.isempty then begin
+      caption:=caption+' - Commessa '+trim(QryTmp.fieldbyname('tipidoc_descr').asstring)+' '+
+                                      inttostr(QryTmp.fieldbyname('anndoc').asinteger)+' '+
+                                      inttostr(QryTmp.fieldbyname('numdoc').asinteger);
+
+      Lab_Cliente.caption:=trim(QryTmp.fieldbyname('persone_codice').asstring)+' '+trim(QryTmp.fieldbyname('descr1').asstring);
+      Lab_PF.caption:=trim(QryTmp.fieldbyname('artico_codice').asstring)+' '+trim(QryTmp.fieldbyname('artico_descr').asstring);
+      Lab_finitura.caption:=trim(QryTmp.fieldbyname('marche_descr').asstring);
+      Lab_Qta.caption:=formatvariant(QryTmp.fieldbyname('qta3').asfloat, quantita);
+      CalcolaNLastre;
+      BtnCopia.enabled:=False;
+      if QryTmp.fieldbyname('idoptes').asinteger>0 then begin  //  il preventivo SAM � gi� inserito
+        // isInIns:=False;
+        BtnCopia.enabled:=True;
+        F2IdTipiDoc.keyvalue:=QryTmp.fieldbyname('idtipidoc').asinteger;
+        //CostoTot:=QryTmp.fieldbyname('Valteo').asFloat;
+        Lab_numPrev.caption:=inttostr(QryTmp.fieldbyname('annop').asinteger)+' '+inttostr(QryTmp.fieldbyname('numop').asinteger);  //  +'   Costo: '+formatvariant(CostoTot, importo, 2);
+        edtMa.text:=formatvariant(QryTmp.fieldbyname('CosMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLi.text:=formatvariant(QryTmp.fieldbyname('CosLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLe.text:=formatvariant(QryTmp.fieldbyname('CosLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtPeMCMa.text:=formatvariant(QryTmp.fieldbyname('PeMcMa').asfloat, Perc, 2);
+        edtPeMCLi.text:=formatvariant(QryTmp.fieldbyname('PeMcLi').asfloat, Perc, 2);
+        edtPeMCLe.text:=formatvariant(QryTmp.fieldbyname('PeMcLe').asfloat, Perc, 2);
+        edtImpMa.text:=formatvariant(QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpLi.text:=formatvariant(QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpLe.text:=formatvariant(QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtPeUlMC.text:=formatvariant(QryTmp.fieldbyname('PeUlMc').asfloat, Perc, 2);
+        edtPeUlSc.text:=formatvariant(QryTmp.fieldbyname('PeUlSc').asfloat, Perc, 2);
+        edtImpUl.text:=formatvariant(QryTmp.fieldbyname('RicMc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpSc.text:=formatvariant(QryTmp.fieldbyname('ImpSc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtMaRic.text:=formatvariant(QryTmp.fieldbyname('CosMa').asfloat+QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLiRic.text:=formatvariant(QryTmp.fieldbyname('CosLi').asfloat+QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLeRic.text:=formatvariant(QryTmp.fieldbyname('CosLe').asfloat+QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        {if QryTmp.fieldbyname('qta3').asfloat<>0 then begin
+          edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+          edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+          edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        end;}
+        CalcolaTotDatiCom;
+        if cercaCompPrinc(idcomrig) then begin  //  cerco l'eventuale componente dalla distinta tecnica del preventivo SAM
+          DatiPI.IdOPDTC:=QrySelCompPrinc.fieldbyname('id').asinteger;
+          DatiPI.IdArticoC:=QrySelCompPrinc.fieldbyname('idartico').asinteger;
+        end;
+
+        if cercaOPDTpf(QryTmp.fieldbyname('idoptes').asinteger, QryTmp.fieldbyname('artico_id').asinteger) then begin
+          i:=QrySelOPDTpf.fieldbyname('id').asinteger;
+          if cercaSdlFas(i, QryTmp.fieldbyname('artico_id').asinteger) then begin
+            DatiPI.idopsdlfas:=QrySelSdlFas.fieldbyname('id').asinteger;
+            F2Lav.KeyValue:=QrySelSdlFas.fieldbyname('idLav').asinteger;
+          end;
+        end;
+      end;
+      BtnIncolla.enabled:=not BtnCopia.enabled;
+      DatiPI.idcliente:=QryTmp.fieldbyname('clienti_id').asinteger;
+      DatiPI.IdArticoPF:=QryTmp.fieldbyname('artico_id').asinteger;
+      DatiPI.DatRic:=QryTmp.fieldbyname('DatRic').asfloat;
+      DatiPI.VarDb:=trim(QryTmp.fieldbyname('vardb_codice').asstring);
+      DatiPI.Notapf:=trim(QryTmp.fieldbyname('comrig_descr').asstring);
+      DatiPI.idmarche:=QryTmp.fieldbyname('idmarche').asinteger;
+      DatiPI.idmagpre:=QryTmp.fieldbyname('idmagpre').asinteger;
+      if QryTmp.fieldbyname('ext_pialtatg_id').asinteger>0 then begin  //  leggo i dati relativi al preventivo altag
+        ext_pialtatg.Seek('id', QryTmp.fieldbyname('ext_pialtatg_id').asinteger);
+        if ext_pialtatg.found then begin
+          if ext_pialtatg.campi.idprodfin<>QryTmp.fieldbyname('artico_id').asinteger then begin
+            Showmessage('ATTENZIONE: Il preventivo ALTAG � stato creato utilizzando un prodotto finito diverso da quello indicato in commessa.'+#13#10#13#10+
+                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+          end
+          else if ext_pialtatg.campi.idprodfin<>DatiPI.IdArticoPF then begin
+            Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro prodotto finito.'+#13#10#13#10+
+                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+          end;
+          {    cv  24.02.06  spostato sotto
+          if ext_pialtatg.campi.idmateriale<>DatiPI.IdArticoC then begin
+            Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro materiale.'+#13#10#13#10+
+                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+          end;}
+          if ext_pialtatg.campi.idopsdlfas<>DatiPI.idopsdlfas then begin
+            Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altra lavorazione (Fase).'+#13#10#13#10+
+                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+          end;
+          AssegnaControlliExtRig;
+        end;
+      end;
+
+      if QryTmp.fieldbyname('idoptes').asinteger>0 then begin
+        if DatiPI.IdArticoC<>0 then
+          i:=DatiPI.IdArticoC  // se il preventivo � gia inserito prendo il componente del preventivo
+        else if ext_pialtatg.found then
+          i:=ext_pialtatg.campi.idmateriale
+        else
+          i:=IDCompDefault;
+
+        if cercaOPDP(QryTmp.fieldbyname('idoptes').asinteger, i) then begin
+          edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+          edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
+        end;
+      end;
+      idCauMovR:=QryTmp.fieldbyname('idCauMov').asinteger;
+
+      AggiornaPesi(QryTmp.fieldbyname('idoptes').asinteger, F2Materiale.KeyValue); // SF...31/07/2007
+    end;
+  finally
+    QryTmp.free;
+  end;
+
+  // Ini := TCSFileCfg.Create('ALTAG.CFG');
+  Ini := TCSFileCfg.Create(extractfilepath(Glo.IniGenerale)+'ALTAG.CFG');
+  IDTipiDocVendita := TStringList.Create;
+  try
+    DiametroMin := Ini.ReadFloat('PrevInd', 'DiametroMin', 0);
+    IDlavorazione:= Ini.ReadInteger('PrevInd', 'IDlav', 0);
+    IDCompDefault:= Ini.ReadInteger('PrevInd', 'IDCompDef', 0);
+    UtentiAbilitati := Ini.ReadString('PrevInd', 'UtentiAbilitati', '');
+    if idCauMovR>0 then begin
+      for i:=1 to 4 do begin
+        case i of
+          1: chiave:='IDCAMOVBV';
+          2: chiave:='IDCAMOVBL';
+          3: chiave:='IDCAMOVMV';
+          4: chiave:='IDCAMOVML';
+        end;
+        ValStr := Ini.ReadString('PrevInd', chiave, '');
+        if trim(ValStr)<>''  then begin
+          if strtoint(CS_Extract_SubStr(ValStr,',',0))=idCauMovR then begin
+            if F2IdTipiDoc.keyvalue=0 then
+              F2IdTipiDoc.keyvalue:=strtoint(CS_Extract_SubStr(ValStr,',',1));
+            if (i=2) or (i=4) then
+              DatiPI.NoMat:=True;
+            break;
+          end;
+        end;
+      end;
+    end;
+  IDTipiDocVendita.CommaText := ini.ReadString('PrevInd', 'IDTipiDocVendita', '');
+//  if IDTipiDocVendita.CommaText = '' then
+//  begin
+//    Application.MessageBox( PChar( Format ('ATTENZIONE: non sono stati impostati gli ID dei tipi documenti di Vendita nel file di configurazione "%s"'''+CRLF+'(sezione [%s], riga ''%s'')', ['ALTAG.CFG', 'PrevInd','IDTipiDocVendita'])),
+//                            PChar( APPTITLE ),
+//                            MB_OK + MB_ICONWARNING );
+//  end;
+
+
+  finally
+    Ini.free;
+  end;
+  if DiametroMin=0 then
+    showmessage('ATTENZIONE: Non � stato impostato il diametro minimo nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''DiametroMin'')');
+  if IDlavorazione=0 then
+    showmessage('ATTENZIONE: Non � stata impostata la lavorazione nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''IDlav'')');
+  if UtentiAbilitati='' then
+    showmessage('ATTENZIONE: Non sono stati impostati gli utenti che hanno l''accesso alla pagina ''Dati Commerciali'' e che sono abilitati al salvataggio ' +
+                'del Preventivo Industriale nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''UtentiAbilitati'')');
+
+  //  cv 24.02.06  spostato da sopra
+  if (ext_pialtatg.found) and (ext_pialtatg.campi.idmateriale<>DatiPI.IdArticoC) and (DatiPI.IdArticoC<>IDCompDefault) then begin
+    Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro materiale.'+#13#10#13#10+
+                'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+  end;
+
+  {if DatiPI.NoMat then
+    lblTipDoc.caption:=lblTipDoc.caption+' (Lavorazione)'
+  else
+    lblTipDoc.caption:=lblTipDoc.caption+' (Vendita)';}
+
+  if F2Lav.KeyValue=0 then
+    F2Lav.KeyValue:=IDlavorazione;
+
+  SG_CSvil.Cells[0, 0]:='Sviluppo';
+  SG_CSvil.Cells[1, 0]:='N. Cerchi';
+  SG_CSvil.Cells[2, 0]:='Diametro';
+
+  CalcolaTempo;   //  perch� quando lo fa nell'AssegnaControlliExtRig non ha ancora il DiametroMin, quindi � sbagliata
+  BtnAggOV.enabled:=ValidaUtente;
+end;
+
+function TFrmPrevInd.getTipDocOV(IdComRig: Integer): Integer;
+var
+  Qry : TCSEQuery;
+begin
+  Qry := TCSEQuery.Create(nil);
+  try
+    Qry.DataBaseName := DBExec.DatabaseName;
+    Qry.SQL.Text := 'select ct.IDTIPIDOC from COMTES ct inner join COMRIG cr on cr.IDCOMTES=ct.ID where cr.ID='+CS_Keyvalueto_SQLStr(IdComRig);
+    try
+      Qry.Open;
+    except
+      Result := -1;
+    end;
+    Result := Qry.FieldByName('IDTIPIDOC').AsInteger;
+  finally
+    FreeAndNil(Qry);
+  end;
+end;
+
+procedure TFrmPrevInd.PageControl1Change(Sender: TObject);
+var
+  Msg: String;
+begin
+  if (PageControl1.Pages[1].Visible) and
+     (PageControl1.Pages[1].Name = 'TabDatiCom') then
+    // Verifica se l'utente � abiltato o non abilitato all'accesso alla pagina 'Dati Commerciali'
+    if not ValidaUtente then begin
+      PageControl1.ActivePage := TabDatiTec;
+      Msg := 'Attenzione l''utente non ha l''accesso alla visualizzazione della pagina ''Dati Commerciali''.';
+      Application.MessageBox(PChar(Msg),
+                             PChar(Application.Title),
+                             MB_ICONWARNING + MB_OK);
+    end;
+end;
+
+procedure TFrmPrevInd.F2MaterialeKeyChange(Sender: TObject; NewKey,
+  OldKey: Integer);
+begin
+  LeggiMateriale;
+  edt_Costo.text:='0';
+  edt_TCosto.text:='';
+end;
+
+procedure TFrmPrevInd.F2LavKeyChange(Sender: TObject; NewKey,
+  OldKey: Integer);
+begin
+  LeggiMateriale;
+end;
+
+procedure TFrmPrevInd.LeggiMateriale;
+var
+  QryTmp: TCSEQuery;
+  spessore: double;
+begin
+  if F2Materiale.Keyvalue>0 then begin
+    QryTmp:=TCSEQuery.Create(nil);
+    try
+      QryTmp.DataBaseName := Azienda.DataBaseName;
+      QryTmp.sql.clear;
+      QryTmp.sql.add('select codice from classi '+
+                     'where id='+inttostr(F2Materiale.qryf2.fieldbyname('idclassi').asinteger));
+      QryTmp.open;
+      if not QryTmp.isempty then begin
+        Lab_Spessore.caption:=trim(formatvariant(QryTmp.fieldbyname('codice').asstring, importo));
+      end
+      else
+        Lab_Spessore.caption:='0';
+
+      try
+        spessore:=zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
+      except
+        spessore:=0;
+      end;
+
+      if cercaextvelAltatg(F2Materiale.qryf2.fieldbyname('idgruppi').asinteger, DatiPI.idmarche, F2Lav.KeyValue, spessore) then begin
+        try
+          //  edt_Fmmmin.text:=formatvariant(QryextvelAltatg.fieldbyname(Lab_finitura.caption).asfloat, importo);
+          edt_Fmmmin.text:=formatvariant(QryextvelAltatg.fieldbyname('Q2A').asfloat, importo);
+        except
+          on e: Exception Do Begin
+            MsgError('Si � verificato un problema nella ricerca della velocit� dei materiali.',
+                     E.message);
+          end;
+        end;
+
+        edt_SpazioRall.text:=formatvariant(QryextvelAltatg.fieldbyname('spazioRall').asfloat, importo);
+        edt_Rall.text:=formatvariant(QryextvelAltatg.fieldbyname('percRall').asfloat, Perc, 2);
+        Edt_TAttr.text:=formatvariant(QryextvelAltatg.fieldbyname('TAttrez').asfloat, quantita, 2);    //  lo faccio inserire manualmente dalla tabella di configurazione in minuti
+        Edt_TForat.text:=formatvariant(QryextvelAltatg.fieldbyname('TempoFor').asfloat, quantita, 0);  //  lo faccio inserire manualmente dalla tabella di configurazione in secondi
+      end;
+
+    finally
+      QryTmp.free;
+    end;
+  end;
+end;
+
+function TFrmPrevInd.cercaextvelAltatg(idgruppi, idmarche, idLav: integer; spessore: Double): boolean;
+begin
+  QryextvelAltatg.close;
+  QryextvelAltatg.parambyname('idgruppi').asinteger:=idgruppi;
+  QryextvelAltatg.parambyname('idmarche').asinteger:=idmarche;
+  QryextvelAltatg.parambyname('idLav').asinteger:=idLav;
+  QryextvelAltatg.parambyname('spessore').Asfloat:=spessore;
+  QryextvelAltatg.open;
+  result:= (not QryextvelAltatg.isempty);
+end;
+
+function TFrmPrevInd.cercaCompPrinc(ParidComrig: integer): boolean;
+begin
+  //  cerco l'eventuale componente principale
+  //
+  QrySelCompPrinc.close;
+  QrySelCompPrinc.parambyname('idcomrig').asinteger:=ParidComrig;
+  QrySelCompPrinc.open;
+  result:= (not QrySelCompPrinc.isempty);
+end;
+
+function TFrmPrevInd.cercaOPDP(idOptes, idArtico: integer): boolean;
+begin
+  //  cerco l'eventuale componente principale
+  //
+  QrySelOPDP.close;
+  QrySelOPDP.parambyname('idOptes').asinteger:=idOptes;
+  QrySelOPDP.parambyname('idArtico').asinteger:=idArtico;
+  QrySelOPDP.open;
+  result:= (not QrySelOPDP.isempty);
+end;
+
+function TFrmPrevInd.cercaSdlMat(idopdtPadre, idArtico: integer): boolean;
+begin
+  //  cerco l'eventuale componente principale
+  //
+  QrySelSdlMat.close;
+  QrySelSdlMat.parambyname('idopdt').asinteger:=idopdtPadre;
+  QrySelSdlMat.parambyname('idArtico').asinteger:=idArtico;
+  QrySelSdlMat.open;
+  result:= (not QrySelSdlMat.isempty);
+end;
+
+function TFrmPrevInd.cercaSdlFas(idopdtPadre, idArtico: integer): boolean;
+begin
+  result:=False;
+  if cercaSdlMat(idopdtPadre, idArtico{DatiPI.IdArticoPF}) then begin
+    QrySelSdlFas.close;
+    QrySelSdlFas.parambyname('idopsdlmat').asinteger:=QrySelSdlMat.fieldbyname('id').asinteger;
+    QrySelSdlFas.open;
+    result:= (not QrySelSdlFas.isempty);
+  end;
+end;
+
+function TFrmPrevInd.cercaOPDTpf(idoptes, idArticoPF: integer): boolean;
+begin
+  //  cerco nella distinta tecnica il prodotto finito
+  //
+  QrySelOPDTpf.close;
+  QrySelOPDTpf.parambyname('idoptes').asinteger:=idoptes;
+  // QrySelOPDTpf.parambyname('idArtico').asinteger:=idArticoPF;
+  QrySelOPDTpf.open;
+  result:= (not QrySelOPDTpf.isempty);
+end;
+
+
+
+procedure TFrmPrevInd.Edt_SvilLinKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  if sender is tedit then begin
+    CheckImporto(Key, tedit(sender).text);
+  end;
+end;
+
+procedure TFrmPrevInd.Edt_SvilLinExit(Sender: TObject);
+begin
+  if sender is tedit then begin
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 2);
+  end;
+
+end;
+
+procedure TFrmPrevInd.Edt_NProfExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 0);
+end;
+
+procedure TFrmPrevInd.edt_NLastreExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 5);
+end;
+
+procedure TFrmPrevInd.Edt_TotTaglio1PzExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Importo);
+end;
+
+procedure TFrmPrevInd.Edt_RallExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=formatvariant(ExtractVariant(tedit(sender).text, Importo), Perc, 2);
+end;
+
+procedure TFrmPrevInd.Edt_SvilLinChange(Sender: TObject);
+begin
+  if sender is tedit then begin
+    if (tedit(sender).name=Edt_SvilLin.name) or
+       (tedit(sender).name=Edt_NSpig.name) or
+       (tedit(sender).name=Edt_SpazioRall.name) or
+       (tedit(sender).name=Edt_Fmmmin.name) or
+       (tedit(sender).name=Edt_Rall.name) or
+       (tedit(sender).name=Edt_NProf.name) or
+       (tedit(sender).name=Edt_TForat.name) or
+       (tedit(sender).name=edt_SvilCerchi.name) then
+      CalcolaTempo;
+  end;
+end;
+
+procedure TFrmPrevInd.Edt_PezziLastraChange(Sender: TObject);
+begin
+  if sender is tedit then begin
+    if (tedit(sender).name=Edt_PezziLastra.name) then
+      CalcolaNLastre;
+  end;
+end;
+
+procedure TFrmPrevInd.BtnStdAnnullaClick(Sender: TObject);
+begin
+  AggOPTESDatiCont;
+  close;
+end;
+
+procedure TFrmPrevInd.PulisciDatiPI(myDatiPI: TDatiPI);
+begin
+  myDatiPI.idcliente:=0;
+  myDatiPI.IdArticoPF:=0;
+  myDatiPI.idmarche:=0;
+  myDatiPI.idmagpre:=0;
+  myDatiPI.DatRic:=0;
+  myDatiPI.VarDb:='0000';
+  myDatiPI.Notapf:='';
+  myDatiPI.IdArticoC:=0;
+  myDatiPI.IdOPDTC:=0;
+  myDatiPI.idopsdlfas:=0;
+  myDatiPI.NoMat:=False;
+end;
+
+function TFrmPrevInd.ValidaControlli: Boolean;
+begin
+  if ( IDTipiDocVendita.Count > 0 ) and (IDTipiDocVendita.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+  begin
+    if ZeroIfNull(ExtractVariant(edt_Altezza.Text, Importo)) = 0 then
+    begin
+      Result := False;
+      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+      if edt_Altezza.CanFocus then
+        edt_Altezza.SetFocus;
+      Exit;
+    end;
+
+    if ZeroIfNull(ExtractVariant(edt_Lunghezza.Text, Importo)) = 0 then
+    begin
+      Result := False;
+      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+      if edt_Lunghezza.CanFocus then
+        edt_Lunghezza.SetFocus;
+      Exit;
+    end;
+
+    if ZeroIfNull(ExtractVariant(Edt_PezziLastra.Text, Importo)) = 0 then
+    begin
+      Result := False;
+      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+      if Edt_PezziLastra.CanFocus then
+        Edt_PezziLastra.SetFocus;
+      Exit;
+    end;
+
+    if F2Materiale.KeyValue = 0 then
+    begin
+      Result := False;
+      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+      if F2Materiale.CanFocus then
+        F2Materiale.SetFocus;
+      Exit;
+    end;
+
+//    if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+//    begin
+//      Result := False;
+//      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+//                              PChar( APPTITLE ),
+//                              MB_OK + MB_ICONINFORMATION );
+//      if edt_Costo.CanFocus then
+//        edt_Costo.SetFocus;
+//      Exit;
+//    end;
+  end;
+  Result := True;
+end;
+
+function TFrmPrevInd.ValidaUtente: Boolean;
+begin
+  Result := True;
+
+  if Pos(Utente.ConnectId, UtentiAbilitati) = 0 then
+    Result := False;
+end;
+
+procedure TFrmPrevInd.BtnStdOkClick(Sender: TObject);
+Var
+  FOP: IPrev;
+  // FPI: TPrev;
+  // FrmPrdOPDT: IFrmPrdStd;
+  idoptes, idDTpadre: Integer;
+  isInIns: Boolean;
+begin
+  inherited;
+  {  cv 08.03.04  Finire di implememtare la visualizzazione dell'op, in quanto
+                  ci sono dei problemi perch� i documenti di vendita sono modali
+                  e quelli della produzione no  }
+   //  if CalcolaPeso(true)>0 then begin
+   //SD 04/10/2010 : RI #9595
+   if not ValidaControlli then
+    Exit;
+   
+   if CalcolaPeso(false)>0 then begin
+    if F2IdTipiDoc.keyvalue>0 then begin
+      //  if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin   cv  01.03.06  disponibile dalla 2.18
+      if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then begin
+        idoptes:=0;
+
+        if ext_pialtatg.found then begin
+          FOP.seek('id', ext_pialtatg.campi.idoptes);
+        end
+        else begin
+          FOP.ResetCampi;
+        end;
+
+        AggOPTES(FOP);
+
+        if FOP.Found then begin   //  inserimento o modifica optes ok
+          idoptes :=fop.GetCampi('id');
+          Lab_numPrev.caption:=trim(fop.GetCampi('annop'))+' '+trim(fop.GetCampi('numop'));
+          //  cerco il padre
+          //
+          if cercaOPDTpf(idoptes, DatiPI.IdArticoPF) then
+            idDTpadre:=QrySelOPDTpf.fieldbyname('id').asinteger
+          else
+            idDTpadre:=0;
+
+          AggOPDT(FOP, idoptes, idDTpadre, isInIns);
+
+          // if DatiPI.NoMat then begin  //  cv dal 02.2006 possono modificare il costo, quindi lo passo sempre
+            AggOPDP(FOP, idoptes, idDTpadre, isInIns);
+          // end;
+
+          AggSdlMat(FOP, idoptes, idDTpadre);
+          AggSdlFas(FOP, idoptes, idDTpadre);
+
+          {   cv 01.03.06  dalla 2.18 � interfacciata
+          //  nella 2.16 non � interfacciata
+          FPI := TPrev.Create(DBExec, Utente);
+          try
+            FPI.RicValTeoPI(idoptes);
+            Abort:=False;
+          finally
+            FPI.free;
+          end;}
+
+          FOP.RicValTeoPI(idoptes);
+
+          FOP.seek('id', idoptes);   //  mi riposiziono sul preventivo per rileggere i valori appena ricalcolati
+          AssegnaCampiExtRig(idoptes);
+          AssegnaControlliDatiComPI(FOP);
+          AskAggPrezzoComRig:=1;  //  il preventivo � stato modificato: in fase di chiusura verra chiesto all'utente se desidera aggiornare la commessa
+          // isInIns:=False;
+
+
+          AggiornaPesi(idoptes, F2Materiale.KeyValue); // SF...31/07/2007
+          if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+          begin
+            Application.MessageBox( PChar( 'Attenzione.'+CRLF+'il salvataggio � avvenuto correttamente ma il costo non � valorizzato.' ),
+                                    PChar( APPTITLE ),
+                                    MB_OK + MB_ICONINFORMATION );
+            Exit;
+          end;
+
+        end;
+
+        // CostoTot:=FOP.GetCampi('Valteo');
+        // Lab_numPrev.caption:=Lab_numPrev.caption+'   Costo: '+formatvariant(CostoTot, importo, 2);
+        // Lab_CosMA.caption:='Costo Materiali: '+formatvariant(FOP.GetCampi('CosMA')+FOP.GetCampi('RicMA'), importo, 2);
+        // Lab_CosLI.caption:='Costo Lavorazioni Interne: '+formatvariant(FOP.GetCampi('CosLI')+FOP.GetCampi('RicLI'), importo, 2);
+        // Lab_CosLE.caption:='Costo Lavorazioni Esterne: '+formatvariant(FOP.GetCampi('CosLE')+FOP.GetCampi('RicLE'), importo, 2);
+
+        // FOP.RicValTeo(idoptes);
+        // FOP.RicalcoloOP(nil, inttostr(idopdt), nil, nil, nil, nil, nil, false, res);
+
+        if idoptes>0 then begin
+          //FOP.seek('id', idoptes);   //  mi riposiziono sul preventivo per rileggere i valori appena ricalcolati
+          // AssegnaCampiExtRig(idoptes);
+          //AssegnaControlliDatiComPI(FOP);
+          BtnCopia.Enabled:=true;
+        // end;
+
+          {FrmPrdOPDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', idoptes, livello) as IFrmPrdStd;
+
+          if (Assigned(FrmPrdOPDT)) then begin
+            //tform(FrmPrdOPDT).formstyle:=fsnormal;
+            //tform(FrmPrdOPDT).visible:=false;
+            //tform(FrmPrdOPDT).close;
+            //FrmPrdOPDT.Showmodal;
+            //tform(FrmPrdOPDT).close;
+            //tform(FrmPrdOPDT).free;
+          end
+          else
+            ShowMessage('ATTENZIONE: Impossibile visualizzare il preventivo creato');}
+        end;
+      end
+      else begin
+        Showmessage('ATTENZIONE: Modulo produzione non disponibile');
+      end;
+    end
+    else begin
+      Showmessage('ATTENZIONE: Inserire il tipo documento');
+    end;
+  end;
+end;
+
+procedure TFrmPrevInd.AggOPTES(FOP: IPrev);
+begin
+  if not FOP.Found then begin
+    FOP.SetCampi('IdComRig', idcomrig);        //id riga commessa di riferimento
+    FOP.SetCampi('DatEmi', Azienda.Data);      // data emissione ... obbligatoria
+    FOP.SetCampi('AnnOP',  Year(Azienda.Data)); //Year); //anno ... obbligatorio
+    FOP.SetCampi('Stato',  'P');	            //stato ... obbligatorio
+    FOP.SetCampi('OPMan',  False);              //generazione manuale ... obbligatorio
+    FOP.SetCampi('IdTipiDoc', F2IdTipiDoc.keyvalue); //id tipo documento ... obbligatorio
+    FOP.SetCampi('TipNum', F2IdTipiDoc.qryf2.fieldbyname('TIPNUM').asstring); // tipo numerazione ... obbligatorio
+    FOP.SetCampi('IdCli',  DatiPI.IdCliente); //id cliente
+    FOP.SetCampi('DATVAL', Azienda.Data); //	data validit� DB
+    FOP.SetCampi('DatRic', DatiPI.DatRic); //	data richiesta
+    FOP.SetCampi('DatRpr', DatiPI.DatRic); //	data richiesta prelievo
+    FOP.SetCampi('idAllVer', DatiPI.idmagpre); //   id magazzino di prelievo
+
+    QryNextNumOP.Close;
+    QryNextNumOP.parambyname('ANNOP').asinteger:=Year(Azienda.Data);
+    QryNextNumOP.parambyname('IDTIPIDOC').asinteger:=F2IdTipiDoc.keyvalue;
+    QryNextNumOP.Open;
+    FOP.SetCampi('NumOP', QryNextNumOP.fieldbyname('ULTIMO').asinteger+1); //numero ... obbligatorio
+  end
+  else begin
+    AggiornaCosti;
+  end;
+
+  AssegnaCampiOptesDatiCont(FOP);
+
+  FOP.SetCampi('QtaOP', zeroifnull(extractvariant(Lab_Qta.caption, quantita)));    //quantit� da produrre ... obbligatoria   cv controllare
+  FOP.SetCampi('IdArtico', DatiPI.IdArticoPF);  //id articolo ... obbligatorio  //  pu� essere stato modificato sulla riga di commessa, quindi lo riscrivo
+  FOP.SetCampi('CODVARDB', DatiPI.VarDb);       // codice variante
+  FOP.SetCampi('Note', DatiPI.Notapf);
+
+  if not FOP.Found then
+    FOP.GeneraOP
+  else begin
+    // DF + Alef 15/12/2011: Tolto il ModOPTes
+    //FOP.ModOPTes(ext_pialtatg.campi.idoptes);
+    FOP.Modifica;
+    FOP.RicValTeoPI(FOP.CampiObj['Id']);
+  end;
+end;
+
+procedure TFrmPrevInd.AggOPTESDatiCont;
+var
+  FOP: IPrev;
+begin
+  if ext_pialtatg.found then begin
+    // if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin  cv  01.03.06  disponibile dalla 2.18
+    if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then begin
+      FOP.seek('id', ext_pialtatg.campi.idoptes);
+      if FOP.Found then begin
+        AssegnaCampiOptesDatiCont(FOP);
+        // DF + Alef 15/12/2011: Tolto il ModOPTes
+        //FOP.ModOPTes(ext_pialtatg.campi.idoptes);
+        FOP.Modifica;
+        FOP.RicValTeoPI(FOP.CampiObj['Id']);
+      end;
+    end;
+  end;
+end;
+
+procedure TFrmPrevInd.AssegnaCampiOptesDatiCont(FOP: IPrev);
+begin
+  FOP.SetCampi('RICMA', zeroifnull(ExtractVariant(edtImpMa.text, Importo)));
+  FOP.SetCampi('RICLI', zeroifnull(ExtractVariant(edtImpLi.text, Importo)));
+  FOP.SetCampi('RICLE', zeroifnull(ExtractVariant(edtImpLe.text, Importo)));
+  FOP.SetCampi('RICMC', zeroifnull(ExtractVariant(edtImpUl.text, Importo)));
+  FOP.SetCampi('IMPSC', zeroifnull(ExtractVariant(edtImpSc.text, Importo)));
+  FOP.SetCampi('PEMCMA', zeroifnull(ExtractVariant(edtPeMCMa.text, Importo)));
+  FOP.SetCampi('PEMCLI', zeroifnull(ExtractVariant(edtPeMCLi.text, Importo)));
+  FOP.SetCampi('PEMCLE', zeroifnull(ExtractVariant(edtPeMCLe.text, Importo)));
+  FOP.SetCampi('PEULMC', zeroifnull(ExtractVariant(edtPeUlMC.text, Importo)));
+  FOP.SetCampi('PEULSC', zeroifnull(ExtractVariant(edtPeUlSc.text, Importo)));
+  FOP.SetCampi('VALTEO', zeroifnull(ExtractVariant(edtTotale.text, Importo)));
+end;
+
+procedure TFrmPrevInd.AggOPDT(FOP: IPrev; idoptes, idDTpadre: integer; var isInIns: Boolean);
+var
+  idt, mseq, idmat: Integer;
+begin
+  if QrySelOPDTpf.fieldbyname('idartico').asinteger<>DatiPI.IdArticoPF then begin
+    QryUpdtOpdtPF.parambyname('id').asinteger:=idDTpadre;
+    QryUpdtOpdtPF.parambyname('idArtico').asinteger:=DatiPI.IdArticoPF;
+    QryUpdtOpdtPF.execsql;
+    QryUpdtOpSDLMatPF.parambyname('idopdt').asinteger:=idDTpadre;
+    QryUpdtOpSDLMatPF.parambyname('idArtico').asinteger:=DatiPI.IdArticoPF;
+    QryUpdtOpSDLMatPF.execsql;
+  end;
+
+  idt:=DatiPI.IdOPDTC;    //  sulla DT del componente mi sono posizionato all'ingresso della form (il componente del PI � sempre il primo del livello 1 avente come padre il PF). In inserimento � vuoto
+  if idt=0 then
+    idt:=-1;
+
+  FOP.SeekDT('id', idt);  //  se idt=-1 imposta FoundDT a false
+  if idt<=0 then begin
+    //  Inserimento del componente (no modifica)
+    //
+    mseq:=2000;
+    FOP.SetCampiOPDT('idoptes',  idoptes);
+    FOP.SetCampiOPDT('idpadre',  idDTpadre);
+    FOP.SetCampiOPDT('sequen',   mseq);
+    FOP.SetCampiOPDT('livello',  1);
+  end;
+
+
+  if F2Materiale.KeyValue>0 then
+    idmat:=F2Materiale.KeyValue
+  else
+    idmat:=IDCompDefault;
+
+  isInIns:=(QrySelCompPrinc.isempty or ((not QrySelCompPrinc.isempty) and
+           (QrySelCompPrinc.fieldbyname('idartico').asinteger<>idmat)));
+
+  FOP.SetCampiOPDT('idartico', idmat);
+
+  FOP.SetCampiOPDT('Note', trim(edt_Altezza.text)+' x '+trim(edt_Lunghezza.text));
+  FOP.SetCampiOPDT('qtimco', CalcolaPeso(false));
+
+  if idt<0 then
+    idt:=0;
+  FOP.AggOPDT(idt);
+  if isInIns or (DatiPI.IdOPDTC=0) then begin
+    if cercaCompPrinc(idcomrig) then begin  //  aggiorno DatiPI. cosi se premo salva pi un'altra volta non lo accoda
+      DatiPI.IdOPDTC:=QrySelCompPrinc.fieldbyname('id').asinteger;
+    end;
+  end;
+  DatiPI.IdArticoC:=F2Materiale.KeyValue;   //  cosi rimane allineato
+end;
+
+procedure TFrmPrevInd.AggOPDP(FOP: IPrev; idoptes, idDTpadre: integer; isInIns: Boolean);
+var
+  idmat: integer;
+begin
+  if F2Materiale.KeyValue>0 then
+    idmat:=F2Materiale.KeyValue
+  else
+    idmat:=IDCompDefault;
+
+  if cercaOPDP(idoptes, idmat) then begin
+    FOP.SeekDP('id',  QrySelOPDP.fieldbyname('id').asinteger);
+    {FOP.SetCampiOPDP('cosuni',  0);
+    FOP.SetCampiOPDP('tipcos',  '');}
+    // if (not isInIns) or (zeroifnull(extractvariant(edt_Costo.Text, Importo))=0) then begin
+    if isInIns or (zeroifnull(extractvariant(edt_Costo.Text, Importo))=0) then begin
+      //  cv  28.02.06  In inserimento non sono valorizzati (li calcola il PI), quindi andrebbe ad azzerare quelli calcolati dal PI
+      //  cv 14.03.06  Se sono a zero (sono in iserimento oppure ho cambiato il materiale) prendo quelli ricalcolati dal PI
+      FOP.SetCampiOPDP('cosuni', QrySelOPDP.fieldbyname('cosuni').asFloat);
+      FOP.SetCampiOPDP('tipcos', QrySelOPDP.fieldbyname('tipcos').asString);
+    end
+    else begin
+      //  cv  28.02.06  In inserimento non sono valorizzati (li calcola il PI), quindi andrebbe ad azzerare quelli calcolati dal PI
+      FOP.SetCampiOPDP('cosuni',  zeroifnull(extractvariant(edt_Costo.Text, Importo)));
+      FOP.SetCampiOPDP('tipcos',  edt_TCosto.Text);
+    end;
+    FOP.AggOPDP(idoptes, idmat,
+                CalcolaPeso(false)-QrySelOPDP.fieldbyname('qtimco').asfloat,      //  perch� va in somma
+                QrySelOPDP.fieldbyname('tipord').asstring,
+                idDTpadre);
+  end;
+end;
+
+procedure TFrmPrevInd.AggSdlMat(FOP: IPrev; idoptes, idDTpadre: integer);
+var
+  idMat: integer;
+  FTmpOP: IOrPr;
+begin
+  if cercaSdlMat(idDTpadre, DatiPI.IdArticoPF) then
+    idMat:=QrySelSdlMat.fieldbyname('id').asinteger
+  else
+    idMat:=0;
+
+  if idMat=0 then
+    idMat:=-1;
+
+  if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then begin
+    FTmpOP.Seek('id', idoptes);
+    FTmpOP.SeekSdlM('id', idMat);  //  se idMat=-1 imposta FoundDT a false
+    if idMat=-1 then begin
+      //  Inserimento del Materiale (no modifica)
+      //
+      FTmpOP.SetCampiSdlM('idoptes',  idoptes);
+      FTmpOP.SetCampiSdlM('idopdt',  idDTpadre);
+      FTmpOP.SetCampiSdlM('idartico',  DatiPI.IdArticoPF);
+      FTmpOP.SetCampiSdlM('sequen',  10);
+    end;
+
+    FTmpOP.SetCampiSdlM('qtimco',  zeroifnull(extractvariant(Lab_Qta.caption, quantita)));
+    FTmpOP.ModificaSdlM;  //  cv  01.03.06  nei PI non � interfacciato: mi appoggio all'OP
+    FOP.Seek('id', idoptes);
+    FOP.SeekSdlM('id', idMat);
+  end;
+end;
+
+procedure TFrmPrevInd.AggSdlFas(FOP: IPrev; idoptes, idDTpadre: integer);
+var
+  {idFas: integer;}
+  FTmpOP: IOrPr;
+begin
+  if cercaSdlFas(idDTpadre, DatiPI.IdArticoPF) then
+    DatiPI.idopsdlfas:=QrySelSdlFas.fieldbyname('id').asinteger
+  else
+    DatiPI.idopsdlfas:=0;
+
+  {if idFas=0 then
+    idFas:=-1;}
+
+
+  if DatiPI.idopsdlfas=0 then begin
+    //  Inserimento della Fase (no modifica)
+    //
+    // idFas:=FOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, IDlavorazione, '', False);
+    // DatiPI.idopsdlfas:=FOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, F2Lav.KeyValue, '', False);   //  cv 22.02.06  ora lo possono modificare
+    if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then begin
+      FTmpOP.seek('id', idoptes);
+      //  cv  01.03.06  nei PI non � interfacciato: mi appoggio all'OP
+      DatiPI.idopsdlfas:=FTmpOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, F2Lav.KeyValue, '', False);   //  cv 22.02.06  ora lo possono modificare
+      FOP.seek('id', idoptes);
+    end;
+
+
+
+    {FOP.SetCampiSdlF('idoptes',  idoptes);
+    FOP.SetCampiSdlF('idopdt',  idDTpadre);
+    FOP.SetCampiSdlF('idartico',  DatiPI.IdArticoPF);
+    FOP.SetCampiSdlF('sequen',  10);}
+  end;
+
+  if DatiPI.idopsdlfas>0 then begin
+    FOP.SeekSdlF('id', DatiPI.idopsdlfas);
+    FOP.SetCampiSdlF('idlav', F2Lav.KeyValue);   // cv 23.02.06  per implementare la modifica della fase
+    FOP.SetCampiSdlF('temavv',  SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo)))/(24*60));
+    FOP.SetCampiSdlF('temese',  SecSToSecC(SecstoMin(MintoSecs(zeroifnull(ExtractVariant(Edt_TempoPrev.text, Importo)))*
+                                                               zeroifnull(extractvariant(Lab_Qta.caption, quantita))))/(24*60));
+    //FOP.SetCampiSdlF('temese',  SecSToSecC(zeroifnull(ExtractVariant(Edt_TempoPrev.text, Importo)))/(24*60));
+    FOP.AggOPSdlF(DatiPI.idopsdlfas);
+  end;
+end;
+
+procedure TFrmPrevInd.AssegnaCampiExtRig(idoptes: integer);
+var
+  i: integer;
+  tmp: string;
+begin
+  ext_pialtatg.campi.idoptes:=idoptes;
+  ext_pialtatg.campi.idprodfin:=DatiPI.idarticoPF;
+  ext_pialtatg.campi.idmateriale:=F2Materiale.keyvalue;
+  ext_pialtatg.campi.idopsdlfas:=DatiPI.idopsdlfas;
+  ext_pialtatg.campi.spaziorall:=zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
+  ext_pialtatg.campi.percrall:=zeroifnull(ExtractVariant(Edt_Rall.text, Importo));
+  ext_pialtatg.campi.dimfor:=zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
+  ext_pialtatg.campi.tforat:=zeroifnull(ExtractVariant(Edt_TForat.text, Importo))/(24*60*60);   //  � espresso in secondi
+  ext_pialtatg.campi.tattr:=SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo)))/(24*60);
+  ext_pialtatg.campi.svillin:=zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
+  ext_pialtatg.campi.svilcer:=zeroifnull(ExtractVariant(edt_SvilCerchi.text, Importo));
+  ext_pialtatg.campi.nprof:=ExtractVariant(Edt_NProf.text, Importo);
+  ext_pialtatg.campi.nspig:=ExtractVariant(Edt_NSpig.text, Importo);
+  ext_pialtatg.campi.lastraalt:=zeroifnull(ExtractVariant(edt_Altezza.text, Importo));
+  ext_pialtatg.campi.lastralun:=zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo));
+  ext_pialtatg.campi.nlastre:=ExtractVariant(edt_NLastre.text, Importo);
+  ext_pialtatg.campi.pezzixlastra:=zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo));
+  tmp:='';
+  for i:=1 to SG_CSvil.rowcount do begin
+    tmp:=tmp+floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo)))+';'+
+             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+';'+
+             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo)))+';';
+    if length(tmp)>sizeof(ext_pialtatg.campi.sviluppo) then
+      ShowMessage('ATTENZIONE: riga '+inttostr(i)+' non salvata correttamente.');
+  end;
+  ext_pialtatg.campi.sviluppo:=tmp;
+  if ext_pialtatg.found then
+    ext_pialtatg.modifica
+  else
+    ext_pialtatg.insert;
+end;
+
+procedure TFrmPrevInd.AssegnaControlliExtRig;
+var
+  i: integer;
+  tmp: string;
+begin
+  if DatiPI.IdArticoC<>0 then
+    F2Materiale.keyvalue:=DatiPI.IdArticoC  // se il preventivo � gia inserito prendo il componente del preventivo
+  else
+    F2Materiale.keyvalue:=ext_pialtatg.campi.idmateriale;
+
+  Edt_SpazioRall.text:= FormatVariant(ext_pialtatg.campi.spaziorall, Quantita, 2);
+  Edt_Rall.text:=FormatVariant(ext_pialtatg.campi.percrall, Perc, 2);
+  Edt_Fmmmin.text:=FormatVariant(ext_pialtatg.campi.dimfor, Quantita, 2);
+  Edt_TForat.text:=FormatVariant(ext_pialtatg.campi.tforat*(24*60*60), Quantita, 0);  //  � espresso in secondi
+  Edt_TAttr.text:=FormatVariant(SecCToSecS(ext_pialtatg.campi.tattr*(24*60)), Quantita, 2);
+  Edt_NProf.text:=FormatVariant(ext_pialtatg.campi.nprof, Quantita, 0);
+  Edt_NSpig.text:=FormatVariant(ext_pialtatg.campi.nspig, Quantita, 0);
+  edt_Altezza.text:=FormatVariant(ext_pialtatg.campi.lastraalt, Quantita, 2);
+  edt_Lunghezza.text:=FormatVariant(ext_pialtatg.campi.lastralun, Quantita, 2);
+  edt_NLastre.text:=FormatVariant(ext_pialtatg.campi.nlastre, Quantita, 0);
+  Edt_PezziLastra.text:=FormatVariant(ext_pialtatg.campi.pezzixlastra, Quantita, 0);
+  Edt_SvilLin.text:=FormatVariant(ext_pialtatg.campi.svillin, Quantita, 2);
+  edt_SvilCerchi.text:=FormatVariant(ext_pialtatg.campi.svilcer, Quantita, 2);
+
+  tmp:=ext_pialtatg.campi.sviluppo;
+  for i:=1 to SG_CSvil.rowcount do begin
+    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3))<>'' then
+      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3)))<>0 then
+        SG_CSvil.Cells[0, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3)), Quantita, 2);
+    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1))<>'' then
+      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)))<>0 then
+        SG_CSvil.Cells[1, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)), Quantita, 0);
+    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2))<>'' then
+      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)))<>0 then
+        SG_CSvil.Cells[2, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)), Quantita, 2);
+  end;
+  CalcolaTempo;
+end;
+
+procedure TFrmPrevInd.FormCreate(Sender: TObject);
+begin
+  ext_pialtatg := Text_pialtatg.Create('ext_pialtatg', DbExec, Utente);
+end;
+
+procedure TFrmPrevInd.FormDestroy(Sender: TObject);
+begin
+  ext_pialtatg.free;
+  FreeAndNil(IDTipiDocVendita);
+end;
+
+procedure TFrmPrevInd.SG_CSvilKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  CheckImporto(Key, tedit(sender).text);
+end;
+
+procedure TFrmPrevInd.SG_CSvilSetEditText(Sender: TObject; ACol,
+  ARow: Integer; const Value: String);
+begin
+  if ACol=0 then
+    CalcolaSvilLin
+  else if (ACol=1) or (ACol=2) then
+    CalcolaSvilCerchi;
+end;
+
+procedure TFrmPrevInd.CalcolaSvilLin;
+var
+  tmp:double;
+  i: integer;
+begin
+  tmp:=0;
+  for i:=1 to SG_CSvil.rowcount do begin
+    tmp:=tmp+zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo));
+  end;
+  Edt_SvilLin.text:=FormatVariant(tmp, Quantita, 2);
+end;
+
+procedure TFrmPrevInd.CalcolaSvilCerchi;
+var
+  tmp:double;
+  i: integer;
+begin
+  tmp:=0;
+  for i:=1 to SG_CSvil.rowcount do begin
+    tmp:=tmp+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo));
+  end;
+  edt_SvilCerchi.text:=FormatVariant(tmp*3.14, Quantita, 2);
+end;
+
+procedure TFrmPrevInd.CalcolaNLastre;
+begin
+  // edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))+0.499, Quantita, 0);
+  if zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))<>0 then
+    edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo)), Quantita, 5);
+end;
+
+procedure TFrmPrevInd.CalcolaTempo;
+var
+  TLinV, TLinL, TCerV, TCerL, TProf, svilin, NProf, nspig, srall, velocita, PercRall, TForat, tmp :double;
+  i: integer;
+begin
+  TLinV:=0;   //  Tempo lineare veloce
+  TLinL:=0;   //  Tempo lineare lento
+  TCerV:=0;   //  Tempo cerchi veloce
+  TCerL:=0;   //  Tempo cerchi lento
+  // TProf:=0;   //  Tempo Profili (in secondi)
+  svilin:=zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
+  NProf:=zeroifnull(ExtractVariant(Edt_NProf.text, Importo));
+  nspig:=zeroifnull(ExtractVariant(Edt_NSpig.text, Importo));
+  srall:=zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
+  velocita:=zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
+  PercRall:=zeroifnull(ExtractVariant(Edt_Rall.text, Perc))/100;
+  TForat:=zeroifnull(ExtractVariant(Edt_TForat.text, Importo));   //  � espresso in secondi
+  TProf:=TForat*NProf;
+
+  if velocita<>0 then begin
+    TLinV:=SecCToSecS((svilin-nspig*2*srall)/velocita);
+    if PercRall<>0 then
+      TLinL:=SecCToSecS((nspig*2*srall)/(velocita*PercRall));
+
+    for i:=1 to SG_CSvil.rowcount do begin
+      if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<>0 then begin
+        if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<DiametroMin then begin
+          if PercRall<>0 then
+            TCerL:=SecSToMin(MinToSecS(TCerL)+
+                            (TForat*zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+
+                             MinToSecS((SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14)/(velocita*PercRall)))));
+        end
+        else begin      
+          tmp:=MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14-2*srall))/(velocita)));
+
+
+
+          if PercRall<>0 then
+            tmp:=tmp+MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*2*srall)/(velocita*PercRall)));
+
+          TCerV:=SecSToMin(MinToSecS(TCerV)+
+                          (TForat*zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+
+                          tmp);
+        end;
+      end;
+    end;
+
+
+    (*for i:=1 to SG_CSvil.rowcount do begin
+      if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<>0 then begin
+        if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<DiametroMin then begin
+          if PercRall<>0 then
+            {TCerL:=SecSToMin(MinToSecS(TCerL)+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*
+                                            (TForat+(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14)/(velocita*PercRall)))));}
+            TCerL:=SecSToMin(MinToSecS(TCerL)+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*
+                                            (TForat+MinToSecS((SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14)/(velocita*PercRall))))));
+        end
+        else begin
+          tmp:=SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14-2*srall)/(velocita));
+          if PercRall<>0 then
+            tmp:=SecSToMin(MinToSecS(tmp)+MinToSecS(SecCToSecS((2*srall)/(velocita*PercRall))));
+
+          TCerV:=SecSToMin(MinToSecS(TCerV)+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*(TForat+MinToSecS(tmp)));
+        end;
+      end;
+    end;*)
+  end;
+
+  Edt_TempoPrev.text:=FormatVariant(SecSToMin(MinToSecS(TLinV)+
+                                              MinToSecS(TLinL)+
+                                              MinToSecS(TCerV)+
+                                              MinToSecS(TCerL)+
+                                              TProf), Quantita, 2);
+end;
+
+function TFrmPrevInd.CalcolaPeso(msg: boolean): double;
+// var
+//   spessore: double;
+begin
+  {try
+    spessore:=zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
+  except
+    spessore:=0;
+  end;}
+
+  result:= (zeroifnull(ExtractVariant(edt_Altezza.text, Importo))*
+            zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo))/1000000)*
+            zeroifnull(ExtractVariant(edt_NLastre.text, Importo))*
+            F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;
+  if result=0 then begin
+    if msg then begin
+      if messagedlg('ATTENZIONE:'+#13#10#10+'Non � stata indicata la quantit� di materia prima.'+#13#10#10+
+              'Premere ok per impostarla ad uno e continuare oppure premere cancel per indicarla manualmente.', mtWarning, [mbOK, mbCancel], 0)=mrok then
+       result:=1
+    end
+    else
+      result:=1;
+  end;
+end;
+
+function TFrmPrevInd.SecCToSecS(MinSecC: double): double;
+var
+  TmpMin, TmpSec: Double;
+begin
+  {  Trasforma i secondi espressi in centesimi in secondi espressi in sessantesimi  }
+  TmpMin:=int(MinSecC);
+  TmpSec:=Frac(MinSecC)*0.6;
+  result:=TmpMin+TmpSec;
+end;
+
+function TFrmPrevInd.SecSToSecC(MinSecS: double): double;
+var
+  TmpMin, TmpSec: Double;
+begin
+  {  Trasforma i secondi espressi in sessantesimi in secondi espressi in centesimi  }
+  TmpMin:=int(MinSecS);
+  TmpSec:=Frac(MinSecS)/0.6;
+  result:=TmpMin+TmpSec;
+end;
+
+function TFrmPrevInd.MinToSecS(Minuti: double): double;
+var
+  TmpMin, TmpSec: Integer;
+begin
+  TmpMin:=Trunc(minuti)*60;
+  TmpSec:=Trunc(strtofloat(Floattostr(Frac(Minuti)*100+0.5)));
+  if TmpSec>=60 then begin
+    TmpSec:=TmpSec-60;
+    TmpMin:=TmpMin+60;
+  end;
+  result:=TmpMin+TmpSec;
+end;
+
+function TFrmPrevInd.SecSToMin(Secondi: double): double;
+var
+  TmpMin, TmpSec: Double;
+begin
+  TmpMin:=int(Secondi/60);
+  TmpSec:=(Secondi-TmpMin*60)/100;
+  result:=TmpMin+TmpSec;
+end;
+
+procedure TFrmPrevInd.edtPeMCMaKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  if sender is tedit then begin
+    CheckImporto(Key, tedit(sender).text);
+  end;
+end;
+
+procedure TFrmPrevInd.edtImpMaKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  if sender is tedit then begin
+    CheckImporto(Key, tedit(sender).text);
+    {  Se imputo l'importo a mano azzero la percentuale (se no all'uscita dalla percentuale l'importo viene ricalcolato)}
+    if tedit(sender).name=edtImpMa.name then begin
+      edtPeMCMa.text:='0';
+    end
+    else if tedit(sender).name=edtImpLi.name then begin
+      edtPeMCLi.text:='0';
+    end
+    else if tedit(sender).name=edtImpLe.name then begin
+      edtPeMCLe.text:='0';
+    end
+    else if tedit(sender).name=edtImpUl.name then begin
+      edtPeUlMC.text:='0';
+    end
+    else if tedit(sender).name=edtImpSc.name then begin
+      edtPeUlSc.text:='0';
+    end;
+  end;
+end;
+
+procedure TFrmPrevInd.edtPeMCMaExit(Sender: TObject);
+begin
+  if sender is tedit then begin
+    if tedit(sender).name=edtPeMCMa.name then begin
+      if zeroifnull(ExtractVariant(edtPeMCMa.text, Importo))<>0 then
+        edtImpMa.text:=formatvariant((zeroifnull(ExtractVariant(edtMa.text, Importo))*
+                                      zeroifnull(ExtractVariant(edtPeMCMa.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
+      else
+        edtImpMa.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
+
+      edtMaRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
+                                    zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end
+    else if tedit(sender).name=edtPeMCLi.name then begin
+      if zeroifnull(ExtractVariant(edtPeMCLi.text, Importo))<>0 then
+        edtImpLi.text:=formatvariant((zeroifnull(ExtractVariant(edtLi.text, Importo))*
+                                      zeroifnull(ExtractVariant(edtPeMCLi.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
+      else
+        edtImpLi.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
+
+      edtLiRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
+                                    zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end
+    else if tedit(sender).name=edtPeMCLe.name then begin
+      if zeroifnull(ExtractVariant(edtPeMCLe.text, Importo))<>0 then
+        edtImpLe.text:=formatvariant((zeroifnull(ExtractVariant(edtLe.text, Importo))*
+                                      zeroifnull(ExtractVariant(edtPeMCLe.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
+      else
+        edtImpLe.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
+
+      edtLeRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))+
+                                    zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end
+    else if (tedit(sender).name=edtPeUlMC.name) and (zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))=0) then begin
+      edtImpUl.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li far� dentro la CalcolaTotDatiCom
+    end
+    else if (tedit(sender).name=edtPeUlSc.name) and (zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))=0)then begin
+      edtImpSc.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li far� dentro la CalcolaTotDatiCom
+    end;
+
+    CalcolaTotDatiCom;
+    {if (tedit(sender).name=edtPeUlMC.name) and (zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))<>0) then begin
+      edtImpUl.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
+                                    zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end
+    else if (tedit(sender).name=edtPeUlSc.name) and (zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))<>0)then begin
+      edtImpSc.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
+                                    zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end;}
+
+    tedit(sender).text:=formatvariant(zeroifnull(ExtractVariant(tedit(sender).text, Importo)), perc, 2);
+    // CalcolaTotDatiCom;
+  end;
+end;
+
+procedure TFrmPrevInd.edtImpMaExit(Sender: TObject);
+begin
+  if sender is tedit then begin
+    if tedit(sender).name=edtImpMa.name then begin
+      {if zeroifnull(ExtractVariant(edtMa.text, Importo))<>0 then begin
+        edtPeMCMa.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))/
+                                       zeroifnull(ExtractVariant(edtMa.text, Importo))*100), perc, 2);
+      end
+      else
+        edtPeMCMa.text:='0';}
+      edtMaRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
+                                    zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end
+    else if tedit(sender).name=edtImpLi.name then begin
+      {if zeroifnull(ExtractVariant(edtLi.text, Importo))<>0 then begin
+        edtPeMCLi.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))/
+                                       zeroifnull(ExtractVariant(edtLi.text, Importo))*100), perc, 2);
+      end
+      else
+        edtPeMCLi.text:='0';}
+      edtLiRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
+                                    zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end
+    else if tedit(sender).name=edtImpLe.name then begin
+      {if zeroifnull(ExtractVariant(edtLe.text, Importo))<>0 then begin
+        edtPeMCLe.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))/
+                                       zeroifnull(ExtractVariant(edtLe.text, Importo))*100), perc, 2);
+      end
+      else
+        edtPeMCLe.text:='0';}
+      edtLeRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))+
+                                    zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+    end;
+
+    CalcolaTotDatiCom;
+    (*if tedit(sender).name=edtImpUl.name then begin
+      {if zeroifnull(ExtractVariant(edtTot.text, Importo))<>0 then begin
+        edtPeUlMC.text:=formatvariant((zeroifnull(ExtractVariant(edtImpUl.text, Importo))/
+                                       zeroifnull(ExtractVariant(edtTot.text, Importo))*100), perc, 2);
+      end
+      else
+        edtPeUlMC.text:='0';}
+    end
+    else if tedit(sender).name=edtImpSc.name then begin
+      {if zeroifnull(ExtractVariant(edtTot.text, Importo))<>0 then begin
+        edtPeUlSc.text:=formatvariant((zeroifnull(ExtractVariant(edtImpSc.text, Importo))/
+                                       zeroifnull(ExtractVariant(edtTot.text, Importo))*100), perc, 2);
+      end
+      else
+        edtPeUlSc.text:='0';}
+    end;*)
+    tedit(sender).text:=formatvariant(zeroifnull(ExtractVariant(tedit(sender).text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    //CalcolaTotDatiCom;
+  end;
+end;
+
+procedure TFrmPrevInd.CalcolaTotDatiCom;
+begin
+  edtTot.text:=formatvariant(zeroifnull(ExtractVariant(edtMa.text, Importo))+
+                             zeroifnull(ExtractVariant(edtLi.text, Importo))+
+                             zeroifnull(ExtractVariant(edtLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtTotGen.text:=edtTot.text;
+
+  edtTotImp.text:=formatvariant(zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
+                                zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
+                                zeroifnull(ExtractVariant(edtImpLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+
+  edtTotPrec1.text:=formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo))+
+                                  zeroifnull(ExtractVariant(edtTotImp.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+
+  if zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))<>0 then begin
+    edtImpUl.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
+                                  zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
+  end;
+  {else
+    edtImpUl.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);}
+
+  {if zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))<>0 then begin
+    edtImpSc.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
+                                  zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
+  end;}
+  {else
+    edtImpSc.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);}
+
+  edtTotPrec2.text:=formatvariant(zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))+
+                                  zeroifnull(ExtractVariant(edtImpUl.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+
+  if zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))<>0 then begin
+    edtImpSc.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec2.text, Importo))*
+                                  zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
+  end;
+
+  edtTotImpGen.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo))+
+                                   zeroifnull(ExtractVariant(edtImpUl.text, Importo))-
+                                   zeroifnull(ExtractVariant(edtImpSc.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+
+  if zeroifnull(ExtractVariant(edtTot.text, Importo))<>0 then begin
+    edtTotMC.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo))/
+                                  zeroifnull(ExtractVariant(edtTot.text, Importo))*100, Perc, 2);
+    edtTotMCGen.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImpGen.text, Importo))/
+                                    zeroifnull(ExtractVariant(edtTot.text, Importo))*100, Perc, 2);
+  end;
+
+  edtTotale.text:=formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo))+
+                                zeroifnull(ExtractVariant(edtTotImpGen.text, Importo)) , Importo, 2);
+
+  if zeroifnull(extractvariant(Lab_Qta.caption, importo))<>0 then begin
+    edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtTotaleUni.text:=formatvariant(zeroifnull(ExtractVariant(edtTotale.text, Importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)) , Importo, Azienda.RValutaSI.DecMaxEuro);
+  end;
+end;
+
+procedure TFrmPrevInd.AssegnaControlliDatiComPI(FOP: IPrev);
+var
+  idmat: integer;
+begin
+  if F2Materiale.KeyValue>0 then
+    idmat:=F2Materiale.KeyValue
+  else
+    idmat:=IDCompDefault;
+
+  if cercaOPDP(fop.GetCampi('id'), idmat) then begin
+    edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+    edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
+  end;
+
+  edtMa.text:=formatvariant(FOP.GetCampi('CosMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLi.text:=formatvariant(FOP.GetCampi('CosLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLe.text:=formatvariant(FOP.GetCampi('CosLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtPeMCMa.text:=formatvariant(FOP.GetCampi('PeMcMa'), Perc, 2);
+  edtPeMCLi.text:=formatvariant(FOP.GetCampi('PeMcLi'), Perc, 2);
+  edtPeMCLe.text:=formatvariant(FOP.GetCampi('PeMcLe'), Perc, 2);
+  edtImpMa.text:=formatvariant(FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtImpLi.text:=formatvariant(FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtImpLe.text:=formatvariant(FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtPeUlMC.text:=formatvariant(FOP.GetCampi('PeUlMc'), Perc, 2);
+  edtPeUlSc.text:=formatvariant(FOP.GetCampi('PeUlSc'), Perc, 2);
+  edtImpUl.text:=formatvariant(FOP.GetCampi('RicMc'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtImpSc.text:=formatvariant(FOP.GetCampi('ImpSc'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtMaRic.text:=formatvariant(FOP.GetCampi('CosMa')+FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLiRic.text:=formatvariant(FOP.GetCampi('CosLi')+FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLeRic.text:=formatvariant(FOP.GetCampi('CosLe')+FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  {if zeroifnull(extractvariant(Lab_Qta.caption, importo))<>0 then begin
+    edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+  end;}
+  CalcolaTotDatiCom;
+end;
+
+procedure TFrmPrevInd.BtnCopiaClick(Sender: TObject);
+var
+  TmpTab :TCSETable;
+  FDefs:TFieldDefs;
+  IDefs:TIndexDefs;
+  QryTmp: TCSEQuery;
+  Esiste: Boolean;
+  Ciclo: integer;
+begin
+  Esiste:=True;
+  QryTmp:=TCSEQuery.Create(nil);
+  try
+    QryTmp.DataBaseName := Azienda.DataBaseName;
+    QryTmp.sql.clear;
+    QryTmp.sql.add('delete from '+NtabtmpCopia);
+    try
+      QryTmp.execsql;
+    except
+      Esiste:=False;
+    end;
+    if not Esiste then begin
+      TmpTab := TCSETable.Create( nil );
+      Try
+        QryTmp.sql.clear;
+        QryTmp.Sql.Add('Select * From ext_pialtatg Where ID=0');  // Non seleziona nulla per evitare tempi inutili
+        QryTmp.Open;
+
+        // Creo la nuova tabella
+        FDefs := TmpTab.FieldDefs;
+
+        // Assegnazione dei campi interessanti
+        FDefs.Clear;
+
+        // copio la struttura di fatrig a cui aggiunger� altri campi
+        For Ciclo := 0 To ( QryTmp.FieldDefs.Count -1 ) Do
+        Begin
+           With QryTmp.FieldDefs[ciclo] Do
+           Begin
+             // If (UpperCase(Name) <> 'ID') Then
+               FDefs.Add( Name, DataType, Size, False );
+           End;
+        End;
+
+        // Creazione Indici
+        IDefs := TmpTab.IndexDefs;
+        IDefs.Clear;
+
+        CreateTableAppStd(Azienda, NtabtmpCopia, FDefs, IDefs, False);
+      Finally
+        TmpTab.Free;
+      End;
+    end;
+    QryTmp.sql.clear;
+    QryTmp.sql.add('insert into '+NtabtmpCopia+' select * from ext_pialtatg Where ID='+inttostr(ext_pialtatg.campi.id));
+    QryTmp.execsql;
+  finally
+    QryTmp.free;
+  end;
+end;
+
+procedure TFrmPrevInd.BtnIncollaClick(Sender: TObject);
+var
+  QryTmp: TCSEQuery;
+  tmp: string;
+  i: Integer;
+begin
+  QryTmp:=TCSEQuery.Create(nil);
+  try
+    QryTmp.DataBaseName := Azienda.DataBaseName;
+    QryTmp.sql.clear;
+    QryTmp.sql.add('select tmp.*, f.idlav from '+NtabtmpCopia+' tmp '+
+                   'left outer join opsdlfas f on f.id=tmp.idopsdlfas');
+    QryTmp.open;
+    if not QryTmp.isempty then begin
+      F2Materiale.keyvalue:=QryTmp.fieldbyname('idmateriale').asinteger;
+      F2Lav.keyvalue:=QryTmp.fieldbyname('idlav').asinteger;
+      //  Impostati nella LeggiMateriale
+      //  Edt_SpazioRall.text:= FormatVariant(QryTmp.fieldbyname('spaziorall').asFloat, Quantita, 2);
+      //  Edt_Rall.text:=FormatVariant(QryTmp.fieldbyname('percrall').asFloat, Perc, 2);
+      //  Edt_Fmmmin.text:=FormatVariant(QryTmp.fieldbyname('dimfor').asFloat, Quantita, 2);
+      //  Edt_TForat.text:=FormatVariant(QryTmp.fieldbyname('tforat').asFloat*(24*60*60), Quantita, 0);  //  � espresso in secondi
+      //  Edt_TAttr.text:=FormatVariant(SecCToSecS(QryTmp.fieldbyname('tattr').asFloat*(24*60)), Quantita, 2);   11.05.04  lo incollo dopo
+      Edt_NProf.text:=FormatVariant(QryTmp.fieldbyname('nprof').asFloat, Quantita, 0);
+      Edt_NSpig.text:=FormatVariant(QryTmp.fieldbyname('nspig').asFloat, Quantita, 0);
+      edt_Altezza.text:=FormatVariant(QryTmp.fieldbyname('lastraalt').asFloat, Quantita, 2);
+      edt_Lunghezza.text:=FormatVariant(QryTmp.fieldbyname('lastralun').asFloat, Quantita, 2);
+      edt_NLastre.text:=FormatVariant(QryTmp.fieldbyname('nlastre').asFloat, Quantita, 0);
+      Edt_PezziLastra.text:=FormatVariant(QryTmp.fieldbyname('pezzixlastra').asFloat, Quantita, 0);
+      Edt_SvilLin.text:=FormatVariant(QryTmp.fieldbyname('svillin').asFloat, Quantita, 2);
+      edt_SvilCerchi.text:=FormatVariant(QryTmp.fieldbyname('svilcer').asFloat, Quantita, 2);
+      tmp:=QryTmp.fieldbyname('sviluppo').asstring;
+      for i:=1 to SG_CSvil.rowcount do begin
+        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3))<>'' then
+          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3)))<>0 then
+            SG_CSvil.Cells[0, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3)), Quantita, 2);
+        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1))<>'' then
+          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)))<>0 then
+            SG_CSvil.Cells[1, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)), Quantita, 0);
+        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2))<>'' then
+          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)))<>0 then
+            SG_CSvil.Cells[2, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)), Quantita, 2);
+      end;
+
+      LeggiMateriale;
+
+      Edt_SpazioRall.text:= FormatVariant(QryTmp.fieldbyname('spaziorall').asFloat, Quantita, 2);
+      Edt_Rall.text:=FormatVariant(QryTmp.fieldbyname('percrall').asFloat, Perc, 2);
+      Edt_Fmmmin.text:=FormatVariant(QryTmp.fieldbyname('dimfor').asFloat, Quantita, 2);
+      Edt_TForat.text:=FormatVariant(QryTmp.fieldbyname('tforat').asFloat*(24*60*60), Quantita, 0);  //  � espresso in secondi
+
+      Edt_TAttr.text:=FormatVariant(SecCToSecS(QryTmp.fieldbyname('tattr').asFloat*(24*60)), Quantita, 2);   //  11.05.04  lo incollo adesso perch� la LeggiMateriale lo va a leggere dalle tabelle
+      CalcolaTempo;
+    end;
+  finally
+    QryTmp.free;
+  end;
+end;
+
+procedure TFrmPrevInd.AggiornaCosti;
+var
+  FOPtmp: TOrPr;
+  OrCos1, OrCos2, OrCos3, OrCos4, OrCos5, tmpOrdVal: string;
+begin
+
+  OrCos1       := GetParDef('PIOrCos1', Azienda.databasename);
+  OrCos2       := GetParDef('PIOrCos2', Azienda.databasename);
+  OrCos3       := GetParDef('PIOrCos3', Azienda.databasename);
+  OrCos4       := GetParDef('PIOrCos4', Azienda.databasename);
+  OrCos5       := GetParDef('PIOrCos5', Azienda.databasename);
+
+  tmpOrdVal:='';
+  if OrCos1 <> '' then
+    tmpOrdVal := tmpOrdVal + OrCos1 + ';';
+  if OrCos2 <> '' then
+    tmpOrdVal := tmpOrdVal + OrCos2 + ';';
+  if OrCos3 <> '' then
+    tmpOrdVal := tmpOrdVal + OrCos3 + ';';
+  if OrCos4 <> '' then
+    tmpOrdVal := tmpOrdVal + OrCos4 + ';';
+  if OrCos5 <> '' then
+    tmpOrdVal := tmpOrdVal + OrCos5 + ';';
+
+  if (tmpOrdVal <> '') then
+  begin
+
+    FOPtmp := TOrPr.Create(DBExec, Utente);
+    try
+      FOPtmp.seek('id', ext_pialtatg.campi.idoptes);
+      FOPtmp.AggVOPDP(ext_pialtatg.campi.idoptes, tmpOrdVal, 'C', True)
+    finally
+      FOPtmp.free;
+    end;
+  end;
+
+  {  Per adesso non li gestiamo
+  // ATTUALIZZAZIONE COSTI INSIEMI E SOTTOINSIEMI ESTERNI
+  if Settings.OrCosIEGS <> '' then
+    tmpOrdVal := Settings.OrCosIEGS + ';';
+
+  if (msg = '') and (tmpOrdVal <> '') then
+  begin
+    if not FOPtmp.AggVOPDP(FOPtmp.CampiOPTes.Id, tmpOrdVal, 'IE', True) then
+      msg := RS_PRD_FOPDP_006;
+  end;
+
+  // ATTUALIZZAZIONE COSTI INSIEMI E SOTTOINSIEMI INTERNI
+  if Settings.OrCosIIGS <> '' then
+    tmpOrdVal := Settings.OrCosIIGS + ';';
+
+  if (msg = '') and (tmpOrdVal <> '') then
+  begin
+    if not FOPtmp.AggVOPDP(FOPtmp.CampiOPTes.Id, tmpOrdVal, 'II', True) then
+      msg := RS_PRD_FOPDP_008;
+  end;}
+end;
+
+procedure TFrmPrevInd.edt_CostoKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  if sender is tedit then begin
+    CheckImporto(Key, tedit(sender).text);
+  end;
+  edt_TCosto.text:='';
+end;
+procedure TFrmPrevInd.BtnAggOVClick(Sender: TObject);
+begin
+  AggiornaComtes(False);
+end;
+
+procedure TFrmPrevInd.AggiornaComtes(ask: Boolean);
+begin
+  AskAggPrezzoComRig:=2;  //  l'utente desidera aggiornare la commessa
+end;
+
+procedure TFrmPrevInd.AggiornaPesi(IdOpTes, IdArtico: Integer);
+var QryArt: TCSEQuery;
+begin
+  // SF...31/07/2007 : Estraggo il peso unitario e totale
+  QryArt:=TCSEQuery.Create(nil);
+  QryArt.DataBaseName := Azienda.DataBaseName;
+  try // finally
+    if (IdOpTes=0) or (IdArtico=0) then
+      exit;
+
+    QryArt.sql.clear;
+    QryArt.sql.Text:= 'select sum(dp.qtimco) qtimco, t.QtaOP '+
+                      'from opdp dp '+
+                      'inner join OpTes t on t.id=dp.IdOpTes '+
+                      'where (dp.idoptes= '+CS_KeyValueTo_SqlStr(IdOpTes)+') '+
+                        'and (dp.idartico='+CS_KeyValueTo_SqlStr(IdArtico)+') '+
+                      'Group by t.QtaOP ';
+    QryArt.open;
+
+    try
+      lblPesoUni.Caption:=trim(formatvariant((QryArt.fieldbyname('QtImCo').AsFloat/QryArt.fieldbyname('QtaOP').AsFloat), Quantita));
+    except
+      lblPesoUni.Caption:='0';
+    end;
+    try
+      lblPesoTot.Caption:=trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
+    except
+      lblPesoTot.Caption:='0';
+    end;
+  finally
+    FreeAndNil(QryArt);
+  end;
+end;
+
+end.
+
diff --git a/source/pi_Altag_PrevInd/Oext_pialtatg.pas b/source/pi_Altag_PrevInd/Oext_pialtatg.pas
new file mode 100644
index 0000000..d4bc8b2
--- /dev/null
+++ b/source/pi_Altag_PrevInd/Oext_pialtatg.pas
@@ -0,0 +1,185 @@
+unit Oext_pialtatg;
+
+interface
+
+uses
+  System.SysUtils, S3Registry, cStd,
+  RSQL;
+
+const
+  CAMPICOUNTEXT_PIALTATG = 17;
+
+type
+  TCountext_pialtatg = Array[0..(CAMPICOUNTEXT_PIALTATG - 1)] of Boolean;
+  TCampiext_pialtatg = record
+    id           : Integer;       // PK   O.Identificatore
+    idoptes      : Integer;       // FK   1.Id
+    idprodfin    : Integer;       // FK   2.Id
+    idmateriale  : Integer;       // FK   3.Id
+    spaziorall   : Double;        //      4.
+    percrall     : Double;        //      5.
+    dimfor       : Double;        //      6.
+    tforat       : Double;        //      7.
+    tattr        : Double;        //      8.
+    svillin      : Double;        //      9.
+    svilcer      : Double;        //     10.
+    nprof        : Integer;       //     11.
+    nspig        : Integer;       //     12.
+    lastraalt    : Double;        //     13.
+    lastralun    : Double;        //     14.
+    nlastre      : Integer;       //     15.
+    pezzixlastra : Double;        //     16.
+    sviluppo     : String; //[250];   //     17.
+    idopsdlfas   : Integer;
+  end;
+  Text_pialtatg = Class(TOStd)
+    Campi: TCampiext_pialtatg;
+  private
+    { Private declarations }
+  protected
+    procedure AssegnaCampi;override;
+    procedure ResetCampi;  override;
+  public
+    function Insert  : integer; override;
+    function Modifica: boolean; override;
+  end;
+
+implementation
+
+uses RNumb;
+
+procedure Text_pialtatg.AssegnaCampi;
+begin
+  with Campi, DM.QrySel do begin
+    Id           := FieldByName('Id').AsInteger;
+    idoptes      := FieldByName('idoptes').asInteger;
+    idprodfin    := FieldByName('idprodfin').asInteger;
+    idmateriale  := FieldByName('idmateriale').asInteger;
+    idopsdlfas   := FieldByName('idopsdlfas').asInteger;
+    spaziorall   := FieldByName('spaziorall').asFloat;
+    percrall     := FieldByName('percrall').asFloat;
+    dimfor       := FieldByName('dimfor').asFloat;
+    tforat       := FieldByName('tforat').asFloat;
+    tattr        := FieldByName('tattr').asFloat;
+    svillin      := FieldByName('svillin').asFloat;
+    svilcer      := FieldByName('svilcer').asFloat;
+    nprof        := FieldByName('nprof').asInteger;
+    nspig        := FieldByName('nspig').asInteger;
+    lastraalt    := FieldByName('lastraalt').asFloat;
+    lastralun    := FieldByName('lastralun').asFloat;
+    nlastre      := FieldByName('nlastre').asInteger;
+    pezzixlastra := FieldByName('pezzixlastra').asFloat;
+    sviluppo     := FieldByName('sviluppo').asString;
+  end;
+end;
+
+procedure Text_pialtatg.ResetCampi;
+begin
+  with Campi do begin
+    Id           := 0;
+    idoptes      := 0;
+    idprodfin    := 0;
+    idmateriale  := 0;
+    idopsdlfas   := 0;
+    spaziorall   := 0;
+    percrall     := 0;
+    dimfor       := 0;
+    tforat       := 0;
+    tattr        := 0;
+    svillin      := 0;
+    svilcer      := 0;
+    nprof        := 0;
+    nspig        := 0;
+    lastraalt    := 0;
+    lastralun    := 0;
+    nlastre      := 0;
+    pezzixlastra := 0;
+    sviluppo     := '';
+  end;
+end;
+
+function Text_pialtatg.Insert: integer;
+begin
+  sql := 'insert into ext_pialtatg ('+
+            'idoptes,'      +
+            'idprodfin,'    +
+            'idmateriale,'  +
+            'idopsdlfas,'   +
+            'spaziorall,'   +
+            'percrall,'     +
+            'dimfor,'       +
+            'tforat,'       +
+            'tattr,'        +
+            'svillin,'      +
+            'svilcer,'      +
+            'nprof,'        +
+            'nspig,'        +
+            'lastraalt,'    +
+            'lastralun,'    +
+            'nlastre,'      +
+            'pezzixlastra,' +
+            'sviluppo)';
+  sql := sql +
+         'values ('+
+            CS_KeyValueTo_SqlStr(campi.idoptes)                        + ',' +
+            CS_KeyValueTo_SqlStr(campi.idprodfin)                      + ',' +
+            CS_KeyValueTo_SqlStr(campi.idmateriale)                    + ',' +
+            CS_KeyValueTo_SqlStr(campi.idopsdlfas)                     + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall))          + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall))            + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor))              + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat))              + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr))               + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin))             + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer))             + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof))               + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig))               + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt))           + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun))           + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre))             + ',' +
+            CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra))        + ',' +
+            CS_VariantTo_SqlStr(campi.sviluppo)                        + ')';
+
+  result := inherited insert;
+  Seek('id', result);
+end;
+
+function Text_pialtatg.Modifica: boolean;
+begin
+  // Se l'oggetto non contiene un record valido, invece di un update
+  // viene eseguito un insert
+  if not Found then begin
+    result := (insert > 0);       // se riuscito l'insert posso uscire
+    exit;
+  end;
+
+  sql := 'update ext_pialtatg set ' +
+            'idoptes='      + CS_KeyValueTo_SqlStr(campi.idoptes)                        + ',' +
+            'idprodfin='    + CS_KeyValueTo_SqlStr(campi.idprodfin)                      + ',' +
+            'idmateriale='  + CS_KeyValueTo_SqlStr(campi.idmateriale)                    + ',' +
+            'idopsdlfas='   + CS_KeyValueTo_SqlStr(campi.idopsdlfas)                     + ',' +
+            'spaziorall='   + CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall))          + ',' +
+            'percrall='     + CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall))            + ',' +
+            'dimfor='       + CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor))              + ',' +
+            'tforat='       + CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat))              + ',' +
+            'tattr='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr))               + ',' +
+            'svillin='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin))             + ',' +
+            'svilcer='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer))             + ',' +
+            'nprof='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof))               + ',' +
+            'nspig='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig))               + ',' +
+            'lastraalt='    + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt))           + ',' +
+            'lastralun='    + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun))           + ',' +
+            'nlastre='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre))             + ',' +
+            'pezzixlastra=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra))        + ',' +
+            'sviluppo='     + CS_VariantTo_SqlStr(campi.sviluppo)                        +
+         ' where id ='+ IntToStr(campi.id);
+
+  result := inherited Modifica;
+end;
+
+initialization
+  RegObjStdD2(Text_pialtatg, 'Objext_pialtatg');
+
+finalization
+  UnRegOggetto('Objext_pialtatg');
+end.
diff --git a/source/pi_Altag_PrevInd/README.md b/source/pi_Altag_PrevInd/README.md
new file mode 100644
index 0000000..7279f10
--- /dev/null
+++ b/source/pi_Altag_PrevInd/README.md
@@ -0,0 +1 @@
+# plugin pi_Altag_PrevInd
diff --git a/source/pi_Altag_PrevInd/UPrevInd.pas b/source/pi_Altag_PrevInd/UPrevInd.pas
new file mode 100644
index 0000000..0abab19
--- /dev/null
+++ b/source/pi_Altag_PrevInd/UPrevInd.pas
@@ -0,0 +1,966 @@
+unit UPrevInd;
+
+interface
+
+uses
+  System.Classes, Vcl.Forms, Winapi.Windows, CSETables, System.SysUtils, S3Registry, S3Plugin,
+  IProduzione, OOrPr, GetRBas, GetRPrd, UOPTipi, UTipiPrd, RNote, UtilsArticoli;
+
+type
+  TPrevInd = class(TCustomPlugIn)
+  private
+    FOEClickbtnPrevInd: TNotifyEvent;
+    FOEExitedtPrezzo: TNotifyEvent;
+    FOEChangecbxRiferi1: TNotifyEvent;
+    function CalcolaCoefConv(ACodArtico: String): Double;
+    function GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
+                          AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): String;
+  published
+    property  OEClickbtnPrevInd: TNotifyEvent read FOEClickbtnPrevInd write FOEClickbtnPrevInd;
+    property  OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
+    property  OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
+    procedure PlugIn_PrevInd;
+    procedure BTN_PrevInd(Sender: TObject);
+    procedure PIClickbtnPrevInd(Sender: TObject);   //  cv dalla 2.18 lo vogliono come bottone indipendente
+    procedure PIExitedtPrezzo(Sender: TObject);
+    procedure PIChangecbxRiferi1(Sender: TObject);
+    procedure GenerazioneOP;
+  end;
+
+implementation
+
+uses
+  RNumb, RMiscComp, UCoreUtils, Vcl.Controls, Vcl.Dialogs, FPrevInd, SMDBGrid,
+  QueryPars, FrmStd, Compf2, RSQL, UCoreTipi, UCoreDB;
+
+// -----------------------------------------------------------------------------
+//  Funziona di verifica utenti abilitati
+// -----------------------------------------------------------------------------
+function Inside(lista, compare : String):Boolean;
+var
+  SL : TStringList;
+begin
+  Result := False;
+  SL := TStringList.create;
+  try
+    SL.commatext := lista;
+    If SL.indexOf(compare) <> -1 then
+      Result := True;
+  finally
+    FreeAndNil(SL);
+  end;
+end;
+  
+procedure TPrevInd.PlugIn_PrevInd;
+{var
+  pi_btnPrevInd: TSpeedButton;}
+begin
+  {  cv 20.09.05  servivano alla 2.16
+  GetFormComp('btnPrevInd', pi_btnPrevInd);
+  if not assigned(pi_btnPrevInd) then begin
+    showmessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PlugIn_PrevInd).');
+  end
+  else begin
+    pi_btnPrevInd.enabled:=true;
+    pi_btnPrevInd.visible:=true;
+  end;
+
+  RedirEvent('btnPrevInd', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');}
+  // RedirEvent('CkbFatDir', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');
+  RedirEvent('btnPrevInd', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');
+  RedirEvent('edtPrezzo', 'Onexit',  'OEExitedtPrezzo',   'PIExitedtPrezzo');        //  cos� mi aggiorna i prezzi della riga
+  RedirEvent('cbxRiferi1','OnChange','OEChangecbxRiferi1','PIChangecbxRiferi1');     //  cos� mi aggiorna lo stato della riga
+end;
+
+procedure TPrevInd.PIExitedtPrezzo(Sender: TObject);
+begin
+  if Assigned(OEExitedtPrezzo) then OEExitedtPrezzo(Sender);
+end;
+
+procedure TPrevInd.PIChangecbxRiferi1(Sender: TObject);
+begin
+  if Assigned(OEChangecbxRiferi1) then OEChangecbxRiferi1(Sender);
+end;
+
+procedure TPrevInd.PIClickbtnPrevInd(Sender: TObject);
+var
+  piDbgrComRig: TSMDBGrid;
+  QryTmp: TCSEQuery;
+begin
+  GetFormComp('dbgrComRig', piDbgrComRig);
+  if not assigned(piDbgrComRig) then begin
+    showmessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PIClickbtnPrevInd).');
+  end
+  else begin
+    QryTmp:=TCSEQuery.Create(nil);
+    try
+      QryTmp.DataBaseName := Azienda.DataBaseName;
+      QryTmp.sql.clear;
+      QryTmp.sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id '+
+                     'where td.tipdoc=''D'' and o.idcomrig='+inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
+      QryTmp.open;
+      if QryTmp.isempty then begin
+        BTN_PrevInd(Sender)   //   il PI non � creato: lo creo con la loro finestra
+      end
+      else begin
+        if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
+      end;
+    finally
+      QryTmp.free;
+    end;
+  end;
+end;
+
+procedure TPrevInd.BTN_PrevInd(Sender: TObject);
+var
+  FrmPrevInd: TFrmPrevInd;
+  piDbgrComRig: TSMDBGrid;
+  piEdtQta1, piEdtQta2, piEdtQta3, piEdtPrezzo: Tget;
+  piF2IdArtico: TF2;
+begin
+  GetFormComp('dbgrComRig', piDbgrComRig);
+  GetFormComp('F2IdArtico', piF2IdArtico);
+  GetFormComp('EdtQta1',    piEdtQta1);
+  GetFormComp('EdtQta2',    piEdtQta2);
+  GetFormComp('EdtQta3',    piEdtQta3);
+  GetFormComp('edtPrezzo',  piEdtPrezzo);
+  if (not assigned(piDbgrComRig)) or
+     (not assigned(piF2IdArtico)) or
+     (not assigned(piEdtQta1)) or
+     (not assigned(piEdtQta2)) or
+     (not assigned(piEdtQta3)) or
+     (not assigned(piEdtPrezzo)) then begin
+    showmessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (BTN_PrevInd).');
+  end
+  else begin
+    FrmPrevInd:=TFrmPrevInd.create(nil);
+    try
+      FrmPrevInd.livello:=TFormStd(form).livello;
+      FrmPrevInd.idcomrig:=TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
+      FrmPrevInd.showmodal;
+      // if not FrmPrevInd.Abort then begin  //  riportiamo sempre i dati dal preventivo alla riga
+      // Riportiamo i dati dal preventivo alla riga se l'utente � abilitato
+      if FrmPrevInd.ValidaUtente and
+         ((FrmPrevInd.AskAggPrezzoComRig=2) or
+          ((FrmPrevInd.AskAggPrezzoComRig=1) and
+           (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes)))
+      then begin
+        if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
+          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta3.getvalue)
+        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
+          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta2.getvalue)
+        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
+          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta1.getvalue)
+        else
+          piEdtPrezzo.settext(0);
+
+        PIExitedtPrezzo(Sender);
+        PIChangecbxRiferi1(Sender);
+      end;
+    finally
+      FrmPrevInd.free;
+    end;
+  end;
+end;
+
+procedure TPrevInd.GenerazioneOP;
+var
+  I: Integer;
+  objOrPr: TOrPr;
+  objOPTes: IOrPr;
+  Msg: String;
+  Year, Month, Day: Word;
+  NewqryRighe: TQueryPars;
+  NewdbgrRighe: TSMDBGrid;
+  NewTran, FlagErr: Boolean;
+  ListaIdComRig, ListaIdComRigOnOP: TStringList;
+  QryArtExistsDB, QryComRigExistsOP, QryComRigExistsPI, qryTipiDocOP, QryNumOP: TCSEQuery;
+begin
+  // Modifica del tipo documento
+  GetFormComp('dbgrRighe', NewdbgrRighe);
+  GetFormComp('qryRighe', NewqryRighe);
+  if NewdbgrRighe.SelectedRows.Count > 0 then begin
+    Msg := 'Si desidera generare gli Ordini di Produzione per le righe selezionate?';
+    if Application.MessageBox(PChar(Msg),
+                              PChar(Application.Title),
+                              MB_ICONQUESTION + MB_YESNO) = IDYES then begin
+      // Creazione oggetti qry
+      QryNumOP := TCSEQuery.Create(nil);
+      QryNumOP.DatabaseName := DBExec.DatabaseName;
+      QryTipiDocOP := TCSEQuery.Create(nil);
+      QryTipiDocOP.DatabaseName := DBExec.DatabaseName;
+      QryArtExistsDB := TCSEQuery.Create(nil);
+      QryArtExistsDB.DatabaseName := DBExec.DatabaseName;
+      QryComRigExistsOP := TCSEQuery.Create(nil);
+      QryComRigExistsOP.DatabaseName := DBExec.DatabaseName;
+      QryComRigExistsPI := TCSEQuery.Create(nil);
+      QryComRigExistsPI.DatabaseName := DBExec.DatabaseName;
+
+      // Creazione dell'oggetto Produzione per generare un Ordine di Produzione
+      // dal Preventivo Industriale
+      if not Assigned(objOPTes) then
+        if not GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, objOPTes) then begin
+          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente errore ' +
+                 'durante un errore durante generazione dell''interfaccia "IOrPr".';
+          Application.MessageBox(PChar(Msg),
+                                 PChar(Application.Title),
+                                 MB_ICONINFORMATION + MB_OK);
+          Exit;
+        end;
+
+      // Creazione dell'oggetto Produzione per generare un Ordine di Produzione
+      // dalla Distinta Base dell'articolo
+      objOrPr := TOrPr.Create(DBExec, Utente);
+
+      // Creazione variabile lista righe di commesse per le quali non � stato possibile
+      // generarre un Ordine di Produzione
+      ListaIdComRig := TStringList.Create;
+      ListaIdComRig.Clear;
+
+      // Creazione variabile lista righe di commesse per le quali non � stato possibile
+      // generarre un Ordine di Produzione perch� gi� esiste
+      ListaIdComRigOnOP := TStringList.Create;
+      ListaIdComRigOnOP.Clear;
+
+      // Apertura Transazione
+      NewTran := not DBExec.InTransaction;
+      if NewTran then DBExec.CSStartTransaction;
+      FlagErr := False;
+      try
+        QryArtExistsDB.Sql.Text := 'SELECT v.Id, v.Idartico FROM VarDB v ' +
+                                   'INNER JOIN Lotser ls ON v.Idartico = ls.Idartico ' +
+                                   'INNER JOIN Artico art ON ls.Idartico = art.Id ' +
+                                   'WHERE (art.codice = :VCodice) AND ' +
+                                         '(ls.Numser = ' + CS_VariantTo_SqlStr(NUMSERDEF) + ') AND ' +
+                                         '(ls.Numlot = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ')';
+        QryArtExistsDB.Prepare;
+
+        QryComRigExistsOP.Sql.Text := 'SELECT op.Id FROM Optes op ' +
+                                      'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
+                                      'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
+                                            '(tp.Tipdoc = ''P'')';
+        QryComRigExistsOP.Prepare;
+
+        QryComRigExistsPI.Sql.Text := 'SELECT op.Id FROM Optes op ' +
+                                      'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
+                                      'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
+                                            '(tp.Tipdoc = ''D'')';
+        QryComRigExistsPI.Prepare;
+
+        // Modifico solo D.d.T selezionati sulla griglia
+        for I := 0 to NewdbgrRighe.SelectedRows.Count - 1 do begin
+          NewqryRighe.Bookmark := NewdbgrRighe.SelectedRows[I];
+
+          // Verifico se la Riga della Commessa ha un Ordine di Produzione
+          QryComRigExistsOP.Close;
+          QryComRigExistsOP.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+          try
+            QryComRigExistsOP.Open;
+            if QryComRigExistsOP.Eof then begin
+              // Verifico se l'articolo della Riga della Commessa presenta una Distinta Base
+              QryArtExistsDB.Close;
+              QryArtExistsDB.Params[0].AsString := NewqryRighe.FieldByName('Arti_Codice').AsString;
+              QryArtExistsDB.Open;
+              if QryArtExistsDB.Eof then begin
+                // Verifico se la Riga di Commessa � legata a un Preventivo Industriale
+                QryComRigExistsPI.Close;
+                QryComRigExistsPI.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+                QryComRigExistsPI.Open;
+                if not QryComRigExistsPI.Eof then begin
+                  // Generazione dell'Ordine di Produzione dal Preventivo Industriale legato alla
+                  // Riga della Commessa
+                  Msg := '';
+
+                  objOPTes.Seek('Id', QryComRigExistsPI.fieldByName('Id').AsInteger);
+                  if objOPTes.Found then begin
+                    // Determinazione del tipo Documento Ordine di Produzione
+                    QryTipiDocOP.Close;
+                    QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
+                                             'WHERE (Tipdoc = ''P'') ' +
+                                             'ORDER BY Tipnum ASC';
+                    try
+                      QryTipiDocOP.Open;
+                    except
+                      on E: Exception do begin
+                        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                               'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
+                        FlagErr := True;
+                        Exit;
+                      end;
+                    end;
+
+                    DecodeDate(DBExec.Data, Year, Month, Day);
+                    // Determinazione del numero
+                    QryNumOP.Close;
+                    QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
+                                         'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
+                                               '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
+                                         'GROUP BY Tipnum';
+                    try
+                      QryNumOP.Open;
+                    except
+                      on E: Exception do begin
+                        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                               'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
+                        FlagErr := True;
+                        Exit;
+                      end;
+                    end;
+
+                    // Generazione Ordine di Produzione da Preventivo Industriale
+                    Msg := GeneraOPdaPI(objOPTes.CampiObj['Id'],
+                                        QryTipiDocOP.FieldByName('Id').AsInteger,
+                                        Year,
+                                        QryNumOP.FieldByName('Numop').AsInteger,
+                                        QryTipiDocOP.FieldByName('Tipnum').AsString,
+                                        (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
+                                         CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString)),
+                                        NewqryRighe.FieldByName('Rif_Id').AsInteger,
+                                        objOrPr);
+                    if Msg <> '' then begin
+                      FlagErr := True;
+                      Exit;
+                    end
+                  end;
+                end
+                else begin
+                  // Segnalazione delle Righe di Commessa per le quali non � possibile generare
+                  // un Ordine di Produzione
+                  ListaIdComRig.Add('Commessa:' +
+                                    NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
+                                    NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
+                                    NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
+                                    'Riga: ' +
+                                    NewqryRighe.FieldByName('Crig_DESCR').AsString);
+                end;
+              end
+              else begin
+                // Generazione dell'Ordine di Produzione dalla Distinta Base con quantit� uguale
+                // alla qta1 della Riga di Commmessa
+                Msg := '';
+
+                // Determinazione del tipo Documento Ordine di Produzione
+                QryTipiDocOP.Close;
+                QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
+                                         'WHERE (Tipdoc = ''P'') ' +
+                                         'ORDER BY Tipnum ASC';
+                try
+                  QryTipiDocOP.Open;
+                except
+                  on E: Exception do begin
+                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                           'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
+                    FlagErr := True;
+                    Exit;
+                  end;
+                end;
+
+                DecodeDate(DBExec.Data, Year, Month, Day);
+                // Determinazione del numero
+                QryNumOP.Close;
+                QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
+                                     'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
+                                           '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
+                                     'GROUP BY Tipnum';
+                try
+                  QryNumOP.Open;
+                except
+                  on E: Exception do begin
+                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                           'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
+                    FlagErr := True;
+                    Exit;
+                  end;
+                end;
+
+                // Generazione della testata dell'OP relativa all'articolo
+                // riportato sulla riga di commessa
+                with objOPTes do begin
+                  Found := False;
+                  CampiObj['Idtipidoc'] := QryTipiDocOP.FieldByName('Id').AsInteger;
+                  CampiObj['TipNum'] := QryTipiDocOP.FieldByName('Tipnum').AsString;
+                  CampiObj['AnnOP'] := Year;
+                  CampiObj['NumOP'] := QryNumOP.FieldByName('Numop').AsInteger;
+                  CampiObj['Stato'] := 'P';
+                  CampiObj['Idartico'] := QryArtExistsDB.FieldByName('Idartico').AsInteger;
+                  CampiObj['Qtaop'] := (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
+                                        CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString));
+                  CampiObj['DatVal'] := DBExec.Data;
+                  CampiObj['DatEmi'] := DBExec.Data;
+                  CampiObj['Idcomrig'] := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+                  CampiObj['CodVarDB'] := NewqryRighe.FieldByName('Vdb_Codice').AsString;
+                  CampiObj['Idallver'] := GetPardef('ALLPF', DBExec.DatabaseName);
+                end; // end with
+
+                if not objOPTes.GeneraOP > 0 then begin
+                  Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un ' +
+                         'errore durante la generazione dell''Ordine di Produzione.';
+                  FlagErr := True;
+                  Exit;
+                end
+              end;
+            end
+            else begin
+              // Segnalazione delle Righe di Commessa per le quali non � possibile generare
+              // un Ordine di Produzione pergh� ha gia un Ordine di Produzione
+              ListaIdComRigOnOP.Add('Commessa:' +
+                                    NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
+                                    NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
+                                    NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
+                                    'Riga: ' +
+                                    NewqryRighe.FieldByName('Crig_DESCR').AsString);
+            end;
+          except
+            on E: Exception do begin
+              Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                     'errore con il database:' + CRLF + E.Message;
+              FlagErr := True;
+              Break;
+            end;
+          end; // end try...except
+        end; // end for
+      finally
+        // Chiusura transazione
+        if NewTran then
+          if not FlagErr then begin
+            DBExec.Commit;
+            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then begin
+              Msg := 'Operazione di generazione Ordini di Produzione completata.';
+              Application.MessageBox(PChar(Msg),
+                                     PChar(Application.Title),
+                                     MB_ICONINFORMATION + MB_OK);
+            end
+            else begin
+              Msg := 'Operazione di generazione Ordini di Produzione non � andata a buon fine ' +
+                     'per alcune righe selezionate.';
+              if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count <> 0) then
+                MsgError(Msg,
+                         'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
+                         ListaIdComRig.Text + CRLF +
+                         'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
+                         ListaIdComRigOnOP.Text)
+              else begin
+                if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count = 0) then
+                  MsgError(Msg,
+                           'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
+                           ListaIdComRig.Text);
+                if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count <> 0) then
+                  MsgError(Msg,
+                           'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
+                           ListaIdComRigOnOP.Text);
+              end;
+            end;
+          end
+          else begin
+            DBExec.Rollback;
+            Msg := 'L''operazione di generazione Ordini di Produzione non � andata a boun fine.' + CRLF + Msg;
+            Application.MessageBox(PChar(Msg),
+                                   PChar(Application.Title),
+                                   MB_ICONERROR + MB_OK);
+          end;
+
+        // Distruzione oggetti Qry
+        if Assigned(QryTipiDocOP) then begin
+          QryTipiDocOP.Close;
+          FreeAndNil(QryTipiDocOP);
+        end;
+
+        if Assigned(QryNumOP) then begin
+          QryNumOP.Close;
+          FreeAndNil(QryNumOP);
+        end;
+
+        if Assigned(QryArtExistsDB) then begin
+          QryArtExistsDB.Close;
+          if QryArtExistsDB.Prepared then
+            QryArtExistsDB.UnPrepare;
+          FreeAndNil(QryArtExistsDB);
+        end;
+
+        if Assigned(QryComRigExistsOP) then begin
+          QryComRigExistsOP.Close;
+          if QryComRigExistsOP.Prepared then
+            QryComRigExistsOP.UnPrepare;
+          FreeAndNil(QryComRigExistsOP);
+        end;
+
+        if Assigned(QryComRigExistsPI) then begin
+          QryComRigExistsPI.Close;
+          if QryComRigExistsPI.Prepared then
+            QryComRigExistsPI.UnPrepare;
+          FreeAndNil(QryComRigExistsPI);
+        end;
+
+      end; // end try...finally
+    end;
+  end
+  else begin
+    Msg := 'Nessuna riga � stata selezionata.';
+    Application.MessageBox(PChar(Msg),
+                           PChar(Application.Title),
+                           MB_ICONINFORMATION + MB_OK);
+  end;
+end;
+
+function TPrevInd.CalcolaCoefConv(ACodArtico: String): Double;
+var
+  tmpUMPrd: TOriUM;
+  QryArtSeek: TCSEQuery;
+begin
+  QryArtSeek := TCSEQuery.Create(nil);
+  QryArtSeek.DataBaseName := DBExec.DataBaseName;
+  try
+    tmpUMPrd := ouI;
+    // Puntamento su Artico
+    QryArtSeek.SQL.Text := 'SELECT ' +
+                             'UMI, UMM, UMV, UMRPro, UMCo1, UMCo2, ' +
+                             'UMRel1, UMRel2, UMRel3, UMRel4 ' +
+                           'FROM Artico WHERE (Codice = ' + CS_VariantTo_SqlStr('ACodArtico') + ')';
+    try
+      QryArtSeek.Open;
+      case (qryArtSeek.FieldByName('UMRPro').AsString + ' ')[1] of
+        'I',' ': tmpUMPrd := ouI;
+        'M'    : tmpUMPrd := ouM;
+        'V'    : tmpUMPrd := ouV;
+      end; // end case
+      Result := ConvUMStd(tmpUMPrd,
+                          ouI,
+                          qryArtSeek.FieldByName('UMI').AsString,
+                          qryArtSeek.FieldByName('UMM').AsString,
+                          qryArtSeek.FieldByName('UMV').AsString,
+                          qryArtSeek.FieldByName('UMRel1').AsString,
+                          qryArtSeek.FieldByName('UMRel2').AsString,
+                          qryArtSeek.FieldByName('UMRel3').AsString,
+                          qryArtSeek.FieldByName('UMRel4').AsString,
+                          qryArtSeek.FieldByName('UMCo1').AsString,
+                          qryArtSeek.FieldByName('UMCo2').AsString);
+    except
+      Result := 1;
+    end;
+  finally
+    if Assigned(qryArtSeek) then begin
+      qryArtSeek.Close;
+      FreeAndNil(qryArtSeek);
+    end;
+  end;
+end;
+
+function TPrevInd.GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
+                               AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): String;
+var
+  Msg: String;
+  tmpOPDT: TCampiOPDT;
+  CampiCauMov: TCauMov;
+  tmpNewDocPrd: Integer;
+  tmpOPTes: TCampiOPTes;
+  NewTran: Boolean;
+  tmpQry, tmpQry1, QryFas: TCSEQuery;
+begin
+  Msg := '';
+
+  NewTran := not DBExec.InTransaction;
+  if NewTran then DBExec.CSStartTransaction;
+
+  tmpQry := TCSEQuery.Create(nil);
+  tmpQry.DatabaseName := DBExec.DatabaseName;
+  tmpQry1 := TCSEQuery.Create(nil);
+  tmpQry1.DatabaseName := DBExec.DatabaseName;
+  QryFas := TCSEQuery.Create(nil);
+  QryFas.DataBaseName := DBExec.DataBaseName;
+
+  tmpOPTes := GetOPTes(DBExec, AIdOPTes);
+  try
+    AobjOrPr.Found := False;
+
+    CampiCauMov := GetCauMov(DBExec, Settings.Caucpi);
+    // OPTes
+    AobjOrPr.CampiOPTes := tmpOPTes;
+    (* SF...26/01/2018 : Conversione 5.00
+    with AobjOrPr.CampiOPTes do
+    begin
+      idTipiDoc := AIdTipiDoc;
+      Tipnum := ATipnum;
+      Annop := AAnnop;
+      Numop := ANumop;
+      Stato := 'P';
+      Opman := False;
+      Qtaop := AQtaOP;
+      Qtacar := 0;
+      Valsch := 0;
+      Totmat := 0;
+      Datcon := 0;
+      Datpre := 0;
+      Dateva := 0;
+      Datric := tmpOPTes.dafiva;
+      if CampiCauMov.Idmagarr <> 0 then
+        IdAllVer := CampiCauMov.Idmagarr
+      else
+        IdAllVer := Settings.Allpf;
+      Idcomrig := AIdComRig;
+      Mdp := False;
+      Mjs := False;
+      Datemi := DBExec.Data;
+      Doctec := False;
+      Docpre := False;
+      Docsdl := False;
+      Verifi := False;
+      OPEvaMod := True;
+    end; // end with
+    *)
+
+    AobjOrPr.SetCampi('idTipiDoc', AIdTipiDoc);
+    AobjOrPr.SetCampi('Tipnum', ATipnum);
+    AobjOrPr.SetCampi('Annop', AAnnop);
+    AobjOrPr.SetCampi('Numop', ANumop);
+    AobjOrPr.SetCampi('Stato', 'P');
+    AobjOrPr.SetCampi('Opman', False);
+    AobjOrPr.SetCampi('Qtaop', AQtaOP);
+    AobjOrPr.SetCampi('Qtacar', 0);
+    AobjOrPr.SetCampi('Valsch', 0);
+    AobjOrPr.SetCampi('Totmat', 0);
+    AobjOrPr.SetCampi('Datcon', 0);
+    AobjOrPr.SetCampi('Datpre', 0);
+    AobjOrPr.SetCampi('Dateva', 0);
+    AobjOrPr.SetCampi('Datric', tmpOPTes.dafiva);
+    if CampiCauMov.Idmagarr <> 0 then
+      AobjOrPr.SetCampi('IdAllVer', CampiCauMov.Idmagarr)
+    else
+      AobjOrPr.SetCampi('IdAllVer', Settings.Allpf);
+    AobjOrPr.SetCampi('Idcomrig', AIdComRig);
+    AobjOrPr.SetCampi('Mdp', False);
+    AobjOrPr.SetCampi('flAttMJS', False);
+    AobjOrPr.SetCampi('Datemi', DBExec.Data);
+    AobjOrPr.SetCampi('Doctec', False);
+    AobjOrPr.SetCampi('Docpre', False);
+    AobjOrPr.SetCampi('Docsdl', False);
+    AobjOrPr.SetCampi('Verifi', False);
+    AobjOrPr.SetCampi('OPEvaMod', True);
+    // ...SF 26/01/2018
+
+    AobjOrPr.OPTesMemoText := GetNota(DBExec, tmpOPTes.idnote);
+    AobjOrPr.OPTesDocFiles := GetNota(DBExec, tmpOPTes.iddoc);
+    tmpNewDocPrd := AobjOrPr.Insert;
+    if tmpNewDocPrd = -1 then begin
+      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+             'nell''inserimento della testata dell''Ordine di Produzione.';
+      Exit;
+    end;
+
+    // OPLotF
+    if Msg = '' then
+      if not AobjOrPr.GeneraOPLotF(tmpNewDocPrd) then begin
+        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+               'nella generazione lotti.';
+        Exit;
+      end;
+
+    // OPDT
+    if Msg = '' then begin
+      //EB...28/04/2003
+      tmpQry1.Close;
+      tmpQry1.SQL.Text := 'SELECT Id FROM OPDT ' +
+                          'WHERE (Idoptes = :IdOpTes) AND ' +
+                                '(Sequen = :Sequen)';
+      if tmpQry1.prepared then
+        tmpQry1.unPrepare;
+      tmpQry1.prepare;
+      //...EB
+
+      tmpQry.SQL.Text := 'SELECT ' +
+                           'Id, Sequen, Livello, Idpadre, Idartico, Idlink, ' +
+                           'Qtimco, Tipord, Riferi, Note, Codvardb, Idnote, CCCRea ' +
+                         'FROM OPDT ' +
+                         'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + ') ' +
+                         'ORDER BY Sequen';
+      tmpQry.Open;
+      while not tmpQry.Eof do begin
+        tmpOPDT := GetOPDT(DBExec, tmpQry.FieldByName('Idpadre').AsInteger);
+        tmpQry1.Close;
+        tmpQry1.Params[0].asInteger := tmpNewDocPrd;
+        tmpQry1.Params[1].asInteger := tmpOPDT.Sequen;
+        tmpQry1.Open;
+        AobjOrPr.FoundDT := False;
+        (* SF...26/01/2018 : Conversione 5.00
+        with AobjOrPr.CampiOPDT do begin
+          idoptes := tmpNewDocPrd;
+          sequen := tmpQry.FieldByName('Sequen').AsInteger;
+          livello := tmpQry.FieldByName('Livello').AsInteger;
+          idpadre := tmpQry1.FieldByName('Id').AsInteger;
+          if tmpQry.FieldByName('Livello').AsInteger = 0 then
+            idartico := tmpOPTes.idartico
+          else
+            idartico := tmpQry.FieldByName('Idartico').AsInteger;
+          idlink := tmpQry.FieldByName('Idlink').AsInteger;
+          qtimco := tmpQry.FieldByName('Qtimco').AsFloat;
+          tipord := tmpQry.FieldByName('Tipord').AsString;
+          riferi := tmpQry.FieldByName('Riferi').AsString;
+          note := tmpQry.FieldByName('Note').AsString;
+          codvardb:= tmpQry.FieldByName('Codvardb').AsString;
+          CCCRea := tmpQry.FieldByName('CCCRea').asInteger;
+        end;  // with
+        *)
+
+        AobjOrPr.SetCampiOPDT('idoptes', tmpNewDocPrd);
+        AobjOrPr.SetCampiOPDT('sequen',  tmpQry.FieldByName('Sequen').AsInteger);
+        AobjOrPr.SetCampiOPDT('livello', tmpQry.FieldByName('Livello').AsInteger);
+        AobjOrPr.SetCampiOPDT('idpadre', tmpQry1.FieldByName('Id').AsInteger);
+        if tmpQry.FieldByName('Livello').AsInteger = 0 then
+          AobjOrPr.SetCampiOPDT('idartico', tmpOPTes.idartico)
+        else
+          AobjOrPr.SetCampiOPDT('idartico', tmpQry.FieldByName('Idartico').AsInteger);
+        AobjOrPr.SetCampiOPDT('idlink',   tmpQry.FieldByName('Idlink').AsInteger);
+        AobjOrPr.SetCampiOPDT('qtimco',   tmpQry.FieldByName('Qtimco').AsFloat);
+        AobjOrPr.SetCampiOPDT('tipord',   tmpQry.FieldByName('Tipord').AsString);
+        AobjOrPr.SetCampiOPDT('riferi',   tmpQry.FieldByName('Riferi').AsString);
+        AobjOrPr.SetCampiOPDT('note',     tmpQry.FieldByName('Note').AsString);
+        AobjOrPr.SetCampiOPDT('codvardb', tmpQry.FieldByName('Codvardb').AsString);
+        AobjOrPr.SetCampiOPDT('CCCRea',   tmpQry.FieldByName('CCCRea').asInteger);
+        // ...SF 26/01/2018
+
+        tmpQry1.Close;
+        if AobjOrPr.InsertDT = -1 then begin
+          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+                 'nell''inserimento della Distinta Tecnica.';
+          Break;
+        end;
+        tmpQry.Next;
+      end; // end while
+      tmpQry.Close;
+      if Msg <> '' then
+        Exit;
+    end; // if
+
+    // OPDP
+    if Msg = '' then begin
+      tmpQry.SQL.Text := 'INSERT INTO OPDP (Idoptes, Datpre, Idartico, ' +
+                         'Idallmag, Qtimco, Qtarpr, Qtaman, Qtapre, Note, ' +
+                         'Tipord, Cosuni, Tipcos, CCCRea) ' +
+                         '(SELECT ' + CS_KeyValueTo_SqlStr(tmpNewDocPrd) + ', 0, Idartico, ' +
+                          'Idallmag, Qtimco, 0, 0, 0, Note, Tipord, Cosuni, Tipcos, CCCRea ' +
+                          'FROM Opdp ' +
+                          'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + '))';
+      try
+        tmpQry.ExecSQL;
+      except
+        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+               'nell''inserimento della Distinta di Prelievo.';
+        Exit;
+      end; // end try...except
+    end; // if
+
+    // OPSdlMat
+    if Msg = '' then begin
+      QryFas.SQL.Text := 'SELECT ' +
+                           'Id, Idoptes, Idopsdlmat, Sequen, Idlav, ' +
+                           'Fltrasf, Idtiplav, Attrezzo, Iddipend, Idstslav, ' +
+                           'Cosuni, Cosunima, Cossch, Temavv, Avvsch, Temese, ' +
+                           'Esesch, Totsch, Prdora, Prdott, Micatt, Macatt, ' +
+                           'Tematt, Fruomo, Sovfas, Datcar, Datsca, Note, ' +
+                           'Idinfosl, Iddoc, Idricila ' +
+                         'FROM Opsdlfas ' +
+                         'WHERE (Idopsdlmat = :Idopsdlmat)';
+      QryFas.Prepare;
+
+      tmpQry.SQL.Text := 'SELECT ' +
+                           'Id, Idopdt, Idartico, Sequen, Cosavv, Coslav, ' +
+                           'Coscic, Tipcos, Lticic, Tiptem, Qtimco, Note ' +
+                         'FROM Opsdlmat ' +
+                         'WHERE (Idoptes = ' + IntToStr(tmpOPTes.id) + ') ' +
+                         'ORDER BY Sequen';
+
+      tmpQry.Open;
+      while not tmpQry.Eof do begin
+        tmpOPDT := GetOPDT(DBExec, tmpQry.FieldByName('Idopdt').AsInteger);
+        tmpQry1.Close;
+        tmpQry1.Params[0].asInteger := tmpNewDocPrd;
+        tmpQry1.Params[1].asInteger := tmpOPDT.Sequen;
+        tmpQry1.Open;
+        AobjOrPr.FoundSdlM := False;
+        (* SF...26/01/2018 : Conversione 5.00
+        with AobjOrPr.CampiOPSdlM do begin
+          idoptes := tmpNewDocPrd;
+          idopdt := tmpQry1.FieldByName('Id').AsInteger;
+          idartico := tmpOPTes.Idartico;
+          sequen := tmpQry.FieldByName('Sequen').AsInteger;
+          cosavv := tmpQry.FieldByName('Cosavv').AsFloat;
+          coslav := tmpQry.FieldByName('Coslav').AsFloat;
+          coscic := tmpQry.FieldByName('Coscic').AsFloat;
+          tipcos := tmpQry.FieldByName('Tipcos').AsString;
+          lticic := tmpQry.FieldByName('Lticic').AsFloat;
+          tiptem := tmpQry.FieldByName('Tiptem').AsString;
+          cossch := ZERO;
+          qtimco := tmpQry.FieldByName('Qtimco').AsFloat;
+          completo := False;
+          note := tmpQry.FieldByName('Note').AsString;
+        end; // end with
+        *)
+
+        AobjOrPr.SetCampiSdlM('idoptes', tmpNewDocPrd);
+        AobjOrPr.SetCampiSdlM('idopdt',  tmpQry1.FieldByName('Id').AsInteger);
+        AobjOrPr.SetCampiSdlM('idartico',tmpOPTes.Idartico);
+        AobjOrPr.SetCampiSdlM('sequen',  tmpQry.FieldByName('Sequen').AsInteger);
+        AobjOrPr.SetCampiSdlM('cosavv',  tmpQry.FieldByName('Cosavv').AsFloat);
+        AobjOrPr.SetCampiSdlM('coslav',  tmpQry.FieldByName('Coslav').AsFloat);
+        AobjOrPr.SetCampiSdlM('coscic',  tmpQry.FieldByName('Coscic').AsFloat);
+        AobjOrPr.SetCampiSdlM('tipcos',  tmpQry.FieldByName('Tipcos').AsString);
+        AobjOrPr.SetCampiSdlM('lticic',  tmpQry.FieldByName('Lticic').AsFloat);
+        AobjOrPr.SetCampiSdlM('tiptem',  tmpQry.FieldByName('Tiptem').AsString);
+        AobjOrPr.SetCampiSdlM('cossch',  ZERO);
+        AobjOrPr.SetCampiSdlM('qtimco',  tmpQry.FieldByName('Qtimco').AsFloat);
+        AobjOrPr.SetCampiSdlM('completo',False);
+        AobjOrPr.SetCampiSdlM('note',    tmpQry.FieldByName('Note').AsString);
+        // ...SF 26/01/2018
+
+        tmpQry1.Close;
+        if AobjOrPr.InsertSdlM = -1 then begin
+          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+                 'nell''inserimento della Scheda di Lavorazione Materiali.';
+          Break;
+        end
+        else begin
+          // OPSdlFas
+          QryFas.Close;
+          QryFas.Params[0].asInteger := tmpQry.FieldByName('id').asInteger;
+          QryFas.Open;
+          while not QryFas.Eof do begin
+            AobjOrPr.FoundSdlF := False;
+            AobjOrPr.OPSdlFMemoText := GetNota(DBExec, QryFas.FieldByName('idinfosl').AsInteger);
+            AobjOrPr.OPSdlFDocFiles := GetNota(DBExec, QryFas.FieldByName('iddoc').AsInteger);
+
+           (* SF...26/01/2018 : Conversione 5.00
+            with AobjOrPr.CampiOPSdlF do begin
+              idoptes := tmpNewDocPrd;
+              idopsdlmat := AobjOrPr.CampiOPSdlM.id;
+              sequen := QryFas.FieldByName('Sequen').AsInteger;
+              idlav := QryFas.FieldByName('Idlav').AsInteger;
+              idRiCiLa := QryFas.FieldByName('Idricila').asInteger;
+              fltrasf := (QryFas.FieldByName('Fltrasf').AsInteger = -1);
+              idtiplav := QryFas.FieldByName('Idtiplav').AsInteger;
+              attrezzo := QryFas.FieldByName('Attrezzo').AsString;
+              iddipend := QryFas.FieldByName('Iddipend').AsInteger;
+              idstslav := QryFas.FieldByName('Idstslav').AsInteger;
+              cosuni := QryFas.FieldByName('Cosuni').AsFloat;
+              cosuniMA := QryFas.FieldByName('Cosunima').AsFloat;
+              cossch := ZERO;
+              temavv := QryFas.FieldByName('Temavv').AsFloat;
+              avvsch := ZERO;
+              temese := QryFas.FieldByName('Temese').AsFloat;
+              esesch := ZERO;
+              totsch := ZERO;
+              prdora := QryFas.FieldByName('Prdora').AsFloat;
+              prdott := QryFas.FieldByName('Prdott').AsFloat;
+              micatt := QryFas.FieldByName('Micatt').AsFloat;
+              macatt := QryFas.FieldByName('Macatt').AsFloat;
+              tematt := QryFas.FieldByName('Tematt').AsFloat;
+              fruomo := QryFas.FieldByName('Fruomo').AsFloat;
+              sovfas := QryFas.FieldByName('Sovfas').AsFloat;
+              datcar := 0;
+              datsca := 0;
+              note := QryFas.FieldByName('Note').AsString;
+              idinfosl := 0;
+              iddoc := 0;
+            end; //  end with
+            *)
+
+            AobjOrPr.SetCampiSdlF('idoptes',   tmpNewDocPrd);
+            AobjOrPr.SetCampiSdlF('idopsdlmat',AobjOrPr.CampiOPSdlM.id);
+            AobjOrPr.SetCampiSdlF('sequen',    QryFas.FieldByName('Sequen').AsInteger);
+            AobjOrPr.SetCampiSdlF('idlav',     QryFas.FieldByName('Idlav').AsInteger);
+            AobjOrPr.SetCampiSdlF('idRiCiLa',  QryFas.FieldByName('Idricila').asInteger);
+            AobjOrPr.SetCampiSdlF('fltrasf',   (QryFas.FieldByName('Fltrasf').AsInteger = -1));
+            AobjOrPr.SetCampiSdlF('idtiplav',  QryFas.FieldByName('Idtiplav').AsInteger);
+            AobjOrPr.SetCampiSdlF('attrezzo',  QryFas.FieldByName('Attrezzo').AsString);
+            AobjOrPr.SetCampiSdlF('iddipend',  QryFas.FieldByName('Iddipend').AsInteger);
+            AobjOrPr.SetCampiSdlF('idstslav',  QryFas.FieldByName('Idstslav').AsInteger);
+            AobjOrPr.SetCampiSdlF('cosuni',    QryFas.FieldByName('Cosuni').AsFloat);
+            AobjOrPr.SetCampiSdlF('cosuniMA',  QryFas.FieldByName('Cosunima').AsFloat);
+            AobjOrPr.SetCampiSdlF('cossch',    ZERO);
+            AobjOrPr.SetCampiSdlF('temavv',    QryFas.FieldByName('Temavv').AsFloat);
+            AobjOrPr.SetCampiSdlF('avvsch',    ZERO);
+            AobjOrPr.SetCampiSdlF('temese',    QryFas.FieldByName('Temese').AsFloat);
+            AobjOrPr.SetCampiSdlF('esesch',    ZERO);
+            AobjOrPr.SetCampiSdlF('totsch',    ZERO);
+            AobjOrPr.SetCampiSdlF('prdora',    QryFas.FieldByName('Prdora').AsFloat);
+            AobjOrPr.SetCampiSdlF('prdott',    QryFas.FieldByName('Prdott').AsFloat);
+            AobjOrPr.SetCampiSdlF('micatt',    QryFas.FieldByName('Micatt').AsFloat);
+            AobjOrPr.SetCampiSdlF('macatt',    QryFas.FieldByName('Macatt').AsFloat);
+            AobjOrPr.SetCampiSdlF('tematt',    QryFas.FieldByName('Tematt').AsFloat);
+            AobjOrPr.SetCampiSdlF('fruomo',    QryFas.FieldByName('Fruomo').AsFloat);
+            AobjOrPr.SetCampiSdlF('sovfas',    QryFas.FieldByName('Sovfas').AsFloat);
+            AobjOrPr.SetCampiSdlF('datcar',    0);
+            AobjOrPr.SetCampiSdlF('datsca',    0);
+            AobjOrPr.SetCampiSdlF('note',      QryFas.FieldByName('Note').AsString);
+            AobjOrPr.SetCampiSdlF('idinfosl',  0);
+            AobjOrPr.SetCampiSdlF('iddoc',     0);
+            // ...SF 26/01/2018
+
+            if AobjOrPr.InsertSdlF = -1 then begin
+              Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+                     'nell''inserimento della Scheda di Lavorazione Fase.';
+              Break;
+            end;  // if
+            QryFas.Next;
+          end; // end while
+          if Msg <> '' then
+            Break;
+        end;  // if ... else ...
+        tmpQry.Next;
+      end; // end while
+      if Msg <> '' then
+        Exit;
+    end; // if
+
+    // Nel caso di generazione OP da PI, ricalcolo i costi teorici.
+    if Msg = '' then
+      if not AobjOrPr.RicValTeo(tmpNewDocPrd) then begin
+        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+               'nel Ricalcolo dei costi teorici.';
+        Exit;
+      end; // if
+
+  finally
+    if Assigned(tmpQry) then begin
+      tmpQry.Close;
+      FreeAndNil(tmpQry);
+    end;
+
+    if Assigned(tmpQry1) then begin
+      tmpQry1.Close;
+      tmpQry1.UnPrepare;
+      FreeAndNil(tmpQry1);
+    end;
+
+    if Assigned(QryFas) then begin
+      QryFas.Close;
+      QryFas.UnPrepare;
+      FreeAndNil(QryFas);
+    end;
+
+    // Ciusura della transazione
+    if NewTran then
+      if Msg = '' then
+        DBExec.Commit
+      else begin
+        DBExec.RollBack;
+        Result := Msg;
+      end
+    else
+      Result := Msg;
+  end; // end try...finally
+end;
+
+initialization
+  // Identificativo modulo
+  CSW___BPL_Identity :='PI_Altag_PrevInd';
+
+  if (CfgSAMFile.SectionExists('PI_Altag_PrevInd')) then
+  begin
+    if Inside( CfgSamFile.ReadString('PI_Altag_PrevInd', 'Utenti', ''), IntToStr(Utente.Id) ) then
+    begin
+      RegisterPlugIn('PI_Altag_PrevInd', TPrevInd);
+    end;
+  end;
+
+finalization
+  UnRegisterPlugIn('PI_Altag_PrevInd');
+end.
diff --git a/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dpk b/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dpk
new file mode 100644
index 0000000..81f3382
--- /dev/null
+++ b/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dpk
@@ -0,0 +1,83 @@
+{
+altag.cfg
+[ssPrevInd]
+DiametroMin=12
+;IDlav=1
+IDlav=249
+IDCAMOVBV=97,53
+IDCAMOVBL=99,55
+IDCAMOVMV=98,54
+IDCAMOVML=0,0
+
+[PrevInd]
+DiametroMin=12
+IDlav=2
+; Id degli utenti abilitati
+UtentiAbilitati=64
+;   IDCAUMOV,IDTIPIDOC     
+IDCAMOVBV=102,53
+IDCAMOVBL=104,59
+IDCAMOVMV=103,58
+IDCAMOVML=105,60
+
+extfun.ini
+[FrmComTes]
+AutoRun=PI_Altag_PrevInd.PlugIn_PrevInd
+[FrmIntCom]
+BUTTONS=PI_Altag_PrevInd.GenerazioneOP
+[PI_Altag_PrevInd]
+cap_GenerazioneOP=Genera O.P.
+
+sam.cfg
+[Moduli]
+PI_Altag_PrevInd=PlugIn Creazione Preventivi Industriali
+
+
+
+
+
+
+
+
+}
+
+package pi_Altag_PrevInd;
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
+{$DESCRIPTION 'Plugin Preventivi Industriali'}
+{$RUNONLY}
+{$IMPLICITBUILD OFF}
+
+requires
+  M_Prd;
+
+contains
+  UPrevInd in 'UPrevInd.pas',
+  FPrevInd in 'FPrevInd.pas' {FrmPrevInd},
+  Oext_pialtatg in 'Oext_pialtatg.pas';
+
+  {$SetPEFlags $0800}
+end.
diff --git a/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj b/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj
new file mode 100644
index 0000000..3ffa40b
--- /dev/null
+++ b/source/pi_Altag_PrevInd/pi_Altag_PrevInd.dproj
@@ -0,0 +1,244 @@
+﻿<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
+    <PropertyGroup>
+        <ProjectGuid>{cf861f10-20b7-477e-975f-28aad8d01242}</ProjectGuid>
+        <MainSource>pi_Altag_PrevInd.dpk</MainSource>
+        <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
+        <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
+        <DCC_DependencyCheckOutputName>C:\outsamw2\pi_Altag_PrevInd.bpl</DCC_DependencyCheckOutputName>
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
+        <VerInfo_Build>71</VerInfo_Build>
+        <DCC_WriteableConstants>true</DCC_WriteableConstants>
+        <DCC_Namespace>System;Xml;Data;Datasnap;Web;Soap;$(DCC_Namespace)</DCC_Namespace>
+        <DCC_ImageBase>00400000</DCC_ImageBase>
+        <VerInfo_IncludeVerInfo>True</VerInfo_IncludeVerInfo>
+        <RuntimeOnlyPackage>true</RuntimeOnlyPackage>
+        <GenPackage>true</GenPackage>
+        <DCC_Description>Plugin Preventivi Industriali</DCC_Description>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali;FileVersion=5.0.0.71;InternalName=pi_Altag_PrevInd;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=pi_Altag_PrevInd.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <GenDll>true</GenDll>
+        <DCC_RangeChecking>true</DCC_RangeChecking>
+        <VerInfo_Locale>1040</VerInfo_Locale>
+        <DCC_GenerateStackFrames>true</DCC_GenerateStackFrames>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_Win32)'!=''">
+        <Debugger_HostApplication>C:\OutSamW2\SAM.exe</Debugger_HostApplication>
+        <DCC_Namespace>Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;$(DCC_Namespace)</DCC_Namespace>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - x64;FileVersion=5.0.0.71;InternalName=pi_Altag_PrevInd;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=pi_Altag_PrevInd.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Plugin Preventivi Industriali - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali;FileVersion=5.0.0.70;InternalName=pi_Altag_PrevInd;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=pi_Altag_PrevInd.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <VerInfo_Build>70</VerInfo_Build>
+        <Version>7.0</Version>
+        <DCC_DebugInformation>False</DCC_DebugInformation>
+        <DCC_WriteableConstants>True</DCC_WriteableConstants>
+        <DCC_LocalDebugSymbols>False</DCC_LocalDebugSymbols>
+        <DCC_Optimize>False</DCC_Optimize>
+        <DCC_IntegerOverflowCheck>True</DCC_IntegerOverflowCheck>
+        <DCC_RangeChecking>True</DCC_RangeChecking>
+        <DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
+        <DCC_DcuOutput>c:\outsamw2\dcu</DCC_DcuOutput>
+        <DCC_ObjOutput>c:\outsamw2\dcu</DCC_ObjOutput>
+        <DCC_HppOutput>c:\outsamw2\dcu</DCC_HppOutput>
+        <DCC_BplOutput>C:\outsamw2</DCC_BplOutput>
+        <DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
+        <DCC_OutputDRCFile>true</DCC_OutputDRCFile>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - x64;FileVersion=5.0.0.71;InternalName=pi_Altag_PrevInd;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=pi_Altag_PrevInd.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Plugin Preventivi Industriali - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2)'!=''">
+        <VerInfo_Debug>True</VerInfo_Debug>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - Debug;FileVersion=5.0.0.71;InternalName=pi_Altag_PrevInd;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=pi_Altag_PrevInd.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Plugin Preventivi Industriali - Debug</DCC_Description>
+        <Version>7.0</Version>
+        <DCC_WriteableConstants>True</DCC_WriteableConstants>
+        <DCC_DcuOutput>c:\outsamw2\dcu</DCC_DcuOutput>
+        <DCC_ObjOutput>c:\outsamw2\dcu</DCC_ObjOutput>
+        <DCC_HppOutput>c:\outsamw2\dcu</DCC_HppOutput>
+        <DCC_BplOutput>C:\outsamw2</DCC_BplOutput>
+        <DCC_Optimize>False</DCC_Optimize>
+        <DCC_GenerateStackFrames>True</DCC_GenerateStackFrames>
+        <DCC_RangeChecking>True</DCC_RangeChecking>
+        <DCC_IntegerOverflowCheck>True</DCC_IntegerOverflowCheck>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win32)'!=''">
+        <DCC_Description>Plugin Preventivi Industriali</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - Debug - x64;FileVersion=5.0.0.71;InternalName=pi_Altag_PrevInd;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=pi_Altag_PrevInd.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Plugin Preventivi Industriali - Debug - x64</DCC_Description>
+    </PropertyGroup>
+    <ProjectExtensions>
+        <Borland.Personality>Delphi.Personality.12</Borland.Personality>
+        <Borland.ProjectType>Package</Borland.ProjectType>
+        <BorlandProject>
+            <Delphi.Personality>
+                <Parameters>
+                    <Parameters Name="HostApplication">C:\OutSamW2\SAM.exe</Parameters>
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
+                    <VersionInfo Name="Build">71</VersionInfo>
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
+                    <VersionInfoKeys Name="FileDescription">Plugin Preventivi Industriali</VersionInfoKeys>
+                    <VersionInfoKeys Name="FileVersion">4.2.0.71</VersionInfoKeys>
+                    <VersionInfoKeys Name="InternalName">pi_Altag_PrevInd</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalCopyright">Centro Software srl</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalTrademarks"/>
+                    <VersionInfoKeys Name="OriginalFilename">pi_Altag_PrevInd.dproj</VersionInfoKeys>
+                    <VersionInfoKeys Name="ProductName"/>
+                    <VersionInfoKeys Name="ProductVersion"/>
+                    <VersionInfoKeys Name="Comments">Cavallini Vittorio</VersionInfoKeys>
+                </VersionInfoKeys>
+                <Source>
+                    <Source Name="MainSource">pi_Altag_PrevInd.dpk</Source>
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
+        <DCCReference Include="M_Prd.dcp"/>
+        <DCCReference Include="UPrevInd.pas"/>
+        <DCCReference Include="FPrevInd.pas">
+            <Form>FrmPrevInd</Form>
+        </DCCReference>
+        <DCCReference Include="Oext_pialtatg.pas"/>
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
```
