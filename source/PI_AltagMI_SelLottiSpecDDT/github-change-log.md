# GitHub Change Log

## Plug-In
- Nome: `PI_Altag_SelLottiSpecDDT`
- Percorso locale: `C:\plugin_new\Altag\source\PI_Altag_SelLottiSpecDDT`
- Repository: `Altag`
- Branch: `all refs`
- Data estrazione: `2026-10-01T18:27:05.505826+00:00`

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
- File modificati: `source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj`
- Indicatori V500: `nessuno`
- Indicatori V600: `nessuno`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj b/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj
index 8e54635..5df2ac9 100644
--- a/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj
+++ b/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj
@@ -4,7 +4,7 @@
         <MainSource>PI_Altag_SelLottiSpecDDT.dpk</MainSource>
         <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
         <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
-        <DCC_DependencyCheckOutputName>C:\OutSamW2\PI_Altag_SelLottiSpecDDT.bpl</DCC_DependencyCheckOutputName>
+        <DCC_DependencyCheckOutputName>$(SAMDIROUT)\PI_Altag_SelLottiSpecDDT.bpl</DCC_DependencyCheckOutputName>
         <FrameworkType>None</FrameworkType>
         <ProjectVersion>14.4</ProjectVersion>
         <Base>True</Base>
@@ -92,7 +92,7 @@
         <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Base_Win32)'!=''">
-        <Debugger_HostApplication>C:\OutSamW2\SAM.exe</Debugger_HostApplication>
+        <Debugger_HostApplication>$(SAMDIROUT)\SAM.exe</Debugger_HostApplication>
         <DCC_Namespace>Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;$(DCC_Namespace)</DCC_Namespace>
     </PropertyGroup>
     <PropertyGroup Condition="'$(Base_Win64)'!=''">
@@ -120,11 +120,11 @@
         <VerInfo_Debug>True</VerInfo_Debug>
         <DCC_Description>Selezione lotti specifici in DDT per articolo generico - Debug</DCC_Description>
         <Version>7.0</Version>
-        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
-        <DCC_ObjOutput>C:\OutSamW2\DCU</DCC_ObjOutput>
-        <DCC_HppOutput>C:\OutSamW2\DCU</DCC_HppOutput>
-        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
-        <DCC_DcpOutput>C:\OutSamW2</DCC_DcpOutput>
+        <DCC_DcuOutput>$(SAMDIROUT)\DCU</DCC_DcuOutput>
+        <DCC_ObjOutput>$(SAMDIROUT)\DCU</DCC_ObjOutput>
+        <DCC_HppOutput>$(SAMDIROUT)\DCU</DCC_HppOutput>
+        <DCC_BplOutput>$(SAMDIROUT)</DCC_BplOutput>
+        <DCC_DcpOutput>$(SAMDIROUT)</DCC_DcpOutput>
         <DCC_Optimize>False</DCC_Optimize>
         <DCC_GenerateStackFrames>True</DCC_GenerateStackFrames>
         <DCC_RangeChecking>True</DCC_RangeChecking>
@@ -149,7 +149,7 @@
                     <Parameters Name="UseLauncher">False</Parameters>
                     <Parameters Name="LoadAllSymbols">True</Parameters>
                     <Parameters Name="LoadUnspecifiedSymbols">False</Parameters>
-                    <Parameters Name="HostApplication">C:\OutSamW2\SAM.exe</Parameters>
+                    <Parameters Name="HostApplication">$(SAMDIROUT)\SAM.exe</Parameters>
                 </Parameters>
                 <VersionInfo>
                     <VersionInfo Name="IncludeVerInfo">True</VersionInfo>
