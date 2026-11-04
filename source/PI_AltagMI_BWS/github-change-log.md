# GitHub Change Log

## Plug-In
- Nome: `PI_Altag_BWS`
- Percorso locale: `C:\plugin_new\Altag\source\PI_Altag_BWS`
- Repository: `Altag`
- Branch: `all refs`
- Data estrazione: `2026-10-01T18:26:55.081604+00:00`

## Riepilogo
- Commit analizzati: `2`
- V500: `0`
- V600: `0`
- Misti: `1`
- Conversioni V500 -> V600: `1`

## Commit di conversione V500 -> V600
| Commit | Data | Autore | Sintesi | Evidenze |
|---|---|---|---|---|
| `029c786e2f30` | 2024-10-08T13:01:26+02:00 | Luca Tolomelli | spostamento in directory source e aggiunta README e gitignore | tcsequery, imageindex |

## Tutti i commit
### `437b643d6653f681201be2a8f4adc0e9801b2226` - fix progetti con DPM
- Data: `2024-10-08T13:01:26+02:00`
- Autore: `Luca Tolomelli`
- Classificazione prima: `Non determinabile`
- Classificazione dopo: `Non determinabile`
- Tipo: `Evolutiva`
- Conversione V500 -> V600: `No`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_BWS/PI_Altag_BWS.dproj`
- Indicatori V500: `nessuno`
- Indicatori V600: `nessuno`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_BWS/PI_Altag_BWS.dproj b/source/PI_Altag_BWS/PI_Altag_BWS.dproj
index e297dcc..251d5d2 100644
--- a/source/PI_Altag_BWS/PI_Altag_BWS.dproj
+++ b/source/PI_Altag_BWS/PI_Altag_BWS.dproj
@@ -66,15 +66,15 @@
     <PropertyGroup Condition="'$(Base)'!=''">
         <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS ;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
         <VerInfo_IncludeVerInfo>true</VerInfo_IncludeVerInfo>
-        <DCC_DCPOutput>C:\OutSamW2</DCC_DCPOutput>
-        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
+        <DCC_DCPOutput>$(SAMDIROUT)</DCC_DCPOutput>
+        <DCC_BplOutput>$(SAMDIROUT)</DCC_BplOutput>
         <RuntimeOnlyPackage>true</RuntimeOnlyPackage>
         <VerInfo_Locale>1040</VerInfo_Locale>
         <VerInfo_MajorVer>5</VerInfo_MajorVer>
         <DCC_Namespace>System;Xml;Data;Datasnap;Web;Soap;Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;$(DCC_Namespace)</DCC_Namespace>
         <GenDll>true</GenDll>
         <GenPackage>true</GenPackage>
-        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
+        <DCC_DcuOutput>$(SAMDIROUT)\DCU</DCC_DcuOutput>
         <DCC_ExeOutput>.\$(Platform)\$(Config)</DCC_ExeOutput>
         <DCC_E>false</DCC_E>
         <DCC_N>false</DCC_N>
@@ -102,7 +102,7 @@
     </PropertyGroup>
     <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
         <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
-        <Debugger_HostApplication>C:\OutSamW2\PDT.exe</Debugger_HostApplication>
+        <Debugger_HostApplication>$(SAMDIROUT)\PDT.exe</Debugger_HostApplication>
         <DCC_RemoteDebug>false</DCC_RemoteDebug>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Cfg_1_Win64)'!=''">
@@ -124,7 +124,7 @@
     <PropertyGroup Condition="'$(Cfg_2_Win32)'!=''">
         <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS;FileVersion=5.0.0.3;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
         <VerInfo_Build>3</VerInfo_Build>
-        <Debugger_HostApplication>C:\OutSamW2\PDT.exe</Debugger_HostApplication>
+        <Debugger_HostApplication>$(SAMDIROUT)\PDT.exe</Debugger_HostApplication>
         <DCC_OutputDRCFile>true</DCC_OutputDRCFile>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Cfg_2_Win64)'!=''">
@@ -232,7 +232,7 @@
                 </Excluded_Packages>
             </Delphi.Personality>
             <Deployment>
-                <DeployFile LocalName="C:\OutSamW2\PI_RIA_BWS.rsm" Configuration="Debug" Class="DebugSymbols">
+                <DeployFile LocalName="$(SAMDIROUT)\PI_RIA_BWS.rsm" Configuration="Debug" Class="DebugSymbols">
                     <Platform Name="Win32">
                         <RemoteName>PI_RIA_BWS.rsm</RemoteName>
                     </Platform>
@@ -240,25 +240,25 @@
                 <DeployFile LocalName="$(BDS)\Redist\Win32\vclsmp170.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSExtra.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSExtra.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\M_PDT.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\M_PDT.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSControls.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSControls.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
                 <DeployFile LocalName="$(BDS)\Redist\Win32\vcl170.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSData.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSData.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
                 <DeployFile LocalName="$(BDS)\Redist\Win32\vclimg170.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\tmsdxe3.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\tmsdxe3.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
                 <DeployFile LocalName="$(BDS)\Redist\Win32\vclx170.bpl" Configuration="Debug" Class="DependencyPackage">
@@ -267,19 +267,19 @@
                 <DeployFile LocalName="$(BDS)\Redist\Win32\dsnap170.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\PI_RIA_BWS.bpl" Configuration="Debug" Class="ProjectOutput">
+                <DeployFile LocalName="$(SAMDIROUT)\PI_RIA_BWS.bpl" Configuration="Debug" Class="ProjectOutput">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSReport.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSReport.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\tmsexdxe3.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\tmsexdxe3.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSCommon.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSCommon.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSApplication.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSApplication.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
                 <DeployFile LocalName="$(BDS)\Redist\Win32\rtl170.bpl" Configuration="Debug" Class="DependencyPackage">
@@ -294,7 +294,7 @@
                 <DeployFile LocalName="$(BDS)\Redist\Win32\inet170.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSAppControls.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSAppControls.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
                 <DeployFile LocalName="$(BDS)\Redist\Win32\xmlrtl170.bpl" Configuration="Debug" Class="DependencyPackage">
@@ -303,7 +303,7 @@
                 <DeployFile LocalName="$(BDS)\Redist\Win32\dbrtl170.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
-                <DeployFile LocalName="C:\OutSamW2\CSCore.bpl" Configuration="Debug" Class="DependencyPackage">
+                <DeployFile LocalName="$(SAMDIROUT)\CSCore.bpl" Configuration="Debug" Class="DependencyPackage">
                     <Platform Name="Win32"/>
                 </DeployFile>
                 <DeployFile LocalName="$(BDS)\Redist\Win32\vclactnband170.bpl" Configuration="Debug" Class="DependencyPackage">
```

