unit UFrmRicMerRia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, FPDTStd, IPDT, IBase, AdvListEditor, CSTagListEditor,
  UCoreSecure, CSEdit, UTipiPDT;

type
  TFrmFuncStd = class(TFrmPDTStd, IFrmPDTStd)
    PnlData: TPanel;
    ScbData: TScrollBox;
    BvlStdGen: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FLstTasti: TList;
    FRefCount: Integer;
    FAutoFree: Boolean;

    procedure SetLstTasti(Value: TList);

    function GetLstTasti: TList;
    function ValidaArtico(out AErr: String; out ACompName: String): Boolean;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function ValidaControlli_Gen(out AErr: String; out ACompName: String): Boolean;
  protected
    BarCodeUnico: IBarCodeUnicoStd;
    procedure InitTF2(AObjDB: TAziendaStd = nil);
    function ValidaControlli: Boolean;
  public
    property AutoFree: Boolean read FAutoFree write FAutoFree;
    property LstTasti: TList read GetLstTasti write SetLstTasti;
  end;

  TCSEditQta = class(TComponent)
  private
    FQta: Double;
    function GetQta: Double;
    procedure SetQta(const Value: Double);
  public
    property Qta: Double read GetQta write SetQta;
  end;

  THelperCSEdit = class
    class function CSEditQta(ACSEdit:TCSEdit): TCSEditQta;
    class function QtaIsChanged(ACSEdit:TCSEdit): Boolean;
  end;

implementation

uses
  UCoreTipi, UPDTMsgBox, S3Registry, MsgPDT, UCoreDB, Compf2, CSTipiCommon, UCoreUtils;

const
  SetF2_ARTICO = [ArticoD, ArticoC];
{$R *.dfm}

{ TFrmFuncStd }

procedure TFrmFuncStd.FormCreate(Sender: TObject);
var
  Ctrl, I: Integer;