@@ -179,15 +179,15 @@
                     <VersionInfoKeys Name="Comments">Leonardo Burchi</VersionInfoKeys>
                 </VersionInfoKeys>
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
- File modificati: `source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dpk, source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj, source/PI_Altag_SelLottiSpecDDT/README.md, source/PI_Altag_SelLottiSpecDDT/USelLottiSpecDDT.pas, source/PI_Altag_SelLottiSpecDDT/UVarieLottiSpec.pas, source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.dfm, source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.pas`
- Indicatori V500: `dbexec, glyphlibraryindex, oledb`
- Indicatori V600: `tcsequery`
- Regole di conversione rilevate: `da validare separatamente sui contratti API`
```diff
diff --git a/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dpk b/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dpk
new file mode 100644
index 0000000..77e5a86
--- /dev/null
+++ b/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dpk
@@ -0,0 +1,40 @@
+package PI_Altag_SelLottiSpecDDT;
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
+{$WRITEABLECONST OFF}
+{$MINENUMSIZE 1}
+{$IMAGEBASE $400000}
+{$ENDIF IMPLICITBUILDING}
+{$DESCRIPTION 'Selezione lotti specifici in DDT per articolo generico'}
+{$RUNONLY}
+{$IMPLICITBUILD ON}
+
+requires
+  CSApplication;
+
+contains
+  USelLottiSpecDDT in 'USelLottiSpecDDT.pas',
+  frmSelLottiSpec in 'frmSelLottiSpec.pas' {FSelLottiSpec},
+  UVarieLottiSpec in 'UVarieLottiSpec.pas';
+
+  {$SetPEFlags $0800}
+end.
diff --git a/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj b/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj
new file mode 100644
index 0000000..8e54635
--- /dev/null
+++ b/source/PI_Altag_SelLottiSpecDDT/PI_Altag_SelLottiSpecDDT.dproj
@@ -0,0 +1,230 @@
+﻿<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
+    <PropertyGroup>
+        <ProjectGuid>{96ddeb96-73d2-4169-ae86-9fc252b8c82e}</ProjectGuid>
+        <MainSource>PI_Altag_SelLottiSpecDDT.dpk</MainSource>
+        <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
+        <DCC_DCCCompiler>DCC32</DCC_DCCCompiler>
+        <DCC_DependencyCheckOutputName>C:\OutSamW2\PI_Altag_SelLottiSpecDDT.bpl</DCC_DependencyCheckOutputName>
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
+        <DCC_IntegerOverflowCheck>true</DCC_IntegerOverflowCheck>
+        <DCC_RangeChecking>true</DCC_RangeChecking>
+        <DCC_Optimize>false</DCC_Optimize>
+        <DCC_ImageBase>00400000</DCC_ImageBase>
+        <VerInfo_Build>531</VerInfo_Build>
+        <VerInfo_MajorVer>5</VerInfo_MajorVer>
+        <DCC_Namespace>System;Xml;Data;Datasnap;Web;Soap;$(DCC_Namespace)</DCC_Namespace>
+        <VerInfo_IncludeVerInfo>True</VerInfo_IncludeVerInfo>
+        <RuntimeOnlyPackage>true</RuntimeOnlyPackage>
+        <GenPackage>true</GenPackage>
+        <DCC_Description>Selezione lotti specifici in DDT per articolo generico</DCC_Description>
+        <DCC_GenerateStackFrames>true</DCC_GenerateStackFrames>
+        <GenDll>true</GenDll>
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Selezione lotti specifici in DDT per articolo generico;FileVersion=5.0.0.531;InternalName=PI_Altag_SelLottiSpecDDT;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_SelLottiSpecDDT.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <VerInfo_Locale>1040</VerInfo_Locale>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_Win32)'!=''">
+        <Debugger_HostApplication>C:\OutSamW2\SAM.exe</Debugger_HostApplication>
+        <DCC_Namespace>Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;$(DCC_Namespace)</DCC_Namespace>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Base_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Selezione lotti specifici in DDT per articolo generico - x64;FileVersion=5.0.0.531;InternalName=PI_Altag_SelLottiSpecDDT;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_SelLottiSpecDDT.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Selezione lotti specifici in DDT per articolo generico - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Selezione lotti specifici in DDT per articolo generico;FileVersion=5.0.0.530;InternalName=PI_Altag_SelLottiSpecDDT;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_SelLottiSpecDDT.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <VerInfo_Build>530</VerInfo_Build>
+        <Version>7.0</Version>
+        <DCC_DebugInformation>False</DCC_DebugInformation>
+        <DCC_LocalDebugSymbols>False</DCC_LocalDebugSymbols>
+        <DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
+        <DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
+        <DCC_OutputDRCFile>true</DCC_OutputDRCFile>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_1_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Selezione lotti specifici in DDT per articolo generico - x64;FileVersion=5.0.0.531;InternalName=PI_Altag_SelLottiSpecDDT;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_SelLottiSpecDDT.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Selezione lotti specifici in DDT per articolo generico - x64</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Selezione lotti specifici in DDT per articolo generico - Debug;FileVersion=5.0.0.531;InternalName=PI_Altag_SelLottiSpecDDT;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_SelLottiSpecDDT.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <VerInfo_Debug>True</VerInfo_Debug>
+        <DCC_Description>Selezione lotti specifici in DDT per articolo generico - Debug</DCC_Description>
+        <Version>7.0</Version>
+        <DCC_DcuOutput>C:\OutSamW2\DCU</DCC_DcuOutput>
+        <DCC_ObjOutput>C:\OutSamW2\DCU</DCC_ObjOutput>
+        <DCC_HppOutput>C:\OutSamW2\DCU</DCC_HppOutput>
+        <DCC_BplOutput>C:\OutSamW2</DCC_BplOutput>
+        <DCC_DcpOutput>C:\OutSamW2</DCC_DcpOutput>
+        <DCC_Optimize>False</DCC_Optimize>
+        <DCC_GenerateStackFrames>True</DCC_GenerateStackFrames>
+        <DCC_RangeChecking>True</DCC_RangeChecking>
+        <DCC_IntegerOverflowCheck>True</DCC_IntegerOverflowCheck>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_OSX32)'!=''">
+        <Icns_MainIcns>$(BDS)\bin\delphi_PROJECTICNS.icns</Icns_MainIcns>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win32)'!=''">
+        <DCC_Description>Selezione lotti specifici in DDT per articolo generico</DCC_Description>
+    </PropertyGroup>
+    <PropertyGroup Condition="'$(Cfg_2_Win64)'!=''">
+        <VerInfo_Keys>CompanyName=Centro Software;FileDescription=Selezione lotti specifici in DDT per articolo generico - Debug - x64;FileVersion=5.0.0.531;InternalName=PI_Altag_SelLottiSpecDDT;LegalCopyright=Centro Software;LegalTrademarks=Centro Software;OriginalFilename=PI_Altag_SelLottiSpecDDT.bpl;ProductVersion=5.0</VerInfo_Keys>
+        <DCC_Description>Selezione lotti specifici in DDT per articolo generico - Debug - x64</DCC_Description>
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
+                    <Parameters Name="HostApplication">C:\OutSamW2\SAM.exe</Parameters>
+                </Parameters>
+                <VersionInfo>
+                    <VersionInfo Name="IncludeVerInfo">True</VersionInfo>
+                    <VersionInfo Name="AutoIncBuild">False</VersionInfo>
+                    <VersionInfo Name="MajorVer">4</VersionInfo>
+                    <VersionInfo Name="MinorVer">2</VersionInfo>
+                    <VersionInfo Name="Release">0</VersionInfo>
+                    <VersionInfo Name="Build">531</VersionInfo>
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
+                    <VersionInfoKeys Name="FileDescription">Selezione lotti specifici in DDT per articolo generico</VersionInfoKeys>
+                    <VersionInfoKeys Name="FileVersion">4.2.0.531</VersionInfoKeys>
+                    <VersionInfoKeys Name="InternalName">PI_Altag_SelLottiSpecDDT</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalCopyright">Centro Software srl</VersionInfoKeys>
+                    <VersionInfoKeys Name="LegalTrademarks"/>
+                    <VersionInfoKeys Name="OriginalFilename">PI_Altag_SelLottiSpecDDT.dproj</VersionInfoKeys>
+                    <VersionInfoKeys Name="ProductName"/>
+                    <VersionInfoKeys Name="ProductVersion"/>
+                    <VersionInfoKeys Name="Comments">Leonardo Burchi</VersionInfoKeys>
+                </VersionInfoKeys>
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
+                <Source>
+                    <Source Name="MainSource">PI_Altag_SelLottiSpecDDT.dpk</Source>
+                </Source>
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
+        <DCCReference Include="USelLottiSpecDDT.pas"/>
+        <DCCReference Include="frmSelLottiSpec.pas">
+            <Form>FSelLottiSpec</Form>
+        </DCCReference>
+        <DCCReference Include="UVarieLottiSpec.pas"/>
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
diff --git a/source/PI_Altag_SelLottiSpecDDT/README.md b/source/PI_Altag_SelLottiSpecDDT/README.md
new file mode 100644
index 0000000..44e1dad
--- /dev/null
+++ b/source/PI_Altag_SelLottiSpecDDT/README.md
@@ -0,0 +1 @@
+# plugin PI_Altag_SelLottiSpecDDT
diff --git a/source/PI_Altag_SelLottiSpecDDT/USelLottiSpecDDT.pas b/source/PI_Altag_SelLottiSpecDDT/USelLottiSpecDDT.pas
new file mode 100644
index 0000000..15a2bbf
--- /dev/null
+++ b/source/PI_Altag_SelLottiSpecDDT/USelLottiSpecDDT.pas
@@ -0,0 +1,137 @@
+(******************************************************************************
+ *                         I N F O R M A Z I O N I                            *
+ ******************************************************************************
+ Cliente : Altag
+ RI: 11091
+ Autore : Leonardo Burchi
+ Data Creazione : 15/02/2013
+ Data Ultima Modifica : 15/02/2013
+ Descrizione : Selezione lotti specifici in DDT per articolo generico
+ In DDT aggiungo la possibilit� di selezionare lotti di articolo specifico a 
+fronte di una riga di articolo generico. Gli articoli specifici hanno stessa 
+marca, gruppo e classe del generico
+ ******************************************************************************
+ *                        I S T R U Z I O N I ! ! !                           *
+ ******************************************************************************
+ SAM.CFG
+ [Moduli]
+ PI_Altag_SelLottiSpecDDT=Selezione lotti specifici in DDT per articolo generico
+
+ Extfun.ini
+ [FrmBolle]
+ AUTORUN=PI_Altag_SelLottiSpecDDT.AvviaDDT
+*)
+unit USelLottiSpecDDT;
+
+interface
+
+uses
+  S3Plugin, System.Classes, System.SysUtils, CSToolBar, Vcl.Forms, FrmSelLottiSpec,
+  SMDBGrid, UVarie, Winapi.Windows, CompF2, Vcl.StdCtrls, S3Registry, IBase,
+  UVArieLottiSpec;
+
+type
+TSelLottiSpecDDT = class(TCustomPlugIn)
+private
+  procedure AddButton;
+published
+  procedure ClickBtn(Sender: TObject);
+  procedure avviaDDT;
+end;
+
+
+implementation
+
+uses UCoreTipi, CSFileCfg;
+
+procedure TSelLottiSpecDDT.AddButton;
+var
+  PnlSpeedBar: TCSToolBar;
+  BtnAdded: TCSToolBarButton;
+begin
+  if not GetFormComp('CSToolbar1', PnlSpeedBar) then
+    exit;
+  PnlSpeedBar.AddToolBarControl(TCSToolBarSeparator.Create(PnlSpeedBar));
+  BtnAdded := TCSToolBarButton.Create(PnlSpeedBar);
+  BtnAdded.ShowCaption := true;
+  BtnAdded.Caption := 'Materie Prime';
+  BtnAdded.Hint := 'Seleziona lotti formato';
+  BtnAdded.OnClick := ClickBtn;
+  BtnAdded.GlyphLibraryIndex := 302;
+  PnlSpeedBar.AddToolBarControl(BtnAdded);
+end;
+
+procedure TSelLottiSpecDDT.ClickBtn(Sender: TObject);
+var frm: TFSelLottiSpec;
+    dbgrComRig: TSMDBGrid;
+    F2IDCauMovRig: TF2;
+    iniFile: TCSFileCfg;
+    idCauMovFatRig: integer;
+    edtPosRif: TEdit;
+    idMarche: TStringList;
+    ObjArtico: IArticoStd;
+begin
+  GetFormComp('dbgrComRig',dbgrComRig);
+  GetFormComp('F2IDCauMovRig', F2IDCauMovRig);
+  GetFormComp('edtPosRif',edtPosRif);
+  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
+
+  if dbgrComRig.DataSource.DataSet.FieldByName('IDARTICO').AsInteger = 0 then
+  begin
+    Messaggio('E'' necessario selezionare una riga con articolo compilato',Application.Title,MB_ICONINFORMATION + MB_OK);
+    exit;
+  end;
+
+  iniFile := TCSFileCfg.Create(Glo.UserPath + 'PI_Altag_SelLottiSpecDDT.ini');
+
+  IDCauMovFatRig := iniFile.ReadInteger('IDCAUFATRIG','IDCAUMOVFATRIG',0);
+
+  idMArche := TStringList.Create;
+  idMarche.CommaText := iniFile.ReadString('IDMARCHE','IDMARCHE','');
+
+  ObjArtico.Seek('ID',getIDArticoFromLotser(dbgrComRig.DataSource.DataSet.FieldByName('IDARTICO').AsInteger));
+
+  if F2IDCauMovRig.KeyValue = idCauMovFatRig then
+  begin
+    Messaggio('E'' necessario selezionare una riga con causale diversa',Application.Title,MB_ICONINFORMATION + MB_OK);
+    exit;
+  end;
+
+
+  frm := TFSelLottiSpec.Create(Self);
+
+  try
+    frm.IDFatRig := dbgrComRig.DataSource.DataSet.FieldByName('ID').AsInteger;
+    frm.IDLotSer := dbgrComRig.DataSource.DataSet.FieldByName('IDARTICO').AsInteger;
+
+    if idMarche.IndexOf(ObjArtico.CampiObj['IDMARCHE']) >= 0 then
+    begin
+      frm.PosRif := edtPosRif.Text;
+    end
+    else
+      frm.posrif := '';
+
+    frm.ShowModal;
+
+    dbgrComRig.RefreshData;
+
+  finally
+    freeandnil(frm);
+  end;
+end;
+
+procedure TSelLottiSpecDDT.avviaDDT;
+begin
+  addButton;
+end;
+
+
+initialization
+  // Identificativo modulo
+  CSW___BPL_Identity :='PI_Altag_SelLottiSpecDDT';
+
+  RegisterPlugIn('PI_Altag_SelLottiSpecDDT', TSelLottiSpecDDT);
+finalization
+  UnRegisterPlugIn('PI_Altag_SelLottiSpecDDT');
+
+end.
diff --git a/source/PI_Altag_SelLottiSpecDDT/UVarieLottiSpec.pas b/source/PI_Altag_SelLottiSpecDDT/UVarieLottiSpec.pas
new file mode 100644
index 0000000..c1bc035
--- /dev/null
+++ b/source/PI_Altag_SelLottiSpecDDT/UVarieLottiSpec.pas
@@ -0,0 +1,64 @@
+unit UVarieLottiSpec;
+
+interface
+uses CSETables, S3DB, UCoreDB, RSQL, UCoreTipi, System.SysUtils;
+
+function getIDLotserDef(idArtico: integer): integer;
+function getIDArticoFromLotser(idLotser: integer): integer;
+
+implementation
+
+function getIDArticoFromLotser(idLotser: integer): integer;
+var sql, err: string;
+    qry: TCSEQuery;
+begin
+  Result := 0;
+
+  qry := TCSEQuery.Create(nil);
+  try
+    qry.DataBaseName := DBExec.DatabaseName;
+    sql := 'SELECT IDARTICO ' +
+           'FROM LOTSER ' +
+           'WHERE ID = ' + CS_KeyValueTo_SqlStr(idLotser);
+
+    err := CS_OpenQry(sql,qry);
+
+    if (err <> '') OR qry.Eof then
+      exit;
+
+    Result := qry.FieldByName('IDARTICO').AsInteger;
+    
+  finally
+    freeandnil(qry);
+  end;
+
+end;
+
+function getIDLotserDef(idArtico: integer): integer;
+var sql, err: string;
+    qry: TCSEQuery;
+begin
+  Result := 0;
+
+  qry := TCSEQuery.Create(nil);
+  try
+    qry.DataBaseName := DBExec.DatabaseName;
+    sql := 'SELECT ID ' +
+           'FROM LOTSER ' +
+           'WHERE IDARTICO = ' + CS_KeyValueTo_SqlStr(idArtico) + ' ' +
+                 'AND NUMLOT = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ' ' +
+                 'AND NUMSER = ' + CS_VariantTo_SqlStr(NUMSERDEF);
+    err := CS_OpenQry(sql,qry);
+
+    if (err <> '') OR qry.Eof then
+      exit;
+
+    Result := qry.FieldByName('ID').AsInteger;
+    
+  finally
+    freeandnil(qry);
+  end;
+
+end;
+
+end.
diff --git a/source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.dfm b/source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.dfm
new file mode 100644
index 0000000..2f7ded6
--- /dev/null
+++ b/source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.dfm
@@ -0,0 +1,1217 @@
+inherited FSelLottiSpec: TFSelLottiSpec
+  Left = 391
+  Top = 248
+  HelpContext = 274
+  BorderIcons = [biSystemMenu]
+  Caption = 'Seleziona Lotto Specifico'
+  ClientHeight = 502
+  ClientWidth = 1020
+  OnShow = CSfrmBaseShow
+  ExplicitWidth = 1036
+  ExplicitHeight = 541
+  PixelsPerInch = 96
+  TextHeight = 13
+  inherited PnlStdGen: TPanel
+    Top = 461
+    Width = 1020
+    ExplicitTop = 461
+    ExplicitWidth = 1020
+    inherited PnlStdBtn: TPanel
+      Left = 843
+      ExplicitLeft = 843
+    end
+    inherited PnlStdStatus: TPanel
+      Width = 843
+      ExplicitWidth = 843
+      inherited pnlTag: TPanel
+        Width = 843
+        ExplicitWidth = 843
+        inherited TagList: TCSTagListEditor
+          Width = 808
+          ExplicitWidth = 808
+        end
+      end
+    end
+  end
+  object Panel5: TPanel
+    Left = 0
+    Top = 0
+    Width = 1020
+    Height = 65
+    Align = alTop
+    TabOrder = 1
+    object GroupBox3: TGroupBox
+      Left = 1
+      Top = 1
+      Width = 1018
+      Height = 57
+      Align = alTop
+      Caption = 'Informazioni Riga di Commessa'
+      Enabled = False
+      TabOrder = 0
+      object Label1: TLabel
+        Left = 3
+        Top = 17
+        Width = 81
+        Height = 13
+        Caption = 'Articolo Generico'
+      end
+      object Label4: TLabel
+        Left = 503
+        Top = 17
+        Width = 17
+        Height = 13
+        Caption = 'Qta'
+      end
+      object lblQta3: TLabel
+        Left = 566
+        Top = 36
+        Width = 15
+        Height = 13
+        Caption = 'KG'
+      end
+      object Label2: TLabel
+        Left = 588
+        Top = 36
+        Width = 56
+        Height = 13
+        Caption = 'Tot. Inserito'
+        Font.Charset = DEFAULT_CHARSET
+        Font.Color = clWindowText
+        Font.Height = -11
+        Font.Name = 'MS Sans Serif'
+        Font.Style = []
+        ParentFont = False
+      end
+      object Label6: TLabel
+        Left = 332
+        Top = 17
+        Width = 17
+        Height = 13
+        Caption = 'Qta'
+      end
+      object Label7: TLabel
+        Left = 418
+        Top = 17
+        Width = 17
+        Height = 13
+        Caption = 'Qta'
+      end
+      object lblQta1: TLabel
+        Left = 393
+        Top = 36
+        Width = 15
+        Height = 13
+        Caption = 'KG'
+      end
+      object lblQta2: TLabel
+        Left = 479
+        Top = 36
+        Width = 15
+        Height = 13
+        Caption = 'KG'
+      end
+      object Label10: TLabel
+        Left = 648
+        Top = 17
+        Width = 17
+        Height = 13
+        Caption = 'Qta'
+      end
+      object lblQta3rim: TLabel
+        Left = 889
+        Top = 36
+        Width = 15
+        Height = 13
+        Caption = 'KG'
+      end
+      object Label12: TLabel
+        Left = 823
+        Top = 17
+        Width = 17
+        Height = 13
+        Caption = 'Qta'
+      end
+      object lblQta2Rim: TLabel
+        Left = 799
+        Top = 36
+        Width = 15
+        Height = 13
+        Caption = 'KG'
+      end
+      object Label14: TLabel
+        Left = 734
+        Top = 17
+        Width = 17
+        Height = 13
+        Caption = 'Qta'
+      end
+      object lblQta1Rim: TLabel
+        Left = 709
+        Top = 36
+        Width = 15
+        Height = 13
+        Caption = 'KG'
+      end
+      object lblSpessore: TLabel
+        Left = 929
+        Top = 17
+        Width = 44
+        Height = 13
+        Caption = 'Spessore'
+      end
+      object F2IDArticoGen: TF2
+        Left = 3
+        Top = 32
+        Width = 323
+        Height = 21
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
+        F2Table = ArticoC
+        EmptyOk = True
+        OpenThread = False
+        GridWidth = 500
+        GridHeight = 160
+        DropDownAlign = daLeft
+        DropDownWidth = 500
+        ReadOnly = True
+        DropDownRows = 0
+      end
+      object edtQta3: TCSEdit
+        Left = 503
+        Top = 32
+        Width = 55
+        Height = 21
+        DataType = dtNumerico
+        TabOrder = 1
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
+      object edtQta1Rim: TCSEdit
+        Left = 648
+        Top = 32
+        Width = 55
+        Height = 21
+        DataType = dtNumerico
+        TabOrder = 2
+        Alignment = taRightJustify
+        AllowNegative = True
+        AutoMode = amDisable
+        BlankWhenZero = False
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
+      object edtQta2: TCSEdit
+        Left = 418
+        Top = 33
+        Width = 55
+        Height = 21
+        DataType = dtNumerico
+        TabOrder = 3
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
+      object edtQta1: TCSEdit
+        Left = 332
+        Top = 32
+        Width = 55
+        Height = 21
+        DataType = dtNumerico
+        TabOrder = 4
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
+      object edtQta3Rim: TCSEdit
+        Left = 823
+        Top = 32
+        Width = 55
+        Height = 21
+        DataType = dtNumerico
+        TabOrder = 5
+        Alignment = taRightJustify
+        AllowNegative = True
+        AutoMode = amDisable
+        BlankWhenZero = False
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
+      object edtQta2Rim: TCSEdit
+        Left = 734
+        Top = 32
+        Width = 55
+        Height = 21
+        DataType = dtNumerico
+        TabOrder = 6
+        Alignment = taRightJustify
+        AllowNegative = True
+        AutoMode = amDisable
+        BlankWhenZero = False
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
+    end
+    object edtSpessore: TCSEdit
+      Left = 929
+      Top = 33
+      Width = 80
+      Height = 21
+      TabOrder = 1
+      OnExit = edtSpessoreExit
+      Alignment = taLeftJustify
+      AllowNegative = False
+      AutoMode = amDisable
+      BlankWhenZero = False
+      Century = False
+      ColorOnFocus = clYellow
+      DigitsDec = 0
+      DigitsInt = 0
+      FormatZero = fzNothing
+      MaxTimeUnit = tuOre
+      MinTimeUnit = tuSecondi
+      PercSign = False
+      Seconds = False
+      ThousandSep = False
+      ControlloData = True
+    end
+  end
+  object Panel6: TPanel
+    Left = 0
+    Top = 65
+    Width = 1020
+    Height = 396
+    Align = alClient
+    TabOrder = 2
+    object CSSplitter1: TCSSplitter
+      Left = 1
+      Top = 201
+      Width = 1018
+      Height = 5
+      Cursor = crVSplit
+      Align = alTop
+      Appearance.BorderColor = clNone
+      Appearance.BorderColorHot = clNone
+      Appearance.Color = clWhite
+      Appearance.ColorTo = clSilver
+      Appearance.ColorHot = clWhite
+      Appearance.ColorHotTo = clGray
+      GripStyle = sgDots
+      ExplicitWidth = 194
+    end
+    object Panel2: TPanel
+      Left = 1
+      Top = 206
+      Width = 1018
+      Height = 189
+      Align = alClient
+      BevelOuter = bvNone
+      TabOrder = 0
+      object Panel3: TPanel
+        Left = 0
+        Top = 0
+        Width = 1018
+        Height = 97
+        Align = alTop
+        BevelOuter = bvNone
+        TabOrder = 0
+        object GroupBox4: TGroupBox
+          Left = 0
+          Top = 0
+          Width = 1018
+          Height = 97
+          Align = alClient
+          Caption = 'Lotto Specifico Selezionato'
+          TabOrder = 0
+          object Label3: TLabel
+            Left = 7
+            Top = 16
+            Width = 71
+            Height = 13
+            Caption = 'Lotto Specifico'
+          end
+          object Label5: TLabel
+            Left = 195
+            Top = 17
+            Width = 44
+            Height = 13
+            Caption = 'Qta UMV'
+            Visible = False
+          end
+          object lblUM1Spec: TLabel
+            Left = 255
+            Top = 34
+            Width = 15
+            Height = 13
+            Caption = 'KG'
+            Visible = False
+          end
+          object Label8: TLabel
+            Left = 281
+            Top = 17
+            Width = 46
+            Height = 13
+            Caption = 'Qta UMM'
+          end
+          object lblUM2Spec: TLabel
+            Left = 340
+            Top = 34
+            Width = 15
+            Height = 13
+            Caption = 'KG'
+          end
+          object lblUm3SPec: TLabel
+            Left = 424
+            Top = 34
+            Width = 15
+            Height = 13
+            Caption = 'KG'
+          end
+          object Label13: TLabel
+            Left = 365
+            Top = 17
+            Width = 40
+            Height = 13
+            Caption = 'Qta UMI'
+          end
+          object Label9: TLabel
+            Left = 458
+            Top = 17
+            Width = 24
+            Height = 13
+            Caption = 'Base'
+          end
+          object Label11: TLabel
+            Left = 534
+            Top = 34
+            Width = 7
+            Height = 13
+            Caption = 'X'
+          end
+          object Label15: TLabel
+            Left = 552
+            Top = 16
+            Width = 34
+            Height = 13
+            Caption = 'Altezza'
+          end
+          object Label16: TLabel
+            Left = 640
+            Top = 16
+            Width = 43
+            Height = 13
+            Caption = 'N. Lastre'
+          end
+          object Label17: TLabel
+            Left = 622
+            Top = 34
+            Width = 7
+            Height = 13
+            Caption = 'X'
+          end
+          object Label18: TLabel
+            Left = 459
+            Top = 54
+            Width = 62
+            Height = 13
+            Caption = 'Riferimento 3'
+          end
+          object F2IDLotSer: TF2
+            Left = 5
+            Top = 31
+            Width = 182
+            Height = 21
+            BevelOuter = bvNone
+            BorderStyle = bsSingle
+            Enabled = False
+            ParentShowHint = False
+            ShowHint = True
+            TabOrder = 0
+            NumCol = 0
+            BtnEnabled = False
+            ListFieldIndex = 0
+            KeyValue = 0
+            MultiSelez = False
+            ReadBarcode = False
+            F2Table = LotSer
+            EmptyOk = True
+            OpenThread = False
+            GridWidth = 400
+            GridHeight = 160
+            DropDownAlign = daLeft
+            DropDownWidth = 400
+            ReadOnly = True
+            DropDownRows = 0
+          end
+          object edtQta1Sel: TCSEdit
+            Left = 193
+            Top = 31
+            Width = 55
+            Height = 21
+            DataType = dtNumerico
+            TabOrder = 1
+            Visible = False
+            OnExit = edtQta1SelExit
+            Alignment = taRightJustify
+            AllowNegative = True
+            AutoMode = amDisable
+            BlankWhenZero = True
+            Century = False
+            ColorOnFocus = clYellow
+            DigitsDec = 3
+            DigitsInt = 15
+            FormatZero = fzNothing
+            MaxTimeUnit = tuOre
+            MinTimeUnit = tuSecondi
+            PercSign = False
+            Seconds = False
+            ThousandSep = True
+            ControlloData = True
+          end
+          object btnSel: TCSBitBtn
+            Left = 236
+            Top = 58
+            Width = 181
+            Height = 31
+            Hint = 'Aggiungi al DDT'
+            Caption = 'Aggiungi'
+            ParentShowHint = False
+            ShowHint = True
+            TabOrder = 2
+            OnClick = btnSelClick
+            GlyphLibraryIndex = 460
+          end
+          object edtQta2Sel: TCSEdit
+            Left = 279
+            Top = 31
+            Width = 55
+            Height = 21
+            DataType = dtNumerico
+            TabOrder = 3
+            OnExit = edtQta2SelExit
+            Alignment = taRightJustify
+            AllowNegative = True
+            AutoMode = amDisable
+            BlankWhenZero = True
+            Century = False
+            ColorOnFocus = clYellow
+            DigitsDec = 3
+            DigitsInt = 15
+            FormatZero = fzNothing
+            MaxTimeUnit = tuOre
+            MinTimeUnit = tuSecondi
+            PercSign = False
+            Seconds = False
+            ThousandSep = True
+            ControlloData = True
+          end
+          object edtQta3Sel: TCSEdit
+            Left = 362
+            Top = 31
+            Width = 55
+            Height = 21
+            DataType = dtNumerico
+            TabOrder = 4
+            OnExit = edtQta3SelExit
+            Alignment = taRightJustify
+            AllowNegative = True
+            AutoMode = amDisable
+            BlankWhenZero = True
+            Century = False
+            ColorOnFocus = clYellow
+            DigitsDec = 3
+            DigitsInt = 15
+            FormatZero = fzNothing
+            MaxTimeUnit = tuOre
+            MinTimeUnit = tuSecondi
+            PercSign = False
+            Seconds = False
+            ThousandSep = True
+            ControlloData = True
+          end
+          object CSBitBtn1: TCSBitBtn
+            Left = 2
+            Top = 58
+            Width = 181
+            Height = 31
+            Caption = 'Elimina'
+            TabOrder = 5
+            OnClick = CSBitBtn1Click
+            GlyphLibraryIndex = 101
+          end
+          object edtBase: TCSEdit
+            Left = 456
+            Top = 31
+            Width = 66
+            Height = 21
+            DataType = dtNumerico
+            TabOrder = 6
+            Alignment = taRightJustify
+            AllowNegative = True
+            AutoMode = amDisable
+            BlankWhenZero = False
+            Century = False
+            ColorOnFocus = clYellow
+            DigitsDec = 3
+            DigitsInt = 15
+            FormatZero = fzNothing
+            MaxTimeUnit = tuOre
+            MinTimeUnit = tuSecondi
+            PercSign = False
+            Seconds = False
+            ThousandSep = True
+            ControlloData = True
+          end
+          object edtAlt: TCSEdit
+            Left = 549
+            Top = 31
+            Width = 66
+            Height = 21
+            DataType = dtNumerico
+            TabOrder = 7
+            Alignment = taRightJustify
+            AllowNegative = True
+            AutoMode = amDisable
+            BlankWhenZero = False
+            Century = False
+            ColorOnFocus = clYellow
+            DigitsDec = 3
+            DigitsInt = 15
+            FormatZero = fzNothing
+            MaxTimeUnit = tuOre
+            MinTimeUnit = tuSecondi
+            PercSign = False
+            Seconds = False
+            ThousandSep = True
+            ControlloData = True
+          end
+          object CSBitBtn2: TCSBitBtn
+            Left = 709
+            Top = 27
+            Width = 76
+            Height = 26
+            Caption = 'Calcola'
+            TabOrder = 9
+            OnClick = CSBitBtn2Click
+            GlyphLibraryIndex = 0
+          end
+          object edtNum: TCSEdit
+            Left = 638
+            Top = 31
+            Width = 65
+            Height = 21
+            DataType = dtNumerico
+            TabOrder = 8
+            Alignment = taRightJustify
+            AllowNegative = True
+            AutoMode = amDisable
+            BlankWhenZero = False
+            Century = False
+            ColorOnFocus = clYellow
+            DigitsDec = 3
+            DigitsInt = 15
+            FormatZero = fzNothing
+            MaxTimeUnit = tuOre
+            MinTimeUnit = tuSecondi
+            PercSign = False
+            Seconds = False
+            ThousandSep = True
+            ControlloData = True
+          end
+          object edtRiferi3: TCSEdit
+            Left = 458
+            Top = 68
+            Width = 245
+            Height = 21
+            TabOrder = 10
+            Alignment = taLeftJustify
+            AllowNegative = False
+            AutoMode = amDisable
+            BlankWhenZero = False
+            Century = False
+            ColorOnFocus = clYellow
+            DigitsDec = 0
+            DigitsInt = 0
+            FormatZero = fzNothing
+            MaxTimeUnit = tuOre
+            MinTimeUnit = tuSecondi
+            PercSign = False
+            Seconds = False
+            ThousandSep = False
+            ControlloData = True
+          end
+        end
+      end
+      object Panel4: TPanel
+        Left = 0
+        Top = 97
+        Width = 1018
+        Height = 92
+        Align = alClient
+        BevelOuter = bvNone
+        TabOrder = 1
+        object GroupBox2: TGroupBox
+          Left = 0
+          Top = 0
+          Width = 1018
+          Height = 92
+          Align = alClient
+          Caption = 'Lotti Specifici Selezionati'
+          TabOrder = 0
+          object smdbgLottiSel: TSMDBGrid
+            Left = 2
+            Top = 15
+            Width = 1014
+            Height = 75
+            ExOptions = [eoKeepSelection, eoStandardPopup]
+            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
+            KeyField = 'ID'
+            WidthOfIndicator = 14
+            ScrollBars = ssHorizontal
+            ColCount = 12
+            RowCount = 2
+            Col = 1
+            Row = 1
+            Align = alClient
+            DataSource = dsLottiSel
+            TabOrder = 0
+            TitleFont.Charset = DEFAULT_CHARSET
+            TitleFont.Color = clWindowText
+            TitleFont.Height = -11
+            TitleFont.Name = 'MS Sans Serif'
+            TitleFont.Style = []
+            Columns = <
+              item
+                Expanded = False
+                FieldName = 'CODICE'
+                Title.Caption = 'Cod. Art.'
+                Visible = True
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'DEsCR'
+                Title.Caption = 'Descr. Art.'
+                Visible = True
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'NUMLOT'
+                Title.Caption = 'Num. Lot.'
+                Visible = True
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'NUMSER'
+                Title.Caption = 'Num. Ser.'
+                Visible = True
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'QTAINV'
+                Title.Caption = 'Qta Inv. Lotto'
+                Visible = True
+                DataType = dtNumerico
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'QTA1'
+                Title.Caption = 'Qta 1 Bolla'
+                Visible = True
+                DataType = dtNumerico
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'UM1'
+                Title.Caption = 'UM 1 Bolla'
+                Visible = True
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'QTA2'
+                Title.Caption = 'Qta 2 Bolla'
+                Visible = True
+                DataType = dtNumerico
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'UM2'
+                Title.Caption = 'UM 2 Bolla'
+                Visible = True
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'QTA3'
+                Title.Caption = 'Qta 3 Bolla'
+                Visible = True
+                DataType = dtNumerico
+                DigitsDec = 3
+                DigitsInt = 15
+              end
+              item
+                Expanded = False
+                FieldName = 'UM3'
+                Title.Caption = 'UM 3 Bolla'
+                Visible = True
+                DigitsDec = 3
+                DigitsInt = 15
+              end>
+          end
+        end
+      end
+    end
+    object Panel1: TPanel
+      Left = 1
+      Top = 1
+      Width = 1018
+      Height = 200
+      Align = alTop
+      BevelOuter = bvNone
+      TabOrder = 1
+      object Panel8: TPanel
+        Left = 0
+        Top = 0
+        Width = 1018
+        Height = 200
+        Align = alClient
+        TabOrder = 0
+        object CSSplitter2: TCSSplitter
+          Left = 561
+          Top = 1
+          Width = 5
+          Height = 198
+          Align = alRight
+          Appearance.BorderColor = clNone
+          Appearance.BorderColorHot = clNone
+          Appearance.Color = clWhite
+          Appearance.ColorTo = clSilver
+          Appearance.ColorHot = clWhite
+          Appearance.ColorHotTo = clGray
+          GripStyle = sgDots
+          ExplicitLeft = 612
+        end
+        object Panel7: TPanel
+          Left = 566
+          Top = 1
+          Width = 451
+          Height = 198
+          Align = alRight
+          TabOrder = 0
+          object GroupBox5: TGroupBox
+            Left = 1
+            Top = 1
+            Width = 449
+            Height = 196
+            Align = alClient
+            Caption = 'Lotti gi'#224' in spedizione per l'#39'articolo'
+            TabOrder = 0
+            object smdbgLottoDDT: TSMDBGrid
+              Left = 2
+              Top = 15
+              Width = 445
+              Height = 179
+              ExOptions = [eoKeepSelection, eoStandardPopup]
+              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
+              KeyField = 'ID'
+              WidthOfIndicator = 14
+              ScrollBars = ssHorizontal
+              ColCount = 13
+              RowCount = 2
+              Col = 1
+              Row = 1
+              Align = alClient
+              DataSource = dsLottoDDT
+              TabOrder = 0
+              TitleFont.Charset = DEFAULT_CHARSET
+              TitleFont.Color = clWindowText
+              TitleFont.Height = -11
+              TitleFont.Name = 'MS Sans Serif'
+              TitleFont.Style = []
+              Columns = <
+                item
+                  Expanded = False
+                  FieldName = 'QTA1'
+                  Title.Caption = 'Qta 1'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'UM1'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'QTA2'
+                  Title.Caption = 'Qta 2'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'UM2'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'QTA3'
+                  Title.Caption = 'Qta 3'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'UM3'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'DEsCR1'
+                  Title.Caption = 'Cliente'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'ANNDOC'
+                  Title.Caption = 'Anno DDT'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'NUMDOC'
+                  Title.Caption = 'Num. Doc.'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'DATDOC'
+                  Title.Caption = 'Data DDT'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'NUMLOT'
+                  Title.Caption = 'Lotto'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'NUMSER'
+                  Title.Caption = 'Num. Ser.'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end>
+            end
+          end
+        end
+        object Panel9: TPanel
+          Left = 1
+          Top = 1
+          Width = 560
+          Height = 198
+          Align = alClient
+          Caption = 'Panel9'
+          TabOrder = 1
+          object GroupBox1: TGroupBox
+            Left = 1
+            Top = 1
+            Width = 558
+            Height = 196
+            Align = alClient
+            Caption = 'Lotti Specifici Giacenti'
+            TabOrder = 0
+            object smdbgLottoSpec: TSMDBGrid
+              Left = 2
+              Top = 15
+              Width = 554
+              Height = 179
+              ExOptions = [eoKeepSelection, eoStandardPopup]
+              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
+              KeyField = 'ID'
+              WidthOfIndicator = 14
+              ScrollBars = ssHorizontal
+              ColCount = 13
+              RowCount = 2
+              Col = 1
+              Row = 1
+              Align = alClient
+              DataSource = dsLottoSpec
+              TabOrder = 0
+              TitleFont.Charset = DEFAULT_CHARSET
+              TitleFont.Color = clWindowText
+              TitleFont.Height = -11
+              TitleFont.Name = 'MS Sans Serif'
+              TitleFont.Style = []
+              Columns = <
+                item
+                  Expanded = False
+                  FieldName = 'CODICE'
+                  Title.Caption = 'Cod. Art.'
+                  Width = 100
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'DESCR'
+                  Title.Caption = 'Descr. Art.'
+                  Width = 200
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'NUMLOT'
+                  Title.Caption = 'Num. Lot.'
+                  Width = 80
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'NUMSER'
+                  Title.Caption = 'Num. Ser.'
+                  Width = 70
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'CODCLASSI'
+                  Title.Caption = 'Cod. Classe'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'DESCRCLASSI'
+                  Title.Caption = 'Descr. Classe'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'DESCRCATOMO'
+                  Title.Caption = 'Descr. Cat.'
+                  Visible = True
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'QTTGIAI'
+                  Title.Caption = 'Qta Giac.'
+                  Width = 50
+                  Visible = True
+                  DataType = dtNumerico
+                  BlankWhenZero = False
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'QTTSPEI'
+                  Title.Caption = 'Qta Sped.'
+                  Width = 50
+                  Visible = True
+                  DataType = dtNumerico
+                  BlankWhenZero = False
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'QTTIMPI'
+                  Title.Caption = 'Qta Imp.'
+                  Width = 50
+                  Visible = True
+                  DataType = dtNumerico
+                  BlankWhenZero = False
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'QTTORDI'
+                  Title.Caption = 'Qta Ord.'
+                  Width = 50
+                  Visible = True
+                  DataType = dtNumerico
+                  BlankWhenZero = False
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end
+                item
+                  Expanded = False
+                  FieldName = 'QTTDISPI'
+                  Title.Caption = 'Qta Disp.'
+                  Width = 50
+                  Visible = True
+                  DataType = dtNumerico
+                  BlankWhenZero = False
+                  DigitsDec = 3
+                  DigitsInt = 15
+                end>
+            end
+          end
+        end
+      end
+    end
+  end
+  object dsLottoSpec: TDataSource
+    DataSet = qryLottoSpec
+    OnDataChange = dsLottoSpecDataChange
+    Left = 48
+    Top = 192
+  end
+  object qryLottoSpec: TQueryPars
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 80
+    Top = 192
+  end
+  object qryLottiSel: TQueryPars
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 632
+    Top = 408
+  end
+  object dsLottiSel: TDataSource
+    DataSet = qryLottiSel
+    Left = 568
+    Top = 408
+  end
+  object dsLottoDDT: TDataSource
+    DataSet = qryLottoDDT
+    Left = 656
+    Top = 208
+  end
+  object qryLottoDDT: TQueryPars
+    MultipleResults = False
+    CommandText = ''
+    EnableBCD = True
+    Unidirectional = True
+    Left = 688
+    Top = 208
+  end
+end
diff --git a/source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.pas b/source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.pas
new file mode 100644
index 0000000..07d0429
--- /dev/null
+++ b/source/PI_Altag_SelLottiSpecDDT/frmSelLottiSpec.pas
@@ -0,0 +1,802 @@
+unit frmSelLottiSpec;
+
+interface
+
+uses
+  Winapi.Windows, System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
+  Vcl.StdCtrls, Vcl.ExtCtrls, FRMSTD,CStd, UCoreTipi, SMDBGrid, Data.DB,
+  CSETables, QueryPars, Compf2, CSEdit, IBase, S3Registry, UVarie, RSQL,
+  IVendite, CSButtons, CSSplitter, UVarieLottiSpec, OLEDBComponents, Vcl.Grids,
+  Vcl.DBGrids, Vcl.Buttons, AdvSplitter, AdvListEditor, CSTagListEditor,
+  System.Classes;
+
+type
+  TFSelLottiSpec = class(TFormStd)
+    Panel1: TPanel;
+    smdbgLottoSpec: TSMDBGrid;
+    Panel2: TPanel;
+    Panel3: TPanel;
+    Panel4: TPanel;
+    GroupBox1: TGroupBox;
+    GroupBox2: TGroupBox;
+    smdbgLottiSel: TSMDBGrid;
+    dsLottoSpec: TDataSource;
+    qryLottoSpec: TQueryPars;
+    qryLottiSel: TQueryPars;
+    dsLottiSel: TDataSource;
+    GroupBox3: TGroupBox;
+    F2IDArticoGen: TF2;
+    Label1: TLabel;
+    edtQta3: TCSEdit;
+    Label4: TLabel;
+    GroupBox4: TGroupBox;
+    lblQta3: TLabel;
+    edtQta1Rim: TCSEdit;
+    Label2: TLabel;
+    F2IDLotSer: TF2;
+    Label3: TLabel;
+    Label5: TLabel;
+    edtQta1Sel: TCSEdit;
+    lblUM1Spec: TLabel;
+    Panel5: TPanel;
+    btnSel: TCSBitBtn;
+    edtQta2: TCSEdit;
+    edtQta1: TCSEdit;
+    Label6: TLabel;
+    Label7: TLabel;
+    lblQta1: TLabel;
+    lblQta2: TLabel;
+    Label10: TLabel;
+    lblQta3rim: TLabel;
+    Label12: TLabel;
+    edtQta3Rim: TCSEdit;
+    lblQta2Rim: TLabel;
+    edtQta2Rim: TCSEdit;
+    Label14: TLabel;
+    lblQta1Rim: TLabel;
+    CSSplitter1: TCSSplitter;
+    Panel6: TPanel;
+    edtQta2Sel: TCSEdit;
+    Label8: TLabel;
+    lblUM2Spec: TLabel;
+    edtQta3Sel: TCSEdit;
+    lblUm3SPec: TLabel;
+    Label13: TLabel;
+    CSBitBtn1: TCSBitBtn;
+    edtBase: TCSEdit;
+    Label9: TLabel;
+    edtAlt: TCSEdit;
+    CSBitBtn2: TCSBitBtn;
+    edtSpessore: TCSEdit;
+    lblSpessore: TLabel;
+    Label11: TLabel;
+    Label15: TLabel;
+    edtNum: TCSEdit;
+    Label16: TLabel;
+    Label17: TLabel;
+    Panel7: TPanel;
+    GroupBox5: TGroupBox;
+    smdbgLottoDDT: TSMDBGrid;
+    dsLottoDDT: TDataSource;
+    qryLottoDDT: TQueryPars;
+    Panel8: TPanel;
+    Panel9: TPanel;
+    CSSplitter2: TCSSplitter;
+    edtRiferi3: TCSEdit;
+    Label18: TLabel;
+    procedure FormCreate(Sender: TObject);
+    procedure CSfrmBaseShow(Sender: TObject);
+    procedure dsLottoSpecDataChange(Sender: TObject; Field: TField);
+    procedure edtQta2SelExit(Sender: TObject);
+    procedure edtQta1SelExit(Sender: TObject);
+    procedure edtQta3SelExit(Sender: TObject);
+    procedure btnSelClick(Sender: TObject);
+    procedure CSBitBtn1Click(Sender: TObject);
+    procedure CSBitBtn2Click(Sender: TObject);
+    procedure updateQrySpec;
+    procedure edtSpessoreExit(Sender: TObject);
+    procedure FormClose(Sender: TObject; var Action: TCloseAction);
+
+  public
+    IDFatRig, IDLotSer, IDArtico, IDAllMag, IDCauMovFatRig: integer;
+    posrif: string;
+
+  private
+    procedure aggQtaRim;
+    procedure aggiornaLottoDDT;
+
+  protected
+    function GetObjSAM: TOStd; override;
+  end;
+
+implementation
+
+{$R *.DFM}
+
+Uses CSFileCfg, S3DB, UCoreDB;
+
+
+procedure TFSelLottiSpec.btnSelClick(Sender: TObject);
+var ObjFatRig: IBFRigStd;
+    ObjBamTes: IBamTesStd;
+    ObjArtico: IArticoStd;
+    sql, err: string;
+    newIdFatRig, rigaDoc: integer;
+    qry: TCSEQuery;
+    ObjLottiBF: ILottiBfStd;
+begin
+  inherited;
+  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
+  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);
+  GetInterfOggetto('ObjLottiBF','LOTTIBF',ILottiBFStd,ObjLottiBF);
+  GetInterfOggetto('ObjBamTes','BAMTES',IBamTesStd,ObjBamTes);
+
+  if edtQta3Sel.AsFloat > smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat then
+  begin
+    if MessageDlg('E'' stata selezionata una quantit� superiore a quella disponibile. Sei sicuro di voler proseguire?',mtConfirmation,[mbYes,mbNo],0,mbNo) <> mrYes then
+    begin
+      exit;
+    end;
+  end;
+
+  qry := TCSEQuery.Create(nil);
+
+  try
+    qry.DataBaseName := Azienda.DatabaseName;
+
+    //Verifico se c'� gi� una riga di bolla con l'articolo specifico selezionato.
+    sql := 'SELECT ID ' +
+           'FROM FATRIG ' +
+           'WHERE IDARTICO = ' + CS_KeyValueTo_SqlStr(getIDLotserDef(F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger)) + ' ' +
+                 'AND extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(idFatRig);
+    err := CS_OpenQry(sql,qry);
+
+    if err <> '' then
+    begin
+      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    //Creo la riga in FATRIG per il lotto che ho buttato dentro in lottibf
+//    if qry.Eof then
+//    begin
+    ObjFatRig.Seek('ID',idFatRig);
+
+    rigaDoc := ObjFatRig.CampiObj['RIGABAM'];
+
+    ObjFatRig.CampiObj['IDARTICO'] := getIDLotserDef(F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);
+    ObjFatRig.CampiObj['IDCAUMOV'] := IDCauMovFatRig;
+
+    ObjArtico.Seek('ID',F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);
+
+    if ObjArtico.CampiObj['UMV'] = '' then
+    begin
+      if ObjArtico.CampiObj['UMM'] = '' then
+      begin
+        ObjFatRig.CampiObj['QTA1'] := edtQta3Sel.AsFloat;
+        ObjFatRig.CampiObj['QTA2'] := edtQta3Sel.AsFloat;
+      end
+      else
+      begin
+        ObjFatRig.CampiObj['QTA1'] := edtQta2Sel.AsFloat;
+        ObjFatRig.CampiObj['QTA2'] := edtQta2Sel.AsFloat;
+      end;
+    end
+    else
+    begin
+      if ObjArtico.CampiObj['UMM'] = '' then
+      begin
+        ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) * edtQta3Sel.AsFloat;
+        ObjFatRig.CampiObj['QTA2'] := edtQta3Sel.AsFloat;
+      end
+      else
+      begin
+        ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) * edtQta3Sel.AsFloat;
+        ObjFatRig.CampiObj['QTA2'] := edtQta2Sel.AsFloat;
+      end;
+    end;
+
+    ObjFatRig.CampiObj['QTA3'] := edtQta3Sel.AsFloat;
+    ObjFatRig.CampiObj['PREZZO'] := 0;
+    ObjFatRig.CampiObj['IMPTOT'] := 0;
+    ObjFatRig.CampiObj['SCONTO1'] := 0;
+    ObjFatRig.CampiObj['SCONTO2'] := 0;
+    ObjFatRig.CampiObj['SCONTO3'] := 0;
+    ObjFatRig.CampiObj['SCONTO4'] := 0;
+    ObjFatRig.CampiObj['SCOQUA'] := 0;
+    ObjFatRig.CampiObj['SCONTOL'] := 0;
+    ObjFatRig.CampiObj['PREZZON'] := 0;
+    ObjFatRig.CampiObj['IDCOMRIG'] := 0;
+    ObjFatRig.CampiObj['RIGABAM'] := rigaDoc + 1;
+    ObjFatRig.CampiObj['RIFERI3'] := edtRiferi3.Text;
+
+    //Aggiorno i rigadoc per aggiungere la riga di bolla subito sotto al generico.
+    sql := 'UPDATE FATRIG SET RIGABAM = RIGABAM + 1 ' +
+           'WHERE RIGABAM > ' + CS_VariantTo_SqlStr(rigadoc) + ' ' +
+                 'AND IDBAM = ' + CS_KeyValueTo_SqlStr(ObjFatRig.CampiObj['IDBAM']);
+    err := CS_ExecDB(sql,DBExec);
+
+    if err <> '' then
+    begin
+      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    newIdFatRig := ObjFatRig.Insert;
+
+    ObjFatRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro,Azienda.RValutaSI.DecContEuro);
+{    end
+    else
+    begin
+      //Se c'� aggiungo la quantit� alla riga
+      newIdFatRig := qry.FieldByName('ID').AsInteger;
+      ObjFatRig.Seek('ID',newIdFatRig);
+
+      ObjFatRig.CampiObj['QTA3'] := ObjFatRig.CampiObj['QTA3'] + edtQta3Sel.AsFloat;
+      ObjFatRig.CampiObj['UM3'] := ObjArtico.CampiObj['UMI'];
+
+      ObjArtico.Seek('ID',F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);
+
+      if ObjArtico.CampiObj['UMV'] = '' then
+      begin
+        if ObjArtico.CampiObj['UMM'] = '' then
+        begin
+          ObjFatRig.CampiObj['QTA1'] :=  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMI'];
+          ObjFatRig.CampiObj['QTA2'] :=  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMI'];
+        end
+        else
+        begin
+          ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouM) *  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMM'];
+          ObjFatRig.CampiObj['QTA2'] := ObjArtico.ConvUM(OuI,ouI) *  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMI'];
+        end;
+      end
+      else
+      begin
+        if ObjArtico.CampiObj['UMM'] = '' then
+        begin
+          ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) *  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMV'];
+          ObjFatRig.CampiObj['QTA2'] := ObjArtico.ConvUM(OuI,ouI) *  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMI'];
+        end
+        else
+        begin
+          ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) *  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMV'];
+          ObjFatRig.CampiObj['QTA2'] := ObjArtico.ConvUM(OuI,ouM) *  ObjFatRig.CampiObj['QTA3'];
+          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMM'];
+        end;
+      end;
+
+      ObjFatRig.CampiObj['IDCOMRIG'] := 0;
+
+      ObjFatRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro,Azienda.RValutaSI.DecContEuro);
+
+      ObjFatRig.Modifica;
+    end;       }
+
+    ObjBamTes.Seek('ID',ObjfatRig.CampiObj['IDBAM']);
+    ObjBamTes.RicalcolaTotali(false,false,false);
+
+    //Salvo il riferimento della riga generica
+    sql := 'UPDATE FATRIG SET extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(IDFatRig) + ' ' +
+           'WHERE ID = ' + CS_KeyValueTo_SqlStr(newIdFatRig);
+    err := CS_ExecDB(sql,DBExec);
+
+    if err <> '' then
+    begin
+      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    sql := 'SELECT LOTTIBF.ID ' +
+           'FROM LOTTIBF ' +
+           'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID AND LOTSER.NUMLOT = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ' AND LOTSER.NUMSER = ' + CS_VariantTo_SqlStr(NUMSERDEF) + ' ' +
+           'WHERE IDFATRIG = ' + CS_KeyValueTo_SqlStr(newIdFatRig);
+    err := CS_OpenQry(sql,qry);
+
+    if err <> '' then
+    begin
+      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    while not qry.Eof do
+    begin
+
+      if not ObjLottiBF.Elimina(qry.FieldByName('ID').AsInteger) then
+      begin
+        Messaggio('Errore nell''eliminazione del lotto di default da LOTTIBF',Application.Title,MB_ICONINFORMATION + MB_OK);
+        exit;
+      end;
+
+      qry.Next;
+    end;
+
+    //Aggiorno i LOTTIBF selezionati alla riga di bolla
+    ObjLottiBF.Found := false;
+
+    //Aggiungo le quantit� alla riga di bolla
+    ObjLottiBF.CampiObj['IDLOTSER'] := F2IDLotSer.KeyValue;
+    ObjLottiBF.CampiObj['IDFATRIG'] := newIdFatRig;
+    ObjLottiBF.CampiObj['QTAINV'] := edtQta3Sel.AsFloat;
+    ObjLottiBF.CampiObj['UMINV'] := ObjArtico.CampiObj['UMI'];
+    ObjLottiBF.CampiObj['IDALLPRE'] := IDAllMag;
+
+
+    if ObjLottiBF.Insert <= 0 then
+    begin
+      Messaggio('Impossibile inserire il lotto nel DDT.',Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    smdbgLottoSpec.RefreshData;
+    smdbgLottiSel.RefreshData;
+
+    aggQtaRim;
+  finally
+    freeandnil(qry);
+  end;
+end;
+
+procedure TFSelLottiSpec.CSBitBtn1Click(Sender: TObject);
+var ObjLottiBF: ILottiBfStd;
+    sql, err: string;
+    qry: TCSEQuery;
+    idFatRigLBF: integer;
+    ObjFatRig: IBFRigStd;
+begin
+  GetInterfOggetto('ObjLottiBF','LOTTIBF',ILottiBFStd,ObjLottiBF);
+  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);
+
+  if MessageDlg('Sei sicuro di voler eliminare il lotto specifico selezionato?',mtConfirmation,[mbyes,mbNo],0) <> mrYes then
+  begin
+    exit;
+  end;
+
+  qry := TCSEQuery.Create(nil);
+
+  try
+    qry.DataBaseName := Azienda.DatabaseName;
+
+    idFatRigLBF := smdbgLottiSel.DataSource.DataSet.FieldByName('IDFATRIG').AsInteger;
+
+    ObjLottiBF.Elimina(smdbgLottiSel.DataSource.DataSet.FieldByName('ID').AsInteger);
+
+    sql := 'SELECT ID ' +
+           'FROM LOTTIBF ' +
+           'WHERE IDFATRIG = ' + CS_KeyValueTo_SqlStr(idFatRigLBF);
+    err := CS_OpenQry(sql,qry);
+
+    if err <> '' then
+    begin
+      MEssaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    if qry.Eof then
+    begin
+      ObjFatRig.Elimina(idFatRigLBF);
+    end;
+
+    smdbgLottoSpec.RefreshData;
+    smdbgLottiSel.RefreshData; 
+
+    aggQtaRim;
+  finally
+    freeandnil(qry);
+  end;
+end;
+
+procedure TFSelLottiSpec.CSBitBtn2Click(Sender: TObject);
+var ObjArtico: IArticoStd;
+begin
+  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
+
+  ObjArtico.Seek('ID',F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);
+
+  edtQta3Sel.AsFloat := ((edtNum.AsFloat * edtBase.AsFloat * edtAlt.AsFloat) / qryLottoSpec.FieldByName('COORD').AsFloat);
+  edtQta3SelExit(Sender);
+end;
+
+procedure TFSelLottiSpec.updateQrySpec;
+var ObjArtico: IArticoStd;
+    condCla, condMar, condGrup, condSpe, sql: string;
+begin
+  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
+  ObjArtico.Seek('ID',IDArtico);
+
+    if not ObjArtico.Found then
+    begin
+      Messaggio('Impossibile identificare l''articolo',Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    qryLottoSpec.DataBaseName := Azienda.DatabaseName;
+
+    if ObjArtico.CampiObj['IDCLASSI'] = 0 then
+      condCla := ''
+    else
+      condCla := 'AND ARTICO.IDCLASSI = ' + CS_KeyValueTo_SqlStr(ObjArtico.CampiObj['IDCLASSI']);
+
+    if ObjArtico.CampiObj['IDCATOMO'] = 0 then
+      condMar := ''
+    else
+      condMar := 'AND ARTICO.IDCATOMO = ' + CS_KeyValueTo_SqlStr(ObjArtico.CampiObj['IDCATOMO']);
+
+    if ObjArtico.CampiObj['IDGRUPPI'] = 0 then
+      condGrup := ''
+    else
+      condGrup := 'AND ARTICO.IDGRUPPI = ' + CS_KeyValueTo_SqlStr(ObjArtico.CampiObj['IDGRUPPI']);
+
+    if edtSpessore.Text <> '' then
+    begin
+      condSpe := 'AND CLASSI.CODICE = ' + CS_VariantTo_SqlStr(trim(edtSpessore.Text));
+    end
+    else
+      condSpe := '';
+    
+
+    sql := 'SELECT ARTICO.ID IDARTICO, ARTICO.CODICE, ARTICO.DESCR, LOTSER.NUMSER, LOTSER.NUMLOT, LOTSER.QTTGIAI, LOTSER.QTTIMPI, ' +
+                  'LOTSER.ID, GIAMAG.QTTSPEI, GIAMAG.QTTORDI, (GIAMAG.QTTGIAI - GIAMAG.QTTSPEI) QTTDISPI, CLASSI.CODICE CODCLASSI, CLASSI.DESCR DESCRCLASSI, ' +
+                  'CATOMO.CODICE CODCATOMO, CATOMO.DESCR DESCRCATOMO, (GIAMAG.QTTGIAM / GIAMAG.QTTGIAI) AS COEFF, (ISNULL(MAGCOLORI.COORD,1000000)) COORD ' +
+           'FROM ARTICO ' +
+           'INNER JOIN LOTSER ON ARTICO.ID = LOTSER.IDARTICO ' +
+           'INNER JOIN GIAMAG ON LOTSER.ID = GIAMAG.IDARTICO ' +
+           'INNER JOIN ALLMAG ON GIAMAG.IDMAG = ALLMAG.ID ' +
+           'LEFT JOIN CLASSI ON ARTICO.IDCLASSI = CLASSI.ID ' +
+           'LEFT JOIN CATOMO ON ARTICO.IDCATOMO = CATOMO.ID ' +
+           'LEFT JOIN MAGCOLORI ON ARTICO.IDMAGCOLORI = MAGCOLORI.ID ' +
+           'WHERE (NUMSER <> ' + CS_VariantTo_SqlStr(NUMSERDEF) + ' ' +
+                 'OR NUMLOT <> ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ') ' +
+                 'AND ROUND(GIAMAG.QTTGIAI,4) > 0 ' +
+                 'AND ALLMAG.IDANAMAG = (SELECT IDANAMAG ' +
+                                        'FROM ALLMAG ' +
+                                        'WHERE ID = ' + CS_KeyValueTo_SqlStr(IDAllMag) + ') '+
+                 condCla + ' ' +
+                 condMar + ' ' +
+                 condGrup + ' ' +
+                 condSpe + ' ';
+    qryLottoSpec.Close;
+    qryLottoSpec.SQL.Text := sql;
+
+    qryLottoSpec.Open;
+    smdbgLottoSpec.RefreshData;
+end;
+
+procedure TFSelLottiSpec.CSfrmBaseShow(Sender: TObject);
+var sql, err: string;
+    ObjArtico: IArticoStd;
+    qry: TCSEQuery;
+    ObjFatRig: IBFRigStd;
+    prevInd: Boolean;
+begin
+  inherited;
+  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
+  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);
+
+  qry := TCSEQuery.Create(nil);
+
+  try
+    qry.DataBaseName := Azienda.DatabaseName;
+
+    ObjFatRig.Seek('ID',IDFatRig);
+    IDAllMag := ObjFatRig.CampiObj['IDMAGPRE'];
+
+
+    //Verifico se ho un articolo specifico in DP del Prev. Ind.
+    sql := 'SELECT TOP 1 OPDT.IDARTICO, OPDP.IDALLMAG, OPDP.QTIMCO ' +
+           'FROM OPTES ' +
+           'INNER JOIN OPDT ON OPDT.IDOPTES = OPTES.ID AND OPDT.LIVELLO > 0 ' +
+           'INNER JOIN OPDP ON OPDP.IDOPTES = OPTES.ID AND OPDT.IDARTICO = OPDP.IDARTICO ' +
+           'INNER JOIN TIPIDOC ON OPTES.IDTIPIDOC = TIPIDOC.ID ' +
+           'INNER JOIN FATRIG ON OPTES.IDCOMRIG = FATRIG.IDCOMRIG ' +
+           'WHERE TIPIDOC.TIPDOC = ''D'' ' +
+                 'AND FATRIG.ID = ' + CS_KeyValueTo_SqlStr(idFatRig) + ' ' +
+           'ORDER BY OPDT.SEQUEN';
+
+    err := CS_OpenQry(sql,qry);
+
+    if err <> '' then
+    begin
+      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+
+    if qry.Eof then
+    begin 
+      sql := 'SELECT IDARTICO ' +
+             'FROM LOTSER ' +
+             'WHERE ID = ' + CS_KeyValueTo_SqlStr(IDLotSer);
+      err := CS_OpenQry(sql,qry);
+
+      if err <> '' then
+      begin
+        Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+        exit;
+      end;
+      prevInd := false;
+    end
+    else
+    begin
+      idAllMag := qry.FieldByName('IDALLMAG').AsInteger;
+      prevInd := true;
+      posrif := '';
+    end;
+
+    if posrif <> '' then
+      edtSpessore.AsString := posrif
+    else
+    begin
+      lblSpessore.Visible := false;
+      edtSpessore.Visible := false;
+    end;
+
+    idArtico := qry.FieldByName('IDARTICO').AsInteger;
+
+    ObjArtico.Seek('ID',idArtico);
+
+    updateQrySpec;
+
+    qryLottiSel.DataBaseName := Azienda.DatabaseName;
+
+    sql := 'SELECT LOTTIBF.ID, FATRIG.ID IDFATRIG, ARTICO.CODICE, ARTICO.DESCR, LOTSER.NUMSER, LOTSER.NUMLOT, LOTTIBF.QTAINV, LOTTIBF.UMINV,  ' +
+                  'FATRIG.QTA1, FATRIG.QTA2, FATRIG.QTA3, FATRIG.UM1, FATRIG.UM2, FATRIG.UM3 ' +
+           'FROM FATRIG ' +
+           'INNER JOIN LOTTIBF ON FATRIG.ID = LOTTIBF.IDFATRIG ' +
+           'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID ' +
+           //'INNER JOIN LOTSER LD ON FATRIG.IDARTICO = LD.ID ' +
+           'INNER JOIN ARTICO ON LOTSER.IDARTICO = ARTICO.ID ' +
+           'WHERE extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(IDFatRig);
+    qryLottiSel.SQL.Text := sql;
+    qryLottiSel.Open;
+    smdbgLottiSel.RefreshData;
+
+    F2IDArticoGen.KeyValue := IDArtico;
+
+    //Se c'� l'articolo specifico nel prev. ind., prendo la quantit� in distinta di prelievo
+    if not prevInd then
+    begin
+      edtQta1.AsFloat := ObjFatRig.CampiObj['QTA1'];
+      edtQta2.AsFloat := ObjFatRig.CampiObj['QTA2'];
+      edtQta3.AsFloat := ObjFatRig.CampiObj['QTA3'];
+      lblQta1.Caption := ObjFatRig.CampiObj['UM1'];
+      lblQta2.Caption := ObjFatRig.CampiObj['UM2'];
+      lblQta3.Caption := ObjFatRig.CampiObj['UM3'];
+    end
+    else
+    begin
+      edtQta1.AsFloat := qry.FieldByName('QTIMCO').AsFloat;
+      edtQta2.AsFloat := qry.FieldByName('QTIMCO').AsFloat;
+      edtQta3.AsFloat := qry.FieldByName('QTIMCO').AsFloat;
+      lblQta1.Caption := ObjArtico.CampiObj['UM' + ObjArtico.CampiObj['UMRPRO']];
+      lblQta2.Caption := ObjArtico.CampiObj['UM' + ObjArtico.CampiObj['UMRPRO']];
+      lblQta3.Caption := ObjArtico.CampiObj['UM' + ObjArtico.CampiObj['UMRPRO']];
+    end;
+
+    aggQtaRim;
+
+  finally
+    freeandnil(qry);
+  end;
+end;
+
+procedure TFSelLottiSpec.aggiornaLottoDDT;
+begin
+  qryLottoDDT.Close;
+  qryLottoDDT.SQL.Text := 'SELECT FATRIG.QTA1, FATRIG.UM1, FATRIG.UM2, FATRIG.UM3, FATRIG.QTA2, FATRIG.Qta3, PERSONE.DESCR1, PERSONE.DESCR2, ' +
+                                 'BAMTES.NUMDOC, BAMTES.ANNDOC, BAMTES.DATDOC, LOTSER.NUMLOT, LOTSER.NUMSER ' +
+                                 'FROM LOTTIBF ' +
+                                 'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID ' +
+                                 'INNER JOIN FATRIG ON LOTTIBF.IDFATRIG = FATRIG.ID ' +
+                                 'INNER JOIN BAMTES ON FATRIG.IDBAM = BAMTES.ID ' +
+                                 'INNER JOIN CLIENTI ON BAMTES.IDCLIENTE = CLIENTI.ID ' +
+                                 'INNER JOIN PERSONE ON CLIENTI.IDPERSONA = PERSONE.ID ' +
+                                 'WHERE BAMTES.STATO = ''P'' ' +
+                                       'AND FATRIG.extIDFATRIGGEN <> ' + CS_KeyValueTo_SqlStr(idFatRig) + ' ' +
+                                       'AND (LOTTIBF.IDLOTSER = ' + CS_KeyValueTo_SqlStr(smdbgLottoSpec.DataSource.DataSet.FieldByName('ID').AsInteger) + ' ' +
+                                            'OR LOTTIBF.IDLOTSER = ' + CS_KeyValueTo_SqlStr(getIDLotserDef(smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger)) + ')';
+ smdbgLottoDDT.RefreshData;
+end;
+
+procedure TFSelLottiSpec.dsLottoSpecDataChange(Sender: TObject; Field: TField);
+var ObjArtico: IArticoStd;
+begin
+  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);
+
+  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);
+
+  aggiornaLottoDDT;
+
+  F2IDLotSer.KeyValue := smdbgLottoSpec.DataSource.DataSet.FieldByName('ID').AsInteger;
+  lblUM1Spec.Caption := ObjArtico.CampiObj['UMV'];
+  lblUM2Spec.Caption := ObjArtico.CampiObj['UMM'];
+  lblUM3Spec.Caption := ObjArtico.CampiObj['UMI'];
+
+  lblQta1Rim.Caption := ObjArtico.CampiObj['UMV'];
+  lblQta2Rim.Caption := ObjArtico.CampiObj['UMM'];
+  lblQta3Rim.Caption := ObjArtico.CampiObj['UMI'];
+
+  edtQta3Sel.AsFloat := smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat;
+  edtQta3SelExit(Sender);
+
+  {if smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat >= edtQta3Rim.AsFloat then
+  begin
+    edtQta3Sel.AsFloat := edtQta3Rim.AsFloat;
+    edtQta3SelExit(edtQta3Sel);
+  end
+  else
+  begin
+    edtQta3Sel.AsFloat := smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat;
+    edtQta3SelExit(edtQta3Sel);
+  end;}
+end;
+
+procedure TFSelLottiSpec.aggQtaRim;
+var sql, err: string;
+    qry: TCSEQuery;
+    ObjFatRig: IBFRigStd;
+    ObjArtico: IARticoStd;
+begin
+  inherited;
+  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
+  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);
+
+  qry := TCSEQuery.Create(nil);
+
+  try
+    qry.DataBaseName := Azienda.DatabaseName;
+
+    ObjFatRig.Seek('ID',IDFatRig);
+
+    if smdbgLottiSel.DataSource.DataSet.RecordCount <= 0 then
+    begin
+      edtQta1Rim.AsFloat := 0;
+      edtQta2Rim.AsFloat := 0;
+      edtQta3Rim.AsFloat := 0;
+    end
+    else
+    begin
+
+      sql := 'SELECT QTAINV, LOTSER.IDARTICO ' +
+             'FROM LOTTIBF ' +
+             'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID ' +
+             'INNER JOIN FATRIG ON LOTTIBF.IDFATRIG = FATRIG.ID ' +
+             'WHERE FATRIG.extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(IDFatRig);
+      err := CS_OpenQry(sql,qry);
+
+      if err <> '' then
+      begin
+        Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+        exit;
+      end;
+
+      edtQta3Rim.AsFloat := 0;
+      edtQta1Rim.AsFloat := 0;
+      edtQta2Rim.AsFloat := 0;
+
+
+      while not qry.Eof do
+      begin
+        ObjArtico.Seek('ID',qry.FieldByName('IDARTICO').AsInteger);
+        edtQta3Rim.AsFloat := edtQta3Rim.AsFloat + qry.FieldByName('QTAINV').AsFloat;
+        edtQta2Rim.AsFloat := edtQta2Rim.AsFloat + (qry.FieldByName('QTAINV').AsFloat * ObjArtico.ConvUM(ouI,ouM));
+        edtQta1Rim.AsFloat := edtQta1Rim.AsFloat + (qry.FieldByName('QTAINV').AsFloat * ObjArtico.ConvUM(ouI,ouV));
+
+        qry.Next;
+      end; 
+    end;
+  finally
+    freeandnil(qry);
+  end;
+end;
+
+procedure TFSelLottiSpec.edtQta1SelExit(Sender: TObject);
+var ObjArtico: IArticoStd;
+begin
+  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);
+
+  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);
+
+  edtQta2Sel.AsFloat := edtQta1Sel.AsFloat * ObjArtico.ConvUM(ouV,ouM);
+  edtQta3Sel.AsFloat := edtQta1Sel.AsFloat * ObjArtico.ConvUM(ouV,ouI);
+
+end;
+
+procedure TFSelLottiSpec.edtQta2SelExit(Sender: TObject);
+var ObjArtico: IArticoStd;
+begin
+  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);
+
+  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);
+
+  //edtQta1Sel.AsFloat := edtQta2Sel.AsFloat * ObjArtico.ConvUM(ouM,ouV);
+  edtQta3Sel.AsFloat := edtQta2Sel.AsFloat / qryLottoSpec.FieldByName('COEFF').AsFloat;   //ObjArtico.ConvUM(ouM,ouI);
+
+end;
+
+procedure TFSelLottiSpec.edtQta3SelExit(Sender: TObject);
+var ObjArtico: IArticoStd;
+begin
+  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);
+
+  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);
+
+  //edtQta1Sel.AsFloat := edtQta3Sel.AsFloat * ObjArtico.ConvUM(ouI,ouV);
+  edtQta2Sel.AsFloat := edtQta3Sel.AsFloat * qryLottoSpec.FieldByName('COEFF').AsFloat;
+
+end;
+
+procedure TFSelLottiSpec.edtSpessoreExit(Sender: TObject);
+begin
+  inherited;
+  updateQrySpec;
+end;
+
+procedure TFSelLottiSpec.FormClose(Sender: TObject; var Action: TCloseAction);
+begin
+  smdbgLottiSel.SaveToIniFile;
+  smdbgLottoSpec.SaveToIniFile;
+  smdbgLottoDDT.SaveToIniFile;
+
+  inherited;
+
+end;
+
+procedure TFSelLottiSpec.FormCreate(Sender: TObject);
+var sql,err: string;
+    iniFile: TCSFileCfg;
+begin
+  inherited;
+
+  IDFatRig := 0;
+
+  iniFile := TCSFileCfg.Create(Glo.UserPath + 'PI_Altag_SelLottiSpecDDT.ini');
+
+  IDCauMovFatRig := iniFile.ReadInteger('IDCAUFATRIG','IDCAUMOVFATRIG',0);
+
+  F2IDArticoGen.DBSam := Azienda.DatabaseName;
+  F2IDArticoGen.Open;
+
+  F2IDlotSer.DBSam := Azienda.DatabaseName;
+  F2IDLotSer.Open;
+
+  edtNum.AsFloat := 1;
+
+  if CSColumnExists(DBExec,'FATRIG','extIDFATRIGGEN') <> '' then
+  begin
+    sql := 'ALTER TABLE FATRIG ADD extIDFATRIGGEN int';
+    err := CS_ExecDB(sql,DBExec);
+
+    if err <> '' then
+    begin
+      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
+      exit;
+    end;
+  end;
+
+  qryLottoDDT.DataBaseName := Azienda.DatabaseName;
+
+  smdbgLottiSel.IniFileName := Glo.IniUtente;
+  smdbgLottiSel.IniSection := 'PI_Altag_LottiSel';
+  smdbgLottiSel.LoadFromIniFile;
+
+  smdbgLottoSpec.IniFileName := Glo.IniUtente;
+  smdbgLottoSpec.IniSection := 'PI_Altag_LottoSpec';
+  smdbgLottoSpec.LoadFromIniFile;
+
+  smdbgLottoDDT.IniFileName := Glo.IniUtente;
+  smdbgLottoDDT.IniSection := 'PI_Altag_lottoDDT';
+  smdbgLottoDDT.LoadFromIniFile;
+end;
+
+function TFSelLottiSpec.GetObjSam: TOStd;
+begin
+  Result := nil;
+end;
+
+end.
```
