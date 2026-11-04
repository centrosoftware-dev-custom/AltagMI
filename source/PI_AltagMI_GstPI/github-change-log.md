# GitHub Change Log

## Plug-In
- Nome: `PI_Altag_GstPI`
- Percorso locale: `C:\plugin_new\Altag\source\PI_Altag_GstPI`
- Repository: `Altag`
- Branch: `all refs`
- Data estrazione: `2026-10-01T18:27:00.581285+00:00`

## Riepilogo
- Commit analizzati: `7`
- V500: `0`
- V600: `0`
- Misti: `6`
- Conversioni V500 -> V600: `1`

## Commit di conversione V500 -> V600
| Commit | Data | Autore | Sintesi | Evidenze |
|---|---|---|---|---|
| `029c786e2f30` | 2024-10-08T13:01:26+02:00 | Luca Tolomelli | spostamento in directory source e aggiunta README e gitignore | tcsequery, imageindex |

## Tutti i commit
### `9b82ea25807da9124369f2f8ce56a5116e4c55cb` - RI 54455 - GstPI - modifiche post collaudo
- Data: `2025-03-21T12:20:41+01:00`
- Autore: `Iliass Kharbouchi`
- Classificazione prima: `Mista`
- Classificazione dopo: `Mista`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstPI/PI_Altag_GstPI.dproj, source/PI_Altag_GstPI/UGstPI.pas`
- Indicatori V500: `dbexec, rnote, getnota, memotext, glyphlibraryindex, loadsammodule`
- Indicatori V600: `tcsequery`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj b/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
index 3f943ad..810a6fe 100644
--- a/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
+++ b/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
@@ -196,15 +196,15 @@
                     <Source Name="MainSource">PI_Altag_GstPI.dpk</Source>
                 </Source>
                 <Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\tmsdedxe3.bpl">TMS Component Pack design time support</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxPScxCommonRS17.bpl">ExpressPrinting System Cross Platform Library by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxPSLnksRS17.bpl">ExpressPrinting System ReportLinks (Standard) by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\DclTeeMaker117.bpl">TeeMaker</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\DM_BI.bpl">File $(SAMDIROUT)\DM_BI.bpl not found</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxmdsRS17.bpl">ExpressMemData by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\dclcxEditorFieldLinkRS17.bpl">ExpressEditors FieldLink by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\dcldxLayoutControlRS17.bpl">ExpressLayout Control by Developer Express Inc.</Excluded_Packages>
-                    <Excluded_Packages Name="$(SAMDIROUT)\DCSGantt.bpl">.CS GantTime Package DT - Debug</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\tmsdedxe3.bpl">TMS Component Pack design time support</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxPScxCommonRS17.bpl">ExpressPrinting System Cross Platform Library by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxPSLnksRS17.bpl">ExpressPrinting System ReportLinks (Standard) by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\DclTeeMaker117.bpl">TeeMaker</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\DM_BI.bpl">File $(SAMDIROUT)\DM_BI.bpl not found</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxmdsRS17.bpl">ExpressMemData by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dclcxEditorFieldLinkRS17.bpl">ExpressEditors FieldLink by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\dcldxLayoutControlRS17.bpl">ExpressLayout Control by Developer Express Inc.</Excluded_Packages>
+                    <Excluded_Packages Name="C:\OutSamW2\DCSGantt.bpl">.CS GantTime Package DT - Debug</Excluded_Packages>
                     <Excluded_Packages Name="$(BDSBIN)\dcloffice2k170.bpl">Microsoft Office 2000 Sample Automation Server Wrapper Components</Excluded_Packages>
                     <Excluded_Packages Name="$(BDSBIN)\dclofficexp170.bpl">Microsoft Office XP Sample Automation Server Wrapper Components</Excluded_Packages>
                 </Excluded_Packages>
diff --git a/source/PI_Altag_GstPI/UGstPI.pas b/source/PI_Altag_GstPI/UGstPI.pas
index 92a0ea6..4902b70 100644
--- a/source/PI_Altag_GstPI/UGstPI.pas
+++ b/source/PI_Altag_GstPI/UGstPI.pas
@@ -45,6 +45,7 @@ type
 //
 //  Funzioni e/o procedure
 //
+
     function CalcolaCoefConv(ACodArtico: string): Double;
     function GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: string; AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): string;
   published
@@ -53,21 +54,21 @@ type
     property OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
     property OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
     property OEdbgrRigheRefreshData: TNotifyEvent read FOEdbgrRigheRefreshData write FOEdbgrRigheRefreshData;
-    procedure BTN_OpenPrevInd(Sender: TObject); // IK 07/03/2025 RI:54455
-    procedure PlugIn_PrevInd;
-    function BTN_PrevInd(Sender: TObject): Integer;
-    procedure PIClickbtnPrevInd(Sender: TObject);   //  cv dalla 2.18 lo vogliono come bottone indipendente
+    procedure BTN_OpenPrevInd(Sender: TObject); { BUTTONS - Frmcomtes AND FrmOfferte } // IK 07/03/2025 RI:54455
+    procedure PlugIn_PrevInd;  { Init - Frmcomtes AND FrmOfferte }
+    function BTN_PrevInd(Sender: TObject): Integer; { BUTTONS - Frmcomtes AND FrmOfferte }
+    procedure PIClickbtnPrevInd(Sender: TObject); { BUTTONS - Frmcomtes AND FrmOfferte } //  cv dalla 2.18 lo vogliono come bottone indipendente
     procedure PIExitedtPrezzo(Sender: TObject);
     procedure PIChangecbxRiferi1(Sender: TObject);
     procedure PIChangePageControl(Sender: TObject);
     procedure PIdbgrRigheRefreshData(Sender: Tobject);
 
-    procedure GenerazioneOP;
+    procedure GenerazioneOP; { BUTTONS - FrmIntCom }
 //
 //  M.B. 22-04-2011 RI:10242
 //
-    procedure AttivaPluginPIDT;
-    procedure AttivaPluginPIOV;
+    procedure AttivaPluginPIDT;  { Init FrmPIDT }
+    procedure AttivaPluginPIOV;  { Init FrmIntCom }
     procedure btnTaglioDTOnClick(Sender: TObject);
     procedure btnTaglioOVOnClick(Sender: TObject);
     procedure CreaPrevInd(iIdComRig: Integer);
@@ -101,6 +102,7 @@ uses
   UCoreDB,
   IVendite,
   S3Db,
+  MsgCore,
   FIntCom;
 
 // -----------------------------------------------------------------------------
@@ -124,15 +126,13 @@ end;
 //  M.B. 22-04-2011 RI:10242
 //  Attivazione plug-in dalla griglia distinte tecnica preventivo industriale
 // -----------------------------------------------------------------------------
-
 procedure TGstPI.AttivaPluginPIDT;
 var
   PnlSpeedBar: TCSToolBar;
   btn: TCSToolBarButton;
 begin
-//
-// Metto il bottone
-//
+  { Metto il bottone }
+
   GetFormComp('ToolBar1', PnlSpeedBar);
   if (Assigned(PnlSpeedBar)) then
   begin
@@ -184,6 +184,7 @@ begin
   RedirEvent('dbgrRighe', 'OnBeforeRefreshData', 'OEdbgrRigheRefreshData', 'PIdbgrRigheRefreshData');
 //  TFrmIntCom(Owner.Owner).dbgrRighe.RefreshData();
 end;
+
 //  ----------------------------------------------------------------------------
 //  Refresh griglia distinta base
 //  ----------------------------------------------------------------------------
@@ -912,45 +913,48 @@ begin
 end;
 
 procedure TGstPI.BTN_OpenPrevInd(Sender: TObject);
-var
-  FrmPIDT: IFrmPrdStd;
-  LQry: TCSEQuery;
-  LSqlQry, LMsgErr: string;
+//var
+//  FrmPIDT: IFrmPrdStd;
+//  LQry: TCSEQuery;
+//  LSqlQry, LMsgErr: string;
 begin
-  LQry := TCSEQuery.Create(nil);
-  try
-    LQry.DatabaseName := DBExec.DatabaseName;
-
-    LSqlQry := ''
-      + ' select o.id '
-      + ' from optes o '
-      + ' inner join tipidoc td on o.idtipidoc=td.id '
-      + ' where td.tipdoc=''D'' '
-      + ' and o.idcomrig=' + CS_VariantTo_SqlStr(PropValueVar['IdRiga']);
-
-    LMsgErr := CS_OpenQry(LSqlQry, LQry);
+  if Assigned(OEClickbtnPrevInd) then
+    OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
 
-    if LMsgErr <> '' then
-      raise Exception.Create(LMsgErr);
-
-    if not LQry.Eof then
-    begin
-      if LQry.FieldByName('ID').AsInteger > 0 then
-      begin
-        if (not LoadSamModule(ModuloPrd)) then
-          Exit;
-
-        // Faccio vedere il preventivo se ho l'autorizzazione
-        FrmPIDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', LQry.FieldByName('ID').AsInteger, liAll) as IFrmPrdStd;
-
-        if (Assigned(FrmPIDT)) then
-          FrmPIDT.Show;
-      end;
-    end;
-  finally
-    LQry.Close;
-    FreeAndNil(LQry);
-  end;
+//  LQry := TCSEQuery.Create(nil);
+//  try
+//    LQry.DatabaseName := DBExec.DatabaseName;
+//
+//    LSqlQry := ''
+//      + ' select o.id '
+//      + ' from optes o '
+//      + ' inner join tipidoc td on o.idtipidoc=td.id '
+//      + ' where td.tipdoc=''D'' '
+//      + ' and o.idcomrig=' + CS_VariantTo_SqlStr(PropValueVar['IdRiga']);
+//
+//    LMsgErr := CS_OpenQry(LSqlQry, LQry);
+//
+//    if LMsgErr <> '' then
+//      raise Exception.Create(LMsgErr);
+//
+////    if not LQry.Eof then
+////    begin
+////      if LQry.FieldByName('ID').AsInteger > 0 then
+////      begin
+//    if (not LoadSamModule(ModuloPrd)) then
+//      Exit;
+//
+//    // Faccio vedere il preventivo se ho l'autorizzazione
+//    FrmPIDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', LQry.FieldByName('ID').AsInteger, liAll) as IFrmPrdStd;
+//
+//    if (Assigned(FrmPIDT)) then
+//      FrmPIDT.Show;
+////      end;
+////    end;
+//  finally
+//    LQry.Close;
+//    FreeAndNil(LQry);
+//  end;
 end;
 
 function TGstPI.BTN_PrevInd(Sender: TObject): Integer;
```

### `6668d2a5b12fb6a508b7cd196bc734fce22a9609` - RI54455 - GstPI - Modifica funzionamento Bottone preventivi Altag
- Data: `2025-03-07T12:53:15+01:00`
- Autore: `Iliass Kharbouchi`
- Classificazione prima: `Mista`
- Classificazione dopo: `Mista`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstPI/FGstPI.dfm, source/PI_Altag_GstPI/FGstPI.pas, source/PI_Altag_GstPI/OGstPI.pas, source/PI_Altag_GstPI/PI_Altag_GstPI.dpk, source/PI_Altag_GstPI/UGstPI.pas`
- Indicatori V500: `dbexec, rnote, getnota, memotext, glyphlibraryindex, oledb, loadsammodule`
- Indicatori V600: `tcsequery, imageindex`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstPI/FGstPI.dfm b/source/PI_Altag_GstPI/FGstPI.dfm
index 58fd196..e46b2b3 100644
--- a/source/PI_Altag_GstPI/FGstPI.dfm
+++ b/source/PI_Altag_GstPI/FGstPI.dfm
@@ -540,6 +540,10 @@ object FrmGstPI: TFrmGstPI
     object TabDatiCom: TTabSheet
       Caption = 'Dati Comerciali'
       ImageIndex = 1
+      ExplicitLeft = 0
+      ExplicitTop = 0
+      ExplicitWidth = 0
+      ExplicitHeight = 0
       object lblMat: TLabel
         Left = 4
         Top = 26
@@ -981,6 +985,10 @@ object FrmGstPI: TFrmGstPI
     object TabStorico: TTabSheet
       Caption = 'Storico ultimi carichi'
       ImageIndex = 2
+      ExplicitLeft = 0
+      ExplicitTop = 0
+      ExplicitWidth = 0
+      ExplicitHeight = 0
       object SMDBGridStorico: TSMDBGrid
         Left = 0
         Top = 0
diff --git a/source/PI_Altag_GstPI/FGstPI.pas b/source/PI_Altag_GstPI/FGstPI.pas
index 2ad21d1..06ae4f4 100644
--- a/source/PI_Altag_GstPI/FGstPI.pas
+++ b/source/PI_Altag_GstPI/FGstPI.pas
@@ -1,3 +1,4 @@
+/// <exclude/>
 unit FGstPI;
 
 interface
diff --git a/source/PI_Altag_GstPI/OGstPI.pas b/source/PI_Altag_GstPI/OGstPI.pas
index 31ca589..002133a 100644
--- a/source/PI_Altag_GstPI/OGstPI.pas
+++ b/source/PI_Altag_GstPI/OGstPI.pas
@@ -1,3 +1,4 @@
+/// <exclude/>
 unit OGstPI;
 
 interface
diff --git a/source/PI_Altag_GstPI/PI_Altag_GstPI.dpk b/source/PI_Altag_GstPI/PI_Altag_GstPI.dpk
index 2fd4b01..8019d99 100644
--- a/source/PI_Altag_GstPI/PI_Altag_GstPI.dpk
+++ b/source/PI_Altag_GstPI/PI_Altag_GstPI.dpk
@@ -1,3 +1,29 @@
+{
+SAM.cfg
+[Plugin]
+PI_Altag_GstPI=PI_Altag_GstPI
+
+[PI_Altag_GstPI]
+Utenti=2
+
+EXTFUN.INI
+[Frmcomtes]
+AUTORUN=PI_Altag_GstPI.PlugIn_PrevInd
+btnPrevInd=PI_Altag_GstPI.BTN_OpenPrevInd;PI_Altag_GstPI.BTN_PrevInd
+
+[FrmOfferte]
+AUTORUN=PI_Altag_GstPI.PlugIn_PrevInd
+btnPrevInd=PI_Altag_GstPI.BTN_OpenPrevInd;PI_Altag_GstPI.BTN_PrevInd
+
+[PI_Altag_GstPI]
+CAP_GenerazioneOP=Genera O.P. (NEW)
+CAP_BTN_OpenPrevInd=Preventivi Altag
+CAP_BTN_PrevInd=Preventivi Altag (NEW)
+
+[FrmIntCom]
+AUTORUN=PI_Altag_GstPI.AttivaPluginPIOV
+BUTTONS=PI_Altag_GstPI.GenerazioneOP
+}
 package PI_Altag_GstPI;
 
 {$R *.res}
diff --git a/source/PI_Altag_GstPI/UGstPI.pas b/source/PI_Altag_GstPI/UGstPI.pas
index 155c4e2..92a0ea6 100644
--- a/source/PI_Altag_GstPI/UGstPI.pas
+++ b/source/PI_Altag_GstPI/UGstPI.pas
@@ -1,3 +1,4 @@
+/// <exclude/>
 unit UGstPI;
 
 interface
@@ -52,7 +53,7 @@ type
     property OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
     property OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
     property OEdbgrRigheRefreshData: TNotifyEvent read FOEdbgrRigheRefreshData write FOEdbgrRigheRefreshData;
-
+    procedure BTN_OpenPrevInd(Sender: TObject); // IK 07/03/2025 RI:54455
     procedure PlugIn_PrevInd;
     function BTN_PrevInd(Sender: TObject): Integer;
     procedure PIClickbtnPrevInd(Sender: TObject);   //  cv dalla 2.18 lo vogliono come bottone indipendente
@@ -74,8 +75,10 @@ type
     procedure ModificaCommessa(iIdComTes: Integer; iIdComRig: Integer; sUmrPre: string; dQta1: Double; dQta2: Double; dQta3: Double; dPrezzo: Double);
   end;
 
-const
-  NOME_FILE_INI = 'ALTAG.CFG';
+// IK 07/03/2025
+// Non ho visti punti in cui veniva richiamato questo file
+//const
+//  NOME_FILE_INI = 'ALTAG.CFG';
 
 implementation
 
@@ -97,6 +100,7 @@ uses
   UCoreTipi,
   UCoreDB,
   IVendite,
+  S3Db,
   FIntCom;
 
 // -----------------------------------------------------------------------------
@@ -907,6 +911,48 @@ begin
   BTN_PrevInd(Sender);
 end;
 
+procedure TGstPI.BTN_OpenPrevInd(Sender: TObject);
+var
+  FrmPIDT: IFrmPrdStd;
+  LQry: TCSEQuery;
+  LSqlQry, LMsgErr: string;
+begin
+  LQry := TCSEQuery.Create(nil);
+  try
+    LQry.DatabaseName := DBExec.DatabaseName;
+
+    LSqlQry := ''
+      + ' select o.id '
+      + ' from optes o '
+      + ' inner join tipidoc td on o.idtipidoc=td.id '
+      + ' where td.tipdoc=''D'' '
+      + ' and o.idcomrig=' + CS_VariantTo_SqlStr(PropValueVar['IdRiga']);
+
+    LMsgErr := CS_OpenQry(LSqlQry, LQry);
+
+    if LMsgErr <> '' then
+      raise Exception.Create(LMsgErr);
+
+    if not LQry.Eof then
+    begin
+      if LQry.FieldByName('ID').AsInteger > 0 then
+      begin
+        if (not LoadSamModule(ModuloPrd)) then
+          Exit;
+
+        // Faccio vedere il preventivo se ho l'autorizzazione
+        FrmPIDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', LQry.FieldByName('ID').AsInteger, liAll) as IFrmPrdStd;
+
+        if (Assigned(FrmPIDT)) then
+          FrmPIDT.Show;
+      end;
+    end;
+  finally
+    LQry.Close;
+    FreeAndNil(LQry);
+  end;
+end;
+
 function TGstPI.BTN_PrevInd(Sender: TObject): Integer;
 var
   bModifica: Boolean;
```

### `fd93bc4a93732c904b79d1d3622992b1c4ffa791` - RI54455 - GstPI - Formattazione del codice
- Data: `2025-03-07T12:24:35+01:00`
- Autore: `Iliass Kharbouchi`
- Classificazione prima: `Mista`
- Classificazione dopo: `Mista`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstPI/FGstPI.pas, source/PI_Altag_GstPI/OGstPI.pas, source/PI_Altag_GstPI/UGstPI.pas`
- Indicatori V500: `dbexec, rnote, getnota, memotext, glyphlibraryindex, oledb`
- Indicatori V600: `tcsequery`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstPI/FGstPI.pas b/source/PI_Altag_GstPI/FGstPI.pas
index 12142ea..2ad21d1 100644
--- a/source/PI_Altag_GstPI/FGstPI.pas
+++ b/source/PI_Altag_GstPI/FGstPI.pas
@@ -3,10 +3,27 @@ unit FGstPI;
 interface
 
 uses
-  Winapi.Windows, Vcl.Forms, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,
-  Data.DB, OLEDBComponents, Vcl.DBGrids, AdvGroupBox, CSETables,
-  UCoreTipi, Vcl.Grids, OGstPI, IProduzione, Vcl.ComCtrls, Compf2,
-  CSGroupBox, SMDBGrid, QueryPars, CSFileCfg;
+  Winapi.Windows,
+  Vcl.Forms,
+  System.Classes,
+  Vcl.Controls,
+  Vcl.StdCtrls,
+  Vcl.ExtCtrls,
+  Data.DB,
+  OLEDBComponents,
+  AdvGroupBox,
+  CSETables,
+  UCoreTipi,
+  Vcl.Grids,
+  OGstPI,
+  IProduzione,
+  Vcl.ComCtrls,
+  Compf2,
+  CSGroupBox,
+  SMDBGrid,
+  QueryPars,
+  CSFileCfg,
+  Vcl.DBGrids;
 
 type
   TDatiPI = record
@@ -22,6 +39,7 @@ type
     idopsdlfas: integer;
     NoMat: Boolean;
   end;
+
   TFrmGstPI = class(TForm)
     QryextvelAltatg: TCSEQuery;
     QrySelCompPrinc: TCSEQuery;
@@ -152,8 +170,7 @@ type
     DsStorico: TDataSource;
     SMDBGridStorico: TSMDBGrid;
     procedure FormShow(Sender: TObject);
-    procedure F2MaterialeKeyChange(Sender: TObject; NewKey,
-      OldKey: Integer);
+    procedure F2MaterialeKeyChange(Sender: TObject; NewKey, OldKey: Integer);
     procedure Edt_SvilLinKeyPress(Sender: TObject; var Key: WideChar);
     procedure Edt_SvilLinExit(Sender: TObject);
     procedure Edt_NProfExit(Sender: TObject);
@@ -164,7 +181,7 @@ type
     procedure FormCreate(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure SG_CSvilKeyPress(Sender: TObject; var Key: WideChar);
-    procedure SG_CSvilSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
+    procedure SG_CSvilSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
     procedure Edt_SvilLinChange(Sender: TObject);
     procedure Edt_PezziLastraChange(Sender: TObject);
     procedure edtPeMCMaKeyPress(Sender: TObject; var Key: WideChar);
@@ -184,25 +201,25 @@ type
 //
 //  File ini
 //
-    sCausali          : String;
-    FileIni           : TCSFileCfg;
+    sCausali: string;
+    FileIni: TCSFileCfg;
 
     // isInIns: Boolean;
     DatiPI: TDatiPI;
-    NtabtmpCopia: String;
+    NtabtmpCopia: string;
     DiametroMin: Double;
     IDlavorazione: Integer;
     IDCompDefault: Integer;
     ext_pialtatg: TExt_GstPI;
-    UtentiAbilitati: String;
-    IDTipiDocVendita  : TStrings;
-    IDTipiDocSiCosto  : TStrings;
-    IDTipiDocNoCosto  : TStrings;
+    UtentiAbilitati: string;
+    IDTipiDocVendita: TStrings;
+    IDTipiDocSiCosto: TStrings;
+    IDTipiDocNoCosto: TStrings;
 //
 //  Funzioni e/o procedure
 //
-    function  LeggiFileIni : Boolean;
-    function  SalvaFileIni : Boolean;
+    function LeggiFileIni: Boolean;
+    function SalvaFileIni: Boolean;
 
     function cercaextvelAltatg(idgruppi, idmarche, idLav: integer; spessore: Double): boolean;
     procedure PulisciDatiPI(myDatiPI: TDatiPI);
@@ -229,22 +246,22 @@ type
     function SecSToSecC(MinSecS: double): double;
     procedure CalcolaTotDatiCom;
     procedure AggOPTESDatiCont;
-    function  AssegnaControlliDatiComPI(FOP: IPrev) : Boolean;
+    function AssegnaControlliDatiComPI(FOP: IPrev): Boolean;
     procedure AssegnaCampiOptesDatiCont(FOP: IPrev);
     procedure LeggiMateriale;
     procedure AggiornaCosti;
     procedure AggiornaPesi(IdOpTes, IdArtico: Integer);
     //SD 04/10/2010 : RI #9595
-    function ValidaControlli : Boolean;
-    function getTipDocOV(IdComRig : Integer ): Integer;
-    function SalvaPI : Boolean;
+    function ValidaControlli: Boolean;
+    function getTipDocOV(IdComRig: Integer): Integer;
+    function SalvaPI: Boolean;
     { Private declarations }
   public
     { Public declarations }
     idcomrig: integer;
     livello: Tlivello;
     AskAggPrezzoComRig: Integer;
-    OpenPI : Integer;
+    OpenPI: Integer;
     //CostoTot: double;
     Abort: Boolean;
     bSolaLettura: Boolean;
@@ -260,8 +277,18 @@ var
 implementation
 
 uses
- RNumb, UCoreUtils, RDate, S3DB, UCoreDB, Vcl.Dialogs, System.SysUtils,
- RSQL, RString, RMiscComp, S3Registry, OOrPr;
+  RNumb,
+  UCoreUtils,
+  RDate,
+  S3DB,
+  UCoreDB,
+  Vcl.Dialogs,
+  System.SysUtils,
+  RSQL,
+  RString,
+  RMiscComp,
+  S3Registry,
+  OOrPr;
 
 {$R *.DFM}
 
@@ -272,271 +299,279 @@ var
   idCauMovR, i: Integer;
   ValStr, chiave: string;
   //SD 04/10/2010 : RI #9595
-  QrytmpArt : TCSEQuery;
-  MsgErr    : String;
-  sChiave   : String;
-  IDGruppo  : Integer;
-  bLetto    : Boolean;
+  QrytmpArt: TCSEQuery;
+  MsgErr: string;
+  sChiave: string;
+  IDGruppo: Integer;
+  bLetto: Boolean;
 begin
   OpenPI := 0;
   bLetto := LeggiFileIni();
-  if (bLetto = false) then Exit;
+  if (bLetto = false) then
+    Exit;
 
-  Abort:=True;
+  Abort := True;
   // isInIns:=True;
-  AskAggPrezzoComRig:=0;  //  nessuna azione
+  AskAggPrezzoComRig := 0;  //  nessuna azione
 
   // Conversione alla 03.02 ...  Riporto le stringa SQL che prima erano nell'oggetto
-  QryextvelAltatg.databasename:=Azienda.DatabaseName;
-  QryextvelAltatg.SQL.Text:= 'select * from extvelAltatg '+
-                             'where idgruppi= :idgruppi '+
-                               'and idmarche= :idmarche '+
-                               'and idlav= :idlav '+
-                               'and spessore= :spessore ';
+  QryextvelAltatg.databasename := Azienda.DatabaseName;
+  QryextvelAltatg.SQL.Text := 'select * from extvelAltatg ' +
+    'where idgruppi= :idgruppi ' +
+    'and idmarche= :idmarche ' +
+    'and idlav= :idlav ' +
+    'and spessore= :spessore ';
   QryextvelAltatg.prepare;
 
-  QrySelOPDTpf.databasename:=Azienda.DatabaseName;
-  QrySelOPDTpf.SQL.Text:= 'select id, idartico from opdt '+
-                          'where idoptes= :idoptes and livello=0 and idpadre is null ';
+  QrySelOPDTpf.databasename := Azienda.DatabaseName;
+  QrySelOPDTpf.SQL.Text := 'select id, idartico from opdt ' +
+    'where idoptes= :idoptes and livello=0 and idpadre is null ';
   QrySelOPDTpf.prepare;
 
-  QrySelCompPrinc.databasename:=Azienda.DatabaseName;
-  QrySelCompPrinc.SQL.Text:= 'select opdt.id, opdt.idartico '+
-                             'from opdt inner join optes on opdt.idoptes=optes.id '+
-                             'where optes.idcomrig= :idcomrig and opdt.livello=1 '+
-                               'and opdt.idpadre=(select opdtp.id '+
-                                                 'from opdt opdtp '+
-                                                 'inner join optes optesp on opdtp.idoptes=optesp.id '+
-                                                 'where optesp.id=optes.id '+
-                                                   'and opdtp.livello=0 '+
-                                                   'and opdtp.idpadre is null) '+
-                             'order by opdt.sequen ';
+  QrySelCompPrinc.databasename := Azienda.DatabaseName;
+  QrySelCompPrinc.SQL.Text := 'select opdt.id, opdt.idartico ' +
+    'from opdt inner join optes on opdt.idoptes=optes.id ' +
+    'where optes.idcomrig= :idcomrig and opdt.livello=1 ' +
+    'and opdt.idpadre=(select opdtp.id ' +
+    'from opdt opdtp ' +
+    'inner join optes optesp on opdtp.idoptes=optesp.id ' +
+    'where optesp.id=optes.id ' +
+    'and opdtp.livello=0 ' +
+    'and opdtp.idpadre is null) ' +
+    'order by opdt.sequen ';
   QrySelCompPrinc.prepare;
 
-  QrySelOPDP.databasename:=Azienda.DatabaseName;
-  QrySelOPDP.SQL.Text:= 'select top 1 opdp.id, opdp.qtimco, opdp.tipord, '+
-                           'opdp.cosuni, opdp.tipcos from opdp '+
-                        'where opdp.idoptes= :idoptes '+
-                          'and opdp.idartico= :idartico '+
-                        'order by id ';
+  QrySelOPDP.databasename := Azienda.DatabaseName;
+  QrySelOPDP.SQL.Text := 'select top 1 opdp.id, opdp.qtimco, opdp.tipord, ' +
+    'opdp.cosuni, opdp.tipcos from opdp ' +
+    'where opdp.idoptes= :idoptes ' +
+    'and opdp.idartico= :idartico ' +
+    'order by id ';
   QrySelOPDP.prepare;
 
-  QrySelSdlMat.databasename:=Azienda.DatabaseName;
-  QrySelSdlMat.SQL.Text:= 'select id from opsdlmat '+
-                          'where idopdt= :idopdt and idartico= :idartico '+
-                          'order by sequen ';
+  QrySelSdlMat.databasename := Azienda.DatabaseName;
+  QrySelSdlMat.SQL.Text := 'select id from opsdlmat ' +
+    'where idopdt= :idopdt and idartico= :idartico ' +
+    'order by sequen ';
   QrySelSdlMat.prepare;
 
-  QrySelSdlFas.databasename:=Azienda.DatabaseName;
-  QrySelSdlFas.SQL.Text:= 'select id, idlav from opsdlfas '+
-                          'where idopsdlmat= :idopsdlmat '+
-                          'order by sequen ';
+  QrySelSdlFas.databasename := Azienda.DatabaseName;
+  QrySelSdlFas.SQL.Text := 'select id, idlav from opsdlfas ' +
+    'where idopsdlmat= :idopsdlmat ' +
+    'order by sequen ';
   QrySelSdlFas.prepare;
 
-  QryNextNumOP.databasename:=Azienda.DatabaseName;
+  QryNextNumOP.databasename := Azienda.DatabaseName;
 //  LS 27/11/2020 Modificata Ricerca NumOp adeguando alle logiche STD.
 //  QryNextNumOP.SQL.Text:= 'SELECT MAX(NUMOP) ULTIMO FROM OPTES '+
 //                          'WHERE (ANNOP= :ANNOP) AND (IDTIPIDOC= :IDTIPIDOC) ';
-  QryNextNumOP.SQL.Text:= 'SELECT MAX(NUMOP) ULTIMO FROM OPTES tes '+
-                          'join TipiDoc td on tes.idTipiDoc=td.Id  '+
-                          'WHERE (ANNOP= :ANNOP) AND (tes.TIPNUM= :TIPNUM) '+
-                          'and (td.TipDoc=(select t.TipDoc from TipiDoc t where (t.Id= :IDTIPIDOC))) ';
+  QryNextNumOP.SQL.Text := 'SELECT MAX(NUMOP) ULTIMO FROM OPTES tes ' +
+    'join TipiDoc td on tes.idTipiDoc=td.Id  ' +
+    'WHERE (ANNOP= :ANNOP) AND (tes.TIPNUM= :TIPNUM) ' +
+    'and (td.TipDoc=(select t.TipDoc from TipiDoc t where (t.Id= :IDTIPIDOC))) ';
 //  ...LS 27/11/2020
   QryNextNumOP.prepare;
 
-  QryUpdtOpdtPF.databasename:=Azienda.DatabaseName;
-  QryUpdtOpdtPF.SQL.Text:= 'update opdt set idartico= :idartico where id= :id ';
+  QryUpdtOpdtPF.databasename := Azienda.DatabaseName;
+  QryUpdtOpdtPF.SQL.Text := 'update opdt set idartico= :idartico where id= :id ';
 
-  QryUpdtOpSDLMatPF.databasename:=Azienda.DatabaseName;
-  QryUpdtOpSDLMatPF.SQL.Text:= 'update opsdlmat set idartico= :idartico where idopdt= :idopdt';
+  QryUpdtOpSDLMatPF.databasename := Azienda.DatabaseName;
+  QryUpdtOpSDLMatPF.SQL.Text := 'update opsdlmat set idartico= :idartico where idopdt= :idopdt';
   // ...Conversione alla 03.02
 
-
-
   //SD 04/10/2010 : RI #9595
-  QryTmpArt := TCSEQuery.Create(nil);
+  QrytmpArt := TCSEQuery.Create(nil);
   try
-    QryTmpArt.DatabaseName := DBExec.DatabaseName;
-    QrytmpArt.SQL.Text := 'select '+
-                            'a.IDGRUPPI ' +
-                          'from ' +
-                            'ARTICO a ' +
-                          'inner join ' +
-                            'Lotser l on l.IDARTICO=a.ID ' +
-                          'inner join ' +
-                            'ComRig cr on cr.IDARTICO=l.ID ' +
-                          'where ' +
-                            'cr.ID = '+CS_Keyvalueto_SQLStr(idcomrig);
-    Try
+    QrytmpArt.DatabaseName := DBExec.DatabaseName;
+    QrytmpArt.SQL.Text := 'select ' +
+      'a.IDGRUPPI ' +
+      'from ' +
+      'ARTICO a ' +
+      'inner join ' +
+      'Lotser l on l.IDARTICO=a.ID ' +
+      'inner join ' +
+      'ComRig cr on cr.IDARTICO=l.ID ' +
+      'where ' +
+      'cr.ID = ' + CS_Keyvalueto_SQLStr(idcomrig);
+    try
       QrytmpArt.Open;
-    Except on e:Exception Do
-      Begin
-        MsgErr := 'ATTENZIONE'+CRLF+ 'Operazione fallita.' + CRLF + CRLF +
-                  E.Message + CRLF + CRLF +
-                  'SQL:' + CRLF + QrytmpArt.SQL.Text;
-      End;
-    End;
+    except
+      on e: Exception do
+      begin
+        MsgErr := 'ATTENZIONE' + CRLF + 'Operazione fallita.' + CRLF + CRLF +
+          E.Message + CRLF + CRLF +
+          'SQL:' + CRLF + QrytmpArt.SQL.Text;
+      end;
+    end;
     if MsgErr <> '' then
     begin
-      Application.MessageBox( PChar( MsgErr ), PChar( APPTITLE ), MB_OK + MB_ICONERROR );
+      Application.MessageBox(PChar(MsgErr), PChar(APPTITLE), MB_OK + MB_ICONERROR);
     end;
     IDGruppo := QrytmpArt.FieldByName('IDGruppi').AsInteger;
   finally
-    FreeAndNil(QryTmpArt);
+    FreeAndNil(QrytmpArt);
   end;
   //SD 04/10/2010 : fine
   F2Materiale.DBSAM := Azienda.DatabaseName;
-  F2Materiale.WhereSql:=' (a.TipArt=''S'' or a.TipArt=''C'') ';
+  F2Materiale.WhereSql := ' (a.TipArt=''S'' or a.TipArt=''C'') ';
   //SD 04/10/2010 : RI #9595
   if IDGruppo > 0 then
-    F2Materiale.WhereSql := F2Materiale.WhereSql + ' and (a.IDGRUPPI='+CS_Keyvalueto_SQLStr(IDGruppo)+')';
+    F2Materiale.WhereSql := F2Materiale.WhereSql + ' and (a.IDGRUPPI=' + CS_Keyvalueto_SQLStr(IDGruppo) + ')';
   F2Materiale.open;
   F2Lav.DBSAM := Azienda.DatabaseName;
   F2Lav.open;
   F2IdTipiDoc.DBSAM := Azienda.DatabaseName;
-  F2IdTipiDoc.WhereSql:=' (a.TIPDOC=''D'') ';
+  F2IdTipiDoc.WhereSql := ' (a.TIPDOC=''D'') ';
   F2IdTipiDoc.open;
 
-  edtPeMCMa.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCMA', Azienda.Databasename)), Perc, 2);
-  edtPeMCLi.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCLI', Azienda.Databasename)), Perc, 2);
-  edtPeMCLe.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCLE', Azienda.Databasename)), Perc, 2);
-  edtPeUlMC.text:=formatvariant(ZeroifNull(GetParDef('PIPEULMC', Azienda.Databasename)), Perc, 2);
-  edtPeUlSc.text:=formatvariant(ZeroifNull(GetParDef('PIPEULSC', Azienda.Databasename)), Perc, 2);
+  edtPeMCMa.text := formatvariant(ZeroifNull(GetParDef('PIPEMCMA', Azienda.Databasename)), Perc, 2);
+  edtPeMCLi.text := formatvariant(ZeroifNull(GetParDef('PIPEMCLI', Azienda.Databasename)), Perc, 2);
+  edtPeMCLe.text := formatvariant(ZeroifNull(GetParDef('PIPEMCLE', Azienda.Databasename)), Perc, 2);
+  edtPeUlMC.text := formatvariant(ZeroifNull(GetParDef('PIPEULMC', Azienda.Databasename)), Perc, 2);
+  edtPeUlSc.text := formatvariant(ZeroifNull(GetParDef('PIPEULSC', Azienda.Databasename)), Perc, 2);
 
-  PageControl1.ActivePage:=TabDatiTec;
+  PageControl1.ActivePage := TabDatiTec;
 
   PulisciDatiPI(DatiPI);
-  ext_pialtatg.found:=false;
-  idCauMovR:=0;
-  NtabtmpCopia:='TmpPIAltag'+IntToStr(Utente.Id);
+  ext_pialtatg.found := false;
+  idCauMovR := 0;
+  NtabtmpCopia := 'TmpPIAltag' + IntToStr(Utente.Id);
 
-  QryTmp:=TCSEQuery.Create(nil);
+  QryTmp := TCSEQuery.Create(nil);
   try
     QryTmp.DataBaseName := Azienda.DataBaseName;
     QryTmp.sql.clear;
-    QryTmp.sql.add('select artico.id artico_id, artico.codice artico_codice, artico.descr artico_descr, '+
-                     'artico.idmarche, persone.codice persone_codice, persone.descr1, '+
-                     'clienti.id clienti_id, tipidoc.descr tipidoc_descr, '+
-                     'comtes.numdoc, comtes.anndoc, comrig.qta3, comrig.DatRic, '+
-                     'comrig.descr comrig_descr, comrig.idcaumov, comrig.idmagpre, '+
-                     'marche.descr marche_descr, vardb.codice vardb_codice, '+
-                     'ext_pialtatg.id ext_pialtatg_id, ext_pialtatg.idoptes, ext_pialtatg.idopsdlfas, '+
-                     'optes.idtipidoc, optes.annop, optes.numop, optes.peulmc, optes.ricmc, optes.peulsc, optes.impsc, '+
-                     'optes.CosMA, optes.pemcma, optes.RicMA, optes.CosLI, optes.pemcli, '+
-                     'optes.RicLI, optes.CosLE, optes.pemcle, optes.RicLE '+
-                   'from comrig '+
-                     'inner join comtes on comtes.id=comrig.idcomtes inner join tipidoc on comtes.idtipidoc=tipidoc.id '+
-                     'inner join lotser on lotser.id=comrig.idartico inner join artico on lotser.idartico=artico.id '+
-                     'inner join clienti on comtes.idcliente=clienti.id inner join persone on persone.id=clienti.idpersona '+
-                     'left outer join marche on artico.idmarche=marche.id '+
-                     'left outer join vardb on comrig.idvardb=vardb.id '+
-                     'left outer join optes on comrig.id=optes.idcomrig '+
-                     'left outer join ext_pialtatg on ext_pialtatg.idoptes=optes.id '+  //LR_CH16565_2024
-                   'where tipidoc.tipdoc <> ''P'' and comrig.id='+inttostr(idcomrig)+
-                   ' order by ext_pialtatg.idoptes desc');
+    QryTmp.sql.add('select artico.id artico_id, artico.codice artico_codice, artico.descr artico_descr, ' +
+        'artico.idmarche, persone.codice persone_codice, persone.descr1, ' +
+        'clienti.id clienti_id, tipidoc.descr tipidoc_descr, ' +
+        'comtes.numdoc, comtes.anndoc, comrig.qta3, comrig.DatRic, ' +
+        'comrig.descr comrig_descr, comrig.idcaumov, comrig.idmagpre, ' +
+        'marche.descr marche_descr, vardb.codice vardb_codice, ' +
+        'ext_pialtatg.id ext_pialtatg_id, ext_pialtatg.idoptes, ext_pialtatg.idopsdlfas, ' +
+        'optes.idtipidoc, optes.annop, optes.numop, optes.peulmc, optes.ricmc, optes.peulsc, optes.impsc, ' +
+        'optes.CosMA, optes.pemcma, optes.RicMA, optes.CosLI, optes.pemcli, ' +
+        'optes.RicLI, optes.CosLE, optes.pemcle, optes.RicLE ' +
+        'from comrig ' +
+        'inner join comtes on comtes.id=comrig.idcomtes inner join tipidoc on comtes.idtipidoc=tipidoc.id ' +
+        'inner join lotser on lotser.id=comrig.idartico inner join artico on lotser.idartico=artico.id ' +
+        'inner join clienti on comtes.idcliente=clienti.id inner join persone on persone.id=clienti.idpersona ' +
+        'left outer join marche on artico.idmarche=marche.id ' +
+        'left outer join vardb on comrig.idvardb=vardb.id ' +
+        'left outer join optes on comrig.id=optes.idcomrig ' +
+        'left outer join ext_pialtatg on ext_pialtatg.idoptes=optes.id ' +  //LR_CH16565_2024
+          'where tipidoc.tipdoc <> ''P'' and comrig.id=' + inttostr(idcomrig) +
+        ' order by ext_pialtatg.idoptes desc');
     QryTmp.open;
-    if not QryTmp.isempty then begin
-      caption:=caption+' - Commessa '+trim(QryTmp.fieldbyname('tipidoc_descr').asstring)+' '+
-                                      inttostr(QryTmp.fieldbyname('anndoc').asinteger)+' '+
-                                      inttostr(QryTmp.fieldbyname('numdoc').asinteger);
-
-      Lab_Cliente.caption:=trim(QryTmp.fieldbyname('persone_codice').asstring)+' '+trim(QryTmp.fieldbyname('descr1').asstring);
-      Lab_PF.caption:=trim(QryTmp.fieldbyname('artico_codice').asstring)+' '+trim(QryTmp.fieldbyname('artico_descr').asstring);
-      Lab_finitura.caption:=trim(QryTmp.fieldbyname('marche_descr').asstring);
-      Lab_Qta.caption:=formatvariant(QryTmp.fieldbyname('qta3').asfloat, quantita);
+    if not QryTmp.isempty then
+    begin
+      caption := caption + ' - Commessa ' + trim(QryTmp.fieldbyname('tipidoc_descr').asstring) + ' ' +
+        inttostr(QryTmp.fieldbyname('anndoc').asinteger) + ' ' +
+        inttostr(QryTmp.fieldbyname('numdoc').asinteger);
+
+      Lab_Cliente.caption := trim(QryTmp.fieldbyname('persone_codice').asstring) + ' ' + trim(QryTmp.fieldbyname('descr1').asstring);
+      Lab_PF.caption := trim(QryTmp.fieldbyname('artico_codice').asstring) + ' ' + trim(QryTmp.fieldbyname('artico_descr').asstring);
+      Lab_finitura.caption := trim(QryTmp.fieldbyname('marche_descr').asstring);
+      Lab_Qta.caption := formatvariant(QryTmp.fieldbyname('qta3').asfloat, quantita);
       CalcolaNLastre;
-      BtnCopia.enabled:=False;
-      if QryTmp.fieldbyname('idoptes').asinteger>0 then 
+      BtnCopia.enabled := False;
+      if QryTmp.fieldbyname('idoptes').asinteger > 0 then
       begin  //  il preventivo SAM � gi� inserito
         // isInIns:=False;
-        BtnCopia.enabled:=True;
-        F2IdTipiDoc.keyvalue:=QryTmp.fieldbyname('idtipidoc').asinteger;
+        BtnCopia.enabled := True;
+        F2IdTipiDoc.keyvalue := QryTmp.fieldbyname('idtipidoc').asinteger;
         //CostoTot:=QryTmp.fieldbyname('Valteo').asFloat;
-        Lab_numPrev.caption:=inttostr(QryTmp.fieldbyname('annop').asinteger)+' '+inttostr(QryTmp.fieldbyname('numop').asinteger);  //  +'   Costo: '+formatvariant(CostoTot, importo, 2);
-        edtMa.text:=formatvariant(QryTmp.fieldbyname('CosMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtLi.text:=formatvariant(QryTmp.fieldbyname('CosLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtLe.text:=formatvariant(QryTmp.fieldbyname('CosLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtPeMCMa.text:=formatvariant(QryTmp.fieldbyname('PeMcMa').asfloat, Perc, 2);
-        edtPeMCLi.text:=formatvariant(QryTmp.fieldbyname('PeMcLi').asfloat, Perc, 2);
-        edtPeMCLe.text:=formatvariant(QryTmp.fieldbyname('PeMcLe').asfloat, Perc, 2);
-        edtImpMa.text:=formatvariant(QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtImpLi.text:=formatvariant(QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtImpLe.text:=formatvariant(QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtPeUlMC.text:=formatvariant(QryTmp.fieldbyname('PeUlMc').asfloat, Perc, 2);
-        edtPeUlSc.text:=formatvariant(QryTmp.fieldbyname('PeUlSc').asfloat, Perc, 2);
-        edtImpUl.text:=formatvariant(QryTmp.fieldbyname('RicMc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtImpSc.text:=formatvariant(QryTmp.fieldbyname('ImpSc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtMaRic.text:=formatvariant(QryTmp.fieldbyname('CosMa').asfloat+QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtLiRic.text:=formatvariant(QryTmp.fieldbyname('CosLi').asfloat+QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-        edtLeRic.text:=formatvariant(QryTmp.fieldbyname('CosLe').asfloat+QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        Lab_numPrev.caption := inttostr(QryTmp.fieldbyname('annop').asinteger) + ' ' + inttostr(QryTmp.fieldbyname('numop').asinteger);  //  +'   Costo: '+formatvariant(CostoTot, importo, 2);
+        edtMa.text := formatvariant(QryTmp.fieldbyname('CosMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLi.text := formatvariant(QryTmp.fieldbyname('CosLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLe.text := formatvariant(QryTmp.fieldbyname('CosLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtPeMCMa.text := formatvariant(QryTmp.fieldbyname('PeMcMa').asfloat, Perc, 2);
+        edtPeMCLi.text := formatvariant(QryTmp.fieldbyname('PeMcLi').asfloat, Perc, 2);
+        edtPeMCLe.text := formatvariant(QryTmp.fieldbyname('PeMcLe').asfloat, Perc, 2);
+        edtImpMa.text := formatvariant(QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpLi.text := formatvariant(QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpLe.text := formatvariant(QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtPeUlMC.text := formatvariant(QryTmp.fieldbyname('PeUlMc').asfloat, Perc, 2);
+        edtPeUlSc.text := formatvariant(QryTmp.fieldbyname('PeUlSc').asfloat, Perc, 2);
+        edtImpUl.text := formatvariant(QryTmp.fieldbyname('RicMc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpSc.text := formatvariant(QryTmp.fieldbyname('ImpSc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtMaRic.text := formatvariant(QryTmp.fieldbyname('CosMa').asfloat + QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLiRic.text := formatvariant(QryTmp.fieldbyname('CosLi').asfloat + QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtLeRic.text := formatvariant(QryTmp.fieldbyname('CosLe').asfloat + QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
         {if QryTmp.fieldbyname('qta3').asfloat<>0 then begin
           edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
           edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
           edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
         end;}
         CalcolaTotDatiCom;
-        if cercaCompPrinc(idcomrig) then begin  //  cerco l'eventuale componente dalla distinta tecnica del preventivo SAM
-          DatiPI.IdOPDTC:=QrySelCompPrinc.fieldbyname('id').asinteger;
-          DatiPI.IdArticoC:=QrySelCompPrinc.fieldbyname('idartico').asinteger;
+        if cercaCompPrinc(idcomrig) then
+        begin  //  cerco l'eventuale componente dalla distinta tecnica del preventivo SAM
+          DatiPI.IdOPDTC := QrySelCompPrinc.fieldbyname('id').asinteger;
+          DatiPI.IdArticoC := QrySelCompPrinc.fieldbyname('idartico').asinteger;
         end;
 
-        if cercaOPDTpf(QryTmp.fieldbyname('idoptes').asinteger, QryTmp.fieldbyname('artico_id').asinteger) then begin
-          i:=QrySelOPDTpf.fieldbyname('id').asinteger;
-          if cercaSdlFas(i, QryTmp.fieldbyname('artico_id').asinteger) then begin
-            DatiPI.idopsdlfas:=QrySelSdlFas.fieldbyname('id').asinteger;
-            F2Lav.KeyValue:=QrySelSdlFas.fieldbyname('idLav').asinteger;
+        if cercaOPDTpf(QryTmp.fieldbyname('idoptes').asinteger, QryTmp.fieldbyname('artico_id').asinteger) then
+        begin
+          i := QrySelOPDTpf.fieldbyname('id').asinteger;
+          if cercaSdlFas(i, QryTmp.fieldbyname('artico_id').asinteger) then
+          begin
+            DatiPI.idopsdlfas := QrySelSdlFas.fieldbyname('id').asinteger;
+            F2Lav.KeyValue := QrySelSdlFas.fieldbyname('idLav').asinteger;
           end;
         end;
       end;
-      BtnIncolla.enabled:=not BtnCopia.enabled;
-      DatiPI.idcliente:=QryTmp.fieldbyname('clienti_id').asinteger;
-      DatiPI.IdArticoPF:=QryTmp.fieldbyname('artico_id').asinteger;
-      DatiPI.DatRic:=QryTmp.fieldbyname('DatRic').asfloat;
-      DatiPI.VarDb:=trim(QryTmp.fieldbyname('vardb_codice').asstring);
-      DatiPI.Notapf:=trim(QryTmp.fieldbyname('comrig_descr').asstring);
-      DatiPI.idmarche:=QryTmp.fieldbyname('idmarche').asinteger;
-      DatiPI.idmagpre:=QryTmp.fieldbyname('idmagpre').asinteger;
-      if QryTmp.fieldbyname('ext_pialtatg_id').asinteger>0 then 
+      BtnIncolla.enabled := not BtnCopia.enabled;
+      DatiPI.idcliente := QryTmp.fieldbyname('clienti_id').asinteger;
+      DatiPI.IdArticoPF := QryTmp.fieldbyname('artico_id').asinteger;
+      DatiPI.DatRic := QryTmp.fieldbyname('DatRic').asfloat;
+      DatiPI.VarDb := trim(QryTmp.fieldbyname('vardb_codice').asstring);
+      DatiPI.Notapf := trim(QryTmp.fieldbyname('comrig_descr').asstring);
+      DatiPI.idmarche := QryTmp.fieldbyname('idmarche').asinteger;
+      DatiPI.idmagpre := QryTmp.fieldbyname('idmagpre').asinteger;
+      if QryTmp.fieldbyname('ext_pialtatg_id').asinteger > 0 then
       begin  //  leggo i dati relativi al preventivo altag
         ext_pialtatg.Seek('id', QryTmp.fieldbyname('ext_pialtatg_id').asinteger);
-        if ext_pialtatg.found then begin
-          if ext_pialtatg.campi.idprodfin<>QryTmp.fieldbyname('artico_id').asinteger then begin
-            Showmessage('ATTENZIONE: Il preventivo ALTAG � stato creato utilizzando un prodotto finito diverso da quello indicato in commessa.'+#13#10#13#10+
-                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+        if ext_pialtatg.found then
+        begin
+          if ext_pialtatg.campi.idprodfin <> QryTmp.fieldbyname('artico_id').asinteger then
+          begin
+            Showmessage('ATTENZIONE: Il preventivo ALTAG � stato creato utilizzando un prodotto finito diverso da quello indicato in commessa.' + #13#10#13#10 +
+                'Aggiornare il preventivo premendo il tasto ''' + (BtnStdOk.caption) + '''');
           end
-          else if ext_pialtatg.campi.idprodfin<>DatiPI.IdArticoPF then begin
-            Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro prodotto finito.'+#13#10#13#10+
-                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+          else if ext_pialtatg.campi.idprodfin <> DatiPI.IdArticoPF then
+          begin
+            Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro prodotto finito.' + #13#10#13#10 +
+                'Aggiornare il preventivo premendo il tasto ''' + (BtnStdOk.caption) + '''');
           end;
           {    cv  24.02.06  spostato sotto
           if ext_pialtatg.campi.idmateriale<>DatiPI.IdArticoC then begin
             Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro materiale.'+#13#10#13#10+
                         'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
           end;}
-          if ext_pialtatg.campi.idopsdlfas<>DatiPI.idopsdlfas then begin
-            Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altra lavorazione (Fase).'+#13#10#13#10+
-                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+          if ext_pialtatg.campi.idopsdlfas <> DatiPI.idopsdlfas then
+          begin
+            Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altra lavorazione (Fase).' + #13#10#13#10 +
+                'Aggiornare il preventivo premendo il tasto ''' + (BtnStdOk.caption) + '''');
           end;
           AssegnaControlliExtRig;
         end;
       end;
 
-      if QryTmp.fieldbyname('idoptes').asinteger>0 then 
+      if QryTmp.fieldbyname('idoptes').asinteger > 0 then
       begin
-        if DatiPI.IdArticoC<>0 then
-          i:=DatiPI.IdArticoC  // se il preventivo � gia inserito prendo il componente del preventivo
+        if DatiPI.IdArticoC <> 0 then
+          i := DatiPI.IdArticoC  // se il preventivo � gia inserito prendo il componente del preventivo
         else if ext_pialtatg.found then
-          i:=ext_pialtatg.campi.idmateriale
+          i := ext_pialtatg.campi.idmateriale
         else
-          i:=IDCompDefault;
+          i := IDCompDefault;
 
         if cercaOPDP(QryTmp.fieldbyname('idoptes').asinteger, i) then
         begin
-          edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-          edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
+          edt_Costo.Text := formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+          edt_TCosto.Text := QrySelOPDP.fieldbyname('tipcos').asString;
         end;
       end;
-      idCauMovR:=QryTmp.fieldbyname('idCauMov').asinteger;
+      idCauMovR := QryTmp.fieldbyname('idCauMov').asinteger;
 
       AggiornaPesi(QryTmp.fieldbyname('idoptes').asinteger, F2Materiale.KeyValue); // SF...31/07/2007
     end;
@@ -545,67 +580,75 @@ begin
   end;
 
   // Ini := TCSFileCfg.Create('ALTAG.CFG');
-  Ini := TCSFileCfg.Create(extractfilepath(Glo.IniGenerale)+NOME_FILE_INI);
+  ini := TCSFileCfg.Create(extractfilepath(Glo.IniGenerale) + NOME_FILE_INI);
   IDTipiDocVendita := TStringList.Create;
   IDTipiDocSiCosto := TStringList.Create;
-  IDTipiDocNoCosto := TStringList.Create;  
+  IDTipiDocNoCosto := TStringList.Create;
   try
-    DiametroMin := Ini.ReadFloat('PrevInd', 'DiametroMin', 0);
+    DiametroMin := ini.ReadFloat('PrevInd', 'DiametroMin', 0);
 //    IDlavorazione:= Ini.ReadInteger('PrevInd', 'IDlav', 0);
 
     sChiave := 'IDlav' + IntToStr(Utente.Id);
-    IDlavorazione:= Ini.ReadInteger('PrevInd', sChiave, 0);
+    IDlavorazione := ini.ReadInteger('PrevInd', sChiave, 0);
 
-    IDCompDefault:= Ini.ReadInteger('PrevInd', 'IDCompDef', 0);
-    UtentiAbilitati := Ini.ReadString('PrevInd', 'UtentiAbilitati', '');
-    if idCauMovR>0 then begin
-      for i:=1 to 4 do begin
+    IDCompDefault := ini.ReadInteger('PrevInd', 'IDCompDef', 0);
+    UtentiAbilitati := ini.ReadString('PrevInd', 'UtentiAbilitati', '');
+    if idCauMovR > 0 then
+    begin
+      for i := 1 to 4 do
+      begin
         case i of
-          1: chiave:='IDCAMOVBV';
-          2: chiave:='IDCAMOVBL';
-          3: chiave:='IDCAMOVMV';
-          4: chiave:='IDCAMOVML';
+          1:
+            chiave := 'IDCAMOVBV';
+          2:
+            chiave := 'IDCAMOVBL';
+          3:
+            chiave := 'IDCAMOVMV';
+          4:
+            chiave := 'IDCAMOVML';
         end;
-        ValStr := Ini.ReadString('PrevInd', chiave, '');
-        if trim(ValStr)<>''  then begin
-          if strtoint(CS_Extract_SubStr(ValStr,',',0))=idCauMovR then begin
-            if F2IdTipiDoc.keyvalue=0 then
-              F2IdTipiDoc.keyvalue:=strtoint(CS_Extract_SubStr(ValStr,',',1));
-            if (i=2) or (i=4) then
-              DatiPI.NoMat:=True;
+        ValStr := ini.ReadString('PrevInd', chiave, '');
+        if trim(ValStr) <> '' then
+        begin
+          if strtoint(CS_Extract_SubStr(ValStr, ',', 0)) = idCauMovR then
+          begin
+            if F2IdTipiDoc.keyvalue = 0 then
+              F2IdTipiDoc.keyvalue := strtoint(CS_Extract_SubStr(ValStr, ',', 1));
+            if (i = 2) or (i = 4) then
+              DatiPI.NoMat := True;
             break;
           end;
         end;
       end;
     end;
-    IDTipiDocVendita.CommaText := Ini.ReadString('PrevInd', 'IDTipiDocVendita', '');
-    IDTipiDocSiCosto.CommaText := Ini.ReadString('PrevInd', 'IDTipiDocSiCosto', '');
-    IDTipiDocNoCosto.CommaText := Ini.ReadString('PrevInd', 'IDTipiDocNoCosto', '');
+    IDTipiDocVendita.CommaText := ini.ReadString('PrevInd', 'IDTipiDocVendita', '');
+    IDTipiDocSiCosto.CommaText := ini.ReadString('PrevInd', 'IDTipiDocSiCosto', '');
+    IDTipiDocNoCosto.CommaText := ini.ReadString('PrevInd', 'IDTipiDocNoCosto', '');
 //  if IDTipiDocVendita.CommaText = '' then
 //  begin
 //    Application.MessageBox( PChar( Format ('ATTENZIONE: non sono stati impostati gli ID dei tipi documenti di Vendita nel file di configurazione "%s"'''+CRLF+'(sezione [%s], riga ''%s'')', ['ALTAG.CFG', 'PrevInd','IDTipiDocVendita'])),
 //                            PChar( APPTITLE ),
 //                            MB_OK + MB_ICONWARNING );
 //  end;
-
-
   finally
-    Ini.free;
+    ini.free;
   end;
-  if DiametroMin=0 then
-    showmessage('ATTENZIONE: Non � stato impostato il diametro minimo nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''DiametroMin'')');
+  if DiametroMin = 0 then
+    showmessage('ATTENZIONE: Non � stato impostato il diametro minimo nel file di configurazione ''ALTAG.CFG''' + #13 + #10 +
+        '(sezione [PrevInd], riga ''DiametroMin'')');
 {
   if IDlavorazione=0 then
     showmessage('ATTENZIONE: Non � stata impostata la lavorazione nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''IDlav'')');
-}    
-  if UtentiAbilitati='' then
+}
+  if UtentiAbilitati = '' then
     showmessage('ATTENZIONE: Non sono stati impostati gli utenti che hanno l''accesso alla pagina ''Dati Commerciali'' e che sono abilitati al salvataggio ' +
-                'del Preventivo Industriale nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''UtentiAbilitati'')');
+        'del Preventivo Industriale nel file di configurazione ''ALTAG.CFG''' + #13 + #10 + '(sezione [PrevInd], riga ''UtentiAbilitati'')');
 
   //  cv 24.02.06  spostato da sopra
-  if (ext_pialtatg.found) and (ext_pialtatg.campi.idmateriale<>DatiPI.IdArticoC) and (DatiPI.IdArticoC<>IDCompDefault) then begin
-    Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro materiale.'+#13#10#13#10+
-                'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
+  if (ext_pialtatg.found) and (ext_pialtatg.campi.idmateriale <> DatiPI.IdArticoC) and (DatiPI.IdArticoC <> IDCompDefault) then
+  begin
+    Showmessage('ATTENZIONE: Il preventivo � stato creato utilizzando un altro materiale.' + #13#10#13#10 +
+        'Aggiornare il preventivo premendo il tasto ''' + (BtnStdOk.caption) + '''');
   end;
 
   {if DatiPI.NoMat then
@@ -613,12 +656,12 @@ begin
   else
     lblTipDoc.caption:=lblTipDoc.caption+' (Vendita)';}
 
-  if F2Lav.KeyValue=0 then
-    F2Lav.KeyValue:=IDlavorazione;
+  if F2Lav.KeyValue = 0 then
+    F2Lav.KeyValue := IDlavorazione;
 
-  SG_CSvil.Cells[0, 0]:='Sviluppo';
-  SG_CSvil.Cells[1, 0]:='N. Cerchi';
-  SG_CSvil.Cells[2, 0]:='Diametro';
+  SG_CSvil.Cells[0, 0] := 'Sviluppo';
+  SG_CSvil.Cells[1, 0] := 'N. Cerchi';
+  SG_CSvil.Cells[2, 0] := 'Diametro';
 
   CalcolaTempo;   //  perch� quando lo fa nell'AssegnaControlliExtRig non ha ancora il DiametroMin, quindi � sbagliata
 ///  BtnAggOV.enabled:=ValidaUtente;
@@ -668,12 +711,12 @@ end;
 
 function TFrmGstPI.getTipDocOV(IdComRig: Integer): Integer;
 var
-  Qry : TCSEQuery;
+  Qry: TCSEQuery;
 begin
   Qry := TCSEQuery.Create(nil);
   try
     Qry.DataBaseName := DBExec.DatabaseName;
-    Qry.SQL.Text := 'select ct.IDTIPIDOC from COMTES ct inner join COMRIG cr on cr.IDCOMTES=ct.ID where cr.ID='+CS_Keyvalueto_SQLStr(IdComRig);
+    Qry.SQL.Text := 'select ct.IDTIPIDOC from COMTES ct inner join COMRIG cr on cr.IDCOMTES=ct.ID where cr.ID=' + CS_Keyvalueto_SQLStr(IdComRig);
     try
       Qry.Open;
     except
@@ -687,18 +730,18 @@ end;
 
 procedure TFrmGstPI.PageControl1Change(Sender: TObject);
 var
-  Msg: String;
+  Msg: string;
 begin
   if (PageControl1.Pages[1].Visible) and (PageControl1.Pages[1].Name = 'TabDatiCom') then
   begin
 //  Verifica se l'utente � abiltato o non abilitato all'accesso alla pagina 'Dati Commerciali'
     if not ValidaUtente then
     begin
-        PageControl1.ActivePage := TabDatiTec;
-        Msg := 'Attenzione l''utente non ha l''accesso alla visualizzazione della pagina ''Dati Commerciali''.';
-        Application.MessageBox(PChar(Msg),
-                               PChar(Application.Title),
-                               MB_ICONWARNING + MB_OK);
+      PageControl1.ActivePage := TabDatiTec;
+      Msg := 'Attenzione l''utente non ha l''accesso alla visualizzazione della pagina ''Dati Commerciali''.';
+      Application.MessageBox(PChar(Msg),
+          PChar(Application.Title),
+          MB_ICONWARNING + MB_OK);
     end;
   end;
 
@@ -710,35 +753,34 @@ end;
 
 procedure TFrmGstPI.F2MaterialeKeyChange(Sender: TObject; NewKey, OldKey: Integer);
 var
-  idoptes, idmat : Integer;
+  idoptes, idmat: Integer;
 begin
   LeggiMateriale;
 
-  edt_Costo.text:='0';
-  edt_TCosto.text:='';
+  edt_Costo.text := '0';
+  edt_TCosto.text := '';
 //
 //  Tentativo di aggiornamento del prezzo
 //
-  idoptes:=0;
+  idoptes := 0;
   if ext_pialtatg.found then
   begin
     idoptes := ext_pialtatg.campi.idoptes;
   end;
 
-  if F2Materiale.KeyValue>0 then
-    idmat:=F2Materiale.KeyValue
+  if F2Materiale.KeyValue > 0 then
+    idmat := F2Materiale.KeyValue
   else
-    idmat:=IDCompDefault;
+    idmat := IDCompDefault;
 
   if cercaOPDP(idoptes, idmat) then
   begin
-    edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-    edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
+    edt_Costo.Text := formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+    edt_TCosto.Text := QrySelOPDP.fieldbyname('tipcos').asString;
   end;
 end;
 
-procedure TFrmGstPI.F2LavKeyChange(Sender: TObject; NewKey,
-  OldKey: Integer);
+procedure TFrmGstPI.F2LavKeyChange(Sender: TObject; NewKey, OldKey: Integer);
 begin
   LeggiMateriale;
 end;
@@ -748,43 +790,46 @@ var
   QryTmp: TCSEQuery;
   spessore: double;
 begin
-  if F2Materiale.Keyvalue>0 then begin
-    QryTmp:=TCSEQuery.Create(nil);
+  if F2Materiale.Keyvalue > 0 then
+  begin
+    QryTmp := TCSEQuery.Create(nil);
     try
       QryTmp.DataBaseName := Azienda.DataBaseName;
       QryTmp.sql.clear;
-      QryTmp.sql.add('select codice from classi '+
-                     'where id='+inttostr(F2Materiale.qryf2.fieldbyname('idclassi').asinteger));
+      QryTmp.sql.add('select codice from classi ' +
+          'where id=' + inttostr(F2Materiale.qryf2.fieldbyname('idclassi').asinteger));
       QryTmp.open;
-      if not QryTmp.isempty then begin
-        Lab_Spessore.caption:=trim(formatvariant(QryTmp.fieldbyname('codice').asstring, importo));
+      if not QryTmp.isempty then
+      begin
+        Lab_Spessore.caption := trim(formatvariant(QryTmp.fieldbyname('codice').asstring, importo));
       end
       else
-        Lab_Spessore.caption:='0';
+        Lab_Spessore.caption := '0';
 
       try
-        spessore:=zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
+        spessore := zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
       except
-        spessore:=0;
+        spessore := 0;
       end;
 
-      if cercaextvelAltatg(F2Materiale.qryf2.fieldbyname('idgruppi').asinteger, DatiPI.idmarche, F2Lav.KeyValue, spessore) then begin
+      if cercaextvelAltatg(F2Materiale.qryf2.fieldbyname('idgruppi').asinteger, DatiPI.idmarche, F2Lav.KeyValue, spessore) then
+      begin
         try
           //  edt_Fmmmin.text:=formatvariant(QryextvelAltatg.fieldbyname(Lab_finitura.caption).asfloat, importo);
-          edt_Fmmmin.text:=formatvariant(QryextvelAltatg.fieldbyname('Q2A').asfloat, importo);
+          edt_Fmmmin.text := formatvariant(QryextvelAltatg.fieldbyname('Q2A').asfloat, importo);
         except
-          on e: Exception Do Begin
+          on e: Exception do
+          begin
             MsgError('Si � verificato un problema nella ricerca della velocit� dei materiali.',
-                     E.message);
+                E.message);
           end;
         end;
 
-        edt_SpazioRall.text:=formatvariant(QryextvelAltatg.fieldbyname('spazioRall').asfloat, importo);
-        edt_Rall.text:=formatvariant(QryextvelAltatg.fieldbyname('percRall').asfloat, Perc, 2);
-        Edt_TAttr.text:=formatvariant(QryextvelAltatg.fieldbyname('TAttrez').asfloat, quantita, 2);    //  lo faccio inserire manualmente dalla tabella di configurazione in minuti
-        Edt_TForat.text:=formatvariant(QryextvelAltatg.fieldbyname('TempoFor').asfloat, quantita, 0);  //  lo faccio inserire manualmente dalla tabella di configurazione in secondi
+        edt_SpazioRall.text := formatvariant(QryextvelAltatg.fieldbyname('spazioRall').asfloat, importo);
+        edt_Rall.text := formatvariant(QryextvelAltatg.fieldbyname('percRall').asfloat, Perc, 2);
+        Edt_TAttr.text := formatvariant(QryextvelAltatg.fieldbyname('TAttrez').asfloat, quantita, 2);    //  lo faccio inserire manualmente dalla tabella di configurazione in minuti
+        Edt_TForat.text := formatvariant(QryextvelAltatg.fieldbyname('TempoFor').asfloat, quantita, 0);  //  lo faccio inserire manualmente dalla tabella di configurazione in secondi
       end;
-
     finally
       QryTmp.free;
     end;
@@ -794,12 +839,12 @@ end;
 function TFrmGstPI.cercaextvelAltatg(idgruppi, idmarche, idLav: integer; spessore: Double): boolean;
 begin
   QryextvelAltatg.close;
-  QryextvelAltatg.parambyname('idgruppi').asinteger:=idgruppi;
-  QryextvelAltatg.parambyname('idmarche').asinteger:=idmarche;
-  QryextvelAltatg.parambyname('idLav').asinteger:=idLav;
-  QryextvelAltatg.parambyname('spessore').Asfloat:=spessore;
+  QryextvelAltatg.parambyname('idgruppi').asinteger := idgruppi;
+  QryextvelAltatg.parambyname('idmarche').asinteger := idmarche;
+  QryextvelAltatg.parambyname('idLav').asinteger := idLav;
+  QryextvelAltatg.parambyname('spessore').Asfloat := spessore;
   QryextvelAltatg.open;
-  result:= (not QryextvelAltatg.isempty);
+  result := (not QryextvelAltatg.isempty);
 end;
 
 function TFrmGstPI.cercaCompPrinc(ParidComrig: integer): boolean;
@@ -807,9 +852,9 @@ begin
   //  cerco l'eventuale componente principale
   //
   QrySelCompPrinc.close;
-  QrySelCompPrinc.parambyname('idcomrig').asinteger:=ParidComrig;
+  QrySelCompPrinc.parambyname('idcomrig').asinteger := ParidComrig;
   QrySelCompPrinc.open;
-  result:= (not QrySelCompPrinc.isempty);
+  result := (not QrySelCompPrinc.isempty);
 end;
 
 function TFrmGstPI.cercaOPDP(idOptes, idArtico: integer): boolean;
@@ -817,10 +862,10 @@ begin
   //  cerco l'eventuale componente principale
   //
   QrySelOPDP.close;
-  QrySelOPDP.parambyname('idOptes').asinteger:=idOptes;
-  QrySelOPDP.parambyname('idArtico').asinteger:=idArtico;
+  QrySelOPDP.parambyname('idOptes').asinteger := idOptes;
+  QrySelOPDP.parambyname('idArtico').asinteger := idArtico;
   QrySelOPDP.open;
-  result:= (not QrySelOPDP.isempty);
+  result := (not QrySelOPDP.isempty);
 end;
 
 function TFrmGstPI.cercaSdlMat(idopdtPadre, idArtico: integer): boolean;
@@ -828,20 +873,21 @@ begin
   //  cerco l'eventuale componente principale
   //
   QrySelSdlMat.close;
-  QrySelSdlMat.parambyname('idopdt').asinteger:=idopdtPadre;
-  QrySelSdlMat.parambyname('idArtico').asinteger:=idArtico;
+  QrySelSdlMat.parambyname('idopdt').asinteger := idopdtPadre;
+  QrySelSdlMat.parambyname('idArtico').asinteger := idArtico;
   QrySelSdlMat.open;
-  result:= (not QrySelSdlMat.isempty);
+  result := (not QrySelSdlMat.isempty);
 end;
 
 function TFrmGstPI.cercaSdlFas(idopdtPadre, idArtico: integer): boolean;
 begin
-  result:=False;
-  if cercaSdlMat(idopdtPadre, idArtico{DatiPI.IdArticoPF}) then begin
+  result := False;
+  if cercaSdlMat(idopdtPadre, idArtico{DatiPI.IdArticoPF}) then
+  begin
     QrySelSdlFas.close;
-    QrySelSdlFas.parambyname('idopsdlmat').asinteger:=QrySelSdlMat.fieldbyname('id').asinteger;
+    QrySelSdlFas.parambyname('idopsdlmat').asinteger := QrySelSdlMat.fieldbyname('id').asinteger;
     QrySelSdlFas.open;
-    result:= (not QrySelSdlFas.isempty);
+    result := (not QrySelSdlFas.isempty);
   end;
 end;
 
@@ -850,72 +896,73 @@ begin
   //  cerco nella distinta tecnica il prodotto finito
   //
   QrySelOPDTpf.close;
-  QrySelOPDTpf.parambyname('idoptes').asinteger:=idoptes;
+  QrySelOPDTpf.parambyname('idoptes').asinteger := idoptes;
   // QrySelOPDTpf.parambyname('idArtico').asinteger:=idArticoPF;
   QrySelOPDTpf.open;
-  result:= (not QrySelOPDTpf.isempty);
+  result := (not QrySelOPDTpf.isempty);
 end;
 
-
-
 procedure TFrmGstPI.Edt_SvilLinKeyPress(Sender: TObject; var Key: WideChar);
 begin
-  if sender is tedit then begin
-    CheckImporto(Key, tedit(sender).text);
+  if Sender is tedit then
+  begin
+    CheckImporto(Key, tedit(Sender).text);
   end;
 end;
 
 procedure TFrmGstPI.Edt_SvilLinExit(Sender: TObject);
 begin
-  if sender is tedit then begin
-    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 2);
+  if Sender is tedit then
+  begin
+    tedit(Sender).text := FormatVariant(ExtractVariant(tedit(Sender).text, Importo), Quantita, 2);
   end;
-
 end;
 
 procedure TFrmGstPI.Edt_NProfExit(Sender: TObject);
 begin
-  if sender is tedit then
-    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 0);
+  if Sender is tedit then
+    tedit(Sender).text := FormatVariant(ExtractVariant(tedit(Sender).text, Importo), Quantita, 0);
 end;
 
 procedure TFrmGstPI.edt_NLastreExit(Sender: TObject);
 begin
-  if sender is tedit then
-    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 5);
+  if Sender is tedit then
+    tedit(Sender).text := FormatVariant(ExtractVariant(tedit(Sender).text, Importo), Quantita, 5);
 end;
 
 procedure TFrmGstPI.Edt_TotTaglio1PzExit(Sender: TObject);
 begin
-  if sender is tedit then
-    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Importo);
+  if Sender is tedit then
+    tedit(Sender).text := FormatVariant(ExtractVariant(tedit(Sender).text, Importo), Importo);
 end;
 
 procedure TFrmGstPI.Edt_RallExit(Sender: TObject);
 begin
-  if sender is tedit then
-    tedit(sender).text:=formatvariant(ExtractVariant(tedit(sender).text, Importo), Perc, 2);
+  if Sender is tedit then
+    tedit(Sender).text := formatvariant(ExtractVariant(tedit(Sender).text, Importo), Perc, 2);
 end;
 
 procedure TFrmGstPI.Edt_SvilLinChange(Sender: TObject);
 begin
-  if sender is tedit then begin
-    if (tedit(sender).name=Edt_SvilLin.name) or
-       (tedit(sender).name=Edt_NSpig.name) or
-       (tedit(sender).name=Edt_SpazioRall.name) or
-       (tedit(sender).name=Edt_Fmmmin.name) or
-       (tedit(sender).name=Edt_Rall.name) or
-       (tedit(sender).name=Edt_NProf.name) or
-       (tedit(sender).name=Edt_TForat.name) or
-       (tedit(sender).name=edt_SvilCerchi.name) then
+  if Sender is tedit then
+  begin
+    if (tedit(Sender).name = Edt_SvilLin.name) or
+      (tedit(Sender).name = Edt_NSpig.name) or
+      (tedit(Sender).name = Edt_SpazioRall.name) or
+      (tedit(Sender).name = Edt_Fmmmin.name) or
+      (tedit(Sender).name = Edt_Rall.name) or
+      (tedit(Sender).name = Edt_NProf.name) or
+      (tedit(Sender).name = Edt_TForat.name) or
+      (tedit(Sender).name = edt_SvilCerchi.name) then
       CalcolaTempo;
   end;
 end;
 
 procedure TFrmGstPI.Edt_PezziLastraChange(Sender: TObject);
 begin
-  if sender is tedit then begin
-    if (tedit(sender).name=Edt_PezziLastra.name) then
+  if Sender is tedit then
+  begin
+    if (tedit(Sender).name = Edt_PezziLastra.name) then
       CalcolaNLastre;
   end;
 end;
@@ -931,29 +978,29 @@ end;
 
 procedure TFrmGstPI.PulisciDatiPI(myDatiPI: TDatiPI);
 begin
-  myDatiPI.idcliente:=0;
-  myDatiPI.IdArticoPF:=0;
-  myDatiPI.idmarche:=0;
-  myDatiPI.idmagpre:=0;
-  myDatiPI.DatRic:=0;
-  myDatiPI.VarDb:='0000';
-  myDatiPI.Notapf:='';
-  myDatiPI.IdArticoC:=0;
-  myDatiPI.IdOPDTC:=0;
-  myDatiPI.idopsdlfas:=0;
-  myDatiPI.NoMat:=False;
+  myDatiPI.idcliente := 0;
+  myDatiPI.IdArticoPF := 0;
+  myDatiPI.idmarche := 0;
+  myDatiPI.idmagpre := 0;
+  myDatiPI.DatRic := 0;
+  myDatiPI.VarDb := '0000';
+  myDatiPI.Notapf := '';
+  myDatiPI.IdArticoC := 0;
+  myDatiPI.IdOPDTC := 0;
+  myDatiPI.idopsdlfas := 0;
+  myDatiPI.NoMat := False;
 end;
 
 function TFrmGstPI.ValidaControlli: Boolean;
 var
-  bChiediCosto : Boolean;
+  bChiediCosto: Boolean;
 begin
   if F2Materiale.KeyValue = 0 then
   begin
     Result := False;
-    Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
-                            PChar( APPTITLE ),
-                            MB_OK + MB_ICONINFORMATION );
+    Application.MessageBox(PChar('Attenzione valore obbligatorio.' + CRLF + 'Per proseguire � necessario specificare il valore.'),
+        PChar(APPTITLE),
+        MB_OK + MB_ICONINFORMATION);
     if F2Materiale.CanFocus then
       F2Materiale.SetFocus;
     Exit;
@@ -962,14 +1009,14 @@ begin
 //  Verifico che il tipo documento della commessa che ha generato il PI sia del
 //  tipo che richiede i dati della Lastra
 //
-  if ( IDTipiDocVendita.Count > 0 ) and (IDTipiDocVendita.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+  if (IDTipiDocVendita.Count > 0) and (IDTipiDocVendita.IndexOf(IntToStr(getTipDocOV(IdComRig))) >= 0) then
   begin
     if ZeroIfNull(ExtractVariant(edt_Altezza.Text, Importo)) = 0 then
     begin
       Result := False;
-      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
-                              PChar( APPTITLE ),
-                              MB_OK + MB_ICONINFORMATION );
+      Application.MessageBox(PChar('Attenzione valore obbligatorio.' + CRLF + 'Per proseguire � necessario specificare il valore.'),
+          PChar(APPTITLE),
+          MB_OK + MB_ICONINFORMATION);
       if edt_Altezza.CanFocus then
         edt_Altezza.SetFocus;
       Exit;
@@ -978,9 +1025,9 @@ begin
     if ZeroIfNull(ExtractVariant(edt_Lunghezza.Text, Importo)) = 0 then
     begin
       Result := False;
-      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
-                              PChar( APPTITLE ),
-                              MB_OK + MB_ICONINFORMATION );
+      Application.MessageBox(PChar('Attenzione valore obbligatorio.' + CRLF + 'Per proseguire � necessario specificare il valore.'),
+          PChar(APPTITLE),
+          MB_OK + MB_ICONINFORMATION);
       if edt_Lunghezza.CanFocus then
         edt_Lunghezza.SetFocus;
       Exit;
@@ -989,9 +1036,9 @@ begin
     if ZeroIfNull(ExtractVariant(Edt_PezziLastra.Text, Importo)) = 0 then
     begin
       Result := False;
-      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
-                              PChar( APPTITLE ),
-                              MB_OK + MB_ICONINFORMATION );
+      Application.MessageBox(PChar('Attenzione valore obbligatorio.' + CRLF + 'Per proseguire � necessario specificare il valore.'),
+          PChar(APPTITLE),
+          MB_OK + MB_ICONINFORMATION);
       if Edt_PezziLastra.CanFocus then
         Edt_PezziLastra.SetFocus;
       Exit;
@@ -1000,9 +1047,9 @@ begin
     if ZeroIfNull(ExtractVariant(Edt_NLastre.Text, Importo)) = 0 then
     begin
       Result := False;
-      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
-                              PChar( APPTITLE ),
-                              MB_OK + MB_ICONINFORMATION );
+      Application.MessageBox(PChar('Attenzione valore obbligatorio.' + CRLF + 'Per proseguire � necessario specificare il valore.'),
+          PChar(APPTITLE),
+          MB_OK + MB_ICONINFORMATION);
       if Edt_NLastre.CanFocus then
         Edt_NLastre.SetFocus;
       Exit;
@@ -1013,7 +1060,7 @@ begin
 //  tipo che richiede (non obbligatorio) i dati del costo
 //
   bChiediCosto := true;
-  if ( IDTipiDocSiCosto.Count > 0 ) and (IDTipiDocSiCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+  if (IDTipiDocSiCosto.Count > 0) and (IDTipiDocSiCosto.IndexOf(IntToStr(getTipDocOV(IdComRig))) >= 0) then
   begin
     bChiediCosto := false;
 {
@@ -1023,13 +1070,13 @@ begin
                               PChar( APPTITLE ),
                               MB_OK + MB_ICONINFORMATION );
     end;
-}    
+}
   end;
 //
 //  Verifico che il tipo documento della commessa che ha generato il PI sia del
 //  tipo che non richiede i dati del costo
 //
-  if ( IDTipiDocNoCosto.Count > 0 ) and (IDTipiDocNoCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+  if (IDTipiDocNoCosto.Count > 0) and (IDTipiDocNoCosto.IndexOf(IntToStr(getTipDocOV(IdComRig))) >= 0) then
   begin
     if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
     begin
@@ -1050,9 +1097,9 @@ begin
     if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
     begin
       Result := False;
-      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
-                              PChar( APPTITLE ),
-                              MB_OK + MB_ICONINFORMATION );
+      Application.MessageBox(PChar('Attenzione valore obbligatorio.' + CRLF + 'Per proseguire � necessario specificare il valore.'),
+          PChar(APPTITLE),
+          MB_OK + MB_ICONINFORMATION);
       if edt_Costo.CanFocus then
       begin
         edt_Costo.SetFocus;
@@ -1082,7 +1129,7 @@ end;
 
 procedure TFrmGstPI.BtnStd2OkClick(Sender: TObject);
 var
-  bSalvata : Boolean;
+  bSalvata: Boolean;
 begin
 
   OpenPI := 1;
@@ -1095,7 +1142,7 @@ begin
   end;
 end;
 
-function TFrmGstPI.SalvaPI : Boolean;
+function TFrmGstPI.SalvaPI: Boolean;
 var
   FOP: IPrev;
   idoptes, idDTpadre: Integer;
@@ -1113,20 +1160,21 @@ begin
     Exit;
   end;
 
-  if CalcolaPeso(false)>0 then
+  if CalcolaPeso(false) > 0 then
   begin
-    if F2IdTipiDoc.keyvalue>0 then
+    if F2IdTipiDoc.keyvalue > 0 then
     begin
       //  if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin   cv  01.03.06  disponibile dalla 2.18
-      if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then
+      if GetInterfOggetto('ObjPrdPrev', 'OPTes', IPrev, FOP) then
       begin
-        idoptes:=0;
+        idoptes := 0;
 
         if ext_pialtatg.found then
         begin
           FOP.seek('id', ext_pialtatg.campi.idoptes);
         end
-        else begin
+        else
+        begin
           FOP.ResetCampi;
         end;
 
@@ -1134,14 +1182,14 @@ begin
 
         if FOP.Found then
         begin
-          idoptes :=fop.GetCampi('id');
-          Lab_numPrev.caption:=trim(fop.GetCampi('annop'))+' '+trim(fop.GetCampi('numop'));
+          idoptes := FOP.GetCampi('id');
+          Lab_numPrev.caption := trim(FOP.GetCampi('annop')) + ' ' + trim(FOP.GetCampi('numop'));
           //  cerco il padre
           //
           if cercaOPDTpf(idoptes, DatiPI.IdArticoPF) then
-            idDTpadre:=QrySelOPDTpf.fieldbyname('id').asinteger
+            idDTpadre := QrySelOPDTpf.fieldbyname('id').asinteger
           else
-            idDTpadre:=0;
+            idDTpadre := 0;
 
           AggOPDT(FOP, idoptes, idDTpadre, isInIns);
 
@@ -1167,7 +1215,7 @@ begin
           FOP.seek('id', idoptes);   //  mi riposiziono sul preventivo per rileggere i valori appena ricalcolati
           AssegnaCampiExtRig(idoptes);
           AssegnaControlliDatiComPI(FOP);
-          AskAggPrezzoComRig:=1;  //  il preventivo � stato modificato: in fase di chiusura verra chiesto all'utente se desidera aggiornare la commessa
+          AskAggPrezzoComRig := 1;  //  il preventivo � stato modificato: in fase di chiusura verra chiesto all'utente se desidera aggiornare la commessa
           // isInIns:=False;
 
           AggiornaPesi(idoptes, F2Materiale.KeyValue); // SF...31/07/2007
@@ -1178,21 +1226,21 @@ begin
 //          tipo che richiede (non obbligatorio) i dati del costo
 //
             bChiediCosto := true;
-            if ( IDTipiDocSiCosto.Count > 0 ) and (IDTipiDocSiCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+            if (IDTipiDocSiCosto.Count > 0) and (IDTipiDocSiCosto.IndexOf(IntToStr(getTipDocOV(IdComRig))) >= 0) then
             begin
               bChiediCosto := false;
               if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
               begin
-                Application.MessageBox( PChar( 'Attenzione.'+CRLF+'il salvataggio � avvenuto correttamente ma il costo non � valorizzato.' ),
-                                        PChar( APPTITLE ),
-                                        MB_OK + MB_ICONINFORMATION );
+                Application.MessageBox(PChar('Attenzione.' + CRLF + 'il salvataggio � avvenuto correttamente ma il costo non � valorizzato.'),
+                    PChar(APPTITLE),
+                    MB_OK + MB_ICONINFORMATION);
               end;
             end;
 //
 //          Verifico che il tipo documento della commessa che ha generato il PI sia del
 //          tipo che non richiede i dati del costo
 //
-            if ( IDTipiDocNoCosto.Count > 0 ) and (IDTipiDocNoCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+            if (IDTipiDocNoCosto.Count > 0) and (IDTipiDocNoCosto.IndexOf(IntToStr(getTipDocOV(IdComRig))) >= 0) then
             begin
               if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
               begin
@@ -1212,9 +1260,10 @@ begin
             begin
               if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
               begin
-                Application.MessageBox( PChar( 'Attenzione.'+CRLF+'il salvataggio � avvenuto correttamente.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
-                                        PChar( APPTITLE ),
-                                        MB_OK + MB_ICONINFORMATION );
+                Application.MessageBox(PChar('Attenzione.' + CRLF + 'il salvataggio � avvenuto correttamente.' + CRLF +
+                    'Per proseguire � necessario specificare il valore.'),
+                    PChar(APPTITLE),
+                    MB_OK + MB_ICONINFORMATION);
                 if edt_Costo.CanFocus then
                 begin
                   edt_Costo.SetFocus;
@@ -1234,12 +1283,12 @@ begin
         // FOP.RicValTeo(idoptes);
         // FOP.RicalcoloOP(nil, inttostr(idopdt), nil, nil, nil, nil, nil, false, res);
 
-        if idoptes>0 then
+        if idoptes > 0 then
         begin
           //FOP.seek('id', idoptes);   //  mi riposiziono sul preventivo per rileggere i valori appena ricalcolati
           // AssegnaCampiExtRig(idoptes);
           //AssegnaControlliDatiComPI(FOP);
-          BtnCopia.Enabled:=true;
+          BtnCopia.Enabled := true;
         // end;
 
           {FrmPrdOPDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', idoptes, livello) as IFrmPrdStd;
@@ -1272,43 +1321,44 @@ end;
 //  ----------------------------------------------------------------------------
 //  Visualizza lo storico
 //  ----------------------------------------------------------------------------
+
 procedure TFrmGstPI.btStoricoClick(Sender: TObject);
 begin
   try
-    QryStorico.DatabaseName:=Azienda.DatabaseName;
+    QryStorico.DatabaseName := Azienda.DatabaseName;
     QryStorico.Sql.Clear;
 
-    QryStorico.Sql.Add('select * from (select	top 10 pf.CODICE CODFOR, pf.DESCR1 DESCRFOR, '+
-                          'td.DESCR DESCRDDT, m.NUMDOC NUMDDT, m.ANNDOC ANNDDT, m.DATDOC DATDDT, '+
-                          'tf.DESCR DESCRFAT, m.NUMFAT NUMFAT, m.ANNFAT ANNFAT, m.DATFAT DATFAT, '+
-                          'c.CODICE CODCAU, c.DESCR DESCRCAU, a.CODICE CODART, a.DESCR DESCRART, '+
-                          'l.NUMLOT, l.NUMSER, m.DATMOV, m.QTAINV, m.QTAMOV, m.QTAFOR, '+
-                          'm.Valuni VALUNI, m.Valore VALORE, '+
-                          '(case when m.QTAFOR > 0 '+
-                              'then nullif(m.VALORE/nullif(m.QTAFOR,0),0) '+
-                              'else 0 end) VALOREFOR, '+
-                          'a.UMI, ' + CS_VariantTo_SqlStr(Azienda.RValutaSI.SimboloEuro) + ' CODVALUNI, '+
-                          'm.Cambio CAMBIO, '+
-                          'm.VALUNIVAL VALUNIVAL, m.VALVAL VALVAL, '+
-                          '(case when m.QTAFOR > 0 '+
-                              'then nullif(m.VALVAL/nullif(m.QTAFOR,0),0) '+
-                              'else 0 end) VALVALFOR, '+
-                          'o.UMF, '+
-                          '(case when v.CODICE is not null '+
-                              'then v.CODICE '+
-                              'else ' + CS_VariantTo_SqlStr(Azienda.RValutaSI.SimboloEuro) + ' end) CODVALVAL '+
-                       'from MOVMAG as m '+
-                          'inner join LOTSER as l on l.id=m.idArtico '+
-                          'inner join ARTICO as a on a.id=l.idArtico '+
-                          'inner join CAUMOV c on c.id= m.IDCAUMOV '+
-                          'left outer join OACRIG o on o.id=m.idOacRig '+
-                          'left outer join TIPIDOC td on td.ID=m.IDTIPDOC '+
-                          'left outer join TIPIDOC tf on tf.ID=m.IDTIPFAT '+
-                          'left outer join FORNITORI f on f.id=m.idForPar '+
-                          'left outer join PERSONE pf on pf.id=f.idPersona '+
-                          'left outer join VALUTA v on v.Id = m.IdValuta '+
-                       'where m.IDCAUMOV in (' + sCausali + ') and (l.idArtico=' + IntToStr(F2Materiale.KeyValue) + ') '+
-                          'order by m.id desc) as tmp');
+    QryStorico.Sql.Add('select * from (select	top 10 pf.CODICE CODFOR, pf.DESCR1 DESCRFOR, ' +
+        'td.DESCR DESCRDDT, m.NUMDOC NUMDDT, m.ANNDOC ANNDDT, m.DATDOC DATDDT, ' +
+        'tf.DESCR DESCRFAT, m.NUMFAT NUMFAT, m.ANNFAT ANNFAT, m.DATFAT DATFAT, ' +
+        'c.CODICE CODCAU, c.DESCR DESCRCAU, a.CODICE CODART, a.DESCR DESCRART, ' +
+        'l.NUMLOT, l.NUMSER, m.DATMOV, m.QTAINV, m.QTAMOV, m.QTAFOR, ' +
+        'm.Valuni VALUNI, m.Valore VALORE, ' +
+        '(case when m.QTAFOR > 0 ' +
+        'then nullif(m.VALORE/nullif(m.QTAFOR,0),0) ' +
+        'else 0 end) VALOREFOR, ' +
+        'a.UMI, ' + CS_VariantTo_SqlStr(Azienda.RValutaSI.SimboloEuro) + ' CODVALUNI, ' +
+        'm.Cambio CAMBIO, ' +
+        'm.VALUNIVAL VALUNIVAL, m.VALVAL VALVAL, ' +
+        '(case when m.QTAFOR > 0 ' +
+        'then nullif(m.VALVAL/nullif(m.QTAFOR,0),0) ' +
+        'else 0 end) VALVALFOR, ' +
+        'o.UMF, ' +
+        '(case when v.CODICE is not null ' +
+        'then v.CODICE ' +
+        'else ' + CS_VariantTo_SqlStr(Azienda.RValutaSI.SimboloEuro) + ' end) CODVALVAL ' +
+        'from MOVMAG as m ' +
+        'inner join LOTSER as l on l.id=m.idArtico ' +
+        'inner join ARTICO as a on a.id=l.idArtico ' +
+        'inner join CAUMOV c on c.id= m.IDCAUMOV ' +
+        'left outer join OACRIG o on o.id=m.idOacRig ' +
+        'left outer join TIPIDOC td on td.ID=m.IDTIPDOC ' +
+        'left outer join TIPIDOC tf on tf.ID=m.IDTIPFAT ' +
+        'left outer join FORNITORI f on f.id=m.idForPar ' +
+        'left outer join PERSONE pf on pf.id=f.idPersona ' +
+        'left outer join VALUTA v on v.Id = m.IdValuta ' +
+        'where m.IDCAUMOV in (' + sCausali + ') and (l.idArtico=' + IntToStr(F2Materiale.KeyValue) + ') ' +
+        'order by m.id desc) as tmp');
     QryStorico.Open;
 
     PageControl1.ActivePageIndex := 2;
@@ -1316,36 +1366,38 @@ begin
     on E: Exception do
     begin
       Application.MessageBox(PChar(E.message),
-                             PChar(APPTITLE),
-                             MB_ICONERROR + MB_OK);
+          PChar(APPTITLE),
+          MB_ICONERROR + MB_OK);
     end;
   end; // end try...except
 end;
 
 procedure TFrmGstPI.AggOPTES(FOP: IPrev);
 begin
-  if not FOP.Found then begin
-    FOP.SetCampi('IdComRig', idcomrig);        //id riga commessa di riferimento
+  if not FOP.Found then
+  begin
+    FOP.SetCampi('IdComRig', IdComRig);        //id riga commessa di riferimento
     FOP.SetCampi('DatEmi', Azienda.Data);      // data emissione ... obbligatoria
-    FOP.SetCampi('AnnOP',  Year(Azienda.Data)); //Year); //anno ... obbligatorio
-    FOP.SetCampi('Stato',  'P');	            //stato ... obbligatorio
-    FOP.SetCampi('OPMan',  False);              //generazione manuale ... obbligatorio
+    FOP.SetCampi('AnnOP', Year(Azienda.Data)); //Year); //anno ... obbligatorio
+    FOP.SetCampi('Stato', 'P');	            //stato ... obbligatorio
+    FOP.SetCampi('OPMan', False);              //generazione manuale ... obbligatorio
     FOP.SetCampi('IdTipiDoc', F2IdTipiDoc.keyvalue); //id tipo documento ... obbligatorio
     FOP.SetCampi('TipNum', F2IdTipiDoc.qryf2.fieldbyname('TIPNUM').asstring); // tipo numerazione ... obbligatorio
-    FOP.SetCampi('IdCli',  DatiPI.IdCliente); //id cliente
+    FOP.SetCampi('IdCli', DatiPI.IdCliente); //id cliente
     FOP.SetCampi('DATVAL', Azienda.Data); //	data validit� DB
     FOP.SetCampi('DatRic', DatiPI.DatRic); //	data richiesta
     FOP.SetCampi('DatRpr', DatiPI.DatRic); //	data richiesta prelievo
     FOP.SetCampi('idAllVer', DatiPI.idmagpre); //   id magazzino di prelievo
 
     QryNextNumOP.Close;
-    QryNextNumOP.parambyname('ANNOP').asinteger:=Year(Azienda.Data);
-    QryNextNumOP.parambyname('TIPNUM').Asstring:=F2IdTipiDoc.qryf2.fieldbyname('TIPNUM').asstring; //LS 27/11/2020
-    QryNextNumOP.parambyname('IDTIPIDOC').asinteger:=F2IdTipiDoc.keyvalue;
+    QryNextNumOP.parambyname('ANNOP').asinteger := Year(Azienda.Data);
+    QryNextNumOP.parambyname('TIPNUM').Asstring := F2IdTipiDoc.qryf2.fieldbyname('TIPNUM').asstring; //LS 27/11/2020
+    QryNextNumOP.parambyname('IDTIPIDOC').asinteger := F2IdTipiDoc.keyvalue;
     QryNextNumOP.Open;
-    FOP.SetCampi('NumOP', QryNextNumOP.fieldbyname('ULTIMO').asinteger+1); //numero ... obbligatorio
+    FOP.SetCampi('NumOP', QryNextNumOP.fieldbyname('ULTIMO').asinteger + 1); //numero ... obbligatorio
   end
-  else begin
+  else
+  begin
     AggiornaCosti;
   end;
 
@@ -1358,7 +1410,8 @@ begin
 
   if not FOP.Found then
     FOP.GeneraOP
-  else begin
+  else
+  begin
     // DF + Alef 15/12/2011: Tolto il ModOPTes
     //FOP.ModOPTes(ext_pialtatg.campi.idoptes);
     FOP.Modifica;
@@ -1370,12 +1423,14 @@ procedure TFrmGstPI.AggOPTESDatiCont;
 var
   FOP: IPrev;
 begin
-  if ext_pialtatg.found then begin
+  if ext_pialtatg.found then
+  begin
     // if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin  cv  01.03.06  disponibile dalla 2.18
-    if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then
+    if GetInterfOggetto('ObjPrdPrev', 'OPTes', IPrev, FOP) then
     begin
       FOP.seek('id', ext_pialtatg.campi.idoptes);
-      if FOP.Found then begin
+      if FOP.Found then
+      begin
         AssegnaCampiOptesDatiCont(FOP);
         // DF + Alef 15/12/2011: Tolto il ModOPTes
         //FOP.ModOPTes(ext_pialtatg.campi.idoptes);
@@ -1409,146 +1464,142 @@ var
   var
     lQrySel: TCSEQuery;
     lidCli, lIdLisTes: integer;
-
   begin
 
     lQrySel := TCSEquery.Create(nil);
     lQrySel.DataBaseName := DBExec.DataBaseName;
     try
-      lQrySel.SQL.Text := 'select IDCLIENTE from COMTES tes join COMRIG rig on rig.IDCOMTES=tes.ID where (rig.ID='+CS_KeyValueTo_SqlStr(idcomrig)+') ';
+      lQrySel.SQL.Text := 'select IDCLIENTE from COMTES tes join COMRIG rig on rig.IDCOMTES=tes.ID where (rig.ID=' + CS_KeyValueTo_SqlStr(IdComRig) + ') ';
       try
         lQrySel.Open;
         lidCli := 0;
-        if ( not lQrySel.eof ) then
+        if (not lQrySel.eof) then
           lidCli := lQrySel.FieldByName('IDCLIENTE').asInteger;
 
-        if ( lidCli = 0 )  then
+        if (lidCli = 0) then
           Exit;
 
         lQrySel.Close;
         lQrySel.SQL.TExt := 'select top 1 ' +
-                              '(case when (sco.ID is not null) then -1 else 0 end) as ORDINE' +
-                              ', DATINI' +
-                              ', tes.ID ' +
-                            'from ' +
-                              'LISTES tes ' +
-                            'left join ' +
-                              'SCOCLI sco on (sco.IDLISTES=tes.ID) and (sco.IDCLIENTE='+CS_KeyValueTo_SqlStr(lidCli)+') ' +
-                            'where ' +
-                              '(exists (select ID from LISRIG where (IDLISTES=tes.ID) and (IDARTICO='+CS_KeyValueTo_SqlStr(idmat)+'))) ' +
-                            'and ' +
-                              '(isnull(tes.DATINI, 0)<='+CS_VariantTo_SqlStr(Azienda.Data)+') ' +
-                            'and ' +
-                              '((isnull(tes.DATFIN, 0)=0) or (isnull(tes.DATFIN, 0)>='+CS_VariantTo_SqlStr(Azienda.Data)+')) ' +
-                            'order by ' +
-                              'ORDINE' +
-                              ', tes.DATINI ';
+          '(case when (sco.ID is not null) then -1 else 0 end) as ORDINE' +
+          ', DATINI' +
+          ', tes.ID ' +
+          'from ' +
+          'LISTES tes ' +
+          'left join ' +
+          'SCOCLI sco on (sco.IDLISTES=tes.ID) and (sco.IDCLIENTE=' + CS_KeyValueTo_SqlStr(lidCli) + ') ' +
+          'where ' +
+          '(exists (select ID from LISRIG where (IDLISTES=tes.ID) and (IDARTICO=' + CS_KeyValueTo_SqlStr(idmat) + '))) ' +
+          'and ' +
+          '(isnull(tes.DATINI, 0)<=' + CS_VariantTo_SqlStr(Azienda.Data) + ') ' +
+          'and ' +
+          '((isnull(tes.DATFIN, 0)=0) or (isnull(tes.DATFIN, 0)>=' + CS_VariantTo_SqlStr(Azienda.Data) + ')) ' +
+          'order by ' +
+          'ORDINE' +
+          ', tes.DATINI ';
         lIdLisTes := 0;
         lQrySel.Open;
-        if ( not lQrySel.eof ) then
+        if (not lQrySel.eof) then
           lIdLisTes := lQrySel.FieldByName('ID').asInteger;
 
         FOP.SetCampi('idCli', lidCli);
         FOP.SetCampi('idLisTes', lIdLisTes);
-
-      except on e:exception do
+      except
+        on e: exception do
 
       end;
     finally
       lQrySel.Close;
       FreeAndNil(lQrySel);
     end;
-
-
   end;
 
 begin
-  if QrySelOPDTpf.fieldbyname('idartico').asinteger<>DatiPI.IdArticoPF then begin
-    QryUpdtOpdtPF.parambyname('id').asinteger:=idDTpadre;
-    QryUpdtOpdtPF.parambyname('idArtico').asinteger:=DatiPI.IdArticoPF;
+  if QrySelOPDTpf.fieldbyname('idartico').asinteger <> DatiPI.IdArticoPF then
+  begin
+    QryUpdtOpdtPF.parambyname('id').asinteger := idDTpadre;
+    QryUpdtOpdtPF.parambyname('idArtico').asinteger := DatiPI.IdArticoPF;
     QryUpdtOpdtPF.execsql;
-    QryUpdtOpSDLMatPF.parambyname('idopdt').asinteger:=idDTpadre;
-    QryUpdtOpSDLMatPF.parambyname('idArtico').asinteger:=DatiPI.IdArticoPF;
+    QryUpdtOpSDLMatPF.parambyname('idopdt').asinteger := idDTpadre;
+    QryUpdtOpSDLMatPF.parambyname('idArtico').asinteger := DatiPI.IdArticoPF;
     QryUpdtOpSDLMatPF.execsql;
   end;
 
-  idt:=DatiPI.IdOPDTC;    //  sulla DT del componente mi sono posizionato all'ingresso della form (il componente del PI � sempre il primo del livello 1 avente come padre il PF). In inserimento � vuoto
-  if idt=0 then
-    idt:=-1;
+  idt := DatiPI.IdOPDTC;    //  sulla DT del componente mi sono posizionato all'ingresso della form (il componente del PI � sempre il primo del livello 1 avente come padre il PF). In inserimento � vuoto
+  if idt = 0 then
+    idt := -1;
 
   FOP.SeekDT('id', idt);  //  se idt=-1 imposta FoundDT a false
-  if idt<=0 then begin
+  if idt <= 0 then
+  begin
     //  Inserimento del componente (no modifica)
     //
-    mseq:=2000;
-    FOP.SetCampiOPDT('idoptes',  idoptes);
-    FOP.SetCampiOPDT('idpadre',  idDTpadre);
-    FOP.SetCampiOPDT('sequen',   mseq);
-    FOP.SetCampiOPDT('livello',  1);
+    mseq := 2000;
+    FOP.SetCampiOPDT('idoptes', idoptes);
+    FOP.SetCampiOPDT('idpadre', idDTpadre);
+    FOP.SetCampiOPDT('sequen', mseq);
+    FOP.SetCampiOPDT('livello', 1);
   end;
 
-
-  if F2Materiale.KeyValue>0 then
-    idmat:=F2Materiale.KeyValue
+  if F2Materiale.KeyValue > 0 then
+    idmat := F2Materiale.KeyValue
   else
-    idmat:=IDCompDefault;
+    idmat := IDCompDefault;
 
-  isInIns:=(QrySelCompPrinc.isempty or ((not QrySelCompPrinc.isempty) and
-           (QrySelCompPrinc.fieldbyname('idartico').asinteger<>idmat)));
+  isInIns := (QrySelCompPrinc.isempty or ((not QrySelCompPrinc.isempty) and
+    (QrySelCompPrinc.fieldbyname('idartico').asinteger <> idmat)));
 
   FOP.SetCampiOPDT('idartico', idmat);
 
-  FOP.SetCampiOPDT('Note', trim(edt_Altezza.text)+' x '+trim(edt_Lunghezza.text));
+  FOP.SetCampiOPDT('Note', trim(edt_Altezza.text) + ' x ' + trim(edt_Lunghezza.text));
   FOP.SetCampiOPDT('qtimco', CalcolaPeso(false));
 
-  if idt<0 then
-    idt:=0;
-
+  if idt < 0 then
+    idt := 0;
 
   FOP.AggOPDT(idt);
-  if isInIns or (DatiPI.IdOPDTC=0) then begin
-    if cercaCompPrinc(idcomrig) then begin  //  aggiorno DatiPI. cosi se premo salva pi un'altra volta non lo accoda
-      DatiPI.IdOPDTC:=QrySelCompPrinc.fieldbyname('id').asinteger;
+  if isInIns or (DatiPI.IdOPDTC = 0) then
+  begin
+    if cercaCompPrinc(IdComRig) then
+    begin  //  aggiorno DatiPI. cosi se premo salva pi un'altra volta non lo accoda
+      DatiPI.IdOPDTC := QrySelCompPrinc.fieldbyname('id').asinteger;
     end;
   end;
-  DatiPI.IdArticoC:=F2Materiale.KeyValue;   //  cosi rimane allineato
+  DatiPI.IdArticoC := F2Materiale.KeyValue;   //  cosi rimane allineato
 end;
 
 procedure TFrmGstPI.AggOPDP(FOP: IPrev; idoptes, idDTpadre: integer; isInIns: Boolean);
 var
   idmat: integer;
 begin
-  if F2Materiale.KeyValue>0 then
-    idmat:=F2Materiale.KeyValue
+  if F2Materiale.KeyValue > 0 then
+    idmat := F2Materiale.KeyValue
   else
-    idmat:=IDCompDefault;
-
-
-
+    idmat := IDCompDefault;
 
-
-
-
-  if cercaOPDP(idoptes, idmat) then begin
-    FOP.SeekDP('id',  QrySelOPDP.fieldbyname('id').asinteger);
+  if cercaOPDP(idoptes, idmat) then
+  begin
+    FOP.SeekDP('id', QrySelOPDP.fieldbyname('id').asinteger);
     {FOP.SetCampiOPDP('cosuni',  0);
     FOP.SetCampiOPDP('tipcos',  '');}
     // if (not isInIns) or (zeroifnull(extractvariant(edt_Costo.Text, Importo))=0) then begin
-    if isInIns or (zeroifnull(extractvariant(edt_Costo.Text, Importo))=0) then begin
+    if isInIns or (zeroifnull(extractvariant(edt_Costo.Text, Importo)) = 0) then
+    begin
       //  cv  28.02.06  In inserimento non sono valorizzati (li calcola il PI), quindi andrebbe ad azzerare quelli calcolati dal PI
       //  cv 14.03.06  Se sono a zero (sono in iserimento oppure ho cambiato il materiale) prendo quelli ricalcolati dal PI
       FOP.SetCampiOPDP('cosuni', QrySelOPDP.fieldbyname('cosuni').asFloat);
       FOP.SetCampiOPDP('tipcos', QrySelOPDP.fieldbyname('tipcos').asString);
     end
-    else begin
+    else
+    begin
       //  cv  28.02.06  In inserimento non sono valorizzati (li calcola il PI), quindi andrebbe ad azzerare quelli calcolati dal PI
-      FOP.SetCampiOPDP('cosuni',  zeroifnull(extractvariant(edt_Costo.Text, Importo)));
-      FOP.SetCampiOPDP('tipcos',  edt_TCosto.Text);
+      FOP.SetCampiOPDP('cosuni', zeroifnull(extractvariant(edt_Costo.Text, Importo)));
+      FOP.SetCampiOPDP('tipcos', edt_TCosto.Text);
     end;
     FOP.AggOPDP(idoptes, idmat,
-                CalcolaPeso(false)-QrySelOPDP.fieldbyname('qtimco').asfloat,      //  perch� va in somma
-                QrySelOPDP.fieldbyname('tipord').asstring,
-                idDTpadre);
+        CalcolaPeso(false) - QrySelOPDP.fieldbyname('qtimco').asfloat,      //  perch� va in somma
+          QrySelOPDP.fieldbyname('tipord').asstring,
+        idDTpadre);
   end;
 end;
 
@@ -1558,26 +1609,28 @@ var
   FTmpOP: IOrPr;
 begin
   if cercaSdlMat(idDTpadre, DatiPI.IdArticoPF) then
-    idMat:=QrySelSdlMat.fieldbyname('id').asinteger
+    idMat := QrySelSdlMat.fieldbyname('id').asinteger
   else
-    idMat:=0;
+    idMat := 0;
 
-  if idMat=0 then
-    idMat:=-1;
+  if idMat = 0 then
+    idMat := -1;
 
-  if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then begin
+  if GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then
+  begin
     FTmpOP.Seek('id', idoptes);
     FTmpOP.SeekSdlM('id', idMat);  //  se idMat=-1 imposta FoundDT a false
-    if idMat=-1 then begin
+    if idMat = -1 then
+    begin
       //  Inserimento del Materiale (no modifica)
       //
-      FTmpOP.SetCampiSdlM('idoptes',  idoptes);
-      FTmpOP.SetCampiSdlM('idopdt',  idDTpadre);
-      FTmpOP.SetCampiSdlM('idartico',  DatiPI.IdArticoPF);
-      FTmpOP.SetCampiSdlM('sequen',  10);
+      FTmpOP.SetCampiSdlM('idoptes', idoptes);
+      FTmpOP.SetCampiSdlM('idopdt', idDTpadre);
+      FTmpOP.SetCampiSdlM('idartico', DatiPI.IdArticoPF);
+      FTmpOP.SetCampiSdlM('sequen', 10);
     end;
 
-    FTmpOP.SetCampiSdlM('qtimco',  zeroifnull(extractvariant(Lab_Qta.caption, quantita)));
+    FTmpOP.SetCampiSdlM('qtimco', zeroifnull(extractvariant(Lab_Qta.caption, quantita)));
     FTmpOP.ModificaSdlM;  //  cv  01.03.06  nei PI non � interfacciato: mi appoggio all'OP
     FOP.Seek('id', idoptes);
     FOP.SeekSdlM('id', idMat);
@@ -1588,26 +1641,28 @@ procedure TFrmGstPI.AggSdlFas(FOP: IPrev; idoptes, idDTpadre: integer);
 var
   {idFas: integer;}
   FTmpOP: IOrPr;
-  qryApp : TCSEQuery;
+  qryApp: TCSEQuery;
 begin
   if cercaSdlFas(idDTpadre, DatiPI.IdArticoPF) then
-    DatiPI.idopsdlfas:=QrySelSdlFas.fieldbyname('id').asinteger
+    DatiPI.idopsdlfas := QrySelSdlFas.fieldbyname('id').asinteger
   else
-    DatiPI.idopsdlfas:=0;
+    DatiPI.idopsdlfas := 0;
 
   {if idFas=0 then
     idFas:=-1;}
 
 
-  if DatiPI.idopsdlfas=0 then begin
+  if DatiPI.idopsdlfas = 0 then
+  begin
     //  Inserimento della Fase (no modifica)
     //
     // idFas:=FOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, IDlavorazione, '', False);
     // DatiPI.idopsdlfas:=FOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, F2Lav.KeyValue, '', False);   //  cv 22.02.06  ora lo possono modificare
-    if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then begin
+    if GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then
+    begin
       FTmpOP.seek('id', idoptes);
       //  cv  01.03.06  nei PI non � interfacciato: mi appoggio all'OP
-      DatiPI.idopsdlfas:=FTmpOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, F2Lav.KeyValue, '', False);   //  cv 22.02.06  ora lo possono modificare
+      DatiPI.idopsdlfas := FTmpOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, F2Lav.KeyValue, '', False);   //  cv 22.02.06  ora lo possono modificare
       FOP.seek('id', idoptes);
     end;
 
@@ -1617,12 +1672,13 @@ begin
     FOP.SetCampiSdlF('sequen',  10);}
   end;
 
-  if DatiPI.idopsdlfas>0 then begin
+  if DatiPI.idopsdlfas > 0 then
+  begin
     FOP.SeekSdlF('id', DatiPI.idopsdlfas);
     FOP.SetCampiSdlF('idlav', F2Lav.KeyValue);   // cv 23.02.06  per implementare la modifica della fase
-    FOP.SetCampiSdlF('temavv',  SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo)))/(24*60));
-    FOP.SetCampiSdlF('temese',  SecSToSecC(SecstoMin(MintoSecs(zeroifnull(ExtractVariant(Edt_TempoPrev.text, Importo)))*
-                                                               zeroifnull(extractvariant(Lab_Qta.caption, quantita))))/(24*60));
+    FOP.SetCampiSdlF('temavv', SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo))) / (24 * 60));
+    FOP.SetCampiSdlF('temese', SecSToSecC(SecstoMin(MintoSecs(zeroifnull(ExtractVariant(Edt_TempoPrev.text, Importo))) *
+        zeroifnull(extractvariant(Lab_Qta.caption, quantita)))) / (24 * 60));
     //FOP.SetCampiSdlF('temese',  SecSToSecC(zeroifnull(ExtractVariant(Edt_TempoPrev.text, Importo)))/(24*60));
 
     // GLF...
@@ -1633,24 +1689,24 @@ begin
 //      qryApp.SQL.Text := 'select CosUni, CosUniMA, CosUniUL, CosUniUA from Lavorazioni where Id='+CS_Keyvalueto_SQLStr(F2Lav.KeyValue);
 
       qryApp.SQL.Text :=
-      'select '+
-                  'CASE WHEN RC.ID IS NULL THEN L.CosUni   ELSE RC.CosUniML   END CosUni, '+
-                  'CASE WHEN RC.ID IS NULL THEN L.CosUniMA ELSE RC.CosUniMA END CosUniMA, '+
-                  'CASE WHEN RC.ID IS NULL THEN L.CosUniUL ELSE RC.CosUniUL END CosUniUL, '+
-                  'CASE WHEN RC.ID IS NULL THEN L.CosUniUA ELSE RC.CosUniUA  END CosUniUA '+
-      'from Lavorazioni L '+
-      'JOIN CELPRO C ON L.IDCELPRO = C.ID '+
-      'JOIN COMRIG CR ON CR.ID = '+CS_KeyValueTo_SqlStr(idcomrig)+' '+
-      'JOIN COMTES CT ON CR.IDCOMTES = CT.ID '+
-      'OUTER APPLY '+
-      '(SELECT TOP 1 * FROM REPCOS WHERE IDREPCDC = C.IDREPCDC AND ISNULL(DTINVA,0) <= CT.DATDOC AND ISNULL(NULLIF(DTFIVA,0),CT.DATDOC) >= CT.DATDOC) RC '+
-      'where L.Id = '+CS_Keyvalueto_SQLStr(F2Lav.KeyValue);
+        'select ' +
+        'CASE WHEN RC.ID IS NULL THEN L.CosUni   ELSE RC.CosUniML   END CosUni, ' +
+        'CASE WHEN RC.ID IS NULL THEN L.CosUniMA ELSE RC.CosUniMA END CosUniMA, ' +
+        'CASE WHEN RC.ID IS NULL THEN L.CosUniUL ELSE RC.CosUniUL END CosUniUL, ' +
+        'CASE WHEN RC.ID IS NULL THEN L.CosUniUA ELSE RC.CosUniUA  END CosUniUA ' +
+        'from Lavorazioni L ' +
+        'JOIN CELPRO C ON L.IDCELPRO = C.ID ' +
+        'JOIN COMRIG CR ON CR.ID = ' + CS_KeyValueTo_SqlStr(IdComRig) + ' ' +
+        'JOIN COMTES CT ON CR.IDCOMTES = CT.ID ' +
+        'OUTER APPLY ' +
+        '(SELECT TOP 1 * FROM REPCOS WHERE IDREPCDC = C.IDREPCDC AND ISNULL(DTINVA,0) <= CT.DATDOC AND ISNULL(NULLIF(DTFIVA,0),CT.DATDOC) >= CT.DATDOC) RC ' +
+        'where L.Id = ' + CS_Keyvalueto_SQLStr(F2Lav.KeyValue);
       // IK 06/12/2024 RI 53799
       qryApp.Open;
-      FOP.SetCampiSdlF('CosUni', QryApp.FieldByName('CosUni').AsFloat);
-      FOP.SetCampiSdlF('CosUniMA', QryApp.FieldByName('CosUniMA').AsFloat);
-      FOP.SetCampiSdlF('CosUniUL', QryApp.FieldByName('CosUniUL').AsFloat);
-      FOP.SetCampiSdlF('CosUniUA', QryApp.FieldByName('CosUniUA').AsFloat);
+      FOP.SetCampiSdlF('CosUni', qryApp.FieldByName('CosUni').AsFloat);
+      FOP.SetCampiSdlF('CosUniMA', qryApp.FieldByName('CosUniMA').AsFloat);
+      FOP.SetCampiSdlF('CosUniUL', qryApp.FieldByName('CosUniUL').AsFloat);
+      FOP.SetCampiSdlF('CosUniUA', qryApp.FieldByName('CosUniUA').AsFloat);
     finally
       qryApp.Close;
       qryApp.Free;
@@ -1666,36 +1722,36 @@ var
   i: integer;
   tmp: string;
 begin
-  ext_pialtatg.campi.idoptes:=idoptes;
-  ext_pialtatg.campi.idprodfin:=DatiPI.idarticoPF;
-  ext_pialtatg.campi.idmateriale:=F2Materiale.keyvalue;
-  ext_pialtatg.campi.idopsdlfas:=DatiPI.idopsdlfas;
-  ext_pialtatg.campi.spaziorall:=zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
-  ext_pialtatg.campi.percrall:=zeroifnull(ExtractVariant(Edt_Rall.text, Importo));
-  ext_pialtatg.campi.dimfor:=zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
-  ext_pialtatg.campi.tforat:=zeroifnull(ExtractVariant(Edt_TForat.text, Importo))/(24*60*60);   //  � espresso in secondi
-  ext_pialtatg.campi.tattr:=SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo)))/(24*60);
-  ext_pialtatg.campi.svillin:=zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
-  ext_pialtatg.campi.svilcer:=zeroifnull(ExtractVariant(edt_SvilCerchi.text, Importo));
-  ext_pialtatg.campi.nprof:=ExtractVariant(Edt_NProf.text, Importo);
-  ext_pialtatg.campi.nspig:=ExtractVariant(Edt_NSpig.text, Importo);
-  ext_pialtatg.campi.lastraalt:=zeroifnull(ExtractVariant(edt_Altezza.text, Importo));
-  ext_pialtatg.campi.lastralun:=zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo));
-  ext_pialtatg.campi.nlastre:=ExtractVariant(edt_NLastre.text, Importo);
-  ext_pialtatg.campi.pezzixlastra:=zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo));
-  tmp:='';
-  for i:=1 to SG_CSvil.rowcount do 
+  ext_pialtatg.campi.idoptes := idoptes;
+  ext_pialtatg.campi.idprodfin := DatiPI.idarticoPF;
+  ext_pialtatg.campi.idmateriale := F2Materiale.keyvalue;
+  ext_pialtatg.campi.idopsdlfas := DatiPI.idopsdlfas;
+  ext_pialtatg.campi.spaziorall := zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
+  ext_pialtatg.campi.percrall := zeroifnull(ExtractVariant(Edt_Rall.text, Importo));
+  ext_pialtatg.campi.dimfor := zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
+  ext_pialtatg.campi.tforat := zeroifnull(ExtractVariant(Edt_TForat.text, Importo)) / (24 * 60 * 60);   //  � espresso in secondi
+  ext_pialtatg.campi.tattr := SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo))) / (24 * 60);
+  ext_pialtatg.campi.svillin := zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
+  ext_pialtatg.campi.svilcer := zeroifnull(ExtractVariant(edt_SvilCerchi.text, Importo));
+  ext_pialtatg.campi.nprof := ExtractVariant(Edt_NProf.text, Importo);
+  ext_pialtatg.campi.nspig := ExtractVariant(Edt_NSpig.text, Importo);
+  ext_pialtatg.campi.lastraalt := zeroifnull(ExtractVariant(edt_Altezza.text, Importo));
+  ext_pialtatg.campi.lastralun := zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo));
+  ext_pialtatg.campi.nlastre := ExtractVariant(edt_NLastre.text, Importo);
+  ext_pialtatg.campi.pezzixlastra := zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo));
+  tmp := '';
+  for i := 1 to SG_CSvil.rowcount do
   begin
-    tmp:=tmp+floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo)))+';'+
-             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+';'+
-             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo)))+';';
+    tmp := tmp + floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo))) + ';' +
+      floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))) + ';' +
+      floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))) + ';';
+
 
-    
 //    if length(tmp)>length(ext_pialtatg.campi.sviluppo) then
 //      ShowMessage('ATTENZIONE: riga '+inttostr(i)+' non salvata correttamente.');
   end;
-  
-  ext_pialtatg.campi.sviluppo:=tmp;
+
+  ext_pialtatg.campi.sviluppo := tmp;
   if ext_pialtatg.found then
     ext_pialtatg.modifica
   else
@@ -1707,36 +1763,37 @@ var
   i: integer;
   tmp: string;
 begin
-  if DatiPI.IdArticoC<>0 then
-    F2Materiale.keyvalue:=DatiPI.IdArticoC  // se il preventivo � gia inserito prendo il componente del preventivo
+  if DatiPI.IdArticoC <> 0 then
+    F2Materiale.keyvalue := DatiPI.IdArticoC  // se il preventivo � gia inserito prendo il componente del preventivo
   else
-    F2Materiale.keyvalue:=ext_pialtatg.campi.idmateriale;
-
-  Edt_SpazioRall.text:= FormatVariant(ext_pialtatg.campi.spaziorall, Quantita, 2);
-  Edt_Rall.text:=FormatVariant(ext_pialtatg.campi.percrall, Perc, 2);
-  Edt_Fmmmin.text:=FormatVariant(ext_pialtatg.campi.dimfor, Quantita, 2);
-  Edt_TForat.text:=FormatVariant(ext_pialtatg.campi.tforat*(24*60*60), Quantita, 0);  //  � espresso in secondi
-  Edt_TAttr.text:=FormatVariant(SecCToSecS(ext_pialtatg.campi.tattr*(24*60)), Quantita, 2);
-  Edt_NProf.text:=FormatVariant(ext_pialtatg.campi.nprof, Quantita, 0);
-  Edt_NSpig.text:=FormatVariant(ext_pialtatg.campi.nspig, Quantita, 0);
-  edt_Altezza.text:=FormatVariant(ext_pialtatg.campi.lastraalt, Quantita, 2);
-  edt_Lunghezza.text:=FormatVariant(ext_pialtatg.campi.lastralun, Quantita, 2);
-  edt_NLastre.text:=FormatVariant(ext_pialtatg.campi.nlastre, Quantita, 0);
-  Edt_PezziLastra.text:=FormatVariant(ext_pialtatg.campi.pezzixlastra, Quantita, 0);
-  Edt_SvilLin.text:=FormatVariant(ext_pialtatg.campi.svillin, Quantita, 2);
-  edt_SvilCerchi.text:=FormatVariant(ext_pialtatg.campi.svilcer, Quantita, 2);
-
-  tmp:=ext_pialtatg.campi.sviluppo;
-  for i:=1 to SG_CSvil.rowcount do begin
-    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3))<>'' then
-      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3)))<>0 then
-        SG_CSvil.Cells[0, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3)), Quantita, 2);
-    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1))<>'' then
-      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)))<>0 then
-        SG_CSvil.Cells[1, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)), Quantita, 0);
-    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2))<>'' then
-      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)))<>0 then
-        SG_CSvil.Cells[2, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)), Quantita, 2);
+    F2Materiale.keyvalue := ext_pialtatg.campi.idmateriale;
+
+  Edt_SpazioRall.text := FormatVariant(ext_pialtatg.campi.spaziorall, Quantita, 2);
+  Edt_Rall.text := FormatVariant(ext_pialtatg.campi.percrall, Perc, 2);
+  Edt_Fmmmin.text := FormatVariant(ext_pialtatg.campi.dimfor, Quantita, 2);
+  Edt_TForat.text := FormatVariant(ext_pialtatg.campi.tforat * (24 * 60 * 60), Quantita, 0);  //  � espresso in secondi
+  Edt_TAttr.text := FormatVariant(SecCToSecS(ext_pialtatg.campi.tattr * (24 * 60)), Quantita, 2);
+  Edt_NProf.text := FormatVariant(ext_pialtatg.campi.nprof, Quantita, 0);
+  Edt_NSpig.text := FormatVariant(ext_pialtatg.campi.nspig, Quantita, 0);
+  edt_Altezza.text := FormatVariant(ext_pialtatg.campi.lastraalt, Quantita, 2);
+  edt_Lunghezza.text := FormatVariant(ext_pialtatg.campi.lastralun, Quantita, 2);
+  edt_NLastre.text := FormatVariant(ext_pialtatg.campi.nlastre, Quantita, 0);
+  Edt_PezziLastra.text := FormatVariant(ext_pialtatg.campi.pezzixlastra, Quantita, 0);
+  Edt_SvilLin.text := FormatVariant(ext_pialtatg.campi.svillin, Quantita, 2);
+  edt_SvilCerchi.text := FormatVariant(ext_pialtatg.campi.svilcer, Quantita, 2);
+
+  tmp := ext_pialtatg.campi.sviluppo;
+  for i := 1 to SG_CSvil.rowcount do
+  begin
+    if trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3)) <> '' then
+      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3))) <> 0 then
+        SG_CSvil.Cells[0, i] := FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i - 1) * 3)), Quantita, 2);
+    if trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 1)) <> '' then
+      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 1))) <> 0 then
+        SG_CSvil.Cells[1, i] := FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 1)), Quantita, 0);
+    if trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 2)) <> '' then
+      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 2))) <> 0 then
+        SG_CSvil.Cells[2, i] := FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 2)), Quantita, 2);
   end;
   CalcolaTempo;
 end;
@@ -1769,92 +1826,97 @@ end;
 
 procedure TFrmGstPI.SG_CSvilKeyPress(Sender: TObject; var Key: WideChar);
 begin
-  CheckImporto(Key, tedit(sender).text);
+  CheckImporto(Key, tedit(Sender).text);
 end;
 
-procedure TFrmGstPI.SG_CSvilSetEditText(Sender: TObject; ACol,
-  ARow: Integer; const Value: String);
+procedure TFrmGstPI.SG_CSvilSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
 begin
-  if ACol=0 then
+  if ACol = 0 then
     CalcolaSvilLin
-  else if (ACol=1) or (ACol=2) then
+  else if (ACol = 1) or (ACol = 2) then
     CalcolaSvilCerchi;
 end;
 
 procedure TFrmGstPI.CalcolaSvilLin;
 var
-  tmp:double;
+  tmp: double;
   i: integer;
 begin
-  tmp:=0;
-  for i:=1 to SG_CSvil.rowcount do begin
-    tmp:=tmp+zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo));
+  tmp := 0;
+  for i := 1 to SG_CSvil.rowcount do
+  begin
+    tmp := tmp + zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo));
   end;
-  Edt_SvilLin.text:=FormatVariant(tmp, Quantita, 2);
+  Edt_SvilLin.text := FormatVariant(tmp, Quantita, 2);
 end;
 
 procedure TFrmGstPI.CalcolaSvilCerchi;
 var
-  tmp:double;
+  tmp: double;
   i: integer;
 begin
-  tmp:=0;
-  for i:=1 to SG_CSvil.rowcount do begin
-    tmp:=tmp+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo));
+  tmp := 0;
+  for i := 1 to SG_CSvil.rowcount do
+  begin
+    tmp := tmp + zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)) * zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo));
   end;
-  edt_SvilCerchi.text:=FormatVariant(tmp*3.14, Quantita, 2);
+  edt_SvilCerchi.text := FormatVariant(tmp * 3.14, Quantita, 2);
 end;
 
 procedure TFrmGstPI.CalcolaNLastre;
 begin
   // edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))+0.499, Quantita, 0);
-  if zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))<>0 then
-    edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo)), Quantita, 5);
+  if zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo)) <> 0 then
+    edt_NLastre.text := FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita)) / zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo)), Quantita, 5);
 end;
 
 procedure TFrmGstPI.CalcolaTempo;
 var
-  TLinV, TLinL, TCerV, TCerL, TProf, svilin, NProf, nspig, srall, velocita, PercRall, TForat, tmp :double;
+  TLinV, TLinL, TCerV, TCerL, TProf, svilin, NProf, nspig, srall, velocita, PercRall, TForat, tmp: double;
   i: integer;
 begin
-  TLinV:=0;   //  Tempo lineare veloce
-  TLinL:=0;   //  Tempo lineare lento
-  TCerV:=0;   //  Tempo cerchi veloce
-  TCerL:=0;   //  Tempo cerchi lento
+  TLinV := 0;   //  Tempo lineare veloce
+  TLinL := 0;   //  Tempo lineare lento
+  TCerV := 0;   //  Tempo cerchi veloce
+  TCerL := 0;   //  Tempo cerchi lento
   // TProf:=0;   //  Tempo Profili (in secondi)
-  svilin:=zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
-  NProf:=zeroifnull(ExtractVariant(Edt_NProf.text, Importo));
-  nspig:=zeroifnull(ExtractVariant(Edt_NSpig.text, Importo));
-  srall:=zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
-  velocita:=zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
-  PercRall:=zeroifnull(ExtractVariant(Edt_Rall.text, Perc))/100;
-  TForat:=zeroifnull(ExtractVariant(Edt_TForat.text, Importo));   //  � espresso in secondi
-  TProf:=TForat*NProf;
-
-  if velocita<>0 then begin
-    TLinV:=SecCToSecS((svilin-nspig*2*srall)/velocita);
-    if PercRall<>0 then
-      TLinL:=SecCToSecS((nspig*2*srall)/(velocita*PercRall));
-
-    for i:=1 to SG_CSvil.rowcount do begin
-      if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<>0 then begin
-        if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<DiametroMin then begin
-          if PercRall<>0 then
-            TCerL:=SecSToMin(MinToSecS(TCerL)+
-                            (TForat*zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+
-                             MinToSecS((SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14)/(velocita*PercRall)))));
-        end
-        else begin      
-          tmp:=MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14-2*srall))/(velocita)));
-
+  svilin := zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
+  NProf := zeroifnull(ExtractVariant(Edt_NProf.text, Importo));
+  nspig := zeroifnull(ExtractVariant(Edt_NSpig.text, Importo));
+  srall := zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
+  velocita := zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
+  PercRall := zeroifnull(ExtractVariant(Edt_Rall.text, Perc)) / 100;
+  TForat := zeroifnull(ExtractVariant(Edt_TForat.text, Importo));   //  � espresso in secondi
+  TProf := TForat * NProf;
+
+  if velocita <> 0 then
+  begin
+    TLinV := SecCToSecS((svilin - nspig * 2 * srall) / velocita);
+    if PercRall <> 0 then
+      TLinL := SecCToSecS((nspig * 2 * srall) / (velocita * PercRall));
 
+    for i := 1 to SG_CSvil.rowcount do
+    begin
+      if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo)) <> 0 then
+      begin
+        if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo)) < DiametroMin then
+        begin
+          if PercRall <> 0 then
+            TCerL := SecSToMin(MinToSecS(TCerL) +
+                (TForat * zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))) +
+                MinToSecS((SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)) * zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo)) * 3.14) / (velocita * PercRall)))));
+        end
+        else
+        begin
+          tmp := MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)) * (zeroifnull(ExtractVariant(SG_CSvil.Cells
+    [2, i], Importo)) * 3.14 - 2 * srall)) / (velocita)));
 
-          if PercRall<>0 then
-            tmp:=tmp+MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*2*srall)/(velocita*PercRall)));
+          if PercRall <> 0 then
+            tmp := tmp + MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)) * 2 * srall) / (velocita * PercRall)));
 
-          TCerV:=SecSToMin(MinToSecS(TCerV)+
-                          (TForat*zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+
-                          tmp);
+          TCerV := SecSToMin(MinToSecS(TCerV) +
+              (TForat * zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))) +
+              tmp);
         end;
       end;
     end;
@@ -1880,20 +1942,20 @@ begin
     end;*)
   end;
 
-  Edt_TempoPrev.text:=FormatVariant(SecSToMin(MinToSecS(TLinV)+
-                                              MinToSecS(TLinL)+
-                                              MinToSecS(TCerV)+
-                                              MinToSecS(TCerL)+
-                                              TProf), Quantita, 2);
+  Edt_TempoPrev.text := FormatVariant(SecSToMin(MinToSecS(TLinV) +
+      MinToSecS(TLinL) +
+      MinToSecS(TCerV) +
+      MinToSecS(TCerL) +
+      TProf), Quantita, 2);
 end;
 
 function TFrmGstPI.CalcolaPeso(msg: boolean): double;
 var
-  LTmp,
-  LCOORD: Double;
+  LTmp, LCOORD: Double;
 
 //   spessore: double;
   // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
+
   function GetCOORD(const AIdArtico: Integer): Integer;
   var
     LQTmp: TCSEQuery;
@@ -1905,10 +1967,10 @@ var
 
       LQTmp.sql.clear;
       LQTmp.SQL.Text := ''
-                      + ' SELECT C.COORD '
-                      + ' FROM ARTICO A '
-                      + ' INNER JOIN MAGCOLORI C ON C.ID=A.IDMAGCOLORI '
-                      + ' WHERE A.ID = ' + CS_VariantTo_SqlStr(AIdArtico);
+        + ' SELECT C.COORD '
+        + ' FROM ARTICO A '
+        + ' INNER JOIN MAGCOLORI C ON C.ID=A.IDMAGCOLORI '
+        + ' WHERE A.ID = ' + CS_VariantTo_SqlStr(AIdArtico);
 
       LQTmp.open;
 
@@ -1922,6 +1984,8 @@ var
   end;
   // IK 06/12/2024
 
+
+
 begin
   {try
     spessore:=zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
@@ -1935,10 +1999,10 @@ begin
 //              F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;
 
 
-  LTmp  := (zeroifnull(ExtractVariant(edt_Altezza.text, Importo))*
-            zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo))/1000000)*
-            zeroifnull(ExtractVariant(edt_NLastre.text, Importo))*
-            F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;
+  LTmp := (zeroifnull(ExtractVariant(edt_Altezza.text, Importo)) *
+    zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo)) / 1000000) *
+    zeroifnull(ExtractVariant(edt_NLastre.text, Importo)) *
+    F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;
 
   LCOORD := GetCOORD(F2Materiale.KeyValue);
 
@@ -1948,18 +2012,20 @@ begin
   end
   else
   begin
-     result := CSRoundImp(((LTmp/ LCOORD) * 1000000),6);
+    result := CSRoundImp(((LTmp / LCOORD) * 1000000), 6);
   end;
 
   // IK 06/12/2024 RI 53799
-  if result=0 then begin
-    if msg then begin
-      if messagedlg('ATTENZIONE:'+#13#10#10+'Non � stata indicata la quantit� di materia prima.'+#13#10#10+
-              'Premere ok per impostarla ad uno e continuare oppure premere cancel per indicarla manualmente.', mtWarning, [mbOK, mbCancel], 0)=mrok then
-       result:=1
+  if result = 0 then
+  begin
+    if msg then
+    begin
+      if messagedlg('ATTENZIONE:' + #13#10#10 + 'Non � stata indicata la quantit� di materia prima.' + #13#10#10 +
+          'Premere ok per impostarla ad uno e continuare oppure premere cancel per indicarla manualmente.', mtWarning, [mbOK, mbCancel], 0) = mrok then
+        result := 1
     end
     else
-      result:=1;
+      result := 1;
   end;
 end;
 
@@ -1968,9 +2034,9 @@ var
   TmpMin, TmpSec: Double;
 begin
   {  Trasforma i secondi espressi in centesimi in secondi espressi in sessantesimi  }
-  TmpMin:=int(MinSecC);
-  TmpSec:=Frac(MinSecC)*0.6;
-  result:=TmpMin+TmpSec;
+  TmpMin := int(MinSecC);
+  TmpSec := Frac(MinSecC) * 0.6;
+  result := TmpMin + TmpSec;
 end;
 
 function TFrmGstPI.SecSToSecC(MinSecS: double): double;
@@ -1978,101 +2044,115 @@ var
   TmpMin, TmpSec: Double;
 begin
   {  Trasforma i secondi espressi in sessantesimi in secondi espressi in centesimi  }
-  TmpMin:=int(MinSecS);
-  TmpSec:=Frac(MinSecS)/0.6;
-  result:=TmpMin+TmpSec;
+  TmpMin := int(MinSecS);
+  TmpSec := Frac(MinSecS) / 0.6;
+  result := TmpMin + TmpSec;
 end;
 
 function TFrmGstPI.MinToSecS(Minuti: double): double;
 var
   TmpMin, TmpSec: Integer;
 begin
-  TmpMin:=Trunc(minuti)*60;
-  TmpSec:=Trunc(strtofloat(Floattostr(Frac(Minuti)*100+0.5)));
-  if TmpSec>=60 then begin
-    TmpSec:=TmpSec-60;
-    TmpMin:=TmpMin+60;
+  TmpMin := Trunc(Minuti) * 60;
+  TmpSec := Trunc(strtofloat(Floattostr(Frac(Minuti) * 100 + 0.5)));
+  if TmpSec >= 60 then
+  begin
+    TmpSec := TmpSec - 60;
+    TmpMin := TmpMin + 60;
   end;
-  result:=TmpMin+TmpSec;
+  result := TmpMin + TmpSec;
 end;
 
 function TFrmGstPI.SecSToMin(Secondi: double): double;
 var
   TmpMin, TmpSec: Double;
 begin
-  TmpMin:=int(Secondi/60);
-  TmpSec:=(Secondi-TmpMin*60)/100;
-  result:=TmpMin+TmpSec;
+  TmpMin := int(Secondi / 60);
+  TmpSec := (Secondi - TmpMin * 60) / 100;
+  result := TmpMin + TmpSec;
 end;
 
 procedure TFrmGstPI.edtPeMCMaKeyPress(Sender: TObject; var Key: WideChar);
 begin
-  if sender is tedit then begin
-    CheckImporto(Key, tedit(sender).text);
+  if Sender is tedit then
+  begin
+    CheckImporto(Key, tedit(Sender).text);
   end;
 end;
 
 procedure TFrmGstPI.edtImpMaKeyPress(Sender: TObject; var Key: WideChar);
 begin
-  if sender is tedit then begin
-    CheckImporto(Key, tedit(sender).text);
+  if Sender is tedit then
+  begin
+    CheckImporto(Key, tedit(Sender).text);
     {  Se imputo l'importo a mano azzero la percentuale (se no all'uscita dalla percentuale l'importo viene ricalcolato)}
-    if tedit(sender).name=edtImpMa.name then begin
-      edtPeMCMa.text:='0';
+    if tedit(Sender).name = edtImpMa.name then
+    begin
+      edtPeMCMa.text := '0';
     end
-    else if tedit(sender).name=edtImpLi.name then begin
-      edtPeMCLi.text:='0';
+    else if tedit(Sender).name = edtImpLi.name then
+    begin
+      edtPeMCLi.text := '0';
     end
-    else if tedit(sender).name=edtImpLe.name then begin
-      edtPeMCLe.text:='0';
+    else if tedit(Sender).name = edtImpLe.name then
+    begin
+      edtPeMCLe.text := '0';
     end
-    else if tedit(sender).name=edtImpUl.name then begin
-      edtPeUlMC.text:='0';
+    else if tedit(Sender).name = edtImpUl.name then
+    begin
+      edtPeUlMC.text := '0';
     end
-    else if tedit(sender).name=edtImpSc.name then begin
-      edtPeUlSc.text:='0';
+    else if tedit(Sender).name = edtImpSc.name then
+    begin
+      edtPeUlSc.text := '0';
     end;
   end;
 end;
 
 procedure TFrmGstPI.edtPeMCMaExit(Sender: TObject);
 begin
-  if sender is tedit then begin
-    if tedit(sender).name=edtPeMCMa.name then begin
-      if zeroifnull(ExtractVariant(edtPeMCMa.text, Importo))<>0 then
-        edtImpMa.text:=formatvariant((zeroifnull(ExtractVariant(edtMa.text, Importo))*
-                                      zeroifnull(ExtractVariant(edtPeMCMa.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
+  if Sender is tedit then
+  begin
+    if tedit(Sender).name = edtPeMCMa.name then
+    begin
+      if zeroifnull(ExtractVariant(edtPeMCMa.text, Importo)) <> 0 then
+        edtImpMa.text := formatvariant((zeroifnull(ExtractVariant(edtMa.text, Importo)) *
+            zeroifnull(ExtractVariant(edtPeMCMa.text, Importo)) / 100), Importo, Azienda.RValutaSI.DecMaxEuro)
       else
-        edtImpMa.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpMa.text := formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
 
-      edtMaRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
-                                    zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+      edtMaRic.text := formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo)) +
+          zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
     end
-    else if tedit(sender).name=edtPeMCLi.name then begin
-      if zeroifnull(ExtractVariant(edtPeMCLi.text, Importo))<>0 then
-        edtImpLi.text:=formatvariant((zeroifnull(ExtractVariant(edtLi.text, Importo))*
-                                      zeroifnull(ExtractVariant(edtPeMCLi.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
+    else if tedit(Sender).name = edtPeMCLi.name then
+    begin
+      if zeroifnull(ExtractVariant(edtPeMCLi.text, Importo)) <> 0 then
+        edtImpLi.text := formatvariant((zeroifnull(ExtractVariant(edtLi.text, Importo)) *
+            zeroifnull(ExtractVariant(edtPeMCLi.text, Importo)) / 100), Importo, Azienda.RValutaSI.DecMaxEuro)
       else
-        edtImpLi.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpLi.text := formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
 
-      edtLiRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
-                                    zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+      edtLiRic.text := formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo)) +
+          zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
     end
-    else if tedit(sender).name=edtPeMCLe.name then begin
-      if zeroifnull(ExtractVariant(edtPeMCLe.text, Importo))<>0 then
-        edtImpLe.text:=formatvariant((zeroifnull(ExtractVariant(edtLe.text, Importo))*
-                                      zeroifnull(ExtractVariant(edtPeMCLe.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
+    else if tedit(Sender).name = edtPeMCLe.name then
+    begin
+      if zeroifnull(ExtractVariant(edtPeMCLe.text, Importo)) <> 0 then
+        edtImpLe.text := formatvariant((zeroifnull(ExtractVariant(edtLe.text, Importo)) *
+            zeroifnull(ExtractVariant(edtPeMCLe.text, Importo)) / 100), Importo, Azienda.RValutaSI.DecMaxEuro)
       else
-        edtImpLe.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
+        edtImpLe.text := formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);
 
-      edtLeRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))+
-                                    zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+      edtLeRic.text := formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo)) +
+          zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
     end
-    else if (tedit(sender).name=edtPeUlMC.name) and (zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))=0) then begin
-      edtImpUl.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li far� dentro la CalcolaTotDatiCom
+    else if (tedit(Sender).name = edtPeUlMC.name) and (zeroifnull(ExtractVariant(edtPeUlMC.text, Importo)) = 0) then
+    begin
+      edtImpUl.text := formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li far� dentro la CalcolaTotDatiCom
     end
-    else if (tedit(sender).name=edtPeUlSc.name) and (zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))=0)then begin
-      edtImpSc.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li far� dentro la CalcolaTotDatiCom
+    else if (tedit(Sender).name = edtPeUlSc.name) and (zeroifnull(ExtractVariant(edtPeUlSc.text, Importo)) = 0) then
+    begin
+      edtImpSc.text := formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li far� dentro la CalcolaTotDatiCom
     end;
 
     CalcolaTotDatiCom;
@@ -2085,43 +2165,47 @@ begin
                                     zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
     end;}
 
-    tedit(sender).text:=formatvariant(zeroifnull(ExtractVariant(tedit(sender).text, Importo)), perc, 2);
+    tedit(Sender).text := formatvariant(zeroifnull(ExtractVariant(tedit(Sender).text, Importo)), perc, 2);
     // CalcolaTotDatiCom;
   end;
 end;
 
 procedure TFrmGstPI.edtImpMaExit(Sender: TObject);
 begin
-  if sender is tedit then begin
-    if tedit(sender).name=edtImpMa.name then begin
+  if Sender is tedit then
+  begin
+    if tedit(Sender).name = edtImpMa.name then
+    begin
       {if zeroifnull(ExtractVariant(edtMa.text, Importo))<>0 then begin
         edtPeMCMa.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))/
                                        zeroifnull(ExtractVariant(edtMa.text, Importo))*100), perc, 2);
       end
       else
         edtPeMCMa.text:='0';}
-      edtMaRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
-                                    zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+      edtMaRic.text := formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo)) +
+          zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
     end
-    else if tedit(sender).name=edtImpLi.name then begin
+    else if tedit(Sender).name = edtImpLi.name then
+    begin
       {if zeroifnull(ExtractVariant(edtLi.text, Importo))<>0 then begin
         edtPeMCLi.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))/
                                        zeroifnull(ExtractVariant(edtLi.text, Importo))*100), perc, 2);
       end
       else
         edtPeMCLi.text:='0';}
-      edtLiRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
-                                    zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+      edtLiRic.text := formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo)) +
+          zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
     end
-    else if tedit(sender).name=edtImpLe.name then begin
+    else if tedit(Sender).name = edtImpLe.name then
+    begin
       {if zeroifnull(ExtractVariant(edtLe.text, Importo))<>0 then begin
         edtPeMCLe.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))/
                                        zeroifnull(ExtractVariant(edtLe.text, Importo))*100), perc, 2);
       end
       else
         edtPeMCLe.text:='0';}
-      edtLeRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))+
-                                    zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
+      edtLeRic.text := formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo)) +
+          zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
     end;
 
     CalcolaTotDatiCom;
@@ -2141,28 +2225,29 @@ begin
       else
         edtPeUlSc.text:='0';}
     end;*)
-    tedit(sender).text:=formatvariant(zeroifnull(ExtractVariant(tedit(sender).text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    tedit(Sender).text := formatvariant(zeroifnull(ExtractVariant(tedit(Sender).text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
     //CalcolaTotDatiCom;
   end;
 end;
 
 procedure TFrmGstPI.CalcolaTotDatiCom;
 begin
-  edtTot.text:=formatvariant(zeroifnull(ExtractVariant(edtMa.text, Importo))+
-                             zeroifnull(ExtractVariant(edtLi.text, Importo))+
-                             zeroifnull(ExtractVariant(edtLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtTotGen.text:=edtTot.text;
+  edtTot.text := formatvariant(zeroifnull(ExtractVariant(edtMa.text, Importo)) +
+      zeroifnull(ExtractVariant(edtLi.text, Importo)) +
+      zeroifnull(ExtractVariant(edtLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtTotGen.text := edtTot.text;
 
-  edtTotImp.text:=formatvariant(zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
-                                zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
-                                zeroifnull(ExtractVariant(edtImpLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtTotImp.text := formatvariant(zeroifnull(ExtractVariant(edtImpMa.text, Importo)) +
+      zeroifnull(ExtractVariant(edtImpLi.text, Importo)) +
+      zeroifnull(ExtractVariant(edtImpLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
 
-  edtTotPrec1.text:=formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo))+
-                                  zeroifnull(ExtractVariant(edtTotImp.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtTotPrec1.text := formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo)) +
+      zeroifnull(ExtractVariant(edtTotImp.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
 
-  if zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))<>0 then begin
-    edtImpUl.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
-                                  zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
+  if zeroifnull(ExtractVariant(edtPeUlMC.text, Importo)) <> 0 then
+  begin
+    edtImpUl.text := formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo)) *
+        zeroifnull(ExtractVariant(edtPeUlMC.text, Importo)) / 100), Importo, Azienda.RValutaSI.DecMaxEuro);
   end;
   {else
     edtImpUl.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);}
@@ -2174,70 +2259,76 @@ begin
   {else
     edtImpSc.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);}
 
-  edtTotPrec2.text:=formatvariant(zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))+
-                                  zeroifnull(ExtractVariant(edtImpUl.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtTotPrec2.text := formatvariant(zeroifnull(ExtractVariant(edtTotPrec1.text, Importo)) +
+      zeroifnull(ExtractVariant(edtImpUl.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
 
-  if zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))<>0 then begin
-    edtImpSc.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec2.text, Importo))*
-                                  zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
+  if zeroifnull(ExtractVariant(edtPeUlSc.text, Importo)) <> 0 then
+  begin
+    edtImpSc.text := formatvariant((zeroifnull(ExtractVariant(edtTotPrec2.text, Importo)) *
+        zeroifnull(ExtractVariant(edtPeUlSc.text, Importo)) / 100), Importo, Azienda.RValutaSI.DecMaxEuro);
   end;
 
-  edtTotImpGen.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo))+
-                                   zeroifnull(ExtractVariant(edtImpUl.text, Importo))-
-                                   zeroifnull(ExtractVariant(edtImpSc.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtTotImpGen.text := formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo)) +
+      zeroifnull(ExtractVariant(edtImpUl.text, Importo)) -
+      zeroifnull(ExtractVariant(edtImpSc.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
 
-  if zeroifnull(ExtractVariant(edtTot.text, Importo))<>0 then begin
-    edtTotMC.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo))/
-                                  zeroifnull(ExtractVariant(edtTot.text, Importo))*100, Perc, 2);
-    edtTotMCGen.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImpGen.text, Importo))/
-                                    zeroifnull(ExtractVariant(edtTot.text, Importo))*100, Perc, 2);
+  if zeroifnull(ExtractVariant(edtTot.text, Importo)) <> 0 then
+  begin
+    edtTotMC.text := formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo)) /
+        zeroifnull(ExtractVariant(edtTot.text, Importo)) * 100, Perc, 2);
+    edtTotMCGen.text := formatvariant(zeroifnull(ExtractVariant(edtTotImpGen.text, Importo)) /
+        zeroifnull(ExtractVariant(edtTot.text, Importo)) * 100, Perc, 2);
   end;
 
-  edtTotale.text:=formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo))+
-                                zeroifnull(ExtractVariant(edtTotImpGen.text, Importo)) , Importo, 2);
+  edtTotale.text := formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo)) +
+      zeroifnull(ExtractVariant(edtTotImpGen.text, Importo)), Importo, 2);
 
-  if zeroifnull(extractvariant(Lab_Qta.caption, importo))<>0 then 
+  if zeroifnull(extractvariant(Lab_Qta.caption, importo)) <> 0 then
   begin
-    edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
-    edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
-    edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
-    edtTotaleUni.text:=formatvariant(zeroifnull(ExtractVariant(edtTotale.text, Importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)) , Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtMaUni.text := formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo)) / zeroifnull(extractvariant(Lab_Qta.caption, importo)),
+        Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLiUni.text := formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo)) / zeroifnull(extractvariant(Lab_Qta.caption, importo)),
+        Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLeUni.text := formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo)) / zeroifnull(extractvariant(Lab_Qta.caption, importo)),
+        Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtTotaleUni.text := formatvariant(zeroifnull(ExtractVariant(edtTotale.text, Importo)) / zeroifnull(extractvariant(Lab_Qta.caption,
+        importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
   end;
 end;
 
-function TFrmGstPI.AssegnaControlliDatiComPI(FOP: IPrev) : Boolean;
+function TFrmGstPI.AssegnaControlliDatiComPI(FOP: IPrev): Boolean;
 var
   idmat: integer;
 begin
   Result := false;
-  if F2Materiale.KeyValue>0 then
-    idmat:=F2Materiale.KeyValue
+  if F2Materiale.KeyValue > 0 then
+    idmat := F2Materiale.KeyValue
   else
-    idmat:=IDCompDefault;
+    idmat := IDCompDefault;
 
-  if cercaOPDP(fop.GetCampi('id'), idmat) then
+  if cercaOPDP(FOP.GetCampi('id'), idmat) then
   begin
-    edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
-    edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
+    edt_Costo.Text := formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+    edt_TCosto.Text := QrySelOPDP.fieldbyname('tipcos').asString;
     Result := true;
   end;
 
-  edtMa.text:=formatvariant(FOP.GetCampi('CosMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtLi.text:=formatvariant(FOP.GetCampi('CosLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtLe.text:=formatvariant(FOP.GetCampi('CosLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtPeMCMa.text:=formatvariant(FOP.GetCampi('PeMcMa'), Perc, 2);
-  edtPeMCLi.text:=formatvariant(FOP.GetCampi('PeMcLi'), Perc, 2);
-  edtPeMCLe.text:=formatvariant(FOP.GetCampi('PeMcLe'), Perc, 2);
-  edtImpMa.text:=formatvariant(FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtImpLi.text:=formatvariant(FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtImpLe.text:=formatvariant(FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtPeUlMC.text:=formatvariant(FOP.GetCampi('PeUlMc'), Perc, 2);
-  edtPeUlSc.text:=formatvariant(FOP.GetCampi('PeUlSc'), Perc, 2);
-  edtImpUl.text:=formatvariant(FOP.GetCampi('RicMc'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtImpSc.text:=formatvariant(FOP.GetCampi('ImpSc'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtMaRic.text:=formatvariant(FOP.GetCampi('CosMa')+FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtLiRic.text:=formatvariant(FOP.GetCampi('CosLi')+FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
-  edtLeRic.text:=formatvariant(FOP.GetCampi('CosLe')+FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtMa.text := formatvariant(FOP.GetCampi('CosMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLi.text := formatvariant(FOP.GetCampi('CosLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLe.text := formatvariant(FOP.GetCampi('CosLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtPeMCMa.text := formatvariant(FOP.GetCampi('PeMcMa'), Perc, 2);
+  edtPeMCLi.text := formatvariant(FOP.GetCampi('PeMcLi'), Perc, 2);
+  edtPeMCLe.text := formatvariant(FOP.GetCampi('PeMcLe'), Perc, 2);
+  edtImpMa.text := formatvariant(FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtImpLi.text := formatvariant(FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtImpLe.text := formatvariant(FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtPeUlMC.text := formatvariant(FOP.GetCampi('PeUlMc'), Perc, 2);
+  edtPeUlSc.text := formatvariant(FOP.GetCampi('PeUlSc'), Perc, 2);
+  edtImpUl.text := formatvariant(FOP.GetCampi('RicMc'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtImpSc.text := formatvariant(FOP.GetCampi('ImpSc'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtMaRic.text := formatvariant(FOP.GetCampi('CosMa') + FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLiRic.text := formatvariant(FOP.GetCampi('CosLi') + FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
+  edtLeRic.text := formatvariant(FOP.GetCampi('CosLe') + FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
   {if zeroifnull(extractvariant(Lab_Qta.caption, importo))<>0 then begin
     edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
     edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
@@ -2248,27 +2339,28 @@ end;
 
 procedure TFrmGstPI.BtnCopiaClick(Sender: TObject);
 var
-  TmpTab :TCSETable;
-  FDefs:TFieldDefs;
-  IDefs:TIndexDefs;
+  TmpTab: TCSETable;
+  FDefs: TFieldDefs;
+  IDefs: TIndexDefs;
   QryTmp: TCSEQuery;
   Esiste: Boolean;
   Ciclo: integer;
 begin
-  Esiste:=True;
-  QryTmp:=TCSEQuery.Create(nil);
+  Esiste := True;
+  QryTmp := TCSEQuery.Create(nil);
   try
     QryTmp.DataBaseName := Azienda.DataBaseName;
     QryTmp.sql.clear;
-    QryTmp.sql.add('delete from '+NtabtmpCopia);
+    QryTmp.sql.add('delete from ' + NtabtmpCopia);
     try
       QryTmp.execsql;
     except
-      Esiste:=False;
+      Esiste := False;
     end;
-    if not Esiste then begin
-      TmpTab := TCSETable.Create( nil );
-      Try
+    if not Esiste then
+    begin
+      TmpTab := TCSETable.Create(nil);
+      try
         QryTmp.sql.clear;
         QryTmp.Sql.Add('Select * From ext_pialtatg Where ID=0');  // Non seleziona nulla per evitare tempi inutili
         QryTmp.Open;
@@ -2280,26 +2372,26 @@ begin
         FDefs.Clear;
 
         // copio la struttura di fatrig a cui aggiunger� altri campi
-        For Ciclo := 0 To ( QryTmp.FieldDefs.Count -1 ) Do
-        Begin
-           With QryTmp.FieldDefs[ciclo] Do
-           Begin
+        for Ciclo := 0 to (QryTmp.FieldDefs.Count - 1) do
+        begin
+          with QryTmp.FieldDefs[Ciclo] do
+          begin
              // If (UpperCase(Name) <> 'ID') Then
-               FDefs.Add( Name, DataType, Size, False );
-           End;
-        End;
+            FDefs.Add(Name, DataType, Size, False);
+          end;
+        end;
 
         // Creazione Indici
         IDefs := TmpTab.IndexDefs;
         IDefs.Clear;
 
         CreateTableAppStd(Azienda, NtabtmpCopia, FDefs, IDefs, False);
-      Finally
+      finally
         TmpTab.Free;
-      End;
+      end;
     end;
     QryTmp.sql.clear;
-    QryTmp.sql.add('insert into '+NtabtmpCopia+' select * from ext_pialtatg Where ID='+inttostr(ext_pialtatg.campi.id));
+    QryTmp.sql.add('insert into ' + NtabtmpCopia + ' select * from ext_pialtatg Where ID=' + inttostr(ext_pialtatg.campi.id));
     QryTmp.execsql;
   finally
     QryTmp.free;
@@ -2312,51 +2404,53 @@ var
   tmp: string;
   i: Integer;
 begin
-  QryTmp:=TCSEQuery.Create(nil);
+  QryTmp := TCSEQuery.Create(nil);
   try
     QryTmp.DataBaseName := Azienda.DataBaseName;
     QryTmp.sql.clear;
-    QryTmp.sql.add('select tmp.*, f.idlav from '+NtabtmpCopia+' tmp '+
-                   'left outer join opsdlfas f on f.id=tmp.idopsdlfas');
+    QryTmp.sql.add('select tmp.*, f.idlav from ' + NtabtmpCopia + ' tmp ' +
+        'left outer join opsdlfas f on f.id=tmp.idopsdlfas');
     QryTmp.open;
-    if not QryTmp.isempty then begin
-      F2Materiale.keyvalue:=QryTmp.fieldbyname('idmateriale').asinteger;
-      F2Lav.keyvalue:=QryTmp.fieldbyname('idlav').asinteger;
+    if not QryTmp.isempty then
+    begin
+      F2Materiale.keyvalue := QryTmp.fieldbyname('idmateriale').asinteger;
+      F2Lav.keyvalue := QryTmp.fieldbyname('idlav').asinteger;
       //  Impostati nella LeggiMateriale
       //  Edt_SpazioRall.text:= FormatVariant(QryTmp.fieldbyname('spaziorall').asFloat, Quantita, 2);
       //  Edt_Rall.text:=FormatVariant(QryTmp.fieldbyname('percrall').asFloat, Perc, 2);
       //  Edt_Fmmmin.text:=FormatVariant(QryTmp.fieldbyname('dimfor').asFloat, Quantita, 2);
       //  Edt_TForat.text:=FormatVariant(QryTmp.fieldbyname('tforat').asFloat*(24*60*60), Quantita, 0);  //  � espresso in secondi
       //  Edt_TAttr.text:=FormatVariant(SecCToSecS(QryTmp.fieldbyname('tattr').asFloat*(24*60)), Quantita, 2);   11.05.04  lo incollo dopo
-      Edt_NProf.text:=FormatVariant(QryTmp.fieldbyname('nprof').asFloat, Quantita, 0);
-      Edt_NSpig.text:=FormatVariant(QryTmp.fieldbyname('nspig').asFloat, Quantita, 0);
-      edt_Altezza.text:=FormatVariant(QryTmp.fieldbyname('lastraalt').asFloat, Quantita, 2);
-      edt_Lunghezza.text:=FormatVariant(QryTmp.fieldbyname('lastralun').asFloat, Quantita, 2);
-      edt_NLastre.text:=FormatVariant(QryTmp.fieldbyname('nlastre').asFloat, Quantita, 0);
-      Edt_PezziLastra.text:=FormatVariant(QryTmp.fieldbyname('pezzixlastra').asFloat, Quantita, 0);
-      Edt_SvilLin.text:=FormatVariant(QryTmp.fieldbyname('svillin').asFloat, Quantita, 2);
-      edt_SvilCerchi.text:=FormatVariant(QryTmp.fieldbyname('svilcer').asFloat, Quantita, 2);
-      tmp:=QryTmp.fieldbyname('sviluppo').asstring;
-      for i:=1 to SG_CSvil.rowcount do begin
-        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3))<>'' then
-          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3)))<>0 then
-            SG_CSvil.Cells[0, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3)), Quantita, 2);
-        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1))<>'' then
-          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)))<>0 then
-            SG_CSvil.Cells[1, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)), Quantita, 0);
-        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2))<>'' then
-          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)))<>0 then
-            SG_CSvil.Cells[2, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)), Quantita, 2);
+      Edt_NProf.text := FormatVariant(QryTmp.fieldbyname('nprof').asFloat, Quantita, 0);
+      Edt_NSpig.text := FormatVariant(QryTmp.fieldbyname('nspig').asFloat, Quantita, 0);
+      edt_Altezza.text := FormatVariant(QryTmp.fieldbyname('lastraalt').asFloat, Quantita, 2);
+      edt_Lunghezza.text := FormatVariant(QryTmp.fieldbyname('lastralun').asFloat, Quantita, 2);
+      edt_NLastre.text := FormatVariant(QryTmp.fieldbyname('nlastre').asFloat, Quantita, 0);
+      Edt_PezziLastra.text := FormatVariant(QryTmp.fieldbyname('pezzixlastra').asFloat, Quantita, 0);
+      Edt_SvilLin.text := FormatVariant(QryTmp.fieldbyname('svillin').asFloat, Quantita, 2);
+      edt_SvilCerchi.text := FormatVariant(QryTmp.fieldbyname('svilcer').asFloat, Quantita, 2);
+      tmp := QryTmp.fieldbyname('sviluppo').asstring;
+      for i := 1 to SG_CSvil.rowcount do
+      begin
+        if trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3)) <> '' then
+          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3))) <> 0 then
+            SG_CSvil.Cells[0, i] := FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i - 1) * 3)), Quantita, 2);
+        if trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 1)) <> '' then
+          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 1))) <> 0 then
+            SG_CSvil.Cells[1, i] := FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 1)), Quantita, 0);
+        if trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 2)) <> '' then
+          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 2))) <> 0 then
+            SG_CSvil.Cells[2, i] := FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i - 1) * 3 + 2)), Quantita, 2);
       end;
 
       LeggiMateriale;
 
-      Edt_SpazioRall.text:= FormatVariant(QryTmp.fieldbyname('spaziorall').asFloat, Quantita, 2);
-      Edt_Rall.text:=FormatVariant(QryTmp.fieldbyname('percrall').asFloat, Perc, 2);
-      Edt_Fmmmin.text:=FormatVariant(QryTmp.fieldbyname('dimfor').asFloat, Quantita, 2);
-      Edt_TForat.text:=FormatVariant(QryTmp.fieldbyname('tforat').asFloat*(24*60*60), Quantita, 0);  //  � espresso in secondi
+      Edt_SpazioRall.text := FormatVariant(QryTmp.fieldbyname('spaziorall').asFloat, Quantita, 2);
+      Edt_Rall.text := FormatVariant(QryTmp.fieldbyname('percrall').asFloat, Perc, 2);
+      Edt_Fmmmin.text := FormatVariant(QryTmp.fieldbyname('dimfor').asFloat, Quantita, 2);
+      Edt_TForat.text := FormatVariant(QryTmp.fieldbyname('tforat').asFloat * (24 * 60 * 60), Quantita, 0);  //  � espresso in secondi
 
-      Edt_TAttr.text:=FormatVariant(SecCToSecS(QryTmp.fieldbyname('tattr').asFloat*(24*60)), Quantita, 2);   //  11.05.04  lo incollo adesso perch� la LeggiMateriale lo va a leggere dalle tabelle
+      Edt_TAttr.text := FormatVariant(SecCToSecS(QryTmp.fieldbyname('tattr').asFloat * (24 * 60)), Quantita, 2);   //  11.05.04  lo incollo adesso perch� la LeggiMateriale lo va a leggere dalle tabelle
       CalcolaTempo;
     end;
   finally
@@ -2370,13 +2464,13 @@ var
   OrCos1, OrCos2, OrCos3, OrCos4, OrCos5, tmpOrdVal: string;
 begin
 
-  OrCos1       := GetParDef('PIOrCos1', Azienda.databasename);
-  OrCos2       := GetParDef('PIOrCos2', Azienda.databasename);
-  OrCos3       := GetParDef('PIOrCos3', Azienda.databasename);
-  OrCos4       := GetParDef('PIOrCos4', Azienda.databasename);
-  OrCos5       := GetParDef('PIOrCos5', Azienda.databasename);
+  OrCos1 := GetParDef('PIOrCos1', Azienda.databasename);
+  OrCos2 := GetParDef('PIOrCos2', Azienda.databasename);
+  OrCos3 := GetParDef('PIOrCos3', Azienda.databasename);
+  OrCos4 := GetParDef('PIOrCos4', Azienda.databasename);
+  OrCos5 := GetParDef('PIOrCos5', Azienda.databasename);
 
-  tmpOrdVal:='';
+  tmpOrdVal := '';
   if OrCos1 <> '' then
     tmpOrdVal := tmpOrdVal + OrCos1 + ';';
   if OrCos2 <> '' then
@@ -2424,10 +2518,11 @@ end;
 
 procedure TFrmGstPI.edt_CostoKeyPress(Sender: TObject; var Key: WideChar);
 begin
-  if sender is tedit then begin
-    CheckImporto(Key, tedit(sender).text);
+  if Sender is tedit then
+  begin
+    CheckImporto(Key, tedit(Sender).text);
   end;
-  edt_TCosto.text:='';
+  edt_TCosto.text := '';
 end;
 
 procedure TFrmGstPI.BtnAggOVClick(Sender: TObject);
@@ -2435,40 +2530,41 @@ begin
   OpenPI := 0;
   SalvaPI();
 
-  AskAggPrezzoComRig:=1;  //  l'utente desidera aggiornare la commessa
+  AskAggPrezzoComRig := 1;  //  l'utente desidera aggiornare la commessa
   QryStorico.Close();
   AggOPTESDatiCont;
   Close();
 end;
 
 procedure TFrmGstPI.AggiornaPesi(IdOpTes, IdArtico: Integer);
-var QryArt: TCSEQuery;
+var
+  QryArt: TCSEQuery;
 begin
   // SF...31/07/2007 : Estraggo il peso unitario e totale
-  QryArt:=TCSEQuery.Create(nil);
+  QryArt := TCSEQuery.Create(nil);
   QryArt.DataBaseName := Azienda.DataBaseName;
   try // finally
-    if (IdOpTes=0) or (IdArtico=0) then
+    if (IdOpTes = 0) or (IdArtico = 0) then
       exit;
 
     QryArt.sql.clear;
-    QryArt.sql.Text:= 'select sum(dp.qtimco) qtimco, t.QtaOP '+
-                      'from opdp dp '+
-                      'inner join OpTes t on t.id=dp.IdOpTes '+
-                      'where (dp.idoptes= '+CS_KeyValueTo_SqlStr(IdOpTes)+') '+
-                        'and (dp.idartico='+CS_KeyValueTo_SqlStr(IdArtico)+') '+
-                      'Group by t.QtaOP ';
+    QryArt.sql.Text := 'select sum(dp.qtimco) qtimco, t.QtaOP ' +
+      'from opdp dp ' +
+      'inner join OpTes t on t.id=dp.IdOpTes ' +
+      'where (dp.idoptes= ' + CS_KeyValueTo_SqlStr(IdOpTes) + ') ' +
+      'and (dp.idartico=' + CS_KeyValueTo_SqlStr(IdArtico) + ') ' +
+      'Group by t.QtaOP ';
     QryArt.open;
 
     try
-      lblPesoUni.Caption:=trim(formatvariant((QryArt.fieldbyname('QtImCo').AsFloat/QryArt.fieldbyname('QtaOP').AsFloat), Quantita));
+      lblPesoUni.Caption := trim(formatvariant((QryArt.fieldbyname('QtImCo').AsFloat / QryArt.fieldbyname('QtaOP').AsFloat), Quantita));
     except
-      lblPesoUni.Caption:='0';
+      lblPesoUni.Caption := '0';
     end;
     try
-      lblPesoTot.Caption:=trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
+      lblPesoTot.Caption := trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
     except
-      lblPesoTot.Caption:='0';
+      lblPesoTot.Caption := '0';
     end;
   finally
     FreeAndNil(QryArt);
@@ -2477,15 +2573,16 @@ end;
 // -----------------------------------------------------------------------------
 //  Caricamento dati file ini
 // -----------------------------------------------------------------------------
+
 function TFrmGstPI.LeggiFileIni: Boolean;
 var
-  sMsg : String;
+  sMsg: string;
 begin
-  Result  := true;
-  FileIni := TCSFileCfg.Create(ExtractFilePath(Glo.IniGenerale)+NOME_FILE_INI);
+  Result := true;
+  FileIni := TCSFileCfg.Create(ExtractFilePath(Glo.IniGenerale) + NOME_FILE_INI);
   try
     try
-      sCausali := FileIni.ReadString ('PrevInd', 'StrCauMov', '');
+      sCausali := FileIni.ReadString('PrevInd', 'StrCauMov', '');
       if (sCausali = '') then
       begin
         sMsg := 'Chiave [StrCauMov] non specificata nel file ini';
@@ -2496,8 +2593,8 @@ begin
       begin
         Result := false;
         Application.MessageBox(PChar(E.message),
-                               PChar(APPTITLE),
-                               MB_ICONERROR + MB_OK);
+            PChar(APPTITLE),
+            MB_ICONERROR + MB_OK);
       end;
     end; // end try...except
   finally
@@ -2507,10 +2604,10 @@ end;
 
 function TFrmGstPI.SalvaFileIni;
 var
-  sChiave : String;
+  sChiave: string;
 begin
-  Result  := true;
-  FileIni := TCSFileCfg.Create(ExtractFilePath(Glo.IniGenerale)+NOME_FILE_INI);
+  Result := true;
+  FileIni := TCSFileCfg.Create(ExtractFilePath(Glo.IniGenerale) + NOME_FILE_INI);
   try
     try
       sChiave := 'IDlav' + IntToStr(Utente.Id);
@@ -2521,8 +2618,8 @@ begin
       begin
         Result := false;
         Application.MessageBox(PChar(E.message),
-                               PChar(APPTITLE),
-                               MB_ICONERROR + MB_OK);
+            PChar(APPTITLE),
+            MB_ICONERROR + MB_OK);
       end;
     end; // end try...except
   finally
diff --git a/source/PI_Altag_GstPI/OGstPI.pas b/source/PI_Altag_GstPI/OGstPI.pas
index 65cb5ff..31ca589 100644
--- a/source/PI_Altag_GstPI/OGstPI.pas
+++ b/source/PI_Altag_GstPI/OGstPI.pas
@@ -3,143 +3,149 @@ unit OGstPI;
 interface
 
 uses
-  System.SysUtils, S3Registry, cStd, RSQL;
+  System.SysUtils,
+  S3Registry,
+  cStd,
+  RSQL;
 
 const
   CAMPICOUNTEXT_GSTPI = 17;
 
 type
-  TCountext_GstPI = Array[0..(CAMPICOUNTEXT_GSTPI - 1)] of Boolean;
+  TCountext_GstPI = array[0..(CAMPICOUNTEXT_GSTPI - 1)] of Boolean;
 
   TCampiext_GstPI = record
-    id           : Integer;       // PK   O.Identificatore
-    idoptes      : Integer;       // FK   1.Id
-    idprodfin    : Integer;       // FK   2.Id
-    idmateriale  : Integer;       // FK   3.Id
-    spaziorall   : Double;        //      4.
-    percrall     : Double;        //      5.
-    dimfor       : Double;        //      6.
-    tforat       : Double;        //      7.
-    tattr        : Double;        //      8.
-    svillin      : Double;        //      9.
-    svilcer      : Double;        //     10.
-    nprof        : Integer;       //     11.
-    nspig        : Integer;       //     12.
-    lastraalt    : Double;        //     13.
-    lastralun    : Double;        //     14.
-    nlastre      : Integer;       //     15.
-    pezzixlastra : Double;        //     16.
-    sviluppo     : String;//[250];   //     17.
-    idopsdlfas   : Integer;
+    id: Integer;       // PK   O.Identificatore
+    idoptes: Integer;       // FK   1.Id
+    idprodfin: Integer;       // FK   2.Id
+    idmateriale: Integer;       // FK   3.Id
+    spaziorall: Double;        //      4.
+    percrall: Double;        //      5.
+    dimfor: Double;        //      6.
+    tforat: Double;        //      7.
+    tattr: Double;        //      8.
+    svillin: Double;        //      9.
+    svilcer: Double;        //     10.
+    nprof: Integer;       //     11.
+    nspig: Integer;       //     12.
+    lastraalt: Double;        //     13.
+    lastralun: Double;        //     14.
+    nlastre: Integer;       //     15.
+    pezzixlastra: Double;        //     16.
+    sviluppo: string; //[250];   //     17.
+    idopsdlfas: Integer;
   end;
 
-  TExt_GstPI = Class(TOStd)
+  TExt_GstPI = class(TOStd)
     Campi: TCampiext_GstPI;
   private
     { Private declarations }
   protected
-    procedure AssegnaCampi;override;
-    procedure ResetCampi;  override;
+    procedure AssegnaCampi; override;
+    procedure ResetCampi; override;
   public
-    function Insert  : integer; override;
+    function Insert: integer; override;
     function Modifica: boolean; override;
   end;
 
 implementation
 
-uses RNumb;
+uses
+  RNumb;
 
 procedure TExt_GstPI.AssegnaCampi;
 begin
-  with Campi, DM.QrySel do begin
-    Id           := FieldByName('Id').AsInteger;
-    idoptes      := FieldByName('idoptes').asInteger;
-    idprodfin    := FieldByName('idprodfin').asInteger;
-    idmateriale  := FieldByName('idmateriale').asInteger;
-    idopsdlfas   := FieldByName('idopsdlfas').asInteger;
-    spaziorall   := FieldByName('spaziorall').asFloat;
-    percrall     := FieldByName('percrall').asFloat;
-    dimfor       := FieldByName('dimfor').asFloat;
-    tforat       := FieldByName('tforat').asFloat;
-    tattr        := FieldByName('tattr').asFloat;
-    svillin      := FieldByName('svillin').asFloat;
-    svilcer      := FieldByName('svilcer').asFloat;
-    nprof        := FieldByName('nprof').asInteger;
-    nspig        := FieldByName('nspig').asInteger;
-    lastraalt    := FieldByName('lastraalt').asFloat;
-    lastralun    := FieldByName('lastralun').asFloat;
-    nlastre      := FieldByName('nlastre').asInteger;
+  with Campi, DM.QrySel do
+  begin
+    Id := FieldByName('Id').AsInteger;
+    idoptes := FieldByName('idoptes').asInteger;
+    idprodfin := FieldByName('idprodfin').asInteger;
+    idmateriale := FieldByName('idmateriale').asInteger;
+    idopsdlfas := FieldByName('idopsdlfas').asInteger;
+    spaziorall := FieldByName('spaziorall').asFloat;
+    percrall := FieldByName('percrall').asFloat;
+    dimfor := FieldByName('dimfor').asFloat;
+    tforat := FieldByName('tforat').asFloat;
+    tattr := FieldByName('tattr').asFloat;
+    svillin := FieldByName('svillin').asFloat;
+    svilcer := FieldByName('svilcer').asFloat;
+    nprof := FieldByName('nprof').asInteger;
+    nspig := FieldByName('nspig').asInteger;
+    lastraalt := FieldByName('lastraalt').asFloat;
+    lastralun := FieldByName('lastralun').asFloat;
+    nlastre := FieldByName('nlastre').asInteger;
     pezzixlastra := FieldByName('pezzixlastra').asFloat;
-    sviluppo     := FieldByName('sviluppo').asString;
+    sviluppo := FieldByName('sviluppo').asString;
   end;
 end;
 
 procedure TExt_GstPI.ResetCampi;
 begin
-  with Campi do begin
-    Id           := 0;
-    idoptes      := 0;
-    idprodfin    := 0;
-    idmateriale  := 0;
-    idopsdlfas   := 0;
-    spaziorall   := 0;
-    percrall     := 0;
-    dimfor       := 0;
-    tforat       := 0;
-    tattr        := 0;
-    svillin      := 0;
-    svilcer      := 0;
-    nprof        := 0;
-    nspig        := 0;
-    lastraalt    := 0;
-    lastralun    := 0;
-    nlastre      := 0;
+  with Campi do
+  begin
+    Id := 0;
+    idoptes := 0;
+    idprodfin := 0;
+    idmateriale := 0;
+    idopsdlfas := 0;
+    spaziorall := 0;
+    percrall := 0;
+    dimfor := 0;
+    tforat := 0;
+    tattr := 0;
+    svillin := 0;
+    svilcer := 0;
+    nprof := 0;
+    nspig := 0;
+    lastraalt := 0;
+    lastralun := 0;
+    nlastre := 0;
     pezzixlastra := 0;
-    sviluppo     := '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;';// '';
+    sviluppo := '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;'; // '';
   end;
 end;
 
 function TExt_GstPI.Insert: integer;
 begin
-  sql := 'insert into ext_pialtatg ('+
-            'idoptes,'      +
-            'idprodfin,'    +
-            'idmateriale,'  +
-            'idopsdlfas,'   +
-            'spaziorall,'   +
-            'percrall,'     +
-            'dimfor,'       +
-            'tforat,'       +
-            'tattr,'        +
-            'svillin,'      +
-            'svilcer,'      +
-            'nprof,'        +
-            'nspig,'        +
-            'lastraalt,'    +
-            'lastralun,'    +
-            'nlastre,'      +
-            'pezzixlastra,' +
-            'sviluppo)';
+  sql := 'insert into ext_pialtatg (' +
+    'idoptes,' +
+    'idprodfin,' +
+    'idmateriale,' +
+    'idopsdlfas,' +
+    'spaziorall,' +
+    'percrall,' +
+    'dimfor,' +
+    'tforat,' +
+    'tattr,' +
+    'svillin,' +
+    'svilcer,' +
+    'nprof,' +
+    'nspig,' +
+    'lastraalt,' +
+    'lastralun,' +
+    'nlastre,' +
+    'pezzixlastra,' +
+    'sviluppo)';
   sql := sql +
-         'values ('+
-            CS_KeyValueTo_SqlStr(campi.idoptes)                        + ',' +
-            CS_KeyValueTo_SqlStr(campi.idprodfin)                      + ',' +
-            CS_KeyValueTo_SqlStr(campi.idmateriale)                    + ',' +
-            CS_KeyValueTo_SqlStr(campi.idopsdlfas)                     + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall))          + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall))            + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor))              + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat))              + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr))               + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin))             + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer))             + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof))               + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig))               + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt))           + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun))           + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre))             + ',' +
-            CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra))        + ',' +
-            CS_VariantTo_SqlStr(campi.sviluppo)                        + ')';
+    'values (' +
+    CS_KeyValueTo_SqlStr(campi.idoptes) + ',' +
+    CS_KeyValueTo_SqlStr(campi.idprodfin) + ',' +
+    CS_KeyValueTo_SqlStr(campi.idmateriale) + ',' +
+    CS_KeyValueTo_SqlStr(campi.idopsdlfas) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre)) + ',' +
+    CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra)) + ',' +
+    CS_VariantTo_SqlStr(campi.sviluppo) + ')';
 
   result := inherited insert;
   Seek('id', result);
@@ -149,31 +155,32 @@ function TExt_GstPI.Modifica: boolean;
 begin
   // Se l'oggetto non contiene un record valido, invece di un update
   // viene eseguito un insert
-  if not Found then begin
+  if not Found then
+  begin
     result := (insert > 0);       // se riuscito l'insert posso uscire
     exit;
   end;
 
   sql := 'update ext_pialtatg set ' +
-            'idoptes='      + CS_KeyValueTo_SqlStr(campi.idoptes)                        + ',' +
-            'idprodfin='    + CS_KeyValueTo_SqlStr(campi.idprodfin)                      + ',' +
-            'idmateriale='  + CS_KeyValueTo_SqlStr(campi.idmateriale)                    + ',' +
-            'idopsdlfas='   + CS_KeyValueTo_SqlStr(campi.idopsdlfas)                     + ',' +
-            'spaziorall='   + CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall))          + ',' +
-            'percrall='     + CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall))            + ',' +
-            'dimfor='       + CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor))              + ',' +
-            'tforat='       + CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat))              + ',' +
-            'tattr='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr))               + ',' +
-            'svillin='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin))             + ',' +
-            'svilcer='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer))             + ',' +
-            'nprof='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof))               + ',' +
-            'nspig='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig))               + ',' +
-            'lastraalt='    + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt))           + ',' +
-            'lastralun='    + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun))           + ',' +
-            'nlastre='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre))             + ',' +
-            'pezzixlastra=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra))        + ',' +
-            'sviluppo='     + CS_VariantTo_SqlStr(campi.sviluppo)                        +
-         ' where id ='+ IntToStr(campi.id);
+    'idoptes=' + CS_KeyValueTo_SqlStr(campi.idoptes) + ',' +
+    'idprodfin=' + CS_KeyValueTo_SqlStr(campi.idprodfin) + ',' +
+    'idmateriale=' + CS_KeyValueTo_SqlStr(campi.idmateriale) + ',' +
+    'idopsdlfas=' + CS_KeyValueTo_SqlStr(campi.idopsdlfas) + ',' +
+    'spaziorall=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall)) + ',' +
+    'percrall=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall)) + ',' +
+    'dimfor=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor)) + ',' +
+    'tforat=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat)) + ',' +
+    'tattr=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr)) + ',' +
+    'svillin=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin)) + ',' +
+    'svilcer=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer)) + ',' +
+    'nprof=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof)) + ',' +
+    'nspig=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig)) + ',' +
+    'lastraalt=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt)) + ',' +
+    'lastralun=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun)) + ',' +
+    'nlastre=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre)) + ',' +
+    'pezzixlastra=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra)) + ',' +
+    'sviluppo=' + CS_VariantTo_SqlStr(campi.sviluppo) +
+    ' where id =' + IntToStr(campi.id);
 
   result := inherited Modifica;
 end;
@@ -183,4 +190,6 @@ initialization
 
 finalization
   UnRegOggetto('ObjExt_GstPI');
+
 end.
+
diff --git a/source/PI_Altag_GstPI/UGstPI.pas b/source/PI_Altag_GstPI/UGstPI.pas
index 95ddfb8..155c4e2 100644
--- a/source/PI_Altag_GstPI/UGstPI.pas
+++ b/source/PI_Altag_GstPI/UGstPI.pas
@@ -3,45 +3,58 @@ unit UGstPI;
 interface
 
 uses
-  System.Classes, Vcl.Forms, Winapi.Windows, Vcl.ComCtrls, CSETables, CSToolBar, System.SysUtils,
-  S3Registry, S3Plugin, IProduzione, OOrPr, GetRBas, GetRPrd, CSDBFileCfg,
-  UTipiPrd, UtilsArticoli, RNote;
+  System.Classes,
+  Vcl.Forms,
+  Winapi.Windows,
+  Vcl.ComCtrls,
+  CSETables,
+  CSToolBar,
+  System.SysUtils,
+  S3Registry,
+  S3Plugin,
+  IProduzione,
+  OOrPr,
+  GetRBas,
+  GetRPrd,
+  CSDBFileCfg,
+  UTipiPrd,
+  UtilsArticoli,
+  RNote;
 
 type
   TGstPI = class(TCustomPlugIn)
   private
-    bValidaUtente           : Boolean;
-    iAskAggPrezzoComRig     : Integer;
-    sEdtTotale              : String;
+    bValidaUtente: Boolean;
+    iAskAggPrezzoComRig: Integer;
+    sEdtTotale: string;
 //
 //  M.B. 22-04-2011 RI:10242
 //
-    PageControl1            : TPageControl;
-    PnlSpeedBar             : TCSToolBar;
-    btn                     : TCSToolBarButton;
-
-    FOEChangePageControl    : TNotifyEvent;
-    FOEClickbtnPrevInd      : TNotifyEvent;
-    FOEExitedtPrezzo        : TNotifyEvent;
-    FOEChangecbxRiferi1     : TNotifyEvent;
-    FOEdbgrRigheRefreshData : TNotifyEvent;
+    PageControl1: TPageControl;
+    PnlSpeedBar: TCSToolBar;
+    btn: TCSToolBarButton;
+
+    FOEChangePageControl: TNotifyEvent;
+    FOEClickbtnPrevInd: TNotifyEvent;
+    FOEExitedtPrezzo: TNotifyEvent;
+    FOEChangecbxRiferi1: TNotifyEvent;
+    FOEdbgrRigheRefreshData: TNotifyEvent;
 //
 //  M.B. 22-04-2011 RI:10242
 //
 //  Funzioni e/o procedure
 //
-    function CalcolaCoefConv(ACodArtico: String): Double;
-    function GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
-                          AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): String;
+    function CalcolaCoefConv(ACodArtico: string): Double;
+    function GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: string; AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): string;
   published
-    property  OEChangePageControl: TNotifyEvent read FOEChangePageControl write FOEChangePageControl;
-    property  OEClickbtnPrevInd: TNotifyEvent read FOEClickbtnPrevInd write FOEClickbtnPrevInd;
-    property  OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
-    property  OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
-    property  OEdbgrRigheRefreshData: TNotifyEvent read FOEdbgrRigheRefreshData write FOEdbgrRigheRefreshData;
+    property OEChangePageControl: TNotifyEvent read FOEChangePageControl write FOEChangePageControl;
+    property OEClickbtnPrevInd: TNotifyEvent read FOEClickbtnPrevInd write FOEClickbtnPrevInd;
+    property OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
+    property OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
+    property OEdbgrRigheRefreshData: TNotifyEvent read FOEdbgrRigheRefreshData write FOEdbgrRigheRefreshData;
 
     procedure PlugIn_PrevInd;
-    function  BTN_PrevInd(Sender: TObject) : Integer;
+    function BTN_PrevInd(Sender: TObject): Integer;
     procedure PIClickbtnPrevInd(Sender: TObject);   //  cv dalla 2.18 lo vogliono come bottone indipendente
     procedure PIExitedtPrezzo(Sender: TObject);
     procedure PIChangecbxRiferi1(Sender: TObject);
@@ -54,11 +67,11 @@ type
 //
     procedure AttivaPluginPIDT;
     procedure AttivaPluginPIOV;
-    procedure btnTaglioDTOnClick(Sender : TObject);
-    procedure btnTaglioOVOnClick(Sender : TObject);
-    procedure CreaPrevInd(iIdComRig : Integer);
-    procedure VisualizzaPrevInd(iId : Integer);
-    procedure ModificaCommessa(iIdComTes : Integer; iIdComRig : Integer; sUmrPre : String; dQta1 : Double; dQta2 : Double; dQta3 : Double; dPrezzo : Double );
+    procedure btnTaglioDTOnClick(Sender: TObject);
+    procedure btnTaglioOVOnClick(Sender: TObject);
+    procedure CreaPrevInd(iIdComRig: Integer);
+    procedure VisualizzaPrevInd(iId: Integer);
+    procedure ModificaCommessa(iIdComTes: Integer; iIdComRig: Integer; sUmrPre: string; dQta1: Double; dQta2: Double; dQta3: Double; dPrezzo: Double);
   end;
 
 const
@@ -67,23 +80,37 @@ const
 implementation
 
 uses
-  RMiscComp, UCoreUtils, CSTipiCommon, rnUMB, RMisc,
-  Vcl.Controls, Vcl.Dialogs, FGstPI, SMDBGrid, QueryPars, FrmStd, Compf2,
-  RSQL, RString, UCoreTipi, UCoreDB, CSFileCFG,
-  IVendite, FIntCom;
+  RMiscComp,
+  UCoreUtils,
+  CSTipiCommon,
+  rnUMB,
+  RMisc,
+  Vcl.Controls,
+  Vcl.Dialogs,
+  FGstPI,
+  SMDBGrid,
+  QueryPars,
+  FrmStd,
+  Compf2,
+  RSQL,
+  RString,
+  UCoreTipi,
+  UCoreDB,
+  IVendite,
+  FIntCom;
 
 // -----------------------------------------------------------------------------
 //  Funziona di verifica utenti abilitati
 // -----------------------------------------------------------------------------
-function Inside(lista, compare : String):Boolean;
+function Inside(lista, compare: string): Boolean;
 var
-  SL : TStringList;
+  SL: TStringList;
 begin
   Result := False;
   SL := TStringList.create;
   try
     SL.commatext := lista;
-    If SL.indexOf(compare) <> -1 then
+    if SL.indexOf(compare) <> -1 then
       Result := True;
   finally
     FreeAndNil(SL);
@@ -93,10 +120,11 @@ end;
 //  M.B. 22-04-2011 RI:10242
 //  Attivazione plug-in dalla griglia distinte tecnica preventivo industriale
 // -----------------------------------------------------------------------------
+
 procedure TGstPI.AttivaPluginPIDT;
 var
-  PnlSpeedBar : TCSToolBar;
-  btn         : TCSToolBarButton;
+  PnlSpeedBar: TCSToolBar;
+  btn: TCSToolBarButton;
 begin
 //
 // Metto il bottone
@@ -104,12 +132,12 @@ begin
   GetFormComp('ToolBar1', PnlSpeedBar);
   if (Assigned(PnlSpeedBar)) then
   begin
-    btn                   := TCSToolBarButton.Create(nil);
-    btn.Name              := 'btnTaglioDT';
-    btn.Hint              := 'Gestione Taglio';
-    btn.ShowHint          := True;
+    btn := TCSToolBarButton.Create(nil);
+    btn.Name := 'btnTaglioDT';
+    btn.Hint := 'Gestione Taglio';
+    btn.ShowHint := True;
     btn.GlyphLibraryIndex := 334;
-    btn.OnClick           := btnTaglioDTOnClick;
+    btn.OnClick := btnTaglioDTOnClick;
 
     PnlSpeedBar.AddToolBarControl(btn);
   end;
@@ -118,21 +146,22 @@ end;
 //  M.B. 22-04-2011 RI:10242
 //  Attivazione plug-in dalla griglia distinte tecnica preventivo industriale
 // -----------------------------------------------------------------------------
+
 procedure TGstPI.AttivaPluginPIOV;
 begin
 //
 // Metto il bottone
 //
   GetFormComp('PageControl1', PageControl1);
-  GetFormComp('CSToolBar1'  , PnlSpeedBar);
+  GetFormComp('CSToolBar1', PnlSpeedBar);
   if (Assigned(PnlSpeedBar)) then
   begin
-    btn                   := TCSToolBarButton.Create(nil);
-    btn.Name              := 'btnTaglioOV';
-    btn.Hint              := 'Gestione Taglio';
-    btn.ShowHint          := True;
+    btn := TCSToolBarButton.Create(nil);
+    btn.Name := 'btnTaglioOV';
+    btn.Hint := 'Gestione Taglio';
+    btn.ShowHint := True;
     btn.GlyphLibraryIndex := 334;
-    btn.OnClick           := btnTaglioOVOnClick;
+    btn.OnClick := btnTaglioOVOnClick;
 
     PnlSpeedBar.AddToolBarControl(btn);
   end;
@@ -150,64 +179,63 @@ begin
 
   RedirEvent('dbgrRighe', 'OnBeforeRefreshData', 'OEdbgrRigheRefreshData', 'PIdbgrRigheRefreshData');
 //  TFrmIntCom(Owner.Owner).dbgrRighe.RefreshData();
-
 end;
 //  ----------------------------------------------------------------------------
 //  Refresh griglia distinta base
 //  ----------------------------------------------------------------------------
+
 procedure TGstPI.PIdbgrRigheRefreshData(Sender: Tobject);
 var
-  I, K            : Integer;
-  Lista           : TStringList;
-  IniFile         : TCSDbFileCfg;
-  GrdRiDiBa       : TSMDBGrid;
-  QryRiDiBa       : TQueryPars;
-  Section         : String;
-  StrSql          : String;
-  StrLayout       : String;
-  StrWidth        : String;
-  StrFieldName    : String;
-  ColExistsTipoPI : Boolean;
-  ColExistsAnnoPI : Boolean;
-  ColExistsNumPI  : Boolean;
+  I, K: Integer;
+  Lista: TStringList;
+  IniFile: TCSDbFileCfg;
+  GrdRiDiBa: TSMDBGrid;
+  QryRiDiBa: TQueryPars;
+  Section: string;
+  StrSql: string;
+  StrLayout: string;
+  StrWidth: string;
+  StrFieldName: string;
+  ColExistsTipoPI: Boolean;
+  ColExistsAnnoPI: Boolean;
+  ColExistsNumPI: Boolean;
   ColExistsDescrPI: Boolean;
-
 begin
-  GetFormComp('qryRighe' , QryRiDiBa);
+  GetFormComp('qryRighe', QryRiDiBa);
   GetFormComp('dbgrRighe', GrdRiDiBa);
 
   Lista := TStringList.Create;
   try
     StrSql := 'OTES.TIPNUM';
-    if Pos(LowerCase( StrSql + ' TIPNUM_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+    if Pos(LowerCase(StrSql + ' TIPNUM_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
       QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' TIPNUM_PI, ' +
-                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
 
     StrSql := 'OTES.ANNOP';
-    if Pos(LowerCase( StrSql + ' ANNOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+    if Pos(LowerCase(StrSql + ' ANNOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
       QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' ANNOP_PI, ' +
-                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
 
     StrSql := 'OTES.NUMOP';
-    if Pos(LowerCase( StrSql + ' NUMOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+    if Pos(LowerCase(StrSql + ' NUMOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
       QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' NUMOP_PI, ' +
-                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
 
     StrSql := 'OTES.DESCR';
-    if Pos(LowerCase( StrSql + ' DESCR_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+    if Pos(LowerCase(StrSql + ' DESCR_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
       QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' DESCR_PI, ' +
-                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
 
 //    StrSql :=   'LEFT OUTER JOIN OPTES OTES on OTES.IDCOMRIG = CRIG.ID '+
 //                'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID '+
 //                'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID  ';
-    StrSql := 'outer apply '+
-              '(select top 1 otes.numop, otes.annop, otes.tipnum, pdoc.descr '+
-              'from optes otes '+
-              'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID '+
-              'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID  '+
-              'where otes.idcomrig = crig.id '+                                           //LR_CH4221/2025
-              'and pdoc.tipdoc <> ''P'') OTES ';
+    StrSql := 'outer apply ' +
+      '(select top 1 otes.numop, otes.annop, otes.tipnum, pdoc.descr ' +
+      'from optes otes ' +
+      'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID ' +
+      'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID  ' +
+      'where otes.idcomrig = crig.id ' +                                           //LR_CH4221/2025
+        'and pdoc.tipdoc <> ''P'') OTES ';
 
     if Pos(LowerCase(StrSql), LowerCase(QryRiDiBa.Sql.Text)) = 0 then
     begin
@@ -229,7 +257,7 @@ begin
     try
       // SF...03/04/2012 : non leggeva la sessione corretta e quindi non riposizionava le colonne
       //Section   := TFrmIntCom(Owner.Owner).Name + Azienda.Id + '-' + GrdRiDiBa.Name;
-      Section   := UniqueFormName(TFrmIntCom(Owner.Owner).Name) + '-RIGHE-' + Azienda.ID;
+      Section := UniqueFormName(TFrmIntCom(Owner.Owner).Name) + '-RIGHE-' + Azienda.ID;
       // ...SF 03/04/2012
       StrLayout := IniFile.ReadString(Section, 'LAYOUT', '');
       for I := 0 to CS_CountSubStr(StrLayout, ',') do
@@ -243,18 +271,20 @@ begin
 
     ColExistsTipoPI := False;
     ColExistsAnnoPI := False;
-    ColExistsNumPI  := False;
-    ColExistsDescrPI:= False;
+    ColExistsNumPI := False;
+    ColExistsDescrPI := False;
 
     for I := 0 to Lista.Count - 1 do
     begin
       StrFieldName := CS_Sub_Str(CS_Sub_Str(CS_Sub_Str(Copy(Lista.Strings[I], 1, Pos('=', Lista.Strings[I]) - 1), '"', ''), '}', ''), '{', '');
-      StrWidth := CS_Sub_Str(CS_Sub_Str(CS_Sub_Str(Copy(Lista.Strings[I], Pos('=', Lista.Strings[I]) + 1, Length(Lista.Strings[I]) + Pos('=', Lista.Strings[I])), '"', ''), '}', ''), '{', '');
+      StrWidth := CS_Sub_Str(CS_Sub_Str(CS_Sub_Str(Copy(Lista.Strings[I], Pos('=', Lista.Strings[I]) + 1, Length(Lista.Strings[I]) + Pos('=',
+    Lista.Strings[I])), '"', ''), '}', ''), '{', '');
 
       if StrFieldName = 'Tipo PI' then
       begin
         for K := 1 to GrdRiDiBa.Columns.Count do
-          if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then break;
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then
+            break;
 
         if K > GrdRiDiBa.Columns.Count then
         begin
@@ -273,7 +303,8 @@ begin
       if StrFieldName = 'Anno PI' then
       begin
         for K := 1 to GrdRiDiBa.Columns.Count do
-          if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then break;
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then
+            break;
 
         if K > GrdRiDiBa.Columns.Count then
         begin
@@ -292,7 +323,8 @@ begin
       if StrFieldName = 'Num. PI' then
       begin
         for K := 1 to GrdRiDiBa.Columns.Count do
-          if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then break;
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then
+            break;
 
         if K > GrdRiDiBa.Columns.Count then
         begin
@@ -311,7 +343,8 @@ begin
       if StrFieldName = 'Descr. PI' then
       begin
         for K := 1 to GrdRiDiBa.Columns.Count do
-          if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then break;
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then
+            break;
 
         if K > GrdRiDiBa.Columns.Count then
         begin
@@ -333,7 +366,8 @@ begin
     if not ColExistsTipoPI then
     begin
       for K := 1 to GrdRiDiBa.Columns.Count do
-        if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then break;
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then
+          break;
 
       if K > GrdRiDiBa.Columns.Count then
       begin
@@ -351,7 +385,8 @@ begin
     if not ColExistsAnnoPI then
     begin
       for K := 1 to GrdRiDiBa.Columns.Count do
-        if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then break;
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then
+          break;
 
       if K > GrdRiDiBa.Columns.Count then
       begin
@@ -369,7 +404,8 @@ begin
     if not ColExistsNumPI then
     begin
       for K := 1 to GrdRiDiBa.Columns.Count do
-        if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then break;
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then
+          break;
 
       if K > GrdRiDiBa.Columns.Count then
       begin
@@ -387,7 +423,8 @@ begin
     if not ColExistsDescrPI then
     begin
       for K := 1 to GrdRiDiBa.Columns.Count do
-        if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then break;
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then
+          break;
 
       if K > GrdRiDiBa.Columns.Count then
       begin
@@ -401,18 +438,21 @@ begin
         end;
       end;
     end;
-
   finally
-    if Assigned(Lista) then Lista.free;
-    if Assigned(OEdbgrRigheRefreshData) then OEdbgrRigheRefreshData(Sender);
+    if Assigned(Lista) then
+      Lista.free;
+    if Assigned(OEdbgrRigheRefreshData) then
+      OEdbgrRigheRefreshData(Sender);
   end; // end try...finally
 end;
 //  ----------------------------------------------------------------------------
 //  Gestione stato del pulsante
 //  ----------------------------------------------------------------------------
+
 procedure TGstPI.PIChangePageControl(sender: TObject);
 begin
-  if Assigned(OEChangePageControl) then OEChangePageControl(Sender);
+  if Assigned(OEChangePageControl) then
+    OEChangePageControl(sender);
 
   if (PageControl1.ActivePageIndex = 1) then
   begin
@@ -426,25 +466,26 @@ end;
 //  ----------------------------------------------------------------------------
 //  Alla pressione del tasto
 //  ----------------------------------------------------------------------------
+
 procedure TGstPI.btnTaglioDTOnClick(Sender: TObject);
 var
-  iIdPIDT   : Integer;
-  iIdComRig : Integer;
-  GrdPIDT   : TSMDBGrid;
-  QryTmp    : TCSEQuery;
+  iIdPIDT: Integer;
+  iIdComRig: Integer;
+  GrdPIDT: TSMDBGrid;
+  QryTmp: TCSEQuery;
 begin
   GetFormComp('grPIDT', GrdPIDT);
   iIdPIDT := GrdPIDT.DataSource.Dataset.FieldByName('ID').AsInteger;
 
-  QryTmp:=TCSEQuery.Create(nil);
+  QryTmp := TCSEQuery.Create(nil);
   try
     QryTmp.DataBaseName := Azienda.DataBaseName;
     QryTmp.Sql.Clear;
-    QryTmp.Sql.Add('select op.ID, op.IDCOMRIG, cm.QTA1,cm.QTA2,cm.QTA3,cm.IDARTICO,cm.PREZZO from OPDT as dt '+
-                      'inner join OPTES as op on op.ID=dt.IDOPTES '+
-                      'inner join COMRIG as cm on cm.ID=op.IDCOMRIG '+
-                      'inner join TIPIDOC as td on op.idtipidoc=td.id '+
-                   'where td.tipdoc=''D'' and dt.ID='+IntToStr(iIdPIDT));
+    QryTmp.Sql.Add('select op.ID, op.IDCOMRIG, cm.QTA1,cm.QTA2,cm.QTA3,cm.IDARTICO,cm.PREZZO from OPDT as dt ' +
+        'inner join OPTES as op on op.ID=dt.IDOPTES ' +
+        'inner join COMRIG as cm on cm.ID=op.IDCOMRIG ' +
+        'inner join TIPIDOC as td on op.idtipidoc=td.id ' +
+        'where td.tipdoc=''D'' and dt.ID=' + IntToStr(iIdPIDT));
     QryTmp.Open;
     if not QryTmp.IsEmpty then
     begin
@@ -460,24 +501,25 @@ end;
 //  ----------------------------------------------------------------------------
 //  Alla pressione del tasto
 //  ----------------------------------------------------------------------------
+
 procedure TGstPI.btnTaglioOVOnClick(Sender: TObject);
 var
-  iIdPIDT   : Integer;
-  iIdComRig : Integer;
-  GrdPIOV   : TSMDBGrid;
-  QryTmp    : TCSEQuery;
+  iIdPIDT: Integer;
+  iIdComRig: Integer;
+  GrdPIOV: TSMDBGrid;
+  QryTmp: TCSEQuery;
 begin
   GetFormComp('dbgrRighe', GrdPIOV);
   iIdPIDT := GrdPIOV.DataSource.Dataset.FieldByName('RIF_ID').AsInteger;
 
-  QryTmp:=TCSEQuery.Create(nil);
+  QryTmp := TCSEQuery.Create(nil);
   try
     QryTmp.DataBaseName := Azienda.DataBaseName;
     QryTmp.Sql.Clear;
     QryTmp.Sql.Add('select optes.ID from COMRIG as cm ' +
-                      'inner join optes on cm.id=optes.idcomrig ' +
-                      'inner join ext_pialtatg on ext_pialtatg.idoptes=optes.id ' +
-                   'where cm.ID='+IntToStr(iIdPIDT));
+        'inner join optes on cm.id=optes.idcomrig ' +
+        'inner join ext_pialtatg on ext_pialtatg.idoptes=optes.id ' +
+        'where cm.ID=' + IntToStr(iIdPIDT));
     QryTmp.Open;
     if not QryTmp.IsEmpty then
     begin
@@ -486,9 +528,9 @@ begin
     end
     else
     begin
-      Application.MessageBox( PChar( 'Nessun PI associato alla riga corrente.' ),
-                              PChar( APPTITLE ),
-                              MB_OK + MB_ICONINFORMATION );
+      Application.MessageBox(PChar('Nessun PI associato alla riga corrente.'),
+          PChar(APPTITLE),
+          MB_OK + MB_ICONINFORMATION);
     end;
   finally
     QryTmp.free;
@@ -497,10 +539,11 @@ end;
 //  ----------------------------------------------------------------------------
 //  Aggiorno il P.I:
 //  ----------------------------------------------------------------------------
-procedure TGstPI.VisualizzaPrevInd(iId : Integer);
+
+procedure TGstPI.VisualizzaPrevInd(iId: Integer);
 var
-  livello    : Tlivello;
-  FrmPrdOPDT : IFrmPrdStd;
+  livello: Tlivello;
+  FrmPrdOPDT: IFrmPrdStd;
 begin
   livello := liAll;
   FrmPrdOPDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', iId, livello) as IFrmPrdStd;
@@ -555,46 +598,47 @@ end;
 //  ----------------------------------------------------------------------------
 //  Aggiorno il P.I:
 //  ----------------------------------------------------------------------------
-procedure TGstPI.CreaPrevInd(iIdComRig : Integer);
+
+procedure TGstPI.CreaPrevInd(iIdComRig: Integer);
 var
-  iIdComTes : Integer;
-  sUmrPre   : String;
-  dQta1     : Double;
-  dQta2     : Double;
-  dQta3     : Double;
-  dPrezzo   : Double;
-  QryTmp    : TCSEQuery;
+  iIdComTes: Integer;
+  sUmrPre: string;
+  dQta1: Double;
+  dQta2: Double;
+  dQta3: Double;
+  dPrezzo: Double;
+  QryTmp: TCSEQuery;
   FrmPrevInd: TFrmGstPI;
 begin
-  FrmPrevInd:=TFrmGstPI.create(nil);
+  FrmPrevInd := TFrmGstPI.create(nil);
   try
-    FrmPrevInd.Livello  := liAll;
+    FrmPrevInd.Livello := liAll;
     FrmPrevInd.Idcomrig := iIdComRig;
     FrmPrevInd.bSolaLettura := true;
     FrmPrevInd.ShowModal;
 //
 //  Riportiamo i dati dal preventivo alla riga se l'utente � abilitato
 //
-    if FrmPrevInd.ValidaUtente and ((FrmPrevInd.AskAggPrezzoComRig=2) or ((FrmPrevInd.AskAggPrezzoComRig=1) and
-           (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
+    if FrmPrevInd.ValidaUtente and ((FrmPrevInd.AskAggPrezzoComRig = 2) or ((FrmPrevInd.AskAggPrezzoComRig = 1) and
+      (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes))) then
     begin
-      QryTmp:=TCSEQuery.Create(nil);
+      QryTmp := TCSEQuery.Create(nil);
       try
         QryTmp.DataBaseName := Azienda.DataBaseName;
         QryTmp.Sql.Clear;
-        QryTmp.Sql.Add('select c.ID, c.IDCOMTES, a.UMRPRE, c.PREZZO, c.QTA1, c.QTA2, c.Qta3 from COMRIG as c '+
-                          'inner join LOTSER as l on l.ID=c.IDARTICO '+
-                          'inner join ARTICO as a on a.ID=l.IDARTICO '+
-                       'where c.ID='+IntToStr(iIdComRig));
+        QryTmp.Sql.Add('select c.ID, c.IDCOMTES, a.UMRPRE, c.PREZZO, c.QTA1, c.QTA2, c.Qta3 from COMRIG as c ' +
+            'inner join LOTSER as l on l.ID=c.IDARTICO ' +
+            'inner join ARTICO as a on a.ID=l.IDARTICO ' +
+            'where c.ID=' + IntToStr(iIdComRig));
         QryTmp.Open;
         if not QryTmp.IsEmpty then
         begin
           iIdComTes := QryTmp.FieldByName('IDCOMTES').AsInteger;
-          sUmrPre   := QryTmp.FieldByName('UMRPRE').AsString;
-          dQta1     := QryTmp.FieldByName('QTA1').AsFloat;
-          dQta2     := QryTmp.FieldByName('QTA2').AsFloat;
-          dQta3     := QryTmp.FieldByName('QTA3').AsFloat;
-          dPrezzo   := QryTmp.FieldByName('PREZZO').AsFloat;
+          sUmrPre := QryTmp.FieldByName('UMRPRE').AsString;
+          dQta1 := QryTmp.FieldByName('QTA1').AsFloat;
+          dQta2 := QryTmp.FieldByName('QTA2').AsFloat;
+          dQta3 := QryTmp.FieldByName('QTA3').AsFloat;
+          dPrezzo := QryTmp.FieldByName('PREZZO').AsFloat;
 
           ModificaCommessa(iIdComTes, iIdComRig, sUmrPre, dQta1, dQta2, dQta3, dPrezzo);
         end;
@@ -609,18 +653,13 @@ end;
 //  ----------------------------------------------------------------------------
 //  Modifico i dati della commessa che ha generato il preventivo industriale
 //  ----------------------------------------------------------------------------
-procedure TGstPI.ModificaCommessa(iIdComTes : Integer;
-                                    iIdComRig : Integer;
-                                    sUmrPre   : String ;
-                                    dQta1     : Double ;
-                                    dQta2     : Double ;
-                                    dQta3     : Double ;
-                                    dPrezzo   : Double );
+
+procedure TGstPI.ModificaCommessa(iIdComTes: Integer; iIdComRig: Integer; sUmrPre: string; dQta1: Double; dQta2: Double; dQta3: Double; dPrezzo: Double);
 var
-  InTrans : Boolean;
-  OComRig : IComRigStd;
-  OComTes : IComTesStd;
-  QryPar  : TCSEQuery;
+  InTrans: Boolean;
+  OComRig: IComRigStd;
+  OComTes: IComTesStd;
+  QryPar: TCSEQuery;
 begin
 
   InTrans := false;
@@ -637,39 +676,39 @@ begin
     Exit;
   end;
 
-  QryPar:= TCSEQuery.Create(nil);
-  QryPar.DatabaseName:= DBExec.DatabaseName;
+  QryPar := TCSEQuery.Create(nil);
+  QryPar.DatabaseName := DBExec.DatabaseName;
   try
-    OComTes.Seek('Id',iIdComTes);
+    OComTes.Seek('Id', iIdComTes);
     if not OComTes.Found then
     begin
       MessageDlg('Non � stata trovata una commessa per questa riga.', mtWarning, [mbOK], 0);
       Exit;
     end;
 
-    OComRig.Seek('Id',iIdComRig);
+    OComRig.Seek('Id', iIdComRig);
     if not OComRig.Found then
     begin
       MessageDlg('Non � stata trovata una commessa per questa riga.', mtWarning, [mbOK], 0);
       Exit;
     end;
 
-    InTrans:= DBExec.InTransaction;
+    InTrans := DBExec.InTransaction;
     if not InTrans then
       DBExec.CSStartTransaction;
 
-    QryPar.sql.Text:= 'Select cli.SpeInc, cli.SpeBol, cli.AddBollo '+
-                        'from ComTes t '+
-                          'inner join clienti cli on t.idcliente=cli.id '+
-                        'where (t.id= '+ CS_KeyValueTo_SqlStr(iIdComTes) +') ';
+    QryPar.sql.Text := 'Select cli.SpeInc, cli.SpeBol, cli.AddBollo ' +
+      'from ComTes t ' +
+      'inner join clienti cli on t.idcliente=cli.id ' +
+      'where (t.id= ' + CS_KeyValueTo_SqlStr(iIdComTes) + ') ';
     QryPar.Open;
 
-    if ( ((sUmrPre = '') or (sUmrPre = 'I')) and (dQta3 <> 0) ) then
-      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo))/dQta3
+    if (((sUmrPre = '') or (sUmrPre = 'I')) and (dQta3 <> 0)) then
+      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo)) / dQta3
     else if (sUmrPre = 'M') and (dQta2 <> 0) then
-      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo))/dQta2
+      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo)) / dQta2
     else if (sUmrPre = 'V') and (dQta1 <> 0) then
-      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo))/dQta1
+      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo)) / dQta1
     else
       dPrezzo := 0.0;
 
@@ -678,16 +717,16 @@ begin
     OComRig.Modifica;
     OComRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro, Azienda.RValutaSi.DecContEuro);
 
-    OComtes.RicalcolaTotali( (QryPar.FieldByName('SpeInc').AsInteger   = -1 ),
-                             (QryPar.FieldByName('SpeBol').AsInteger   = -1 ),
-                             (QryPar.FieldByName('AddBollo').AsInteger = -1));
+    OComTes.RicalcolaTotali((QryPar.FieldByName('SpeInc').AsInteger = -1),
+        (QryPar.FieldByName('SpeBol').AsInteger = -1),
+        (QryPar.FieldByName('AddBollo').AsInteger = -1));
 
-    OComtes.Modifica;
+    OComTes.Modifica;
 
     if not InTrans then
       DBExec.Commit;
-
-  except on e: Exception do
+  except
+    on e: Exception do
     begin
       if not InTrans then
         DBExec.RollBack;
@@ -712,18 +751,20 @@ begin
   RedirEvent('btnPrevInd', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');}
   // RedirEvent('CkbFatDir', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');
   RedirEvent('btnPrevInd', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');
-  RedirEvent('edtPrezzo', 'Onexit',  'OEExitedtPrezzo',   'PIExitedtPrezzo');        //  cos� mi aggiorna i prezzi della riga
-  RedirEvent('cbxRiferi1','OnChange','OEChangecbxRiferi1','PIChangecbxRiferi1');     //  cos� mi aggiorna lo stato della riga
+  RedirEvent('edtPrezzo', 'Onexit', 'OEExitedtPrezzo', 'PIExitedtPrezzo');        //  cos� mi aggiorna i prezzi della riga
+  RedirEvent('cbxRiferi1', 'OnChange', 'OEChangecbxRiferi1', 'PIChangecbxRiferi1');     //  cos� mi aggiorna lo stato della riga
 end;
 
 procedure TGstPI.PIExitedtPrezzo(Sender: TObject);
 begin
-  if Assigned(OEExitedtPrezzo) then OEExitedtPrezzo(Sender);
+  if Assigned(OEExitedtPrezzo) then
+    OEExitedtPrezzo(Sender);
 end;
 
 procedure TGstPI.PIChangecbxRiferi1(Sender: TObject);
 begin
-  if Assigned(OEChangecbxRiferi1) then OEChangecbxRiferi1(Sender);
+  if Assigned(OEChangecbxRiferi1) then
+    OEChangecbxRiferi1(Sender);
 end;
 
 {
@@ -861,51 +902,50 @@ begin
 end;
 }
 
-
 procedure TGstPI.PIClickbtnPrevInd(Sender: TObject);
 begin
   BTN_PrevInd(Sender);
 end;
 
-function TGstPI.BTN_PrevInd(Sender: TObject) : Integer;
+function TGstPI.BTN_PrevInd(Sender: TObject): Integer;
 var
-  bModifica     : Boolean;
-  Ritorno       : Integer;
-  OpenPi        : Integer;
-  QryTmp        : TCSEQuery;
-  piDbgrComRig  : TSMDBGrid;
-  piEdtQta1     : Tget;
-  piEdtQta2     : Tget;
-  piEdtQta3     : Tget;
-  piEdtPrezzo   : Tget;
-  piF2IdArtico  : TF2;
-  FrmPrevInd    : TFrmGstPI;
+  bModifica: Boolean;
+  Ritorno: Integer;
+  OpenPi: Integer;
+  QryTmp: TCSEQuery;
+  piDbgrComRig: TSMDBGrid;
+  piEdtQta1: Tget;
+  piEdtQta2: Tget;
+  piEdtQta3: Tget;
+  piEdtPrezzo: Tget;
+  piF2IdArtico: TF2;
+  FrmPrevInd: TFrmGstPI;
 begin
   Result := 0;
 
   GetFormComp('dbgrComRig', piDbgrComRig);
   GetFormComp('F2IdArtico', piF2IdArtico);
-  GetFormComp('EdtQta1',    piEdtQta1);
-  GetFormComp('EdtQta2',    piEdtQta2);
-  GetFormComp('EdtQta3',    piEdtQta3);
-  GetFormComp('edtPrezzo',  piEdtPrezzo);
+  GetFormComp('EdtQta1', piEdtQta1);
+  GetFormComp('EdtQta2', piEdtQta2);
+  GetFormComp('EdtQta3', piEdtQta3);
+  GetFormComp('edtPrezzo', piEdtPrezzo);
   if (not assigned(piDbgrComRig)) or
-     (not assigned(piF2IdArtico)) or
-     (not assigned(piEdtQta1)) or
-     (not assigned(piEdtQta2)) or
-     (not assigned(piEdtQta3)) or
-     (not assigned(piEdtPrezzo)) then
+    (not assigned(piF2IdArtico)) or
+    (not assigned(piEdtQta1)) or
+    (not assigned(piEdtQta2)) or
+    (not assigned(piEdtQta3)) or
+    (not assigned(piEdtPrezzo)) then
   begin
     ShowMessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PIClickbtnPrevInd).');
   end
   else
   begin
-    QryTmp:=TCSEQuery.Create(nil);
+    QryTmp := TCSEQuery.Create(nil);
     try
       QryTmp.DataBaseName := Azienda.DataBaseName;
       QryTmp.Sql.Clear;
-      QryTmp.Sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id '+
-                     'where td.tipdoc=''D'' and o.idcomrig='+inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
+      QryTmp.Sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id ' +
+          'where td.tipdoc=''D'' and o.idcomrig=' + inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
       QryTmp.Open;
 
       bModifica := false;
@@ -918,31 +958,32 @@ begin
         end;
       end;
 
-      if ( (QryTmp.IsEmpty()) or ((QryTmp.IsEmpty() = false) and (bModifica = true)) ) then
+      if ((QryTmp.IsEmpty()) or ((QryTmp.IsEmpty() = false) and (bModifica = true))) then
       begin
-        FrmPrevInd:=TFrmGstPI.create(nil);
+        FrmPrevInd := TFrmGstPI.create(nil);
         try
-          FrmPrevInd.livello:=TFormStd(form).livello;
-          FrmPrevInd.idcomrig:=TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
+          FrmPrevInd.livello := TFormStd(form).livello;
+          FrmPrevInd.idcomrig := TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
           FrmPrevInd.bSolaLettura := false;
           FrmPrevInd.showmodal;
 
-          bValidaUtente       := FrmPrevInd.ValidaUtente();
+          bValidaUtente := FrmPrevInd.ValidaUtente();
           iAskAggPrezzoComRig := FrmPrevInd.AskAggPrezzoComRig;
-          sEdtTotale          := FrmPrevInd.edtTotale.text;
+          sEdtTotale := FrmPrevInd.edtTotale.text;
 
           OpenPi := FrmPrevInd.OpenPI;
           if (OpenPi = 0) then
           begin
-            if bValidaUtente and ((iAskAggPrezzoComRig=2) or ((iAskAggPrezzoComRig=1) and
-                  (Messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
+            if bValidaUtente and ((iAskAggPrezzoComRig = 2) or ((iAskAggPrezzoComRig = 1) and
+              (Messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes))) then
             begin
-              if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
-                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta3.getvalue)
-              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
-                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta2.getvalue)
-              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
-                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta1.getvalue)
+              if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = '') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = 'I')) and
+                (piEdtQta3.getvalue <> 0) then
+                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo)) / piEdtQta3.getvalue)
+              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = 'M') and (piEdtQta2.getvalue <> 0) then
+                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo)) / piEdtQta2.getvalue)
+              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = 'V') and (piEdtQta1.getvalue <> 0) then
+                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo)) / piEdtQta1.getvalue)
               else
                 piEdtPrezzo.settext(0);
 
@@ -952,7 +993,8 @@ begin
           end
           else if (OpenPi = 1) then
           begin
-            if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
+            if Assigned(OEClickbtnPrevInd) then
+              OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
           end;
         finally
           FrmPrevInd.free;
@@ -960,7 +1002,8 @@ begin
       end
       else
       begin
-        if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
+        if Assigned(OEClickbtnPrevInd) then
+          OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
       end;
     finally
       QryTmp.free;
@@ -974,7 +1017,7 @@ var
   I: Integer;
   objOrPr: TOrPr;
   objOPTes: IOrPr;
-  Msg: String;
+  Msg: string;
   Year, Month, Day: Word;
   NewqryRighe: TQueryPars;
   NewdbgrRighe: TSMDBGrid;
@@ -989,14 +1032,14 @@ begin
   begin
     Msg := 'Si desidera generare gli Ordini di Produzione per le righe selezionate?';
     if Application.MessageBox(PChar(Msg),
-                              PChar(Application.Title),
-                              MB_ICONQUESTION + MB_YESNO) = IDYES then
+        PChar(Application.Title),
+        MB_ICONQUESTION + MB_YESNO) = IDYES then
     begin
       // Creazione oggetti qry
       QryNumOP := TCSEQuery.Create(nil);
       QryNumOP.DatabaseName := DBExec.DatabaseName;
-      QryTipiDocOP := TCSEQuery.Create(nil);
-      QryTipiDocOP.DatabaseName := DBExec.DatabaseName;
+      qryTipiDocOP := TCSEQuery.Create(nil);
+      qryTipiDocOP.DatabaseName := DBExec.DatabaseName;
       QryArtExistsDB := TCSEQuery.Create(nil);
       QryArtExistsDB.DatabaseName := DBExec.DatabaseName;
       QryComRigExistsOP := TCSEQuery.Create(nil);
@@ -1010,10 +1053,10 @@ begin
         if not GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, objOPTes) then
         begin
           Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente errore ' +
-                 'durante un errore durante generazione dell''interfaccia "IOrPr".';
+            'durante un errore durante generazione dell''interfaccia "IOrPr".';
           Application.MessageBox(PChar(Msg),
-                                 PChar(Application.Title),
-                                 MB_ICONINFORMATION + MB_OK);
+              PChar(Application.Title),
+              MB_ICONINFORMATION + MB_OK);
           Exit;
         end;
 
@@ -1033,27 +1076,28 @@ begin
 
       // Apertura Transazione
       NewTran := not DBExec.InTransaction;
-      if NewTran then DBExec.CSStartTransaction;
+      if NewTran then
+        DBExec.CSStartTransaction;
       FlagErr := False;
       try
         QryArtExistsDB.Sql.Text := 'SELECT v.Id, v.Idartico FROM VarDB v ' +
-                                   'INNER JOIN Lotser ls ON v.Idartico = ls.Idartico ' +
-                                   'INNER JOIN Artico art ON ls.Idartico = art.Id ' +
-                                   'WHERE (art.codice = :VCodice) AND ' +
-                                         '(ls.Numser = ' + CS_VariantTo_SqlStr(NUMSERDEF) + ') AND ' +
-                                         '(ls.Numlot = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ')';
+          'INNER JOIN Lotser ls ON v.Idartico = ls.Idartico ' +
+          'INNER JOIN Artico art ON ls.Idartico = art.Id ' +
+          'WHERE (art.codice = :VCodice) AND ' +
+          '(ls.Numser = ' + CS_VariantTo_SqlStr(NUMSERDEF) + ') AND ' +
+          '(ls.Numlot = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ')';
         QryArtExistsDB.Prepare;
 
         QryComRigExistsOP.Sql.Text := 'SELECT op.Id FROM Optes op ' +
-                                      'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
-                                      'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
-                                            '(tp.Tipdoc = ''P'')';
+          'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
+          'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
+          '(tp.Tipdoc = ''P'')';
         QryComRigExistsOP.Prepare;
 
         QryComRigExistsPI.Sql.Text := 'SELECT op.Id FROM Optes op ' +
-                                      'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
-                                      'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
-                                            '(tp.Tipdoc = ''D'')';
+          'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
+          'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
+          '(tp.Tipdoc = ''D'')';
         QryComRigExistsPI.Prepare;
 
         // Modifico solo D.d.T selezionati sulla griglia
@@ -1084,17 +1128,17 @@ begin
                 if objOPTes.Found then
                 begin
                   // Determinazione del tipo Documento Ordine di Produzione
-                  QryTipiDocOP.Close;
-                  QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
-                                           'WHERE (Tipdoc = ''P'') ' +
-                                           'ORDER BY Tipnum ASC';
+                  qryTipiDocOP.Close;
+                  qryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
+                    'WHERE (Tipdoc = ''P'') ' +
+                    'ORDER BY Tipnum ASC';
                   try
-                    QryTipiDocOP.Open;
+                    qryTipiDocOP.Open;
                   except
                     on E: Exception do
                     begin
                       Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
-                             'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
+                        'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
                       FlagErr := True;
                       Exit;
                     end;
@@ -1104,16 +1148,16 @@ begin
                   // Determinazione del numero
                   QryNumOP.Close;
                   QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
-                                       'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
-                                             '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
-                                       'GROUP BY Tipnum';
+                    'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(qryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
+                    '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
+                    'GROUP BY Tipnum';
                   try
                     QryNumOP.Open;
                   except
                     on E: Exception do
                     begin
                       Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
-                             'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
+                        'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
                       FlagErr := True;
                       Exit;
                     end;
@@ -1121,21 +1165,20 @@ begin
 
                   // Generazione Ordine di Produzione da Preventivo Industriale
                   Msg := GeneraOPdaPI(objOPTes.CampiObj['Id'],
-                                      QryTipiDocOP.FieldByName('Id').AsInteger,
-                                      Year,
-                                      QryNumOP.FieldByName('Numop').AsInteger,
-                                      QryTipiDocOP.FieldByName('Tipnum').AsString,
-                                      (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
-                                       CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString)),
-                                      NewqryRighe.FieldByName('Rif_Id').AsInteger,
-                                      objOrPr);
+                      qryTipiDocOP.FieldByName('Id').AsInteger,
+                      Year,
+                      QryNumOP.FieldByName('Numop').AsInteger,
+                      qryTipiDocOP.FieldByName('Tipnum').AsString,
+                      (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
+                      CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString)),
+                      NewqryRighe.FieldByName('Rif_Id').AsInteger,
+                      objOrPr);
                   if Msg <> '' then
                   begin
                     FlagErr := True;
                     Exit;
                   end
                 end;
-
               end
               else
               begin
@@ -1150,17 +1193,17 @@ begin
                   Msg := '';
 
                   // Determinazione del tipo Documento Ordine di Produzione
-                  QryTipiDocOP.Close;
-                  QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
-                                           'WHERE (Tipdoc = ''P'') ' +
-                                           'ORDER BY Tipnum ASC';
+                  qryTipiDocOP.Close;
+                  qryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
+                    'WHERE (Tipdoc = ''P'') ' +
+                    'ORDER BY Tipnum ASC';
                   try
-                    QryTipiDocOP.Open;
+                    qryTipiDocOP.Open;
                   except
                     on E: Exception do
                     begin
                       Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
-                             'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
+                        'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
                       FlagErr := True;
                       Exit;
                     end;
@@ -1170,16 +1213,16 @@ begin
                   // Determinazione del numero
                   QryNumOP.Close;
                   QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
-                                       'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
-                                             '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
-                                       'GROUP BY Tipnum';
+                    'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(qryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
+                    '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
+                    'GROUP BY Tipnum';
                   try
                     QryNumOP.Open;
                   except
                     on E: Exception do
                     begin
                       Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
-                             'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
+                        'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
                       FlagErr := True;
                       Exit;
                     end;
@@ -1190,14 +1233,14 @@ begin
                   with objOPTes do
                   begin
                     Found := False;
-                    CampiObj['Idtipidoc'] := QryTipiDocOP.FieldByName('Id').AsInteger;
-                    CampiObj['TipNum'] := QryTipiDocOP.FieldByName('Tipnum').AsString;
+                    CampiObj['Idtipidoc'] := qryTipiDocOP.FieldByName('Id').AsInteger;
+                    CampiObj['TipNum'] := qryTipiDocOP.FieldByName('Tipnum').AsString;
                     CampiObj['AnnOP'] := Year;
                     CampiObj['NumOP'] := QryNumOP.FieldByName('Numop').AsInteger;
                     CampiObj['Stato'] := 'P';
                     CampiObj['Idartico'] := QryArtExistsDB.FieldByName('Idartico').AsInteger;
                     CampiObj['Qtaop'] := (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
-                                          CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString));
+                      CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString));
                     CampiObj['DatVal'] := DBExec.Data;
                     CampiObj['DatEmi'] := DBExec.Data;
                     CampiObj['Idcomrig'] := NewqryRighe.FieldByName('Rif_Id').AsInteger;
@@ -1208,31 +1251,29 @@ begin
                   if not objOPTes.GeneraOP > 0 then
                   begin
                     Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un ' +
-                           'errore durante la generazione dell''Ordine di Produzione.';
+                      'errore durante la generazione dell''Ordine di Produzione.';
                     FlagErr := True;
                     Exit;
                   end
                 end;
-
               end;
-
             end
             else
             begin
               // Segnalazione delle Righe di Commessa per le quali non � possibile generare
               // un Ordine di Produzione pergh� ha gia un Ordine di Produzione
               ListaIdComRigOnOP.Add('Commessa:' +
-                                    NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
-                                    NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
-                                    NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
-                                    'Riga: ' +
-                                    NewqryRighe.FieldByName('Crig_DESCR').AsString);
+                  NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
+                  NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
+                  NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
+                  'Riga: ' +
+                  NewqryRighe.FieldByName('Crig_DESCR').AsString);
             end;
           except
             on E: Exception do
             begin
               Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
-                     'errore con il database:' + CRLF + E.Message;
+                'errore con il database:' + CRLF + E.Message;
               FlagErr := True;
               Break;
             end;
@@ -1244,31 +1285,33 @@ begin
           if not FlagErr then
           begin
             DBExec.Commit;
-            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then begin
+            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then
+            begin
               Msg := 'Operazione di generazione Ordini di Produzione completata.';
               Application.MessageBox(PChar(Msg),
-                                     PChar(Application.Title),
-                                     MB_ICONINFORMATION + MB_OK);
+                  PChar(Application.Title),
+                  MB_ICONINFORMATION + MB_OK);
             end
             else
             begin
               Msg := 'Operazione di generazione Ordini di Produzione non � andata a buon fine ' +
-                     'per alcune righe selezionate.';
+                'per alcune righe selezionate.';
               if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count <> 0) then
                 MsgError(Msg,
-                         'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
-                         ListaIdComRig.Text + CRLF +
-                         'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
-                         ListaIdComRigOnOP.Text)
-              else begin
+                    'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
+                    ListaIdComRig.Text + CRLF +
+                    'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
+                    ListaIdComRigOnOP.Text)
+              else
+              begin
                 if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count = 0) then
                   MsgError(Msg,
-                           'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
-                           ListaIdComRig.Text);
+                      'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
+                      ListaIdComRig.Text);
                 if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count <> 0) then
                   MsgError(Msg,
-                           'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
-                           ListaIdComRigOnOP.Text);
+                      'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
+                      ListaIdComRigOnOP.Text);
               end;
             end;
           end
@@ -1277,15 +1320,15 @@ begin
             DBExec.Rollback;
             Msg := 'L''operazione di generazione Ordini di Produzione non � andata a boun fine.' + CRLF + Msg;
             Application.MessageBox(PChar(Msg),
-                                   PChar(Application.Title),
-                                   MB_ICONERROR + MB_OK);
+                PChar(Application.Title),
+                MB_ICONERROR + MB_OK);
           end;
 
         // Distruzione oggetti Qry
-        if Assigned(QryTipiDocOP) then
+        if Assigned(qryTipiDocOP) then
         begin
-          QryTipiDocOP.Close;
-          FreeAndNil(QryTipiDocOP);
+          qryTipiDocOP.Close;
+          FreeAndNil(qryTipiDocOP);
         end;
 
         if Assigned(QryNumOP) then
@@ -1317,15 +1360,15 @@ begin
             QryComRigExistsPI.UnPrepare;
           FreeAndNil(QryComRigExistsPI);
         end;
-
       end; // end try...finally
     end;
   end
-  else begin
+  else
+  begin
     Msg := 'Nessuna riga � stata selezionata.';
     Application.MessageBox(PChar(Msg),
-                           PChar(Application.Title),
-                           MB_ICONINFORMATION + MB_OK);
+        PChar(Application.Title),
+        MB_ICONINFORMATION + MB_OK);
   end;
 end;
 // ...lbi
@@ -1702,7 +1745,7 @@ begin
 end;
 *)
 
-function TGstPI.CalcolaCoefConv(ACodArtico: String): Double;
+function TGstPI.CalcolaCoefConv(ACodArtico: string): Double;
 var
   tmpUMPrd: TOriUM;
   QryArtSeek: TCSEQuery;
@@ -1713,43 +1756,45 @@ begin
     tmpUMPrd := ouI;
     // Puntamento su Artico
     QryArtSeek.SQL.Text := 'SELECT ' +
-                             'UMI, UMM, UMV, UMRPro, UMCo1, UMCo2, ' +
-                             'UMRel1, UMRel2, UMRel3, UMRel4 ' +
-                           'FROM Artico WHERE (Codice = ' + CS_VariantTo_SqlStr('ACodArtico') + ')';
+      'UMI, UMM, UMV, UMRPro, UMCo1, UMCo2, ' +
+      'UMRel1, UMRel2, UMRel3, UMRel4 ' +
+      'FROM Artico WHERE (Codice = ' + CS_VariantTo_SqlStr('ACodArtico') + ')';
     try
       QryArtSeek.Open;
-      case (qryArtSeek.FieldByName('UMRPro').AsString + ' ')[1] of
-        'I',' ': tmpUMPrd := ouI;
-        'M'    : tmpUMPrd := ouM;
-        'V'    : tmpUMPrd := ouV;
+      case (QryArtSeek.FieldByName('UMRPro').AsString + ' ')[1] of
+        'I', ' ':
+          tmpUMPrd := ouI;
+        'M':
+          tmpUMPrd := ouM;
+        'V':
+          tmpUMPrd := ouV;
       end; // end case
       Result := ConvUMStd(tmpUMPrd,
-                          ouI,
-                          qryArtSeek.FieldByName('UMI').AsString,
-                          qryArtSeek.FieldByName('UMM').AsString,
-                          qryArtSeek.FieldByName('UMV').AsString,
-                          qryArtSeek.FieldByName('UMRel1').AsString,
-                          qryArtSeek.FieldByName('UMRel2').AsString,
-                          qryArtSeek.FieldByName('UMRel3').AsString,
-                          qryArtSeek.FieldByName('UMRel4').AsString,
-                          qryArtSeek.FieldByName('UMCo1').AsString,
-                          qryArtSeek.FieldByName('UMCo2').AsString);
+          ouI,
+          QryArtSeek.FieldByName('UMI').AsString,
+          QryArtSeek.FieldByName('UMM').AsString,
+          QryArtSeek.FieldByName('UMV').AsString,
+          QryArtSeek.FieldByName('UMRel1').AsString,
+          QryArtSeek.FieldByName('UMRel2').AsString,
+          QryArtSeek.FieldByName('UMRel3').AsString,
+          QryArtSeek.FieldByName('UMRel4').AsString,
+          QryArtSeek.FieldByName('UMCo1').AsString,
+          QryArtSeek.FieldByName('UMCo2').AsString);
     except
       Result := 1;
     end;
   finally
-    if Assigned(qryArtSeek) then
+    if Assigned(QryArtSeek) then
     begin
-      qryArtSeek.Close;
-      FreeAndNil(qryArtSeek);
+      QryArtSeek.Close;
+      FreeAndNil(QryArtSeek);
     end;
   end;
 end;
 
-function TGstPI.GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
-                               AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): String;
+function TGstPI.GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: string; AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): string;
 var
-  Msg: String;
+  Msg: string;
   tmpOPDT: TCampiOPDT;
   CampiCauMov: TCauMov;
   tmpNewDocPrd: Integer;
@@ -1760,7 +1805,8 @@ begin
   Msg := '';
 
   NewTran := not DBExec.InTransaction;
-  if NewTran then DBExec.CSStartTransaction;
+  if NewTran then
+    DBExec.CSStartTransaction;
 
   tmpQry := TCSEQuery.Create(nil);
   tmpQry.DatabaseName := DBExec.DatabaseName;
@@ -1812,19 +1858,19 @@ begin
     *)
 
     AobjOrPr.SetCampi('Idtipidoc', AIdTipiDoc);
-    AobjOrPr.SetCampi('Tipnum',    ATipnum);
-    AobjOrPr.SetCampi('Annop',     AAnnop);
-    AobjOrPr.SetCampi('Numop',     ANumop);
-    AobjOrPr.SetCampi('Stato',     'P');
-    AobjOrPr.SetCampi('Opman',     False);
-    AobjOrPr.SetCampi('Qtaop',     AQtaOP);
-    AobjOrPr.SetCampi('Qtacar',    0);
-    AobjOrPr.SetCampi('Valsch',    0);
-    AobjOrPr.SetCampi('Totmat',    0);
-    AobjOrPr.SetCampi('Datcon',    0);
-    AobjOrPr.SetCampi('Datpre',    0);
-    AobjOrPr.SetCampi('Dateva',    0);
-    AobjOrPr.SetCampi('Datric',    tmpOPTes.dafiva);
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
 
     if CampiCauMov.Idmagarr <> 0 then
       AobjOrPr.SetCampi('IdAllVer', CampiCauMov.Idmagarr)
@@ -1832,13 +1878,13 @@ begin
       AobjOrPr.SetCampi('IdAllVer', Settings.Allpf);
 
     AobjOrPr.SetCampi('Idcomrig', AIdComRig);
-    AobjOrPr.SetCampi('Mdp',      False);
+    AobjOrPr.SetCampi('Mdp', False);
     AobjOrPr.SetCampi('flAttMJS', False);
-    AobjOrPr.SetCampi('Datemi',   DBExec.Data);
-    AobjOrPr.SetCampi('Doctec',   False);
-    AobjOrPr.SetCampi('Docpre',   False);
-    AobjOrPr.SetCampi('Docsdl',   False);
-    AobjOrPr.SetCampi('Verifi',   False);
+    AobjOrPr.SetCampi('Datemi', DBExec.Data);
+    AobjOrPr.SetCampi('Doctec', False);
+    AobjOrPr.SetCampi('Docpre', False);
+    AobjOrPr.SetCampi('Docsdl', False);
+    AobjOrPr.SetCampi('Verifi', False);
     AobjOrPr.SetCampi('OPEvaMod', True);
     // ...SF 26/01/2018
 
@@ -1848,7 +1894,7 @@ begin
     if tmpNewDocPrd = -1 then
     begin
       Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
-             'nell''inserimento della testata dell''Ordine di Produzione.';
+        'nell''inserimento della testata dell''Ordine di Produzione.';
       Exit;
     end;
 
@@ -1857,7 +1903,7 @@ begin
       if not AobjOrPr.GeneraOPLotF(tmpNewDocPrd) then
       begin
         Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
-               'nella generazione lotti.';
+          'nella generazione lotti.';
         Exit;
       end;
 
@@ -1867,19 +1913,19 @@ begin
       //EB...28/04/2003
       tmpQry1.Close;
       tmpQry1.SQL.Text := 'SELECT Id FROM OPDT ' +
-                          'WHERE (Idoptes = :IdOpTes) AND ' +
-                                '(Sequen = :Sequen)';
+        'WHERE (Idoptes = :IdOpTes) AND ' +
+        '(Sequen = :Sequen)';
       if tmpQry1.prepared then
         tmpQry1.unPrepare;
       tmpQry1.prepare;
       //...EB
 
       tmpQry.SQL.Text := 'SELECT ' +
-                           'Id, Sequen, Livello, Idpadre, Idartico, Idlink, ' +
-                           'Qtimco, Tipord, Riferi, Note, Codvardb, Idnote, CCCRea ' +
-                         'FROM OPDT ' +
-                         'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + ') ' +
-                         'ORDER BY Sequen';
+        'Id, Sequen, Livello, Idpadre, Idartico, Idlink, ' +
+        'Qtimco, Tipord, Riferi, Note, Codvardb, Idnote, CCCRea ' +
+        'FROM OPDT ' +
+        'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + ') ' +
+        'ORDER BY Sequen';
       tmpQry.Open;
       while not tmpQry.Eof do
       begin
@@ -1910,30 +1956,30 @@ begin
         end;  // with
         *)
 
-        AobjOrPr.SetCampiOPDT('idoptes',  tmpNewDocPrd);
-        AobjOrPr.SetCampiOPDT('sequen',   tmpQry.FieldByName('Sequen').AsInteger);
-        AobjOrPr.SetCampiOPDT('livello',  tmpQry.FieldByName('Livello').AsInteger);
-        AobjOrPr.SetCampiOPDT('idpadre',  tmpQry1.FieldByName('Id').AsInteger);
+        AobjOrPr.SetCampiOPDT('idoptes', tmpNewDocPrd);
+        AobjOrPr.SetCampiOPDT('sequen', tmpQry.FieldByName('Sequen').AsInteger);
+        AobjOrPr.SetCampiOPDT('livello', tmpQry.FieldByName('Livello').AsInteger);
+        AobjOrPr.SetCampiOPDT('idpadre', tmpQry1.FieldByName('Id').AsInteger);
 
         if tmpQry.FieldByName('Livello').AsInteger = 0 then
           AobjOrPr.SetCampiOPDT('idartico', tmpOPTes.idartico)
         else
           AobjOrPr.SetCampiOPDT('idartico', tmpQry.FieldByName('Idartico').AsInteger);
 
-        AobjOrPr.SetCampiOPDT('idlink',   tmpQry.FieldByName('Idlink').AsInteger);
-        AobjOrPr.SetCampiOPDT('qtimco',   tmpQry.FieldByName('Qtimco').AsFloat);
-        AobjOrPr.SetCampiOPDT('tipord',   tmpQry.FieldByName('Tipord').AsString);
-        AobjOrPr.SetCampiOPDT('riferi',   tmpQry.FieldByName('Riferi').AsString);
-        AobjOrPr.SetCampiOPDT('note',     tmpQry.FieldByName('Note').AsString);
+        AobjOrPr.SetCampiOPDT('idlink', tmpQry.FieldByName('Idlink').AsInteger);
+        AobjOrPr.SetCampiOPDT('qtimco', tmpQry.FieldByName('Qtimco').AsFloat);
+        AobjOrPr.SetCampiOPDT('tipord', tmpQry.FieldByName('Tipord').AsString);
+        AobjOrPr.SetCampiOPDT('riferi', tmpQry.FieldByName('Riferi').AsString);
+        AobjOrPr.SetCampiOPDT('note', tmpQry.FieldByName('Note').AsString);
         AobjOrPr.SetCampiOPDT('codvardb', tmpQry.FieldByName('Codvardb').AsString);
-        AobjOrPr.SetCampiOPDT('CCCRea',   tmpQry.FieldByName('CCCRea').asInteger);
+        AobjOrPr.SetCampiOPDT('CCCRea', tmpQry.FieldByName('CCCRea').asInteger);
         // ...SF 26/01/2018
 
         tmpQry1.Close;
         if AobjOrPr.InsertDT = -1 then
         begin
           Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
-                 'nell''inserimento della Distinta Tecnica.';
+            'nell''inserimento della Distinta Tecnica.';
           Break;
         end;
         tmpQry.Next;
@@ -1947,17 +1993,17 @@ begin
     if Msg = '' then
     begin
       tmpQry.SQL.Text := 'INSERT INTO OPDP (Idoptes, Datpre, Idartico, ' +
-                         'Idallmag, Qtimco, Qtarpr, Qtaman, Qtapre, Note, ' +
-                         'Tipord, Cosuni, Tipcos, CCCRea) ' +
-                         '(SELECT ' + CS_KeyValueTo_SqlStr(tmpNewDocPrd) + ', 0, Idartico, ' +
-                          'Idallmag, Qtimco, 0, 0, 0, Note, Tipord, Cosuni, Tipcos, CCCRea ' +
-                          'FROM Opdp ' +
-                          'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + '))';
+        'Idallmag, Qtimco, Qtarpr, Qtaman, Qtapre, Note, ' +
+        'Tipord, Cosuni, Tipcos, CCCRea) ' +
+        '(SELECT ' + CS_KeyValueTo_SqlStr(tmpNewDocPrd) + ', 0, Idartico, ' +
+        'Idallmag, Qtimco, 0, 0, 0, Note, Tipord, Cosuni, Tipcos, CCCRea ' +
+        'FROM Opdp ' +
+        'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + '))';
       try
         tmpQry.ExecSQL;
       except
         Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
-               'nell''inserimento della Distinta di Prelievo.';
+          'nell''inserimento della Distinta di Prelievo.';
         Exit;
       end; // end try...except
     end; // if
@@ -1966,22 +2012,22 @@ begin
     if Msg = '' then
     begin
       QryFas.SQL.Text := 'SELECT ' +
-                           'Id, Idoptes, Idopsdlmat, Sequen, Idlav, ' +
-                           'Fltrasf, Idtiplav, Attrezzo, Iddipend, Idstslav, ' +
-                           'Cosuni, Cosunima, Cossch, Temavv, Avvsch, Temese, ' +
-                           'Esesch, Totsch, Prdora, Prdott, Micatt, Macatt, ' +
-                           'Tematt, Fruomo, Sovfas, Datcar, Datsca, Note, ' +
-                           'Idinfosl, Iddoc, Idricila ' +
-                         'FROM Opsdlfas ' +
-                         'WHERE (Idopsdlmat = :Idopsdlmat)';
+        'Id, Idoptes, Idopsdlmat, Sequen, Idlav, ' +
+        'Fltrasf, Idtiplav, Attrezzo, Iddipend, Idstslav, ' +
+        'Cosuni, Cosunima, Cossch, Temavv, Avvsch, Temese, ' +
+        'Esesch, Totsch, Prdora, Prdott, Micatt, Macatt, ' +
+        'Tematt, Fruomo, Sovfas, Datcar, Datsca, Note, ' +
+        'Idinfosl, Iddoc, Idricila ' +
+        'FROM Opsdlfas ' +
+        'WHERE (Idopsdlmat = :Idopsdlmat)';
       QryFas.Prepare;
 
       tmpQry.SQL.Text := 'SELECT ' +
-                           'Id, Idopdt, Idartico, Sequen, Cosavv, Coslav, ' +
-                           'Coscic, Tipcos, Lticic, Tiptem, Qtimco, Note ' +
-                         'FROM Opsdlmat ' +
-                         'WHERE (Idoptes = ' + IntToStr(tmpOPTes.id) + ') ' +
-                         'ORDER BY Sequen';
+        'Id, Idopdt, Idartico, Sequen, Cosavv, Coslav, ' +
+        'Coscic, Tipcos, Lticic, Tiptem, Qtimco, Note ' +
+        'FROM Opsdlmat ' +
+        'WHERE (Idoptes = ' + IntToStr(tmpOPTes.id) + ') ' +
+        'ORDER BY Sequen';
 
       tmpQry.Open;
       while not tmpQry.Eof do
@@ -2013,33 +2059,36 @@ begin
         *)
 
         AobjOrPr.SetCampiSdlM('idoptes', tmpNewDocPrd);
-        AobjOrPr.SetCampiSdlM('idopdt',  tmpQry1.FieldByName('Id').AsInteger);
-        AobjOrPr.SetCampiSdlM('idartico',tmpOPTes.Idartico);
-        AobjOrPr.SetCampiSdlM('sequen',  tmpQry.FieldByName('Sequen').AsInteger);
-        AobjOrPr.SetCampiSdlM('cosavv',  tmpQry.FieldByName('Cosavv').AsFloat);
-        AobjOrPr.SetCampiSdlM('coslav',  tmpQry.FieldByName('Coslav').AsFloat);
-        AobjOrPr.SetCampiSdlM('coscic',  tmpQry.FieldByName('Coscic').AsFloat);
-        AobjOrPr.SetCampiSdlM('tipcos',  tmpQry.FieldByName('Tipcos').AsString);
-        AobjOrPr.SetCampiSdlM('lticic',  tmpQry.FieldByName('Lticic').AsFloat);
-        AobjOrPr.SetCampiSdlM('tiptem',  tmpQry.FieldByName('Tiptem').AsString);
-        AobjOrPr.SetCampiSdlM('cossch',  ZERO);
-        AobjOrPr.SetCampiSdlM('qtimco',  tmpQry.FieldByName('Qtimco').AsFloat);
-        AobjOrPr.SetCampiSdlM('completo',False);
-        AobjOrPr.SetCampiSdlM('note',    tmpQry.FieldByName('Note').AsString);
+        AobjOrPr.SetCampiSdlM('idopdt', tmpQry1.FieldByName('Id').AsInteger);
+        AobjOrPr.SetCampiSdlM('idartico', tmpOPTes.Idartico);
+        AobjOrPr.SetCampiSdlM('sequen', tmpQry.FieldByName('Sequen').AsInteger);
+        AobjOrPr.SetCampiSdlM('cosavv', tmpQry.FieldByName('Cosavv').AsFloat);
+        AobjOrPr.SetCampiSdlM('coslav', tmpQry.FieldByName('Coslav').AsFloat);
+        AobjOrPr.SetCampiSdlM('coscic', tmpQry.FieldByName('Coscic').AsFloat);
+        AobjOrPr.SetCampiSdlM('tipcos', tmpQry.FieldByName('Tipcos').AsString);
+        AobjOrPr.SetCampiSdlM('lticic', tmpQry.FieldByName('Lticic').AsFloat);
+        AobjOrPr.SetCampiSdlM('tiptem', tmpQry.FieldByName('Tiptem').AsString);
+        AobjOrPr.SetCampiSdlM('cossch', ZERO);
+        AobjOrPr.SetCampiSdlM('qtimco', tmpQry.FieldByName('Qtimco').AsFloat);
+        AobjOrPr.SetCampiSdlM('completo', False);
+        AobjOrPr.SetCampiSdlM('note', tmpQry.FieldByName('Note').AsString);
         // ...SF 26/01/2018
 
         tmpQry1.Close;
-        if AobjOrPr.InsertSdlM = -1 then begin
+        if AobjOrPr.InsertSdlM = -1 then
+        begin
           Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
-                 'nell''inserimento della Scheda di Lavorazione Materiali.';
+            'nell''inserimento della Scheda di Lavorazione Materiali.';
           Break;
         end
-        else begin
+        else
+        begin
           // OPSdlFas
           QryFas.Close;
           QryFas.Params[0].asInteger := tmpQry.FieldByName('id').asInteger;
           QryFas.Open;
-          while not QryFas.Eof do begin
+          while not QryFas.Eof do
+          begin
             AobjOrPr.FoundSdlF := False;
             AobjOrPr.OPSdlFMemoText := GetNota(DBExec, QryFas.FieldByName('idinfosl').AsInteger);
             AobjOrPr.OPSdlFDocFiles := GetNota(DBExec, QryFas.FieldByName('iddoc').AsInteger);
@@ -2079,41 +2128,42 @@ begin
             end; //  end with
             *)
 
-            AobjOrPr.SetCampiSdlF('idoptes',    tmpNewDocPrd);
+            AobjOrPr.SetCampiSdlF('idoptes', tmpNewDocPrd);
             AobjOrPr.SetCampiSdlF('idopsdlmat', AobjOrPr.CampiOPSdlM.id);
-            AobjOrPr.SetCampiSdlF('sequen',     QryFas.FieldByName('Sequen').AsInteger);
-            AobjOrPr.SetCampiSdlF('idlav',      QryFas.FieldByName('Idlav').AsInteger);
-            AobjOrPr.SetCampiSdlF('idRiCiLa',   QryFas.FieldByName('Idricila').asInteger);
-            AobjOrPr.SetCampiSdlF('fltrasf',    (QryFas.FieldByName('Fltrasf').AsInteger = -1));
-            AobjOrPr.SetCampiSdlF('idtiplav',   QryFas.FieldByName('Idtiplav').AsInteger);
-            AobjOrPr.SetCampiSdlF('attrezzo',   QryFas.FieldByName('Attrezzo').AsString);
-            AobjOrPr.SetCampiSdlF('iddipend',   QryFas.FieldByName('Iddipend').AsInteger);
-            AobjOrPr.SetCampiSdlF('idstslav',   QryFas.FieldByName('Idstslav').AsInteger);
-            AobjOrPr.SetCampiSdlF('cosuni',     QryFas.FieldByName('Cosuni').AsFloat);
-            AobjOrPr.SetCampiSdlF('cosuniMA',   QryFas.FieldByName('Cosunima').AsFloat);
-            AobjOrPr.SetCampiSdlF('cossch',     ZERO);
-            AobjOrPr.SetCampiSdlF('temavv',     QryFas.FieldByName('Temavv').AsFloat);
-            AobjOrPr.SetCampiSdlF('avvsch',     ZERO);
-            AobjOrPr.SetCampiSdlF('temese',     QryFas.FieldByName('Temese').AsFloat);
-            AobjOrPr.SetCampiSdlF('esesch',     ZERO);
-            AobjOrPr.SetCampiSdlF('totsch',     ZERO);
-            AobjOrPr.SetCampiSdlF('prdora',     QryFas.FieldByName('Prdora').AsFloat);
-            AobjOrPr.SetCampiSdlF('prdott',     QryFas.FieldByName('Prdott').AsFloat);
-            AobjOrPr.SetCampiSdlF('micatt',     QryFas.FieldByName('Micatt').AsFloat);
-            AobjOrPr.SetCampiSdlF('macatt',     QryFas.FieldByName('Macatt').AsFloat);
-            AobjOrPr.SetCampiSdlF('tematt',     QryFas.FieldByName('Tematt').AsFloat);
-            AobjOrPr.SetCampiSdlF('fruomo',     QryFas.FieldByName('Fruomo').AsFloat);
-            AobjOrPr.SetCampiSdlF('sovfas',     QryFas.FieldByName('Sovfas').AsFloat);
-            AobjOrPr.SetCampiSdlF('datcar',     0);
-            AobjOrPr.SetCampiSdlF('datsca',     0);
-            AobjOrPr.SetCampiSdlF('note',       QryFas.FieldByName('Note').AsString);
-            AobjOrPr.SetCampiSdlF('idinfosl',   0);
-            AobjOrPr.SetCampiSdlF('iddoc',      0);
+            AobjOrPr.SetCampiSdlF('sequen', QryFas.FieldByName('Sequen').AsInteger);
+            AobjOrPr.SetCampiSdlF('idlav', QryFas.FieldByName('Idlav').AsInteger);
+            AobjOrPr.SetCampiSdlF('idRiCiLa', QryFas.FieldByName('Idricila').asInteger);
+            AobjOrPr.SetCampiSdlF('fltrasf', (QryFas.FieldByName('Fltrasf').AsInteger = -1));
+            AobjOrPr.SetCampiSdlF('idtiplav', QryFas.FieldByName('Idtiplav').AsInteger);
+            AobjOrPr.SetCampiSdlF('attrezzo', QryFas.FieldByName('Attrezzo').AsString);
+            AobjOrPr.SetCampiSdlF('iddipend', QryFas.FieldByName('Iddipend').AsInteger);
+            AobjOrPr.SetCampiSdlF('idstslav', QryFas.FieldByName('Idstslav').AsInteger);
+            AobjOrPr.SetCampiSdlF('cosuni', QryFas.FieldByName('Cosuni').AsFloat);
+            AobjOrPr.SetCampiSdlF('cosuniMA', QryFas.FieldByName('Cosunima').AsFloat);
+            AobjOrPr.SetCampiSdlF('cossch', ZERO);
+            AobjOrPr.SetCampiSdlF('temavv', QryFas.FieldByName('Temavv').AsFloat);
+            AobjOrPr.SetCampiSdlF('avvsch', ZERO);
+            AobjOrPr.SetCampiSdlF('temese', QryFas.FieldByName('Temese').AsFloat);
+            AobjOrPr.SetCampiSdlF('esesch', ZERO);
+            AobjOrPr.SetCampiSdlF('totsch', ZERO);
+            AobjOrPr.SetCampiSdlF('prdora', QryFas.FieldByName('Prdora').AsFloat);
+            AobjOrPr.SetCampiSdlF('prdott', QryFas.FieldByName('Prdott').AsFloat);
+            AobjOrPr.SetCampiSdlF('micatt', QryFas.FieldByName('Micatt').AsFloat);
+            AobjOrPr.SetCampiSdlF('macatt', QryFas.FieldByName('Macatt').AsFloat);
+            AobjOrPr.SetCampiSdlF('tematt', QryFas.FieldByName('Tematt').AsFloat);
+            AobjOrPr.SetCampiSdlF('fruomo', QryFas.FieldByName('Fruomo').AsFloat);
+            AobjOrPr.SetCampiSdlF('sovfas', QryFas.FieldByName('Sovfas').AsFloat);
+            AobjOrPr.SetCampiSdlF('datcar', 0);
+            AobjOrPr.SetCampiSdlF('datsca', 0);
+            AobjOrPr.SetCampiSdlF('note', QryFas.FieldByName('Note').AsString);
+            AobjOrPr.SetCampiSdlF('idinfosl', 0);
+            AobjOrPr.SetCampiSdlF('iddoc', 0);
             // ...SF 26/01/2018
 
-            if AobjOrPr.InsertSdlF = -1 then begin
+            if AobjOrPr.InsertSdlF = -1 then
+            begin
               Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
-                     'nell''inserimento della Scheda di Lavorazione Fase.';
+                'nell''inserimento della Scheda di Lavorazione Fase.';
               Break;
             end;  // if
             QryFas.Next;
@@ -2129,25 +2179,28 @@ begin
 
     // Nel caso di generazione OP da PI, ricalcolo i costi teorici.
     if Msg = '' then
-      if not AobjOrPr.RicValTeo(tmpNewDocPrd) then begin
+      if not AobjOrPr.RicValTeo(tmpNewDocPrd) then
+      begin
         Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
-               'nel Ricalcolo dei costi teorici.';
+          'nel Ricalcolo dei costi teorici.';
         Exit;
       end; // if
-
   finally
-    if Assigned(tmpQry) then begin
+    if Assigned(tmpQry) then
+    begin
       tmpQry.Close;
       FreeAndNil(tmpQry);
     end;
 
-    if Assigned(tmpQry1) then begin
+    if Assigned(tmpQry1) then
+    begin
       tmpQry1.Close;
       tmpQry1.UnPrepare;
       FreeAndNil(tmpQry1);
     end;
 
-    if Assigned(QryFas) then begin
+    if Assigned(QryFas) then
+    begin
       QryFas.Close;
       QryFas.UnPrepare;
       FreeAndNil(QryFas);
@@ -2157,7 +2210,8 @@ begin
     if NewTran then
       if Msg = '' then
         DBExec.Commit
-      else begin
+      else
+      begin
         DBExec.RollBack;
         Result := Msg;
       end
@@ -2168,11 +2222,11 @@ end;
 
 initialization
   // Identificativo modulo
-  CSW___BPL_Identity :='PI_Altag_GstPI';
+  CSW___BPL_Identity := 'PI_Altag_GstPI';
 
   if (CfgSAMFile.SectionExists('PI_Altag_GstPI')) then
   begin
-    if Inside( CfgSamFile.ReadString('PI_Altag_GstPI', 'Utenti', ''), IntToStr(Utente.Id) ) then
+    if Inside(CfgSamFile.ReadString('PI_Altag_GstPI', 'Utenti', ''), IntToStr(Utente.Id)) then
     begin
       RegisterPlugIn('PI_Altag_GstPI', TGstPI);
     end;
@@ -2180,4 +2234,6 @@ initialization
 
 finalization
   UnRegisterPlugIn('PI_Altag_GstPI');
+
 end.
+
```

### `fed9517770c1adc944efa0d4d14891eb452aa681` - RI 53799 - PI_Altag_GstPI - Modifica recupero costi per differenza rispetto allo standart
- Data: `2025-03-04T10:13:38+01:00`
- Autore: `Iliass Kharbouchi`
- Classificazione prima: `Mista`
- Classificazione dopo: `Mista`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstPI/FGstPI.dfm, source/PI_Altag_GstPI/FGstPI.pas`
- Indicatori V500: `dbexec, oledb`
- Indicatori V600: `tcsequery, imageindex`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstPI/FGstPI.dfm b/source/PI_Altag_GstPI/FGstPI.dfm
index e46b2b3..58fd196 100644
--- a/source/PI_Altag_GstPI/FGstPI.dfm
+++ b/source/PI_Altag_GstPI/FGstPI.dfm
@@ -540,10 +540,6 @@ object FrmGstPI: TFrmGstPI
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
@@ -985,10 +981,6 @@ object FrmGstPI: TFrmGstPI
     object TabStorico: TTabSheet
       Caption = 'Storico ultimi carichi'
       ImageIndex = 2
-      ExplicitLeft = 0
-      ExplicitTop = 0
-      ExplicitWidth = 0
-      ExplicitHeight = 0
       object SMDBGridStorico: TSMDBGrid
         Left = 0
         Top = 0
diff --git a/source/PI_Altag_GstPI/FGstPI.pas b/source/PI_Altag_GstPI/FGstPI.pas
index 47b5ca4..12142ea 100644
--- a/source/PI_Altag_GstPI/FGstPI.pas
+++ b/source/PI_Altag_GstPI/FGstPI.pas
@@ -1629,7 +1629,23 @@ begin
     qryApp := TCSEQuery.Create(nil);
     qryApp.DatabaseName := Azienda.DatabaseName;
     try // finally
-      qryApp.SQL.Text := 'select CosUni, CosUniMA, CosUniUL, CosUniUA from Lavorazioni where Id='+CS_Keyvalueto_SQLStr(F2Lav.KeyValue);
+      // IK 06/12/2024 RI 53799 Modifica recupero costi per differenza rispetto allo standart
+//      qryApp.SQL.Text := 'select CosUni, CosUniMA, CosUniUL, CosUniUA from Lavorazioni where Id='+CS_Keyvalueto_SQLStr(F2Lav.KeyValue);
+
+      qryApp.SQL.Text :=
+      'select '+
+                  'CASE WHEN RC.ID IS NULL THEN L.CosUni   ELSE RC.CosUniML   END CosUni, '+
+                  'CASE WHEN RC.ID IS NULL THEN L.CosUniMA ELSE RC.CosUniMA END CosUniMA, '+
+                  'CASE WHEN RC.ID IS NULL THEN L.CosUniUL ELSE RC.CosUniUL END CosUniUL, '+
+                  'CASE WHEN RC.ID IS NULL THEN L.CosUniUA ELSE RC.CosUniUA  END CosUniUA '+
+      'from Lavorazioni L '+
+      'JOIN CELPRO C ON L.IDCELPRO = C.ID '+
+      'JOIN COMRIG CR ON CR.ID = '+CS_KeyValueTo_SqlStr(idcomrig)+' '+
+      'JOIN COMTES CT ON CR.IDCOMTES = CT.ID '+
+      'OUTER APPLY '+
+      '(SELECT TOP 1 * FROM REPCOS WHERE IDREPCDC = C.IDREPCDC AND ISNULL(DTINVA,0) <= CT.DATDOC AND ISNULL(NULLIF(DTFIVA,0),CT.DATDOC) >= CT.DATDOC) RC '+
+      'where L.Id = '+CS_Keyvalueto_SQLStr(F2Lav.KeyValue);
+      // IK 06/12/2024 RI 53799
       qryApp.Open;
       FOP.SetCampiSdlF('CosUni', QryApp.FieldByName('CosUni').AsFloat);
       FOP.SetCampiSdlF('CosUniMA', QryApp.FieldByName('CosUniMA').AsFloat);
@@ -1872,19 +1888,70 @@ begin
 end;
 
 function TFrmGstPI.CalcolaPeso(msg: boolean): double;
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
   if result=0 then begin
     if msg then begin
       if messagedlg('ATTENZIONE:'+#13#10#10+'Non � stata indicata la quantit� di materia prima.'+#13#10#10+
```

### `d28f1f7780d28cddfba6ff524875363239fe85af` - Modificato la query mettendo un outer apply al posto delle left join in modo da prendere solo il tipodocumento preventivi e non gli OP
- Data: `2025-02-19T09:56:42+01:00`
- Autore: `Luca Rehan`
- Classificazione prima: `Mista`
- Classificazione dopo: `Mista`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstPI/UGstPI.pas`
- Indicatori V500: `dbexec, rnote, getnota, memotext, glyphlibraryindex`
- Indicatori V600: `tcsequery`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstPI/UGstPI.pas b/source/PI_Altag_GstPI/UGstPI.pas
index e18aa07..95ddfb8 100644
--- a/source/PI_Altag_GstPI/UGstPI.pas
+++ b/source/PI_Altag_GstPI/UGstPI.pas
@@ -193,14 +193,21 @@ begin
       QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' NUMOP_PI, ' +
                            Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
 
-    StrSql := 'PDOC.DESCR';
+    StrSql := 'OTES.DESCR';
     if Pos(LowerCase( StrSql + ' DESCR_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
       QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' DESCR_PI, ' +
                            Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
 
-    StrSql :=   'LEFT OUTER JOIN OPTES OTES on OTES.IDCOMRIG = CRIG.ID '+
-                'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID '+
-                'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID ';
+//    StrSql :=   'LEFT OUTER JOIN OPTES OTES on OTES.IDCOMRIG = CRIG.ID '+
+//                'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID '+
+//                'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID  ';
+    StrSql := 'outer apply '+
+              '(select top 1 otes.numop, otes.annop, otes.tipnum, pdoc.descr '+
+              'from optes otes '+
+              'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID '+
+              'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID  '+
+              'where otes.idcomrig = crig.id '+                                           //LR_CH4221/2025
+              'and pdoc.tipdoc <> ''P'') OTES ';
 
     if Pos(LowerCase(StrSql), LowerCase(QryRiDiBa.Sql.Text)) = 0 then
     begin
```

### `437b643d6653f681201be2a8f4adc0e9801b2226` - fix progetti con DPM
- Data: `2024-10-08T13:01:26+02:00`
- Autore: `Luca Tolomelli`
- Classificazione prima: `Non determinabile`
- Classificazione dopo: `Non determinabile`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_GstPI/PI_Altag_GstPI.dproj`
- Indicatori V500: `nessuno`
- Indicatori V600: `nessuno`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj b/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
index b745207..3f943ad 100644
--- a/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
+++ b/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
@@ -4,7 +4,7 @@
         <MainSource>PI_Altag_GstPI.dpk</MainSource>
         <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
         <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
-        <DCC_DependencyCheckOutputName>C:\outsamw2\PI_Altag_GstPI.bpl</DCC_DependencyCheckOutputName>
+        <DCC_DependencyCheckOutputName>$(SAMDIROUT)\PI_Altag_GstPI.bpl</DCC_DependencyCheckOutputName>
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
                     <Source Name="MainSource">PI_Altag_GstPI.dpk</Source>
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
- File modificati: `source/PI_Altag_GstPI/FGstPI.dfm, source/PI_Altag_GstPI/FGstPI.pas, source/PI_Altag_GstPI/OGstPI.pas, source/PI_Altag_GstPI/PI_Altag_GstPI.dpk, source/PI_Altag_GstPI/PI_Altag_GstPI.dproj, source/PI_Altag_GstPI/README.md, source/PI_Altag_GstPI/UGstPI.pas`
- Indicatori V500: `dbexec, rnote, getnota, memotext, glyphlibraryindex, oledb`
- Indicatori V600: `tcsequery, imageindex`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_GstPI/FGstPI.dfm b/source/PI_Altag_GstPI/FGstPI.dfm
new file mode 100644
index 0000000..e46b2b3
--- /dev/null
+++ b/source/PI_Altag_GstPI/FGstPI.dfm
@@ -0,0 +1,1552 @@
+object FrmGstPI: TFrmGstPI
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
+    object TabStorico: TTabSheet
+      Caption = 'Storico ultimi carichi'
+      ImageIndex = 2
+      ExplicitLeft = 0
+      ExplicitTop = 0
+      ExplicitWidth = 0
+      ExplicitHeight = 0
+      object SMDBGridStorico: TSMDBGrid
+        Left = 0
+        Top = 0
+        Width = 597
+        Height = 286
+        ExOptions = [eoKeepSelection, eoStandardPopup]
+        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
+        KeyField = 'ID'
+        WidthOfIndicator = 14
+        ScrollBars = ssHorizontal
+        ColCount = 32
+        RowCount = 2
+        Col = 1
+        Row = 1
+        Align = alClient
+        DataSource = DsStorico
+        ReadOnly = True
+        TabOrder = 0
+        TitleFont.Charset = DEFAULT_CHARSET
+        TitleFont.Color = clWindowText
+        TitleFont.Height = -11
+        TitleFont.Name = 'MS Sans Serif'
+        TitleFont.Style = []
+        Columns = <
+          item
+            Expanded = False
+            FieldName = 'CODFOR'
+            Title.Caption = 'Codice fornitore'
+            Width = 72
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DESCRFOR'
+            Title.Caption = 'Descr fornitore'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DESCRDDT'
+            Title.Caption = 'Descrizione DDT'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Alignment = taRightJustify
+            Expanded = False
+            FieldName = 'NUMDDT'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Numero DDT'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'ANNDDT'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Anno DDT'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DATDDT'
+            Title.Caption = 'Data DDT'
+            Visible = True
+            DataType = dtData
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DESCRFAT'
+            Title.Caption = 'Tipo doc Fatt'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Alignment = taRightJustify
+            Expanded = False
+            FieldName = 'NUMFAT'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Num. Fattura'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'ANNFAT'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Anno Fattura'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DATFAT'
+            Title.Caption = 'Data Fattura'
+            Visible = True
+            DataType = dtData
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'CODCAU'
+            Title.Caption = 'Codice causale'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DESCRCAU'
+            Title.Caption = 'Descrizione causale'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'CODART'
+            Title.Caption = 'Codice Articolo'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DESCRART'
+            Title.Caption = 'Descrizione Articolo'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'NUMLOT'
+            Title.Caption = 'Numero lotto'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'NUMSER'
+            Title.Caption = 'Numero serie'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DATMOV'
+            Title.Caption = 'Data movimento'
+            Visible = True
+            DataType = dtData
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'QTAINV'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Q.t'#224' Inv'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'QTAMOV'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Q.t'#224' mov'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'QTAFOR'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Q.t'#224' For'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'VALUNI'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Valore UNI'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'VALORE'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Totale UNI'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'VALOREFOR'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Valore UNI For'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'UMI'
+            Title.Caption = 'U.M. Inv'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'CODVALUNI'
+            Title.Caption = 'Valuta UNI'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'CAMBIO'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Cambio'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'VALUNIVAL'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Valore UNI Valuta'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'VALVAL'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Totale UNI Valuta'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'VALVALFOR'
+            Title.Alignment = taRightJustify
+            Title.Caption = 'Valore UNI For'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'UMF'
+            Title.Caption = 'U.M. For'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'CODVALVAL'
+            Title.Caption = 'Valuta UNI For'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end>
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
+      Left = 403
+      Top = 6
+      Width = 112
+      Height = 25
+      Caption = 'Aggiorna OV e Chiudi'
+      Default = True
+      TabOrder = 2
+      OnClick = BtnAggOVClick
+    end
+    object BtnCopia: TButton
+      Left = 5
+      Top = 6
+      Width = 56
+      Height = 25
+      Caption = 'Copia'
+      Default = True
+      TabOrder = 0
+      OnClick = BtnCopiaClick
+    end
+    object BtnIncolla: TButton
+      Left = 67
+      Top = 6
+      Width = 57
+      Height = 25
+      Caption = 'Incolla'
+      Default = True
+      TabOrder = 1
+      OnClick = BtnIncollaClick
+    end
+    object BtnStdOk: TButton
+      Left = 241
+      Top = 6
+      Width = 75
+      Height = 25
+      Caption = 'Salva PI'
+      Default = True
+      TabOrder = 4
+      OnClick = BtnStdOkClick
+    end
+    object BtnStd2Ok: TButton
+      Left = 322
+      Top = 6
+      Width = 75
+      Height = 25
+      Caption = 'Salva e apri PI'
+      Default = True
+      TabOrder = 5
+      OnClick = BtnStd2OkClick
+    end
+    object btStorico: TButton
+      Left = 130
+      Top = 6
+      Width = 105
+      Height = 25
+      Caption = 'Storico ultimi carichi'
+      Default = True
+      TabOrder = 6
+      OnClick = btStoricoClick
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
+  object QryStorico: TQueryPars
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 481
+    Top = 9
+  end
+  object DsStorico: TDataSource
+    DataSet = QryStorico
+    Left = 480
+    Top = 43
+  end
+end
diff --git a/source/PI_Altag_GstPI/FGstPI.pas b/source/PI_Altag_GstPI/FGstPI.pas
new file mode 100644
index 0000000..47b5ca4
--- /dev/null
+++ b/source/PI_Altag_GstPI/FGstPI.pas
@@ -0,0 +1,2467 @@
+unit FGstPI;
+
+interface
+
+uses
+  Winapi.Windows, Vcl.Forms, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls,
+  Data.DB, OLEDBComponents, Vcl.DBGrids, AdvGroupBox, CSETables,
+  UCoreTipi, Vcl.Grids, OGstPI, IProduzione, Vcl.ComCtrls, Compf2,
+  CSGroupBox, SMDBGrid, QueryPars, CSFileCfg;
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
+  TFrmGstPI = class(TForm)
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
+    BtnStd2Ok: TButton;
+    btStorico: TButton;
+    TabStorico: TTabSheet;
+    QryStorico: TQueryPars;
+    DsStorico: TDataSource;
+    SMDBGridStorico: TSMDBGrid;
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
+    procedure SG_CSvilSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
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
+    procedure btStoricoClick(Sender: TObject);
+    procedure BtnStd2OkClick(Sender: TObject);
+  private
+//
+//  File ini
+//
+    sCausali          : String;
+    FileIni           : TCSFileCfg;
+
+    // isInIns: Boolean;
+    DatiPI: TDatiPI;
+    NtabtmpCopia: String;
+    DiametroMin: Double;
+    IDlavorazione: Integer;
+    IDCompDefault: Integer;
+    ext_pialtatg: TExt_GstPI;
+    UtentiAbilitati: String;
+    IDTipiDocVendita  : TStrings;
+    IDTipiDocSiCosto  : TStrings;
+    IDTipiDocNoCosto  : TStrings;
+//
+//  Funzioni e/o procedure
+//
+    function  LeggiFileIni : Boolean;
+    function  SalvaFileIni : Boolean;
+
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
+    function  AssegnaControlliDatiComPI(FOP: IPrev) : Boolean;
+    procedure AssegnaCampiOptesDatiCont(FOP: IPrev);
+    procedure LeggiMateriale;
+    procedure AggiornaCosti;
+    procedure AggiornaPesi(IdOpTes, IdArtico: Integer);
+    //SD 04/10/2010 : RI #9595
+    function ValidaControlli : Boolean;
+    function getTipDocOV(IdComRig : Integer ): Integer;
+    function SalvaPI : Boolean;
+    { Private declarations }
+  public
+    { Public declarations }
+    idcomrig: integer;
+    livello: Tlivello;
+    AskAggPrezzoComRig: Integer;
+    OpenPI : Integer;
+    //CostoTot: double;
+    Abort: Boolean;
+    bSolaLettura: Boolean;
+    function ValidaUtente: Boolean;
+  end;
+
+const
+  NOME_FILE_INI = 'ALTAG.CFG';
+
+var
+  FrmGstPI: TFrmGstPI;
+
+implementation
+
+uses
+ RNumb, UCoreUtils, RDate, S3DB, UCoreDB, Vcl.Dialogs, System.SysUtils,
+ RSQL, RString, RMiscComp, S3Registry, OOrPr;
+
+{$R *.DFM}
+
+procedure TFrmGstPI.FormShow(Sender: TObject);
+var
+  QryTmp: TCSEQuery;
+  ini: TCSFileCfg;
+  idCauMovR, i: Integer;
+  ValStr, chiave: string;
+  //SD 04/10/2010 : RI #9595
+  QrytmpArt : TCSEQuery;
+  MsgErr    : String;
+  sChiave   : String;
+  IDGruppo  : Integer;
+  bLetto    : Boolean;
+begin
+  OpenPI := 0;
+  bLetto := LeggiFileIni();
+  if (bLetto = false) then Exit;
+
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
+//  LS 27/11/2020 Modificata Ricerca NumOp adeguando alle logiche STD.
+//  QryNextNumOP.SQL.Text:= 'SELECT MAX(NUMOP) ULTIMO FROM OPTES '+
+//                          'WHERE (ANNOP= :ANNOP) AND (IDTIPIDOC= :IDTIPIDOC) ';
+  QryNextNumOP.SQL.Text:= 'SELECT MAX(NUMOP) ULTIMO FROM OPTES tes '+
+                          'join TipiDoc td on tes.idTipiDoc=td.Id  '+
+                          'WHERE (ANNOP= :ANNOP) AND (tes.TIPNUM= :TIPNUM) '+
+                          'and (td.TipDoc=(select t.TipDoc from TipiDoc t where (t.Id= :IDTIPIDOC))) ';
+//  ...LS 27/11/2020
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
+      if QryTmp.fieldbyname('idoptes').asinteger>0 then 
+      begin  //  il preventivo SAM � gi� inserito
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
+      if QryTmp.fieldbyname('ext_pialtatg_id').asinteger>0 then 
+      begin  //  leggo i dati relativi al preventivo altag
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
+      if QryTmp.fieldbyname('idoptes').asinteger>0 then 
+      begin
+        if DatiPI.IdArticoC<>0 then
+          i:=DatiPI.IdArticoC  // se il preventivo � gia inserito prendo il componente del preventivo
+        else if ext_pialtatg.found then
+          i:=ext_pialtatg.campi.idmateriale
+        else
+          i:=IDCompDefault;
+
+        if cercaOPDP(QryTmp.fieldbyname('idoptes').asinteger, i) then
+        begin
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
+  Ini := TCSFileCfg.Create(extractfilepath(Glo.IniGenerale)+NOME_FILE_INI);
+  IDTipiDocVendita := TStringList.Create;
+  IDTipiDocSiCosto := TStringList.Create;
+  IDTipiDocNoCosto := TStringList.Create;  
+  try
+    DiametroMin := Ini.ReadFloat('PrevInd', 'DiametroMin', 0);
+//    IDlavorazione:= Ini.ReadInteger('PrevInd', 'IDlav', 0);
+
+    sChiave := 'IDlav' + IntToStr(Utente.Id);
+    IDlavorazione:= Ini.ReadInteger('PrevInd', sChiave, 0);
+
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
+    IDTipiDocVendita.CommaText := Ini.ReadString('PrevInd', 'IDTipiDocVendita', '');
+    IDTipiDocSiCosto.CommaText := Ini.ReadString('PrevInd', 'IDTipiDocSiCosto', '');
+    IDTipiDocNoCosto.CommaText := Ini.ReadString('PrevInd', 'IDTipiDocNoCosto', '');
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
+{
+  if IDlavorazione=0 then
+    showmessage('ATTENZIONE: Non � stata impostata la lavorazione nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''IDlav'')');
+}    
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
+///  BtnAggOV.enabled:=ValidaUtente;
+///
+//
+//  M.B. RI: 10242
+//
+  F2IdTipiDoc.ReadOnly := bSolaLettura;
+  F2Lav.ReadOnly := bSolaLettura;
+  F2Materiale.ReadOnly := bSolaLettura;
+  F2IdTipiDoc.Enabled := not bSolaLettura;
+  F2Lav.Enabled := not bSolaLettura;
+  F2Materiale.Enabled := not bSolaLettura;
+
+  edt_Costo.ReadOnly := bSolaLettura;
+  edt_TCosto.ReadOnly := bSolaLettura;
+  Edt_Fmmmin.ReadOnly := bSolaLettura;
+  Edt_SpazioRall.ReadOnly := bSolaLettura;
+  Edt_Rall.ReadOnly := bSolaLettura;
+  Edt_TForat.ReadOnly := bSolaLettura;
+  Edt_TAttr.ReadOnly := bSolaLettura;
+  Edt_TempoPrev.ReadOnly := bSolaLettura;
+  GB_Sviluppo.Enabled := not bSolaLettura;
+  GB_CostoTaglio.Enabled := not bSolaLettura;
+  GB_Lastre.Enabled := not bSolaLettura;
+
+  edtPeMCMa.ReadOnly := bSolaLettura;
+  edtImpMa.ReadOnly := bSolaLettura;
+  edtPeMCLI.ReadOnly := bSolaLettura;
+  edtImpLI.ReadOnly := bSolaLettura;
+  edtPeMCLE.ReadOnly := bSolaLettura;
+  edtImpLE.ReadOnly := bSolaLettura;
+  edtPeUlMC.ReadOnly := bSolaLettura;
+  edtImpUl.ReadOnly := bSolaLettura;
+  edtPeUlSc.ReadOnly := bSolaLettura;
+  edtImpSc.ReadOnly := bSolaLettura;
+
+  if (bSolaLettura) then
+  begin
+    BtnCopia.Enabled := not bSolaLettura;
+    BtnIncolla.Enabled := not bSolaLettura;
+    BtnStdOk.Enabled := not bSolaLettura;
+    BtnStd2Ok.Enabled := not bSolaLettura;
+    BtnAggOV.Enabled := not bSolaLettura;
+  end;
+end;
+
+function TFrmGstPI.getTipDocOV(IdComRig: Integer): Integer;
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
+procedure TFrmGstPI.PageControl1Change(Sender: TObject);
+var
+  Msg: String;
+begin
+  if (PageControl1.Pages[1].Visible) and (PageControl1.Pages[1].Name = 'TabDatiCom') then
+  begin
+//  Verifica se l'utente � abiltato o non abilitato all'accesso alla pagina 'Dati Commerciali'
+    if not ValidaUtente then
+    begin
+        PageControl1.ActivePage := TabDatiTec;
+        Msg := 'Attenzione l''utente non ha l''accesso alla visualizzazione della pagina ''Dati Commerciali''.';
+        Application.MessageBox(PChar(Msg),
+                               PChar(Application.Title),
+                               MB_ICONWARNING + MB_OK);
+    end;
+  end;
+
+  if (PageControl1.Pages[2].Visible) and (PageControl1.Pages[2].Name = 'TabStorico') then
+  begin
+    btStoricoClick(Sender);
+  end;
+end;
+
+procedure TFrmGstPI.F2MaterialeKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+var
+  idoptes, idmat : Integer;
+begin
+  LeggiMateriale;
+
+  edt_Costo.text:='0';
+  edt_TCosto.text:='';
+//
+//  Tentativo di aggiornamento del prezzo
+//
+  idoptes:=0;
+  if ext_pialtatg.found then
+  begin
+    idoptes := ext_pialtatg.campi.idoptes;
+  end;
+
+  if F2Materiale.KeyValue>0 then
+    idmat:=F2Materiale.KeyValue
+  else
+    idmat:=IDCompDefault;
+
+  if cercaOPDP(idoptes, idmat) then
+  begin
+    edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+    edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
+  end;
+end;
+
+procedure TFrmGstPI.F2LavKeyChange(Sender: TObject; NewKey,
+  OldKey: Integer);
+begin
+  LeggiMateriale;
+end;
+
+procedure TFrmGstPI.LeggiMateriale;
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
+function TFrmGstPI.cercaextvelAltatg(idgruppi, idmarche, idLav: integer; spessore: Double): boolean;
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
+function TFrmGstPI.cercaCompPrinc(ParidComrig: integer): boolean;
+begin
+  //  cerco l'eventuale componente principale
+  //
+  QrySelCompPrinc.close;
+  QrySelCompPrinc.parambyname('idcomrig').asinteger:=ParidComrig;
+  QrySelCompPrinc.open;
+  result:= (not QrySelCompPrinc.isempty);
+end;
+
+function TFrmGstPI.cercaOPDP(idOptes, idArtico: integer): boolean;
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
+function TFrmGstPI.cercaSdlMat(idopdtPadre, idArtico: integer): boolean;
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
+function TFrmGstPI.cercaSdlFas(idopdtPadre, idArtico: integer): boolean;
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
+function TFrmGstPI.cercaOPDTpf(idoptes, idArticoPF: integer): boolean;
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
+procedure TFrmGstPI.Edt_SvilLinKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  if sender is tedit then begin
+    CheckImporto(Key, tedit(sender).text);
+  end;
+end;
+
+procedure TFrmGstPI.Edt_SvilLinExit(Sender: TObject);
+begin
+  if sender is tedit then begin
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 2);
+  end;
+
+end;
+
+procedure TFrmGstPI.Edt_NProfExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 0);
+end;
+
+procedure TFrmGstPI.edt_NLastreExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 5);
+end;
+
+procedure TFrmGstPI.Edt_TotTaglio1PzExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Importo);
+end;
+
+procedure TFrmGstPI.Edt_RallExit(Sender: TObject);
+begin
+  if sender is tedit then
+    tedit(sender).text:=formatvariant(ExtractVariant(tedit(sender).text, Importo), Perc, 2);
+end;
+
+procedure TFrmGstPI.Edt_SvilLinChange(Sender: TObject);
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
+procedure TFrmGstPI.Edt_PezziLastraChange(Sender: TObject);
+begin
+  if sender is tedit then begin
+    if (tedit(sender).name=Edt_PezziLastra.name) then
+      CalcolaNLastre;
+  end;
+end;
+
+procedure TFrmGstPI.BtnStdAnnullaClick(Sender: TObject);
+begin
+  QryStorico.Close();
+
+  AggOPTESDatiCont;
+
+  Close();
+end;
+
+procedure TFrmGstPI.PulisciDatiPI(myDatiPI: TDatiPI);
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
+function TFrmGstPI.ValidaControlli: Boolean;
+var
+  bChiediCosto : Boolean;
+begin
+  if F2Materiale.KeyValue = 0 then
+  begin
+    Result := False;
+    Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                            PChar( APPTITLE ),
+                            MB_OK + MB_ICONINFORMATION );
+    if F2Materiale.CanFocus then
+      F2Materiale.SetFocus;
+    Exit;
+  end;
+//
+//  Verifico che il tipo documento della commessa che ha generato il PI sia del
+//  tipo che richiede i dati della Lastra
+//
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
+    if ZeroIfNull(ExtractVariant(Edt_NLastre.Text, Importo)) = 0 then
+    begin
+      Result := False;
+      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+      if Edt_NLastre.CanFocus then
+        Edt_NLastre.SetFocus;
+      Exit;
+    end;
+  end;
+//
+//  Verifico che il tipo documento della commessa che ha generato il PI sia del
+//  tipo che richiede (non obbligatorio) i dati del costo
+//
+  bChiediCosto := true;
+  if ( IDTipiDocSiCosto.Count > 0 ) and (IDTipiDocSiCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+  begin
+    bChiediCosto := false;
+{
+    if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+    begin
+      Application.MessageBox( PChar( 'Attenzione Costo non specificato.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+    end;
+}    
+  end;
+//
+//  Verifico che il tipo documento della commessa che ha generato il PI sia del
+//  tipo che non richiede i dati del costo
+//
+  if ( IDTipiDocNoCosto.Count > 0 ) and (IDTipiDocNoCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+  begin
+    if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+    begin
+      bChiediCosto := false;
+{
+      Application.MessageBox( PChar( 'Attenzione Costo non specificato.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+}
+    end;
+  end;
+//
+//  Verifico che il tipo documento del prev. industriale richieda obbligatoriamente
+//  il costo (ossia non � nessuno dei tipi documento precedenti)
+//
+  if (bChiediCosto) then
+  begin
+    if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+    begin
+      Result := False;
+      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+      if edt_Costo.CanFocus then
+      begin
+        edt_Costo.SetFocus;
+      end;
+      Exit;
+    end;
+  end;
+
+  Result := True;
+end;
+
+function TFrmGstPI.ValidaUtente: Boolean;
+begin
+  Result := True;
+
+  if Pos(Utente.ConnectId, UtentiAbilitati) = 0 then
+    Result := False;
+end;
+
+procedure TFrmGstPI.BtnStdOkClick(Sender: TObject);
+begin
+  inherited;
+
+  OpenPI := 0;
+  SalvaPI();
+end;
+
+procedure TFrmGstPI.BtnStd2OkClick(Sender: TObject);
+var
+  bSalvata : Boolean;
+begin
+
+  OpenPI := 1;
+  bSalvata := SalvaPI();
+  if (bSalvata) then
+  begin
+    QryStorico.Close();
+    AggOPTESDatiCont;
+    Close();
+  end;
+end;
+
+function TFrmGstPI.SalvaPI : Boolean;
+var
+  FOP: IPrev;
+  idoptes, idDTpadre: Integer;
+  isInIns: Boolean;
+  bChiediCosto: Boolean;
+begin
+  {  cv 08.03.04  Finire di implememtare la visualizzazione dell'op, in quanto
+                  ci sono dei problemi perch� i documenti di vendita sono modali
+                  e quelli della produzione no  }
+   //  if CalcolaPeso(true)>0 then begin
+   //SD 04/10/2010 : RI #9595
+  Result := false;
+  if not ValidaControlli then
+  begin
+    Exit;
+  end;
+
+  if CalcolaPeso(false)>0 then
+  begin
+    if F2IdTipiDoc.keyvalue>0 then
+    begin
+      //  if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin   cv  01.03.06  disponibile dalla 2.18
+      if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then
+      begin
+        idoptes:=0;
+
+        if ext_pialtatg.found then
+        begin
+          FOP.seek('id', ext_pialtatg.campi.idoptes);
+        end
+        else begin
+          FOP.ResetCampi;
+        end;
+
+        AggOPTES(FOP);
+
+        if FOP.Found then
+        begin
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
+          AggOPDP(FOP, idoptes, idDTpadre, isInIns);
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
+          AggiornaPesi(idoptes, F2Materiale.KeyValue); // SF...31/07/2007
+          if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+          begin
+//
+//          Verifico che il tipo documento della commessa che ha generato il PI sia del
+//          tipo che richiede (non obbligatorio) i dati del costo
+//
+            bChiediCosto := true;
+            if ( IDTipiDocSiCosto.Count > 0 ) and (IDTipiDocSiCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+            begin
+              bChiediCosto := false;
+              if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+              begin
+                Application.MessageBox( PChar( 'Attenzione.'+CRLF+'il salvataggio � avvenuto correttamente ma il costo non � valorizzato.' ),
+                                        PChar( APPTITLE ),
+                                        MB_OK + MB_ICONINFORMATION );
+              end;
+            end;
+//
+//          Verifico che il tipo documento della commessa che ha generato il PI sia del
+//          tipo che non richiede i dati del costo
+//
+            if ( IDTipiDocNoCosto.Count > 0 ) and (IDTipiDocNoCosto.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
+            begin
+              if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+              begin
+                bChiediCosto := false;
+{
+                Application.MessageBox( PChar( 'Attenzione.'+CRLF+'il salvataggio � avvenuto correttamente ma il costo non � valorizzato.' ),
+                                        PChar( APPTITLE ),
+                                        MB_OK + MB_ICONINFORMATION );
+}
+              end;
+            end;
+//
+//          Verifico che il tipo documento del prev. industriale richieda obbligatoriamente
+//          il costo (ossia non � nessuno dei tipi documento precedenti)
+//
+            if (bChiediCosto) then
+            begin
+              if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
+              begin
+                Application.MessageBox( PChar( 'Attenzione.'+CRLF+'il salvataggio � avvenuto correttamente.'+CRLF+'Per proseguire � necessario specificare il valore.' ),
+                                        PChar( APPTITLE ),
+                                        MB_OK + MB_ICONINFORMATION );
+                if edt_Costo.CanFocus then
+                begin
+                  edt_Costo.SetFocus;
+                end;
+                Exit;
+              end;
+            end;
+          end;
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
+        if idoptes>0 then
+        begin
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
+
+        Result := true;
+      end
+      else
+      begin
+        Showmessage('ATTENZIONE: Modulo produzione non disponibile');
+      end;
+    end
+    else
+    begin
+      Showmessage('ATTENZIONE: Inserire il tipo documento');
+    end;
+  end;
+end;
+//  ----------------------------------------------------------------------------
+//  Visualizza lo storico
+//  ----------------------------------------------------------------------------
+procedure TFrmGstPI.btStoricoClick(Sender: TObject);
+begin
+  try
+    QryStorico.DatabaseName:=Azienda.DatabaseName;
+    QryStorico.Sql.Clear;
+
+    QryStorico.Sql.Add('select * from (select	top 10 pf.CODICE CODFOR, pf.DESCR1 DESCRFOR, '+
+                          'td.DESCR DESCRDDT, m.NUMDOC NUMDDT, m.ANNDOC ANNDDT, m.DATDOC DATDDT, '+
+                          'tf.DESCR DESCRFAT, m.NUMFAT NUMFAT, m.ANNFAT ANNFAT, m.DATFAT DATFAT, '+
+                          'c.CODICE CODCAU, c.DESCR DESCRCAU, a.CODICE CODART, a.DESCR DESCRART, '+
+                          'l.NUMLOT, l.NUMSER, m.DATMOV, m.QTAINV, m.QTAMOV, m.QTAFOR, '+
+                          'm.Valuni VALUNI, m.Valore VALORE, '+
+                          '(case when m.QTAFOR > 0 '+
+                              'then nullif(m.VALORE/nullif(m.QTAFOR,0),0) '+
+                              'else 0 end) VALOREFOR, '+
+                          'a.UMI, ' + CS_VariantTo_SqlStr(Azienda.RValutaSI.SimboloEuro) + ' CODVALUNI, '+
+                          'm.Cambio CAMBIO, '+
+                          'm.VALUNIVAL VALUNIVAL, m.VALVAL VALVAL, '+
+                          '(case when m.QTAFOR > 0 '+
+                              'then nullif(m.VALVAL/nullif(m.QTAFOR,0),0) '+
+                              'else 0 end) VALVALFOR, '+
+                          'o.UMF, '+
+                          '(case when v.CODICE is not null '+
+                              'then v.CODICE '+
+                              'else ' + CS_VariantTo_SqlStr(Azienda.RValutaSI.SimboloEuro) + ' end) CODVALVAL '+
+                       'from MOVMAG as m '+
+                          'inner join LOTSER as l on l.id=m.idArtico '+
+                          'inner join ARTICO as a on a.id=l.idArtico '+
+                          'inner join CAUMOV c on c.id= m.IDCAUMOV '+
+                          'left outer join OACRIG o on o.id=m.idOacRig '+
+                          'left outer join TIPIDOC td on td.ID=m.IDTIPDOC '+
+                          'left outer join TIPIDOC tf on tf.ID=m.IDTIPFAT '+
+                          'left outer join FORNITORI f on f.id=m.idForPar '+
+                          'left outer join PERSONE pf on pf.id=f.idPersona '+
+                          'left outer join VALUTA v on v.Id = m.IdValuta '+
+                       'where m.IDCAUMOV in (' + sCausali + ') and (l.idArtico=' + IntToStr(F2Materiale.KeyValue) + ') '+
+                          'order by m.id desc) as tmp');
+    QryStorico.Open;
+
+    PageControl1.ActivePageIndex := 2;
+  except
+    on E: Exception do
+    begin
+      Application.MessageBox(PChar(E.message),
+                             PChar(APPTITLE),
+                             MB_ICONERROR + MB_OK);
+    end;
+  end; // end try...except
+end;
+
+procedure TFrmGstPI.AggOPTES(FOP: IPrev);
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
+    QryNextNumOP.parambyname('TIPNUM').Asstring:=F2IdTipiDoc.qryf2.fieldbyname('TIPNUM').asstring; //LS 27/11/2020
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
+procedure TFrmGstPI.AggOPTESDatiCont;
+var
+  FOP: IPrev;
+begin
+  if ext_pialtatg.found then begin
+    // if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin  cv  01.03.06  disponibile dalla 2.18
+    if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then
+    begin
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
+procedure TFrmGstPI.AssegnaCampiOptesDatiCont(FOP: IPrev);
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
+procedure TFrmGstPI.AggOPDT(FOP: IPrev; idoptes, idDTpadre: integer; var isInIns: Boolean);
+var
+  idt, mseq, idmat: Integer;
+
+  procedure ImpostaRiferimentoListino;
+  var
+    lQrySel: TCSEQuery;
+    lidCli, lIdLisTes: integer;
+
+  begin
+
+    lQrySel := TCSEquery.Create(nil);
+    lQrySel.DataBaseName := DBExec.DataBaseName;
+    try
+      lQrySel.SQL.Text := 'select IDCLIENTE from COMTES tes join COMRIG rig on rig.IDCOMTES=tes.ID where (rig.ID='+CS_KeyValueTo_SqlStr(idcomrig)+') ';
+      try
+        lQrySel.Open;
+        lidCli := 0;
+        if ( not lQrySel.eof ) then
+          lidCli := lQrySel.FieldByName('IDCLIENTE').asInteger;
+
+        if ( lidCli = 0 )  then
+          Exit;
+
+        lQrySel.Close;
+        lQrySel.SQL.TExt := 'select top 1 ' +
+                              '(case when (sco.ID is not null) then -1 else 0 end) as ORDINE' +
+                              ', DATINI' +
+                              ', tes.ID ' +
+                            'from ' +
+                              'LISTES tes ' +
+                            'left join ' +
+                              'SCOCLI sco on (sco.IDLISTES=tes.ID) and (sco.IDCLIENTE='+CS_KeyValueTo_SqlStr(lidCli)+') ' +
+                            'where ' +
+                              '(exists (select ID from LISRIG where (IDLISTES=tes.ID) and (IDARTICO='+CS_KeyValueTo_SqlStr(idmat)+'))) ' +
+                            'and ' +
+                              '(isnull(tes.DATINI, 0)<='+CS_VariantTo_SqlStr(Azienda.Data)+') ' +
+                            'and ' +
+                              '((isnull(tes.DATFIN, 0)=0) or (isnull(tes.DATFIN, 0)>='+CS_VariantTo_SqlStr(Azienda.Data)+')) ' +
+                            'order by ' +
+                              'ORDINE' +
+                              ', tes.DATINI ';
+        lIdLisTes := 0;
+        lQrySel.Open;
+        if ( not lQrySel.eof ) then
+          lIdLisTes := lQrySel.FieldByName('ID').asInteger;
+
+        FOP.SetCampi('idCli', lidCli);
+        FOP.SetCampi('idLisTes', lIdLisTes);
+
+      except on e:exception do
+
+      end;
+    finally
+      lQrySel.Close;
+      FreeAndNil(lQrySel);
+    end;
+
+
+  end;
+
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
+
+
+  FOP.AggOPDT(idt);
+  if isInIns or (DatiPI.IdOPDTC=0) then begin
+    if cercaCompPrinc(idcomrig) then begin  //  aggiorno DatiPI. cosi se premo salva pi un'altra volta non lo accoda
+      DatiPI.IdOPDTC:=QrySelCompPrinc.fieldbyname('id').asinteger;
+    end;
+  end;
+  DatiPI.IdArticoC:=F2Materiale.KeyValue;   //  cosi rimane allineato
+end;
+
+procedure TFrmGstPI.AggOPDP(FOP: IPrev; idoptes, idDTpadre: integer; isInIns: Boolean);
+var
+  idmat: integer;
+begin
+  if F2Materiale.KeyValue>0 then
+    idmat:=F2Materiale.KeyValue
+  else
+    idmat:=IDCompDefault;
+
+
+
+
+
+
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
+procedure TFrmGstPI.AggSdlMat(FOP: IPrev; idoptes, idDTpadre: integer);
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
+procedure TFrmGstPI.AggSdlFas(FOP: IPrev; idoptes, idDTpadre: integer);
+var
+  {idFas: integer;}
+  FTmpOP: IOrPr;
+  qryApp : TCSEQuery;
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
+
+    // GLF...
+    qryApp := TCSEQuery.Create(nil);
+    qryApp.DatabaseName := Azienda.DatabaseName;
+    try // finally
+      qryApp.SQL.Text := 'select CosUni, CosUniMA, CosUniUL, CosUniUA from Lavorazioni where Id='+CS_Keyvalueto_SQLStr(F2Lav.KeyValue);
+      qryApp.Open;
+      FOP.SetCampiSdlF('CosUni', QryApp.FieldByName('CosUni').AsFloat);
+      FOP.SetCampiSdlF('CosUniMA', QryApp.FieldByName('CosUniMA').AsFloat);
+      FOP.SetCampiSdlF('CosUniUL', QryApp.FieldByName('CosUniUL').AsFloat);
+      FOP.SetCampiSdlF('CosUniUA', QryApp.FieldByName('CosUniUA').AsFloat);
+    finally
+      qryApp.Close;
+      qryApp.Free;
+    end; // finally
+    // ...GLF
+
+    FOP.AggOPSdlF(DatiPI.idopsdlfas);
+  end;
+end;
+
+procedure TFrmGstPI.AssegnaCampiExtRig(idoptes: integer);
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
+  for i:=1 to SG_CSvil.rowcount do 
+  begin
+    tmp:=tmp+floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo)))+';'+
+             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+';'+
+             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo)))+';';
+
+    
+//    if length(tmp)>length(ext_pialtatg.campi.sviluppo) then
+//      ShowMessage('ATTENZIONE: riga '+inttostr(i)+' non salvata correttamente.');
+  end;
+  
+  ext_pialtatg.campi.sviluppo:=tmp;
+  if ext_pialtatg.found then
+    ext_pialtatg.modifica
+  else
+    ext_pialtatg.insert;
+end;
+
+procedure TFrmGstPI.AssegnaControlliExtRig;
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
+procedure TFrmGstPI.FormCreate(Sender: TObject);
+begin
+  ext_pialtatg := TExt_GstPI.Create('ext_pialtatg', DbExec, Utente);
+//
+// Caricamento dei dati relativi alla griglia
+//
+  SMDBGridStorico.IniFileName := Glo.IniUtente;
+  SMDBGridStorico.IniSection := Name + Azienda.Id + '_' + SMDBGridStorico.Name;
+  SMDBGridStorico.LoadFromIniFile;
+end;
+
+procedure TFrmGstPI.FormDestroy(Sender: TObject);
+begin
+  SalvaFileIni;
+//
+//  Salvataggio dei dati relativi alla griglia
+//
+  SMDBGridStorico.IniFileName := Glo.IniUtente;
+  SMDBGridStorico.IniSection := Name + Azienda.Id + '_' + SMDBGridStorico.Name;
+  SMDBGridStorico.SaveToIniFile;
+
+  ext_pialtatg.free;
+  FreeAndNil(IDTipiDocVendita);
+  FreeAndNil(IDTipiDocSiCosto);
+end;
+
+procedure TFrmGstPI.SG_CSvilKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  CheckImporto(Key, tedit(sender).text);
+end;
+
+procedure TFrmGstPI.SG_CSvilSetEditText(Sender: TObject; ACol,
+  ARow: Integer; const Value: String);
+begin
+  if ACol=0 then
+    CalcolaSvilLin
+  else if (ACol=1) or (ACol=2) then
+    CalcolaSvilCerchi;
+end;
+
+procedure TFrmGstPI.CalcolaSvilLin;
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
+procedure TFrmGstPI.CalcolaSvilCerchi;
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
+procedure TFrmGstPI.CalcolaNLastre;
+begin
+  // edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))+0.499, Quantita, 0);
+  if zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))<>0 then
+    edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo)), Quantita, 5);
+end;
+
+procedure TFrmGstPI.CalcolaTempo;
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
+function TFrmGstPI.CalcolaPeso(msg: boolean): double;
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
+function TFrmGstPI.SecCToSecS(MinSecC: double): double;
+var
+  TmpMin, TmpSec: Double;
+begin
+  {  Trasforma i secondi espressi in centesimi in secondi espressi in sessantesimi  }
+  TmpMin:=int(MinSecC);
+  TmpSec:=Frac(MinSecC)*0.6;
+  result:=TmpMin+TmpSec;
+end;
+
+function TFrmGstPI.SecSToSecC(MinSecS: double): double;
+var
+  TmpMin, TmpSec: Double;
+begin
+  {  Trasforma i secondi espressi in sessantesimi in secondi espressi in centesimi  }
+  TmpMin:=int(MinSecS);
+  TmpSec:=Frac(MinSecS)/0.6;
+  result:=TmpMin+TmpSec;
+end;
+
+function TFrmGstPI.MinToSecS(Minuti: double): double;
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
+function TFrmGstPI.SecSToMin(Secondi: double): double;
+var
+  TmpMin, TmpSec: Double;
+begin
+  TmpMin:=int(Secondi/60);
+  TmpSec:=(Secondi-TmpMin*60)/100;
+  result:=TmpMin+TmpSec;
+end;
+
+procedure TFrmGstPI.edtPeMCMaKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  if sender is tedit then begin
+    CheckImporto(Key, tedit(sender).text);
+  end;
+end;
+
+procedure TFrmGstPI.edtImpMaKeyPress(Sender: TObject; var Key: WideChar);
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
+procedure TFrmGstPI.edtPeMCMaExit(Sender: TObject);
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
+procedure TFrmGstPI.edtImpMaExit(Sender: TObject);
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
+procedure TFrmGstPI.CalcolaTotDatiCom;
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
+  if zeroifnull(extractvariant(Lab_Qta.caption, importo))<>0 then 
+  begin
+    edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
+    edtTotaleUni.text:=formatvariant(zeroifnull(ExtractVariant(edtTotale.text, Importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)) , Importo, Azienda.RValutaSI.DecMaxEuro);
+  end;
+end;
+
+function TFrmGstPI.AssegnaControlliDatiComPI(FOP: IPrev) : Boolean;
+var
+  idmat: integer;
+begin
+  Result := false;
+  if F2Materiale.KeyValue>0 then
+    idmat:=F2Materiale.KeyValue
+  else
+    idmat:=IDCompDefault;
+
+  if cercaOPDP(fop.GetCampi('id'), idmat) then
+  begin
+    edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
+    edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
+    Result := true;
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
+procedure TFrmGstPI.BtnCopiaClick(Sender: TObject);
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
+procedure TFrmGstPI.BtnIncollaClick(Sender: TObject);
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
+procedure TFrmGstPI.AggiornaCosti;
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
+procedure TFrmGstPI.edt_CostoKeyPress(Sender: TObject; var Key: WideChar);
+begin
+  if sender is tedit then begin
+    CheckImporto(Key, tedit(sender).text);
+  end;
+  edt_TCosto.text:='';
+end;
+
+procedure TFrmGstPI.BtnAggOVClick(Sender: TObject);
+begin
+  OpenPI := 0;
+  SalvaPI();
+
+  AskAggPrezzoComRig:=1;  //  l'utente desidera aggiornare la commessa
+  QryStorico.Close();
+  AggOPTESDatiCont;
+  Close();
+end;
+
+procedure TFrmGstPI.AggiornaPesi(IdOpTes, IdArtico: Integer);
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
+// -----------------------------------------------------------------------------
+//  Caricamento dati file ini
+// -----------------------------------------------------------------------------
+function TFrmGstPI.LeggiFileIni: Boolean;
+var
+  sMsg : String;
+begin
+  Result  := true;
+  FileIni := TCSFileCfg.Create(ExtractFilePath(Glo.IniGenerale)+NOME_FILE_INI);
+  try
+    try
+      sCausali := FileIni.ReadString ('PrevInd', 'StrCauMov', '');
+      if (sCausali = '') then
+      begin
+        sMsg := 'Chiave [StrCauMov] non specificata nel file ini';
+        raise exception.create(sMsg);
+      end;
+    except
+      on E: Exception do
+      begin
+        Result := false;
+        Application.MessageBox(PChar(E.message),
+                               PChar(APPTITLE),
+                               MB_ICONERROR + MB_OK);
+      end;
+    end; // end try...except
+  finally
+    FreeAndNil(FileIni);
+  end;
+end;
+
+function TFrmGstPI.SalvaFileIni;
+var
+  sChiave : String;
+begin
+  Result  := true;
+  FileIni := TCSFileCfg.Create(ExtractFilePath(Glo.IniGenerale)+NOME_FILE_INI);
+  try
+    try
+      sChiave := 'IDlav' + IntToStr(Utente.Id);
+      FileIni.WriteInteger('PrevInd', sChiave, F2Lav.KeyValue);
+      FileIni.UpdateFile;
+    except
+      on E: Exception do
+      begin
+        Result := false;
+        Application.MessageBox(PChar(E.message),
+                               PChar(APPTITLE),
+                               MB_ICONERROR + MB_OK);
+      end;
+    end; // end try...except
+  finally
+    FreeAndNil(FileIni);
+  end;
+end;
+
+end.
+
diff --git a/source/PI_Altag_GstPI/OGstPI.pas b/source/PI_Altag_GstPI/OGstPI.pas
new file mode 100644
index 0000000..65cb5ff
--- /dev/null
+++ b/source/PI_Altag_GstPI/OGstPI.pas
@@ -0,0 +1,186 @@
+unit OGstPI;
+
+interface
+
+uses
+  System.SysUtils, S3Registry, cStd, RSQL;
+
+const
+  CAMPICOUNTEXT_GSTPI = 17;
+
+type
+  TCountext_GstPI = Array[0..(CAMPICOUNTEXT_GSTPI - 1)] of Boolean;
+
+  TCampiext_GstPI = record
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
+    sviluppo     : String;//[250];   //     17.
+    idopsdlfas   : Integer;
+  end;
+
+  TExt_GstPI = Class(TOStd)
+    Campi: TCampiext_GstPI;
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
+procedure TExt_GstPI.AssegnaCampi;
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
+procedure TExt_GstPI.ResetCampi;
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
+    sviluppo     := '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;';// '';
+  end;
+end;
+
+function TExt_GstPI.Insert: integer;
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
+function TExt_GstPI.Modifica: boolean;
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
+  RegObjStdD2(TExt_GstPI, 'ObjExt_GstPI');
+
+finalization
+  UnRegOggetto('ObjExt_GstPI');
+end.
diff --git a/source/PI_Altag_GstPI/PI_Altag_GstPI.dpk b/source/PI_Altag_GstPI/PI_Altag_GstPI.dpk
new file mode 100644
index 0000000..2fd4b01
--- /dev/null
+++ b/source/PI_Altag_GstPI/PI_Altag_GstPI.dpk
@@ -0,0 +1,41 @@
+package PI_Altag_GstPI;
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
+  M_Prd,
+  M_Doc;
+
+contains
+  UGstPI in 'UGstPI.pas',
+  FGstPI in 'FGstPI.pas' {FrmGstPI},
+  OGstPI in 'OGstPI.pas';
+
+  {$SetPEFlags $0800}
+end.
diff --git a/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj b/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
new file mode 100644
index 0000000..b745207
--- /dev/null
+++ b/source/PI_Altag_GstPI/PI_Altag_GstPI.dproj
@@ -0,0 +1,245 @@
+﻿<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
+    <PropertyGroup>
+        <ProjectGuid>{D1884314-5A2D-46C6-9C65-DE19C397DAF0}</ProjectGuid>
+        <MainSource>PI_Altag_GstPI.dpk</MainSource>
+        <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
+        <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
+        <DCC_DependencyCheckOutputName>C:\outsamw2\PI_Altag_GstPI.bpl</DCC_DependencyCheckOutputName>
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
+        <VerInfo_Build>78</VerInfo_Build>
+        <DCC_WriteableConstants>true</DCC_WriteableConstants>
+        <DCC_Namespace>System;Xml;Data;Datasnap;Web;Soap;$(DCC_Namespace)</DCC_Namespace>
+        <DCC_ImageBase>00400000</DCC_ImageBase>
+        <VerInfo_IncludeVerInfo>True</VerInfo_IncludeVerInfo>
+        <RuntimeOnlyPackage>true</RuntimeOnlyPackage>
+        <GenPackage>true</GenPackage>
+        <DCC_Description>Plugin Preventivi Industriali</DCC_Description>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali;FileVersion=5.0.0.78;InternalName=PI_Altag_GstPI;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstPI.bpl;ProductVersion=5.0</VerInfo_Keys>
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
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - x64;FileVersion=5.0.0.78;InternalName=PI_Altag_GstPI;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstPI.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Plugin Preventivi Industriali - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali;FileVersion=5.0.0.77;InternalName=PI_Altag_GstPI;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstPI.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <VerInfo_Build>77</VerInfo_Build>
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
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - x64;FileVersion=5.0.0.78;InternalName=PI_Altag_GstPI;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstPI.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Plugin Preventivi Industriali - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2)'!=''">
+        <VerInfo_Debug>True</VerInfo_Debug>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - Debug;FileVersion=5.0.0.78;InternalName=PI_Altag_GstPI;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstPI.bpl;ProductVersion=5.0</VerInfo_Keys>
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
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Plugin Preventivi Industriali - Debug - x64;FileVersion=5.0.0.78;InternalName=PI_Altag_GstPI;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_GstPI.bpl;ProductVersion=5.0</VerInfo_Keys>
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
+                    <VersionInfo Name="Build">78</VersionInfo>
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
+                    <VersionInfoKeys Name="FileVersion">4.2.0.78</VersionInfoKeys>
+                    <VersionInfoKeys Name="InternalName">PI_Altag_GstPI</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalCopyright">Centro Software srl</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalTrademarks"/>
+                    <VersionInfoKeys Name="OriginalFilename">PI_Altag_GstPI.dproj</VersionInfoKeys>
+                    <VersionInfoKeys Name="ProductName"/>
+                    <VersionInfoKeys Name="ProductVersion"/>
+                    <VersionInfoKeys Name="Comments">Cavallini Vittorio</VersionInfoKeys>
+                </VersionInfoKeys>
+                <Source>
+                    <Source Name="MainSource">PI_Altag_GstPI.dpk</Source>
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
+        <DCCReference Include="M_Doc.dcp"/>
+        <DCCReference Include="UGstPI.pas"/>
+        <DCCReference Include="FGstPI.pas">
+            <Form>FrmGstPI</Form>
+        </DCCReference>
+        <DCCReference Include="OGstPI.pas"/>
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
diff --git a/source/PI_Altag_GstPI/README.md b/source/PI_Altag_GstPI/README.md
new file mode 100644
index 0000000..4e9958c
--- /dev/null
+++ b/source/PI_Altag_GstPI/README.md
@@ -0,0 +1 @@
+# plugin PI_Altag_GstPI
diff --git a/source/PI_Altag_GstPI/UGstPI.pas b/source/PI_Altag_GstPI/UGstPI.pas
new file mode 100644
index 0000000..e18aa07
--- /dev/null
+++ b/source/PI_Altag_GstPI/UGstPI.pas
@@ -0,0 +1,2176 @@
+unit UGstPI;
+
+interface
+
+uses
+  System.Classes, Vcl.Forms, Winapi.Windows, Vcl.ComCtrls, CSETables, CSToolBar, System.SysUtils,
+  S3Registry, S3Plugin, IProduzione, OOrPr, GetRBas, GetRPrd, CSDBFileCfg,
+  UTipiPrd, UtilsArticoli, RNote;
+
+type
+  TGstPI = class(TCustomPlugIn)
+  private
+    bValidaUtente           : Boolean;
+    iAskAggPrezzoComRig     : Integer;
+    sEdtTotale              : String;
+//
+//  M.B. 22-04-2011 RI:10242
+//
+    PageControl1            : TPageControl;
+    PnlSpeedBar             : TCSToolBar;
+    btn                     : TCSToolBarButton;
+
+    FOEChangePageControl    : TNotifyEvent;
+    FOEClickbtnPrevInd      : TNotifyEvent;
+    FOEExitedtPrezzo        : TNotifyEvent;
+    FOEChangecbxRiferi1     : TNotifyEvent;
+    FOEdbgrRigheRefreshData : TNotifyEvent;
+//
+//  M.B. 22-04-2011 RI:10242
+//
+//  Funzioni e/o procedure
+//
+    function CalcolaCoefConv(ACodArtico: String): Double;
+    function GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
+                          AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): String;
+  published
+    property  OEChangePageControl: TNotifyEvent read FOEChangePageControl write FOEChangePageControl;
+    property  OEClickbtnPrevInd: TNotifyEvent read FOEClickbtnPrevInd write FOEClickbtnPrevInd;
+    property  OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
+    property  OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
+    property  OEdbgrRigheRefreshData: TNotifyEvent read FOEdbgrRigheRefreshData write FOEdbgrRigheRefreshData;
+
+    procedure PlugIn_PrevInd;
+    function  BTN_PrevInd(Sender: TObject) : Integer;
+    procedure PIClickbtnPrevInd(Sender: TObject);   //  cv dalla 2.18 lo vogliono come bottone indipendente
+    procedure PIExitedtPrezzo(Sender: TObject);
+    procedure PIChangecbxRiferi1(Sender: TObject);
+    procedure PIChangePageControl(Sender: TObject);
+    procedure PIdbgrRigheRefreshData(Sender: Tobject);
+
+    procedure GenerazioneOP;
+//
+//  M.B. 22-04-2011 RI:10242
+//
+    procedure AttivaPluginPIDT;
+    procedure AttivaPluginPIOV;
+    procedure btnTaglioDTOnClick(Sender : TObject);
+    procedure btnTaglioOVOnClick(Sender : TObject);
+    procedure CreaPrevInd(iIdComRig : Integer);
+    procedure VisualizzaPrevInd(iId : Integer);
+    procedure ModificaCommessa(iIdComTes : Integer; iIdComRig : Integer; sUmrPre : String; dQta1 : Double; dQta2 : Double; dQta3 : Double; dPrezzo : Double );
+  end;
+
+const
+  NOME_FILE_INI = 'ALTAG.CFG';
+
+implementation
+
+uses
+  RMiscComp, UCoreUtils, CSTipiCommon, rnUMB, RMisc,
+  Vcl.Controls, Vcl.Dialogs, FGstPI, SMDBGrid, QueryPars, FrmStd, Compf2,
+  RSQL, RString, UCoreTipi, UCoreDB, CSFileCFG,
+  IVendite, FIntCom;
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
+// -----------------------------------------------------------------------------
+//  M.B. 22-04-2011 RI:10242
+//  Attivazione plug-in dalla griglia distinte tecnica preventivo industriale
+// -----------------------------------------------------------------------------
+procedure TGstPI.AttivaPluginPIDT;
+var
+  PnlSpeedBar : TCSToolBar;
+  btn         : TCSToolBarButton;
+begin
+//
+// Metto il bottone
+//
+  GetFormComp('ToolBar1', PnlSpeedBar);
+  if (Assigned(PnlSpeedBar)) then
+  begin
+    btn                   := TCSToolBarButton.Create(nil);
+    btn.Name              := 'btnTaglioDT';
+    btn.Hint              := 'Gestione Taglio';
+    btn.ShowHint          := True;
+    btn.GlyphLibraryIndex := 334;
+    btn.OnClick           := btnTaglioDTOnClick;
+
+    PnlSpeedBar.AddToolBarControl(btn);
+  end;
+end;
+// -----------------------------------------------------------------------------
+//  M.B. 22-04-2011 RI:10242
+//  Attivazione plug-in dalla griglia distinte tecnica preventivo industriale
+// -----------------------------------------------------------------------------
+procedure TGstPI.AttivaPluginPIOV;
+begin
+//
+// Metto il bottone
+//
+  GetFormComp('PageControl1', PageControl1);
+  GetFormComp('CSToolBar1'  , PnlSpeedBar);
+  if (Assigned(PnlSpeedBar)) then
+  begin
+    btn                   := TCSToolBarButton.Create(nil);
+    btn.Name              := 'btnTaglioOV';
+    btn.Hint              := 'Gestione Taglio';
+    btn.ShowHint          := True;
+    btn.GlyphLibraryIndex := 334;
+    btn.OnClick           := btnTaglioOVOnClick;
+
+    PnlSpeedBar.AddToolBarControl(btn);
+  end;
+
+  if (PageControl1.ActivePageIndex = 1) then
+  begin
+    btn.enabled := true;
+  end
+  else
+  begin
+    btn.enabled := false;
+  end;
+
+  RedirEvent('PageControl1', 'OnChange', 'OEChangePageControl', 'PIChangePageControl');
+
+  RedirEvent('dbgrRighe', 'OnBeforeRefreshData', 'OEdbgrRigheRefreshData', 'PIdbgrRigheRefreshData');
+//  TFrmIntCom(Owner.Owner).dbgrRighe.RefreshData();
+
+end;
+//  ----------------------------------------------------------------------------
+//  Refresh griglia distinta base
+//  ----------------------------------------------------------------------------
+procedure TGstPI.PIdbgrRigheRefreshData(Sender: Tobject);
+var
+  I, K            : Integer;
+  Lista           : TStringList;
+  IniFile         : TCSDbFileCfg;
+  GrdRiDiBa       : TSMDBGrid;
+  QryRiDiBa       : TQueryPars;
+  Section         : String;
+  StrSql          : String;
+  StrLayout       : String;
+  StrWidth        : String;
+  StrFieldName    : String;
+  ColExistsTipoPI : Boolean;
+  ColExistsAnnoPI : Boolean;
+  ColExistsNumPI  : Boolean;
+  ColExistsDescrPI: Boolean;
+
+begin
+  GetFormComp('qryRighe' , QryRiDiBa);
+  GetFormComp('dbgrRighe', GrdRiDiBa);
+
+  Lista := TStringList.Create;
+  try
+    StrSql := 'OTES.TIPNUM';
+    if Pos(LowerCase( StrSql + ' TIPNUM_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' TIPNUM_PI, ' +
+                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+
+    StrSql := 'OTES.ANNOP';
+    if Pos(LowerCase( StrSql + ' ANNOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' ANNOP_PI, ' +
+                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+
+    StrSql := 'OTES.NUMOP';
+    if Pos(LowerCase( StrSql + ' NUMOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' NUMOP_PI, ' +
+                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+
+    StrSql := 'PDOC.DESCR';
+    if Pos(LowerCase( StrSql + ' DESCR_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
+      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' DESCR_PI, ' +
+                           Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);
+
+    StrSql :=   'LEFT OUTER JOIN OPTES OTES on OTES.IDCOMRIG = CRIG.ID '+
+                'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID '+
+                'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID ';
+
+    if Pos(LowerCase(StrSql), LowerCase(QryRiDiBa.Sql.Text)) = 0 then
+    begin
+      QryRiDiBa.SQL.Text := QryRiDiBa.SQL.Text + StrSql;
+    end;
+
+{
+  FrmTmpSql:=TfrmSql.Create(nil);
+  try
+    FrmTmpSql.mSql.Clear();
+    FrmTmpSql.mSql.Lines.Add(QryRiDiBa.SQL.Text);
+    FrmTmpSql.ShowModal;
+  finally
+    FrmTmpSql.Free;
+  end;
+}
+
+    IniFile := TCSDbFileCfg.Create(Glo.IniUtente);
+    try
+      // SF...03/04/2012 : non leggeva la sessione corretta e quindi non riposizionava le colonne
+      //Section   := TFrmIntCom(Owner.Owner).Name + Azienda.Id + '-' + GrdRiDiBa.Name;
+      Section   := UniqueFormName(TFrmIntCom(Owner.Owner).Name) + '-RIGHE-' + Azienda.ID;
+      // ...SF 03/04/2012
+      StrLayout := IniFile.ReadString(Section, 'LAYOUT', '');
+      for I := 0 to CS_CountSubStr(StrLayout, ',') do
+      begin
+        Lista.Add(CS_Extract_SubStr(StrLayout, ',', I));
+      end;
+    finally
+      // Distruzione della variabile IniFile
+      IniFile.Free;
+    end; // end try...finally
+
+    ColExistsTipoPI := False;
+    ColExistsAnnoPI := False;
+    ColExistsNumPI  := False;
+    ColExistsDescrPI:= False;
+
+    for I := 0 to Lista.Count - 1 do
+    begin
+      StrFieldName := CS_Sub_Str(CS_Sub_Str(CS_Sub_Str(Copy(Lista.Strings[I], 1, Pos('=', Lista.Strings[I]) - 1), '"', ''), '}', ''), '{', '');
+      StrWidth := CS_Sub_Str(CS_Sub_Str(CS_Sub_Str(Copy(Lista.Strings[I], Pos('=', Lista.Strings[I]) + 1, Length(Lista.Strings[I]) + Pos('=', Lista.Strings[I])), '"', ''), '}', ''), '{', '');
+
+      if StrFieldName = 'Tipo PI' then
+      begin
+        for K := 1 to GrdRiDiBa.Columns.Count do
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then break;
+
+        if K > GrdRiDiBa.Columns.Count then
+        begin
+          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
+          begin
+            FieldName := 'TIPNUM_PI';
+            dataType := dtTesto;
+            Alignment := taRightJustify;
+            Title.Caption := 'Tipo PI';
+            Width := StrToInt(StrWidth);
+          end;
+          ColExistsTipoPI := True;
+        end;
+      end;
+
+      if StrFieldName = 'Anno PI' then
+      begin
+        for K := 1 to GrdRiDiBa.Columns.Count do
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then break;
+
+        if K > GrdRiDiBa.Columns.Count then
+        begin
+          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
+          begin
+            FieldName := 'ANNOP_PI';
+            dataType := dtTesto;
+            Alignment := taRightJustify;
+            Title.Caption := 'Anno PI';
+            Width := StrToInt(StrWidth);
+          end;
+          ColExistsAnnoPI := True;
+        end;
+      end;
+
+      if StrFieldName = 'Num. PI' then
+      begin
+        for K := 1 to GrdRiDiBa.Columns.Count do
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then break;
+
+        if K > GrdRiDiBa.Columns.Count then
+        begin
+          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
+          begin
+            FieldName := 'NUMOP_PI';
+            dataType := dtTesto;
+            Alignment := taRightJustify;
+            Title.Caption := 'Num. PI';
+            Width := StrToInt(StrWidth);
+          end;
+          ColExistsNumPI := True;
+        end;
+      end;
+
+      if StrFieldName = 'Descr. PI' then
+      begin
+        for K := 1 to GrdRiDiBa.Columns.Count do
+          if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then break;
+
+        if K > GrdRiDiBa.Columns.Count then
+        begin
+          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
+          begin
+            FieldName := 'DESCR_PI';
+            dataType := dtTesto;
+            Alignment := taLeftJustify;
+            Title.Caption := 'Descr. PI';
+            Width := StrToInt(StrWidth);
+          end;
+          ColExistsDescrPI := True;
+        end;
+      end;
+    end; // end for
+//
+//  Se le colonne non esistono le aggiungo
+//
+    if not ColExistsTipoPI then
+    begin
+      for K := 1 to GrdRiDiBa.Columns.Count do
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then break;
+
+      if K > GrdRiDiBa.Columns.Count then
+      begin
+        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
+        begin
+          FieldName := 'TIPNUM_PI';
+          dataType := dtTesto;
+          Alignment := taRightJustify;
+          Title.Caption := 'Tipo PI';
+          Width := 50;
+        end;
+      end;
+    end;
+
+    if not ColExistsAnnoPI then
+    begin
+      for K := 1 to GrdRiDiBa.Columns.Count do
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then break;
+
+      if K > GrdRiDiBa.Columns.Count then
+      begin
+        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
+        begin
+          FieldName := 'ANNOP_PI';
+          dataType := dtTesto;
+          Alignment := taRightJustify;
+          Title.Caption := 'Anno PI';
+          Width := 50;
+        end;
+      end;
+    end;
+
+    if not ColExistsNumPI then
+    begin
+      for K := 1 to GrdRiDiBa.Columns.Count do
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then break;
+
+      if K > GrdRiDiBa.Columns.Count then
+      begin
+        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
+        begin
+          FieldName := 'NUMOP_PI';
+          dataType := dtTesto;
+          Alignment := taRightJustify;
+          Title.Caption := 'Num. PI';
+          Width := 50;
+        end;
+      end;
+    end;
+
+    if not ColExistsDescrPI then
+    begin
+      for K := 1 to GrdRiDiBa.Columns.Count do
+        if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then break;
+
+      if K > GrdRiDiBa.Columns.Count then
+      begin
+        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
+        begin
+          FieldName := 'DESCR_PI';
+          dataType := dtTesto;
+          Alignment := taLeftJustify;
+          Title.Caption := 'Descr. PI';
+          Width := 200;
+        end;
+      end;
+    end;
+
+  finally
+    if Assigned(Lista) then Lista.free;
+    if Assigned(OEdbgrRigheRefreshData) then OEdbgrRigheRefreshData(Sender);
+  end; // end try...finally
+end;
+//  ----------------------------------------------------------------------------
+//  Gestione stato del pulsante
+//  ----------------------------------------------------------------------------
+procedure TGstPI.PIChangePageControl(sender: TObject);
+begin
+  if Assigned(OEChangePageControl) then OEChangePageControl(Sender);
+
+  if (PageControl1.ActivePageIndex = 1) then
+  begin
+    btn.enabled := true;
+  end
+  else
+  begin
+    btn.enabled := false;
+  end;
+end;
+//  ----------------------------------------------------------------------------
+//  Alla pressione del tasto
+//  ----------------------------------------------------------------------------
+procedure TGstPI.btnTaglioDTOnClick(Sender: TObject);
+var
+  iIdPIDT   : Integer;
+  iIdComRig : Integer;
+  GrdPIDT   : TSMDBGrid;
+  QryTmp    : TCSEQuery;
+begin
+  GetFormComp('grPIDT', GrdPIDT);
+  iIdPIDT := GrdPIDT.DataSource.Dataset.FieldByName('ID').AsInteger;
+
+  QryTmp:=TCSEQuery.Create(nil);
+  try
+    QryTmp.DataBaseName := Azienda.DataBaseName;
+    QryTmp.Sql.Clear;
+    QryTmp.Sql.Add('select op.ID, op.IDCOMRIG, cm.QTA1,cm.QTA2,cm.QTA3,cm.IDARTICO,cm.PREZZO from OPDT as dt '+
+                      'inner join OPTES as op on op.ID=dt.IDOPTES '+
+                      'inner join COMRIG as cm on cm.ID=op.IDCOMRIG '+
+                      'inner join TIPIDOC as td on op.idtipidoc=td.id '+
+                   'where td.tipdoc=''D'' and dt.ID='+IntToStr(iIdPIDT));
+    QryTmp.Open;
+    if not QryTmp.IsEmpty then
+    begin
+      iIdComRig := QryTmp.FieldByName('IDCOMRIG').AsInteger;
+      CreaPrevInd(iIdComRig);
+    end;
+  finally
+    QryTmp.free;
+  end;
+end;
+//  ----------------------------------------------------------------------------
+//                          NUOVA VERSIONE
+//  ----------------------------------------------------------------------------
+//  Alla pressione del tasto
+//  ----------------------------------------------------------------------------
+procedure TGstPI.btnTaglioOVOnClick(Sender: TObject);
+var
+  iIdPIDT   : Integer;
+  iIdComRig : Integer;
+  GrdPIOV   : TSMDBGrid;
+  QryTmp    : TCSEQuery;
+begin
+  GetFormComp('dbgrRighe', GrdPIOV);
+  iIdPIDT := GrdPIOV.DataSource.Dataset.FieldByName('RIF_ID').AsInteger;
+
+  QryTmp:=TCSEQuery.Create(nil);
+  try
+    QryTmp.DataBaseName := Azienda.DataBaseName;
+    QryTmp.Sql.Clear;
+    QryTmp.Sql.Add('select optes.ID from COMRIG as cm ' +
+                      'inner join optes on cm.id=optes.idcomrig ' +
+                      'inner join ext_pialtatg on ext_pialtatg.idoptes=optes.id ' +
+                   'where cm.ID='+IntToStr(iIdPIDT));
+    QryTmp.Open;
+    if not QryTmp.IsEmpty then
+    begin
+      iIdComRig := QryTmp.FieldByName('ID').AsInteger;
+      VisualizzaPrevInd(iIdComRig);
+    end
+    else
+    begin
+      Application.MessageBox( PChar( 'Nessun PI associato alla riga corrente.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+    end;
+  finally
+    QryTmp.free;
+  end;
+end;
+//  ----------------------------------------------------------------------------
+//  Aggiorno il P.I:
+//  ----------------------------------------------------------------------------
+procedure TGstPI.VisualizzaPrevInd(iId : Integer);
+var
+  livello    : Tlivello;
+  FrmPrdOPDT : IFrmPrdStd;
+begin
+  livello := liAll;
+  FrmPrdOPDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', iId, livello) as IFrmPrdStd;
+  if (Assigned(FrmPrdOPDT)) then
+  begin
+    FrmPrdOPDT.Show();
+  end
+  else
+  begin
+    Application.MessageBox(PChar('Impossibile aprire il P.I.'), PChar(PChar(APPTITLE)), MB_ICONWARNING + MB_OK);
+  end;
+end;
+{
+//  ----------------------------------------------------------------------------
+//  Alla pressione del tasto
+//  ----------------------------------------------------------------------------
+procedure TGstPI.btnTaglioOVOnClick(Sender: TObject);
+var
+  iIdPIDT   : Integer;
+  iIdComRig : Integer;
+  GrdPIOV   : TSMDBGrid;
+  QryTmp    : TCSEQuery;
+begin
+  GetFormComp('dbgrRighe', GrdPIOV);
+  iIdPIDT := GrdPIOV.DataSource.Dataset.FieldByName('RIF_ID').AsInteger;
+
+  QryTmp:=TCSEQuery.Create(nil);
+  try
+    QryTmp.DataBaseName := Azienda.DataBaseName;
+    QryTmp.Sql.Clear;
+    QryTmp.Sql.Add('select cm.ID from COMRIG as cm ' +
+                      'inner join optes on cm.id=optes.idcomrig ' +
+                      'inner join ext_pialtatg on ext_pialtatg.idoptes=optes.id ' +
+                   'where cm.ID='+IntToStr(iIdPIDT));
+    QryTmp.Open;
+    if not QryTmp.IsEmpty then
+    begin
+      iIdComRig := QryTmp.FieldByName('ID').AsInteger;
+      CreaPrevInd(iIdComRig);
+    end
+    else
+    begin
+      Application.MessageBox( PChar( 'Nessun PI associato alla riga corrente.' ),
+                              PChar( APPTITLE ),
+                              MB_OK + MB_ICONINFORMATION );
+    end;
+  finally
+    QryTmp.free;
+  end;
+end;
+}
+//  ----------------------------------------------------------------------------
+//  Aggiorno il P.I:
+//  ----------------------------------------------------------------------------
+procedure TGstPI.CreaPrevInd(iIdComRig : Integer);
+var
+  iIdComTes : Integer;
+  sUmrPre   : String;
+  dQta1     : Double;
+  dQta2     : Double;
+  dQta3     : Double;
+  dPrezzo   : Double;
+  QryTmp    : TCSEQuery;
+  FrmPrevInd: TFrmGstPI;
+begin
+  FrmPrevInd:=TFrmGstPI.create(nil);
+  try
+    FrmPrevInd.Livello  := liAll;
+    FrmPrevInd.Idcomrig := iIdComRig;
+    FrmPrevInd.bSolaLettura := true;
+    FrmPrevInd.ShowModal;
+//
+//  Riportiamo i dati dal preventivo alla riga se l'utente � abilitato
+//
+    if FrmPrevInd.ValidaUtente and ((FrmPrevInd.AskAggPrezzoComRig=2) or ((FrmPrevInd.AskAggPrezzoComRig=1) and
+           (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
+    begin
+      QryTmp:=TCSEQuery.Create(nil);
+      try
+        QryTmp.DataBaseName := Azienda.DataBaseName;
+        QryTmp.Sql.Clear;
+        QryTmp.Sql.Add('select c.ID, c.IDCOMTES, a.UMRPRE, c.PREZZO, c.QTA1, c.QTA2, c.Qta3 from COMRIG as c '+
+                          'inner join LOTSER as l on l.ID=c.IDARTICO '+
+                          'inner join ARTICO as a on a.ID=l.IDARTICO '+
+                       'where c.ID='+IntToStr(iIdComRig));
+        QryTmp.Open;
+        if not QryTmp.IsEmpty then
+        begin
+          iIdComTes := QryTmp.FieldByName('IDCOMTES').AsInteger;
+          sUmrPre   := QryTmp.FieldByName('UMRPRE').AsString;
+          dQta1     := QryTmp.FieldByName('QTA1').AsFloat;
+          dQta2     := QryTmp.FieldByName('QTA2').AsFloat;
+          dQta3     := QryTmp.FieldByName('QTA3').AsFloat;
+          dPrezzo   := QryTmp.FieldByName('PREZZO').AsFloat;
+
+          ModificaCommessa(iIdComTes, iIdComRig, sUmrPre, dQta1, dQta2, dQta3, dPrezzo);
+        end;
+      finally
+        QryTmp.free;
+      end;
+    end;
+  finally
+    FrmPrevInd.free;
+  end;
+end;
+//  ----------------------------------------------------------------------------
+//  Modifico i dati della commessa che ha generato il preventivo industriale
+//  ----------------------------------------------------------------------------
+procedure TGstPI.ModificaCommessa(iIdComTes : Integer;
+                                    iIdComRig : Integer;
+                                    sUmrPre   : String ;
+                                    dQta1     : Double ;
+                                    dQta2     : Double ;
+                                    dQta3     : Double ;
+                                    dPrezzo   : Double );
+var
+  InTrans : Boolean;
+  OComRig : IComRigStd;
+  OComTes : IComTesStd;
+  QryPar  : TCSEQuery;
+begin
+
+  InTrans := false;
+
+  if (not GetInterfOggetto('ObjComTes', 'COMTES', IComTesStd, OComTes)) then
+  begin
+    MessageDlg('Interfaccia Commesse non istanziata correttamente.', mtError, [mbOk], 0);
+    Exit;
+  end;
+
+  if (not GetInterfOggetto('ObjComRig', 'COMRIG', IComRigStd, OComRig)) then
+  begin
+    MessageDlg('Interfaccia Righe Commessa non istanziata correttamente.', mtError, [mbOk], 0);
+    Exit;
+  end;
+
+  QryPar:= TCSEQuery.Create(nil);
+  QryPar.DatabaseName:= DBExec.DatabaseName;
+  try
+    OComTes.Seek('Id',iIdComTes);
+    if not OComTes.Found then
+    begin
+      MessageDlg('Non � stata trovata una commessa per questa riga.', mtWarning, [mbOK], 0);
+      Exit;
+    end;
+
+    OComRig.Seek('Id',iIdComRig);
+    if not OComRig.Found then
+    begin
+      MessageDlg('Non � stata trovata una commessa per questa riga.', mtWarning, [mbOK], 0);
+      Exit;
+    end;
+
+    InTrans:= DBExec.InTransaction;
+    if not InTrans then
+      DBExec.CSStartTransaction;
+
+    QryPar.sql.Text:= 'Select cli.SpeInc, cli.SpeBol, cli.AddBollo '+
+                        'from ComTes t '+
+                          'inner join clienti cli on t.idcliente=cli.id '+
+                        'where (t.id= '+ CS_KeyValueTo_SqlStr(iIdComTes) +') ';
+    QryPar.Open;
+
+    if ( ((sUmrPre = '') or (sUmrPre = 'I')) and (dQta3 <> 0) ) then
+      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo))/dQta3
+    else if (sUmrPre = 'M') and (dQta2 <> 0) then
+      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo))/dQta2
+    else if (sUmrPre = 'V') and (dQta1 <> 0) then
+      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo))/dQta1
+    else
+      dPrezzo := 0.0;
+
+    OComRig.CampiObj['Prezzo'] := dPrezzo;
+    OComRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro, Azienda.RValutaSi.DecContEuro);
+    OComRig.Modifica;
+    OComRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro, Azienda.RValutaSi.DecContEuro);
+
+    OComtes.RicalcolaTotali( (QryPar.FieldByName('SpeInc').AsInteger   = -1 ),
+                             (QryPar.FieldByName('SpeBol').AsInteger   = -1 ),
+                             (QryPar.FieldByName('AddBollo').AsInteger = -1));
+
+    OComtes.Modifica;
+
+    if not InTrans then
+      DBExec.Commit;
+
+  except on e: Exception do
+    begin
+      if not InTrans then
+        DBExec.RollBack;
+    end;
+  end;
+end;
+
+procedure TGstPI.PlugIn_PrevInd;
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
+procedure TGstPI.PIExitedtPrezzo(Sender: TObject);
+begin
+  if Assigned(OEExitedtPrezzo) then OEExitedtPrezzo(Sender);
+end;
+
+procedure TGstPI.PIChangecbxRiferi1(Sender: TObject);
+begin
+  if Assigned(OEChangecbxRiferi1) then OEChangecbxRiferi1(Sender);
+end;
+
+{
+procedure TGstPI.PIClickbtnPrevInd(Sender: TObject);
+var
+  OpenPi        : Integer;
+  QryTmp        : TCSEQuery;
+  piDbgrComRig  : TSMDBGrid;
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
+     (not assigned(piEdtPrezzo)) then
+  begin
+    ShowMessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PIClickbtnPrevInd).');
+  end
+  else
+  begin
+    QryTmp:=TCSEQuery.Create(nil);
+    try
+      QryTmp.DataBaseName := Azienda.DataBaseName;
+      QryTmp.Sql.Clear;
+      QryTmp.Sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id '+
+                     'where td.tipdoc=''D'' and o.idcomrig='+inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
+      QryTmp.Open;
+      if QryTmp.isempty then
+      begin
+        OpenPi := BTN_PrevInd(Sender);   //   il PI non � creato: lo creo con la loro finestra
+        if (OpenPi = 0) then
+        begin
+          if bValidaUtente and ((iAskAggPrezzoComRig=2) or ((iAskAggPrezzoComRig=1) and
+                (Messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
+          begin
+            if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
+              piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta3.getvalue)
+            else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
+              piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta2.getvalue)
+            else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
+              piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta1.getvalue)
+            else
+              piEdtPrezzo.settext(0);
+
+            PIExitedtPrezzo(Sender);
+            PIChangecbxRiferi1(Sender);
+          end;
+        end
+        else if (OpenPi = 1) then
+        begin
+          if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
+        end;
+      end
+      else
+      begin
+        if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
+      end;
+    finally
+      QryTmp.free;
+    end;
+  end;
+end;
+
+function TGstPI.BTN_PrevInd(Sender: TObject) : Integer;
+var
+  FrmPrevInd: TFrmGstPI;
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
+     (not assigned(piEdtPrezzo)) then
+  begin
+    ShowMessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (BTN_PrevInd).');
+    Result := 0;
+  end
+  else
+  begin
+
+    FrmPrevInd:=TFrmGstPI.create(nil);
+    try
+      FrmPrevInd.livello:=TFormStd(form).livello;
+      FrmPrevInd.idcomrig:=TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
+      FrmPrevInd.bSolaLettura := false;
+      FrmPrevInd.showmodal;
+
+      bValidaUtente       := FrmPrevInd.ValidaUtente();
+      iAskAggPrezzoComRig := FrmPrevInd.AskAggPrezzoComRig;
+      sEdtTotale          := FrmPrevInd.edtTotale.text;
+
+      // Riportiamo i dati dal preventivo alla riga se l'utente � abilitato
+
+//      if FrmPrevInd.ValidaUtente and
+//         ((FrmPrevInd.AskAggPrezzoComRig=2) or
+//          ((FrmPrevInd.AskAggPrezzoComRig=1) and
+//           (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
+//      begin
+//        if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
+//          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta3.getvalue)
+//        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
+//          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta2.getvalue)
+//        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
+//          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta1.getvalue)
+//        else
+//          piEdtPrezzo.settext(0);
+//
+//        PIExitedtPrezzo(Sender);
+//        PIChangecbxRiferi1(Sender);
+//      end;
+//
+      Result := FrmPrevInd.OpenPI;
+
+    finally
+      FrmPrevInd.free;
+    end;
+  end;
+end;
+}
+
+
+procedure TGstPI.PIClickbtnPrevInd(Sender: TObject);
+begin
+  BTN_PrevInd(Sender);
+end;
+
+function TGstPI.BTN_PrevInd(Sender: TObject) : Integer;
+var
+  bModifica     : Boolean;
+  Ritorno       : Integer;
+  OpenPi        : Integer;
+  QryTmp        : TCSEQuery;
+  piDbgrComRig  : TSMDBGrid;
+  piEdtQta1     : Tget;
+  piEdtQta2     : Tget;
+  piEdtQta3     : Tget;
+  piEdtPrezzo   : Tget;
+  piF2IdArtico  : TF2;
+  FrmPrevInd    : TFrmGstPI;
+begin
+  Result := 0;
+
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
+     (not assigned(piEdtPrezzo)) then
+  begin
+    ShowMessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PIClickbtnPrevInd).');
+  end
+  else
+  begin
+    QryTmp:=TCSEQuery.Create(nil);
+    try
+      QryTmp.DataBaseName := Azienda.DataBaseName;
+      QryTmp.Sql.Clear;
+      QryTmp.Sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id '+
+                     'where td.tipdoc=''D'' and o.idcomrig='+inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
+      QryTmp.Open;
+
+      bModifica := false;
+      if (QryTmp.IsEmpty() = false) then
+      begin
+        Ritorno := MessageDlg('Desidera modificare il preventivo industriale?', mtConfirmation, [mbYes, mbNo], 0);
+        if (Ritorno = mrYes) then
+        begin
+          bModifica := true;
+        end;
+      end;
+
+      if ( (QryTmp.IsEmpty()) or ((QryTmp.IsEmpty() = false) and (bModifica = true)) ) then
+      begin
+        FrmPrevInd:=TFrmGstPI.create(nil);
+        try
+          FrmPrevInd.livello:=TFormStd(form).livello;
+          FrmPrevInd.idcomrig:=TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
+          FrmPrevInd.bSolaLettura := false;
+          FrmPrevInd.showmodal;
+
+          bValidaUtente       := FrmPrevInd.ValidaUtente();
+          iAskAggPrezzoComRig := FrmPrevInd.AskAggPrezzoComRig;
+          sEdtTotale          := FrmPrevInd.edtTotale.text;
+
+          OpenPi := FrmPrevInd.OpenPI;
+          if (OpenPi = 0) then
+          begin
+            if bValidaUtente and ((iAskAggPrezzoComRig=2) or ((iAskAggPrezzoComRig=1) and
+                  (Messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
+            begin
+              if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
+                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta3.getvalue)
+              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
+                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta2.getvalue)
+              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
+                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta1.getvalue)
+              else
+                piEdtPrezzo.settext(0);
+
+              PIExitedtPrezzo(Sender);
+              PIChangecbxRiferi1(Sender);
+            end;
+          end
+          else if (OpenPi = 1) then
+          begin
+            if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
+          end;
+        finally
+          FrmPrevInd.free;
+        end;
+      end
+      else
+      begin
+        if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
+      end;
+    finally
+      QryTmp.free;
+    end;
+  end;
+end;
+
+// LBI 19/10/2016 - Ticket n� 11302/2016	- "plug_in visualizzazione OP Prev Ind su grigli Comm"
+procedure TGstPI.GenerazioneOP;
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
+  if NewdbgrRighe.SelectedRows.Count > 0 then
+  begin
+    Msg := 'Si desidera generare gli Ordini di Produzione per le righe selezionate?';
+    if Application.MessageBox(PChar(Msg),
+                              PChar(Application.Title),
+                              MB_ICONQUESTION + MB_YESNO) = IDYES then
+    begin
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
+        if not GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, objOPTes) then
+        begin
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
+        for I := 0 to NewdbgrRighe.SelectedRows.Count - 1 do
+        begin
+          NewqryRighe.Bookmark := NewdbgrRighe.SelectedRows[I];
+
+          // Verifico se esiste gi� un OP legato alla mia riga di commessa
+          QryComRigExistsOP.Close;
+          QryComRigExistsOP.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+          try
+            QryComRigExistsOP.Open;
+
+            // L'OP non esiste ancora percui lo devo creare
+            if QryComRigExistsOP.Eof then
+            begin
+              // Verifico se la Riga di Commessa � legata a un Preventivo Industriale
+              QryComRigExistsPI.Close;
+              QryComRigExistsPI.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+              QryComRigExistsPI.Open;
+
+              if not QryComRigExistsPI.Eof then
+              begin
+                // Generazione dell'Ordine di Produzione dal Preventivo Industriale legato alla Riga della Commessa
+                Msg := '';
+
+                objOPTes.Seek('Id', QryComRigExistsPI.fieldByName('Id').AsInteger);
+                if objOPTes.Found then
+                begin
+                  // Determinazione del tipo Documento Ordine di Produzione
+                  QryTipiDocOP.Close;
+                  QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
+                                           'WHERE (Tipdoc = ''P'') ' +
+                                           'ORDER BY Tipnum ASC';
+                  try
+                    QryTipiDocOP.Open;
+                  except
+                    on E: Exception do
+                    begin
+                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                             'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
+                      FlagErr := True;
+                      Exit;
+                    end;
+                  end;
+
+                  DecodeDate(DBExec.Data, Year, Month, Day);
+                  // Determinazione del numero
+                  QryNumOP.Close;
+                  QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
+                                       'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
+                                             '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
+                                       'GROUP BY Tipnum';
+                  try
+                    QryNumOP.Open;
+                  except
+                    on E: Exception do
+                    begin
+                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                             'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
+                      FlagErr := True;
+                      Exit;
+                    end;
+                  end;
+
+                  // Generazione Ordine di Produzione da Preventivo Industriale
+                  Msg := GeneraOPdaPI(objOPTes.CampiObj['Id'],
+                                      QryTipiDocOP.FieldByName('Id').AsInteger,
+                                      Year,
+                                      QryNumOP.FieldByName('Numop').AsInteger,
+                                      QryTipiDocOP.FieldByName('Tipnum').AsString,
+                                      (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
+                                       CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString)),
+                                      NewqryRighe.FieldByName('Rif_Id').AsInteger,
+                                      objOrPr);
+                  if Msg <> '' then
+                  begin
+                    FlagErr := True;
+                    Exit;
+                  end
+                end;
+
+              end
+              else
+              begin
+                // Verifico se l'articolo della Riga della Commessa presenta una Distinta Base
+                QryArtExistsDB.Close;
+                QryArtExistsDB.Params[0].AsString := NewqryRighe.FieldByName('Arti_Codice').AsString;
+                QryArtExistsDB.Open;
+
+                if not QryArtExistsDB.Eof then
+                begin
+                  // Generazione dell'Ordine di Produzione dalla Distinta Base con quantit� uguale alla qta1 della Riga di Commmessa
+                  Msg := '';
+
+                  // Determinazione del tipo Documento Ordine di Produzione
+                  QryTipiDocOP.Close;
+                  QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
+                                           'WHERE (Tipdoc = ''P'') ' +
+                                           'ORDER BY Tipnum ASC';
+                  try
+                    QryTipiDocOP.Open;
+                  except
+                    on E: Exception do
+                    begin
+                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                             'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
+                      FlagErr := True;
+                      Exit;
+                    end;
+                  end;
+
+                  DecodeDate(DBExec.Data, Year, Month, Day);
+                  // Determinazione del numero
+                  QryNumOP.Close;
+                  QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
+                                       'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
+                                             '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
+                                       'GROUP BY Tipnum';
+                  try
+                    QryNumOP.Open;
+                  except
+                    on E: Exception do
+                    begin
+                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                             'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
+                      FlagErr := True;
+                      Exit;
+                    end;
+                  end;
+
+                  // Generazione della testata dell'OP relativa all'articolo
+                  // riportato sulla riga di commessa
+                  with objOPTes do
+                  begin
+                    Found := False;
+                    CampiObj['Idtipidoc'] := QryTipiDocOP.FieldByName('Id').AsInteger;
+                    CampiObj['TipNum'] := QryTipiDocOP.FieldByName('Tipnum').AsString;
+                    CampiObj['AnnOP'] := Year;
+                    CampiObj['NumOP'] := QryNumOP.FieldByName('Numop').AsInteger;
+                    CampiObj['Stato'] := 'P';
+                    CampiObj['Idartico'] := QryArtExistsDB.FieldByName('Idartico').AsInteger;
+                    CampiObj['Qtaop'] := (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
+                                          CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString));
+                    CampiObj['DatVal'] := DBExec.Data;
+                    CampiObj['DatEmi'] := DBExec.Data;
+                    CampiObj['Idcomrig'] := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+                    CampiObj['CodVarDB'] := NewqryRighe.FieldByName('Vdb_Codice').AsString;
+                    CampiObj['Idallver'] := GetPardef('ALLPF', DBExec.DatabaseName);
+                  end; // end with
+
+                  if not objOPTes.GeneraOP > 0 then
+                  begin
+                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un ' +
+                           'errore durante la generazione dell''Ordine di Produzione.';
+                    FlagErr := True;
+                    Exit;
+                  end
+                end;
+
+              end;
+
+            end
+            else
+            begin
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
+            on E: Exception do
+            begin
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
+          if not FlagErr then
+          begin
+            DBExec.Commit;
+            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then begin
+              Msg := 'Operazione di generazione Ordini di Produzione completata.';
+              Application.MessageBox(PChar(Msg),
+                                     PChar(Application.Title),
+                                     MB_ICONINFORMATION + MB_OK);
+            end
+            else
+            begin
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
+          else
+          begin
+            DBExec.Rollback;
+            Msg := 'L''operazione di generazione Ordini di Produzione non � andata a boun fine.' + CRLF + Msg;
+            Application.MessageBox(PChar(Msg),
+                                   PChar(Application.Title),
+                                   MB_ICONERROR + MB_OK);
+          end;
+
+        // Distruzione oggetti Qry
+        if Assigned(QryTipiDocOP) then
+        begin
+          QryTipiDocOP.Close;
+          FreeAndNil(QryTipiDocOP);
+        end;
+
+        if Assigned(QryNumOP) then
+        begin
+          QryNumOP.Close;
+          FreeAndNil(QryNumOP);
+        end;
+
+        if Assigned(QryArtExistsDB) then
+        begin
+          QryArtExistsDB.Close;
+          if QryArtExistsDB.Prepared then
+            QryArtExistsDB.UnPrepare;
+          FreeAndNil(QryArtExistsDB);
+        end;
+
+        if Assigned(QryComRigExistsOP) then
+        begin
+          QryComRigExistsOP.Close;
+          if QryComRigExistsOP.Prepared then
+            QryComRigExistsOP.UnPrepare;
+          FreeAndNil(QryComRigExistsOP);
+        end;
+
+        if Assigned(QryComRigExistsPI) then
+        begin
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
+// ...lbi
+
+(*procedure TGstPI.GenerazioneOP;
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
+  if NewdbgrRighe.SelectedRows.Count > 0 then
+  begin
+    Msg := 'Si desidera generare gli Ordini di Produzione per le righe selezionate?';
+    if Application.MessageBox(PChar(Msg),
+                              PChar(Application.Title),
+                              MB_ICONQUESTION + MB_YESNO) = IDYES then
+    begin
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
+        if not GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, objOPTes) then
+        begin
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
+        for I := 0 to NewdbgrRighe.SelectedRows.Count - 1 do
+        begin
+          NewqryRighe.Bookmark := NewdbgrRighe.SelectedRows[I];
+
+          // Verifico se esiste gi� un OP legato alla mia riga di commessa
+          QryComRigExistsOP.Close;
+          QryComRigExistsOP.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+          try
+            QryComRigExistsOP.Open;
+            // L'OP non esiste ancora percui lo devo creare
+            if QryComRigExistsOP.Eof then
+            begin
+
+              // Verifico se l'articolo della Riga della Commessa presenta una Distinta Base
+              QryArtExistsDB.Close;
+              QryArtExistsDB.Params[0].AsString := NewqryRighe.FieldByName('Arti_Codice').AsString;
+              QryArtExistsDB.Open;
+
+              // Non esiste una distinta base per l'articolo in esame
+              if QryArtExistsDB.Eof then
+              begin
+
+                // Verifico se la Riga di Commessa � legata a un Preventivo Industriale
+                QryComRigExistsPI.Close;
+                QryComRigExistsPI.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
+                QryComRigExistsPI.Open;
+
+                if not QryComRigExistsPI.Eof then
+                begin
+                  // Generazione dell'Ordine di Produzione dal Preventivo Industriale legato alla
+                  // Riga della Commessa
+                  Msg := '';
+
+                  objOPTes.Seek('Id', QryComRigExistsPI.fieldByName('Id').AsInteger);
+                  if objOPTes.Found then
+                  begin
+                    // Determinazione del tipo Documento Ordine di Produzione
+                    QryTipiDocOP.Close;
+                    QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
+                                             'WHERE (Tipdoc = ''P'') ' +
+                                             'ORDER BY Tipnum ASC';
+                    try
+                      QryTipiDocOP.Open;
+                    except
+                      on E: Exception do
+                      begin
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
+                      on E: Exception do
+                      begin
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
+                    if Msg <> '' then
+                    begin
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
+              else
+              begin
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
+                  on E: Exception do
+                  begin
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
+                  on E: Exception do
+                  begin
+                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
+                           'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
+                    FlagErr := True;
+                    Exit;
+                  end;
+                end;
+
+                // Generazione della testata dell'OP relativa all'articolo
+                // riportato sulla riga di commessa
+                with objOPTes do
+                begin
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
+                if not objOPTes.GeneraOP > 0 then
+                begin
+                  Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un ' +
+                         'errore durante la generazione dell''Ordine di Produzione.';
+                  FlagErr := True;
+                  Exit;
+                end
+              end;
+            end
+            else
+            begin
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
+            on E: Exception do
+            begin
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
+          if not FlagErr then
+          begin
+            DBExec.Commit;
+            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then begin
+              Msg := 'Operazione di generazione Ordini di Produzione completata.';
+              Application.MessageBox(PChar(Msg),
+                                     PChar(Application.Title),
+                                     MB_ICONINFORMATION + MB_OK);
+            end
+            else
+            begin
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
+          else
+          begin
+            DBExec.Rollback;
+            Msg := 'L''operazione di generazione Ordini di Produzione non � andata a boun fine.' + CRLF + Msg;
+            Application.MessageBox(PChar(Msg),
+                                   PChar(Application.Title),
+                                   MB_ICONERROR + MB_OK);
+          end;
+
+        // Distruzione oggetti Qry
+        if Assigned(QryTipiDocOP) then
+        begin
+          QryTipiDocOP.Close;
+          FreeAndNil(QryTipiDocOP);
+        end;
+
+        if Assigned(QryNumOP) then
+        begin
+          QryNumOP.Close;
+          FreeAndNil(QryNumOP);
+        end;
+
+        if Assigned(QryArtExistsDB) then
+        begin
+          QryArtExistsDB.Close;
+          if QryArtExistsDB.Prepared then
+            QryArtExistsDB.UnPrepare;
+          FreeAndNil(QryArtExistsDB);
+        end;
+
+        if Assigned(QryComRigExistsOP) then
+        begin
+          QryComRigExistsOP.Close;
+          if QryComRigExistsOP.Prepared then
+            QryComRigExistsOP.UnPrepare;
+          FreeAndNil(QryComRigExistsOP);
+        end;
+
+        if Assigned(QryComRigExistsPI) then
+        begin
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
+*)
+
+function TGstPI.CalcolaCoefConv(ACodArtico: String): Double;
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
+    if Assigned(qryArtSeek) then
+    begin
+      qryArtSeek.Close;
+      FreeAndNil(qryArtSeek);
+    end;
+  end;
+end;
+
+function TGstPI.GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
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
+      Idtipidoc := AIdTipiDoc;
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
+
+      if CampiCauMov.Idmagarr <> 0 then
+        IdAllVer := CampiCauMov.Idmagarr
+      else
+        IdAllVer := Settings.Allpf;
+
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
+    AobjOrPr.SetCampi('Idtipidoc', AIdTipiDoc);
+    AobjOrPr.SetCampi('Tipnum',    ATipnum);
+    AobjOrPr.SetCampi('Annop',     AAnnop);
+    AobjOrPr.SetCampi('Numop',     ANumop);
+    AobjOrPr.SetCampi('Stato',     'P');
+    AobjOrPr.SetCampi('Opman',     False);
+    AobjOrPr.SetCampi('Qtaop',     AQtaOP);
+    AobjOrPr.SetCampi('Qtacar',    0);
+    AobjOrPr.SetCampi('Valsch',    0);
+    AobjOrPr.SetCampi('Totmat',    0);
+    AobjOrPr.SetCampi('Datcon',    0);
+    AobjOrPr.SetCampi('Datpre',    0);
+    AobjOrPr.SetCampi('Dateva',    0);
+    AobjOrPr.SetCampi('Datric',    tmpOPTes.dafiva);
+
+    if CampiCauMov.Idmagarr <> 0 then
+      AobjOrPr.SetCampi('IdAllVer', CampiCauMov.Idmagarr)
+    else
+      AobjOrPr.SetCampi('IdAllVer', Settings.Allpf);
+
+    AobjOrPr.SetCampi('Idcomrig', AIdComRig);
+    AobjOrPr.SetCampi('Mdp',      False);
+    AobjOrPr.SetCampi('flAttMJS', False);
+    AobjOrPr.SetCampi('Datemi',   DBExec.Data);
+    AobjOrPr.SetCampi('Doctec',   False);
+    AobjOrPr.SetCampi('Docpre',   False);
+    AobjOrPr.SetCampi('Docsdl',   False);
+    AobjOrPr.SetCampi('Verifi',   False);
+    AobjOrPr.SetCampi('OPEvaMod', True);
+    // ...SF 26/01/2018
+
+    AobjOrPr.OPTesMemoText := GetNota(DBExec, tmpOPTes.idnote);
+    AobjOrPr.OPTesDocFiles := GetNota(DBExec, tmpOPTes.iddoc);
+    tmpNewDocPrd := AobjOrPr.Insert;
+    if tmpNewDocPrd = -1 then
+    begin
+      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+             'nell''inserimento della testata dell''Ordine di Produzione.';
+      Exit;
+    end;
+
+    // OPLotF
+    if Msg = '' then
+      if not AobjOrPr.GeneraOPLotF(tmpNewDocPrd) then
+      begin
+        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
+               'nella generazione lotti.';
+        Exit;
+      end;
+
+    // OPDT
+    if Msg = '' then
+    begin
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
+      while not tmpQry.Eof do
+      begin
+        tmpOPDT := GetOPDT(DBExec, tmpQry.FieldByName('Idpadre').AsInteger);
+        tmpQry1.Close;
+        tmpQry1.Params[0].asInteger := tmpNewDocPrd;
+        tmpQry1.Params[1].asInteger := tmpOPDT.Sequen;
+        tmpQry1.Open;
+        AobjOrPr.FoundDT := False;
+
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
+        AobjOrPr.SetCampiOPDT('idoptes',  tmpNewDocPrd);
+        AobjOrPr.SetCampiOPDT('sequen',   tmpQry.FieldByName('Sequen').AsInteger);
+        AobjOrPr.SetCampiOPDT('livello',  tmpQry.FieldByName('Livello').AsInteger);
+        AobjOrPr.SetCampiOPDT('idpadre',  tmpQry1.FieldByName('Id').AsInteger);
+
+        if tmpQry.FieldByName('Livello').AsInteger = 0 then
+          AobjOrPr.SetCampiOPDT('idartico', tmpOPTes.idartico)
+        else
+          AobjOrPr.SetCampiOPDT('idartico', tmpQry.FieldByName('Idartico').AsInteger);
+
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
+        if AobjOrPr.InsertDT = -1 then
+        begin
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
+    if Msg = '' then
+    begin
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
+    if Msg = '' then
+    begin
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
+      while not tmpQry.Eof do
+      begin
+        tmpOPDT := GetOPDT(DBExec, tmpQry.FieldByName('Idopdt').AsInteger);
+        tmpQry1.Close;
+        tmpQry1.Params[0].asInteger := tmpNewDocPrd;
+        tmpQry1.Params[1].asInteger := tmpOPDT.Sequen;
+        tmpQry1.Open;
+        AobjOrPr.FoundSdlM := False;
+
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
+            (* SF...26/01/2018 : Conversione 5.00
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
+            AobjOrPr.SetCampiSdlF('idoptes',    tmpNewDocPrd);
+            AobjOrPr.SetCampiSdlF('idopsdlmat', AobjOrPr.CampiOPSdlM.id);
+            AobjOrPr.SetCampiSdlF('sequen',     QryFas.FieldByName('Sequen').AsInteger);
+            AobjOrPr.SetCampiSdlF('idlav',      QryFas.FieldByName('Idlav').AsInteger);
+            AobjOrPr.SetCampiSdlF('idRiCiLa',   QryFas.FieldByName('Idricila').asInteger);
+            AobjOrPr.SetCampiSdlF('fltrasf',    (QryFas.FieldByName('Fltrasf').AsInteger = -1));
+            AobjOrPr.SetCampiSdlF('idtiplav',   QryFas.FieldByName('Idtiplav').AsInteger);
+            AobjOrPr.SetCampiSdlF('attrezzo',   QryFas.FieldByName('Attrezzo').AsString);
+            AobjOrPr.SetCampiSdlF('iddipend',   QryFas.FieldByName('Iddipend').AsInteger);
+            AobjOrPr.SetCampiSdlF('idstslav',   QryFas.FieldByName('Idstslav').AsInteger);
+            AobjOrPr.SetCampiSdlF('cosuni',     QryFas.FieldByName('Cosuni').AsFloat);
+            AobjOrPr.SetCampiSdlF('cosuniMA',   QryFas.FieldByName('Cosunima').AsFloat);
+            AobjOrPr.SetCampiSdlF('cossch',     ZERO);
+            AobjOrPr.SetCampiSdlF('temavv',     QryFas.FieldByName('Temavv').AsFloat);
+            AobjOrPr.SetCampiSdlF('avvsch',     ZERO);
+            AobjOrPr.SetCampiSdlF('temese',     QryFas.FieldByName('Temese').AsFloat);
+            AobjOrPr.SetCampiSdlF('esesch',     ZERO);
+            AobjOrPr.SetCampiSdlF('totsch',     ZERO);
+            AobjOrPr.SetCampiSdlF('prdora',     QryFas.FieldByName('Prdora').AsFloat);
+            AobjOrPr.SetCampiSdlF('prdott',     QryFas.FieldByName('Prdott').AsFloat);
+            AobjOrPr.SetCampiSdlF('micatt',     QryFas.FieldByName('Micatt').AsFloat);
+            AobjOrPr.SetCampiSdlF('macatt',     QryFas.FieldByName('Macatt').AsFloat);
+            AobjOrPr.SetCampiSdlF('tematt',     QryFas.FieldByName('Tematt').AsFloat);
+            AobjOrPr.SetCampiSdlF('fruomo',     QryFas.FieldByName('Fruomo').AsFloat);
+            AobjOrPr.SetCampiSdlF('sovfas',     QryFas.FieldByName('Sovfas').AsFloat);
+            AobjOrPr.SetCampiSdlF('datcar',     0);
+            AobjOrPr.SetCampiSdlF('datsca',     0);
+            AobjOrPr.SetCampiSdlF('note',       QryFas.FieldByName('Note').AsString);
+            AobjOrPr.SetCampiSdlF('idinfosl',   0);
+            AobjOrPr.SetCampiSdlF('iddoc',      0);
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
+  CSW___BPL_Identity :='PI_Altag_GstPI';
+
+  if (CfgSAMFile.SectionExists('PI_Altag_GstPI')) then
+  begin
+    if Inside( CfgSamFile.ReadString('PI_Altag_GstPI', 'Utenti', ''), IntToStr(Utente.Id) ) then
+    begin
+      RegisterPlugIn('PI_Altag_GstPI', TGstPI);
+    end;
+  end;
+
+finalization
+  UnRegisterPlugIn('PI_Altag_GstPI');
+end.
```