### `029c786e2f30fec12a533ab847065ab5973bfc9f` - spostamento in directory source e aggiunta README e gitignore
- Data: `2024-10-08T13:01:26+02:00`
- Autore: `Luca Tolomelli`
- Classificazione prima: `Non determinabile`
- Classificazione dopo: `Mista`
- Tipo: `Conversione`
- Conversione V500 -> V600: `Parziale`
- Motivazione: classificazione basata sugli indicatori API presenti prima e dopo il commit.
- File modificati: `source/PI_Altag_BWS/PI_Altag_BWS.dpk, source/PI_Altag_BWS/PI_Altag_BWS.dproj, source/PI_Altag_BWS/README.md, source/PI_Altag_BWS/UBarcode.dfm, source/PI_Altag_BWS/UBarcode.pas, source/PI_Altag_BWS/UFraPrepspedOV.dfm, source/PI_Altag_BWS/UFraPrepspedOV.pas, source/PI_Altag_BWS/UFrmCaricaMag.dfm, source/PI_Altag_BWS/UFrmCaricaMag.pas, source/PI_Altag_BWS/UFrmDetailCarico.dfm, source/PI_Altag_BWS/UFrmDetailCarico.pas, source/PI_Altag_BWS/UFrmDetailScarico.dfm, source/PI_Altag_BWS/UFrmDetailScarico.pas, source/PI_Altag_BWS/UFrmDettlot.dfm, source/PI_Altag_BWS/UFrmDettlot.pas, source/PI_Altag_BWS/UFrmRicMerRia.dfm, source/PI_Altag_BWS/UFrmRicMerRia.pas, source/PI_Altag_BWS/UFrmSelComrig.dfm, source/PI_Altag_BWS/UFrmSelComrig.pas, source/PI_Altag_BWS/UFrmSelLotto.dfm, source/PI_Altag_BWS/UFrmSelLotto.pas, source/PI_Altag_BWS/UPI_Altag_Spec.pas, source/PI_Altag_BWS/U_Altag_BWS.pas, source/PI_Altag_BWS/U_Fra_Bam.dfm, source/PI_Altag_BWS/U_Fra_Bam.pas, source/PI_Altag_BWS/U_Fra_Clav.dfm, source/PI_Altag_BWS/U_Fra_Clav.pas, source/PI_Altag_BWS/U_PI_Altag_BWS.pas`
- Indicatori V500: `dbexec, glyphlibraryindex, oledb, forservice, ifornitori, iacquisti`
- Indicatori V600: `tcsequery, imageindex`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_BWS/PI_Altag_BWS.dpk b/source/PI_Altag_BWS/PI_Altag_BWS.dpk
new file mode 100644
index 0000000..c00e56c
--- /dev/null
+++ b/source/PI_Altag_BWS/PI_Altag_BWS.dpk
@@ -0,0 +1,49 @@
+package PI_Altag_BWS;
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
+{$OVERFLOWCHECKS OFF}
+{$RANGECHECKS OFF}
+{$REFERENCEINFO ON}
+{$SAFEDIVIDE OFF}
+{$STACKFRAMES ON}
+{$TYPEDADDRESS OFF}
+{$VARSTRINGCHECKS ON}
+{$WRITEABLECONST OFF}
+{$MINENUMSIZE 1}
+{$IMAGEBASE $400000}
+{$DEFINE DEBUG}
+{$ENDIF IMPLICITBUILDING}
+{$DESCRIPTION 'Funzioni Personalizzate BWS - Debug'}
+{$RUNONLY}
+{$IMPLICITBUILD ON}
+
+requires
+  M_PDT;
+
+contains
+  U_PI_Altag_BWS in 'U_PI_Altag_BWS.pas',
+  U_Altag_BWS in 'U_Altag_BWS.pas',
+  UFraPrepspedOV in 'UFraPrepspedOV.pas' {Fra_PrepspedOV: TFrame},
+  UBarcode in 'UBarcode.pas' {FrmBarcode},
+  UPI_Altag_Spec in 'UPI_Altag_Spec.pas',
+  UFrmCaricaMag in 'UFrmCaricaMag.pas' {FrmCaricaMag},
+  UFrmDetailScarico in 'UFrmDetailScarico.pas' {FrmDetailScarico},
+  UFrmSelLotto in 'UFrmSelLotto.pas' {FrmSelLotto},
+  UFrmDetailCarico in 'UFrmDetailCarico.pas' {FrmDetailCarico},
+  UFrmSelComrig in 'UFrmSelComrig.pas' {FrmComrig},
+  UFrmDettlot in 'UFrmDettlot.pas' {FrmDettLotti};
+
+  {$SetPEFlags $0800}
+end.
diff --git a/source/PI_Altag_BWS/PI_Altag_BWS.dproj b/source/PI_Altag_BWS/PI_Altag_BWS.dproj
new file mode 100644
index 0000000..e297dcc
--- /dev/null
+++ b/source/PI_Altag_BWS/PI_Altag_BWS.dproj
@@ -0,0 +1,506 @@
+﻿<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
+    <PropertyGroup>
+        <ProjectGuid>{5420FC98-ED68-4253-A004-A2649C271724}</ProjectGuid>
+        <MainSource>PI_Altag_BWS.dpk</MainSource>
+        <ProjectVersion>14.4</ProjectVersion>
+        <FrameworkType>VCL</FrameworkType>
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
+    <PropertyGroup Condition="'$(Config)'=='Debug' or '$(Cfg_1)'!=''">
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
+    <PropertyGroup Condition="'$(Config)'=='Release' or '$(Cfg_2)'!=''">
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
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS ;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
+        <VerInfo_IncludeVerInfo>true</VerInfo_IncludeVerInfo>
+        <DCC_DCPOutput>C:\OutSamW2</DCC_DCPOutput>
+        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
+        <RuntimeOnlyPackage>true</RuntimeOnlyPackage>
+        <VerInfo_Locale>1040</VerInfo_Locale>
+        <VerInfo_MajorVer>5</VerInfo_MajorVer>
+        <DCC_Namespace>System;Xml;Data;Datasnap;Web;Soap;Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;$(DCC_Namespace)</DCC_Namespace>
+        <GenDll>true</GenDll>
+        <GenPackage>true</GenPackage>
+        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
+        <DCC_ExeOutput>.\$(Platform)\$(Config)</DCC_ExeOutput>
+        <DCC_E>false</DCC_E>
+        <DCC_N>false</DCC_N>
+        <DCC_S>false</DCC_S>
+        <DCC_F>false</DCC_F>
+        <DCC_K>false</DCC_K>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_Win32)'!=''">
+        <DCC_Description>Funzioni Personalizzate BWS</DCC_Description>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
+        <DCC_Namespace>Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;$(DCC_Namespace)</DCC_Namespace>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1)'!=''">
+        <DCC_Description>Funzioni Personalizzate BWS - Debug</DCC_Description>
+        <VerInfo_Debug>true</VerInfo_Debug>
+        <DCC_Define>DEBUG;$(DCC_Define)</DCC_Define>
+        <DCC_DebugDCUs>true</DCC_DebugDCUs>
+        <DCC_Optimize>false</DCC_Optimize>
+        <DCC_GenerateStackFrames>true</DCC_GenerateStackFrames>
+        <DCC_DebugInfoInExe>true</DCC_DebugInfoInExe>
+        <DCC_RemoteDebug>true</DCC_RemoteDebug>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
+        <Debugger_HostApplication>C:\OutSamW2\PDT.exe</Debugger_HostApplication>
+        <DCC_RemoteDebug>false</DCC_RemoteDebug>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win64)'!=''">
+        <DCC_Description>Funzioni Personalizzate BWS - Debug - x64</DCC_Description>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS - Debug - x64;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
+        <DCC_Description>Funzioni Personalizzate BWS</DCC_Description>
+        <VerInfo_AutoIncVersion>true</VerInfo_AutoIncVersion>
+        <DCC_LocalDebugSymbols>false</DCC_LocalDebugSymbols>
+        <DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
+        <DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
+        <DCC_DebugInformation>false</DCC_DebugInformation>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win32)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS;FileVersion=5.0.0.3;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
+        <VerInfo_Build>3</VerInfo_Build>
+        <Debugger_HostApplication>C:\OutSamW2\PDT.exe</Debugger_HostApplication>
+        <DCC_OutputDRCFile>true</DCC_OutputDRCFile>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win64)'!=''">
+        <DCC_Description>Funzioni Personalizzate BWS - x64</DCC_Description>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Funzioni Personalizzate BWS - x64;FileVersion=5.0.0.0;InternalName=PI_Altag_BWS;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_BWS.bpl;ProductVersion=5.0;ProductName=PI_Altag_BWS</VerInfo_Keys>
+    </PropertyGroup>
+    <ItemGroup>
+        <DelphiCompile Include="$(MainSource)">
+            <MainSource>MainSource</MainSource>
+        </DelphiCompile>
+        <DCCReference Include="M_PDT.dcp"/>
+        <DCCReference Include="U_PI_Altag_BWS.pas"/>
+        <DCCReference Include="U_Altag_BWS.pas"/>
+        <DCCReference Include="UFraPrepspedOV.pas">
+            <Form>Fra_PrepspedOV</Form>
+            <FormType>dfm</FormType>
+            <DesignClass>TFrame</DesignClass>
+        </DCCReference>
+        <DCCReference Include="UBarcode.pas">
+            <Form>FrmBarcode</Form>
+            <FormType>dfm</FormType>
+        </DCCReference>
+        <DCCReference Include="UPI_Altag_Spec.pas"/>
+        <DCCReference Include="UFrmCaricaMag.pas">
+            <Form>FrmCaricaMag</Form>
+            <FormType>dfm</FormType>
+        </DCCReference>
+        <DCCReference Include="UFrmDetailScarico.pas">
+            <Form>FrmDetailScarico</Form>
+            <FormType>dfm</FormType>
+        </DCCReference>
+        <DCCReference Include="UFrmSelLotto.pas">
+            <Form>FrmSelLotto</Form>
+            <FormType>dfm</FormType>
+        </DCCReference>
+        <DCCReference Include="UFrmDetailCarico.pas">
+            <Form>FrmDetailCarico</Form>
+        </DCCReference>
+        <DCCReference Include="UFrmSelComrig.pas">
+            <Form>FrmComrig</Form>
+            <FormType>dfm</FormType>
+        </DCCReference>
+        <DCCReference Include="UFrmDettlot.pas">
+            <Form>FrmDettLotti</Form>
+            <FormType>dfm</FormType>
+        </DCCReference>
+        <BuildConfiguration Include="Release">
+            <Key>Cfg_2</Key>
+            <CfgParent>Base</CfgParent>
+        </BuildConfiguration>
+        <BuildConfiguration Include="Base">
+            <Key>Base</Key>
+        </BuildConfiguration>
+        <BuildConfiguration Include="Debug">
+            <Key>Cfg_1</Key>
+            <CfgParent>Base</CfgParent>
+        </BuildConfiguration>
+    </ItemGroup>
+    <ProjectExtensions>
+        <Borland.Personality>Delphi.Personality.12</Borland.Personality>
+        <Borland.ProjectType>Package</Borland.ProjectType>
+        <BorlandProject>
+            <Delphi.Personality>
+                <VersionInfo>
+                    <VersionInfo Name="IncludeVerInfo">True</VersionInfo>
+                    <VersionInfo Name="AutoIncBuild">False</VersionInfo>
+                    <VersionInfo Name="MajorVer">1</VersionInfo>
+                    <VersionInfo Name="MinorVer">0</VersionInfo>
+                    <VersionInfo Name="Release">0</VersionInfo>
+                    <VersionInfo Name="Build">0</VersionInfo>
+                    <VersionInfo Name="Debug">False</VersionInfo>
+                    <VersionInfo Name="PreRelease">False</VersionInfo>
+                    <VersionInfo Name="Special">False</VersionInfo>
+                    <VersionInfo Name="Private">False</VersionInfo>
+                    <VersionInfo Name="DLL">False</VersionInfo>
+                    <VersionInfo Name="Locale">1040</VersionInfo>
+                    <VersionInfo Name="CodePage">1252</VersionInfo>
+                </VersionInfo>
+                <VersionInfoKeys>
+                    <VersionInfoKeys Name="CompanyName"/>
+                    <VersionInfoKeys Name="FileDescription"/>
+                    <VersionInfoKeys Name="FileVersion">1.0.0.0</VersionInfoKeys>
+                    <VersionInfoKeys Name="InternalName"/>
+                    <VersionInfoKeys Name="LegalCopyright"/>
+                    <VersionInfoKeys Name="LegalTrademarks"/>
+                    <VersionInfoKeys Name="OriginalFilename"/>
+                    <VersionInfoKeys Name="ProductName"/>
+                    <VersionInfoKeys Name="ProductVersion">1.0.0.0</VersionInfoKeys>
+                    <VersionInfoKeys Name="Comments"/>
+                    <VersionInfoKeys Name="CFBundleName"/>
+                    <VersionInfoKeys Name="CFBundleDisplayName"/>
+                    <VersionInfoKeys Name="CFBundleIdentifier"/>
+                    <VersionInfoKeys Name="CFBundleVersion"/>
+                    <VersionInfoKeys Name="CFBundlePackageType"/>
+                    <VersionInfoKeys Name="CFBundleSignature"/>
+                    <VersionInfoKeys Name="CFBundleAllowMixedLocalizations"/>
+                    <VersionInfoKeys Name="CFBundleExecutable"/>
+                </VersionInfoKeys>
+                <Source>
+                    <Source Name="MainSource">PI_Altag_BWS.dpk</Source>
+                </Source>
+                <Excluded_Packages>
+                    <Excluded_Packages Name="$(BDSBIN)\dclofficexp170.bpl">Microsoft Office XP Sample Automation Server Wrapper Components</Excluded_Packages>
+                    <Excluded_Packages Name="$(BDSBIN)\dcloffice2k170.bpl">Microsoft Office 2000 Sample Automation Server Wrapper Components</Excluded_Packages>
+                </Excluded_Packages>
+            </Delphi.Personality>
+            <Deployment>
+                <DeployFile LocalName="C:\OutSamW2\PI_RIA_BWS.rsm" Configuration="Debug" Class="DebugSymbols">
+                    <Platform Name="Win32">
+                        <RemoteName>PI_RIA_BWS.rsm</RemoteName>
+                    </Platform>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\vclsmp170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSExtra.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\M_PDT.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSControls.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\vcl170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSData.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\vclimg170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\tmsdxe3.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\vclx170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\dsnap170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\PI_RIA_BWS.bpl" Configuration="Debug" Class="ProjectOutput">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSReport.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\tmsexdxe3.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSCommon.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSApplication.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\rtl170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\vcldb170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\adortl170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\inet170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSAppControls.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\xmlrtl170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\dbrtl170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="C:\OutSamW2\CSCore.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\vclactnband170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployFile LocalName="$(BDS)\Redist\Win32\soaprtl170.bpl" Configuration="Debug" Class="DependencyPackage">
+                    <Platform Name="Win32"/>
+                </DeployFile>
+                <DeployClass Required="true" Name="DependencyPackage">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                        <Extensions>.dylib</Extensions>
+                    </Platform>
+                    <Platform Name="Win32">
+                        <Operation>0</Operation>
+                        <Extensions>.bpl</Extensions>
+                    </Platform>
+                    <Platform Name="OSX32">
+                        <Operation>1</Operation>
+                        <Extensions>.dylib</Extensions>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                        <Extensions>.dylib</Extensions>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="DependencyModule">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                        <Extensions>.dylib</Extensions>
+                    </Platform>
+                    <Platform Name="Win32">
+                        <Operation>0</Operation>
+                        <Extensions>.dll;.bpl</Extensions>
+                    </Platform>
+                    <Platform Name="OSX32">
+                        <Operation>1</Operation>
+                        <Extensions>.dylib</Extensions>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                        <Extensions>.dylib</Extensions>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="iPad_Launch2048">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="ProjectOSXInfoPList"/>
+                <DeployClass Name="ProjectiOSDeviceInfoPList"/>
+                <DeployClass Name="iPad_Launch1024">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="ProjectiOSResource">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="ProjectiOSSimulatorInfoPList"/>
+                <DeployClass Name="ProjectOSXEntitlements"/>
+                <DeployClass Name="iPhone_Launch640">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="ProjectOSXResource">
+                    <Platform Name="OSX32">
+                        <RemoteDir>Contents\Resources</RemoteDir>
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="iPhone_Launch320">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="iPad_Launch768">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Required="true" Name="ProjectOutput">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="Win32">
+                        <Operation>0</Operation>
+                    </Platform>
+                    <Platform Name="OSX32">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="ProjectiOSDeviceResourceRules"/>
+                <DeployClass Name="File">
+                    <Platform Name="iOSDevice">
+                        <Operation>0</Operation>
+                    </Platform>
+                    <Platform Name="Win32">
+                        <Operation>0</Operation>
+                    </Platform>
+                    <Platform Name="OSX32">
+                        <Operation>0</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>0</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="DebugSymbols">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="Win32">
+                        <Operation>0</Operation>
+                    </Platform>
+                    <Platform Name="OSX32">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="DependencyFramework">
+                    <Platform Name="OSX32">
+                        <Operation>1</Operation>
+                        <Extensions>.framework</Extensions>
+                    </Platform>
+                    <Platform Name="Win32">
+                        <Operation>0</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="ProjectiOSEntitlements">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="iPad_Launch1536">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <DeployClass Name="AdditionalDebugSymbols">
+                    <Platform Name="iOSDevice">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="Win32">
+                        <RemoteDir>Contents\MacOS</RemoteDir>
+                        <Operation>0</Operation>
+                    </Platform>
+                    <Platform Name="OSX32">
+                        <Operation>1</Operation>
+                    </Platform>
+                    <Platform Name="iOSSimulator">
+                        <Operation>1</Operation>
+                    </Platform>
+                </DeployClass>
+                <ProjectRoot Platform="iOSDevice" Name="$(PROJECTNAME).app"/>
+                <ProjectRoot Platform="Win32" Name="$(PROJECTNAME)"/>
+                <ProjectRoot Platform="OSX32" Name="$(PROJECTNAME)"/>
+                <ProjectRoot Platform="iOSSimulator" Name="$(PROJECTNAME).app"/>
+                <ProjectRoot Platform="Win64" Name="$(PROJECTNAME)"/>
+            </Deployment>
+            <Platforms>
+                <Platform value="OSX32">False</Platform>
+                <Platform value="Win32">True</Platform>
+                <Platform value="Win64">False</Platform>
+            </Platforms>
+        </BorlandProject>
+        <ProjectFileVersion>12</ProjectFileVersion>
+    </ProjectExtensions>
+    <Import Project="$(BDS)\Bin\CodeGear.Delphi.Targets" Condition="Exists('$(BDS)\Bin\CodeGear.Delphi.Targets')"/>
+    <Import Project="$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj" Condition="Exists('$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj')"/>
+    <Import Project="$(MSBuildProjectName).deployproj" Condition="Exists('$(MSBuildProjectName).deployproj')"/>
+</Project>
diff --git a/source/PI_Altag_BWS/README.md b/source/PI_Altag_BWS/README.md
new file mode 100644
index 0000000..1061a34
--- /dev/null
+++ b/source/PI_Altag_BWS/README.md
@@ -0,0 +1 @@
+# plugin PI_Altag_BWS
diff --git a/source/PI_Altag_BWS/UBarcode.dfm b/source/PI_Altag_BWS/UBarcode.dfm
new file mode 100644
index 0000000..f0dc79a
--- /dev/null
+++ b/source/PI_Altag_BWS/UBarcode.dfm
@@ -0,0 +1,59 @@
+object FrmBarcode: TFrmBarcode
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  Caption = 'Lettura Barcode GS1 128...'
+  ClientHeight = 101
+  ClientWidth = 189
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poMainFormCenter
+  PixelsPerInch = 96
+  TextHeight = 13
+  object Label1: TLabel
+    Left = 12
+    Top = 11
+    Width = 85
+    Height = 13
+    Caption = 'Lettura barcode..'
+  end
+  object edtBarcode: TCSEdit
+    Left = 8
+    Top = 26
+    Width = 173
+    Height = 21
+    TabOrder = 0
+    OnExit = edtBarcodeExit
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object BitBtn1: TBitBtn
+    Left = 0
+    Top = 72
+    Width = 189
+    Height = 29
+    Align = alBottom
+    Kind = bkCancel
+    NumGlyphs = 2
+    TabOrder = 1
+  end
+end
diff --git a/source/PI_Altag_BWS/UBarcode.pas b/source/PI_Altag_BWS/UBarcode.pas
new file mode 100644
index 0000000..000e777
--- /dev/null
+++ b/source/PI_Altag_BWS/UBarcode.pas
@@ -0,0 +1,34 @@
+unit UBarcode;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, CSEdit;
+
+type
+  TFrmBarcode = class(TForm)
+    edtBarcode: TCSEdit;
+    BitBtn1: TBitBtn;
+    Label1: TLabel;
+    procedure edtBarcodeExit(Sender: TObject);
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+  end;
+
+var
+  FrmBarcode: TFrmBarcode;
+
+implementation
+
+{$R *.dfm}
+
+procedure TFrmBarcode.edtBarcodeExit(Sender: TObject);
+begin
+  if edtBarcode.AsString <> '' then
+    close;
+end;
+
+end.
diff --git a/source/PI_Altag_BWS/UFraPrepspedOV.dfm b/source/PI_Altag_BWS/UFraPrepspedOV.dfm
new file mode 100644
index 0000000..53daba8
--- /dev/null
+++ b/source/PI_Altag_BWS/UFraPrepspedOV.dfm
@@ -0,0 +1,310 @@
+object Fra_PrepspedOV: TFra_PrepspedOV
+  Left = 0
+  Top = 0
+  Width = 235
+  Height = 281
+  TabOrder = 0
+  object PgcCtrl: TPageControl
+    Left = 0
+    Top = 0
+    Width = 235
+    Height = 281
+    ActivePage = Testata
+    Align = alClient
+    Style = tsButtons
+    TabOrder = 0
+    object Testata: TTabSheet
+      Caption = 'Testata'
+      DesignSize = (
+        227
+        250)
+      object LblNewBamTes: TLabel
+        Left = 4
+        Top = 8
+        Width = 21
+        Height = 13
+        Caption = 'Rif.:'
+      end
+      object lblNumSpedizione: TLabel
+        Left = 4
+        Top = 159
+        Width = 98
+        Height = 13
+        Caption = 'Numero Spedizione :'
+      end
+      object lblDesVettore: TLabel
+        Left = 3
+        Top = 114
+        Width = 220
+        Height = 36
+        Anchors = [akLeft, akTop, akRight]
+        AutoSize = False
+        WordWrap = True
+        ExplicitWidth = 221
+      end
+      object LblVETT: TLabel
+        Left = 3
+        Top = 96
+        Width = 43
+        Height = 13
+        Caption = 'Vettore :'
+      end
+      object EdtNewTestata: TCSEdit
+        Left = 2
+        Top = 27
+        Width = 43
+        Height = 21
+        TabOrder = 0
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amDisable
+        BlankWhenZero = False
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+      object EdtNumSpedizione: TCSEdit
+        Left = 2
+        Top = 175
+        Width = 121
+        Height = 21
+        DataType = dtInt16
+        TabOrder = 1
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amDisable
+        BlankWhenZero = False
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+    end
+    object Griglia: TTabSheet
+      Caption = 'Griglia'
+      ImageIndex = 3
+      object GridRighepreparate: TSMDBGrid
+        Left = 0
+        Top = 0
+        Width = 227
+        Height = 200
+        ExOptions = [eoDrawGraphicField, eoKeepSelection, eoStandardPopup]
+        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
+        KeyField = 'ID'
+        WidthOfIndicator = 14
+        ScrollBars = ssHorizontal
+        ColCount = 7
+        RowCount = 2
+        Col = 1
+        Row = 1
+        Align = alClient
+        DataSource = DS_RighePreparate
+        FixedColor = clWhite
+        TabOrder = 0
+        TitleFont.Charset = DEFAULT_CHARSET
+        TitleFont.Color = clWindowText
+        TitleFont.Height = -11
+        TitleFont.Name = 'Tahoma'
+        TitleFont.Style = []
+        OnColumnMoved = GridRighepreparateColumnMoved
+        OnDrawColumnCell = GridRighepreparateDrawColumnCell
+        Columns = <
+          item
+            Expanded = False
+            FieldName = 'codArt'
+            Title.Caption = 'Cod.Art'
+            Width = 47
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'qtaComm'
+            Title.Caption = 'Qta Comm.'
+            Visible = True
+            DataType = dtNumerico
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'qtaPrep'
+            Title.Caption = 'Qta Prep.'
+            Visible = True
+            DataType = dtNumerico
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'kg'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'DescrArt'
+            Title.Caption = 'Des.Art'
+            Width = 138
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'qtasped'
+            Title.Caption = 'Qta Sped.'
+            Visible = True
+            DataType = dtNumerico
+            DigitsDec = 3
+            DigitsInt = 15
+          end>
+      end
+      object GroupBox2: TGroupBox
+        Left = 0
+        Top = 200
+        Width = 227
+        Height = 20
+        Align = alBottom
+        TabOrder = 1
+        object lbl_cartoni: TLabel
+          Left = 72
+          Top = 3
+          Width = 153
+          Height = 13
+          Alignment = taRightJustify
+          AutoSize = False
+          Font.Charset = DEFAULT_CHARSET
+          Font.Color = clWindowText
+          Font.Height = -11
+          Font.Name = 'Tahoma'
+          Font.Style = [fsBold]
+          ParentFont = False
+        end
+      end
+      object Pnlbuttons: TPanel
+        Left = 0
+        Top = 220
+        Width = 227
+        Height = 30
+        Align = alBottom
+        TabOrder = 2
+        object btnBarcode: TCSBitBtn
+          Left = 117
+          Top = 1
+          Width = 109
+          Height = 28
+          Align = alClient
+          Caption = 'GS1'
+          TabOrder = 0
+          GlyphLibraryIndex = 338
+        end
+        object btnDetail: TCSBitBtn
+          Left = 1
+          Top = 1
+          Width = 116
+          Height = 28
+          Align = alLeft
+          Caption = 'Dettaglio Letture'
+          TabOrder = 1
+          GlyphLibraryIndex = 162
+        end
+      end
+    end
+    object NewRiga: TTabSheet
+      Caption = 'NewRiga'
+      ImageIndex = 4
+      DesignSize = (
+        227
+        250)
+      object lbl_datalotto: TLabel
+        Left = 28
+        Top = 194
+        Width = 63
+        Height = 13
+        Caption = 'Data Scad.  :'
+      end
+      object lblGiacenza: TLabel
+        Left = 2
+        Top = 10
+        Width = 223
+        Height = 50
+        Cursor = crMultiDrag
+        Anchors = [akLeft, akTop, akRight, akBottom]
+        AutoSize = False
+        Caption = 'Giacenza:'
+      end
+      object edtDataLotto: TCSEdit
+        Left = 28
+        Top = 211
+        Width = 73
+        Height = 21
+        DataType = dtData
+        TabOrder = 0
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amSeparator
+        BlankWhenZero = False
+        Century = True
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+      object Btngiacenze: TButton
+        Left = 155
+        Top = 211
+        Width = 22
+        Height = 22
+        Caption = 'G'
+        TabOrder = 1
+      end
+      object btnPezzoSingolo: TBitBtn
+        Left = 179
+        Top = 181
+        Width = 30
+        Height = 24
+        Caption = 'P.S.'
+        TabOrder = 2
+      end
+    end
+  end
+  object QRighepreparate: TCSEQuery
+    MultipleResults = False
+    CommandText = #13#10
+    EnableBCD = True
+    Unidirectional = True
+    SQL.Strings = (
+      '')
+    Left = 176
+    Top = 96
+  end
+  object DS_RighePreparate: TDataSource
+    DataSet = QRighepreparate
+    Left = 176
+    Top = 56
+  end
+end
diff --git a/source/PI_Altag_BWS/UFraPrepspedOV.pas b/source/PI_Altag_BWS/UFraPrepspedOV.pas
new file mode 100644
index 0000000..e3edd9f
--- /dev/null
+++ b/source/PI_Altag_BWS/UFraPrepspedOV.pas
@@ -0,0 +1,133 @@
+unit UFraPrepspedOV;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
+  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, OLEDBComponents,
+  CSETables, Vcl.Grids, Vcl.DBGrids, SMDBGrid, Vcl.ComCtrls, Vcl.ExtCtrls,
+  Vcl.StdCtrls, Vcl.Buttons, CSEdit, CsLabel, CSButtons;
+
+type
+  TFra_PrepspedOV = class(TFrame)
+    PgcCtrl: TPageControl;
+    Testata: TTabSheet;
+    Griglia: TTabSheet;
+    NewRiga: TTabSheet;
+    QRighepreparate: TCSEQuery;
+    DS_RighePreparate: TDataSource;
+    GridRighepreparate: TSMDBGrid;
+    lbl_datalotto: TLabel;
+    lblGiacenza: TLabel;
+    edtDataLotto: TCSEdit;
+    EdtNewTestata: TCSEdit;
+    LblNewBamTes: TLabel;
+    EdtNumSpedizione: TCSEdit;
+    lblNumSpedizione: TLabel;
+    lblDesVettore: TLabel;
+    LblVETT: TLabel;
+    GroupBox2: TGroupBox;
+    lbl_cartoni: TLabel;
+    Btngiacenze: TButton;
+    btnPezzoSingolo: TBitBtn;
+    Pnlbuttons: TPanel;
+    btnBarcode: TCSBitBtn;
+    btnDetail: TCSBitBtn;
+
+
+    procedure GridRighepreparateDrawColumnCell(Sender: TObject;
+      const Rect: TRect; DataCol: Integer; Column: TColumn;
+      State: TGridDrawState);
+    procedure btnEliminaPreparazioneClick(Sender: TObject);
+    procedure GridRighepreparateColumnMoved(Sender: TObject; FromIndex,
+      ToIndex: Integer);
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+    DERRALIM : string;
+  end;
+
+implementation
+
+uses
+  UPDTMsgBox, UCoreTipi, S3Registry, UCoreInterface, UCoreDB, RSQL, UFrmDetailScarico;
+
+{$R *.dfm}
+
+procedure TFra_PrepspedOV.btnEliminaPreparazioneClick(Sender: TObject);
+var
+  PDTRig: IObjStd;
+  Lidcomrig: integer;
+  Lqry : TCSEQuery;
+  LMsg: string;
+begin
+  if QRighePreparate.RecordCount > 0 then
+  begin
+    if MessaggioPDT('Eliminare i movimenti relativi alla riga selezionata?', APPTITLE, MB_YESNO) = mrYes then
+    begin
+      if not GetInterfOggetto('ObjPDTRig', 'PDTRig', IObjStd, PDTRig) then begin
+        LMsg := 'Si � verificato un errore durante l''inizializzazione del Modulo BWS ' +
+               'per l''interfaccia Preparazione Spedizioni.';
+        MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
+        Exit;
+      end;
+      Lidcomrig := QRighepreparate.FieldByName('IDCOMRIG').AsInteger;
+      try
+        Lqry := TCSEQuery.Create(nil);
+        Lqry.DataBaseName := DBExec.DatabaseName;
+        Lqry.SQL.Text := 'SELECT ID FROM PDTRIG WHERE IDCOMRIG = ' + CS_KeyValueTo_SqlStr(Lidcomrig);
+        Lqry.Open;
+        while not Lqry.Eof do
+        begin
+          PDTRig.Seek('ID', Lqry.FieldByName('ID').AsInteger);
+          if PDTRig.Found then
+          begin
+            PDTRig.Elimina(Lqry.FieldByName('ID').AsInteger);
+          end;
+
+          Lqry.Next;
+        end;
+        GridRighepreparate.RefreshData;
+      finally
+        FreeAndNil(Lqry);
+      end;
+
+
+    end;
+
+  end;
+
+end;
+
+procedure TFra_PrepspedOV.GridRighepreparateColumnMoved(Sender: TObject;
+  FromIndex, ToIndex: Integer);
+begin
+  GridRighepreparate.savetoinifile;
+end;
+
+procedure TFra_PrepspedOV.GridRighepreparateDrawColumnCell(Sender: TObject;
+  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
+begin
+  if QRighepreparate.FieldByName('StatoRiga').AsString = 'rosso' then
+  begin
+    GridRighepreparate.Canvas.Brush.Color := clRed;
+    GridRighepreparate.Canvas.font.Color := clWhite;
+  end;
+
+  if QRighepreparate.FieldByName('StatoRiga').AsString = 'giallo' then
+  begin
+    GridRighepreparate.Canvas.Brush.Color := clYellow;
+    GridRighepreparate.Canvas.font.Color := clBlack;
+  end;
+
+  if QRighepreparate.FieldByName('StatoRiga').AsString = 'verde' then
+  begin
+    GridRighepreparate.Canvas.Brush.Color := clGreen;
+    GridRighepreparate.Canvas.font.Color := clBlack;
+  end;
+
+  GridRighepreparate.DefaultDrawDataCell (Rect, Column.Field, State);
+end;
+
+end.
diff --git a/source/PI_Altag_BWS/UFrmCaricaMag.dfm b/source/PI_Altag_BWS/UFrmCaricaMag.dfm
new file mode 100644
index 0000000..32b7bbf
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmCaricaMag.dfm
@@ -0,0 +1,722 @@
+object FrmCaricaMag: TFrmCaricaMag
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  Caption = 'Carico Magazzino'
+  ClientHeight = 320
+  ClientWidth = 240
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poMainFormCenter
+  OnClose = FormClose
+  OnCreate = FormCreate
+  OnResize = FormResize
+  OnShow = FormShow
+  PixelsPerInch = 96
+  TextHeight = 13
+  object BtnAnnulla: TSpeedButton
+    Left = 179
+    Top = 256
+    Width = 58
+    Height = 24
+    Hint = 'Annulla'
+    Glyph.Data = {
+      F6000000424DF600000000000000760000002800000010000000100000000100
+      0400000000008000000000000000000000001000000000000000000000000000
+      8000008000000080800080000000800080008080000080808000C0C0C0000000
+      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
+      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD44444444DDD6DDDDCEEEEECDDD
+      D66DDDCEEEECDDDDD66DDDCEEEEECDDD6E6DDDCEEEEEEC666E6DDDCECEEEEEEE
+      E68DDDCCDCEEEEEEE6DDDDCDDDCCEEEE6DDDDDDDDDDDCCC6DDDDDDDDDDDDDDDD
+      DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
+    ParentShowHint = False
+    ShowHint = True
+    OnClick = BtnAnnullaClick
+  end
+  object PageCtrl: TPageControl
+    Left = 1
+    Top = 0
+    Width = 236
+    Height = 250
+    ActivePage = tsNuovaRiga
+    Style = tsButtons
+    TabOrder = 0
+    OnChange = PageCtrlChange
+    object tsNuovaRiga: TTabSheet
+      Caption = 'Nuova Riga'
+      DesignSize = (
+        228
+        219)
+      object lbl_nr: TLabel
+        Left = 1
+        Top = 25
+        Width = 18
+        Height = 13
+        Caption = 'Nr :'
+      end
+      object lbl_dt: TLabel
+        Left = 137
+        Top = 25
+        Width = 23
+        Height = 13
+        Anchors = [akTop, akRight]
+        Caption = 'Data'
+        ExplicitLeft = 140
+      end
+      object lbl_for: TLabel
+        Left = 1
+        Top = 47
+        Width = 26
+        Height = 13
+        Caption = 'Forn.'
+      end
+      object lbl_barcode: TLabel
+        Left = 1
+        Top = 84
+        Width = 26
+        Height = 13
+        Caption = 'GS1 :'
+      end
+      object lblArt: TLabel
+        Left = 1
+        Top = 106
+        Width = 19
+        Height = 13
+        Caption = 'Art.'
+      end
+      object lbl_desforn: TLabel
+        Left = 1
+        Top = 64
+        Width = 233
+        Height = 16
+        AutoSize = False
+        WordWrap = True
+      end
+      object lbl_lotto: TLabel
+        Left = 2
+        Top = 123
+        Width = 25
+        Height = 13
+        Caption = 'Lotto'
+      end
+      object lbl_umf: TLabel
+        Left = 29
+        Top = 160
+        Width = 29
+        Height = 13
+        Anchors = [akTop, akRight]
+        Caption = '[UMX]'
+        ExplicitLeft = 33
+      end
+      object lbl_umm: TLabel
+        Left = 97
+        Top = 160
+        Width = 29
+        Height = 13
+        Anchors = [akTop, akRight]
+        Caption = '[UMX]'
+        ExplicitLeft = 101
+      end
+      object lbl_umi: TLabel
+        Left = 165
+        Top = 160
+        Width = 29
+        Height = 13
+        Anchors = [akTop, akRight]
+        Caption = '[UMX]'
+        ExplicitLeft = 169
+      end
+      object lblVano: TLabel
+        Left = 0
+        Top = 200
+        Width = 24
+        Height = 13
+        Caption = 'Vano'
+      end
+      object lblDDT: TLabel
+        Left = 1
+        Top = 3
+        Width = 27
+        Height = 13
+        Caption = 'DDT :'
+      end
+      object lblDatalot: TLabel
+        Left = 165
+        Top = 123
+        Width = 23
+        Height = 13
+        Anchors = [akTop, akRight]
+        Caption = 'Data'
+        ExplicitLeft = 169
+      end
+      object lblNumser: TLabel
+        Left = 80
+        Top = 123
+        Width = 24
+        Height = 13
+        Anchors = [akTop, akRight]
+        Caption = 'Serie'
+        ExplicitLeft = 84
+      end
+      object Edtnumdoc: TCSEdit
+        Left = 31
+        Top = 20
+        Width = 96
+        Height = 21
+        Anchors = [akLeft, akTop, akRight]
+        TabOrder = 1
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amDisable
+        BlankWhenZero = False
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+      object edtDataDoc: TCSEdit
+        Left = 161
+        Top = 20
+        Width = 67
+        Height = 21
+        DataType = dtData
+        Anchors = [akTop, akRight]
+        TabOrder = 2
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amSeparator
+        BlankWhenZero = False
+        Century = True
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+      object edt_barcode: TCSEdit
+        Left = 31
+        Top = 81
+        Width = 197
+        Height = 21
+        Anchors = [akLeft, akTop, akRight]
+        TabOrder = 5
+        OnEnter = edt_barcodeEnter
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amDisable
+        BlankWhenZero = False
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+      object F2forn: TF2
+        Left = 51
+        Top = 42
+        Width = 177
+        Height = 21
+        Anchors = [akLeft, akTop, akRight]
+        BevelOuter = bvNone
+        BorderStyle = bsSingle
+        ParentShowHint = False
+        ShowHint = True
+        TabOrder = 4
+        NumCol = 0
+        BtnEnabled = True
+        ListFieldIndex = 0
+        KeyValue = 0
+        OnKeyChange = F2fornKeyChange
+        MultiSelez = False
+        ReadBarcode = False
+        F2Table = FornitD
+        EmptyOk = True
+        OpenThread = False
+        GridWidth = 181
+        GridHeight = 160
+        DropDownAlign = daLeft
+        DropDownWidth = 181
+        ReadOnly = True
+        DropDownRows = 0
+      end
+      object F2Art: TF2
+        Left = 31
+        Top = 102
+        Width = 198
+        Height = 21
+        Anchors = [akLeft, akTop, akRight]
+        BevelOuter = bvNone
+        BorderStyle = bsSingle
+        ParentShowHint = False
+        ShowHint = True
+        TabOrder = 6
+        OnExit = F2ArtExit
+        NumCol = 0
+        BtnEnabled = True
+        ListFieldIndex = 0
+        KeyValue = 0
+        MultiSelez = False
+        ReadBarcode = False
+        F2Table = ArticoC
+        EmptyOk = True
+        OpenThread = False
+        GridWidth = 212
+        GridHeight = 160
+        DropDownAlign = daLeft
+        DropDownWidth = 212
+        ReadOnly = True
+        DropDownRows = 0
+      end
+      object edtNumser: TCSEdit
+        Left = 78
+        Top = 137
+        Width = 82
+        Height = 21
+        Anchors = [akTop, akRight]
+        TabOrder = 8
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amDisable
+        BlankWhenZero = False
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+      object edtqtaUmf: TCSEdit
+        Left = 29
+        Top = 174
+        Width = 67
+        Height = 21
+        DataType = dtNumerico
+        Anchors = [akTop, akRight]
+        TabOrder = 10
+        OnExit = edtqtaUmfExit
+        Alignment = taRightJustify
+        AllowNegative = True
+        AutoMode = amDisable
+        BlankWhenZero = True
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 3
+        DigitsInt = 15
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = True
+        ControlloData = True
+      end
+      object edtQtaUMm: TCSEdit
+        Left = 95
+        Top = 174
+        Width = 67
+        Height = 21
+        DataType = dtNumerico
+        Anchors = [akTop, akRight]
+        TabOrder = 11
+        OnExit = edtQtaUMmExit
+        Alignment = taRightJustify
+        AllowNegative = True
+        AutoMode = amDisable
+        BlankWhenZero = True
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 3
+        DigitsInt = 15
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = True
+        ControlloData = True
+      end
+      object edtQtaUMI: TCSEdit
+        Left = 161
+        Top = 174
+        Width = 67
+        Height = 21
+        DataType = dtNumerico
+        Anchors = [akTop, akRight]
+        TabOrder = 12
+        OnExit = edtQtaUMIExit
+        Alignment = taRightJustify
+        AllowNegative = True
+        AutoMode = amDisable
+        BlankWhenZero = True
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 3
+        DigitsInt = 15
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = True
+        ControlloData = True
+      end
+      object edtForn: TCSEdit
+        Left = 31
+        Top = 42
+        Width = 20
+        Height = 21
+        DataType = dtNumerico
+        TabOrder = 3
+        OnExit = edtFornExit
+        Alignment = taRightJustify
+        AllowNegative = True
+        AutoMode = amDisable
+        BlankWhenZero = True
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 3
+        DigitsInt = 15
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = True
+        ControlloData = True
+      end
+      object f2Allmag: TF2
+        Left = 33
+        Top = 197
+        Width = 195
+        Height = 21
+        Anchors = [akLeft, akTop, akRight]
+        BevelOuter = bvNone
+        BorderStyle = bsSingle
+        ParentShowHint = False
+        ShowHint = True
+        TabOrder = 13
+        NumCol = 0
+        BtnEnabled = True
+        ListFieldIndex = 0
+        KeyValue = 0
+        MultiSelez = False
+        ReadBarcode = False
+        F2Table = AllMag
+        EmptyOk = True
+        OpenThread = False
+        GridWidth = 212
+        GridHeight = 160
+        DropDownAlign = daLeft
+        DropDownWidth = 212
+        ReadOnly = True
+        DropDownRows = 0
+      end
+      object f2Tipodoc: TF2
+        Left = 31
+        Top = -1
+        Width = 197
+        Height = 21
+        Anchors = [akLeft, akTop, akRight]
+        BevelOuter = bvNone
+        BorderStyle = bsSingle
+        ParentShowHint = False
+        ShowHint = True
+        TabOrder = 0
+        NumCol = 0
+        BtnEnabled = True
+        ListFieldIndex = 0
+        KeyValue = 0
+        MultiSelez = False
+        ReadBarcode = False
+        F2Table = TipiDoc
+        EmptyOk = True
+        OpenThread = False
+        GridWidth = 206
+        GridHeight = 160
+        DropDownAlign = daLeft
+        DropDownWidth = 206
+        ReadOnly = True
+        DropDownRows = 0
+      end
+      object edtNumlot: TCSEdit
+        Left = 1
+        Top = 137
+        Width = 77
+        Height = 21
+        Anchors = [akLeft, akTop, akRight]
+        TabOrder = 7
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amDisable
+        BlankWhenZero = False
+        Century = False
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+      object edtDatLot: TCSEdit
+        Left = 163
+        Top = 137
+        Width = 65
+        Height = 21
+        DataType = dtData
+        Anchors = [akTop, akRight]
+        TabOrder = 9
+        Alignment = taLeftJustify
+        AllowNegative = False
+        AutoMode = amSeparator
+        BlankWhenZero = False
+        Century = True
+        ColorOnFocus = clYellow
+        DigitsDec = 0
+        DigitsInt = 0
+        FormatZero = fzNothing
+        MaxTimeUnit = tuOre
+        MinTimeUnit = tuSecondi
+        PercSign = False
+        Seconds = False
+        ThousandSep = False
+        ControlloData = True
+      end
+    end
+    object tsGriglia: TTabSheet
+      Caption = 'Griglia'
+      ImageIndex = 1
+      ExplicitLeft = 0
+      ExplicitTop = 0
+      ExplicitWidth = 0
+      ExplicitHeight = 0
+      object GridRighepreparate: TSMDBGrid
+        Left = 0
+        Top = 0
+        Width = 228
+        Height = 192
+        ExOptions = [eoDrawGraphicField, eoKeepSelection, eoStandardPopup]
+        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
+        KeyField = 'ID'
+        WidthOfIndicator = 14
+        ScrollBars = ssHorizontal
+        ColCount = 10
+        RowCount = 2
+        Col = 1
+        Row = 1
+        Align = alClient
+        DataSource = DS_RighePreparate
+        FixedColor = clWhite
+        TabOrder = 0
+        TitleFont.Charset = DEFAULT_CHARSET
+        TitleFont.Color = clWindowText
+        TitleFont.Height = -11
+        TitleFont.Name = 'Tahoma'
+        TitleFont.Style = []
+        Columns = <
+          item
+            Expanded = False
+            FieldName = 'codart'
+            Title.Caption = 'Cod. Art.'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'descrart'
+            Title.Caption = 'Descr. Art.'
+            Width = 90
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'QTAORDSPA'
+            Title.Caption = 'Qta. Prep.'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'umfor'
+            Title.Caption = 'UM Forn.'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'QTAORDMSPA'
+            Title.Caption = 'Qta Mov. Prep.'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'umMov'
+            Title.Caption = 'UM Mov.'
+            Width = 49
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'QTAORDISPA'
+            Title.Caption = 'Qta Inv. Prep.'
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'UMINV'
+            Title.Caption = 'UM Inv.'
+            Width = 49
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end
+          item
+            Expanded = False
+            FieldName = 'TOTQTAORD'
+            Title.Caption = 'Tot. Qta. Disp. OA'
+            Width = 76
+            Visible = True
+            DigitsDec = 3
+            DigitsInt = 15
+          end>
+      end
+      object pnlCartoni: TPanel
+        Left = 0
+        Top = 192
+        Width = 228
+        Height = 27
+        Align = alBottom
+        Alignment = taLeftJustify
+        TabOrder = 1
+        Visible = False
+        object btnDetail: TCSBitBtn
+          Left = 0
+          Top = 1
+          Width = 116
+          Height = 25
+          Caption = 'Dettaglio Letture'
+          TabOrder = 0
+          OnClick = btnDetailClick
+          GlyphLibraryIndex = 162
+        end
+      end
+    end
+  end
+  object BtnElabora: TBitBtn
+    Left = 1
+    Top = 256
+    Width = 58
+    Height = 24
+    Hint = 'Elabora'
+    Glyph.Data = {
+      DE010000424DDE01000000000000760000002800000024000000120000000100
+      0400000000006801000000000000000000001000000000000000000000000000
+      8000008000000080800080000000800080008080000080808000C0C0C0000000
+      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
+      DDDDDDDDDDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
+      0000DDD22DDDDDDDDDDDDDDDDDF77DDDDDDDDDDD0000DDD2A2DDDDDDDDDDDDDD
+      DDF7F7DDDDDDDDDD0000DDD2AA2DDDDDDDDDDDDDDDF7DF7DDDDDDDDD0000DDD2
+      AAA2DDDDDDDDDDDDDDF7DDF7DDDDDDDD0000DDD2AAAA2DDDDDDDDDDDDDF7DDDF
+      7DDDDDDD0000DDD2AAAAA2DDDDDDDDDDDDF7DDDDF7DDDDDD0000DDD2AAAAAA2D
+      DDDDDDDDDDF7DDDDDF7DDDDD0000DDD2AAAAAAA2DDDDDDDDDDF7DDDDD7FDDDDD
+      0000DDD2AAAAAA2DDDDDDDDDDDF7DDDD7FDDDDDD0000DDD2AAAAA2DDDDDDDDDD
+      DDF7DDD7FDDDDDDD0000DDD2AAAA2DDDDDDDDDDDDDF7DD7FDDDDDDDD0000DDD2
+      AAA2DDDDDDDDDDDDDDF7D7FDDDDDDDDD0000DDD2AA2DDDDDDDDDDDDDDDF77FDD
+      DDDDDDDD0000DDD2A2DDDDDDDDDDDDDDDDF7FDDDDDDDDDDD0000DDD22DDDDDDD
+      DDDDDDDDDDFFDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
+      0000}
+    NumGlyphs = 2
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 1
+    OnClick = BtnElaboraClick
+  end
+  object BtnPreparaRiga: TBitBtn
+    Left = 60
+    Top = 256
+    Width = 58
+    Height = 24
+    Hint = 'Prepara riga'
+    Default = True
+    Glyph.Data = {
+      F6000000424DF600000000000000760000002800000010000000100000000100
+      0400000000008000000000000000000000001000000000000000000000000000
+      8000008000000080800080000000800080008080000080808000C0C0C0000000
+      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
+      DDDDDDDDDDDDDDDDDDDDDDDDDDDDD99DDDDDD888888899998DDDD8F8FFF99F89
+      9DDDD8888888888899DDD8F8FFFFFF8F899DD888888888888D9DD8F8FFFFFF8F
+      8DDDD444444444444DDDD4BBBBBBBBBB4DDDD444444444444DDDD8F8FFFFFF8F
+      8DDDD8F8FFFFFF8F8DDDD888888888888DDDDDDDDDDDDDDDDDDD}
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 2
+    OnClick = BtnPreparaRigaClick
+  end
+  object BtnPulisci: TCSBitBtn
+    Left = 119
+    Top = 256
+    Width = 58
+    Height = 24
+    TabOrder = 3
+    OnClick = BtnPulisciClick
+    GlyphLibraryIndex = 117
+  end
+  object QRighepreparate: TCSEQuery
+    MultipleResults = False
+    CommandText = #13#10
+    EnableBCD = True
+    Unidirectional = True
+    SQL.Strings = (
+      '')
+    Left = 40
+    Top = 280
+  end
+  object DS_RighePreparate: TDataSource
+    DataSet = QRighepreparate
+    Left = 160
+    Top = 280
+  end
+end
diff --git a/source/PI_Altag_BWS/UFrmCaricaMag.pas b/source/PI_Altag_BWS/UFrmCaricaMag.pas
new file mode 100644
index 0000000..7092142
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmCaricaMag.pas
@@ -0,0 +1,1702 @@
+unit UFrmCaricaMag;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,U_Altag_BWS, Vcl.StdCtrls, CSEdit,
+  Vcl.Buttons, CSButtons, Vcl.ExtCtrls, Compf2, s3db, csetables, ucoresecure, ucoredb,
+  Vcl.ComCtrls, UCoreTipi, Vcl.Grids, Vcl.DBGrids, SMDBGrid, Data.DB,
+  OLEDBComponents,FFuncStd;
+
+type
+  TFrmCaricaMag = class(TFrmFuncStd)
+    PageCtrl: TPageControl;
+    tsNuovaRiga: TTabSheet;
+    tsGriglia: TTabSheet;
+    lbl_nr: TLabel;
+    lbl_dt: TLabel;
+    lbl_for: TLabel;
+    lbl_barcode: TLabel;
+    lblArt: TLabel;
+    lbl_desforn: TLabel;
+    lbl_lotto: TLabel;
+    lbl_umf: TLabel;
+    lbl_umm: TLabel;
+    lbl_umi: TLabel;
+    lblVano: TLabel;
+    lblDDT: TLabel;
+    lblDatalot: TLabel;
+    Edtnumdoc: TCSEdit;
+    edtDataDoc: TCSEdit;
+    edt_barcode: TCSEdit;
+    F2forn: TF2;
+    F2Art: TF2;
+    edtNumser: TCSEdit;
+    edtqtaUmf: TCSEdit;
+    edtQtaUMm: TCSEdit;
+    edtQtaUMI: TCSEdit;
+    edtForn: TCSEdit;
+    f2Allmag: TF2;
+    f2Tipodoc: TF2;
+    edtNumlot: TCSEdit;
+    edtDatLot: TCSEdit;
+    GridRighepreparate: TSMDBGrid;
+    QRighepreparate: TCSEQuery;
+    DS_RighePreparate: TDataSource;
+    lblNumser: TLabel;
+    pnlCartoni: TPanel;
+    btnDetail: TCSBitBtn;
+    BtnAnnulla: TSpeedButton;
+    BtnElabora: TBitBtn;
+    BtnPreparaRiga: TBitBtn;
+    BtnPulisci: TCSBitBtn;
+    procedure edt_barcodeEnter(Sender: TObject);
+    procedure BtnAnnullaClick(Sender: TObject);
+    procedure F2fornKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+    procedure BtnElaboraClick(Sender: TObject);
+    function OttieniIdBollaFornitore : integer;
+    procedure BtnPreparaRigaClick(Sender: TObject);
+    function validacontrolli : Boolean;
+    procedure edtQtaUMmExit(Sender: TObject);
+    procedure edtqtaUmfExit(Sender: TObject);
+    procedure F2ArtExit(Sender: TObject);
+    function VerificaEsistenzaLotto(idartico : Integer;numlot,numser : string;DataLotto : double) : Integer;
+    procedure puliscicampi(cancella_ddt : Boolean = False);
+    procedure BtnPulisciClick(Sender: TObject);
+    function verificaEsistenzaDDTFornitore(idtipidoc : Integer; numdoc : string; datdoc : tdatetime; idfor : Integer) : Boolean;
+    procedure edtFornExit(Sender: TObject);
+    procedure LeggiIni;
+    function getIdBolla : integer;
+    procedure edtQtaUMIExit(Sender: TObject);
+    procedure PageCtrlChange(Sender: TObject);
+    procedure CSBitBtn1Click(Sender: TObject);
+    procedure btnDetailClick(Sender: TObject);
+    procedure FormShow(Sender: TObject);
+    procedure FormClose(Sender: TObject; var Action: TCloseAction);
+    procedure FormCreate(Sender: TObject);
+    procedure FormResize(Sender: TObject);
+  private
+    { Private declarations }
+     iBWS_barcode : TBWS_barcode128;
+     UMFOR,
+     UMI,
+     UMM : string;
+     UMCO : double;
+  public
+    { Public declarations }
+  end;
+
+type
+  ini = record
+    idcaumov: Integer;
+    idvano: integer;
+  end;
+
+var
+  FrmCaricaMag: TFrmCaricaMag;
+  //idbollafornitore : Integer;
+  Hw_module : hmodule;
+  fIni : ini;
+  fl_inizializzazione : Boolean;
+
+implementation
+
+uses
+  IBase, System.IniFiles, imagazzino, iacquisti, ifornitori, s3registry,
+  System.DateUtils, uvarie, updtproc, uvaristd, UtilsArticoli, ipdt,
+  UPDTMsgBox, UCoreInterface, RSQL, UFrmDetailCarico;
+
+{$R *.dfm}
+
+procedure TFrmCaricaMag.BtnPulisciClick(Sender: TObject);
+begin
+  PulisciCampi;
+end;
+
+procedure TFrmCaricaMag.CSBitBtn1Click(Sender: TObject);
+var
+  PDTRigAcq: IObjStd;
+  Lid: integer;
+  Lqry : TCSEQuery;
+  LMsg: string;
+begin
+  if QRighePreparate.RecordCount > 0 then
+  begin
+    if MessaggioPDT('Eliminare i movimenti relativi alla riga selezionata?', APPTITLE, MB_YESNO) = mrYes then
+    begin
+      if not GetInterfOggetto('ObjPDTRigAcq', 'PDTRigAcq', IObjStd, PDTRigAcq) then begin
+        LMsg := 'Si � verificato un errore durante l''inizializzazione del Modulo BWS ' +
+               'per l''interfaccia Preparazione Spedizioni.';
+        MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
+        Exit;
+      end;
+      Lid := QRighepreparate.FieldByName('IDLOTSER').AsInteger;
+      try
+        Lqry := TCSEQuery.Create(nil);
+        Lqry.DataBaseName := DBExec.DatabaseName;
+        Lqry.SQL.Text := 'SELECT ID FROM PDTRIGACQ WHERE IDLOTSER= ' + CS_KeyValueTo_SqlStr(Lid);
+        Lqry.Open;
+        while not Lqry.Eof do
+        begin
+          PDTRigAcq.Seek('ID', Lqry.FieldByName('ID').AsInteger);
+          if PDTRigAcq.Found then
+          begin
+            PDTRigAcq.Elimina(Lqry.FieldByName('ID').AsInteger);
+          end;
+
+          Lqry.Next;
+        end;
+        GridRighepreparate.RefreshData;
+      finally
+        FreeAndNil(Lqry);
+      end;
+
+
+    end;
+
+  end;
+
+end;
+
+procedure TFrmCaricaMag.BtnAnnullaClick(Sender: TObject);
+begin
+  if MessaggioPDT('Vuoi abbandonare la procedura?',APPTITLE, MB_YESNO) = mrYes then
+    Close;
+end;
+
+procedure TFrmCaricaMag.btnDetailClick(Sender: TObject);
+var
+  frmDett : TFrmDetailCarico;
+begin
+  frmDett := tfrmdetailcarico.create(Self);
+  frmdett.Height := self.Height;
+  frmdett.Width := self.Width;
+  with frmDett.qr_dettaglio do
+  begin
+    Prepare;
+    ParamByName('codice').Asstring     := QRighepreparate.FieldByName('codart').AsString;
+    ParamByName('idfor').AsInteger     := QRighepreparate.FieldByName('ext_idfor').AsInteger;
+    ParamByName('idtipidoc').AsInteger := QRighepreparate.FieldByName('ext_idtipidoc').AsInteger;
+    ParamByName('datadoc').AsFloat     := QRighepreparate.FieldByName('ext_datdoc').AsFloat;
+    ParamByName('numdoc').AsString     := QRighepreparate.FieldByName('ext_numdoc').AsString;
+    Open;
+  end;
+  frmDett.showmodal;
+  frmDett.Free;
+  GridRighepreparate.RefreshData;
+end;
+
+procedure TFrmCaricaMag.BtnElaboraClick(Sender: TObject);
+
+  function getLottoStd(idlotto : Integer) : Integer;
+  var
+    qr : TCSEQuery;
+    idartico : integer;
+  begin
+    qr := TCSEQuery.Create(nil);
+    qr.DataBaseName := DBExec.DatabaseName;
+    qr.SQL.Text := 'select idartico from lotser where id = ' + IntToStr(idlotto);
+    qr.Open;
+    idartico := qr.FieldByName('idartico').AsInteger;
+    qr.Close;
+    qr.SQL.Text := 'select id from lotser where idartico = ' + IntToStr(idartico) + ' and numlot = ''00000000000'' and numser = ''0000000000000''';
+    qr.Open;
+    result := qr.FieldByName('id').AsInteger;
+    qr.Close;
+    qr.Free;
+  end;
+
+var
+  QryTmp,
+  qrDelPdtrig,
+  Lqr: TCSEQuery;
+
+  LStruFotoRigheAcq: TStruFotoRigheACQ;
+
+  TSRigAcq: TStringList;
+
+  TD1: TRecInfoDocAcqTesGen;
+  //FrmCarOARig: TFrmCarOARig;
+  MsgErr,
+  TabAcqRtoFatR,
+  app: string;
+
+  LDatRic: Double;
+
+  LFatRigAcq : IBfRigACQStd;
+  objoacrig : IForRig;
+  objartico : IArticoStd;
+  //objoactes : IForTes;
+
+  objlottibfacq : ILottiBFACQStd;
+
+  FobjLotSer : ILotSerStd;
+
+  LProgRighe,
+  idbollafornitore,
+  LidFatrigAcq,
+  idlottoGenerato : Integer;
+
+  ObjBamTesacq : IBamTesACQStd;
+  ForServ: IStFor;
+
+  QtaOrd, QtaOrdM, QtaOrdI: Double;
+
+  StrP: StruPrezzoACQ;
+
+  res : string;
+begin
+
+  if edtqtaUmf.AsFloat > 0 then
+  begin
+    MessaggioPDT('Attenzione riga non preparata.', APPTITLE, MB_OK);
+    abort;
+  end;
+
+  if MessaggioPDT('Si desidera effettuare il ricevimento?',APPTITLE,MB_YESNO) = mrNo then
+    exit;
+
+
+
+  ForServ := forservice as IStFor;
+
+  idbollafornitore := 0;
+
+  TD1.TipDoc := 'B';
+
+  TD1.IdTipiDoc := f2Tipodoc.KeyValue;
+
+  TD1.NumDoc := Edtnumdoc.AsString;
+
+  TD1.DatDoc := edtDataDoc.AsDateTime;
+
+  TD1.IdVettore := 0;
+
+  TD1.IdAspBeni := 0;
+
+  TD1.NumCopie := 0;
+
+  TD1.NumCopieEti := 0;
+
+  TD1.Esito := true;
+
+  LDatRic := trunc(Now());
+
+  begin
+    TSRigAcq := TStringList.Create;
+
+    QryTmp := TCSEQuery.Create(nil);
+    QryTmp.DataBaseName := Azienda.DataBaseName;
+    try
+      try
+
+        QryTmp.SQL.Text := 'SELECT pd.Id,pd.idoacrig ' +
+                           'FROM PDTRigAcq pd ' +
+                           'INNER JOIN OAcRig rg ON pd.IdOAcRig=rg.Id ' +
+                           'WHERE ext_idfor = :idfor ' +
+                           '  and ext_idtipidoc = :idtipidoc ' +
+                           '  and ext_numdoc = :numdoc ' +
+                           '  and ext_datdoc = :datdoc ' +
+                           '  and pd.IdFatRigAcq IS NULL ';
+
+        QryTmp.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+        QryTmp.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+        QryTmp.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+        QryTmp.ParamByName('datdoc').Asdatetime := edtDataDoc.Asdatetime;
+
+        QryTmp.Open;
+        while not QryTmp.Eof do
+        begin
+          TSRigAcq.Add(IntToStr(QryTmp.FieldByName('Id').AsInteger));
+          QryTmp.Next;
+        end;
+        //QryTmp.Close;
+
+       // if TSRigAcq.Count <= 0 then
+       //   exit;//raise Exception.Create(RS_PDT_FIngrOAFor_008);
+
+        if (TSRigAcq.Count > 0) and (RiempiTabAcqRToFatR(TSRigAcq, TabAcqRtoFatR)) then
+        begin
+
+          // All'interno della transazione per� non vengono cancellate le righe da PDTRigAcq
+          MsgErr := EvadiDocumentiAcquisto(TabAcqRtoFatR, TSRigAcq, TD1, LDatRic);
+          if Trim(MsgErr) <> '' then
+            raise Exception.Create('Si � verificato il seguente errore : ' + CRLF + MsgErr);
+
+          idbollafornitore := getidbolla;
+
+          // evasione forzata righe oa
+          if (not GetInterfOggetto('objForRig', 'OACRIG', IForRig, ObjOAcRig)) then
+          begin
+            Application.MessageBox(PChar('Interfaccia righe O.A. non istanziata correttamente.'),
+                                 PChar(APPTITLE),
+                                 MB_ICONERROR + MB_OK);
+            exit;
+          end;
+
+          QryTmp.First;
+          while not QryTmp.Eof do
+          begin
+            objoacrig.Found := False;
+            objoacrig.Seek('ID',qrytmp.FieldByName('idoacrig').AsInteger);
+            if objoacrig.Found then
+            begin
+              objoacrig.CampiObj['FOREVA'] := -1;
+              objoacrig.Modifica;
+            end;
+            QryTmp.Next;
+          end;
+          // fine evasione forzata
+
+          MsgErr := DeletePDTRigAcq(TSRigAcq);
+          if (Trim(MsgErr) <> '') then
+          begin
+            raise Exception.Create('Si � verificato il seguente errore : ' + CRLF + MsgErr);
+          end;
+        end;
+
+        // verifico se ci sono degli orfani e li aggiungo al ddt
+        QryTmp.Close;
+        QryTmp.SQL.Clear;
+        QryTmp.SQL.Text := 'select * from pdtrigacq ' +
+                           ' where ext_idfor = :idfor ' +
+                           '   and ext_idtipidoc = :idtipidoc ' +
+                           '   and ext_numdoc = :numdoc ' +
+                           '   and ext_datdoc = :datdoc ' +
+                           '   and isnull(IdOAcRig,0) = 0';
+
+        QryTmp.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+        QryTmp.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+        QryTmp.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+        QryTmp.ParamByName('datdoc').Asdatetime := edtDataDoc.Asdatetime;
+
+        QryTmp.Open;
+
+        if not QryTmp.IsEmpty then
+        begin
+          // se l'id � zero, il ddt non � stato creato e gli orfani non possono essere agganciati ad un ddt fornitore esistente.
+          // devo quindi creare il ddt
+
+          if idbollafornitore = 0 then
+            idbollafornitore := OttieniIdBollaFornitore;
+
+          if not GetInterfOggetto('ObjBamTesacq', 'BamTesacq', IBamTesacqStd, ObjBamTesacq) then
+          begin
+            raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
+          end;
+          ObjBamTesacq.Seek('id',idbollafornitore);
+
+          qrDelPdtrig := TCSEQuery.Create(nil);
+          qrDelPdtrig.DataBaseName := dbexec.DatabaseName;
+
+          if not GetInterfOggetto('ObjBfRigAcq', 'FATRIGACQ', IBfrigacqstd , LFatRigAcq) then
+          begin
+            raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
+          end;
+
+          if not GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, objartico)   then
+          begin
+            raise Exception.Create('Errore durante l''inizializzazione del modulo articoli');
+          end;
+
+          Lqr := DBExec.OpenSql('select max(rigabam) as cont from fatrigacq where idbam='+inttostr(idbollafornitore));
+
+          LProgRighe := lqr.FieldByName('cont').AsInteger;
+
+          while not QryTmp.Eof do
+          begin
+
+            LProgRighe := LProgRighe +1;
+            LFatRigAcq.CampiObj['IDBAM']  := idbollafornitore;
+
+            LFatRigAcq.CampiObj['RIGABAM']:= LProgRighe;
+
+            //LFatRigAcq.CampiObj['IDARTICO'] := QryTmp.FieldByName('idlotser').AsInteger;
+            // cm : ci devo mettere l'id del lotto standard perch� non si capisce una madonna di come ragiona sam.
+            LFatRigAcq.CampiObj['IDARTICO'] := getLottoStd(QryTmp.FieldByName('idlotser').AsInteger);
+
+            LFatRigAcq.CampiObj['idanamag'] := f2allmag.keyvalue;
+
+            lqr := DBExec.openSql('select idartico from lotser where id = ' + IntToStr(QryTmp.FieldByName('idlotser').AsInteger));
+
+            objartico.Seek('ID',lqr.FieldByName('idartico').AsInteger);
+
+            LFatRigAcq.CampiObj['DESCR']:= objartico.CampiObj['DESCR'];
+
+            ForServ := forservice as IStFor;
+            LStruFotoRigheAcq := ForServ.GetUMFORStd(objartico.CampiObj['ID'], 0, 1,
+                                                       QtaOrd, QtaOrdM, QtaOrdI);
+
+
+            LFatRigAcq.CampiObj['IDUMF']   := LStruFotoRigheAcq.IdUMF;
+            LFatRigAcq.CampiObj['UMFCO']   := LStruFotoRigheAcq.UMFCO;
+            LFatRigAcq.CampiObj['UMACO']   := LStruFotoRigheAcq.UMACO;
+            LFatRigAcq.CampiObj['UMFRIF1'] := LStruFotoRigheAcq.UMFRIF1;
+            LFatRigAcq.CampiObj['UMFRIF2'] := LStruFotoRigheAcq.UMFRIF2;
+            LFatRigAcq.CampiObj['UMPRACQ'] := LStruFotoRigheAcq.UMPRACQ;
+            LFatRigAcq.CampiObj['DAQUOT']  := LStruFotoRigheAcq.daQuot;
+            LFatRigAcq.CampiObj['UMF']     := LStruFotoRigheAcq.UMF;
+            LFatRigAcq.CampiObj['UMRelVar']:= LStruFotoRigheAcq.UMRelVar;
+            LFatRigAcq.CampiObj['COAFOR']  := LStruFotoRigheAcq.COAFOR;
+            LFatRigAcq.CampiObj['DAQUOT']   := 0;
+            LFatRigAcq.CampiObj['OMASCM']   := 'N';
+            LFatRigAcq.CampiObj['TICASC']   := 'A';
+            LFatRigAcq.CampiObj['IDCAUMOV'] := fIni.idcaumov;
+            LFatRigAcq.CampiObj['IDIVA'] := objartico.CampiObj['IDIVA'];
+            LFatRigAcq.CampiObj['IdValuta']:= DBExec.RValutaSI.IdEuro;
+            LFatRigAcq.CampiObj['Cambio']:= 1;
+
+            app := IFornitori.CercaPrezzo(dbexec.DataBaseName,
+                                       objartico.CampiObj['id'],
+                                       QryTmp.FieldByName('ext_idfor').AsInteger,
+                                       0,
+                                       Trunc(Now),
+                                       0,
+                                       StrP,
+                                       True, // mettendo True restituisce il prezzo nella valuta del S.I.
+                                       False);
+
+            LFatRigAcq.CampiObj['PREZZO']  := strp.Prezzo;
+
+            LFatRigAcq.CampiObj['Sconto1'] := StrP.Sconto1;
+
+            LFatRigAcq.CampiObj['Sconto2'] := StrP.Sconto2;
+
+            LFatRigAcq.CampiObj['Sconto3'] := StrP.Sconto3;
+
+            LFatRigAcq.CampiObj['Sconto4'] := StrP.Sconto4;
+
+            LFatRigAcq.CampiObj['ScontoL'] := StrP.ScontoL;
+
+            LFatRigAcq.CampiObj['IDUMF']   := strp.IdUMF;
+
+            LFatRigAcq.CampiObj['UMFCO']   := StrP.UMCO;
+
+            LFatRigAcq.CampiObj['UMFRIF1'] := strp.UMFRIF1;
+
+            LFatRigAcq.CampiObj['UMFRIF2'] := strp.UMFRIF2;
+
+            LFatRigAcq.CampiObj['UMPRACQ'] := strp.UMPRACQ;
+
+            LFatRigAcq.CampiObj['UMARIF1'] := objartico.campiobj['UMREL1'];
+
+            LFatRigAcq.CampiObj['UMARIF2'] := objartico.CampiObj['UMREL2'];
+
+            LFatRigAcq.CampiObj['UMF']     := strp.UMF;
+
+            LFatRigAcq.CampiObj['UMRelVar']:= strp.UMRelVar;
+
+            LFatRigAcq.CampiObj['COAFOR']  := strp.COAFOR;
+
+            LFatRigAcq.CampiObj['IDLISRIGACQ'] := StrP.IdLisRigACQ;
+
+
+
+            if StrP.IdLisRigACQ > 0 then
+            begin
+              LFatRigAcq.CampiObj['DAQUOT']   := -1;
+              //LFatRigAcq.CampiObj['IdValuta']:= StrP.IdValutaLis;
+            end;
+            LFatRigAcq.CampiObj['QTAORD']  := QryTmp.FieldByName('QtaOrd').AsFloat;
+
+            LFatRigAcq.CampiObj['QTAORDI'] := QryTmp.FieldByName('QtaOrdI').AsFloat;
+
+            LFatRigAcq.CampiObj['QTAORDM'] := QryTmp.FieldByName('QtaOrdM').AsFloat;
+
+            LFatRigAcq.Ricalcola(DBExec.RValutaSI.DecMaxEuro , DBExec.RValutaSI.DecContEuro);
+            LIdFatRigAcq := LFatRigAcq.Insert;
+
+            if LIdFatRigAcq<1 then
+            begin
+              raise Exception.Create('Errore creazione riga ddt fornitore!');
+            end
+            else
+            begin
+              ObjBamTesacq.RicalcolaTotali(false, false, false);
+              ObjBamTesacq.Modifica;
+              if not (GetInterfOggetto('ObjLottiBfAcq', 'LOTTIBFACQ', ILottiBFACQStd, objlottibfacq)) then
+              begin
+
+                raise Exception.Create('Errore durante l''inizializzazione del modulo lotti acquisto');
+              end;
+              // una volta generato da standard il nuovo lotto (non si sa per quale cazzo di motivo),
+              //vado a sostituire su lottibf quello che effettivamente mi serve e cancello quello
+              //generato automaticamente
+              objlottibfacq.Found := false;
+              objlottibfacq.Seek('IDFATRIGACQ',LidFatrigAcq);
+              if objlottibfacq.Found then
+              begin
+                idLottoGenerato := objlottibfacq.CampiObj['idlotser'];
+                objlottibfacq.CampiObj['idlotser'] := QryTmp.FieldByName('idlotser').AsInteger;
+                objlottibfacq.Modifica;
+                GetInterfOggetto('ObjLotSer', 'LotSer', ILotSerStd, FobjLotSer);
+                FobjLotSer.Seek('id',idlottoGenerato);
+                FobjLotSer.EliminaNoTrans(idlottogenerato);
+              end;
+            end;
+            qrDelPdtrig.Close;
+            qrDelPdtrig.SQL.Text := 'delete from pdtrigacq where id = :id';
+            qrDelPdtrig.ParamByName('id').AsInteger := QryTmp.FieldByName('id').AsInteger;
+            qrDelPdtrig.ExecSQL;
+            qrDelPdtrig.Close;
+            QryTmp.Next;
+          end;
+
+
+          FreeAndNil(qrDelPdtrig);
+        end;
+        QryTmp.Close;
+        if not assigned(ObjBamTesacq) then
+        begin
+          if not GetInterfOggetto('ObjBamTesacq', 'BamTesacq', IBamTesacqStd, ObjBamTesacq) then
+          begin
+            raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
+          end;
+        end;
+        ObjBamTesacq.Seek('id',idbollafornitore);
+        if ObjBamTesacq.Found then
+        begin
+
+          res := ObjBamTesacq.ImpostaStato('D');
+          if res = '' then
+          begin
+            ObjBamTesacq.CampiObj['STATO'] := 'D';
+            ObjBamTesacq.Modifica;
+          end
+          else
+          begin
+            MessaggioPDT('Errore nel passaggio del documento in definitivo : ' + #10+#13+res,APPTITLE,mb_ok);
+          end;
+
+
+        end;
+        MessaggioPDT('Operazione completata!',APPTITLE,MB_OK);
+      except
+        on E: Exception do
+          MessaggioPDT(e.Message,APPTITLE,MB_ok);
+      end;
+    finally
+      if Assigned(QryTmp) then
+      begin
+        QryTmp.Close;
+        FreeAndNil(QryTmp);
+      end;
+
+      if Assigned(TSRigAcq) then
+        FreeAndNil(TSRigAcq);
+    end;
+
+    puliscicampi(True);
+  end;
+
+
+end;
+
+procedure TFrmCaricaMag.BtnPreparaRigaClick(Sender: TObject);
+  function getIdUM(cod : string) : Integer;
+  var
+    Lqrd : TCSEQuery;
+  begin
+    result := 0;
+    Lqrd := TCSEQuery.Create(nil);
+    Lqrd.DataBaseName := dbexec.DatabaseName;
+    Lqrd.SQL.Text := 'select id from umart where codice = :cod';
+    Lqrd.ParamByName('cod').AsString := cod;
+    Lqrd.Open;
+    if not Lqrd.IsEmpty then
+      result := Lqrd.FieldByName('id').AsInteger;
+    Lqrd.Close;
+    FreeAndNil(Lqrd);
+  end;
+var
+  idlotser,
+  idpdtrigacq : integer;
+  qtares : Double;
+  Sqr,
+  qr_ins : TCSEQuery;
+  flOrfano,
+  fluscita : Boolean;
+  qta,
+  kg : Double;
+  objartico : IArticoStd;
+  PDTRigAcq: IObjStd;
+  Lmsg : string;
+begin
+  if FL_inizializzazione then
+    Exit;
+
+  edtqtaUmfExit(sender);
+
+  flOrfano := False;
+  fluscita := false;
+  if validacontrolli then
+  begin
+    if not GetInterfOggetto('ObjPDTRigAcq', 'PDTRigAcq', IObjStd, PDTRigAcq) then
+    begin
+      LMsg := 'Si � verificato un errore durante l''inizializzazione del Modulo BWS ' +
+              'per l''interfaccia Preparazione Spedizioni.';
+      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
+      Exit;
+    end;
+
+    Sqr := tcsequery.Create(nil);
+    Sqr.DataBaseName := dbexec.DatabaseName;
+
+    qr_ins := TCSEQuery.Create(nil);
+    qr_ins.DataBaseName := DBExec.DatabaseName;
+
+    Sqr.SQL.Text := 'select ' +
+                    ' r.id as idoacrig,' +
+                    ' r.umf, ' +
+                    //' r.umfco, ' +
+                    ' case when isnull(r.umfco,0) = 0 then r.umaco else r.umfco end as umfco, ' +
+                    ' r.idumf, ' +
+                    ' r.idanamag as idvano,' +
+                    '       ls.idartico,' +
+                    '     r.qtares - (select isnull(sum(isnull(ra.qtaord,0)),0)' +
+                    '                   from PDTRIGACQ ra ' +
+                    '          where ra.IDOACRIG = r.id) as qtaResTot ' +
+                    '  from oactes t ' +
+                    '  join oacrig r ' +
+                    '    on r.idoactes = t.id ' +
+                    '  join lotser ls on ls.id = r.idartico ' +
+                    ' where  t.idfor = :idfor ' +
+                    '   and ls.idartico = :idartico ' +
+                    '   and starig = ''O''' +
+                    '   and (r.qtares - (select isnull(sum(isnull(ra.qtaord,0)),0)' +
+                    '                   from PDTRIGACQ ra ' +
+                    '          where ra.IDOACRIG = r.id)) > 0' +
+                    ' order by r.DATCOR';
+
+    Sqr.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+    Sqr.ParamByName('idartico').AsInteger := F2Art.KeyValue;
+    Sqr.Open;
+    if Sqr.IsEmpty then
+    begin
+      if messaggiopdt('ARTICOLO NON IN ORDINE.'+CRLF+'CONTINUARE?',APPTITLE,mb_yesno) = mrNo then
+      begin
+        fluscita := true;
+        puliscicampi;
+      end
+      else
+        florfano := True;
+    end;
+    if fluscita then
+      Exit;
+
+
+    idlotser := VerificaEsistenzaLotto(F2Art.KeyValue,edtNumlot.AsString,edtNumser.AsString,edtDatLot.AsFloat);
+
+
+    if flOrfano then
+    begin
+       PDTRigAcq.Found := false;
+       PDTRigAcq.CampiObj['idlotser'] := idlotser;
+       PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
+       PDTRigAcq.CampiObj['qtaord']   := edtqtaUmf.AsFloat;
+       PDTRigAcq.CampiObj['qtaordm']  := edtqtaUmm.AsFloat;
+       PDTRigAcq.CampiObj['qtaordi']  := edtQtaUMI.AsFloat;
+       PDTRigAcq.CampiObj['idumf']    := getIdUM(UMFOR);
+       PDTRigAcq.CampiObj['idumm']    := getIdUM(UMM);
+       PDTRigAcq.CampiObj['idumi']    := getIdUM(UMI);
+
+       idpdtrigacq := PDTRigAcq.Insert;
+       if idpdtrigacq > 0 then
+       begin
+         qr_ins.Close;
+         qr_ins.SQL.Text := 'update pdtrigacq ' +
+                            '   set ext_idtipidoc = :idtipidoc, '+
+                            '       ext_numdoc = :numdoc, '+
+                            '       ext_datdoc = :datdoc, '+
+                            '       ext_idfor = :idfor ' +
+                            ' where id = :idpdtrigacq';
+
+
+         qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+         qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+         qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
+         qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+         qr_ins.ParamByName('idpdtrigacq').AsInteger := idpdtrigacq;
+         qr_ins.ExecSQL;
+       end;
+
+    end
+    else
+    begin
+
+      qtares := edtqtaUmf.AsFloat;
+      if iBWS_barcode.peso3103 then
+        kg := edtQtaUMm.AsFloat / qtares  // i kg possono stare solo in movimentazione
+      else
+        kg := 0;
+
+      while not Sqr.Eof do
+      begin
+        if qtares = 0 then
+          Break;
+
+        if qtares <= Sqr.FieldByName('qtaResTot').AsFloat then // * sqr.fieldbyname('umfco').asfloat then
+        begin
+          qta := qtares;
+          qtares := 0;
+        end
+        else
+        begin
+          qta := Sqr.FieldByName('qtaResTot').AsFloat; //(Sqr.FieldByName('qtaResTot').AsFloat * sqr.fieldbyname('umfco').asfloat);
+          qtares := qtares-qta;  // qtares-(Sqr.FieldByName('qtaResTot').AsFloat * sqr.fieldbyname('umfco').asfloat);
+        end;
+
+
+        PDTRigAcq.Found := false;
+        PDTRigAcq.CampiObj['idlotser'] := idlotser;
+        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
+        PDTRigAcq.CampiObj['qtaord']   := qta;
+
+        if UMFOR = UMM then
+        begin
+          PDTRigAcq.CampiObj['qtaordm'] := qta
+        end
+        else
+        begin
+          if iBWS_barcode.peso3103 then
+            PDTRigAcq.CampiObj['qtaordm'] := kg * qta
+          else
+            PDTRigAcq.CampiObj['qtaordm'] := qta / UMCO;
+        end;
+
+        if iBWS_barcode.peso3103 then
+          PDTRigAcq.CampiObj['qtaordi'] := qta * UMCO
+        else
+        begin
+          if not Assigned(objArtico) then
+            GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+          ObjArtico.Seek('ID', F2Art.KeyValue);
+          PDTRigAcq.CampiObj['qtaordi'] := PDTRigAcq.CampiObj['qtaordm'] * ObjArtico.ConvUm(oum, ouI);
+        end;
+
+        PDTRigAcq.CampiObj['idoacrig'] := sqr.FieldByName('idoacrig').AsInteger;
+        PDTRigAcq.CampiObj['idlotser'] := idlotser;
+        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
+        //PDTRigAcq.CampiObj['idumf']    := sqr.fieldbyname('idumf').asinteger;
+        PDTRigAcq.CampiObj['idumf']    := getIdUM(UMFOR);
+        PDTRigAcq.CampiObj['idumm']    := getIdUM(UMM);
+        PDTRigAcq.CampiObj['idumi']    := getIdUM(UMI);
+
+        idpdtrigacq := PDTRigAcq.Insert;
+
+        if idpdtrigacq > 0 then
+        begin
+          qr_ins.Close;
+          qr_ins.SQL.Text := 'update pdtrigacq ' +
+                             '   set ext_idtipidoc = :idtipidoc, '+
+                             '       ext_numdoc = :numdoc, '+
+                             '       ext_datdoc = :datdoc, '+
+                             '       ext_idfor = :idfor ' +
+                             ' where id = :idpdtrigacq';
+
+
+          qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+          qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+          qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
+          qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+          qr_ins.ParamByName('idpdtrigacq').AsInteger := idpdtrigacq;
+          qr_ins.ExecSQL;
+        end;
+        Sqr.Next;
+
+      end;
+
+      if qtares > 0 then
+      begin
+
+        PDTRigAcq.Found := false;
+        PDTRigAcq.CampiObj['idlotser'] := idlotser;
+        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
+        PDTRigAcq.CampiObj['qtaord']   := qtares;
+
+        if UMFOR = UMM then
+        begin
+          PDTRigAcq.CampiObj['qtaordm'] := qtares
+        end
+        else
+        begin
+          if iBWS_barcode.peso3103 then
+            PDTRigAcq.CampiObj['qtaordm'] := kg * qtares
+          else
+            PDTRigAcq.CampiObj['qtaordm'] := qtares / UMCO;
+        end;
+
+        if iBWS_barcode.peso3103 then
+          PDTRigAcq.CampiObj['qtaordi'] := qtares * UMCO
+        else
+        begin
+          if not Assigned(objArtico) then
+            GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+          ObjArtico.Seek('ID', F2Art.KeyValue);
+          PDTRigAcq.CampiObj['qtaordi'] := PDTRigAcq.CampiObj['qtaordm'] * ObjArtico.ConvUm(oum, ouI);
+        end;
+
+        PDTRigAcq.CampiObj['idoacrig'] := sqr.FieldByName('idoacrig').AsInteger;
+        PDTRigAcq.CampiObj['idlotser'] := idlotser;
+        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
+        //PDTRigAcq.CampiObj['idumf']    := sqr.fieldbyname('idumf').asinteger;
+        PDTRigAcq.CampiObj['idumf']    := getIdUM(UMFOR);
+        PDTRigAcq.CampiObj['idumm']    := getIdUM(UMM);
+        PDTRigAcq.CampiObj['idumi']    := getIdUM(UMI);
+        idpdtrigacq := PDTRigAcq.Insert;
+
+        if idpdtrigacq > 0 then
+        begin
+          qr_ins.Close;
+          qr_ins.SQL.Text := 'update pdtrigacq ' +
+                             '   set ext_idtipidoc = :idtipidoc, '+
+                             '       ext_numdoc = :numdoc, '+
+                             '       ext_datdoc = :datdoc, '+
+                             '       ext_idfor = :idfor ' +
+                             ' where id = :idpdtrigacq';
+
+
+          qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+          qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+          qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
+          qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+          qr_ins.ParamByName('idpdtrigacq').AsInteger := idpdtrigacq;
+          qr_ins.ExecSQL;
+        end;
+
+        {
+        qr_ins.Close;
+        qr_ins.SQL.Text := 'insert into pdtrigacq (idoacrig,idlotser,idallmag,idbam,qtaord,qtaordm,qtaordi,ext_idtipidoc,ext_numdoc,ext_datdoc,ext_idfor,idumf) ' +
+                           'values (:idoacrig,:idlotser,:idallmag,:idbam,:qtaord,:qtaordm,:qtaordi,:idtipidoc,:numdoc,:datdoc,:idfor,:idumf)';
+
+        qr_ins.ParamByName('idlotser').AsInteger := sqr.FieldByName('idoacrig').AsInteger;
+        qr_ins.ParamByName('idlotser').AsInteger := idlotser;
+        qr_ins.ParamByName('idallmag').AsInteger := F2allMag.KeyValue; //Sqr.FieldByName('idvano').AsInteger;
+
+        qr_ins.ParamByName('qtaord').AsFloat  := qtares; // /sqr.fieldbyname('umfco').asfloat;
+
+        if UMFOR = UMM then
+        begin
+          qr_ins.ParamByName('qtaordm').AsFloat := qtares
+        end
+        else
+        begin
+          if iBWS_barcode.peso3103 then
+            qr_ins.ParamByName('qtaordm').AsFloat := kg * qtares
+          else
+            qr_ins.ParamByName('qtaordm').AsFloat := qtares / UMCO;
+        end;
+
+        if iBWS_barcode.peso3103 then
+          qr_ins.ParamByName('qtaordi').AsFloat := qtares * UMCO
+        else
+        begin
+          if not Assigned(objArtico) then
+            GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+          ObjArtico.Seek('ID', F2Art.KeyValue);
+          qr_ins.ParamByName('qtaordi').AsFloat := qr_ins.ParamByName('qtaordm').AsFloat * ObjArtico.ConvUm(oum, ouI);
+        end;
+
+        qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+        qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+        qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
+        qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+        qr_ins.ParamByName('idumf').AsInteger := sqr.fieldbyname('idumf').asinteger;
+        qr_ins.ExecSQL;
+
+        }
+      end;
+    end;
+
+    Sqr.Close;
+    Sqr.Free;
+
+    qr_ins.Close;
+    qr_ins.Free;
+
+    PulisciCampi;
+  end;
+end;
+
+procedure TFrmCaricaMag.edtFornExit(Sender: TObject);
+begin
+  F2forn.KeyValue := edtForn.AsInteger;
+
+end;
+
+procedure TFrmCaricaMag.edtQtaUMIExit(Sender: TObject);
+var
+  objartico : IArticoStd;
+begin
+  if (lbl_umi.Caption <> 'KG') then
+  begin
+    if not Assigned(objArtico) then
+      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+
+    ObjArtico.Seek('ID', F2Art.KeyValue);
+    if (lbl_umm.Caption <> 'KG') and (lbl_umm.Caption <> '')  then
+    begin
+      edtqtaumm.AsFloat := edtqtaumi.AsFloat *  objartico.ConvUM(oui,oum);
+      if UMFOR = UMM then
+        edtqtaUmf.AsFloat := edtqtaumm.AsFloat
+      else
+        edtqtaUmf.AsFloat := edtqtaumm.AsFloat * UMCO;
+    end
+    else
+    begin
+      if UMCO = 0 then
+        edtqtaUmf.AsFloat := edtqtaumi.AsFloat
+      else
+        edtqtaUmf.AsFloat := edtqtaumi.AsFloat / UMCO;
+    end;
+  end;
+end;
+
+procedure TFrmCaricaMag.edtqtaUmfExit(Sender: TObject);
+var
+  objartico : iarticostd;
+begin
+  if lbl_umf.Caption <> 'KG' then
+  begin
+    if not Assigned(objArtico) then
+      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+    ObjArtico.Seek('ID', F2Art.KeyValue);
+    if lbl_umm.Caption <> 'KG' then
+    begin
+      if UMM <> '' then
+      begin
+        if UMFOR = UMM then
+          edtqtaUmm.AsFloat := edtqtaumf.AsFloat
+        else
+          edtqtaUmm.AsFloat := edtqtaumf.AsFloat / UMCO;
+        edtqtaumi.AsFloat := edtqtaumm.AsFloat *  objartico.ConvUM(oum,oui);
+      end
+      else
+      begin
+        if UMCO > 0 then
+          edtqtaumi.AsFloat := edtqtaumf.AsFloat / UMCO
+        else
+          edtqtaumi.AsFloat := edtqtaumf.AsFloat;
+
+      end;
+    end
+    else
+    begin
+      edtqtaUmi.AsFloat := edtqtaumf.AsFloat * UMCO;
+    end;
+  end;
+end;
+
+procedure TFrmCaricaMag.edtQtaUMmExit(Sender: TObject);
+var
+  objartico : iarticostd;
+begin
+  if (lbl_umm.Caption <> 'KG') and (lbl_umm.Caption <> '') then
+  begin
+    if not Assigned(objArtico) then
+      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+
+    ObjArtico.Seek('ID', F2Art.KeyValue);
+    edtqtaumi.AsFloat := edtqtaumm.AsFloat *  objartico.ConvUM(oum,ouI);
+    if UMFOR = UMM then
+      edtqtaUmf.AsFloat := edtqtaumm.AsFloat
+    else
+      edtqtaUmf.AsFloat := edtqtaumm.AsFloat * UMCO;
+
+  end;
+end;
+
+procedure TFrmCaricaMag.edt_barcodeEnter(Sender: TObject);
+var
+  idart : integer;
+  objartico : IArticoStd;
+
+begin
+
+  if F2forn.KeyValue = 0 then
+  begin
+    MessaggioPDT('Fornitore non inserito!',APPTITLE,MB_ok);
+    f2forn.SetFocus;
+    abort;
+  end;
+
+  if edt_barcode.asstring = '' then
+  begin
+    FL_inizializzazione := true;
+
+    iBWS_barcode := TBWS_barcode128.Create;
+    try
+
+      if iBWS_barcode.LeggiBarcode128_2 <> '' then
+      begin
+        edt_barcode.AsString := iBWS_barcode.itemcode;
+        idart := Ibws_barcode.GetArticoFromEan(Ibws_barcode.itemcode);
+        if idart = 0 then
+          exit;
+        F2Art.KeyValue := idart;
+        F2Art.SetFocus;
+        //F2Art.OnExit(F2Art);
+        if not Assigned(objArtico) then
+          GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+        ObjArtico.Seek('ID', F2Art.KeyValue);
+
+        edtNumlot.AsString := Ibws_barcode.lotto;
+        edtNumser.AsString := StringReplace(iBWS_barcode.scadenza,'/','',[rfreplaceall]);
+        edtDatLot.AsDateTime := StrToDate(iBWS_barcode.scadenza);
+        if not ibws_barcode.VerificaLottoAcquisto(idart,edtDatLot.AsDateTime) then
+        begin
+          F2Art.KeyValue := 0;
+          edtNumlot.AsString := '';
+          edtNumser.AsString := '';
+          edtqtaumi.AsFloat := 0;
+          edtqtaumm.AsFloat := 0;
+          edtqtaumf.AsFloat := 0;
+        end
+        else
+        begin
+          if not Ibws_barcode.peso3103 then
+          begin
+            Ibws_barcode.peso := Ibws_barcode.GetPesoFissoFromEan(Ibws_barcode.itemcode);
+          end;
+
+          edtqtaumm.AsFloat := Ibws_barcode.peso;
+          //edtqtaumm.OnExit(edtqtaumm);
+          edtqtaumm.setfocus;
+          edtqtaumm.SelectAll;
+          edtQtaUMI.AsFloat := edtQtaUMm.AsFloat * ObjArtico.ConvUm(oum, ouI);
+
+          if UMFOR = umm then
+            edtqtaUmf.AsFloat := edtQtaUMm.AsFloat
+          else
+          begin
+            if Ibws_barcode.peso3103 then       // � a peso variabile
+            begin
+              edtqtaUmf.AsFloat := 1;
+              edtQtaUMI.AsFloat := edtqtaUmf.AsFloat * umco;
+            end
+            else
+              edtqtaUmf.AsFloat := edtQtaUMm.AsFloat * UMCO;
+          end;
+
+        end;
+      end;
+    finally
+      if Assigned(iBWS_barcode) then
+        FreeAndNil(iBWS_barcode);
+      //f2Allmag.SetFocus;
+    end;
+    FL_inizializzazione := False;
+  end;
+end;
+
+procedure TFrmCaricaMag.F2ArtExit(Sender: TObject);
+var
+  objartico : iarticostd;
+  qr_list : TCSEQuery;
+  ForServ1: IStFor;
+  LStruFotoRigheAcq1: TStruFotoRigheACQ;
+  QtaOrd, QtaOrdM, QtaOrdI: Double;
+begin
+
+  qr_list := TCSEQuery.Create(nil);
+  qr_list.DataBaseName := DBExec.DatabaseName;
+  qr_list.SQL.Text := 'select ' +
+                      '   um.CODICE as UMFOR,' +
+                      '   UMCO,       '+
+                      '   art.UMI,    '+
+                      '   art.UMM,    '+
+                      '   art.UMREL1, '+
+                      '   art.UMCO1,  '+
+                      '   art.UMCO2,  '+
+                      '   art.UMREL2, '+
+                      '   art.UMREL3  '+
+                      ' from SCOFORACQ sa ' +
+                      ' join LISRIGACQ r '+
+                      '   on r.IDLISTESACQ = sa.IDLISTESACQ ' +
+                      ' join umart um    ' +
+                      '   on um.id = r.IDUMF '+
+                      ' join artico art      '+
+                      '   on art.id = r.IDARTICO    '+
+                      'where r.idartico = :idartico ' +
+                      '  and sa.IDFOR = :idfornitore' +
+                      '  and (datfiva >= :dt or isnull(DATFIVA,0) = 0) ';
+
+  qr_list.ParamByName('idartico').AsInteger := F2Art.KeyValue;
+  qr_list.ParamByName('idfornitore').AsInteger := F2forn.KeyValue;
+  qr_list.ParamByName('dt').AsDateTime := DBExec.Data;
+  qr_list.Open;
+  if qr_list.IsEmpty then
+  begin
+    if not GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico) then
+    begin
+      exit;
+    end;
+    ObjArtico.Seek('ID', F2Art.KeyValue);
+    if objartico.Found then
+    begin
+      ForServ1 := forservice as IStFor;
+      LStruFotoRigheAcq1 := ForServ1.GetUMFORStd(objartico.CampiObj['ID'], 0, 1,
+                                               QtaOrd, QtaOrdM, QtaOrdI);
+      UMFOR :=  LStruFotoRigheAcq1.UMF;
+      UMCO := LStruFotoRigheAcq1.UMFCO;
+      UMM := objartico.CampiObj['UMM'];
+      UMI := objartico.CampiObj['UMI'];
+    end;
+
+  end
+  else
+  begin
+    UMFOR  := qr_list.FieldByName('UMFOR').AsString;
+    UMCO   := qr_list.FieldByName('UMCO').AsFloat;
+    UMI    := qr_list.FieldByName('UMI').AsString;
+    UMM    := qr_list.FieldByName('UMM').AsString;
+  end;
+
+  lbl_umf.Caption := UMFOR;
+  lbl_umm.Caption := UMM;
+  if UMM = '' then
+    edtQtaUMm.Enabled := False
+  else
+    edtQtaUMm.Enabled := True;
+
+  lbl_umi.Caption := UMI;
+
+  qr_list.Close;
+  FreeAndNil(qr_list);
+end;
+
+procedure TFrmCaricaMag.F2fornKeyChange(Sender: TObject; NewKey,
+  OldKey: Integer);
+var
+  qr : TCSEQuery;
+begin
+  if NewKey = 0 then
+  begin
+    lbl_desforn.Caption := '';
+  end
+  else
+  begin
+    //idbollafornitore := OttieniIdBollaFornitore;
+    qr := TCSEQuery.Create(nil);
+    qr.DataBaseName := DBExec.DatabaseName;
+    qr.SQL.Text := 'select p.descr1,p.indiri,p.cap,p.COMUNE ' +
+                   '  from fornitori f ' +
+                   '  join persone p ' +
+                   '    on f.IDPERSONA = p.id ' +
+                   ' where f.id = ' + inttostr(NewKey);
+    qr.Open;
+    lbl_desforn.Caption := qr.FieldByName('descr1').AsString + ' ' +
+                           qr.FieldByName('indiri').AsString + ' ' +
+                           qr.FieldByName('cap').AsString + ' ' +
+                           qr.FieldByName('comune').AsString;
+    qr.Close;
+    qr.Free;
+    edt_barcode.SetFocus;
+  end;
+end;
+
+procedure TFrmCaricaMag.FormClose(Sender: TObject; var Action: TCloseAction);
+begin
+  inherited;
+  try
+    UnloadPackage(Hw_module);
+  finally
+
+  end;
+end;
+
+procedure TFrmCaricaMag.FormCreate(Sender: TObject);
+begin
+  inherited;
+
+  BtnElabora.Parent := PnlTasti;
+  BtnPreparaRiga.Parent := pnltasti;
+  BtnAnnulla.Parent := PnlTasti;
+  BtnPulisci.Parent := PnlTasti;
+
+  BtnElabora.top := 0;
+  BtnPreparaRiga.top := 0;
+  BtnAnnulla.top := 0;
+  BtnPulisci.top := 0;
+
+  f2Tipodoc.DBSam := DBExec.DatabaseName;
+  F2forn.DBSam := dbexec.DatabaseName;
+  F2Art.DBSam := dbexec.DatabaseName;
+  f2Allmag.DBSam := dbexec.DatabaseName;
+
+  QRighepreparate.DataBaseName := DBExec.DatabaseName;
+
+  F2forn.open;
+  F2Art.open;
+
+  //f2Allmag.WhereSql := 'idanamag in (select id from anamag where tipmag = ''A'' and tipgia = ''G'' and GMAGAUT = -1)';
+  f2Allmag.Open;
+
+  f2Tipodoc.WhereSql := 'tipdoc = ''EB''';
+  f2Tipodoc.Open;
+  f2Tipodoc.KeyValue := GetParDef('DOCRMA',DBExec.DatabaseName);
+
+  //StbBarra.Panels[0].Text := FormatDateTime('dd/mm/yyyy',Now());
+  //StbBarra.Panels[1].Text := 'Az. : ' + Azienda.Id + ' - Ut. : ' + Utente.UserName + ' Ver: ' + getversion(DLLFileName);
+
+  Hw_module := LoadPackage(ExtractFilePath(Application.ExeName) + 'M_For.bpl');
+
+  LeggiIni;
+
+  F2allMag.KeyValue := fIni.idvano;
+
+  GridRighepreparate.IniFileName := glo.IniUtente;
+  GridRighepreparate.IniSection := 'FrmCaricaMag_GridRighepreparate_' + Azienda.Id;
+end;
+
+procedure TFrmCaricaMag.FormResize(Sender: TObject);
+begin
+  inherited;
+  PageCtrl.Align := alClient;
+end;
+
+procedure TFrmCaricaMag.FormShow(Sender: TObject);
+begin
+  inherited;
+  Edtnumdoc.SetFocus;
+end;
+
+function TFrmCaricaMag.getIdBolla: integer;
+var
+  lqr : TCSEQuery;
+begin
+
+  Lqr := TCSEQuery.Create(nil);
+  Lqr.DataBaseName := DBExec.DatabaseName;
+  lqr.SQL.Text := 'select id from bamtesacq ' +
+                  ' where idtipidoc = :idtipidoc ' +
+                  '   and anndoc = :anndoc ' +
+                  '   and numdoc = :numdoc ' +
+                  '   and datdoc = :datdoc ' +
+                  '   and idfor = :idfor';
+
+  lqr.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+  lqr.ParamByName('anndoc').AsInteger := YearOf(edtDataDoc.AsDateTime);
+  lqr.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+  lqr.ParamByName('datdoc').AsDateTime := edtDataDoc.AsDateTime;
+  lqr.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+  Lqr.open;
+
+  Result := lqr.FieldByName('id').AsInteger;
+  lqr.Close;
+  FreeAndNil(lqr);
+end;
+
+procedure TFrmCaricaMag.LeggiIni;
+var
+  Lini : tinifile;
+begin
+  Lini := tinifile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)))+'PI_Altag_BWS.ini');
+  fini.idcaumov := Lini.Readinteger('DDT_FORNITORE','IDCAUMOV',0);
+  fini.idvano := Lini.Readinteger('ENTRATA_MERCI','IDVANO',0);
+  Lini.Free;
+end;
+
+function TFrmCaricaMag.OttieniIdBollaFornitore: integer;
+var
+
+  qrytipdoc,
+  qryforn,
+  qryCaumov : TCSEQuery;
+  ObjBamTesacq : IBamTesACQStd;
+  idbam : integer;
+
+  qr : TCSEQuery;
+
+begin
+  Result := 0;
+
+  qr := TCSEQuery.Create(nil);
+  qr.DataBaseName := dbexec.DatabaseName;
+  qr.SQL.Text := 'select id from bamtesacq ' +
+                 ' where idfor = :idfor ' +
+                 '   and idtipidoc = :idtipidoc ' +
+                 '   and numdoc = :numdoc ' +
+                 '   and datdoc = :datdoc ' +
+                 '   and stato = ''P''';
+  qr.ParamByName('idfor').AsInteger := F2forn.KeyValue;
+  qr.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
+  qr.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
+  qr.ParamByName('datdoc').Asdatetime := edtDataDoc.asdatetime;
+  qr.Open;
+  if not qr.IsEmpty then
+  begin
+    result := qr.FieldByName('id').AsInteger;
+    exit;
+  end;
+
+  if not Assigned(ObjBamTesacq) then
+  begin
+    if not GetInterfOggetto('ObjBamTesacq', 'BamTesacq', IBamTesacqStd, ObjBamTesacq) then
+    begin
+      raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
+    end;
+  end;
+
+  qrytipdoc := TCSEQuery.Create(nil);
+  qrytipdoc.DataBaseName := DBExec.DatabaseName;
+
+  qryforn := TCSEQuery.Create(nil);
+  qryforn.DataBaseName := DBExec.DatabaseName;
+
+  qryCaumov := TCSEQuery.Create(nil);
+  qryCaumov.DataBaseName := DBExec.DatabaseName;
+
+  QryForn.SQL.Text := 'SELECT c.Id,' +
+                      'c.Idiva,' +
+                      'c.Idanapag,' +
+                      'c.Idvaluta,' +
+                      'c.Idvettore,' +
+                      'c.Sospiva,' +
+                      'c.Idmtrasp,' +
+                      'c.Idcons,' +
+                      'c.Idbanca,' +
+                      'c.Idnsbanca,' +
+                      'c.Scobas,' +
+                      'c.Spetra,' +
+                      'c.Tipspetra,' +
+                      'c.Idanalin,' +
+                      'p.Descr1,' +
+                      'p.Indiri,' +
+                      'p.Cap,' +
+                      'p.Localita,' +
+                      'p.Prov,' +
+                      'p.Idnazioni,' +
+                      'a.Tippag ' +
+                      'FROM Fornitori c ' +
+                      'INNER JOIN Persone p ON c.Idpersona=p.Id ' +
+                      'LEFT OUTER JOIN Anapag a ON c.Idanapag=a.Id ' +
+                      'WHERE (c.Id = :IdFornitore)';
+
+  qryforn.ParamByName('idfornitore').AsInteger := F2forn.KeyValue;
+  QryForn.Open;
+
+  qrytipdoc.SQL.Text := 'select * from tipidoc where id = ' + IntToStr(f2Tipodoc.KeyValue);
+  qrytipdoc.Open;
+
+  qryCaumov.SQL.Text := 'select * from caumov where id = ' + inttostr(FIni.idcaumov);
+  qryCaumov.Open;
+
+  with ObjBamTesacq do
+  begin
+    Found := false;
+
+    CampiObj['IDTIPIDOC']  := qrytipdoc.FieldByName('id').AsInteger;
+
+    CampiObj['TIPNUM']     := qrytipdoc.FieldByName('tipnum').AsString;
+
+    CampiObj['ANNDOC']     := YearOf(edtDataDoc.AsDateTime);
+
+    CampiObj['NUMDOC']     := Edtnumdoc.AsString;
+
+    CampiObj['DATDOC']     := edtDataDoc.AsDateTime;
+
+    CampiObj['STATO']      := 'P';
+
+    CampiObj['seguefat']   := -1;
+
+    CampiObj['IDFOR']      := F2forn.KeyValue;
+
+    CampiObj['IDFORSPED']  := F2forn.KeyValue;
+
+    CampiObj['IDIVA']      := qryforn.FieldByName('Idiva').AsInteger;
+
+    CampiObj['IDCAUMOV']   := qryCaumov.FieldByName('id').AsInteger;
+
+    CampiObj['IDANAMAG']   := qryCaumov.FieldByName('idmagarr').AsInteger;
+
+    CampiObj['IDANAPAG']   := qryforn.FieldByName('idanapag').AsInteger;
+
+    if ( QryForn.FieldByName('Idvaluta').AsInteger <> 0 ) then
+      CampiObj['IDVALUTA'] := QryForn.FieldByName('Idvaluta').AsInteger
+    else
+      CampiObj['IDVALUTA'] := Azienda.RValutaSI.IdEuro;
+
+    CampiObj['cambio']     := CambioVal(QryForn.FieldByName('Idvaluta').AsInteger, DBExec.Data);
+
+    CampiObj['DESCRFOR1']  := QryForn.FieldByName('Descr1').AsString;
+
+    CampiObj['INDFOR']     := QryForn.FieldByName('Indiri').AsString;
+
+    CampiObj['CAPFOR']     := QryForn.FieldByName('Cap').AsString;
+
+    CampiObj['COMUNEFOR']  := QryForn.FieldByName('Localita').AsString;
+
+    CampiObj['PROVFOR']    := QryForn.FieldByName('Prov').AsString;
+
+    CampiObj['DESCRSPED1'] := QryForn.FieldByName('Descr1').AsString;
+
+    CampiObj['INDSPED']    := QryForn.FieldByName('Indiri').AsString;
+
+    CampiObj['CAPSPED']    := QryForn.FieldByName('Cap').AsString;
+
+    CampiObj['COMUNESPED'] := QryForn.FieldByName('Localita').AsString;
+
+    CampiObj['PROVSPED']   := QryForn.FieldByName('Prov').AsString;
+
+    CampiObj['IDNAZSPED']  := QryForn.FieldByName('idnazioni').AsInteger;
+
+    CampiObj['DATRIC'] := dbexec.Data;
+
+    CampiObj['DATEMI'] := DBExec.Data;
+
+    idbam := Insert;
+    if idbam = 0 then
+    begin
+      MessaggioPDt('Si � verificato un errore durante l''inserimento del ddt fornitore',APPTITLE,MB_ok);
+      exit;
+    end;
+  end;
+
+  result := idbam;
+
+end;
+
+procedure TFrmCaricaMag.PageCtrlChange(Sender: TObject);
+begin
+  if PageCtrl.ActivePageIndex = 1 then
+  begin
+    with QRighepreparate do
+    begin
+      close;
+      sql.Text := 'select  ' +
+                  'A.CODICE AS CODART,    '+
+                  'A.DESCR AS DESCRART,   '+
+                  'SUM(PRA.QTAORD) AS QTAORDSPA,  '+
+                  'um.CODICE as umFor,            '+
+                  'um1.codice as umMov,           '+
+                  'um2.codice as umInv,           '+
+                  'SUM(PRA.QTAORDM) AS QTAORDMSPA,'+
+                  'SUM(PRA.QTAORDI) AS QTAORDISPA,'+
+                  'OAR.TOTQTAORD,                 '+
+                  'pra.ext_idfor,                 '+
+                  'pra.ext_idtipidoc,             '+
+                  'pra.ext_datdoc,                '+
+                  'ext_numdoc                     '+
+                  'from PDTRIGACQ PRA             '+
+                  'LEFT JOIN LOTSER LS ON LS.ID = PRA.IDLOTSER  '+
+                  'LEFT JOIN ARTICO A ON A.ID = LS.IDARTICO     '+
+                  'left join umart um on um.id = pra.IDUMF      '+
+                  'left join umart um1 on um1.id = pra.IDUMM    '+
+                  'left join umart um2 on um2.id = pra.IDUMI    '+
+                  'OUTER APPLY (SELECT SUM(OAR.QTAORD) AS TOTQTAORD  '+
+                  'FROM OACRIG OAR                                   '+
+                  'join oactes oa on oa.id = oar.IDOACTES             '+
+                  'LEFT JOIN LOTSER LS1 ON LS1.ID = OAR.IDARTICO     '+
+                  'LEFT JOIN ARTICO A1 ON A1.ID = LS1.IDARTICO        '+
+                  'WHERE OAR.STARIG = ''O''                             '+
+                  'AND A1.ID = A.ID                                   '+
+                  'and oa.IDFOR = ' + IntToStr(F2forn.KeyValue) +' ) OAR  '+
+                  'where pra.ext_idfor = ' + inttostr(F2forn.KeyValue) +
+                  '  and pra.ext_idtipidoc = ' + IntToStr(f2Tipodoc.KeyValue) +
+                  '  and pra.ext_datdoc = ' + inttostr(Trunc(edtDataDoc.GetValue)) +
+                  '  and ext_numdoc = ''' + Edtnumdoc.AsString +  '''' +
+                  'GROUP BY A.CODICE, A.DESCR,                        '+
+                  ' OAR.TOTQTAORD,um.CODICE,um1.codice,               '+
+                  ' um2.codice,pra.ext_idfor, pra.ext_idtipidoc,      '+
+                  ' pra.ext_datdoc,ext_numdoc                         '+
+                  'ORDER BY A.CODICE, A.DESCR';
+
+
+      Open;
+    end;
+
+    GridRighepreparate.LoadFromIniFile;
+    GridRighepreparate.RefreshData;
+    pnlCartoni.Visible := true;
+  end
+  else
+  begin
+    GridRighepreparate.SaveToIniFile;
+    QRighepreparate.Close;
+    pnlCartoni.Visible := false;
+  end;
+end;
+
+procedure TFrmCaricaMag.puliscicampi(cancella_ddt : Boolean = False);
+begin
+  if cancella_ddt then
+  begin
+    //f2Tipodoc.KeyValue := 0;
+    Edtnumdoc.AsString := '';
+    edtDataDoc.AsDateTime := 0;
+    edtforn.AsInteger := 0;
+    F2forn.KeyValue := 0;
+  end;
+  edt_barcode.asstring := '';
+  F2Art.KeyValue := 0;
+  edtNumlot.asstring := '';
+  edtnumser.AsString := '';
+  edtqtaUmm.enabled := true;
+  edtqtaUmm.AsFloat := 0;
+  edtQtaUMf.AsFloat := 0;
+  edtQtaUMI.AsFloat := 0;
+  edtDatLot.AsString := '';
+  lbl_umm.Caption := '[UMX]';
+  lbl_umf.Caption := '[UMX]';
+  lbl_umi.Caption := '[UMX]';
+  if not cancella_ddt then
+  Begin
+    edt_barcode.SetFocus;
+    //edt_barcodeEnter(edt_barcode);
+  End
+  else
+    f2Tipodoc.SetFocus;
+end;
+
+function TFrmCaricaMag.validacontrolli: Boolean;
+begin
+  result := true;
+  {
+  if f2Allmag.KeyValue = 0 then
+  begin
+    messagedlg('Vano non inserito!',mtInformation,[mbok],0);
+    f2Allmag.SetFocus;
+    exit(false);
+  end;
+  }
+  if F2Art.keyvalue = 0 then
+  begin
+    MessaggioPDt('Aricolo non inserito!',APPTITLE,MB_ok);
+    F2Art.SetFocus;
+    exit(false);
+  end;
+
+  if edtNumlot.AsString = '' then
+  begin
+    MessaggioPDt('Num. lotto non inserito!',APPTITLE,MB_ok);
+    edtNumlot.SetFocus;
+    exit(false);
+  end;
+
+
+  if edtNumser.AsString = '' then
+  begin
+    MessaggioPDt('Num. serie non inserito!',APPTITLE,MB_ok);
+    edtNumser.SetFocus;
+    exit(false);
+  end;
+
+  if F2forn.KeyValue = 0 then
+  begin
+    MessaggioPDt('Fornitore non inserito!',APPTITLE,MB_ok);
+    F2forn.SetFocus;
+    Exit(False);
+  end;
+
+  if Edtnumdoc.AsString = '' then
+  begin
+    MessaggioPDt('Numero documento non inserito!',APPTITLE,MB_ok);
+    Edtnumdoc.SetFocus;
+    Exit(false);
+  end;
+
+  if edtDataDoc.AsDateTime = 0 then
+  begin
+    MessaggioPDt('Data documento non inserita!',APPTITLE,MB_ok);
+    edtDataDoc.SetFocus;
+    Exit(false);
+  end;
+
+  if f2Tipodoc.KeyValue = 0 then
+  begin
+    MessaggioPDt('Tipo documento non impostato!',APPTITLE,MB_ok);
+    f2Tipodoc.SetFocus;
+    Exit(False);
+  end;
+
+  if verificaEsistenzaDDTFornitore(f2Tipodoc.KeyValue,edtnumdoc.asstring,edtDataDoc.AsDateTime,F2forn.KeyValue) then
+  begin
+    MessaggioPDt('Ddt fornitore gi� presente!',APPTITLE,MB_ok);
+    Exit(False);
+  end;
+
+  if edtqtaUmi.AsFloat = 0 then
+  begin
+    Exit(false);
+  end;
+end;
+
+function TFrmCaricaMag.verificaEsistenzaDDTFornitore(idtipidoc: Integer;
+  numdoc: string; datdoc: tdatetime; idfor: Integer): Boolean;
+var
+  qr : TCSEQuery;
+begin
+  result := true;
+  qr := tcsequery.Create(nil);
+  try
+    qr.DataBaseName := dbexec.DatabaseName;
+    qr.SQL.Text := 'select * from bamtesacq ' +
+                   ' where idtipidoc = :idtipidoc ' +
+                   '   and anndoc = :anndoc ' +
+                   '   and numdoc = :numdoc ' +
+                   '   and datdoc = :datdoc ' +
+                   '   and idfor = :idfor';
+
+    qr.ParamByName('idtipidoc').AsInteger := idtipidoc;
+    qr.ParamByName('anndoc').AsInteger := YearOf(datdoc);
+    qr.ParamByName('numdoc').AsString := numdoc;
+    qr.ParamByName('datdoc').AsDateTime := datdoc;
+    qr.ParamByName('idfor').AsInteger := idfor;
+    qr.Open;
+    if qr.IsEmpty then
+      result := false;
+  finally
+    FreeAndNil(qr);
+  end;
+end;
+
+function TFrmCaricaMag.VerificaEsistenzaLotto(idartico: Integer; numlot,
+  numser: string; DataLotto : double): Integer;
+var
+  qrlot : TCSEQuery;
+  ObjLotSer : ilotserstd;
+  lotexists : boolean;
+  id :integer;
+begin
+  result := 0;
+  qrlot := TCSEQuery.Create(nil);
+  qrlot.DataBaseName := dbexec.DatabaseName;
+  qrlot.SQL.Text := 'select id ' +
+                    '  from lotser ' +
+                    ' where idartico = :idartico ' +
+                    '   and numlot = :numlot ' +
+                    '   and numser = :numser';
+
+  qrlot.ParamByName('idartico').AsInteger := idartico;
+  qrlot.ParamByName('numlot').AsString := numlot;
+  qrlot.ParamByName('numser').AsString := numser;
+  qrlot.Open;
+  if qrlot.IsEmpty then
+  begin
+    if not GetInterfOggetto('ObjLotSer', 'Lotser', ILotSerStd, ObjLotSer) then
+        raise Exception.Create('ATTENZIONE: Caricamento del modulo Lotser fallito');
+
+
+    id := ObjLotSer.InsLotto(DBExec,idartico,numlot,numser,FloatToStr(Now()),FloatToStr(Now()),'',False,lotexists);
+    if id = 0 then
+    begin
+      MessaggioPDT('Errore nella creazione del lotto!',apptitle,mb_OK);
+      exit;
+    end
+    else
+      Result := id;
+  end
+  else
+    Result := qrlot.FieldByName('id').AsInteger;
+  qrlot.Close;
+  qrlot.SQL.Text := 'Update lotser set datrif = :datalotto where id = :idlotto';
+  qrlot.ParamByName('datalotto').AsFloat := DataLotto;
+  qrlot.ParamByName('idlotto').AsInteger := result;
+  qrlot.ExecSQL;
+  qrlot.Free;
+end;
+
+
+end.
diff --git a/source/PI_Altag_BWS/UFrmDetailCarico.dfm b/source/PI_Altag_BWS/UFrmDetailCarico.dfm
new file mode 100644
index 0000000..e04a464
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmDetailCarico.dfm
@@ -0,0 +1,258 @@
+object FrmDetailCarico: TFrmDetailCarico
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  Caption = 'Carico a Magazzino'
+  ClientHeight = 320
+  ClientWidth = 240
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poOwnerFormCenter
+  OnClose = FormClose
+  OnCreate = FormCreate
+  OnShow = FormShow
+  PixelsPerInch = 96
+  TextHeight = 13
+  object GrpBx1: TGroupBox
+    Left = 0
+    Top = 294
+    Width = 240
+    Height = 26
+    Align = alBottom
+    TabOrder = 0
+    DesignSize = (
+      240
+      26)
+    object Btneliminariga: TCSBitBtn
+      Left = 92
+      Top = 0
+      Width = 70
+      Height = 25
+      Anchors = [akTop, akRight]
+      Caption = 'Elimina'
+      TabOrder = 0
+      OnClick = BtneliminarigaClick
+      GlyphLibraryIndex = 161
+    end
+    object BtnChiudi: TCSBitBtn
+      Left = 168
+      Top = 0
+      Width = 70
+      Height = 25
+      Anchors = [akTop, akRight]
+      Caption = 'Esci'
+      TabOrder = 1
+      OnClick = BtnChiudiClick
+      GlyphLibraryIndex = 127
+    end
+  end
+  object griddettaglio: TSMDBGrid
+    Left = 0
+    Top = 0
+    Width = 240
+    Height = 294
+    ExOptions = [eoBooleanAsCheckBox, eoCheckBoxSelect, eoKeepSelection, eoStandardPopup]
+    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
+    KeyField = 'ID'
+    WidthOfIndicator = 23
+    ScrollBars = ssHorizontal
+    ColCount = 15
+    RowCount = 2
+    Col = 1
+    Row = 1
+    Align = alClient
+    DataSource = ds_dettaglio
+    TabOrder = 1
+    TitleFont.Charset = DEFAULT_CHARSET
+    TitleFont.Color = clWindowText
+    TitleFont.Height = -11
+    TitleFont.Name = 'Tahoma'
+    TitleFont.Style = []
+    Columns = <
+      item
+        Expanded = False
+        FieldName = 'articolo'
+        Title.Caption = 'Articolo'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'lotto'
+        Title.Caption = 'Lotto'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'serie'
+        Title.Caption = 'Serie'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'data_lotto'
+        Title.Caption = 'Data Lot.'
+        Visible = True
+        DataType = dtData
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'tipoOA'
+        Title.Caption = 'Descr. OA'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'Annoac'
+        Title.Caption = 'Anno OA'
+        Visible = True
+        DataType = dtInt16
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'numoac'
+        Title.Caption = 'Num OA'
+        Visible = True
+        DataType = dtInt16
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'datemi'
+        Title.Caption = 'Data OA'
+        Visible = True
+        DataType = dtData
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'qtafor'
+        Title.Caption = 'Qta Forn'
+        Visible = True
+        DataType = dtNumerico
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'umfor'
+        Title.Caption = 'UM Forn'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'qtamov'
+        Title.Caption = 'Qta Mov'
+        Visible = True
+        DataType = dtNumerico
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'ummov'
+        Title.Caption = 'UM Mov'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'qtainv'
+        Title.Caption = 'Qta Inv.'
+        Visible = True
+        DataType = dtNumerico
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'uminv'
+        Title.Caption = 'UM Inv.'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end>
+  end
+  object qr_dettaglio: TCSEQuery
+    MultipleResults = False
+    CommandText = 
+      'select '#13#10'  pra.id,'#13#10'  art.codice as articolo,'#13#10'  ls.NUMLOT as lo' +
+      'tto,'#13#10'  ls.NUMSER as serie,'#13#10'  ls.Datrif as data_lotto,'#13#10'  td.DE' +
+      'SCR as tipoOa, '#13#10'  oat.ANNOAC,'#13#10'  oat.NUMOAC,'#13#10'  oat.DATEMI,'#13#10'  ' +
+      'pra.QTAORD as Qtafor, '#13#10'  pra.QTAORDI as Qtainv,'#13#10'  pra.QTAORDM ' +
+      'as QtaMov,'#13#10'  um.CODICE as umFor,'#13#10'  um1.CODICE as umMov,'#13#10'  um2' +
+      '.codice as umInv'#13#10'from PDTRIGACQ Pra '#13#10'join lotser ls on ls.id =' +
+      ' pra.IDLOTSER'#13#10'join artico art on art.id = ls.IDARTICO'#13#10'left joi' +
+      'n OACRIG oar on oar.id = pra.IDOACRIG'#13#10'left join OACTES oat on o' +
+      'at.id = oar.IDOACTES'#13#10'left join tipidoc td on td.id = oat.IDTIPI' +
+      'DOC'#13#10'left join umart um on um.id = pra.IDUMF'#13#10'left join umart um' +
+      '1 on um1.id = pra.IDUMM'#13#10'left join umart um2 on um2.id = pra.IDU' +
+      'MI'#13#10'where art.codice = ?'#13#10'and pra.ext_idfor = ?'#13#10'and pra.ext_idt' +
+      'ipidoc =?'#13#10'and pra.ext_datdoc = ?'#13#10'and ext_numdoc = ?'#13#10'order by ' +
+      'oat.ANNOAC,oat.NUMOAC,oat.DATEMI,oar.rigadoc'#13#10#0'doc'#13#10#0'adoc'#13#10#0'igad' +
+      'oc'#13#10#0'oc'#13#10#0'doc'#13#10
+    EnableBCD = True
+    Unidirectional = True
+    SQL.Strings = (
+      'select '
+      '  pra.id,'
+      '  art.codice as articolo,'
+      '  ls.NUMLOT as lotto,'
+      '  ls.NUMSER as serie,'
+      '  ls.Datrif as data_lotto,'
+      '  td.DESCR as tipoOa, '
+      '  oat.ANNOAC,'
+      '  oat.NUMOAC,'
+      '  oat.DATEMI,'
+      '  pra.QTAORD as Qtafor, '
+      '  pra.QTAORDI as Qtainv,'
+      '  pra.QTAORDM as QtaMov,'
+      '  um.CODICE as umFor,'
+      '  um1.CODICE as umMov,'
+      '  um2.codice as umInv'
+      'from PDTRIGACQ Pra '
+      'join lotser ls on ls.id = pra.IDLOTSER'
+      'join artico art on art.id = ls.IDARTICO'
+      'left join OACRIG oar on oar.id = pra.IDOACRIG'
+      'left join OACTES oat on oat.id = oar.IDOACTES'
+      'left join tipidoc td on td.id = oat.IDTIPIDOC'
+      'left join umart um on um.id = pra.IDUMF'
+      'left join umart um1 on um1.id = pra.IDUMM'
+      'left join umart um2 on um2.id = pra.IDUMI'
+      'where art.codice = :codice'
+      'and pra.ext_idfor = :idfor'
+      'and pra.ext_idtipidoc =:idtipidoc'
+      'and pra.ext_datdoc = :datadoc'
+      'and ext_numdoc = :numdoc'
+      'order by oat.ANNOAC,oat.NUMOAC,oat.DATEMI,oar.rigadoc')
+    Left = 88
+    Top = 88
+  end
+  object ds_dettaglio: TDataSource
+    DataSet = qr_dettaglio
+    Left = 152
+    Top = 80
+  end
+end
diff --git a/source/PI_Altag_BWS/UFrmDetailCarico.pas b/source/PI_Altag_BWS/UFrmDetailCarico.pas
new file mode 100644
index 0000000..496643c
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmDetailCarico.pas
@@ -0,0 +1,95 @@
+unit UFrmDetailCarico;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, CSButtons, s3registry, UCoreTipi,
+  OLEDBComponents, CSETables, Vcl.Grids, Vcl.DBGrids, SMDBGrid, updtmsgbox, ucoreinterface,
+  s3db, csctipi, ucoredb, Data.DB;
+
+type
+  TFrmDetailCarico = class(TForm)
+    GrpBx1: TGroupBox;
+    Btneliminariga: TCSBitBtn;
+    BtnChiudi: TCSBitBtn;
+    griddettaglio: TSMDBGrid;
+    qr_dettaglio: TCSEQuery;
+    ds_dettaglio: TDataSource;
+    procedure BtnChiudiClick(Sender: TObject);
+    procedure BtneliminarigaClick(Sender: TObject);
+    procedure FormShow(Sender: TObject);
+    procedure FormClose(Sender: TObject; var Action: TCloseAction);
+    procedure FormCreate(Sender: TObject);
+
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+  end;
+
+var
+  FrmDetailCarico: TFrmDetailCarico;
+
+implementation
+
+{$R *.dfm}
+
+procedure TFrmDetailCarico.BtnChiudiClick(Sender: TObject);
+begin
+  close;
+end;
+
+procedure TFrmDetailCarico.BtneliminarigaClick(Sender: TObject);
+var
+  PDTRigAcq: IObjStd;
+  LMsg: string;
+  I: Integer;
+begin
+  if griddettaglio.SelectedRows.Count > 0 then
+  begin
+    if not GetInterfOggetto('ObjPDTRigAcq', 'PDTRigAcq', IObjStd, PDTRigAcq) then
+    begin
+      LMsg := 'Si � verificato un errore durante l''inizializzazione del Modulo BWS ' +
+              'per l''interfaccia Preparazione Spedizioni.';
+      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
+      Exit;
+    end;
+
+    for I := 0 to griddettaglio.SelectedRows.Count -1 do
+    begin
+      griddettaglio.GotoSelection(i);
+
+      PDTRigAcq.Seek('ID', qr_dettaglio.FieldByName('id').AsInteger);
+      if PDTRigAcq.Found then
+      begin
+        PDTRigAcq.Elimina(qr_dettaglio.FieldByName('id').AsInteger);
+      end;
+    end;
+    griddettaglio.RefreshData;
+  end;
+
+end;
+
+procedure TFrmDetailCarico.FormClose(Sender: TObject; var Action: TCloseAction);
+begin
+  griddettaglio.SaveToIniFile;
+end;
+
+procedure TFrmDetailCarico.FormCreate(Sender: TObject);
+begin
+  qr_dettaglio.DataBaseName := dbexec.DatabaseName;
+  griddettaglio.IniFileName := Glo.IniUtente;
+  griddettaglio.inisection := 'Frmdetailcarico_griddettaglio_'+azienda.id;
+end;
+
+procedure TFrmDetailCarico.FormShow(Sender: TObject);
+begin
+  qr_dettaglio.Open;
+  griddettaglio.LoadFromIniFile;
+  griddettaglio.RefreshData;
+end;
+
+
+
+end.
diff --git a/source/PI_Altag_BWS/UFrmDetailScarico.dfm b/source/PI_Altag_BWS/UFrmDetailScarico.dfm
new file mode 100644
index 0000000..6332665
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmDetailScarico.dfm
@@ -0,0 +1,157 @@
+object FrmDetailScarico: TFrmDetailScarico
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  Caption = 'Preparazione Spedizioni'
+  ClientHeight = 320
+  ClientWidth = 240
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poOwnerFormCenter
+  OnClose = FormClose
+  OnCreate = FormCreate
+  OnShow = FormShow
+  PixelsPerInch = 96
+  TextHeight = 13
+  object GrpBx1: TGroupBox
+    Left = 0
+    Top = 294
+    Width = 240
+    Height = 26
+    Align = alBottom
+    TabOrder = 0
+    object Btneliminariga: TCSBitBtn
+      Left = 92
+      Top = 0
+      Width = 70
+      Height = 25
+      Caption = 'Elimina'
+      TabOrder = 0
+      OnClick = BtneliminarigaClick
+      GlyphLibraryIndex = 161
+    end
+    object BtnChiudi: TCSBitBtn
+      Left = 168
+      Top = 0
+      Width = 70
+      Height = 25
+      Caption = 'Esci'
+      TabOrder = 1
+      OnClick = BtnChiudiClick
+      GlyphLibraryIndex = 127
+    end
+  end
+  object griddettaglio: TSMDBGrid
+    Left = 0
+    Top = 0
+    Width = 240
+    Height = 294
+    ExOptions = [eoBooleanAsCheckBox, eoCheckBoxSelect, eoKeepSelection, eoStandardPopup]
+    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
+    KeyField = 'ID'
+    WidthOfIndicator = 23
+    ScrollBars = ssHorizontal
+    ColCount = 9
+    RowCount = 2
+    Col = 1
+    Row = 1
+    Align = alClient
+    DataSource = ds_dettaglio
+    TabOrder = 1
+    TitleFont.Charset = DEFAULT_CHARSET
+    TitleFont.Color = clWindowText
+    TitleFont.Height = -11
+    TitleFont.Name = 'Tahoma'
+    TitleFont.Style = []
+    OnColumnMoved = griddettaglioColumnMoved
+    Columns = <
+      item
+        Expanded = False
+        FieldName = 'articolo'
+        Title.Caption = 'Articolo'
+        Width = 65
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'lotto'
+        Title.Caption = 'Lotto'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'serie'
+        Title.Caption = 'Serie'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'data_lotto'
+        Title.Caption = 'Scad. Lotto'
+        Visible = True
+        DataType = dtData
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'qta1'
+        Title.Caption = 'Q.ta 1'
+        Visible = True
+        DataType = dtNumerico
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'qta2'
+        Title.Caption = 'Q.ta 2'
+        Visible = True
+        DataType = dtNumerico
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'qta3'
+        Title.Caption = 'Q.ta 3'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'Um3'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end>
+  end
+  object qr_dettaglio: TCSEQuery
+    MultipleResults = False
+    CommandText = #13#10
+    EnableBCD = True
+    Unidirectional = True
+    SQL.Strings = (
+      '')
+    Left = 88
+    Top = 88
+  end
+  object ds_dettaglio: TDataSource
+    DataSet = qr_dettaglio
+    Left = 152
+    Top = 80
+  end
+end
diff --git a/source/PI_Altag_BWS/UFrmDetailScarico.pas b/source/PI_Altag_BWS/UFrmDetailScarico.pas
new file mode 100644
index 0000000..1294002
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmDetailScarico.pas
@@ -0,0 +1,105 @@
+unit UFrmDetailScarico;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, CSButtons, s3registry, UCoreTipi,
+  OLEDBComponents, CSETables, Vcl.Grids, Vcl.DBGrids, SMDBGrid, updtmsgbox, ucoreinterface,
+  Data.DB, s3db, csctipi, ucoredb;
+
+type
+  TFrmDetailScarico = class(TForm)
+    GrpBx1: TGroupBox;
+    Btneliminariga: TCSBitBtn;
+    BtnChiudi: TCSBitBtn;
+    griddettaglio: TSMDBGrid;
+    qr_dettaglio: TCSEQuery;
+    ds_dettaglio: TDataSource;
+    procedure BtnChiudiClick(Sender: TObject);
+    procedure BtneliminarigaClick(Sender: TObject);
+    procedure FormShow(Sender: TObject);
+    procedure FormClose(Sender: TObject; var Action: TCloseAction);
+    procedure griddettaglioColumnMoved(Sender: TObject; FromIndex,
+      ToIndex: Integer);
+    procedure FormCreate(Sender: TObject);
+
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+  end;
+
+var
+  FrmDetailScarico: TFrmDetailScarico;
+
+implementation
+
+
+
+{$R *.dfm}
+
+procedure TFrmDetailScarico.BtnChiudiClick(Sender: TObject);
+begin
+  close;
+end;
+
+procedure TFrmDetailScarico.BtneliminarigaClick(Sender: TObject);
+var
+  PDTRig: IObjStd;
+  LMsg: string;
+  I: Integer;
+begin
+  if griddettaglio.SelectedRows.Count > 0 then
+  begin
+    if not GetInterfOggetto('ObjPDTRig', 'PDTRig', IObjStd, PDTRig) then
+    begin
+      LMsg := 'Si � verificato un errore durante l''inizializzazione del Modulo BWS ' +
+              'per l''interfaccia Preparazione Spedizioni.';
+      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
+      Exit;
+    end;
+
+    for I := 0 to griddettaglio.SelectedRows.Count-1 do
+    begin
+      griddettaglio.GotoSelection(i);
+
+      PDTRig.Seek('ID', qr_dettaglio.FieldByName('id').AsInteger);
+      if PDTRig.Found then
+      begin
+        PDTRig.Elimina(qr_dettaglio.FieldByName('id').AsInteger);
+
+      end;
+    end;
+    griddettaglio.RefreshData;
+  end;
+
+end;
+
+procedure TFrmDetailScarico.FormClose(Sender: TObject; var Action: TCloseAction);
+begin
+  griddettaglio.SaveToIniFile;
+end;
+
+procedure TFrmDetailScarico.FormCreate(Sender: TObject);
+begin
+  qr_dettaglio.DataBaseName := dbexec.DatabaseName;
+end;
+
+procedure TFrmDetailScarico.FormShow(Sender: TObject);
+begin
+  griddettaglio.IniFileName := Glo.IniUtente;
+  griddettaglio.inisection := 'FrmdetailScarico_griddettaglio_'+azienda.id;
+  griddettaglio.LoadFromIniFile;
+  griddettaglio.RefreshData;
+end;
+
+
+
+procedure TFrmDetailScarico.griddettaglioColumnMoved(Sender: TObject; FromIndex,
+  ToIndex: Integer);
+begin
+  griddettaglio.SaveToIniFile;
+end;
+
+end.
diff --git a/source/PI_Altag_BWS/UFrmDettlot.dfm b/source/PI_Altag_BWS/UFrmDettlot.dfm
new file mode 100644
index 0000000..488bf88
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmDettlot.dfm
@@ -0,0 +1,92 @@
+object FrmDettLotti: TFrmDettLotti
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  Caption = 'Dettaglio Lotti...'
+  ClientHeight = 299
+  ClientWidth = 246
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poMainFormCenter
+  OnClose = FormClose
+  OnShow = FormShow
+  PixelsPerInch = 96
+  TextHeight = 13
+  object btnChiudi: TBitBtn
+    Left = 0
+    Top = 270
+    Width = 246
+    Height = 29
+    Align = alBottom
+    Kind = bkCancel
+    NumGlyphs = 2
+    TabOrder = 0
+  end
+  object GridLottiDett: TSMDBGrid
+    Left = 0
+    Top = 0
+    Width = 246
+    Height = 270
+    ExOptions = [eoKeepSelection, eoStandardPopup]
+    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
+    KeyField = 'ID'
+    WidthOfIndicator = 14
+    ScrollBars = ssHorizontal
+    RowCount = 2
+    Col = 1
+    Row = 1
+    Align = alClient
+    DataSource = DsLot
+    TabOrder = 1
+    TitleFont.Charset = DEFAULT_CHARSET
+    TitleFont.Color = clWindowText
+    TitleFont.Height = -11
+    TitleFont.Name = 'Tahoma'
+    TitleFont.Style = []
+    OnColumnMoved = GridLottiDettColumnMoved
+    Columns = <
+      item
+        Expanded = False
+        FieldName = 'numlot'
+        Title.Caption = 'Lotto'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'datrif'
+        Title.Caption = 'Scad. Lotto'
+        Visible = True
+        DataType = dtData
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'descr'
+        Title.Caption = 'Allocazione'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'qtaLotto'
+        Title.Caption = 'Q.ta Inv.'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end>
+  end
+  object DsLot: TDataSource
+    Left = 152
+    Top = 224
+  end
+end
diff --git a/source/PI_Altag_BWS/UFrmDettlot.pas b/source/PI_Altag_BWS/UFrmDettlot.pas
new file mode 100644
index 0000000..aa12cd6
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmDettlot.pas
@@ -0,0 +1,53 @@
+unit UFrmDettlot;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, SMDBGrid,
+  Data.DB, Vcl.StdCtrls, Vcl.Buttons, ucoredb, ucoresecure, ucoretipi;
+
+type
+  TFrmDettLotti = class(TForm)
+    btnChiudi: TBitBtn;
+    DsLot: TDataSource;
+    GridLottiDett: TSMDBGrid;
+    procedure FormShow(Sender: TObject);
+    procedure FormClose(Sender: TObject; var Action: TCloseAction);
+    procedure GridLottiDettColumnMoved(Sender: TObject; FromIndex,
+      ToIndex: Integer);
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+  end;
+
+var
+  FrmDettLotti: TFrmDettLotti;
+
+implementation
+
+{$R *.dfm}
+
+procedure TFrmDettLotti.FormClose(Sender: TObject; var Action: TCloseAction);
+begin
+  GridLottiDett.SaveToIniFile;
+end;
+
+procedure TFrmDettLotti.FormShow(Sender: TObject);
+begin
+  with GridLottiDett do
+  begin
+    IniFileName := GLO.IniUtente;
+    IniSection  := 'FrmDettLotti_NewGridDettGiacLotPS' + azienda.Id;
+    LoadFromIniFile;
+  end;
+end;
+
+procedure TFrmDettLotti.GridLottiDettColumnMoved(Sender: TObject; FromIndex,
+  ToIndex: Integer);
+begin
+  GridLottiDett.SaveToIniFile;
+end;
+
+end.
diff --git a/source/PI_Altag_BWS/UFrmRicMerRia.dfm b/source/PI_Altag_BWS/UFrmRicMerRia.dfm
new file mode 100644
index 0000000..13fd081
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmRicMerRia.dfm
@@ -0,0 +1,53 @@
+inherited FrmFuncStd: TFrmFuncStd
+  Caption = 'FrmFuncStd'
+  OnDestroy = FormDestroy
+  ExplicitWidth = 320
+  ExplicitHeight = 240
+  PixelsPerInch = 96
+  TextHeight = 13
+  object PnlData: TPanel [0]
+    Left = 0
+    Top = 0
+    Width = 234
+    Height = 244
+    Align = alClient
+    BevelOuter = bvNone
+    TabOrder = 0
+    object ScbData: TScrollBox
+      Left = 0
+      Top = 0
+      Width = 234
+      Height = 244
+      Align = alClient
+      AutoScroll = False
+      BorderStyle = bsNone
+      TabOrder = 0
+    end
+  end
+  inherited PnlStdGen: TPanel
+    TabOrder = 2
+    object BvlStdGen: TBevel [0]
+      Left = 0
+      Top = 0
+      Width = 234
+      Height = 2
+      Align = alTop
+      ExplicitTop = 241
+    end
+    inherited PnlStdBtn: TPanel
+      Top = 2
+      Height = 39
+      ExplicitTop = 2
+      ExplicitHeight = 39
+    end
+    inherited PnlStdStatus: TPanel
+      Top = 2
+      Height = 39
+      ExplicitTop = 2
+      ExplicitHeight = 39
+    end
+  end
+  inherited PnlStato: TPanel
+    TabOrder = 1
+  end
+end
diff --git a/source/PI_Altag_BWS/UFrmRicMerRia.pas b/source/PI_Altag_BWS/UFrmRicMerRia.pas
new file mode 100644
index 0000000..ba1aac4
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmRicMerRia.pas
@@ -0,0 +1,308 @@
+unit UFrmRicMerRia;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
+  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
+  Vcl.StdCtrls, Vcl.Buttons, FPDTStd, IPDT, IBase, AdvListEditor, CSTagListEditor,
+  UCoreSecure, CSEdit, UTipiPDT;
+
+type
+  TFrmFuncStd = class(TFrmPDTStd, IFrmPDTStd)
+    PnlData: TPanel;
+    ScbData: TScrollBox;
+    BvlStdGen: TBevel;
+    procedure FormCreate(Sender: TObject);
+    procedure FormResize(Sender: TObject);
+    procedure FormDestroy(Sender: TObject);
+    procedure FormShow(Sender: TObject);
+  private
+    FLstTasti: TList;
+    FRefCount: Integer;
+    FAutoFree: Boolean;
+
+    procedure SetLstTasti(Value: TList);
+
+    function GetLstTasti: TList;
+    function ValidaArtico(out AErr: String; out ACompName: String): Boolean;
+    function _AddRef: Integer; stdcall;
+    function _Release: Integer; stdcall;
+    function ValidaControlli_Gen(out AErr: String; out ACompName: String): Boolean;
+  protected
+    BarCodeUnico: IBarCodeUnicoStd;
+    procedure InitTF2(AObjDB: TAziendaStd = nil);
+    function ValidaControlli: Boolean;
+  public
+    property AutoFree: Boolean read FAutoFree write FAutoFree;
+    property LstTasti: TList read GetLstTasti write SetLstTasti;
+  end;
+
+  TCSEditQta = class(TComponent)
+  private
+    FQta: Double;
+    function GetQta: Double;
+    procedure SetQta(const Value: Double);
+  public
+    property Qta: Double read GetQta write SetQta;
+  end;
+
+  THelperCSEdit = class
+    class function CSEditQta(ACSEdit:TCSEdit): TCSEditQta;
+    class function QtaIsChanged(ACSEdit:TCSEdit): Boolean;
+  end;
+
+implementation
+
+uses
+  UCoreTipi, UPDTMsgBox, S3Registry, MsgPDT, UCoreDB, Compf2, CSTipiCommon, UCoreUtils;
+
+const
+  SetF2_ARTICO = [ArticoD, ArticoC];
+{$R *.dfm}
+
+{ TFrmFuncStd }
+
+procedure TFrmFuncStd.FormCreate(Sender: TObject);
+var
+  Ctrl, I: Integer;
+begin
+  inherited;
+
+  if not Assigned(BarCodeUnico) then
+    if not GetInterfOggetto('ObjBarCodeUnico', 'BarCodeTes', IBarCodeUnicoStd, BarCodeUnico) then begin
+      MessaggioPDT(RS_PDT_GEN_006, APPTITLE, MB_ICONINFORMATION + MB_OK);
+      Exit;
+    end;
+
+  // Dimensionamento massimo delle finestre terminale a quelle del dispositivo
+  if CompareText(ParamWindowState, 'F') = 0 then begin
+    // Lista controlli panello tasti da sinistra a destra
+    FLstTasti := TList.Create;
+    FLstTasti.Clear;
+
+    for Ctrl := 0 to PnlTasti.ControlCount - 1 do begin
+      if PnlTasti.Controls[Ctrl] is TControl then begin
+        if FLstTasti.Count = 0 then
+          I := 0
+        else begin
+          for I := 0 to FLstTasti.Count - 1 do begin
+            if PnlTasti.Controls[Ctrl].Left < TControl(FLstTasti[I]).Left then
+              Break;
+          end;
+        end;
+        FLstTasti.Insert(I, PnlTasti.Controls[Ctrl]);
+      end;
+    end;
+
+    if FLstTasti.Count > 1 then begin
+      for Ctrl := 0 to FLstTasti.Count - 1 do begin
+        if Ctrl < FLstTasti.Count - 1 then
+          TControl(FLstTasti[Ctrl]).Align := alLeft
+        else
+          TControl(FLstTasti[Ctrl]).Align := alClient;
+
+        // Riporto sulla Caption del pulsante il testo del Hint
+        if TControl(FLstTasti[Ctrl]) is TBitBtn then
+          TBitBtn(FLstTasti[Ctrl]).Caption := TBitBtn(FLstTasti[Ctrl]).Hint;
+        if TControl(FLstTasti[Ctrl]) is TSpeedButton then
+          TSpeedButton(FLstTasti[Ctrl]).Caption := TSpeedButton(FLstTasti[Ctrl]).Hint;
+      end;
+    end;
+  end;
+end;
+
+procedure TFrmFuncStd.FormResize(Sender: TObject);
+var
+  I: Integer;
+begin
+  inherited;
+
+  // Dimensionamento massimo delle finestre terminale a quelle del dispositivo
+  if CompareText(ParamWindowState, 'F') = 0 then begin
+    if FLstTasti.Count > 0 then begin
+      for I := 0 to FLstTasti.Count - 2 do
+        TControl(FLstTasti[I]).Width := Trunc(PnlTasti.Width / FLstTasti.Count);
+    end;
+  end;
+end;
+
+procedure TFrmFuncStd.FormShow(Sender: TObject);
+begin
+  inherited;
+  InitTF2;
+end;
+
+procedure TFrmFuncStd.FormDestroy(Sender: TObject);
+begin
+  if Assigned(FLstTasti) then begin
+    FLstTasti.Clear;
+    FreeAndNil(FLstTasti);
+  end;
+
+  inherited;
+end;
+
+function TFrmFuncStd.GetLstTasti: TList;
+begin
+  Result := FLstTasti;
+end;
+
+procedure TFrmFuncStd.InitTF2(AObjDB: TAziendaStd = nil);
+var
+  I: Integer;
+  LWhere: string;
+
+  function GetWhereSql(AF2Table: TSetF2): String;
+  begin
+    Result := '';
+    if AF2Table in SetF2_ARTICO then
+      Result := '(A.GESMOV <> 0)';
+  end;
+begin
+  if not Assigned(AObjDB) then
+    AObjDB := Azienda;
+
+  for I := 0 to Self.ComponentCount - 1 do
+    if Self.Components[I] is TF2 then
+    begin
+      TF2(Self.Components[I]).DBSam := AObjDB.DatabaseName;
+
+      // Recupero l'eventuale Where obbligatoria di base
+      LWhere := GetWhereSql(TF2(Self.Components[I]).F2Table);
+
+      // Se gi� compilata la where si mantiene, ma si integra con quella obbligata
+      if (TF2(Self.Components[I]).WhereSql <> '') then
+      begin
+        if LWhere <> '' then
+          LWhere := LWhere+' AND ';
+
+        LWhere := LWhere + '('+TF2(Self.Components[I]).WhereSql+')';
+      end;
+
+      if LWhere <> '' then
+        TF2(Self.Components[I]).WhereSql := LWhere;
+
+      TF2(Self.Components[I]).Open;
+      if CompareText(Application.Name, 'SAM.EXE') <> 0 then
+        TF2(Self.Components[I]).imgBtnGest.Visible := False; //non fa vedere la freccia azzurra perch� da errore (devo ripeterlo per ogni open)
+
+    end;
+end;
+
+procedure TFrmFuncStd.SetLstTasti(Value: TList);
+begin
+  FLstTasti := Value;
+end;
+
+function TFrmFuncStd.ValidaArtico(out AErr, ACompName: String): Boolean;
+var
+  I: Integer;
+  LF2Artico: TF2;
+begin
+  Result := True;
+  for I := 0 to Self.ComponentCount - 1 do
+    if (Self.Components[I] is TF2) then
+    begin
+      LF2Artico := (Self.Components[I] as TF2);
+      if (LF2Artico.F2Table in SetF2_ARTICO) and (LF2Artico.KeyValue > 0) then
+      begin
+        Result := LF2Artico.qryF2.FieldByName('GESMOV').AsInteger <> 0;
+        if not Result then
+        begin
+          AErr := Format(RS_PDT_GEN_046, [LF2Artico.qryF2.FieldByName('CODICE').AsString]);
+          ACompName := LF2Artico.Name;
+        end;
+      end;
+    end;
+end;
+
+function TFrmFuncStd.ValidaControlli_Gen(out AErr, ACompName: String): Boolean;
+begin
+  Result := ValidaArtico(AErr, ACompName);
+end;
+
+function TFrmFuncStd.ValidaControlli: Boolean;
+var
+  LErr, LCompName: string;
+begin
+
+  Result := ValidaControlli_Gen(LErr, LCompName);
+  if not Result then
+  begin
+    Result := False;
+    MessaggioPDT(LErr, APPTITLE, MB_ICONINFORMATION + MB_OK);
+    if Assigned(Self.FindComponent(LCompName)) and (Self.FindComponent(LCompName) is TWinControl) then
+      if TWinControl(Self.FindComponent(LCompName)).CanFocus then
+        TWinControl(Self.FindComponent(LCompName)).SetFocus;
+    Exit;
+  end;
+
+end;
+
+function TFrmFuncStd._AddRef: Integer;
+begin
+  if AutoFree then begin
+    Inc(FRefCount);
+    Result := FRefCount;
+  end
+  else
+    Result := inherited _AddRef;
+end;
+
+function TFrmFuncStd._Release: Integer;
+begin
+  if AutoFree then begin
+    Dec(FRefCount);
+    Result := FRefCount;
+    if Result = 0 then
+      Destroy;
+  end
+  else
+    Result := inherited _Release;
+end;
+
+{ THelperCSEdit }
+
+class function THelperCSEdit.CSEditQta(ACSEdit:TCSEdit): TCSEditQta;
+var
+  I: Integer;
+begin
+  Result := nil;
+  // Per edit che gestiscono i float
+  if (ACSEdit.DataType = dtNumerico) {and (ACSEdit.DigitsDec > 0)} then
+  begin
+    for I := 0 to ACSEdit.ComponentCount - 1 do
+      if ACSEdit.Components[I] is TCSEditQta then
+        Result := TCSEditQta(ACSEdit.Components[I]);
+
+    if not Assigned(Result) then
+    begin
+      Result := TCSEditQta.Create(ACSEdit);
+      Result.Name := ACSEdit.Name + '_Qta';
+    end;
+  end;
+end;
+
+class function THelperCSEdit.QtaIsChanged(ACSEdit:TCSEdit): Boolean;
+begin
+  try
+    Result := Uguale(THelperCSEdit.CSEditQta(ACSEdit).Qta, ACSEdit.AsFloat, True);
+  except
+    Result := False;
+  end;
+end;
+
+{ TCSEditQta }
+
+function TCSEditQta.GetQta: Double;
+begin
+  Result := FQta;
+end;
+
+procedure TCSEditQta.SetQta(const Value: Double);
+begin
+  FQta := Value;
+end;
+
+end.
diff --git a/source/PI_Altag_BWS/UFrmSelComrig.dfm b/source/PI_Altag_BWS/UFrmSelComrig.dfm
new file mode 100644
index 0000000..b29e9ae
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmSelComrig.dfm
@@ -0,0 +1,72 @@
+object FrmComrig: TFrmComrig
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  Caption = 'Selezione riga commessa'
+  ClientHeight = 309
+  ClientWidth = 234
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poMainFormCenter
+  PixelsPerInch = 96
+  TextHeight = 13
+  object BitBtn1: TBitBtn
+    Left = 0
+    Top = 282
+    Width = 234
+    Height = 27
+    Align = alBottom
+    Kind = bkOK
+    NumGlyphs = 2
+    TabOrder = 0
+  end
+  object SMDBGrid1: TSMDBGrid
+    Left = 0
+    Top = 0
+    Width = 234
+    Height = 282
+    ExOptions = [eoKeepSelection, eoStandardPopup]
+    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
+    KeyField = 'ID'
+    WidthOfIndicator = 14
+    ScrollBars = ssHorizontal
+    ColCount = 3
+    RowCount = 2
+    Col = 1
+    Row = 1
+    Align = alClient
+    DataSource = DS
+    TabOrder = 1
+    TitleFont.Charset = DEFAULT_CHARSET
+    TitleFont.Color = clWindowText
+    TitleFont.Height = -11
+    TitleFont.Name = 'Tahoma'
+    TitleFont.Style = []
+    Columns = <
+      item
+        Expanded = False
+        FieldName = 'codice'
+        Width = 118
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end
+      item
+        Expanded = False
+        FieldName = 'OMASCM'
+        Visible = True
+        DigitsDec = 3
+        DigitsInt = 15
+      end>
+  end
+  object DS: TDataSource
+    Left = 80
+    Top = 120
+  end
+end
diff --git a/source/PI_Altag_BWS/UFrmSelComrig.pas b/source/PI_Altag_BWS/UFrmSelComrig.pas
new file mode 100644
index 0000000..6697e2c
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmSelComrig.pas
@@ -0,0 +1,28 @@
+unit UFrmSelComrig;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
+  SMDBGrid, Vcl.StdCtrls, Vcl.Buttons;
+
+type
+  TFrmComrig = class(TForm)
+    BitBtn1: TBitBtn;
+    SMDBGrid1: TSMDBGrid;
+    DS: TDataSource;
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+  end;
+
+var
+  FrmComrig: TFrmComrig;
+
+implementation
+
+{$R *.dfm}
+
+end.
diff --git a/source/PI_Altag_BWS/UFrmSelLotto.dfm b/source/PI_Altag_BWS/UFrmSelLotto.dfm
new file mode 100644
index 0000000..90364e7
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmSelLotto.dfm
@@ -0,0 +1,94 @@
+object FrmSelLotto: TFrmSelLotto
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  Caption = 'Selezione Lotto....'
+  ClientHeight = 248
+  ClientWidth = 195
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = False
+  Position = poMainFormCenter
+  PixelsPerInch = 96
+  TextHeight = 13
+  object pnlGrid: TPanel
+    Left = 0
+    Top = 0
+    Width = 195
+    Height = 218
+    Align = alClient
+    TabOrder = 0
+    ExplicitLeft = 8
+    ExplicitTop = 8
+    ExplicitWidth = 185
+    ExplicitHeight = 121
+    object SMDBGrid1: TSMDBGrid
+      Left = 1
+      Top = 1
+      Width = 193
+      Height = 216
+      ExOptions = [eoKeepSelection, eoStandardPopup]
+      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
+      KeyField = 'ID'
+      WidthOfIndicator = 14
+      ScrollBars = ssHorizontal
+      ColCount = 2
+      RowCount = 2
+      Col = 1
+      Row = 1
+      Align = alClient
+      DataSource = DataSource1
+      TabOrder = 0
+      TitleFont.Charset = DEFAULT_CHARSET
+      TitleFont.Color = clWindowText
+      TitleFont.Height = -11
+      TitleFont.Name = 'Tahoma'
+      TitleFont.Style = []
+      Columns = <
+        item
+          Expanded = False
+          FieldName = 'numser'
+          Width = 153
+          Visible = True
+          DigitsDec = 3
+          DigitsInt = 15
+        end>
+    end
+  end
+  object pnlBtn: TPanel
+    Left = 0
+    Top = 218
+    Width = 195
+    Height = 30
+    Align = alBottom
+    TabOrder = 1
+    ExplicitTop = 217
+    object btnOk: TBitBtn
+      Left = 4
+      Top = 2
+      Width = 99
+      Height = 25
+      Kind = bkOK
+      NumGlyphs = 2
+      TabOrder = 0
+    end
+    object btnAnnulla: TBitBtn
+      Left = 107
+      Top = 2
+      Width = 82
+      Height = 25
+      Kind = bkCancel
+      NumGlyphs = 2
+      TabOrder = 1
+    end
+  end
+  object DataSource1: TDataSource
+    Left = 40
+    Top = 56
+  end
+end
diff --git a/source/PI_Altag_BWS/UFrmSelLotto.pas b/source/PI_Altag_BWS/UFrmSelLotto.pas
new file mode 100644
index 0000000..6d8c381
--- /dev/null
+++ b/source/PI_Altag_BWS/UFrmSelLotto.pas
@@ -0,0 +1,31 @@
+unit UFrmSelLotto;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
+  Vcl.Grids, Vcl.DBGrids, SMDBGrid, Vcl.ExtCtrls;
+
+type
+  TFrmSelLotto = class(TForm)
+    pnlGrid: TPanel;
+    pnlBtn: TPanel;
+    SMDBGrid1: TSMDBGrid;
+    btnOk: TBitBtn;
+    btnAnnulla: TBitBtn;
+    DataSource1: TDataSource;
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+  end;
+
+var
+  FrmSelLotto: TFrmSelLotto;
+
+implementation
+
+{$R *.dfm}
+
+end.
diff --git a/source/PI_Altag_BWS/UPI_Altag_Spec.pas b/source/PI_Altag_BWS/UPI_Altag_Spec.pas
new file mode 100644
index 0000000..e70bedc
--- /dev/null
+++ b/source/PI_Altag_BWS/UPI_Altag_Spec.pas
@@ -0,0 +1,131 @@
+
+
+unit UPI_Altag_Spec;
+
+interface
+
+uses
+  Vcl.Forms, System.SysUtils, System.Classes, Winapi.Windows, CsStdExt, S3Plugin,
+  IPDT, UCoreTipi;
+
+type
+  TCallProcPlugIn = TCsProcType;
+
+  procedure RunInterfacePlugIn(OpName: UnicodeString; Params: Array of UnicodeString; var ValResult: UnicodeString);
+
+  // Restituisce la classe della Form TFrmMenuPrgSpe
+  function GetFrmMenuPrgSpe: TForm;
+
+  // Carico Magazzino BWS
+  function PlugIn_MenuCaricoMag(Params: Array of UnicodeString): UnicodeString;
+  // Preparazione Spedizioni BWS
+  //function PlugIn_MenuPrepSped(Params: Array of UnicodeString): UnicodeString;
+
+var
+  CallProcPlugIn: TCallProcPlugIn;
+
+implementation
+
+uses
+  S3Registry, UVarie, UFrmCaricaMag;
+
+(* Procedura specifica del Plug-In chiamata dallo standard SAM
+
+   L'indirizzo di RunInterfacePlugIn viene impostato nella variabile CallProcPlugIn
+   nella parte di initialization; se questo driver non viene caricato la
+   variabile non � inizializzata
+
+   - OpName: Nome operazione (identifica il chiamante)
+
+   - Params: Parametri passati dal chiamante come array di stringhe
+     - Params[0] = ...
+     - Params[1] = ...
+     - Params[2] = ...
+     - Params[3] = ...
+     - Params[4] = ...
+
+   - ValResult: Messaggio di ritorno al chiamante
+*)
+procedure RunInterfacePlugIn(OpName: UnicodeString; Params: Array of UnicodeString; var ValResult: UnicodeString);
+begin
+  ValResult := '';
+  if CompareText(OpName, 'PlugIn_CaricaMag') = 0 then
+  begin
+    ValResult := PlugIn_MenuCaricoMag(Params);
+  end;
+  {
+  if CompareText(OpName, 'Plugin_Prepsped') = 0 then
+  begin
+    ValResult := PlugIn_MenuPrepSped(Params);
+  end;
+  }
+end;
+
+function GetFrmMenuPrgSpe: TForm;
+var
+  I: Integer;
+begin
+  Result := nil;
+
+  for I := Screen.FormCount - 1 downto 0 do
+  begin
+    if Screen.Forms[I].ClassNameIs('TFrmMenuPrgSpe') then
+    begin
+      Result := Screen.Forms[I];
+      Break;
+    end;
+  end;
+end;
+
+function PlugIn_MenuCaricoMag(Params: Array of UnicodeString): UnicodeString;
+var
+  Frmcaricamag: TFrmCaricaMag;
+begin
+  Frmcaricamag := TFrmcaricamag.Create(nil);
+  try
+    Frmcaricamag.BorderStyle := bsSingle;
+    Frmcaricamag.Top := StrToInt(Params[0]);
+    Frmcaricamag.Left := StrToInt(Params[1]);
+
+    // Impostazione di PopupParent e PopupMode per evitare che le finestre vengano
+    // visualizzate in secondo piano
+    Frmcaricamag.PopupParent := GetFrmMenuPrgSpe;
+    Frmcaricamag.PopupMode := pmExplicit;
+    Frmcaricamag.ShowModal;
+  finally
+    if Assigned(Frmcaricamag) then
+      FreeAndNil(Frmcaricamag);
+  end;
+end;
+
+{
+function PlugIn_MenuPrepSped(Params: Array of UnicodeString): UnicodeString;
+var
+  FrmNewprepsped: TFrmNewPrepsped;
+begin
+  FrmNewprepsped := TFrmNewPrepsped.Create(nil);
+  try
+    FrmNewprepsped.BorderStyle := bsSingle;
+    FrmNewprepsped.Top := StrToInt(Params[0]);
+    FrmNewprepsped.Left := StrToInt(Params[1]);
+
+    // Impostazione di PopupParent e PopupMode per evitare che le finestre vengano
+    // visualizzate in secondo piano
+    FrmNewprepsped.PopupParent := GetFrmMenuPrgSpe;
+    FrmNewprepsped.PopupMode := pmExplicit;
+    FrmNewprepsped.ShowModal;
+  finally
+    if Assigned(FrmNewprepsped) then
+      FreeAndNil(FrmNewprepsped);
+  end;
+end;
+}
+initialization
+  CallProcPlugIn := RunInterfacePlugIn;
+  RegCsProc('PI_Altag_Spec', CallProcPlugIn);
+
+finalization
+  UnRegCsProc('PI_Altag_Spec');
+  CallProcPlugIn := nil;
+
+end.
\ No newline at end of file
diff --git a/source/PI_Altag_BWS/U_Altag_BWS.pas b/source/PI_Altag_BWS/U_Altag_BWS.pas
new file mode 100644
index 0000000..3329d13
--- /dev/null
+++ b/source/PI_Altag_BWS/U_Altag_BWS.pas
@@ -0,0 +1,488 @@
+unit U_Altag_BWS;
+
+interface
+
+uses
+ S3Plugin, System.Classes, csFilecfg, system.SysUtils, csctipi, Data.SqlTimSt,
+  dialogs, CSButtons, extctrls,StdCtrls,  windows, csetables, ucoredb, ivendite, RSQL,
+  Vcl.Buttons, vcl.forms, vcl.controls, MsgCore, UcoreTipi, UVarie, UVariStd, csedit;
+
+type
+  TBWS_barcode128 = class
+
+private
+  // variabili
+  //procedure DecodificaBarcode(Barcode : string);
+  //function get_gg_shelfLife(idcliente,idartico : Integer):Integer;
+public
+  class var itemcode : string;
+  class var lotto : string;
+  class var scadenza : string;
+  class var peso : double;
+  class var peso3103 : Boolean;
+  class var app_str : string;
+  //class var Idartico : integer;
+
+  //function LeggiBarcode128 : string;
+  function LeggiBarcode128_2 : string;
+  function LeggiBarcodePezzoSingolo : string;
+  function VerificaLotto(idartico,idcliente,idcommessa,idallmag:Integer;numlot,numser : string; DataScad : TDate) : boolean;
+  function VerificaLottoAcquisto(idartico : Integer; dataLotto : tdatetime) : Boolean;
+  function GetArticoFromEan(itemcode : string) : integer;
+  function GetPesoFissoFromEan(itemcode : string) : Double;
+end;
+
+function GetVersion(sFileName: string): string;
+function  DLLFileName : string;
+
+implementation
+
+
+uses
+  ibase, s3registry, updtproc, uBarcode, Updtmsgbox;
+
+function  DLLFileName : string;
+begin
+  SetLength(Result,MAX_PATH);
+  GetModuleFileName(HInstance,PCHar(Result),MAX_PATH);
+  SetLength(Result,StrLen(PChar(Result)));
+end;
+
+function GetVersion(sFileName: string): string;
+var
+  VerInfoSize: DWORD;
+  VerInfo: Pointer;
+  VerValueSize: DWORD;
+  VerValue: PVSFixedFileInfo;
+  Dummy: DWORD;
+begin
+  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
+  GetMem(VerInfo, VerInfoSize);
+  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
+  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
+  with VerValue^ do
+  begin
+    Result := IntToStr(dwFileVersionMS shr 16);
+    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
+    //Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
+    //Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
+  end;
+  FreeMem(VerInfo, VerInfoSize);
+
+end;
+
+
+{ TBWS_barcode128 }
+
+function TBWS_barcode128.GetArticoFromEan(itemcode: string): integer;
+var
+  Lqry : TCSEQuery;
+begin
+
+  if itemcode = '' then
+   exit(0);
+
+  Lqry := TCSEQuery.Create(nil);
+  Lqry.DataBaseName := DBExec.DatabaseName;
+  Lqry.SQL.Text := 'select idartico from barart where ean = ''' + itemcode + '''';
+  Lqry.Open;
+  if Lqry.IsEmpty then
+  begin
+    MessaggioPDT('Ean ' + itemcode + ' non presente nella tabella BARART!'+#13+#10+'('+itemcode+')',APPTITLE,MB_OK);
+    Lqry.Close;
+    Lqry.Free;
+    Exit(0);
+  end
+  else
+    Result := Lqry.FieldByName('idartico').AsInteger;
+  Lqry.Close;
+  Lqry.Free;
+
+
+end;
+
+function TBWS_barcode128.GetPesoFissoFromEan(itemcode: string): Double;
+var
+  Lqry : TCSEQuery;
+begin
+  if itemcode = '' then
+   Exit(0);
+
+  Lqry := TCSEQuery.Create(nil);
+  Lqry.DataBaseName := DBExec.DatabaseName;
+  Lqry.SQL.Text := 'select qta from barart where ean = ''' + itemcode + '''';
+  Lqry.Open;
+  if Lqry.IsEmpty then
+  begin
+    MessaggioPDT('Ean non presente nella tabella BARART!'+#13+#10+'('+itemcode+')',APPTITLE,MB_OK);
+    Lqry.Close;
+    Lqry.Free;
+    Exit(0);
+  end
+  else
+    Result := Lqry.FieldByName('qta').Asfloat;
+  Lqry.Close;
+  Lqry.Free;
+end;
+
+{
+function TBWS_barcode128.get_gg_shelfLife(idcliente,
+  idartico: Integer): Integer;
+var
+  Lqr : TCSEQuery;
+begin
+  Lqr := TCSEQuery.Create(nil);
+  Lqr.DataBaseName := dbexec.DatabaseName;
+  Lqr.SQL.Text := 'select ggduga from artcli where IDCLIENTE = ' +inttostr(idcliente) + ' and idartico = ' + inttostr(idartico);
+  Lqr.Open;
+  result := Lqr.FieldByName('ggduga').AsInteger;
+  Lqr.close;
+  Lqr.Free;
+end;
+}
+
+{
+function TBWS_barcode128.LeggiBarcode128 : string;
+var
+  barcode,
+  barcode2 : string;
+
+begin
+  frmbarcode := tfrmbarcode.Create(nil);
+  frmbarcode.showmodal;
+  barcode := FrmBarcode.edtBarcode.AsString;
+  result := barcode;
+  FrmBarcode.Free;
+  peso3103 := false;
+  if barcode <> '' then
+  begin
+    if Pos('(10)',barcode) = 0 then
+    begin
+      frmbarcode := tfrmbarcode.Create(nil);
+      frmbarcode.showmodal;
+      barcode2 := FrmBarcode.edtBarcode.AsString;
+      FrmBarcode.Free;
+      if barcode2 = '' then
+      begin
+        MessageDlg('Barcode non valido',mtInformation,[mbok],0);
+        abort;
+      end;
+      if Pos('(10)',barcode2) = 0 then
+      begin
+        MessageDlg('Codice a barre non corretto!',mtInformation,[mbok],0);
+        Abort;
+      end;
+      barcode := barcode + barcode2;
+    end;
+    DecodificaBarcode(barcode);
+  end;
+end;
+}
+function TBWS_barcode128.LeggiBarcode128_2 : string;
+var
+  barcode,
+  barcode2,
+  Item01,
+  Item15,
+  Item17,
+  Item3103,
+  Item10 : string;
+begin
+  itemcode := '';
+  lotto := '';
+  scadenza := '';
+  peso := 0;
+  peso3103 := false;
+
+  frmbarcode := tfrmbarcode.Create(nil);
+  frmbarcode.showmodal;
+  barcode := FrmBarcode.edtBarcode.AsString;
+  result := barcode;
+  FrmBarcode.Free;
+  peso3103 := false;
+  if barcode <> '' then
+  begin
+    item01 := Copy(barcode,3,14);
+    app_str := Copy(barcode,17);
+    if Copy(app_str,1,2) = '15' then
+    begin
+      Item15 := Copy(app_str,3,6);
+      Item17 := '';
+    end
+    else
+    begin
+      Item17 := Copy(app_str,3,6);
+      Item15 := '';
+    end;
+    app_str := Copy(app_str,9);
+
+    if app_str = '' then
+    begin
+      frmbarcode := tfrmbarcode.Create(nil);
+      frmbarcode.showmodal;
+      barcode2 := FrmBarcode.edtBarcode.AsString;
+      FrmBarcode.Free;
+      if Copy(barcode2,1,2) = '10' then
+      begin
+        Item10 := Copy(barcode2,3,20);
+      end
+      else
+      begin
+        Item3103 := Copy(barcode2,5,6);
+        peso3103 := True;
+        app_str := copy(barcode2,11);
+        if Copy(app_str,1,2) = '10' then
+        begin
+          Item10 := Copy(app_str,3);
+        end
+        else
+        begin
+          MessaggioPDT('Barcode non valido',apptitle,MB_OK);
+          abort;
+        end;
+      end;
+    end
+    else
+    begin
+      if Copy(app_str,1,2) = '10' then
+      begin
+        Item10 := Copy(app_str,3,20);
+        app_str := Copy(app_str,23);
+        if app_str = '' then
+          Item3103 := ''
+        else
+        begin
+          Item3103 := Copy(app_str,5);
+          peso3103 := true;
+        end;
+      end
+      else
+      begin
+        // per forza 3103
+        Item3103 := Copy(app_str,5,6);
+        peso3103 := true;
+        app_str := Copy(app_str,11);
+        if app_str = '' then
+        begin
+          messaggiopdt('Barcode non valido',apptitle,mb_ok);
+          abort;
+        end
+        else
+        begin
+          if Copy(app_str,1,2) = '10' then
+            Item10 := Copy(app_str,3);
+        end;
+      end;
+     end;
+
+    if peso3103 then
+      peso := StrToFloat(Item3103) / 1000;
+
+    lotto := Item10;
+    itemcode := Item01;
+    if Item15 <> '' then
+      scadenza := item15;
+    if Item17 <> '' then
+      scadenza := Item17;
+
+    scadenza := Copy(scadenza,5,2)+'/'+Copy(scadenza,3,2)+'/20'+copy(scadenza,1,2);
+
+   end;
+end;
+
+function TBWS_barcode128.LeggiBarcodePezzoSingolo: string;
+begin
+  frmbarcode := tfrmbarcode.Create(nil);
+  frmbarcode.caption := 'Lettura Barcode EAN 13';
+  frmbarcode.showmodal;
+  result := FrmBarcode.edtBarcode.AsString;
+  FrmBarcode.Free;
+end;
+
+function TBWS_barcode128.VerificaLotto(idartico,Idcliente,idcommessa,idallmag : Integer; numlot,
+  numser: string;DataScad : tdate) : boolean;
+var
+  Lqr : TCSEQuery;
+  Data_Lotto,
+  Data_consegnaConfermata,
+  data_ultimo_lotto : double;
+  //Shelf_life : integer;
+begin
+  Result := True;
+  Lqr := TCSEQuery.Create(nil);
+  Lqr.DataBaseName := DBExec.DatabaseName;
+//LS 23/03/2020 Utilizzo i metodi STD di formattazione testo per Qry.
+//  Lqr.SQL.Text := 'Select isnull(datrif,0) as datrif from lotser where idartico = ' + inttostr(idartico) + ' and numlot = ''' + numlot + ''' and numser = ''' + numser + '''';
+  Lqr.SQL.Text := 'Select isnull(datrif,0) as datrif from lotser where idartico = ' + CS_KeyValueTo_SqlStr(idartico) +
+                 ' and numlot = ' + CS_VariantTo_SqlStr(numlot) + ' and numser = ' + CS_VariantTo_SqlStr(numser);
+//....LS 23/03/2020 
+  Lqr.Open;
+  Data_Lotto := Lqr.FieldByName('datrif').AsFloat;
+  Lqr.Close;
+  {
+  if (data_lotto) <> (datascad) then
+  begin
+    MessaggioPDT('A T T E N Z I O N E : '+CRLF+'La data scadenza del lotto � diversa da quella presente nel barcode',APPTITLE,MB_OK);
+  end;
+  }
+  Lqr.SQL.Text := 'select top 1 datrif ' +
+                  '  from Ext_V_LottiCliente ' +
+                  ' where idclidest = ' + inttostr(idcliente) +
+                  '   and idartico = ' + inttostr(idartico) +
+                  ' order by datDoc desc';
+  Lqr.Open;
+  if not lqr.IsEmpty then
+  begin
+    data_ultimo_lotto := Lqr.FieldByName('datrif').asfloat;
+
+    if Lqr.FieldByName('datrif').asfloat > Data_Lotto then
+    begin
+      if MessaggioPDT('Il lotto ' + numlot + CrLf + ' � pi� vecchio dell''ultimo lotto ' + crlf + 'consegnato al cliente.'+crlf+'Vuoi proseguire?',apptitle,MB_YESNO) =  mrno then
+      begin
+        Result := false;
+        exit;
+      end;
+    end;
+  end
+  else
+    data_ultimo_lotto := 0;
+
+  Lqr.Close;
+
+  //Shelf_life := get_gg_shelfLife(idcliente,idartico);
+
+  Lqr.SQL.Text := 'select datalimite as data ' +
+                  '  from v_bws_DataLimite_commessa ' +
+                  ' where idcomtes = ' + IntToStr(idcommessa) +
+                  '   and idartico = ' + IntToStr(idartico);
+  Lqr.Open;
+  Data_consegnaConfermata := Lqr.FieldByName('data').AsFloat;
+  //Data_consegnaconfermata := Data_consegnaConfermata + Shelf_life;
+  Lqr.Close;
+  if Data_Lotto < (Data_consegnaConfermata) then
+  begin
+    if messaggiopdt('Il lotto ' + numlot + crlf + 'ha scadenza antecedente alla data consegna + gg garanzia.'+crlf+
+                    'Data scadenza : ' + DateTimeToStr(data_lotto) + CrLf +
+                    'Data minima : ' + DateTimeToStr(Data_consegnaConfermata) + CrLf +
+                    'Giorni : ' + inttostr(Trunc(Data_consegnaConfermata-Data_Lotto)) + CrLf +
+                    'Vuoi proseguire?',apptitle,MB_YESNO) = mrno then
+    begin
+      Result := false;
+      exit;
+    end;
+  end;
+  Lqr.Close;
+
+  Lqr.SQL.Text := 'select top 1 numlot ' +
+                  '  from v_bws_giacenza_articolo ' +
+                  ' where idartico = :idartico' +
+                  '   and idallmag = :idallmag ' +
+                  '   and datrif < :data_lotto ' +
+                  '   and datrif > :dataconsegnaconfermata ' +
+                  '   and datrif > :dataultimolotto ' +
+                  ' order by datrif';
+
+  Lqr.ParamByName('idartico').AsInteger := idartico;
+  Lqr.ParamByName('idallmag').AsInteger := idallmag;
+  Lqr.ParamByName('data_lotto').AsFloat := Data_Lotto;
+  Lqr.ParamByName('dataconsegnaconfermata').AsFloat := Data_consegnaConfermata;
+  Lqr.ParamByName('dataultimolotto').Asfloat := data_ultimo_lotto;
+  Lqr.Open;
+  if not Lqr.IsEmpty then
+  begin
+    if messaggiopdt('Esiste un lotto con data scadenza inferiore a quello selezionato.' + crlf +
+                    Lqr.FieldByName('numlot').AsString + crlf +
+                    'Vuoi proseguire?',apptitle,MB_YESNO) = mrno then
+    begin
+      Result := false;
+      exit;
+    end;
+  end;
+  Lqr.Close;
+  Lqr.Free;
+end;
+
+function TBWS_barcode128.VerificaLottoAcquisto(idartico: Integer; dataLotto: TDateTime): Boolean;
+var
+  qr : tcsequery;
+  SHELF_LIFE_ACQ : integer;
+  data_limite : tdatetime;
+begin
+  Result := true;
+  qr := TCSEQuery.Create(nil);
+  qr.DataBaseName := DBExec.DatabaseName;
+  qr.SQL.Text := 'select SHELF_LIFE_ACQ from sam.articogst where idartico = ' + IntToStr(idartico);
+  qr.Open;
+  SHELF_LIFE_ACQ := qr.FieldByName('SHELF_LIFE_ACQ').AsInteger;
+  qr.Close;
+  qr.Free;
+  data_limite := Trunc(Now + SHELF_LIFE_ACQ);
+  if dataLotto <= data_limite then
+  begin
+    if messaggiopdt('A T T E N Z I O N E'+crlf+
+                    'Data Scad. Lotto : ' + DateTimeToStr(datalotto) + crlf +
+                    'Data Shelf life : ' + DateTimeToStr(data_limite) + CrLf +
+                    'Giorni : ' + floattostr(trunc(data_limite-datalotto)) + CrLf +
+                    'Vuoi proseguire?',apptitle,MB_YESNO) = mrno then
+    begin
+      Result := false;
+      exit;
+    end;
+  end;
+
+end;
+
+{
+procedure TBWS_barcode128.DecodificaBarcode(Barcode: string);
+var
+  tag : string;
+begin
+  app_str := Copy(Barcode,5);        // elimino direttamente lo (01) tanto il primo � sempre l'item code
+  itemcode := Copy(app_str,1,Pos('(',app_str)-1);
+  app_str := Copy(app_str,pos('(',app_str));
+  while Pos('(',app_str) > 0 do
+  begin
+    tag := Copy(app_str,2,2);
+    if tag = '10' then
+    begin
+       app_str := Copy(app_str,5);
+       if Pos('(',app_str) = 0 then
+         lotto := app_str
+       else
+         lotto := Copy(app_str,1,Pos('(',app_str)-1);
+       app_str := Copy(app_str,Pos('(',app_str));
+    end;
+    if tag = '15' then  // scadenza lunga
+    begin
+      app_str := Copy(app_str,5);
+      if Pos('(',app_str) = 0 then
+        scadenza := app_str
+      else
+        scadenza := Copy(app_str,1,Pos('(',app_str)-1);
+      app_str := Copy(app_str,Pos('(',app_str));
+    end;
+    if tag = '17' then // scadenza breve
+    begin
+      app_str := Copy(app_str,5);
+      if Pos('(',app_str) = 0 then
+        scadenza := app_str
+      else
+        scadenza := Copy(app_str,1,Pos('(',app_str)-1);
+      app_str := Copy(app_str,Pos('(',app_str));
+    end;
+    if tag = '31' then   // peso variabile  3103
+    begin
+      peso3103 := true;
+      app_str := Copy(app_str,7);
+      if Pos('(',app_str) = 0 then
+        peso := StrToFloat(app_str) /1000
+      else
+        peso := StrToFloat(Copy(app_str,1,Pos('(',app_str)-1)) / 1000;
+      app_str := Copy(app_str,Pos('(',app_str));
+    end;
+
+  end;
+end;
+}
+
+end.
diff --git a/source/PI_Altag_BWS/U_Fra_Bam.dfm b/source/PI_Altag_BWS/U_Fra_Bam.dfm
new file mode 100644
index 0000000..3799b6d
--- /dev/null
+++ b/source/PI_Altag_BWS/U_Fra_Bam.dfm
@@ -0,0 +1,370 @@
+object FrmBam: TFrmBam
+  Left = 0
+  Top = 0
+  BorderIcons = []
+  BorderStyle = bsSingle
+  ClientHeight = 291
+  ClientWidth = 234
+  Color = clBtnFace
+  Font.Charset = DEFAULT_CHARSET
+  Font.Color = clWindowText
+  Font.Height = -11
+  Font.Name = 'Tahoma'
+  Font.Style = []
+  OldCreateOrder = True
+  Position = poMainFormCenter
+  OnShow = FormShow
+  DesignSize = (
+    234
+    291)
+  PixelsPerInch = 96
+  TextHeight = 13
+  object Label1: TLabel
+    Left = 17
+    Top = 54
+    Width = 54
+    Height = 13
+    Caption = 'Documento'
+  end
+  object Label2: TLabel
+    Left = 17
+    Top = 91
+    Width = 36
+    Height = 13
+    Caption = 'Vettore'
+  end
+  object Label3: TLabel
+    Left = 17
+    Top = 130
+    Width = 58
+    Height = 13
+    Caption = 'Peso imballo'
+  end
+  object Label4: TLabel
+    Left = 118
+    Top = 130
+    Width = 107
+    Height = 13
+    Caption = 'Aspetto esteriore beni'
+  end
+  object Label5: TLabel
+    Left = 17
+    Top = 171
+    Width = 46
+    Height = 13
+    Caption = 'Colli Part.'
+  end
+  object Label6: TLabel
+    Left = 87
+    Top = 171
+    Width = 34
+    Height = 13
+    Caption = 'N'#176' Colli'
+  end
+  object Label7: TLabel
+    Left = 159
+    Top = 171
+    Width = 31
+    Height = 13
+    Caption = 'Pallets'
+  end
+  object Label8: TLabel
+    Left = 17
+    Top = 212
+    Width = 73
+    Height = 13
+    Caption = 'Tot. peso lordo'
+  end
+  object Label9: TLabel
+    Left = 124
+    Top = 212
+    Width = 75
+    Height = 13
+    Caption = 'Tot. peso netto'
+  end
+  object F2Tipidoc: TF2
+    Left = 12
+    Top = 69
+    Width = 213
+    Height = 21
+    BevelOuter = bvNone
+    BorderStyle = bsSingle
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 1
+    NumCol = 0
+    BtnEnabled = True
+    ListFieldIndex = 0
+    KeyValue = 0
+    MultiSelez = False
+    ReadBarcode = False
+    F2Table = TipiDoc
+    EmptyOk = True
+    OpenThread = False
+    GridWidth = 213
+    GridHeight = 160
+    DropDownAlign = daLeft
+    DropDownWidth = 213
+    ReadOnly = True
+    DropDownRows = 0
+  end
+  object RadioGroup1: TRadioGroup
+    Left = 0
+    Top = 0
+    Width = 234
+    Height = 50
+    Align = alTop
+    Caption = ' Tipi Documento '
+    ItemIndex = 0
+    Items.Strings = (
+      'Ddt')
+    TabOrder = 0
+  end
+  object F2Vettore: TF2
+    Left = 12
+    Top = 106
+    Width = 213
+    Height = 21
+    BevelOuter = bvNone
+    BorderStyle = bsSingle
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 2
+    NumCol = 0
+    BtnEnabled = True
+    ListFieldIndex = 0
+    KeyValue = 0
+    MultiSelez = False
+    ReadBarcode = False
+    F2Table = VettoriD
+    EmptyOk = True
+    OpenThread = False
+    GridWidth = 213
+    GridHeight = 160
+    DropDownAlign = daLeft
+    DropDownWidth = 213
+    ReadOnly = True
+    DropDownRows = 0
+  end
+  object F2Aspbeni: TF2
+    Left = 117
+    Top = 144
+    Width = 109
+    Height = 21
+    BevelOuter = bvNone
+    BorderStyle = bsSingle
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 4
+    NumCol = 0
+    BtnEnabled = True
+    ListFieldIndex = 0
+    KeyValue = 0
+    MultiSelez = False
+    ReadBarcode = False
+    F2Table = AspBeni
+    EmptyOk = True
+    OpenThread = False
+    GridWidth = 207
+    GridHeight = 160
+    DropDownAlign = daLeft
+    DropDownWidth = 207
+    ReadOnly = True
+    DropDownRows = 0
+  end
+  object edt_pesoimballo: TCSEdit
+    Left = 12
+    Top = 145
+    Width = 98
+    Height = 21
+    DataType = dtNumerico
+    TabOrder = 3
+    Alignment = taRightJustify
+    AllowNegative = True
+    AutoMode = amDisable
+    BlankWhenZero = True
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 3
+    DigitsInt = 15
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = True
+    ControlloData = True
+  end
+  object edt_collipart: TCSEdit
+    Left = 12
+    Top = 186
+    Width = 67
+    Height = 21
+    DataType = dtInt16
+    TabOrder = 5
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object edt_colli: TCSEdit
+    Left = 85
+    Top = 186
+    Width = 67
+    Height = 21
+    DataType = dtInt32
+    TabOrder = 6
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object edt_pallets: TCSEdit
+    Left = 158
+    Top = 186
+    Width = 67
+    Height = 21
+    DataType = dtInt16
+    TabOrder = 7
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object edt_pesolordo: TCSEdit
+    Left = 12
+    Top = 227
+    Width = 104
+    Height = 21
+    DataType = dtNumerico
+    TabOrder = 8
+    Alignment = taRightJustify
+    AllowNegative = True
+    AutoMode = amDisable
+    BlankWhenZero = True
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 3
+    DigitsInt = 15
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = True
+    ControlloData = True
+  end
+  object edt_pesonetto: TCSEdit
+    Left = 121
+    Top = 227
+    Width = 104
+    Height = 21
+    DataType = dtNumerico
+    TabOrder = 9
+    Alignment = taRightJustify
+    AllowNegative = True
+    AutoMode = amDisable
+    BlankWhenZero = True
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 3
+    DigitsInt = 15
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = True
+    ControlloData = True
+  end
+  object btnOK: TBitBtn
+    Left = 12
+    Top = 264
+    Width = 104
+    Height = 25
+    Anchors = [akLeft]
+    Caption = '&Yes'
+    Default = True
+    Glyph.Data = {
+      DE010000424DDE01000000000000760000002800000024000000120000000100
+      0400000000006801000000000000000000001000000000000000000000000000
+      80000080000000808000800000008000800080800000C0C0C000808080000000
+      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
+      3333333333333333333333330000333333333333333333333333F33333333333
+      00003333344333333333333333388F3333333333000033334224333333333333
+      338338F3333333330000333422224333333333333833338F3333333300003342
+      222224333333333383333338F3333333000034222A22224333333338F338F333
+      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
+      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
+      0000333333333A222433333333333338F338F33300003333333333A222433333
+      333333338F338F33000033333333333A222433333333333338F338F300003333
+      33333333A222433333333333338F338F00003333333333333A22433333333333
+      3338F38F000033333333333333A223333333333333338F830000333333333333
+      333A333333333333333338330000333333333333333333333333333333333333
+      0000}
+    NumGlyphs = 2
+    TabOrder = 10
+    OnClick = btnOKClick
+  end
+  object BtnCancel: TBitBtn
+    Left = 121
+    Top = 264
+    Width = 104
+    Height = 25
+    Anchors = [akLeft]
+    Caption = 'Abort'
+    Glyph.Data = {
+      DE010000424DDE01000000000000760000002800000024000000120000000100
+      0400000000006801000000000000000000001000000000000000000000000000
+      80000080000000808000800000008000800080800000C0C0C000808080000000
+      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
+      333333333333333333333333000033338833333333333333333F333333333333
+      0000333911833333983333333388F333333F3333000033391118333911833333
+      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
+      911118111118333338F3338F833338F3000033333911111111833333338F3338
+      3333F8330000333333911111183333333338F333333F83330000333333311111
+      8333333333338F3333383333000033333339111183333333333338F333833333
+      00003333339111118333333333333833338F3333000033333911181118333333
+      33338333338F333300003333911183911183333333383338F338F33300003333
+      9118333911183333338F33838F338F33000033333913333391113333338FF833
+      38F338F300003333333333333919333333388333338FFF830000333333333333
+      3333333333333333333888330000333333333333333333333333333333333333
+      0000}
+    NumGlyphs = 2
+    TabOrder = 11
+    OnClick = BtnCancelClick
+  end
+end
diff --git a/source/PI_Altag_BWS/U_Fra_Bam.pas b/source/PI_Altag_BWS/U_Fra_Bam.pas
new file mode 100644
index 0000000..eb4457f
--- /dev/null
+++ b/source/PI_Altag_BWS/U_Fra_Bam.pas
@@ -0,0 +1,98 @@
+unit U_Fra_Bam;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
+  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
+  Vcl.ExtCtrls, Compf2, Vcl.Buttons, CSEdit, u_vari_preparazioneDDT;
+
+type
+  TFrmBam = class(TForm)
+    F2Tipidoc: TF2;
+    Label1: TLabel;
+    RadioGroup1: TRadioGroup;
+    F2Vettore: TF2;
+    F2Aspbeni: TF2;
+    edt_pesoimballo: TCSEdit;
+    edt_collipart: TCSEdit;
+    edt_colli: TCSEdit;
+    edt_pallets: TCSEdit;
+    Label2: TLabel;
+    edt_pesolordo: TCSEdit;
+    edt_pesonetto: TCSEdit;
+    btnOK: TBitBtn;
+    BtnCancel: TBitBtn;
+    Label3: TLabel;
+    Label4: TLabel;
+    Label5: TLabel;
+    Label6: TLabel;
+    Label7: TLabel;
+    Label8: TLabel;
+    Label9: TLabel;
+    procedure btnOKClick(Sender: TObject);
+    procedure BtnCancelClick(Sender: TObject);
+    procedure FormShow(Sender: TObject);
+  private
+    { Private declarations }
+  public
+    { Public declarations }
+    iprepsped : TPrepSped;
+  end;
+
+implementation
+
+uses ivendite, s3registry;
+
+{$R *.dfm}
+
+procedure TFrmBam.BtnCancelClick(Sender: TObject);
+begin
+  iprepsped.FresultDDT := 0;
+  close;
+end;
+
+procedure TFrmBam.btnOKClick(Sender: TObject);
+var
+  ObjBamTes: IBamTesStd;
+begin
+  if f2tipidoc.KeyValue = 0 then
+  begin
+    messagedlg('Tipo documento non inserito!',mtinformation,[mbok],0);
+    f2tipidoc.SetFocus;
+  end
+  else
+  begin
+    iprepsped.FresultDDT := iprepsped.generatestataDDT(F2Tipidoc.KeyValue);
+
+    if not Assigned(ObjBamTes) then
+    begin
+      if not GetInterfOggetto('ObjBamTes', 'BamTes', IBamTesStd, ObjBamTes) then
+      begin
+        exit;
+      end;
+    end;
+    objbamtes.Seek('id',iprepsped.FresultDDT);
+    if objbamtes.Found then
+    begin
+      objbamtes.CampiObj['idvettore'] := F2Vettore.KeyValue;
+      objbamtes.CampiObj['pesoimb']   := edt_pesoimballo.asfloat;
+      objbamtes.CampiObj['aspbeni']   := F2Aspbeni.qryF2.FieldByName('descr').AsString;
+      objbamtes.CampiObj['collipart'] := edt_collipart.AsInteger;
+      objbamtes.CampiObj['colli']     := edt_colli.AsInteger;
+      objbamtes.CampiObj['pallets']   := edt_colli.AsInteger;
+      objbamtes.CampiObj['lordo']     := edt_pesolordo.AsFloat;
+      objbamtes.CampiObj['netto']     := edt_pesonetto.AsFloat;
+      objbamtes.Modifica;
+    end;
+
+    close;
+  end;
+  end;
+
+procedure TFrmBam.FormShow(Sender: TObject);
+begin
+  F2Tipidoc.SetFocus;
+end;
+
+end.
diff --git a/source/PI_Altag_BWS/U_Fra_Clav.dfm b/source/PI_Altag_BWS/U_Fra_Clav.dfm
new file mode 100644
index 0000000..ff0dc33
--- /dev/null
+++ b/source/PI_Altag_BWS/U_Fra_Clav.dfm
@@ -0,0 +1,393 @@
+object FrameClav: TFrameClav
+  Left = 0
+  Top = 0
+  Width = 210
+  Height = 263
+  TabOrder = 0
+  DesignSize = (
+    210
+    263)
+  object Label1: TLabel
+    Left = 3
+    Top = 77
+    Width = 27
+    Height = 13
+    Caption = 'DDT :'
+  end
+  object Label2: TLabel
+    Left = 2
+    Top = 10
+    Width = 23
+    Height = 13
+    Caption = 'For :'
+  end
+  object Label3: TLabel
+    Left = 3
+    Top = 100
+    Width = 27
+    Height = 13
+    Caption = 'BCU :'
+  end
+  object Label4: TLabel
+    Left = 3
+    Top = 222
+    Width = 31
+    Height = 13
+    Caption = 'Vano :'
+  end
+  object Label5: TLabel
+    Left = 3
+    Top = 125
+    Width = 22
+    Height = 13
+    Caption = 'Art :'
+  end
+  object Label6: TLabel
+    Left = 16
+    Top = 174
+    Width = 48
+    Height = 13
+    Caption = 'Sacatole :'
+  end
+  object Label7: TLabel
+    Left = 77
+    Top = 174
+    Width = 54
+    Height = 13
+    Caption = 'Q.ta x sca.'
+  end
+  object lbl_umx: TLabel
+    Left = 145
+    Top = 174
+    Width = 29
+    Height = 13
+    Caption = '[UMX]'
+  end
+  object Label8: TLabel
+    Left = 2
+    Top = 151
+    Width = 32
+    Height = 13
+    Caption = 'Lotto :'
+  end
+  object lbl_forn: TLabel
+    Left = 3
+    Top = 34
+    Width = 202
+    Height = 30
+    Anchors = [akLeft, akTop, akRight]
+    AutoSize = False
+    Font.Charset = DEFAULT_CHARSET
+    Font.Color = clWindowText
+    Font.Height = -11
+    Font.Name = 'Tahoma'
+    Font.Style = []
+    ParentFont = False
+    WordWrap = True
+  end
+  object f2DDT: TF2
+    Left = 56
+    Top = 73
+    Width = 150
+    Height = 21
+    Anchors = [akLeft, akTop, akRight]
+    BevelOuter = bvNone
+    BorderStyle = bsSingle
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 3
+    NumCol = 0
+    BtnEnabled = True
+    ListFieldIndex = 0
+    KeyValue = 0
+    MultiSelez = False
+    ReadBarcode = False
+    F2Table = BamTes
+    EmptyOk = True
+    OpenThread = False
+    GridWidth = 169
+    GridHeight = 160
+    DropDownAlign = daLeft
+    DropDownWidth = 169
+    ReadOnly = True
+    DropDownRows = 0
+  end
+  object edt_for: TCSEdit
+    Left = 36
+    Top = 7
+    Width = 19
+    Height = 21
+    DataType = dtInt32
+    TabOrder = 0
+    OnExit = edt_forExit
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object F2Forn: TF2
+    Left = 56
+    Top = 7
+    Width = 150
+    Height = 21
+    Anchors = [akLeft, akTop, akRight]
+    BevelOuter = bvNone
+    BorderStyle = bsSingle
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 1
+    NumCol = 0
+    BtnEnabled = True
+    ListFieldIndex = 0
+    KeyValue = 0
+    OnKeyChange = F2FornKeyChange
+    MultiSelez = False
+    ReadBarcode = False
+    F2Table = FornitD
+    EmptyOk = True
+    OpenThread = False
+    GridWidth = 170
+    GridHeight = 160
+    DropDownAlign = daLeft
+    DropDownWidth = 170
+    ReadOnly = True
+    DropDownRows = 0
+  end
+  object edt_lotto: TCSEdit
+    Left = 36
+    Top = 97
+    Width = 169
+    Height = 21
+    ParentCustomHint = False
+    Anchors = [akLeft, akTop, akRight]
+    TabOrder = 4
+    OnExit = edt_lottoExit
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object F2Art: TF2
+    Left = 36
+    Top = 121
+    Width = 169
+    Height = 21
+    Anchors = [akLeft, akTop, akRight]
+    BevelOuter = bvNone
+    BorderStyle = bsSingle
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 5
+    NumCol = 0
+    BtnEnabled = True
+    ListFieldIndex = 0
+    KeyValue = 0
+    OnKeyChange = F2ArtKeyChange
+    MultiSelez = False
+    ReadBarcode = False
+    F2Table = ArticoC
+    EmptyOk = True
+    OpenThread = False
+    GridWidth = 171
+    GridHeight = 160
+    DropDownAlign = daLeft
+    DropDownWidth = 171
+    ReadOnly = True
+    DropDownRows = 0
+  end
+  object edt_qtatot: TCSEdit
+    Left = 143
+    Top = 190
+    Width = 62
+    Height = 21
+    Anchors = [akLeft, akTop, akRight]
+    TabOrder = 8
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object edt_qta_x_scatola: TCSEdit
+    Left = 77
+    Top = 190
+    Width = 55
+    Height = 21
+    Enabled = False
+    TabOrder = 7
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object edt_scatole: TCSEdit
+    Left = 12
+    Top = 190
+    Width = 55
+    Height = 21
+    TabOrder = 6
+    OnChange = edt_scatoleChange
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object F2Vano: TF2
+    Left = 36
+    Top = 218
+    Width = 169
+    Height = 21
+    Anchors = [akLeft, akTop, akRight]
+    BevelOuter = bvNone
+    BorderStyle = bsSingle
+    ParentShowHint = False
+    ShowHint = True
+    TabOrder = 9
+    NumCol = 0
+    BtnEnabled = True
+    ListFieldIndex = 0
+    KeyValue = 0
+    MultiSelez = False
+    ReadBarcode = False
+    F2Table = AllMag
+    EmptyOk = True
+    OpenThread = False
+    GridWidth = 171
+    GridHeight = 160
+    DropDownAlign = daLeft
+    DropDownWidth = 171
+    ReadOnly = True
+    DropDownRows = 0
+  end
+  object edt_bolla: TCSEdit
+    Left = 36
+    Top = 73
+    Width = 19
+    Height = 21
+    DataType = dtInt32
+    TabOrder = 2
+    OnExit = edt_bollaExit
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object edt_numlot: TCSEdit
+    Left = 36
+    Top = 148
+    Width = 81
+    Height = 21
+    Enabled = False
+    TabOrder = 10
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object edt_numser: TCSEdit
+    Left = 124
+    Top = 148
+    Width = 81
+    Height = 21
+    Anchors = [akLeft, akTop, akRight]
+    Enabled = False
+    TabOrder = 11
+    Alignment = taLeftJustify
+    AllowNegative = False
+    AutoMode = amDisable
+    BlankWhenZero = False
+    Century = False
+    ColorOnFocus = clYellow
+    DigitsDec = 0
+    DigitsInt = 0
+    FormatZero = fzNothing
+    MaxTimeUnit = tuOre
+    MinTimeUnit = tuSecondi
+    PercSign = False
+    Seconds = False
+    ThousandSep = False
+    ControlloData = True
+  end
+  object TimerFor: TTimer
+    Enabled = False
+    OnTimer = TimerForTimer
+    Left = 151
+    Top = 219
+  end
+end
diff --git a/source/PI_Altag_BWS/U_Fra_Clav.pas b/source/PI_Altag_BWS/U_Fra_Clav.pas
new file mode 100644
index 0000000..7d6c710
--- /dev/null
+++ b/source/PI_Altag_BWS/U_Fra_Clav.pas
@@ -0,0 +1,262 @@
+unit U_Fra_Clav;
+
+interface
+
+uses
+  Winapi.Windows, Winapi.Messages, System.SysUtils,
+  System.Variants, System.Classes, Vcl.Graphics,
+  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
+  CSEdit, Vcl.ExtCtrls, Compf2, u_vari_preparazioneDDT, csetables, UVariStd, ucoredb, MsgCore;
+
+type
+  TFrameClav = class(TFRame)
+    f2DDT: TF2;
+    edt_for: TCSEdit;
+    F2Forn: TF2;
+    edt_lotto: TCSEdit;
+    F2Art: TF2;
+    edt_qtatot: TCSEdit;
+    edt_qta_x_scatola: TCSEdit;
+    edt_scatole: TCSEdit;
+    F2Vano: TF2;
+    Label1: TLabel;
+    Label2: TLabel;
+    Label3: TLabel;
+    Label4: TLabel;
+    Label5: TLabel;
+    Label6: TLabel;
+    Label7: TLabel;
+    lbl_umx: TLabel;
+    TimerFor: TTimer;
+    edt_bolla: TCSEdit;
+    edt_numlot: TCSEdit;
+    edt_numser: TCSEdit;
+    Label8: TLabel;
+    lbl_forn: TLabel;
+
+    procedure F2ArtKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+    procedure SbiancaCampi;
+    procedure ResetControls;
+    procedure InserisciSuPDTRIG;
+    procedure edt_lottoExit(Sender: TObject);
+    procedure edt_scatoleChange(Sender: TObject);
+    procedure F2FornKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+    procedure TimerForTimer(Sender: TObject);
+    procedure edt_forExit(Sender: TObject);
+    procedure edt_bollaExit(Sender: TObject);
+  private
+    { Private declarations }
+    FIdLotser : integer;
+    FidArtico : integer;
+    iprepsped : TPrepSped;
+  public
+    { Public declarations }
+
+  end;
+
+implementation
+
+
+
+{$R *.dfm}
+
+procedure TFrameClav.edt_bollaExit(Sender: TObject);
+begin
+  f2DDT.KeyValue := edt_bolla.AsInteger;
+  edt_lotto.SetFocus;
+end;
+
+procedure TFrameClav.edt_forExit(Sender: TObject);
+begin
+  F2Forn.KeyValue := edt_for.AsInteger;
+end;
+
+procedure TFrameClav.edt_lottoExit(Sender: TObject);
+var
+  numlot,numser : string;
+begin
+  if edt_lotto.AsString <> '' then
+  begin
+    FidArtico := 0;
+    FIdLotser := 0;
+    if not iprepsped.ControllaBCU(edt_lotto.AsString,FidArtico,FIdLotser) then
+    begin
+      edt_lotto.SetFocus;
+    end
+    else
+    begin
+      F2Art.KeyValue := FidArtico;
+      iprepsped.GetNumlotNumser(Fidlotser,numlot,numser);
+      edt_numlot.AsString := numlot;
+      edt_numser.AsString := numser;
+    end;
+    edt_scatole.SetFocus;
+  end;
+end;
+
+procedure TFrameClav.edt_scatoleChange(Sender: TObject);
+begin
+  if edt_scatole.AsFloat = 0 then
+    edt_qtatot.AsFloat := 0
+  else
+  begin
+    if edt_qta_x_scatola.AsFloat = 0 then
+      edt_qtatot.AsFloat := edt_scatole.AsFloat
+    else
+      edt_qtatot.AsFloat := edt_scatole.AsFloat * edt_qta_x_scatola.AsFloat;
+  end;
+end;
+
+procedure TFrameClav.F2ArtKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+var
+  Um1, Um2, Um3: string;
+begin
+
+  if newkey <> oldkey then
+  begin
+    edt_qta_x_scatola.AsFloat := Iprepsped.GetQtaPerScatolaArticolo(newkey);
+
+    iprepsped.getUnitaMisuraArticolo(newkey, Um1, Um2, Um3);
+    if um1 <> '' then
+      lbl_umx.Caption := um1;
+  end;
+
+end;
+
+procedure TFrameClav.F2FornKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+var
+  qr : tcsequery;
+  str_id : string;
+begin
+  if newkey <> oldkey then
+  begin
+    qr := tcsequery.Create(nil);
+    qr.DataBaseName := dbexec.DatabaseName;
+    qr.SQL.text := 'select isnull(ltrim(rtrim(descr1)),'''')+ '' '' +ISNULL(ltrim(rtrim(descr2)),'''')  + '' '' + ISNULL(ltrim(rtrim(indiri)),'''') + '' '' + ISNULL(ltrim(rtrim(cap)),'''') + '' '' + ISNULL(ltrim(rtrim(comune)),'''') + '' ('' + ISNULL (ltrim(rtrim(PROV)),'''') +'')'' as descr ' +
+                   ' from persone p ' +
+                   'inner join fornitori f ' +
+                   '   on f.idpersona = p.id ' +
+                   'where f.id = ' + inttostr(newkey);
+    qr.Open;
+    lbl_forn.Caption := qr.FieldByName('descr').AsString;
+    qr.Close;
+
+    qr.SQL.Text := 'select distinct idbam from PDTRIG r inner join BAMTES b on b.ID = r.IDBAM where b.IDFORN = ' + inttostr(newkey);
+    qr.Open;
+    if not qr.IsEmpty then
+    begin
+      if qr.RecordCount = 1 then
+      begin
+        f2DDT.Close;
+        f2DDT.WhereSql := 'a.id = ' + inttostr(qr.FieldByName('idbam').AsInteger);
+        f2DDT.Open;
+        f2ddt.KeyValue := qr.FieldByName('idbam').AsInteger;
+        edt_bolla.AsInteger := qr.FieldByName('idbam').AsInteger;
+        iprepsped.FresultDDT := qr.FieldByName('idbam').AsInteger;
+      end
+      else
+      begin
+        str_id := '';
+        while not qr.Eof do
+        begin
+          if str_id <> '' then
+             str_id := str_id + ',';
+
+          str_id := str_id + inttostr(qr.FieldByName('idbam').AsInteger);
+          qr.Next;
+        end;
+        f2ddt.Close;
+        f2ddt.WhereSql := 'a.id in (' + str_id + ')';
+        f2ddt.Open;
+        qr.First;
+        f2ddt.KeyValue := qr.FieldByName('idbam').AsInteger;
+        iprepsped.FresultDDT := qr.FieldByName('idbam').AsInteger;
+      end;
+    end
+    else
+    begin
+      f2ddt.Close;
+      f2ddt.WhereSql := 'a.id = 0';
+      f2ddt.Open;
+      f2ddt.keyvalue := 0;
+      iprepsped.FresultDDT := 0;
+    end;
+    qr.Close;
+    qr.Free;
+    edt_lotto.SetFocus;
+  end;
+end;
+
+procedure TFrameClav.InserisciSuPDTRIG;
+var
+  qr_ins : tcsequery;
+  qta : double;
+begin
+  qta := edt_qtatot.AsFloat;
+  qr_ins := tcsequery.Create(nil);
+  qr_ins.Databasename := dbexec.DatabaseName;
+  qr_ins.SQL.text := 'insert into PDTRIG (idlotser,idallmag,idbam,qta1,qta2,qta3,codudc) ' +
+                     'values (' + inttostr(FIdLotSer) + ',' +
+                                  inttostr(F2Vano.KeyValue) + ',' +
+                                  inttostr(f2DDT.KeyValue) + ',' +
+                                  stringreplace(floattostr(qta),',','.',[]) + ',' +
+                                  stringreplace(floattostr(qta),',','.',[]) + ',' +
+                                  stringreplace(floattostr(qta),',','.',[]) + ',0)';
+
+  try
+    qr_ins.ExecSQL;
+  except
+    on e:exception do
+    begin
+       Application.MessageBox(PChar('Si � verificato il seguente errore' + #10+#13+e.Message),
+                           PChar(''),
+                           mb_ok + MB_ICONERROR);
+
+    end;
+  end;
+  qr_ins.Close;
+  qr_ins.Free;
+end;
+
+procedure TFrameClav.ResetControls;
+begin
+  edt_for.AsString := '';
+  F2Forn.KeyValue := 0;
+  edt_bolla.AsInteger := 0;
+  f2DDT.Close;
+  f2ddt.WhereSql := 'a.id = 0';
+  f2ddt.Open;
+  f2ddt.KeyValue := 0;
+
+  edt_lotto.AsString := '';
+  F2Art.KeyValue := 0;
+  F2Vano.KeyValue := 0;
+  edt_numlot.AsString := '';
+  edt_numser.AsString := '';
+  edt_scatole.AsFloat := 0;
+  edt_qta_x_scatola.AsFloat := 0;
+  edt_qtatot.AsFloat := 0;
+
+  edt_for.SetFocus;
+end;
+
+procedure TFrameClav.SbiancaCampi;
+begin
+  edt_lotto.AsString := '';
+  F2Art.KeyValue := 0;
+  F2Vano.KeyValue := 0;
+  edt_numlot.AsString := '';
+  edt_numser.AsString := '';
+  edt_scatole.AsFloat := 0;
+  edt_qta_x_scatola.AsFloat := 0;
+  edt_qtatot.AsFloat := 0;
+end;
+
+procedure TFrameClav.TimerForTimer(Sender: TObject);
+begin
+
+  TimerFor.Enabled := false;
+  edt_for.SetFocus;
+end;
+
+end.
diff --git a/source/PI_Altag_BWS/U_PI_Altag_BWS.pas b/source/PI_Altag_BWS/U_PI_Altag_BWS.pas
new file mode 100644
index 0000000..bd7fba4
--- /dev/null
+++ b/source/PI_Altag_BWS/U_PI_Altag_BWS.pas
@@ -0,0 +1,2290 @@
+{
+Pdt.cfg
+[MODULI]
+PI_Altag_BWS=BWS Riunione industrie alimentari
+
+[BWS_MODULI]
+PRGSPEC=RicMerAltag
+
+[RicMerAltag]
+DRV_NAME=PI_Altag_BWS.bpl
+REG_NAME=PI_Altag_Spec
+FUNTOCALL=PlugIn_CaricaMag
+BTNCAPTION=Carico a Magazzino  
+
+Extfun.ini
+[FrmScaCom]
+AUTORUN=PI_Altag_BWS.StartPI_ScaricoOP;
+
+[FrmCarPFDoc]
+AUTORUN=PI_Altag_BWS.StartPI_CaricoOP;
+
+[FrmSpedOVCom]
+AUTORUN=PI_Altag_BWS.StartPI_PrepSpedOV;
+
+[FrmSelTipodoc]
+AUTORUN=PI_Altag_BWS.StartPI_SELTipodoc;
+
+[FrmInvMagBWS]
+AUTORUN=PI_Altag_BWS.StartPI_Inventario;
+
+SAMW\PI_Altag_BWS.ini
+[DDT_FORNITORE]
+IDCAUMOV=
+
+[ENTRATA_MERCI]
+IDVANO=
+
+SQL
+alter table pdtrigacq add ext_idfor int null
+alter table pdtrigacq add ext_idtipidoc int null
+alter table pdtrigacq add ext_numdoc varchar(50) null
+alter table pdtrigacq add ext_datdoc float(53)
+
+alter table movmag add ext_spid int default = @@spid
+
+
+
+}
+
+
+
+unit U_PI_Altag_BWS;
+
+interface
+
+uses
+  S3Plugin, System.Classes, csFilecfg, system.SysUtils, csctipi, CsExtctrls,
+  dialogs, CSButtons, extctrls,StdCtrls,  windows, s3db, db, csetables,compf2,
+  Vcl.Buttons, vcl.forms,Vcl.Controls, MsgCore, UcoreTipi, UVarie, UVariStd,
+  ucoredb, CSEdit, CSLabel, imagazzino, Vcl.ComCtrls, ufrmSelLotto, UFrmDettlot;
+
+type
+  TPI_Altag_BWS = class(TCustomPlugIn)
+
+   f2artico,
+   f2allmag,
+   f2idtipodoc : TF2;
+
+   Rgtipodoc : TRadioGroup;
+
+   edtlotto,
+   edtserie,
+   edtqtaumi,
+   edtqtaumm,
+   edtqtaumv,
+   edtbarcodeunico,
+   edtssccda,
+   edttestata : TCSEdit;
+
+   FPnlDescrCli: TPanel;
+   FPnlDatiRiga: TCSLabel;
+   lblssccda,
+   lblsscc,
+   lblbamtes,
+   lbllotto,
+   lblartico,
+   lblqtaumv,
+   lblqtaumm,
+   lblqtaumi,
+   lblvano : TLabel;
+
+   pnlinvmag,
+   pnltasti,
+   pnlstdbtn,
+   pnlstdstatus,
+   pnlstdgen,
+   pnlstato : TPanel;
+
+   stbbarra : tstatusbar;
+
+   FF2AllMag : TF2;
+
+   scbdata : TScrollBox;
+
+   BtnLeggiBarcode,
+   btnok,
+   btnendmission,
+   btnins,
+   btnannulla,
+   btnsaltariga : TBitBtn;
+
+   f2bamtes :TF2;
+   FF2LotSer :TF2;
+
+
+private
+   oldf2bamteskeychange : TKeyChange;
+   oldbtnokclick,
+   oldbtnendmissionClick,
+   oldbtninsclick,
+   oldEdtQtaumionExit,
+   oldEdtQtaummonExit,
+   oldEdtQtaumvonExit,
+   oldPagecontrolChange,
+
+   OldEdtSerieOnExit,
+   OldEdtLottoOnExit,
+   oldFormOnResize: TNotifyEvent;
+
+   FOLD_BWS_F2AllMagOnExit: TNotifyEvent;
+   FOLD_BWS_F2AllMagOnKeyChange: TKeyChange;
+   FOLD_BWS_BtnInsPDTInvMagOnClick: TNotifyEvent;
+   FOLD_BWS_BtnOkOnClick: TNotifyEvent;
+   FOld_BWS_TabNewRigaOnShow: TNotifyEvent;
+
+   FIdAllMag: integer;
+
+   function GetDescrVettore(idvet : Integer):string;
+   function ControllaPresenzaArticoliDeteriorabili(idcommessa : Integer) : Boolean;
+   function ArticoloDerrAlim(idartico : Integer;idcommessa : Integer; DERRALIM : string) : Boolean;
+   function getQtaResidua : Double;
+   procedure NewF2bamtesKeychange(sender : TObject;newkey,oldkey : integer);
+   procedure NewF2ArticoKeychange(sender : TObject;newkey,oldkey : integer);
+   procedure CreaButton;
+   procedure NewBtnEndmissionClick(sender : TObject);
+   procedure NewEdtSerieOnExit(sender : TObject);
+   procedure newEdtlottoOnExit(sender : TObject);
+   procedure BtnDetailScaricoClick(sender : TObject);
+   procedure EdtNewTestataExit(sender : TObject);
+   procedure BtnLeggiBarcodeClick(sender : TObject);
+   procedure BtnCaricaBarcodeClick(sender : TObject);
+   procedure NumSpedizioneKeydown(Sender: TObject; var Key: Word; Shift: TShiftState);
+   procedure btngiacenzeclick(sender : TObject);
+   procedure BtnLeggiPezzoSingoloClick(sender : TObject);
+   procedure ModificaPrepSpedOV;
+   procedure newbtnokClick(sender : TObject);
+   procedure newbtninsclick(sender : TObject);
+   procedure newQtaUmiOnexit(sender : TObject);
+   procedure newQtaUmmOnexit(sender : TObject);
+   procedure newQtaUmvOnexit(sender : TObject);
+   procedure NewPagecontrolChange(sender : TObject);
+   procedure newbtinsclick_ScarOP(sender : TObject);
+   procedure newBtnInsclick_carOP(sender : TObject);
+   procedure NewFormOnResize(sender : TObject);
+public
+
+published
+
+  property OLD_BWS_F2AllMagOnExit: TNotifyEvent read FOLD_BWS_F2AllMagOnExit write FOLD_BWS_F2AllMagOnExit;
+  procedure NEW_BWS_F2AllMagOnExit(Sender: TObject);
+
+  property OLD_BWS_F2AllMagOnKeyChange: TKeyChange read FOLD_BWS_F2AllMagOnKeyChange write FOLD_BWS_F2AllMagOnKeyChange;
+  procedure NEW_BWS_F2AllMagOnKeyChange(Sender: TObject; NewKey, OldKey: Integer);
+
+  property OLD_BWS_BtnInsPDTInvMagOnClick: TNotifyEvent read FOLD_BWS_BtnInsPDTInvMagOnClick write FOLD_BWS_BtnInsPDTInvMagOnClick;
+  procedure NEW_BWS_BtnInsPDTInvMagOnClick(Sender: TObject);
+
+  property OLD_BWS_BtnOkOnClick: TNotifyEvent read FOLD_BWS_BtnOkOnClick write FOLD_BWS_BtnOkOnClick;
+  procedure NEW_BWS_BtnOkOnClick(Sender: TObject);
+
+  property OLD_BWS_TabNewRigaOnShow: TNotifyEvent read FOLD_BWS_TabNewRigaOnShow write FOLD_BWS_TabNewRigaOnShow;
+  procedure NEW_BWS_TabNewRigaOnShow(Sender: TObject);
+
+  Procedure StartPI_Inventario;
+  Procedure StartPI_ModLot;
+  Procedure StartPI_PrepSpedOV;
+  procedure StartPI_SELTipodoc;
+  procedure StartPI_ScaricoOP;
+  procedure StartPI_CaricoOP;
+
+end;
+
+
+
+implementation
+
+uses U_Altag_BWS, udmpdt, UFrmSelComrig, cstd, UFraPrepspedOV, s3registry, ivendite, ibase, UPDTProc, UPDTMsgBox, RSQL, ucoreinterface, UFrmDetailScarico ;
+
+var
+  fra_prepspedov : TFra_PrepspedOV;
+
+
+  fl_resultok : Boolean;
+
+
+  idtipodocB,
+  idtipodocF,
+  idtipodocR :Integer;
+
+  idComTes,
+  idcomrig: Integer;
+
+  scadenzaLotto: string;
+
+  umv,
+  umcomv,
+  uminv : string;
+
+  orgumv,
+  orgumconv : TOriUM;
+
+  peso3103,
+  fl_inizializzazione,
+  messaggioSpedizione :Boolean;
+
+  DERRALIM : string;
+
+{ TPI_Prepara_DDT_BWS }
+
+
+
+
+function TPI_Altag_BWS.GetDescrVettore(idvet : Integer):string;
+var
+  Lqry : tcsequery;
+begin
+  result := '';
+  Lqry := TCSEQuery.Create(nil);
+  Lqry.DataBaseName := DBExec.DatabaseName;
+  Lqry.SQL.Text := 'select descr1,isnull(descr2,'''') as descr2,indiri,cap,comune from persone where id = ' + IntToStr(idvet);
+  Lqry.Open;
+  if not Lqry.IsEmpty then
+  begin
+    Result := Lqry.FieldByName('descr1').AsString + ' ' +
+              Lqry.FieldByName('descr2').AsString + ' ' +
+              Lqry.FieldByName('indiri').AsString + ' ' +
+              Lqry.FieldByName('cap').AsString + ' ' +
+              Lqry.FieldByName('comune').AsString;
+  end;
+  Lqry.Close;
+  FreeAndNil(Lqry);
+  //TOStd( (Form as TFrmSpedOVStd).Lista.Items[(Form as TFrmSpedOVStd).Lista.Count - 1]).   CampiObj['Id'])
+end;
+
+function TPI_Altag_BWS.getQtaResidua: Double;
+var
+  qr_res : TCSEQuery;
+begin
+  //Result := 0;
+  qr_res := TCSEQuery.Create(nil);
+  qr_res.DataBaseName := DBExec.DatabaseName;
+  {
+  qr_res.SQL.Text := 'select ' +
+                     '   sum(isnull(cr.qta1,0)) - ' +
+                     '  (sum(isnull(p.qta1,0)) + ' +
+                     '   sum(isnull(cr.qtaspe,0))) as qtares ' +
+                     '  from comtes c ' +
+                     '  join comrig cr on cr.IDCOMTES = c.id ' +
+                     '  join lotser l on l.ID = cr.IDARTICO ' +
+                     '  join artico a on a.id = l.IDARTICO ' +
+                     '  left join PDTRIG p on p.IDCOMRIG = cr.id ' +
+                     ' where c.id = ' + inttostr(f2bamtes.KeyValue) +
+                     '   and a.id = ' + IntToStr(f2artico.KeyValue) +
+                     '   and a.derralim = ''' + DERRALIM + '''';
+
+  }     // cambiato perch� vogliono la qta residua per la prima riga di comrig da evadere..
+  qr_res.SQL.Text := 'select ' +
+                     '  isnull(cr.qta1,0) - ' +
+                     '  (sum(isnull(p.qta1,0)) + ' +
+                     '   isnull(cr.qtaspe,0)) as qtares ' +
+                     '  from comrig cr ' +
+                     '  left join PDTRIG p on p.IDCOMRIG = cr.id ' +
+                     ' where cr.id = ' + inttostr(udmpdt.DMPDT.Qry_EVACom.fieldbyname('idcomrig').asinteger) +
+                     ' group by cr.qta1,cr.QTASPE';
+
+  qr_res.Open;
+  if qr_res.FieldByName('qtares').Asfloat > 0 then
+    result := qr_res.FieldByName('qtares').Asfloat
+  else
+    result := 0;
+  qr_res.Close;
+  FreeAndNil(qr_res);
+end;
+
+function TPI_Altag_BWS.ArticoloDerrAlim(idartico, idcommessa: Integer;
+  DERRALIM: string): Boolean;
+var
+  qr_ts : TCSEQuery;
+  qtares,
+  qtaprep : Double;
+begin
+  Result := false;
+  qr_ts := TCSEQuery.Create(nil);
+  qr_ts.DataBaseName := dbexec.DatabaseName;
+  qr_ts.SQL.Text := 'select sum(isnull(qtares,0)) as qta' +
+                    '  from comrig cr ' +
+                    '  join lotser ls ' +
+                    '    on ls.id = cr.idartico ' +
+                    '  join artico art ' +
+                    '    on art.id = ls.idartico ' +
+                    ' where cr.idcomtes = ' + IntToStr(idcommessa) +
+                    '   and art.id = ' + IntToStr(idartico);
+
+  if DERRALIM <> 'T' then
+    qr_ts.SQL.Text := qr_ts.SQL.Text + ' and art.derralim = ''' + DERRALIM + '''';
+
+  qr_ts.Open;
+  if qr_ts.FieldByName('qta').AsFloat > 0 then
+  begin
+    qtares := qr_ts.FieldByName('qta').AsFloat;
+    qr_ts.Close;
+    qr_ts.SQL.Text := 'select sum(isnull(p.qta1,0)) as qta ' +
+                      ' from pdtrig p ' +
+                      ' join comrig cr ' +
+                      '   on cr.id = p.idcomrig ' +
+                      ' join lotser ls ' +
+                      '   on ls.id = cr.idartico ' +
+                      ' join artico art ' +
+                      '   on art.id = ls.idartico ' +
+                      'where art.id = ' + inttostr(idartico) +
+                      '  and cr.idcomtes = ' + IntToStr(idcommessa);
+
+    if DERRALIM <> 'T' then
+      qr_ts.SQL.Text := qr_ts.SQL.Text + ' and art.derralim = ''' + DERRALIM + '''';
+
+    qr_ts.Open;
+    qtaprep := qr_ts.FieldByName('qta').AsFloat;
+    if qtaprep > 0 then
+    begin
+      if qtares - qtaprep > 0 then
+        Result := True;
+    end
+    else
+      Result := true;
+
+  end;
+  qr_ts.Close;
+  FreeAndNil(qr_ts);
+end;
+
+
+
+
+procedure TPI_Altag_BWS.BtnCaricaBarcodeClick(sender: TObject);
+var
+  Ibws_barcode : TBWS_barcode128;
+  objartico : IArticoStd;
+  id_articolo : integer;
+begin
+  Ibws_barcode := TBWS_barcode128.Create;
+
+  try
+    if Ibws_barcode.LeggiBarcode128_2 <> '' then
+    begin
+      if Ibws_barcode.itemcode <> '' then
+      begin
+        id_articolo := Ibws_barcode.GetArticoFromEan(Ibws_barcode.itemcode);
+        if id_articolo > 0 then
+        begin
+
+          scadenzaLotto := Ibws_barcode.scadenza;
+          peso3103 := Ibws_barcode.peso3103;
+
+          if not Ibws_barcode.VerificaLotto(id_articolo,f2bamtes.qryF2.FieldByName('idclidest').AsInteger,f2bamtes.KeyValue,f2allmag.KeyValue,Ibws_barcode.lotto,StringReplace(scadenzaLotto,'/','',[rfReplaceAll]),StrToDateTime(Ibws_barcode.scadenza)) then
+          begin
+            exit;
+          end;
+          f2artico.KeyValue := id_articolo;
+          f2artico.OnExit(f2artico);
+          if f2artico.KeyValue <> 0 then
+          begin
+            if not Assigned(objArtico) then
+                GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+
+            ObjArtico.Seek('ID', f2artico.KeyValue);
+            objartico.UMVend(umv,orgumv,umcomv,orgumconv,uminv);
+            fl_inizializzazione := true;
+            edtlotto.AsString := Ibws_barcode.lotto;
+            edtlotto.OnExit(edtlotto);
+            edtserie.AsString := StringReplace(scadenzaLotto,'/','',[rfReplaceAll]) ;
+            edtserie.OnExit(edtserie);
+            fl_inizializzazione := false;
+            fra_prepspedov.edtDataLotto.AsDateTime := StrToDateTime(Ibws_barcode.scadenza);
+            fra_prepspedov.PgcCtrl.TabIndex := 2;
+            NewPagecontrolChange(fra_prepspedov.PgcCtrl);
+            if not Ibws_barcode.peso3103 then
+            begin
+              //Ibws_barcode.peso := Ibws_barcode.GetPesoFissoFromEan(Ibws_barcode.itemcode);
+              //edtqtaumv.AsFloat := Ibws_barcode.peso;
+
+              edtqtaumv.AsFloat := getQtaResidua;
+
+              edtqtaumv.OnExit(edtqtaumv);
+              edtqtaumv.SetFocus;
+            end
+            else
+            begin
+              edtqtaumv.AsFloat := 1;                     //cartoni
+              edtqtaumm.AsFloat := Ibws_barcode.peso;    // kili
+              edtqtaumi.AsFloat := edtqtaumv.AsFloat * objartico.ConvUM(orgumv,ouI);         //Pezzi
+              edtqtaumv.SetFocus;
+            end;
+
+          end;
+        end;
+      end;
+    end;
+  finally
+    if Assigned(iBWS_barcode) then
+      FreeAndNil(iBWS_barcode);
+  end;
+
+end;
+
+
+procedure TPI_Altag_BWS.BtnDetailScaricoClick(sender: TObject);
+var
+  frmDett : TFrmDetailsCarico;
+begin
+  frmDett := TFrmDetailsCarico.create(form);
+  frmDett.Height := Form.Height;
+  frmdett.Width := Form.Width;
+  with frmDett.qr_dettaglio do
+  begin
+    close;
+    SQL.Text := 'select ' +
+                '  pr.id, ' +
+                '  art.codice as articolo,  ' +
+                '  ls.NUMLOT as lotto,      ' +
+                '  ls.NUMSER as serie,      ' +
+                '  ls.Datrif as data_lotto, ' +
+                '  pr.QTA1,   ' +
+                '  pr.QTA2,   ' +
+                '  pr.QTA3,   ' +
+                '  pr.UM3     ' +
+                ' from PDTRIG Pr  ' +
+                ' join lotser ls on ls.id = pr.IDLOTSER   ' +
+                ' join artico art on art.id = ls.IDARTICO  ' +
+                ' left join comrig cr on cr.id = pr.idcomrig ' +
+                ' left join comtes ct on ct.id = cr.IDCOMTES ' +
+                'where cr.id = :IDCOMRIG ';
+
+    if derralim <> 'T' then
+      SQL.Text := sql.Text + 'ANd art.DERRALIM = ''' + DERRALIM + '''';
+
+    SQL.Text := sql.text + ' order by data_lotto,lotto,serie';
+
+    Prepare;
+    ParamByName('idcomrig').Asstring   := fra_prepspedov.QRighepreparate.FieldByName('idcomrig').AsString;
+
+    Open;
+  end;
+  frmDett.showmodal;
+  frmDett.Free;
+  fra_prepspedov.GridRighepreparate.RefreshData;
+  fra_prepspedov.lbl_cartoni.Caption := 'Colli ' + fra_prepspedov.QRighepreparate.FieldByName('qtasparata').AsString + '/' + fra_prepspedov.QRighepreparate.FieldByName('qtatot').AsString;
+  DMPDT.Qry_EVACom.close;
+  udmpdt.DMPDT.Qry_EVACom.open;
+  fra_prepspedov.QRighepreparate.Locate('idcomrig',idcomrig,[]);
+  fra_prepspedov.GridRighepreparate.SelectedRows.CurrentRowSelected := True;
+end;
+
+procedure TPI_Altag_BWS.btngiacenzeclick(sender: TObject);
+var
+  QrG : tcsequery;
+  frmlotti : tfrmdettlotti;
+begin
+  QrG := TCSEQuery.Create(nil);
+  QrG.DataBaseName := dbexec.DatabaseName;
+  QrG.SQL.Text := 'select         '+
+                  '   ls.NUMLOT,    '+
+                  '   ls.DATRIF,   '+
+                  ' allm.DESCR, '+
+                  ' (g.QTTGIAI - SUM(isnull(pd.QTA3,0))) as qtaLotto '+
+                  ' from GIAMAG g '+
+                  ' join LOTSER ls ' +
+                  '   on ls.ID = g.IDARTICO ' +
+                  ' join ARTICO art ' +
+                  '   on art.ID = ls.IDARTICO ' +
+                  ' join ALLMAG allm ' +
+                  '   on allm.ID = g.IDMAG ' +
+                  ' left join PDTRIG pd ' +
+                  '   on pd.IDLOTSER = ls.ID ' +
+                  'where art.ID = ' + inttostr(f2artico.KeyValue) +
+                  ' group by ls.NUMLOT, ' +
+                  '      ls.DATRIF,    ' +
+                  '      allm.DESCR,   ' +
+                  '      g.QTTGIAI ';
+  QrG.Open;
+
+  frmlotti := tfrmdettlotti.Create(form);
+  frmlotti.Height := Form.Height;
+  frmlotti.Width := Form.Width;
+  frmlotti.DsLot.DataSet := QrG;
+  frmlotti.ShowModal;
+  frmlotti.free;
+  QrG.Close;
+  FreeAndNil(qrg);
+end;
+
+procedure TPI_Altag_BWS.BtnLeggiBarcodeClick(sender: TObject);
+var
+  Ibws_barcode : TBWS_barcode128;
+  objartico : iarticostd;
+begin
+  Ibws_barcode := TBWS_barcode128.Create;
+  try
+    Ibws_barcode.LeggiBarcode128_2;
+    if Ibws_barcode.itemcode <> '' then
+    begin
+      scadenzaLotto := Ibws_barcode.scadenza;
+      f2artico.KeyValue := Ibws_barcode.GetArticoFromEan(Ibws_barcode.itemcode);
+      f2artico.OnExit(f2artico);
+      if f2artico.KeyValue <> 0 then
+      begin
+        if not Assigned(objArtico) then
+          GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+
+        ObjArtico.Seek('ID', f2artico.KeyValue);
+        objartico.UMVend(umv,orgumv,umcomv,orgumconv,uminv);
+
+        edtlotto.AsString := Ibws_barcode.lotto;
+        edtlotto.OnExit(edtlotto);
+        edtserie.AsString := StringReplace(scadenzaLotto,'/','',[rfreplaceall]) ;
+        edtserie.OnExit(edtserie);
+        if not Ibws_barcode.peso3103 then
+        begin
+          edtqtaumm.AsFloat := 1;        //cartoni
+          edtqtaumi.asfloat := edtqtaumm.AsFloat * objartico.ConvUM(orgumv,ouI); // pezzi
+        end
+        else
+        begin
+          edtqtaumv.AsFloat := 1;            //cartoni
+          edtqtaumm.AsFloat := Ibws_barcode.peso;    // kili
+          edtqtaumi.AsFloat := edtqtaumv.AsFloat * objartico.ConvUM(orgumv,ouI);         //Pezzi
+        end;
+
+      end;
+    end;
+  finally
+    if Assigned(Ibws_barcode) then
+      FreeAndNil(iBWS_barcode);
+  end;
+
+end;
+
+
+procedure TPI_Altag_BWS.BtnLeggiPezzoSingoloClick(sender: TObject);
+var
+  Ibws_barcode : TBWS_barcode128;
+  codice : string;
+  peso,
+  umm,
+  umi : double;
+begin
+  Ibws_barcode := TBWS_barcode128.Create;
+  try
+    if (f2artico.KeyValue > 0) and (edtlotto.AsString <> '') and peso3103 then
+    begin
+      umm := 0;
+      umi := 0;
+      codice := Ibws_barcode.LeggiBarcodePezzoSingolo;
+      while codice <> '' do
+      begin
+        if Length(codice) > 13 then
+        begin
+          MessaggioPDT('Barcode non valido!',APPTITLE,MB_OK);
+        end
+        else
+        begin
+          peso := StrToInt(Copy(codice,8,5)) / 1000;
+          if peso > 0 then
+          begin
+            umm := umm + peso;
+            umi := umi + 1;
+          end;
+        end;
+         codice := Ibws_barcode.LeggiBarcodePezzoSingolo;
+      end;
+      edtqtaumm.AsFloat := umm;
+      edtqtaumi.AsFloat := umi;
+      edtqtaumi.OnExit(edtqtaumi);
+      //mi posiziono alla pagina dopo
+      fra_prepspedov.PgcCtrl.TabIndex := 2;
+      NewPagecontrolChange(fra_prepspedov.PgcCtrl);
+    end;
+  finally
+    if Assigned(Ibws_barcode) then
+      FreeAndNil(iBWS_barcode);
+  end;
+end;
+
+function TPI_Altag_BWS.ControllaPresenzaArticoliDeteriorabili(
+  idcommessa: Integer) : boolean;
+var
+  qr_sel : tcsequery;
+begin
+  Result := false;
+  qr_sel := TCSEQuery.Create(nil);
+  qr_sel.DataBaseName := dbexec.DatabaseName;
+  qr_sel.SQL.Text := 'select isnull(idAnaPagDet,0) as iddet ' +
+                     ' from comrig cr ' +
+                     ' join COMTES c on c.id = cr.idcomtes ' +
+                     ' join CLIENTI cli on cli.id = c.idcliente ' +
+                     ' where cr.idcomtes = ' + inttostr(idcommessa);
+  qr_sel.Open;
+  if qr_sel.FieldByName('iddet').AsInteger > 0 then
+    result := true;
+  qr_sel.Close;
+  FreeAndNil(qr_sel);
+
+end;
+
+procedure TPI_Altag_BWS.CreaButton;
+begin
+  BtnLeggiBarcode := TBitBtn.Create(form);
+  with(BtnLeggiBarcode) do
+  begin
+    Name := 'btnleggibarcode';
+    Caption := 'Barcode GS1';
+    Height := 25;
+
+    Align := Albottom;
+    visible := true;
+    enabled := true;
+    parent := pnlinvmag;
+
+    OnClick := BtnLeggiBarcodeClick;
+
+  end;
+
+end;
+
+
+procedure TPI_Altag_BWS.EdtNewTestataExit(sender: TObject);
+begin
+  if (fra_prepspedov.EdtNewTestata.AsString <> '') then
+  begin
+    if Copy(fra_prepspedov.EdtNewTestata.AsString,1,1) = 'D' then
+    begin
+      edttestata.Asinteger := StrToInt(copy(fra_prepspedov.EdtNewTestata.AsString,2));
+      DERRALIM := 'D';
+      fra_prepspedov.DERRALIM := 'D';
+    end
+    else if Copy(fra_prepspedov.EdtNewTestata.AsString,1,1) = 'N' then
+    begin
+      edttestata.Asinteger := StrToInt(copy(fra_prepspedov.EdtNewTestata.AsString,2));
+      DERRALIM := 'N';
+      fra_prepspedov.DERRALIM := 'N';
+    end
+    else
+    begin
+      edttestata.AsInteger := StrToInt(fra_prepspedov.EdtNewTestata.AsString);
+      DERRALIM := 'T';
+      fra_prepspedov.DERRALIM := 'T';
+    end;
+    edttestata.OnExit(sender);
+  end;
+end;
+
+procedure TPI_Altag_BWS.NewFormOnResize(sender: TObject);
+begin
+  if Assigned(oldFormOnResize) then
+    oldFormOnResize(sender);
+  ModificaPrepSpedOV;
+end;
+
+procedure TPI_Altag_BWS.ModificaPrepSpedOV;
+begin
+  if Assigned(fra_prepspedov) then
+    fra_prepspedov.Free;
+
+  fra_prepspedov := TFra_PrepspedOV.create(nil);
+  fra_prepspedov.Parent := scbdata;
+  fra_prepspedov.Height := scbdata.Height;
+  fra_prepspedov.Width := scbdata.Width;
+  fra_prepspedov.Align := alclient;
+  with(pnltasti) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    Align := alBottom;
+  end;
+  pnlstdbtn.height := 0;
+  pnlstdstatus.height := 0;
+  pnlstdgen.height := 0;
+  pnlstato.height := stbbarra.height;
+
+  fra_prepspedov.Align := alClient;
+  fra_prepspedov.lblGiacenza.Width := fra_prepspedov.newriga.width - fra_prepspedov.lblGiacenza.Left - 4;
+
+  with edttestata do
+  begin
+    parent  := fra_prepspedov.Testata;
+    Top     := fra_prepspedov.EdtNewTestata.Top;
+    Left    := fra_prepspedov.EdtNewTestata.Left;
+    Height  := fra_prepspedov.EdtNewTestata.Height;
+    Width   := fra_prepspedov.EdtNewTestata.Width;
+    Anchors := fra_prepspedov.EdtNewTestata.Anchors;
+    SendToBack;
+  end;
+
+  fra_prepspedov.LblNewBamTes.Top := fra_prepspedov.EdtNewTestata.Top - fra_prepspedov.LblNewBamTes.Height;
+  fra_prepspedov.LblNewBamTes.Left := fra_prepspedov.EdtNewTestata.Left;
+
+  with f2bamtes do
+  begin
+    parent := fra_prepspedov.Testata;
+    top := fra_prepspedov.EdtNewTestata.Top;
+    Left := fra_prepspedov.EdtNewTestata.Left + fra_prepspedov.EdtNewTestata.Width + 2;
+    Width := fra_prepspedov.Testata.Width - fra_prepspedov.EdtNewTestata.left - fra_prepspedov.EdtNewTestata.Width -2;
+    Anchors := [akTop,akleft];
+    oldf2bamteskeychange := onkeychange;
+    OnKeyChange := NewF2bamtesKeychange;
+    TabOrder := 1;
+  end;
+
+
+
+  with FPnlDescrCli do
+  begin
+    parent := fra_prepspedov.Testata;
+    top := f2bamtes.Top + f2bamtes.Height + 5;
+    Left := fra_prepspedov.EdtNewTestata.left;
+    TabStop := false;
+  end;
+
+  fra_prepspedov.LblVETT.Top := FPnlDescrCli.Top + FPnlDescrCli.Height + 5;
+  fra_prepspedov.LblVETT.Left := FPnlDescrCli.Left;
+
+  fra_prepspedov.lblDesVettore.Top := fra_prepspedov.LblVETT.Top + fra_prepspedov.LblVETT.Height + 2;
+  fra_prepspedov.lblDesVettore.Left := fra_prepspedov.LblVETT.Left;
+
+  fra_prepspedov.lblNumSpedizione.Top := fra_prepspedov.lblDesVettore.Top + fra_prepspedov.lblDesVettore.Height +5;
+  fra_prepspedov.lblNumSpedizione.Left := fra_prepspedov.lblDesVettore.Left;
+
+  fra_prepspedov.EdtNumSpedizione.Top := fra_prepspedov.lblNumSpedizione.Top + fra_prepspedov.lblNumSpedizione.Height + 2;
+  fra_prepspedov.EdtNumSpedizione.Left := fra_prepspedov.lblNumSpedizione.Left;
+
+  with(lblartico) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    top := fra_prepspedov.lblGiacenza.Top + fra_prepspedov.lblGiacenza.Height +4;
+    Left := fra_prepspedov.lblGiacenza.Left -1;
+  end;
+
+  with(f2artico) do
+  begin
+    parent := fra_prepspedov.NewRiga;
+    Top := lblartico.Top + lblartico.Height + 1;
+    left := fra_prepspedov.lblGiacenza.Left;
+    Width := fra_prepspedov.lblGiacenza.Width - fra_prepspedov.btnPezzoSingolo.Width - 1;
+    OnKeyChange := NewF2ArticoKeychange;
+  end;
+
+  with fra_prepspedov.btnPezzoSingolo do
+  begin
+    Top := f2artico.Top;
+    Left := f2artico.Left + f2artico.Width + 1;
+    Height := f2artico.Height;
+    OnClick := BtnLeggiPezzoSingoloClick;
+  end;
+
+  with(lbllotto) do
+  begin
+    parent := fra_prepspedov.NewRiga;
+    left := lblartico.Left;
+    top := f2artico.Top + f2artico.Height + 4;
+  end;
+
+  with(edtlotto) do
+  begin
+    parent := fra_prepspedov.NewRiga;
+    top :=  lbllotto.Top + lbllotto.Height + 1;
+    Left := fra_prepspedov.lblGiacenza.Left;
+    OldEdtLottoOnExit := OnExit;
+    onexit := newEdtlottoOnExit;
+  end;
+
+  with(edtserie) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    top :=  edtlotto.Top;
+    Left := edtlotto.Left + edtlotto.Width + 1;
+    OldEdtSerieOnExit := onexit;
+    onexit := NewEdtserieOnexit;
+  end;
+
+
+
+  with(lblqtaumv) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    top := edtlotto.Top + edtlotto.Height + 4;
+    Left := edtlotto.Left-1;
+  end;
+
+  with (edtqtaumv) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    Top := lblqtaumv.Top + lblqtaumv.Height + 1;
+    Left:= edtlotto.Left;
+
+  end;
+
+  with(lblqtaumm) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    top := edtlotto.Top + edtlotto.Height + 4;
+    //Left := edtlotto.Left-1;
+  end;
+
+  with (edtqtaumm) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    Top := lblqtaumm.Top + lblqtaumm.Height + 1;
+    Left:= edtqtaumv.Left + edtqtaumv.Width + 2;
+    lblqtaumm.Left := edtqtaumm.Left -1;
+  end;
+
+  with(lblqtaumi) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    top := edtlotto.Top + edtlotto.Height + 4;
+    //Left := edtlotto.Left-1;
+  end;
+
+  with (edtqtaumi) do
+  begin
+    Parent := fra_prepspedov.NewRiga;
+    top := lblqtaumi.Top + lblqtaumi.Height + 1;
+    left := edtqtaumm.Left + edtqtaumm.Width + 2;
+    lblqtaumi.Left := edtqtaumi.Left -1;
+
+  end;
+
+
+
+  with fra_prepspedov.lbl_datalotto do
+  begin
+
+    //top :=
+    left := edtqtaumv.Left -1;
+    top := edtqtaumv.Top + edtqtaumv.Height + 4;
+  end;
+
+  with fra_prepspedov.edtDataLotto do
+  begin
+    Top := fra_prepspedov.lbl_datalotto.Top + fra_prepspedov.lbl_datalotto.Height + 1;
+    Left := edtlotto.left;
+  end;
+
+  with(lblvano) do
+  begin
+    parent := fra_prepspedov.NewRiga;
+    top := fra_prepspedov.lbl_datalotto.Top;
+
+  end;
+
+  with(f2allmag) do
+  begin
+    parent := fra_prepspedov.NewRiga;
+    Top := fra_prepspedov.edtDataLotto.Top;
+    Left := fra_prepspedov.edtDataLotto.Left + fra_prepspedov.edtDataLotto.Width + 3;
+    width :=  fra_prepspedov.Testata.Width - fra_prepspedov.edtDataLotto.Left - fra_prepspedov.edtDataLotto.Width - 3;
+    lblvano.left := f2allmag.Left -1;
+  end;
+
+  lblbamtes.visible := false;
+  FPnlDatiRiga.Visible := False;
+  lblsscc.Visible := false;
+  lblssccda.Visible := False;
+  edtssccda.Visible := false;
+  edtbarcodeunico.Visible := False;
+
+  with fra_prepspedov.PgcCtrl do
+  begin
+    oldPagecontrolChange := OnChange;
+    OnChange := NewPagecontrolChange;
+  end;
+
+  with fra_prepspedov.GridRighepreparate do
+  begin
+    IniFileName := GLO.IniUtente;
+    IniSection  := Form.Name + '_NewGridRighepreparate_' + azienda.Id;
+    LoadFromIniFile;
+  end;
+
+  with fra_prepspedov.Btngiacenze do
+  begin
+    Top := edtserie.Top;
+    Height := edtserie.Height;
+    Left := edtserie.Left + edtserie.Width + 1;
+    OnClick := btngiacenzeclick;
+  end;
+
+  fra_prepspedov.EdtNewTestata.OnExit := EdtNewTestataExit;
+  fra_prepspedov.btnBarcode.OnClick := BtnCaricaBarcodeClick;
+
+  fra_prepspedov.btnDetail.OnClick := BtnDetailScaricoClick;
+  fra_prepspedov.EdtNumSpedizione.OnKeyDown := NumSpedizioneKeydown;
+  fra_prepspedov.QRighepreparate.DataBaseName := dbexec.DatabaseName;
+  fra_prepspedov.Visible := true;
+
+  fra_prepspedov.SetFocus;
+  fra_prepspedov.EdtNewTestata.SetFocus;
+  fra_prepspedov.PgcCtrl.TabIndex := 0;
+  NewPagecontrolChange(fra_prepspedov.PgcCtrl);
+
+end;
+
+
+procedure TPI_Altag_BWS.newbtinsclick_ScarOP(sender: TObject);
+var
+  Lqry : TCSEQuery;
+  SPID,
+  idmovmag : integer;
+  objMovMag: IMovMagStd;
+  qtainv,
+  qtamov,
+  qtaven : double;
+  str : string;
+  fl_mod : Boolean;
+begin
+  // mi prendo i valori prima del tasto ok per evitare che vengano sbiancati
+  fl_mod := false;
+  qtainv := edtqtaumi.AsFloat;
+  qtamov := edtqtaumm.AsFloat;
+  qtaven := edtqtaumv.AsFloat;
+
+  if Assigned(oldbtninsclick) then
+    oldbtninsclick(sender);
+
+  if not GetInterfOggetto('objMovMag', 'MOVMAG', IMovMagStd, objMovMag) then
+  begin
+    MessaggioPDT('Errore interfacciamento oggetto objmovmag',APPTITLE,mb_ok);
+    exit;
+  end;
+
+  Lqry := TCSEQuery.Create(nil);
+  Lqry.DataBaseName := DBExec.DatabaseName;
+  Lqry.SQL.Text := 'select @@spid as spid';
+  Lqry.open;
+  SPID := Lqry.FieldByName('spid').AsInteger;
+  Lqry.Close;
+  Lqry.SQL.Clear;
+  Lqry.SQL.Text := 'select max(id) as id from movmag where ext_spid = :spid and idopdp is not null';
+  Lqry.ParamByName('spid').AsInteger := SPID;
+  Lqry.Open;
+  if Lqry.IsEmpty then
+  begin
+    MessaggioPDT('Errore nel recupero del movimento di magazzino',APPTITLE,MB_OK);
+  end
+  else
+  begin
+    idmovmag := Lqry.FieldByName('id').AsInteger;
+    Lqry.SQL.Text := 'select qtainv,qtamov,qtaven from movmag where id = ' + IntToStr(idmovmag);
+    Lqry.Open;
+
+    objMovMag.Found := false;
+    objMovMag.Seek('ID',idmovmag);
+    if objMovMag.Found then
+    begin
+      if qtainv <> Lqry.FieldByName('qtainv').AsFloat then
+      begin
+        objMovMag.CampiObj['qtainv'] := qtainv;
+        fl_mod := true;
+      end;
+      if qtamov <> Lqry.FieldByName('qtamov').AsFloat then
+      begin
+        objMovMag.CampiObj['qtamov'] := qtamov;
+        fl_mod := true;
+      end;
+      if qtaven <> Lqry.FieldByName('qtaven').AsFloat then
+      begin
+        objMovMag.CampiObj['qtaven'] := qtaven;
+        fl_mod := true;
+      end;
+
+      if fl_mod then
+      begin
+        objMovMag.CampiObj['idsalva'] := 1;
+        objmovmag.addgenmov;
+        str := objmovmag.GeneraMovimento(False,false);
+      end;
+    end
+    else
+    begin
+      MessaggioPDT('Non � stato possibile recuperare movimento di magazziono id = ' + IntToStr(idmovmag),APPTITLE,MB_OK);
+    end;
+
+  end;
+  objMovMag.FreeGenMov;
+  Lqry.Close;
+  FreeAndNil(Lqry);
+end;
+
+
+
+procedure TPI_Altag_BWS.NewBtnEndmissionClick(sender: TObject);
+
+  procedure GestArticoliDerralimPDTRIG(Azione : string);   // D = delete I = inserisci
+  var
+    lqry : TCSEQuery;
+    nome_tabella : string;
+    //PDTRig: IObjStd;
+    //LMsg: string;
+  begin
+    nome_tabella := 'PDTRIGTMP' + Utente.ConnectId;
+    lqry := TCSEQuery.Create(nil);
+    lqry.DataBaseName := dbexec.DatabaseName;
+    {
+    if not GetInterfOggetto('ObjPDTRig', 'PDTRig', IObjStd, PDTRig) then
+    begin
+      LMsg := 'Si � verificato un errore durante l''inizializzazione del Modulo BWS ' +
+              'per l''interfaccia Preparazione Spedizioni.';
+      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
+      Exit;
+    end;
+    }
+    if Azione = 'D' then
+    begin
+      lqry.Close;
+      lqry.SQL.Text := 'select * from sysobjects where name = ''' + nome_tabella + ''' and xtype = ''U''';
+      lqry.Open;
+      if not lqry.IsEmpty then
+      begin
+        lqry.Close;
+        lqry.SQL.Text := 'drop table ' + nome_tabella;
+        try
+          lqry.ExecSQL;
+        except
+          on e:exception do
+          begin
+            MessaggioPDT('Si � verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
+            Abort;
+          end;
+        end;
+        lqry.Close;
+      end;
+      lqry.Close;
+      lqry.SQL.Text := 'select p.* into ' + nome_tabella  +
+                       '  from pdtrig p ' +
+                       '  join comrig cr on cr.id = p.idcomrig ' +
+                       '  join lotser ls on ls.id = cr.idartico ' +
+                       '  join artico art on art.id = ls.idartico ' +
+                       ' where cr.idcomtes = ' + inttostr(f2bamtes.KeyValue) +
+                       '   and art.derralim <> ''' + DERRALIM + '''';
+
+
+
+      try
+        lqry.ExecSQL;
+      except
+        on e:exception do
+        begin
+          MessaggioPDT('Si � verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
+          Abort;
+        end;
+      end;
+      lqry.Close;
+      lqry.SQL.Text := 'delete p ' +
+                       '  from pdtrig p ' +
+                       '  join comrig cr on cr.id = p.idcomrig ' +
+                       '  join lotser ls on ls.id = cr.idartico ' +
+                       '  join artico art on art.id = ls.idartico ' +
+                       ' where cr.idcomtes = ' + inttostr(f2bamtes.KeyValue) +
+                       '   and art.derralim <> ''' + DERRALIM + '''';
+
+      try
+        lqry.ExecSQL;
+      except
+        on e:exception do
+        begin
+          MessaggioPDT('Si � verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
+          Abort;
+        end;
+      end;
+      lqry.Close;
+    end;
+
+    if Azione = 'I' then
+    begin
+      lqry.Close;
+      lqry.SQL.Text := 'insert into pdtrig ' +
+                       'select IDFATRIG,IDCOMRIG,IDLOTSER,IDALLMAG,IDDIPENDENTI,' +
+                       'IDBAM,CODUDC,QTA1,QTA2,QTA3,UM3,IDFAT,IDRIC,SSCC,IDMOVMAG,IDLOTTIBF,' +
+                       'NUMBANC,CONTAINER,NUMPACK,RIFERI,IDARTIMB from ' + nome_tabella;
+      try
+        lqry.ExecSQL;
+      except
+        on e:exception do
+        begin
+          MessaggioPDT('Si � verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
+          Abort;
+        end;
+      end;
+      Lqry.Close;
+      lqry.SQL.Text := 'Drop table ' + nome_tabella;
+      try
+        lqry.ExecSQL;
+      except
+        on e:exception do
+        begin
+          MessaggioPDT('Si � verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
+          Abort;
+        end;
+      end;
+    end;
+
+    lqry.Close;
+    FreeAndNil(Lqry);
+
+  end;
+
+var
+  Lderralim : string;
+  //Lqry : TCSEQuery;
+  //sql,res : string;
+  //id_doc : Integer;
+  //ObjBamTes: IBamTesStd;
+  //SPID : integer;
+begin
+  Lderralim := DERRALIM;
+
+  if Lderralim <> 'T' then
+    GestArticoliDerralimPDTRIG('D');
+
+  if Lderralim <> 'T' then
+  begin
+    DBExec.ExecSql('Update pdtrig ' +
+                   '   set codudc = ' + inttostr(fra_prepspedov.EdtNumSpedizione.AsInteger) +
+                   '  from pdtrig p ' +
+                   '  join comrig cr ' +
+                   '    on cr.id = p.idcomrig ' +
+                   '  join lotser ls on ls.id = cr.idartico ' +
+                   '  join artico art on art.id = ls.idartico ' +
+                   '  join comtes ct ' +
+                   '    on ct.id = cr.idcomtes ' +
+                   ' where art.derralim = ''' + Lderralim + '''' +
+                   '   and ct.id = ' + IntToStr(f2bamtes.KeyValue));
+  end
+  else
+  begin
+    DBExec.ExecSql('Update pdtrig ' +
+                   '   set codudc = ' + inttostr(fra_prepspedov.EdtNumSpedizione.AsInteger) +
+                   '  from pdtrig p ' +
+                   '  join comrig cr ' +
+                   '    on cr.id = p.idcomrig ' +
+                   '  join lotser ls on ls.id = cr.idartico ' +
+                   '  join artico art on art.id = ls.idartico ' +
+                   '  join comtes ct ' +
+                   '    on ct.id = cr.idcomtes ' +
+                   ' where ct.id = ' + IntToStr(f2bamtes.KeyValue));
+  end;
+
+
+
+  if Assigned(oldbtnendmissionClick) then
+    oldbtnendmissionClick(sender);
+
+  if Lderralim <> 'T' then
+    GestArticoliDerralimPDTRIG('I');
+
+  if fl_resultok then
+  begin
+
+
+
+     // blocco commentato perch� non serve pi�.
+     //Il numero di spedizione � stato spostato nel trigger e il documento non serve pi� portarlo in definitivo
+    //Lqry := TCSEQuery.Create(nil);
+    //Lqry.DataBaseName := DBExec.DatabaseName;
+    //Lqry.SQL.Text := 'select @@spid as spid';
+    //Lqry.open;
+    //SPID := Lqry.FieldByName('spid').AsInteger;
+    //Lqry.Close;
+    //Lqry.SQL.Clear;
+
+    //if idtipodocB <> 0 then
+    //begin
+
+    //  sql := 'select max(id) id from bamtes where idtipidoc = ' + inttostr(idtipodocB) + ' and ext_spid = ' + IntToStr(spid);
+
+    //  Lqry.SQL.Text := sql;
+    //  Lqry.Open;
+    //  id_doc := Lqry.FieldByName('id').AsInteger;
+    //  Lqry.Close;
+
+      //Lqry.SQL.Text := 'update bamtes set riferi1 = ''' + nr_spedizione + ''' where id = ' + inttostr(id_doc);
+
+      //Lqry.ExecSQL;
+      //if not Assigned(ObjBamTes) then
+      //begin
+      //  if not GetInterfOggetto('ObjBamTes', 'BamTes', IBamTesStd, ObjBamTes) then
+      //  begin
+       //   raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
+
+       // end;
+    //  end;
+
+      //ObjBamTes.Found := false;
+      //ObjBamTes.Seek('id',id_doc);
+      //if ObjBamTes.Found then
+      //begin
+      //  res := ObjBamTes.ImpostaStato('D');
+      //  if res = '' then
+      //  begin
+      //    ObjBamTes.CampiObj['stato'] := 'D';
+      //    ObjBamTes.Modifica;
+      //  end
+      //  else
+      //    MessaggioPDT('Errore nel passaggio del ddt in definitivo : '+#10+#13+res, APPTITLE,MB_OK);
+
+      //end;
+
+    //end;
+
+    {
+    if idtipodocF <> 0 then
+    begin
+      sql := 'select max(id) id from fattes where idtipidoc = ' + inttostr(idtipodocF) + ' and ext_spid = ' + IntToStr(spid);
+      Lqry.SQL.Text := sql;
+      Lqry.Open;
+      id_doc := Lqry.FieldByName('id').AsInteger;
+      Lqry.Close;
+
+      //Lqry.SQL.Text := 'update fattes set riferi1 = ''' + nr_spedizione + ''' where id = ' + inttostr(id_doc);
+      //Lqry.ExecSQL;
+    end;
+
+    if idtipodocR <> 0 then
+    begin
+      sql := 'select max(id) id from rifisc where idtipidoc = ' + inttostr(idtipodocR) + ' and ext_spid = ' + IntToStr(spid);
+      Lqry.SQL.Text := sql;
+      Lqry.Open;
+      id_doc := Lqry.FieldByName('id').AsInteger;
+      Lqry.Close;
+
+      //Lqry.SQL.Text := 'update rifisc set riferi1 = ''' + nr_spedizione + ''' where id = ' + inttostr(id_doc);
+      //Lqry.ExecSQL;
+    end;
+    }
+    //Lqry.Close;
+    //Lqry.Free;
+
+    fra_prepspedov.edtDataLotto.Clear;
+
+    fra_prepspedov.EdtNewTestata.AsString := '';
+    fra_prepspedov.EdtNumSpedizione.Clear;
+    fra_prepspedov.PgcCtrl.TabIndex := 0;
+    NewPagecontrolChange(fra_prepspedov.PgcCtrl);
+    messaggiospedizione := false;
+  end;
+end;
+
+procedure TPI_Altag_BWS.newbtninsclick(sender: TObject);
+var
+  Lidcomrig : Integer;
+  strcomrig : string;
+  qr_crig : TCSEQuery;
+  frmselcrig : tfrmcomrig;
+  book : TBookmark;
+begin
+  //if fl_inizializzazione then
+  //  exit;
+
+  Lidcomrig := 0;
+  strcomrig := '';
+  book := udmpdt.DMPDT.Qry_EVACom.GetBookmark;
+
+  udmpdt.DMPDT.Qry_EVACom.Filter := 'codice = ''' + f2artico.qryF2.FieldByName('codice').AsString;
+  udmpdt.DMPDT.Qry_EVACom.Filtered := true;
+  if udmpdt.DMPDT.Qry_EVACom.RecordCount > 1 then
+  begin
+    while not udmpdt.DMPDT.Qry_EVACom.eof do
+    begin
+      if strcomrig <> '' then
+        strcomrig := strcomrig + ',';
+      strcomrig := strcomrig + inttostr(udmpdt.DMPDT.Qry_EVACom.fieldbyname('idcomrig').asinteger);
+      udmpdt.DMPDT.Qry_EVACom.Next;
+    end;
+
+    qr_crig := TCSEQuery.Create(nil);
+    qr_crig.DataBaseName := dbexec.DatabaseName;
+    qr_crig.SQL.Text := 'select cr.id,art.codice,cr.omascm '+
+                        ' from comrig cr ' +
+                        ' join lotser ls ' +
+                        '   on ls.id = cr.idartico ' +
+                        ' join artico art ' +
+                        '   on art.id = ls.idartico ' +
+                        'where cr.id in ('+strcomrig+') ';
+
+    if DERRALIM <> 'T' then
+      qr_crig.SQL.Text := qr_crig.SQL.Text + ' and art.derralim = ''' + DERRALIM + '''';
+
+    qr_crig.Open;
+    frmselcrig := TFrmComrig.Create(self);
+    frmselcrig.DS.DataSet := qr_crig;
+    frmselcrig.Height := form.Height;
+    frmselcrig.Width := Form.Width;
+    frmselcrig.ShowModal;
+    Lidcomrig := qr_crig.FieldByName('id').AsInteger;
+    frmselcrig.Free;
+    qr_crig.Close;
+  end;
+  udmpdt.DMPDT.Qry_EVACom.Filtered := false;
+  udmpdt.DMPDT.Qry_EVACom.Filter := '';
+  udmpdt.DMPDT.Qry_EVACom.Refresh;
+  udmpdt.DMPDT.Qry_EVACom.GotoBookmark(book);
+  udmpdt.DMPDT.Qry_EVACom.FreeBookmark(book);
+
+  if Lidcomrig > 0 then
+  begin
+    if not udmpdt.DMPDT.Qry_EVACom.Locate('idcomrig',Lidcomrig,[]) then
+    begin
+      MessaggioPDT('Errore nel recupero della riga comrig',APPTITLE,MB_OK);
+      abort;
+    end;
+  end;
+
+  idcomrig := udmpdt.DMPDT.Qry_EVACom.FieldByName('idcomrig').AsInteger;
+
+  if Assigned(oldbtninsclick) then
+    oldbtninsclick(sender);
+
+  fra_prepspedov.PgcCtrl.TabIndex := 1;
+  NewPagecontrolChange(fra_prepspedov.PgcCtrl);
+  BtnCaricaBarcodeClick(sender);
+end;
+
+procedure TPI_Altag_BWS.newBtnInsclick_carOP(sender: TObject);
+var
+  Lqry : TCSEQuery;
+  SPID,
+  idmovmag : integer;
+  objMovMag: IMovMagStd;
+  qtainv,
+  qtamov,
+  qtaven : double;
+  str : string;
+  fl_mod : Boolean;
+begin
+  // mi prendo i valori prima del tasto ok per evitare che vengano sbiancati
+  fl_mod := false;
+  qtainv := edtqtaumi.AsFloat;
+  qtamov := edtqtaumm.AsFloat;
+  qtaven := edtqtaumv.AsFloat;
+
+  if Assigned(oldbtninsclick) then
+    oldbtninsclick(sender);
+
+  if not GetInterfOggetto('objMovMag', 'MOVMAG', IMovMagStd, objMovMag) then
+  begin
+    MessaggioPDT('Errore interfacciamento oggetto objmovmag',APPTITLE,mb_ok);
+    exit;
+  end;
+
+  Lqry := TCSEQuery.Create(nil);
+  Lqry.DataBaseName := DBExec.DatabaseName;
+  Lqry.SQL.Text := 'select @@spid as spid';
+  Lqry.open;
+  SPID := Lqry.FieldByName('spid').AsInteger;
+  Lqry.Close;
+  Lqry.SQL.Clear;
+  Lqry.SQL.Text := 'select max(id) as id from movmag where ext_spid = :spid and IDOPLotF is not null';
+  Lqry.ParamByName('spid').AsInteger := SPID;
+  Lqry.Open;
+  if Lqry.IsEmpty then
+  begin
+    MessaggioPDT('Errore nel recupero del movimento di magazzino',APPTITLE,MB_OK);
+  end
+  else
+  begin
+    idmovmag := Lqry.FieldByName('id').AsInteger;
+    Lqry.SQL.Text := 'select qtainv,qtamov,qtaven from movmag where id = ' + IntToStr(idmovmag);
+    Lqry.Open;
+
+    objMovMag.Found := false;
+    objMovMag.Seek('ID',idmovmag);
+    if objMovMag.Found then
+    begin
+      if qtainv <> Lqry.FieldByName('qtainv').AsFloat then
+      begin
+        objMovMag.CampiObj['qtainv'] := qtainv;
+        fl_mod := true;
+      end;
+      if qtamov <> Lqry.FieldByName('qtamov').AsFloat then
+      begin
+        objMovMag.CampiObj['qtamov'] := qtamov;
+        fl_mod := true;
+      end;
+      if qtaven <> Lqry.FieldByName('qtaven').AsFloat then
+      begin
+        objMovMag.CampiObj['qtaven'] := qtaven;
+        fl_mod := true;
+      end;
+
+      if fl_mod then
+      begin
+        objMovMag.CampiObj['idsalva'] := 1;
+        objmovmag.addgenmov;
+        str := objmovmag.GeneraMovimento(False,false);
+      end;
+    end
+    else
+    begin
+      MessaggioPDT('Non � stato possibile recuperare movimento di magazziono. id = ' + IntToStr(idmovmag),APPTITLE,MB_OK);
+    end;
+
+  end;
+  objMovMag.FreeGenMov;
+  //movmagprd.FreeMovMag;
+  Lqry.Close;
+  FreeAndNil(Lqry);
+
+end;
+
+procedure TPI_Altag_BWS.newbtnokClick(sender: TObject);
+begin
+  fl_resultok := true;
+  //nr_spedizione := InputBox('Numero di spedizione','','');
+  case Rgtipodoc.ItemIndex of
+    0:begin
+      idtipodocB := f2idtipodoc.KeyValue;
+    end;
+    1:begin
+      idtipodocF := f2idtipodoc.KeyValue;
+    end;
+    2:begin
+      idtipodocR := f2idtipodoc.KeyValue;
+    end;
+  end;
+  if Assigned(oldbtnokclick) then
+    oldbtnokclick(sender);
+end;
+
+procedure TPI_Altag_BWS.newEdtlottoOnExit(sender: TObject);
+var
+  Lqry : TCSEQuery;
+  frmSelLotto : TfrmSelLotto;
+begin
+  if Assigned(OldEdtLottoOnExit) then
+    OldEdtLottoOnExit(sender);
+
+  if not fl_inizializzazione then
+  begin
+    if (edtlotto.AsString <> '') and (edtserie.AsString = '') then
+    begin
+      Lqry := TCSEQuery.Create(nil);
+      Lqry.DataBaseName := DBExec.DatabaseName;
+      Lqry.SQL.Text := 'select numser ' +
+                       '  from lotser ls ' +
+                       '  join artico art ' +
+                       '    on art.id = ls.idartico ' +
+                       ' where art.id = ' + IntToStr(f2artico.KeyValue) +
+                       ' and ls.numlot = ''' + edtlotto.AsString + '''';
+      Lqry.Open;
+      if Lqry.IsEmpty then
+      begin
+        MessaggioPDT('Nessuna serie disponibile per il lotto ' + edtlotto.AsString,APPTITLE,mb_ok);
+      end
+      else
+      begin
+        frmSelLotto := tfrmsellotto.create(form);
+        frmSelLotto.Height := form.Height;
+        frmSelLotto.Width := form.Width;
+        frmsellotto.DataSource1.DataSet := Lqry;
+        frmSelLotto.showmodal;
+        if frmSelLotto.ModalResult = mrOk then
+        begin
+          edtserie.AsString := Lqry.FieldByName('numser').AsString;
+        end;
+        frmSelLotto.Free;
+      end;
+      Lqry.Close;
+      FreeAndNil(Lqry);
+    end;
+  end;
+end;
+
+procedure TPI_Altag_BWS.NewEdtSerieOnExit(sender: TObject);
+var
+  Lqry : TCSEQuery;
+  LqtaVen, LqtaMov, LqtaInv, Lqtaprep : double;
+  objArtico: IArticoStd;
+begin
+  if Assigned(OldEdtSerieOnExit) then
+    OldEdtSerieOnExit(sender);
+
+  //if not fl_inizializzazione then      non c'� bisogno in quanto deve valorizzare le giacenze del lotto
+  begin
+    if FF2LotSer.KeyValue > 0 then
+    begin
+      try
+         Lqry := TCSEQuery.Create(nil);
+         Lqry.DataBaseName := Azienda.DatabaseName;
+
+         Lqry.SQL.Text := 'select sum(isnull(qta3,0)) as tot from pdtrig where idlotser = ' +CS_KeyValueTo_SqlStr(FF2LotSer.KeyValue);
+         Lqry.Open;
+         Lqtaprep := Lqry.FieldByName('tot').AsFloat;
+         Lqry.Close;
+         Lqry.SQL.Text := 'SELECT QTTGIAI, QTTGIAM ' +
+                          'FROM LOTSER WHERE ID = ' + CS_KeyValueTo_SqlStr(FF2LotSer.KeyValue);
+         Lqry.Open;
+         if not Lqry.Eof then
+         begin
+
+           LqtaInv := Lqry.FieldByName('QTTGIAI').AsFloat - Lqtaprep;
+           LqtaMov := Lqry.FieldByName('QTTGIAM').AsFloat;
+           if not Assigned(objArtico) then
+             GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+           ObjArtico.Seek('ID', f2artico.KeyValue);
+           if umcomv <> 'KG' then
+           begin
+             LqtaMov := LqtaInv;
+           end;
+           LqtaVen := LqtaInv * objartico.ConvUM(ouI, orgumv);
+
+           fra_prepspedov.lblGiacenza.Caption := 'GIACENZA ' + #10+#13;
+
+           if lblqtaumv.Caption <> '[UMX]' then
+             fra_prepspedov.lblGiacenza.Caption := fra_prepspedov.lblGiacenza.Caption  + lblqtaumv.Caption + ' : ' + (Format('%.2f',[LqtaVen])) + #10+#13;
+
+           if lblqtaumm.Caption <> '[UMX]' then
+             fra_prepspedov.lblGiacenza.Caption := fra_prepspedov.lblGiacenza.Caption + lblqtaumm.Caption + ' : ' + (Format('%.2f',[LqtaMov])) + #10+#13;
+
+           if lblqtaumi.Caption <> '[UMX]' then
+             fra_prepspedov.lblGiacenza.Caption := fra_prepspedov.lblGiacenza.Caption + lblqtaumi.Caption + ' : ' + (Format('%.2f',[LqtaInv])) + #10+#13;
+
+         end;
+      finally
+        FreeAndNil(Lqry);
+      end;
+    end;
+  end;
+end;
+
+procedure TPI_Altag_BWS.NewF2ArticoKeychange(sender: TObject; newkey,
+  oldkey: integer);
+begin
+  if (newkey <> oldkey) and (newkey > 0) then
+  begin
+    if not ArticoloDerrAlim(newkey,f2bamtes.KeyValue,DERRALIM) then
+    begin
+      MessaggioPDT('L''articolo inserito non � corretto!',APPTITLE,MB_OK);
+      abort;
+    end;
+  end;
+end;
+
+procedure TPI_Altag_BWS.NewF2bamtesKeychange(sender: TObject;newkey,oldkey : integer);
+begin
+
+  if newkey <> oldkey then
+  begin
+    if fra_prepspedov.EdtNewTestata.AsString = '' then
+    begin
+      EdtTestata.AsString := IntToStr(newkey);
+      fra_prepspedov.EdtNewTestata.AsString := IntToStr(newkey);
+      if ControllaPresenzaArticoliDeteriorabili(newkey) then
+      begin
+        if messaggiopdt('Si desidera evadere articoli deteriorabili?',APPTITLE,MB_YESNO) = mrYes  then
+        begin
+          DERRALIM := 'D' ;
+          fra_prepspedov.EdtNewTestata.AsString := 'D'+inttostr(newkey);
+          fra_prepspedov.DERRALIM := 'D'
+        end
+        else
+        begin
+          DERRALIM:= 'N';
+          fra_prepspedov.EdtNewTestata.AsString := 'N'+inttostr(newkey);
+          fra_prepspedov.DERRALIM := 'N';
+        end;
+      end
+      else
+      begin
+        DERRALIM := 'T';
+        fra_prepspedov.DERRALIM := 'T';
+      end;
+    end
+    else
+    begin
+      if not ControllaPresenzaArticoliDeteriorabili(newkey) then
+      begin
+        DERRALIM := 'T';
+        fra_prepspedov.DERRALIM := 'T';
+      end;
+    end;
+  end;
+
+  if Assigned(oldf2bamteskeychange) then
+    oldf2bamteskeychange(sender,newkey,oldkey);
+
+  fra_prepspedov.lblDesVettore.Caption := GetDescrVettore(F2BamTes.QryF2.FieldByName('idvettore').AsInteger);
+
+  fra_prepspedov.QRighepreparate.Close;
+  if DERRALIM = 'T' then
+  begin
+    with(fra_prepspedov.QRighepreparate) do
+    begin
+      SQL.Text := 'select '+
+                    'cr.id as idcomrig,   '+
+                    'a.codice as codArt,  '+
+                    'a.descr as descrArt, '+
+                    'sum(isnull(p.qta1,0)) as qtaprep, '+
+                    'cr.qta1 as qtaComm,  '+
+                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
+                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
+                    'from comtes c  '+
+                    'join comrig cr on cr.IDCOMTES = c.id  '+
+                    'join lotser l on l.ID = cr.IDARTICO '+
+                    'join artico a on a.id = l.IDARTICO '+
+                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
+                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key) oa1 '+
+                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key ) oa2 '+
+                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
+                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
+                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
+                    'left join artico a2 on a2.id = l1.idartico '+
+                    'where p2.idcomrig = cr.id '+
+                    'and a2.UMM = ''kg'' '+
+                    ') oa3 '+
+                    'where c.id = :key '+
+                    'group by '+
+                    'cr.id,   '+
+                    'a.codice, '+
+                    'a.descr,  '+
+                    'cr.qta1,  '+
+                    'cr.qtaspe, '+
+                    'oa1.qtatot,  '+
+                    'oa2.qtasparata, '+
+                    'oa3.qtasparatakg,'+
+                    'cr.rigadoc '+
+                    'order by a.codice,cr.id,cr.rigadoc ';
+        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
+    end;
+
+   end
+  else
+  begin
+    with(fra_prepspedov.QRighepreparate) do
+    begin
+        SQL.Text := 'select '+
+                    'cr.id as idcomrig,   '+
+                    'a.codice as codArt,  '+
+                    'a.descr as descrArt, '+
+                    'sum(isnull(p.qta1,0)) as qtaprep, '+
+                    'cr.qta1 as qtaComm,  '+
+                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
+                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
+                    'from comtes c  '+
+                    'join comrig cr on cr.IDCOMTES = c.id  '+
+                    'join lotser l on l.ID = cr.IDARTICO '+
+                    'join artico a on a.id = l.IDARTICO '+
+                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
+                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.derralim = :derralim ) oa1 '+
+                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.DERRALIM = :derralim) oa2 '+
+                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
+                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
+                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
+                    'left join artico a2 on a2.id = l1.idartico '+
+                    'where p2.idcomrig = cr.id '+
+                    'and a2.UMM = ''kg'' '+
+                    'and a2.derralim = :derralim) oa3 '+
+                    'where c.id = :key '+
+                    'and a.derralim = :derralim  '+
+                    'group by '+
+                    'cr.id,   '+
+                    'a.codice, '+
+                    'a.descr,  '+
+                    'cr.qta1,  '+
+                    'cr.qtaspe, '+
+                    'oa1.qtatot,  '+
+                    'oa2.qtasparata, '+
+                    'oa3.qtasparatakg,'+
+                    'cr.rigadoc '+
+                    'order by a.codice,cr.id,cr.rigadoc ';
+
+        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
+        ParamByName('derralim').AsString := DERRALIM;
+    end;
+  end;
+
+  fra_prepspedov.QRighepreparate.ParamByName('key').AsInteger := newkey;
+
+  idComTes := f2bamtes.KeyValue;
+  idcomrig := 0;
+
+end;
+
+
+
+procedure TPI_Altag_BWS.NewPagecontrolChange(sender: TObject);
+begin
+  if fra_prepspedov.PgcCtrl.ActivePageIndex <> 0 then
+  begin
+    if (F2Bamtes.KeyValue = 0) then
+    begin
+      MessaggioPDT('Selezionare una commessa prima di proseguire!',APPTITLE,MB_OK);
+      fra_prepspedov.PgcCtrl.TabIndex := 0;
+      Abort;
+    end;
+    if (fra_prepspedov.EdtNumSpedizione.Asinteger = 0) then
+    begin
+      if not messaggioSpedizione then
+      begin
+        MessaggioPDT('Numero di spedizione non inserito!',APPTITLE,MB_OK);
+        messaggiospedizione := true;
+      end;
+      //fra_prepspedov.PgcCtrl.TabIndex := 0;
+      //uabort;
+    end;
+  end;
+
+  if fra_prepspedov.PgcCtrl.ActivePageIndex = 1 then
+  begin
+    fra_prepspedov.QRighepreparate.Close;
+
+    if DERRALIM = 'T' then
+    begin
+      with(fra_prepspedov.QRighepreparate) do
+      begin
+        SQL.Text := 'select '+
+                    'cr.id as idcomrig,   '+
+                    'a.codice as codArt,  '+
+                    'a.descr as descrArt, '+
+                    'sum(isnull(p.qta1,0)) as qtaprep, '+
+                    'cr.qta1 as qtaComm,  '+
+                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
+                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
+                    'from comtes c  '+
+                    'join comrig cr on cr.IDCOMTES = c.id  '+
+                    'join lotser l on l.ID = cr.IDARTICO '+
+                    'join artico a on a.id = l.IDARTICO '+
+                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
+                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key) oa1 '+
+                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key ) oa2 '+
+                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
+                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
+                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
+                    'left join artico a2 on a2.id = l1.idartico '+
+                    'where p2.idcomrig = cr.id '+
+                    'and a2.UMM = ''kg'' '+
+                    ') oa3 '+
+                    'where c.id = :key '+
+                    'group by '+
+                    'cr.id,   '+
+                    'a.codice, '+
+                    'a.descr,  '+
+                    'cr.qta1,  '+
+                    'cr.qtaspe, '+
+                    'oa1.qtatot,  '+
+                    'oa2.qtasparata, '+
+                    'oa3.qtasparatakg,'+
+                    'cr.rigadoc '+
+                    'order by a.codice,cr.id,cr.rigadoc ';
+        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
+      end;
+
+    end
+    else
+    begin
+      with(fra_prepspedov.QRighepreparate) do
+      begin
+        SQL.Text := 'select '+
+                    'cr.id as idcomrig,   '+
+                    'a.codice as codArt,  '+
+                    'a.descr as descrArt, '+
+                    'sum(isnull(p.qta1,0)) as qtaprep, '+
+                    'cr.qta1 as qtaComm,  '+
+                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
+                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
+                    'from comtes c  '+
+                    'join comrig cr on cr.IDCOMTES = c.id  '+
+                    'join lotser l on l.ID = cr.IDARTICO '+
+                    'join artico a on a.id = l.IDARTICO '+
+                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
+                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.derralim = :derralim ) oa1 '+
+                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.DERRALIM = :derralim) oa2 '+
+                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
+                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
+                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
+                    'left join artico a2 on a2.id = l1.idartico '+
+                    'where p2.idcomrig = cr.id '+
+                    'and a2.UMM = ''kg'' '+
+                    'and a2.derralim = :derralim) oa3 '+
+                    'where c.id = :key '+
+                    'and a.derralim = :derralim  '+
+                    'group by '+
+                    'cr.id,   '+
+                    'a.codice, '+
+                    'a.descr,  '+
+                    'cr.qta1,  '+
+                    'cr.qtaspe, '+
+                    'oa1.qtatot,  '+
+                    'oa2.qtasparata, '+
+                    'oa3.qtasparatakg,'+
+                    'cr.rigadoc '+
+                    'order by a.codice,cr.id,cr.rigadoc ';
+
+        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
+        ParamByName('derralim').AsString := DERRALIM;
+      end;
+
+
+    end;
+
+
+    fra_prepspedov.QRighepreparate.Open;
+    fra_prepspedov.GridRighepreparate.LoadFromIniFile;
+    fra_prepspedov.GridRighepreparate.RefreshData;
+    fra_prepspedov.lbl_cartoni.Caption := 'Colli ' + fra_prepspedov.QRighepreparate.FieldByName('qtasparata').AsString + '/' + fra_prepspedov.QRighepreparate.FieldByName('qtatot').AsString;
+    if idcomrig > 0 then
+    begin
+      fra_prepspedov.QRighepreparate.Locate('idcomrig',idcomrig,[]);
+      fra_prepspedov.GridRighepreparate.SelectedRows.CurrentRowSelected := True;
+    end;
+  end
+  else
+  begin
+    fra_prepspedov.GridRighepreparate.SaveToIniFile;
+    fra_prepspedov.QRighepreparate.Close;
+
+  end;
+end;
+
+procedure TPI_Altag_BWS.newQtaUmiOnexit(sender: TObject);
+var
+  objartico : IArticoStd;
+begin
+  if not Assigned(objArtico) then
+    GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+
+  ObjArtico.Seek('ID', f2artico.KeyValue);
+
+  edtqtaumv.AsFloat := edtqtaumi.AsFloat * objartico.ConvUM(ouI, orgumv);
+
+  if umcomv <> 'KG' then
+  begin
+    edtqtaumm.AsFloat := edtqtaumi.AsFloat;
+  end;
+
+end;
+
+procedure TPI_Altag_BWS.newQtaUmmOnexit(sender: TObject);
+var
+  objartico : IArticoStd;
+begin
+  if umcomv <> 'KG' then
+  begin
+    if not Assigned(objArtico) then
+      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+
+    ObjArtico.Seek('ID', f2artico.KeyValue);
+
+    if umcomv <> 'KG' then
+    begin
+      edtqtaumv.AsFloat := edtqtaumm.AsFloat * objartico.ConvUM(orgumconv, orgumv);
+      edtqtaumi.AsFloat := edtqtaumm.AsFloat;
+    end;
+  end;
+
+end;
+
+procedure TPI_Altag_BWS.newQtaUmvOnexit(sender: TObject);
+var
+  objartico : IArticoStd;
+begin
+  // --
+  //exit;
+  if not Assigned(objArtico) then
+      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
+
+  ObjArtico.Seek('ID', f2artico.KeyValue);
+
+
+  if not fl_inizializzazione and peso3103 and (ObjArtico.CampiObj['umrelvar2'] = -1) then
+  begin
+
+  end
+  else
+  begin
+
+    if umv <> 'KG' then
+    begin
+
+
+      if umcomv <> 'KG' then
+      begin
+        edtqtaumm.AsFloat := edtqtaumv.AsFloat *  objartico.ConvUM(orgumv,orgumconv);
+        edtqtaumi.AsFloat := edtqtaumv.AsFloat *  objartico.ConvUM(orgumv,orgumconv);
+      end
+      else
+        edtqtaumi.AsFloat := edtqtaumv.AsFloat *  objartico.ConvUM(orgumv,ouI);
+    end;
+  end;
+end;
+
+procedure TPI_Altag_BWS.NEW_BWS_BtnInsPDTInvMagOnClick(Sender: TObject);
+begin
+  if Assigned(OLD_BWS_BtnInsPDTInvMagOnClick) then
+    OLD_BWS_BtnInsPDTInvMagOnClick(Sender);
+
+  f2artico.KeyValue := 0;
+  f2artico.OnExit(f2artico);
+  edtlotto.AsString := '';
+  edtserie.AsString := '';
+  if (FIdAllMag > 0) and (FF2AllMag.KeyValue = 0) then
+  begin
+    FF2AllMag.KeyValue := FIdAllMag;
+  end;
+end;
+
+procedure TPI_Altag_BWS.NEW_BWS_BtnOkOnClick(Sender: TObject);
+begin
+  if (FF2AllMag.KeyValue > 0) and (F2Artico.KeyValue > 0)  then
+  begin
+    if MessaggioPDT('Attenzione, uscendo l''operazione corrente non verr� salvata. Uscire?', APPTITLE, MB_YESNO) = mrYes then
+    begin
+      if Assigned(OLD_BWS_BtnOkOnClick) then
+        OLD_BWS_BtnOkOnClick(Sender);
+    end
+    else
+    begin
+      // Per ora non faccio nulla
+    end;
+
+  end
+  else
+    if Assigned(OLD_BWS_BtnOkOnClick) then
+      OLD_BWS_BtnOkOnClick(Sender)
+
+
+
+end;
+
+procedure TPI_Altag_BWS.NEW_BWS_F2AllMagOnExit(Sender: TObject);
+begin
+  if Assigned(OLD_BWS_F2AllMagOnExit) then
+    OLD_BWS_F2AllMagOnExit(Sender);
+
+end;
+
+procedure TPI_Altag_BWS.NEW_BWS_F2AllMagOnKeyChange(Sender: TObject; NewKey,
+  OldKey: Integer);
+begin
+  if Assigned(OLD_BWS_F2AllMagOnKeyChange) then
+    OLD_BWS_F2AllMagOnKeyChange(Sender, NewKey, OldKey);
+
+
+  if FF2AllMag.KeyValue > 0 then
+  begin
+    FIdAllMag := FF2AllMag.KeyValue;
+    BtnLeggiBarcode.Click;
+
+    if edtqtaumi.CanFocus then
+      edtqtaumi.SetFocus;
+
+    FF2AllMag.OnExit(FF2AllMag);
+  end;
+
+end;
+
+procedure TPI_Altag_BWS.NEW_BWS_TabNewRigaOnShow(Sender: TObject);
+begin
+  if Assigned(OLD_BWS_TabNewRigaOnShow) then
+    OLD_BWS_TabNewRigaOnShow(Sender);
+
+  if edtTestata.CanFocus then
+    edtTestata.SetFocus;
+end;
+
+procedure TPI_Altag_BWS.NumSpedizioneKeydown(Sender: TObject; var Key: Word;
+  Shift: TShiftState);
+begin
+  if (key = VK_RETURN) or (key = VK_TAB) then
+  begin
+    fra_prepspedov.PgcCtrl.TabIndex := 1;
+    NewPagecontrolChange(fra_prepspedov.PgcCtrl);
+  end;
+end;
+
+procedure TPI_Altag_BWS.StartPI_CaricoOP;
+begin
+  if not GetFormComp('edtqtaumi',edtqtaumi) then
+    exit;
+  if not GetFormComp('edtqtaumm',edtqtaumm) then
+    exit;
+  if not GetFormComp('edtqtaumv',edtqtaumv) then
+    exit;
+  if not GetFormComp('btnins',btnins) then
+    exit;
+
+  oldbtninsclick := btnins.OnClick;
+  btnins.OnClick := newBtnInsclick_carOP;
+end;
+
+procedure TPI_Altag_BWS.StartPI_Inventario;
+begin
+
+
+  if not getformcomp('f2artico',f2artico) then
+    exit;
+
+  if not getformcomp('edtlotto',edtlotto) then
+    exit;
+
+  if not getformcomp('edtserie',edtserie) then
+    exit;
+
+  if not getformcomp('edtqtaumi',edtqtaumi) then
+    exit;
+
+  if not getformcomp('edtqtaumm',edtqtaumm) then
+    Exit;
+
+  if not getformcomp('edtqtaumv',edtqtaumv) then
+    Exit;
+
+  if not GetFormComp('pnlinvmag',pnlinvmag) then
+    exit;
+
+  if not GetFormComp('F2AllMag',FF2AllMag) then
+    exit;
+
+  RedirEvent('F2AllMag', 'OnExit', 'OLD_BWS_F2AllMagOnExit', 'NEW_BWS_F2AllMagOnExit');
+  RedirEvent('F2AllMag', 'OnKeyChange', 'OLD_BWS_F2AllMagOnKeyChange', 'NEW_BWS_F2AllMagOnKeyChange');
+  RedirEvent('BtnInsPDTInvMag', 'OnClick', 'OLD_BWS_BtnInsPDTInvMagOnClick', 'NEW_BWS_BtnInsPDTInvMagOnClick');
+  RedirEvent('BtnOk', 'OnClick', 'OLD_BWS_BtnOkOnClick', 'NEW_BWS_BtnOkOnClick');
+
+
+  CreaButton;
+
+  edtqtaumi.OnExit := nil;
+  edtqtaumm.OnExit := nil;
+  edtqtaumv.OnExit := nil;
+end;
+
+
+procedure TPI_Altag_BWS.StartPI_ModLot;
+var
+  LMedDatRif: TData;
+begin
+  if not getformcomp('MedDatRif',LMedDatRif) then
+    exit;
+
+  LMedDatRif.Text := scadenzaLotto;
+end;
+
+procedure TPI_Altag_BWS.StartPI_PrepSpedOV;
+begin
+  messaggioSpedizione := false;
+
+  fra_prepspedov := nil;
+
+  form.Caption := 'Prep. Sped. ' + GetVersion(DLLFileName);
+
+  if not GetFormComp('edttestata',edttestata) then
+    exit;
+
+  if not GetFormComp('f2bamtes',f2bamtes) then
+    exit;
+
+  if not GetFormComp('f2lotser',FF2LotSer) then
+    exit;
+
+  if not GetFormComp('scbdata',scbdata) then
+    exit;
+
+  if not GetFormComp('edtbarcodeunico',edtbarcodeunico) then
+    exit;
+
+  if not GetFormComp('f2artico',f2artico) then
+    exit;
+
+  if not GetFormComp('edtlotto',edtlotto) then
+    exit;
+
+  if not GetFormComp('edtserie',edtserie) then
+    exit;
+
+  if not GetFormComp('edtqtaumm',edtqtaumm) then
+    exit;
+
+  if not GetFormComp('edtqtaumv',edtqtaumv) then
+    exit;
+
+  if not GetFormComp('edtqtaumi',edtqtaumi) then
+    exit;
+
+  if not GetFormComp('edtssccda',edtssccda) then
+    exit;
+
+  if not GetFormComp('f2allmag',f2allmag) then
+    Exit;
+
+  if not GetFormComp('btnendmission',btnendmission) then
+    exit;
+
+  if not GetFormComp('btnins',btnins) then
+    exit;
+
+  if not GetFormComp('lblssccda',lblssccda) then
+    exit;
+
+  if not GetFormComp('edtssccda',edtssccda) then
+    exit;
+
+  if not GetFormComp('lblsscc',lblsscc) then
+    exit;
+
+  if not GetFormComp('pnlDescrCli',FPnlDescrCli) then
+    exit;
+
+  if not GetFormComp('pnlDatiRiga',FPnlDatiRiga) then
+    exit;
+
+  if not GetFormComp('btnins',btnins) then
+    Exit;
+
+  if not GetFormComp('btnendmission',btnendmission) then
+    Exit;
+
+  if not GetFormComp('btnsaltariga',btnsaltariga) then
+    Exit;
+
+  if not GetFormComp('btnannulla',btnannulla) then
+    Exit;
+
+  if not GetFormComp('lblbamtes',lblbamtes) then
+    exit;
+
+  if not GetFormComp('lbllotto',lbllotto) then
+    Exit;
+
+  if not GetFormComp('pnltasti',pnltasti) then
+    exit;
+
+  if not GetFormComp('pnlstdbtn',pnlstdbtn) then
+    exit;
+
+  if not GetFormComp('pnlstdstatus',pnlstdstatus) then
+    exit;
+
+  if not GetFormComp('pnlstdgen',pnlstdgen) then
+    exit;
+
+  if not GetFormComp('pnlstato',pnlstato) then
+    exit;
+
+  if not GetFormComp('stbbarra',stbbarra) then
+    exit;
+
+  if not GetFormComp('lblartico',lblartico) then
+    exit;
+
+  if not GetFormComp('lblqtaumv',lblqtaumv) then
+    Exit;
+
+  if not GetFormComp('lblqtaumm',lblqtaumm) then
+    Exit;
+
+  if not GetFormComp('lblqtaumi',lblqtaumi) then
+    Exit;
+
+  if not GetFormComp('lblvano',lblvano) then
+    Exit;
+
+  OldformOnResize := Form.OnResize;
+  Form.OnResize := NewFormOnResize;
+
+  //ModificaPrepSpedOV;
+
+  //Redirect eventi
+  //oldf2bamteskeychange := f2bamtes.OnKeyChange;
+  //f2bamtes.OnKeyChange := newf2bamteskeychange;
+
+  oldbtninsclick := btnins.onclick;
+  btnins.OnClick := newbtninsclick;
+
+  oldbtnendmissionClick := btnendmission.OnClick;
+  btnendmission.OnClick := NewBtnEndmissionClick;
+
+  //sostituzione eventi
+  oldEdtQtaumionExit := edtqtaumi.OnExit;
+  edtqtaumi.OnExit := newQtaUmiOnexit;
+
+  OldedtqtaummOnExit := edtqtaumm.OnExit;
+  edtqtaumm.OnExit := newQtaUmmOnExit;
+
+  oldedtQtaUmvOnexit := edtqtaumv.OnExit;
+  edtqtaumv.OnExit := newQtaUmvOnExit;
+
+  scbdata.SetFocus;
+
+end;
+
+procedure TPI_Altag_BWS.StartPI_ScaricoOP;
+begin
+  if not GetFormComp('btnins',btnins) then
+    exit;
+  if not GetFormComp('edtqtaumi',edtqtaumi) then
+    exit;
+  if not GetFormComp('edtqtaumm',edtqtaumm) then
+    exit;
+  if not GetFormComp('edtqtaumv',edtqtaumv) then
+    exit;
+
+  oldbtninsclick := btnins.OnClick;
+  btnins.OnClick := newbtinsclick_ScarOP;
+
+end;
+
+procedure TPI_Altag_BWS.StartPI_SELTipodoc;
+var
+  LF2Vettore: TF2;
+  LEdtColli, LedtNettoTes: TCSEdit;
+  Lqry: TCSEQuery;
+begin
+  GetFormComp('rgtipodoc',rgtipodoc);
+  GetFormComp('f2idtipidoc',f2idtipodoc);
+  GetFormComp('btnok',btnok);
+  GetFormComp('F2Vettore', LF2Vettore);
+  GetFormComp('edtColli', LEdtColli);
+  GetFormComp('edtNettoTes', LedtNettoTes);
+
+  idtipodocB := 0;
+  idtipodocF := 0;
+  idtipodocR := 0;
+
+  fl_resultok := False;
+
+  try
+    Lqry := TCSEQuery.Create(nil);
+    Lqry.DataBaseName := Azienda.DatabaseName;
+    Lqry.SQL.Text := 'SELECT IDVETTORE FROM COMTES WHERE ID = ' + CS_KeyValueTo_SqlStr(idComTes)  ;
+    Lqry.Open;
+    if not Lqry.Eof then
+      LF2Vettore.KeyValue := Lqry.FieldByName('IDVETTORE').AsInteger;
+
+    Lqry.Close;
+
+    Lqry.SQL.Text:= 'SELECT sum(qta1) AS TOTCA , SUM( ' +
+                    'CASE WHEN A.UMM = ''KG'' THEN PR.QTA2 ' +
+                    'ELSE (PR.QTA3 * A.NETTO / 1000) END) AS PESONETTO ' +
+                    'FROM PDTRIG PR ' +
+                    'LEFT JOIN LOTSER L ON L.ID = PR.IDLOTSER ' +
+                    'LEFT JOIN ARTICO A ON A.ID = L.IDARTICO ' +
+                    'WHERE IDCOMRIG IN ' +
+                    '(SELECT CR.ID FROM COMRIG CR ' +
+                    'INNER JOIN COMTES CT ON CT.ID = CR.IDCOMTES ' +
+                    'WHERE CT.ID = ' + CS_KeyValueTo_SqlStr(idComTes) + ')';
+    Lqry.Open;
+    if not Lqry.Eof then
+    begin
+      LedtColli.AsFloat := Lqry.FieldByName('TOTCA').AsFloat;
+      LedtNettoTes.AsFloat := Lqry.FieldByName('PESONETTO').AsFloat;
+    end;
+
+  finally
+    FreeAndNil(Lqry);
+  end;
+
+
+  oldbtnokclick := btnok.OnClick;
+  btnok.OnClick := newbtnokClick;
+
+  
+end;
+
+initialization
+  CSW___BPL_Identity := 'PI_Altag_BWS';
+
+  RegisterPlugIn('PI_Altag_BWS',TPI_Altag_BWS);
+
+finalization
+
+  UnregisterPlugIn('PI_Altag_BWS');
+end.
+
```
