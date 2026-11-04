

unit UPI_Altag_Spec;

interface

uses
  Vcl.Forms, System.SysUtils, System.Classes, Winapi.Windows, CsStdExt, S3Plugin,
  IPDT, UCoreTipi;

type
  TCallProcPlugIn = TCsProcType;

  procedure RunInterfacePlugIn(OpName: UnicodeString; Params: Array of UnicodeString; var ValResult: UnicodeString);

  // Restituisce la classe della Form TFrmMenuPrgSpe
  function GetFrmMenuPrgSpe: TForm;

  // Carico Magazzino BWS
  function PlugIn_MenuCaricoMag(Params: Array of UnicodeString): UnicodeString;
  // Preparazione Spedizioni BWS
  //function PlugIn_MenuPrepSped(Params: Array of UnicodeString): UnicodeString;

var
  CallProcPlugIn: TCallProcPlugIn;

implementation

uses
  S3Registry, UVarie, UFrmCaricaMag;

(* Procedura specifica del Plug-In chiamata dallo standard SAM

   L'indirizzo di RunInterfacePlugIn viene impostato nella variabile CallProcPlugIn
   nella parte di initialization; se questo driver non viene caricato la
   variabile non è inizializzata

   - OpName: Nome operazione (identifica il chiamante)

   - Params: Parametri passati dal chiamante come array di stringhe
     - Params[0] = ...
     - Params[1] = ...
     - Params[2] = ...
     - Params[3] = ...
     - Params[4] = ...

   - ValResult: Messaggio di ritorno al chiamante
*)
procedure RunInterfacePlugIn(OpName: UnicodeString; Params: Array of UnicodeString; var ValResult: UnicodeString);
begin
  ValResult := '';
  if CompareText(OpName, 'PlugIn_CaricaMag') = 0 then
  begin
    ValResult := PlugIn_MenuCaricoMag(Params);
  end;
  {
  if CompareText(OpName, 'Plugin_Prepsped') = 0 then
  begin
    ValResult := PlugIn_MenuPrepSped(Params);
  end;
  }
end;

function GetFrmMenuPrgSpe: TForm;
var
  I: Integer;
begin
  Result := nil;

  for I := Screen.FormCount - 1 downto 0 do
  begin
    if Screen.Forms[I].ClassNameIs('TFrmMenuPrgSpe') then
    begin
      Result := Screen.Forms[I];
      Break;
    end;
  end;
end;

function PlugIn_MenuCaricoMag(Params: Array of UnicodeString): UnicodeString;
var
  Frmcaricamag: TFrmCaricaMag;
begin
  Frmcaricamag := TFrmcaricamag.Create(nil);
  try
    Frmcaricamag.BorderStyle := bsSingle;
    Frmcaricamag.Top := StrToInt(Params[0]);
    Frmcaricamag.Left := StrToInt(Params[1]);

    // Impostazione di PopupParent e PopupMode per evitare che le finestre vengano
    // visualizzate in secondo piano
    Frmcaricamag.PopupParent := GetFrmMenuPrgSpe;
    Frmcaricamag.PopupMode := pmExplicit;
    Frmcaricamag.ShowModal;
  finally
    if Assigned(Frmcaricamag) then
      FreeAndNil(Frmcaricamag);
  end;
end;

{
function PlugIn_MenuPrepSped(Params: Array of UnicodeString): UnicodeString;
var
  FrmNewprepsped: TFrmNewPrepsped;
begin
  FrmNewprepsped := TFrmNewPrepsped.Create(nil);
  try
    FrmNewprepsped.BorderStyle := bsSingle;
    FrmNewprepsped.Top := StrToInt(Params[0]);
    FrmNewprepsped.Left := StrToInt(Params[1]);

    // Impostazione di PopupParent e PopupMode per evitare che le finestre vengano
    // visualizzate in secondo piano
    FrmNewprepsped.PopupParent := GetFrmMenuPrgSpe;
    FrmNewprepsped.PopupMode := pmExplicit;
    FrmNewprepsped.ShowModal;
  finally
    if Assigned(FrmNewprepsped) then
      FreeAndNil(FrmNewprepsped);
  end;
end;
}
initialization
  CallProcPlugIn := RunInterfacePlugIn;
  RegCsProc('PI_Altag_Spec', CallProcPlugIn);

finalization
  UnRegCsProc('PI_Altag_Spec');
  CallProcPlugIn := nil;

end.