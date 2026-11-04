@echo off
setlocal EnableExtensions

set "BDS=C:\Program Files (x86)\Embarcadero\RAD Studio\10.0"
set "DCC32=%BDS%\bin\dcc32.exe"
set "ROOT=%~dp0source"
set "SAMDIROUT=C:\outsamw2"
set "SDK=C:\plugin_new\V600-SDK\lib"
set "OUT=%~dp0build_xe3"
set "LOG=%OUT%\logs"

if not exist "%DCC32%" (
  echo ERRORE: compilatore XE3 non trovato: %DCC32%
  exit /b 1
)
if not exist "%SAMDIROUT%" (
  echo ERRORE: SAMDIROUT non trovato: %SAMDIROUT%
  exit /b 1
)

if not exist "%OUT%" mkdir "%OUT%"
if not exist "%OUT%\bpl" mkdir "%OUT%\bpl"
if not exist "%OUT%\dcp" mkdir "%OUT%\dcp"
if not exist "%OUT%\dcu" mkdir "%OUT%\dcu"
if not exist "%LOG%" mkdir "%LOG%"

set "SEARCH=%SAMDIROUT%;%SAMDIROUT%\DCU;%ROOT%;%SDK%;%BDS%\lib\win32\release;%BDS%\source\vcl;%BDS%\source\rtl\common;%BDS%\source\rtl\sys;%BDS%\source\data\db"
set "COMMON=--no-config -B -Q -NSVcl;System;Data;Winapi -U"%SEARCH%" -I"%SEARCH%" -O"%SEARCH%" -LE"%OUT%\bpl" -LN"%OUT%\dcp" -NU"%OUT%\dcu"

call :build "PI_AltagMI_SelLottiSpecDDT" "PI_AltagMI_SelLottiSpecDDT\PI_AltagMI_SelLottiSpecDDT.dpk"
if errorlevel 1 exit /b 1
call :build "pi_AltagMi_PrevInd" "pi_AltagMi_PrevInd\PI_AltagMI_PrevInd.dpk"
if errorlevel 1 exit /b 1
call :build "PI_AltagMI_GstVenLastre" "PI_AltagMI_GstVenLastre\PI_AltagMI_GstVenLastre.dpk"
if errorlevel 1 exit /b 1
call :build "PI_AltagMI_GstPI" "PI_AltagMI_GstPI\PI_AltagMI_GstPI.dpk"
if errorlevel 1 exit /b 1
call :build "PI_ALTAGMI_CampiAggRigaComm" "PI_ALTAGMI_CampiAggRigaComm\PI_AltagMI_CampiAggRigaComm.dpk"
if errorlevel 1 exit /b 1
call :build "PI_AltagMI_BWS" "PI_AltagMI_BWS\PI_AltagMI_BWS.dpk"
if errorlevel 1 exit /b 1

echo.
echo COMPILAZIONE COMPLETATA
echo Output: %OUT%
exit /b 0

:build
set "NAME=%~1"
set "PROJECT=%ROOT%\%~2"
echo.
echo ==== %NAME% ====
if not exist "%PROJECT%" (
  echo ERRORE: progetto non trovato: %PROJECT%
  exit /b 1
)
pushd "%ROOT%\%~dp2"
%DCC32% %COMMON% "%PROJECT%" > "%LOG%\%NAME%.log" 2>&1
set "CODE=%ERRORLEVEL%"
popd
if not "%CODE%"=="0" (
  echo FALLITA: %NAME% - vedere %LOG%\%NAME%.log
  exit /b %CODE%
)
echo OK: %NAME%
exit /b 0