begin
  inherited;

  if not Assigned(BarCodeUnico) then
    if not GetInterfOggetto('ObjBarCodeUnico', 'BarCodeTes', IBarCodeUnicoStd, BarCodeUnico) then begin
      MessaggioPDT(RS_PDT_GEN_006, APPTITLE, MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

  // Dimensionamento massimo delle finestre terminale a quelle del dispositivo
  if CompareText(ParamWindowState, 'F') = 0 then begin
    // Lista controlli panello tasti da sinistra a destra
    FLstTasti := TList.Create;
    FLstTasti.Clear;

    for Ctrl := 0 to PnlTasti.ControlCount - 1 do begin
      if PnlTasti.Controls[Ctrl] is TControl then begin
        if FLstTasti.Count = 0 then
          I := 0
        else begin
          for I := 0 to FLstTasti.Count - 1 do begin
            if PnlTasti.Controls[Ctrl].Left < TControl(FLstTasti[I]).Left then
              Break;
          end;
        end;
        FLstTasti.Insert(I, PnlTasti.Controls[Ctrl]);
      end;
    end;

    if FLstTasti.Count > 1 then begin
      for Ctrl := 0 to FLstTasti.Count - 1 do begin
        if Ctrl < FLstTasti.Count - 1 then
          TControl(FLstTasti[Ctrl]).Align := alLeft
        else
          TControl(FLstTasti[Ctrl]).Align := alClient;

        // Riporto sulla Caption del pulsante il testo del Hint
        if TControl(FLstTasti[Ctrl]) is TBitBtn then
          TBitBtn(FLstTasti[Ctrl]).Caption := TBitBtn(FLstTasti[Ctrl]).Hint;
        if TControl(FLstTasti[Ctrl]) is TSpeedButton then
          TSpeedButton(FLstTasti[Ctrl]).Caption := TSpeedButton(FLstTasti[Ctrl]).Hint;
      end;
    end;
  end;
end;

procedure TFrmFuncStd.FormResize(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  // Dimensionamento massimo delle finestre terminale a quelle del dispositivo
  if CompareText(ParamWindowState, 'F') = 0 then begin
    if FLstTasti.Count > 0 then begin
      for I := 0 to FLstTasti.Count - 2 do
        TControl(FLstTasti[I]).Width := Trunc(PnlTasti.Width / FLstTasti.Count);
    end;
  end;
end;

procedure TFrmFuncStd.FormShow(Sender: TObject);
begin
  inherited;
  InitTF2;
end;

procedure TFrmFuncStd.FormDestroy(Sender: TObject);
begin
  if Assigned(FLstTasti) then begin
    FLstTasti.Clear;
    FreeAndNil(FLstTasti);
  end;

  inherited;
end;

function TFrmFuncStd.GetLstTasti: TList;
begin
  Result := FLstTasti;
end;

procedure TFrmFuncStd.InitTF2(AObjDB: TAziendaStd = nil);
var
  I: Integer;
  LWhere: string;

  function GetWhereSql(AF2Table: TSetF2): String;
  begin
    Result := '';
    if AF2Table in SetF2_ARTICO then
      Result := '(A.GESMOV <> 0)';
  end;
begin
  if not Assigned(AObjDB) then
    AObjDB := Azienda;

  for I := 0 to Self.ComponentCount - 1 do
    if Self.Components[I] is TF2 then
    begin
      TF2(Self.Components[I]).DBSam := AObjDB.DatabaseName;

      // Recupero l'eventuale Where obbligatoria di base
      LWhere := GetWhereSql(TF2(Self.Components[I]).F2Table);

      // Se già compilata la where si mantiene, ma si integra con quella obbligata
      if (TF2(Self.Components[I]).WhereSql <> '') then
      begin
        if LWhere <> '' then
          LWhere := LWhere+' AND ';

        LWhere := LWhere + '('+TF2(Self.Components[I]).WhereSql+')';
      end;

      if LWhere <> '' then
        TF2(Self.Components[I]).WhereSql := LWhere;

      TF2(Self.Components[I]).Open;
      if CompareText(Application.Name, 'SAM.EXE') <> 0 then
        TF2(Self.Components[I]).imgBtnGest.Visible := False; //non fa vedere la freccia azzurra perché da errore (devo ripeterlo per ogni open)

    end;
end;

procedure TFrmFuncStd.SetLstTasti(Value: TList);
begin
  FLstTasti := Value;
end;

function TFrmFuncStd.ValidaArtico(out AErr, ACompName: String): Boolean;
var
  I: Integer;
  LF2Artico: TF2;
begin
  Result := True;
  for I := 0 to Self.ComponentCount - 1 do
    if (Self.Components[I] is TF2) then
    begin
      LF2Artico := (Self.Components[I] as TF2);
      if (LF2Artico.F2Table in SetF2_ARTICO) and (LF2Artico.KeyValue > 0) then
      begin
        Result := LF2Artico.qryF2.FieldByName('GESMOV').AsInteger <> 0;
        if not Result then
        begin
          AErr := Format(RS_PDT_GEN_046, [LF2Artico.qryF2.FieldByName('CODICE').AsString]);
          ACompName := LF2Artico.Name;
        end;
      end;
    end;
end;

function TFrmFuncStd.ValidaControlli_Gen(out AErr, ACompName: String): Boolean;
begin
  Result := ValidaArtico(AErr, ACompName);
end;

function TFrmFuncStd.ValidaControlli: Boolean;
var
  LErr, LCompName: string;
begin

  Result := ValidaControlli_Gen(LErr, LCompName);
  if not Result then
  begin
    Result := False;
    MessaggioPDT(LErr, APPTITLE, MB_ICONINFORMATION + MB_OK);
    if Assigned(Self.FindComponent(LCompName)) and (Self.FindComponent(LCompName) is TWinControl) then
      if TWinControl(Self.FindComponent(LCompName)).CanFocus then
        TWinControl(Self.FindComponent(LCompName)).SetFocus;
    Exit;
  end;

end;

function TFrmFuncStd._AddRef: Integer;
begin
  if AutoFree then begin
    Inc(FRefCount);
    Result := FRefCount;
  end
  else
    Result := inherited _AddRef;
end;

function TFrmFuncStd._Release: Integer;
begin
  if AutoFree then begin
    Dec(FRefCount);
    Result := FRefCount;
    if Result = 0 then
      Destroy;
  end
  else
    Result := inherited _Release;
end;

{ THelperCSEdit }

class function THelperCSEdit.CSEditQta(ACSEdit:TCSEdit): TCSEditQta;
var
  I: Integer;
begin
  Result := nil;
  // Per edit che gestiscono i float
  if (ACSEdit.DataType = dtNumerico) {and (ACSEdit.DigitsDec > 0)} then
  begin
    for I := 0 to ACSEdit.ComponentCount - 1 do
      if ACSEdit.Components[I] is TCSEditQta then
        Result := TCSEditQta(ACSEdit.Components[I]);

    if not Assigned(Result) then
    begin
      Result := TCSEditQta.Create(ACSEdit);
      Result.Name := ACSEdit.Name + '_Qta';
    end;
  end;
end;

class function THelperCSEdit.QtaIsChanged(ACSEdit:TCSEdit): Boolean;
begin
  try
    Result := Uguale(THelperCSEdit.CSEditQta(ACSEdit).Qta, ACSEdit.AsFloat, True);
  except
    Result := False;
  end;
end;

{ TCSEditQta }

function TCSEditQta.GetQta: Double;
begin
  Result := FQta;
end;

procedure TCSEditQta.SetQta(const Value: Double);
begin
  FQta := Value;
end;

end.
