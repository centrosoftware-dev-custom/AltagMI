/// <exclude/>
unit UGstPI;

interface

uses
  System.Classes,
  Vcl.Forms,
  Winapi.Windows,
  Vcl.ComCtrls,
  CSETables,
  CSToolBar,
  System.SysUtils,
  S3Registry,
  S3Plugin,
  IProduzione,
  OOrPr,
  GetRBas,
  GetRPrd,
  CSDBFileCfg,
  UTipiPrd,
  UtilsArticoli,
  RNote;

type
  TGstPI = class(TCustomPlugIn)
  private
    bValidaUtente: Boolean;
    iAskAggPrezzoComRig: Integer;
    sEdtTotale: string;
//
//  M.B. 22-04-2011 RI:10242
//
    PageControl1: TPageControl;
    PnlSpeedBar: TCSToolBar;
    btn: TCSToolBarButton;

    FOEChangePageControl: TNotifyEvent;
    FOEClickbtnPrevInd: TNotifyEvent;
    FOEExitedtPrezzo: TNotifyEvent;
    FOEChangecbxRiferi1: TNotifyEvent;
    FOEdbgrRigheRefreshData: TNotifyEvent;
//
//  M.B. 22-04-2011 RI:10242
//
//  Funzioni e/o procedure
//

    function CalcolaCoefConv(ACodArtico: string): Double;
    function GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: string; AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): string;
  published
    property OEChangePageControl: TNotifyEvent read FOEChangePageControl write FOEChangePageControl;
    property OEClickbtnPrevInd: TNotifyEvent read FOEClickbtnPrevInd write FOEClickbtnPrevInd;
    property OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
    property OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
    property OEdbgrRigheRefreshData: TNotifyEvent read FOEdbgrRigheRefreshData write FOEdbgrRigheRefreshData;
    procedure BTN_OpenPrevInd(Sender: TObject); { BUTTONS - Frmcomtes AND FrmOfferte } // IK 07/03/2025 RI:54455
    procedure PlugIn_PrevInd;  { Init - Frmcomtes AND FrmOfferte }
    function BTN_PrevInd(Sender: TObject): Integer; { BUTTONS - Frmcomtes AND FrmOfferte }
    procedure PIClickbtnPrevInd(Sender: TObject); { BUTTONS - Frmcomtes AND FrmOfferte } //  cv dalla 2.18 lo vogliono come bottone indipendente
    procedure PIExitedtPrezzo(Sender: TObject);
    procedure PIChangecbxRiferi1(Sender: TObject);
    procedure PIChangePageControl(Sender: TObject);
    procedure PIdbgrRigheRefreshData(Sender: Tobject);

    procedure GenerazioneOP; { BUTTONS - FrmIntCom }
//
//  M.B. 22-04-2011 RI:10242
//
    procedure AttivaPluginPIDT;  { Init FrmPIDT }
    procedure AttivaPluginPIOV;  { Init FrmIntCom }
    procedure btnTaglioDTOnClick(Sender: TObject);
    procedure btnTaglioOVOnClick(Sender: TObject);
    procedure CreaPrevInd(iIdComRig: Integer);
    procedure VisualizzaPrevInd(iId: Integer);
    procedure ModificaCommessa(iIdComTes: Integer; iIdComRig: Integer; sUmrPre: string; dQta1: Double; dQta2: Double; dQta3: Double; dPrezzo: Double);
  end;

// IK 07/03/2025
// Non ho visti punti in cui veniva richiamato questo file
//const
//  NOME_FILE_INI = 'ALTAG.CFG';

implementation

uses
  RMiscComp,
  UCoreUtils,
  CSTipiCommon,
  rnUMB,
  RMisc,
  Vcl.Controls,
  Vcl.Dialogs,
  FGstPI,
  SMDBGrid,
  QueryPars,
  FrmStd,
  Compf2,
  RSQL,
  RString,
  UCoreTipi,
  UCoreDB,
  IVendite,
  S3Db,
  MsgCore,
  FIntCom;

// -----------------------------------------------------------------------------
//  Funziona di verifica utenti abilitati
// -----------------------------------------------------------------------------
function Inside(lista, compare: string): Boolean;
var
  SL: TStringList;
begin
  Result := False;
  SL := TStringList.create;
  try
    SL.commatext := lista;
    if SL.indexOf(compare) <> -1 then
      Result := True;
  finally
    FreeAndNil(SL);
  end;
end;
// -----------------------------------------------------------------------------
//  M.B. 22-04-2011 RI:10242
//  Attivazione plug-in dalla griglia distinte tecnica preventivo industriale
// -----------------------------------------------------------------------------
procedure TGstPI.AttivaPluginPIDT;
var
  PnlSpeedBar: TCSToolBar;
  btn: TCSToolBarButton;
begin
  { Metto il bottone }

  GetFormComp('ToolBar1', PnlSpeedBar);
  if (Assigned(PnlSpeedBar)) then
  begin
    btn := TCSToolBarButton.Create(nil);
    btn.Name := 'btnTaglioDT';
    btn.Hint := 'Gestione Taglio';
    btn.ShowHint := True;
    btn.GlyphLibraryIndex := 334;
    btn.OnClick := btnTaglioDTOnClick;

    PnlSpeedBar.AddToolBarControl(btn);
  end;
end;
// -----------------------------------------------------------------------------
//  M.B. 22-04-2011 RI:10242
//  Attivazione plug-in dalla griglia distinte tecnica preventivo industriale
// -----------------------------------------------------------------------------

procedure TGstPI.AttivaPluginPIOV;
begin
//
// Metto il bottone
//
  GetFormComp('PageControl1', PageControl1);
  GetFormComp('CSToolBar1', PnlSpeedBar);
  if (Assigned(PnlSpeedBar)) then
  begin
    btn := TCSToolBarButton.Create(nil);
    btn.Name := 'btnTaglioOV';
    btn.Hint := 'Gestione Taglio';
    btn.ShowHint := True;
    btn.GlyphLibraryIndex := 334;
    btn.OnClick := btnTaglioOVOnClick;

    PnlSpeedBar.AddToolBarControl(btn);
  end;

  if (PageControl1.ActivePageIndex = 1) then
  begin
    btn.enabled := true;
  end
  else
  begin
    btn.enabled := false;
  end;

  RedirEvent('PageControl1', 'OnChange', 'OEChangePageControl', 'PIChangePageControl');

  RedirEvent('dbgrRighe', 'OnBeforeRefreshData', 'OEdbgrRigheRefreshData', 'PIdbgrRigheRefreshData');
//  TFrmIntCom(Owner.Owner).dbgrRighe.RefreshData();
end;

//  ----------------------------------------------------------------------------
//  Refresh griglia distinta base
//  ----------------------------------------------------------------------------

procedure TGstPI.PIdbgrRigheRefreshData(Sender: Tobject);
var
  I, K: Integer;
  Lista: TStringList;
  IniFile: TCSDbFileCfg;
  GrdRiDiBa: TSMDBGrid;
  QryRiDiBa: TQueryPars;
  Section: string;
  StrSql: string;
  StrLayout: string;
  StrWidth: string;
  StrFieldName: string;
  ColExistsTipoPI: Boolean;
  ColExistsAnnoPI: Boolean;
  ColExistsNumPI: Boolean;
  ColExistsDescrPI: Boolean;
begin
  GetFormComp('qryRighe', QryRiDiBa);
  GetFormComp('dbgrRighe', GrdRiDiBa);

  Lista := TStringList.Create;
  try
    StrSql := 'OTES.TIPNUM';
    if Pos(LowerCase(StrSql + ' TIPNUM_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' TIPNUM_PI, ' +
        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);

    StrSql := 'OTES.ANNOP';
    if Pos(LowerCase(StrSql + ' ANNOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' ANNOP_PI, ' +
        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);

    StrSql := 'OTES.NUMOP';
    if Pos(LowerCase(StrSql + ' NUMOP_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' NUMOP_PI, ' +
        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);

    StrSql := 'OTES.DESCR';
    if Pos(LowerCase(StrSql + ' DESCR_PI'), LowerCase(QryRiDiBa.SQL.Text)) = 0 then
      QryRiDiBa.SQL.Text := 'SELECT ' + StrSql + ' DESCR_PI, ' +
        Copy(QryRiDiBa.SQL.Text, 8, Length(QryRiDiBa.SQL.Text) - 7);

//    StrSql :=   'LEFT OUTER JOIN OPTES OTES on OTES.IDCOMRIG = CRIG.ID '+
//                'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID '+
//                'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID  ';
    StrSql := 'outer apply ' +
      '(select top 1 otes.numop, otes.annop, otes.tipnum, pdoc.descr ' +
      'from optes otes ' +
      'LEFT OUTER JOIN ext_pialtatg EXT_TG on EXT_TG.idoptes = OTES.ID ' +
      'LEFT OUTER JOIN TIPIDOC PDOC ON OTES.IDTIPIDOC = PDOC.ID  ' +
      'where otes.idcomrig = crig.id ' +                                           //LR_CH4221/2025
        'and pdoc.tipdoc <> ''P'') OTES ';

    if Pos(LowerCase(StrSql), LowerCase(QryRiDiBa.Sql.Text)) = 0 then
    begin
      QryRiDiBa.SQL.Text := QryRiDiBa.SQL.Text + StrSql;
    end;

{
  FrmTmpSql:=TfrmSql.Create(nil);
  try
    FrmTmpSql.mSql.Clear();
    FrmTmpSql.mSql.Lines.Add(QryRiDiBa.SQL.Text);
    FrmTmpSql.ShowModal;
  finally
    FrmTmpSql.Free;
  end;
}

    IniFile := TCSDbFileCfg.Create(Glo.IniUtente);
    try
      // SF...03/04/2012 : non leggeva la sessione corretta e quindi non riposizionava le colonne
      //Section   := TFrmIntCom(Owner.Owner).Name + Azienda.Id + '-' + GrdRiDiBa.Name;
      Section := UniqueFormName(TFrmIntCom(Owner.Owner).Name) + '-RIGHE-' + Azienda.ID;
      // ...SF 03/04/2012
      StrLayout := IniFile.ReadString(Section, 'LAYOUT', '');
      for I := 0 to CS_CountSubStr(StrLayout, ',') do
      begin
        Lista.Add(CS_Extract_SubStr(StrLayout, ',', I));
      end;
    finally
      // Distruzione della variabile IniFile
      IniFile.Free;
    end; // end try...finally

    ColExistsTipoPI := False;
    ColExistsAnnoPI := False;
    ColExistsNumPI := False;
    ColExistsDescrPI := False;

    for I := 0 to Lista.Count - 1 do
    begin
      StrFieldName := CS_Sub_Str(CS_Sub_Str(CS_Sub_Str(Copy(Lista.Strings[I], 1, Pos('=', Lista.Strings[I]) - 1), '"', ''), '}', ''), '{', '');
      StrWidth := CS_Sub_Str(CS_Sub_Str(CS_Sub_Str(Copy(Lista.Strings[I], Pos('=', Lista.Strings[I]) + 1, Length(Lista.Strings[I]) + Pos('=',
    Lista.Strings[I])), '"', ''), '}', ''), '{', '');

      if StrFieldName = 'Tipo PI' then
      begin
        for K := 1 to GrdRiDiBa.Columns.Count do
          if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then
            break;

        if K > GrdRiDiBa.Columns.Count then
        begin
          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
          begin
            FieldName := 'TIPNUM_PI';
            dataType := dtTesto;
            Alignment := taRightJustify;
            Title.Caption := 'Tipo PI';
            Width := StrToInt(StrWidth);
          end;
          ColExistsTipoPI := True;
        end;
      end;

      if StrFieldName = 'Anno PI' then
      begin
        for K := 1 to GrdRiDiBa.Columns.Count do
          if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then
            break;

        if K > GrdRiDiBa.Columns.Count then
        begin
          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
          begin
            FieldName := 'ANNOP_PI';
            dataType := dtTesto;
            Alignment := taRightJustify;
            Title.Caption := 'Anno PI';
            Width := StrToInt(StrWidth);
          end;
          ColExistsAnnoPI := True;
        end;
      end;

      if StrFieldName = 'Num. PI' then
      begin
        for K := 1 to GrdRiDiBa.Columns.Count do
          if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then
            break;

        if K > GrdRiDiBa.Columns.Count then
        begin
          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
          begin
            FieldName := 'NUMOP_PI';
            dataType := dtTesto;
            Alignment := taRightJustify;
            Title.Caption := 'Num. PI';
            Width := StrToInt(StrWidth);
          end;
          ColExistsNumPI := True;
        end;
      end;

      if StrFieldName = 'Descr. PI' then
      begin
        for K := 1 to GrdRiDiBa.Columns.Count do
          if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then
            break;

        if K > GrdRiDiBa.Columns.Count then
        begin
          with TS3Column(GrdRiDiBa.Columns.Insert(I)) do
          begin
            FieldName := 'DESCR_PI';
            dataType := dtTesto;
            Alignment := taLeftJustify;
            Title.Caption := 'Descr. PI';
            Width := StrToInt(StrWidth);
          end;
          ColExistsDescrPI := True;
        end;
      end;
    end; // end for
//
//  Se le colonne non esistono le aggiungo
//
    if not ColExistsTipoPI then
    begin
      for K := 1 to GrdRiDiBa.Columns.Count do
        if GrdRiDiBa.Columns[K - 1].FieldName = 'TIPNUM_PI' then
          break;

      if K > GrdRiDiBa.Columns.Count then
      begin
        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
        begin
          FieldName := 'TIPNUM_PI';
          dataType := dtTesto;
          Alignment := taRightJustify;
          Title.Caption := 'Tipo PI';
          Width := 50;
        end;
      end;
    end;

    if not ColExistsAnnoPI then
    begin
      for K := 1 to GrdRiDiBa.Columns.Count do
        if GrdRiDiBa.Columns[K - 1].FieldName = 'ANNOP_PI' then
          break;

      if K > GrdRiDiBa.Columns.Count then
      begin
        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
        begin
          FieldName := 'ANNOP_PI';
          dataType := dtTesto;
          Alignment := taRightJustify;
          Title.Caption := 'Anno PI';
          Width := 50;
        end;
      end;
    end;

    if not ColExistsNumPI then
    begin
      for K := 1 to GrdRiDiBa.Columns.Count do
        if GrdRiDiBa.Columns[K - 1].FieldName = 'NUMOP_PI' then
          break;

      if K > GrdRiDiBa.Columns.Count then
      begin
        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
        begin
          FieldName := 'NUMOP_PI';
          dataType := dtTesto;
          Alignment := taRightJustify;
          Title.Caption := 'Num. PI';
          Width := 50;
        end;
      end;
    end;

    if not ColExistsDescrPI then
    begin
      for K := 1 to GrdRiDiBa.Columns.Count do
        if GrdRiDiBa.Columns[K - 1].FieldName = 'DESCR_PI' then
          break;

      if K > GrdRiDiBa.Columns.Count then
      begin
        with TS3Column(GrdRiDiBa.Columns.Insert(0)) do
        begin
          FieldName := 'DESCR_PI';
          dataType := dtTesto;
          Alignment := taLeftJustify;
          Title.Caption := 'Descr. PI';
          Width := 200;
        end;
      end;
    end;
  finally
    if Assigned(Lista) then
      Lista.free;
    if Assigned(OEdbgrRigheRefreshData) then
      OEdbgrRigheRefreshData(Sender);
  end; // end try...finally
end;
//  ----------------------------------------------------------------------------
//  Gestione stato del pulsante
//  ----------------------------------------------------------------------------

procedure TGstPI.PIChangePageControl(sender: TObject);
begin
  if Assigned(OEChangePageControl) then
    OEChangePageControl(sender);

  if (PageControl1.ActivePageIndex = 1) then
  begin
    btn.enabled := true;
  end
  else
  begin
    btn.enabled := false;
  end;
end;
//  ----------------------------------------------------------------------------
//  Alla pressione del tasto
//  ----------------------------------------------------------------------------

procedure TGstPI.btnTaglioDTOnClick(Sender: TObject);
var
  iIdPIDT: Integer;
  iIdComRig: Integer;
  GrdPIDT: TSMDBGrid;
  QryTmp: TCSEQuery;
begin
  GetFormComp('grPIDT', GrdPIDT);
  iIdPIDT := GrdPIDT.DataSource.Dataset.FieldByName('ID').AsInteger;

  QryTmp := TCSEQuery.Create(nil);
  try
    QryTmp.DataBaseName := Azienda.DataBaseName;
    QryTmp.Sql.Clear;
    QryTmp.Sql.Add('select op.ID, op.IDCOMRIG, cm.QTA1,cm.QTA2,cm.QTA3,cm.IDARTICO,cm.PREZZO from OPDT as dt ' +
        'inner join OPTES as op on op.ID=dt.IDOPTES ' +
        'inner join COMRIG as cm on cm.ID=op.IDCOMRIG ' +
        'inner join TIPIDOC as td on op.idtipidoc=td.id ' +
        'where td.tipdoc=''D'' and dt.ID=' + IntToStr(iIdPIDT));
    QryTmp.Open;
    if not QryTmp.IsEmpty then
    begin
      iIdComRig := QryTmp.FieldByName('IDCOMRIG').AsInteger;
      CreaPrevInd(iIdComRig);
    end;
  finally
    QryTmp.free;
  end;
end;
//  ----------------------------------------------------------------------------
//                          NUOVA VERSIONE
//  ----------------------------------------------------------------------------
//  Alla pressione del tasto
//  ----------------------------------------------------------------------------

procedure TGstPI.btnTaglioOVOnClick(Sender: TObject);
var
  iIdPIDT: Integer;
  iIdComRig: Integer;
  GrdPIOV: TSMDBGrid;
  QryTmp: TCSEQuery;
begin
  GetFormComp('dbgrRighe', GrdPIOV);
  iIdPIDT := GrdPIOV.DataSource.Dataset.FieldByName('RIF_ID').AsInteger;

  QryTmp := TCSEQuery.Create(nil);
  try
    QryTmp.DataBaseName := Azienda.DataBaseName;
    QryTmp.Sql.Clear;
    QryTmp.Sql.Add('select optes.ID from COMRIG as cm ' +
        'inner join optes on cm.id=optes.idcomrig ' +
        'inner join ext_pialtatg on ext_pialtatg.idoptes=optes.id ' +
        'where cm.ID=' + IntToStr(iIdPIDT));
    QryTmp.Open;
    if not QryTmp.IsEmpty then
    begin
      iIdComRig := QryTmp.FieldByName('ID').AsInteger;
      VisualizzaPrevInd(iIdComRig);
    end
    else
    begin
      Application.MessageBox(PChar('Nessun PI associato alla riga corrente.'),
          PChar(APPTITLE),
          MB_OK + MB_ICONINFORMATION);
    end;
  finally
    QryTmp.free;
  end;
end;
//  ----------------------------------------------------------------------------
//  Aggiorno il P.I:
//  ----------------------------------------------------------------------------

procedure TGstPI.VisualizzaPrevInd(iId: Integer);
var
  livello: Tlivello;
  FrmPrdOPDT: IFrmPrdStd;
begin
  livello := liAll;
  FrmPrdOPDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', iId, livello) as IFrmPrdStd;
  if (Assigned(FrmPrdOPDT)) then
  begin
    FrmPrdOPDT.Show();
  end
  else
  begin
    Application.MessageBox(PChar('Impossibile aprire il P.I.'), PChar(PChar(APPTITLE)), MB_ICONWARNING + MB_OK);
  end;
end;
{
//  ----------------------------------------------------------------------------
//  Alla pressione del tasto
//  ----------------------------------------------------------------------------
procedure TGstPI.btnTaglioOVOnClick(Sender: TObject);
var
  iIdPIDT   : Integer;
  iIdComRig : Integer;
  GrdPIOV   : TSMDBGrid;
  QryTmp    : TCSEQuery;
begin
  GetFormComp('dbgrRighe', GrdPIOV);
  iIdPIDT := GrdPIOV.DataSource.Dataset.FieldByName('RIF_ID').AsInteger;

  QryTmp:=TCSEQuery.Create(nil);
  try
    QryTmp.DataBaseName := Azienda.DataBaseName;
    QryTmp.Sql.Clear;
    QryTmp.Sql.Add('select cm.ID from COMRIG as cm ' +
                      'inner join optes on cm.id=optes.idcomrig ' +
                      'inner join ext_pialtatg on ext_pialtatg.idoptes=optes.id ' +
                   'where cm.ID='+IntToStr(iIdPIDT));
    QryTmp.Open;
    if not QryTmp.IsEmpty then
    begin
      iIdComRig := QryTmp.FieldByName('ID').AsInteger;
      CreaPrevInd(iIdComRig);
    end
    else
    begin
      Application.MessageBox( PChar( 'Nessun PI associato alla riga corrente.' ),
                              PChar( APPTITLE ),
                              MB_OK + MB_ICONINFORMATION );
    end;
  finally
    QryTmp.free;
  end;
end;
}
//  ----------------------------------------------------------------------------
//  Aggiorno il P.I:
//  ----------------------------------------------------------------------------

procedure TGstPI.CreaPrevInd(iIdComRig: Integer);
var
  iIdComTes: Integer;
  sUmrPre: string;
  dQta1: Double;
  dQta2: Double;
  dQta3: Double;
  dPrezzo: Double;
  QryTmp: TCSEQuery;
  FrmPrevInd: TFrmGstPI;
begin
  FrmPrevInd := TFrmGstPI.create(nil);
  try
    FrmPrevInd.Livello := liAll;
    FrmPrevInd.Idcomrig := iIdComRig;
    FrmPrevInd.bSolaLettura := true;
    FrmPrevInd.ShowModal;
//
//  Riportiamo i dati dal preventivo alla riga se l'utente è abilitato
//
    if FrmPrevInd.ValidaUtente and ((FrmPrevInd.AskAggPrezzoComRig = 2) or ((FrmPrevInd.AskAggPrezzoComRig = 1) and
      (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes))) then
    begin
      QryTmp := TCSEQuery.Create(nil);
      try
        QryTmp.DataBaseName := Azienda.DataBaseName;
        QryTmp.Sql.Clear;
        QryTmp.Sql.Add('select c.ID, c.IDCOMTES, a.UMRPRE, c.PREZZO, c.QTA1, c.QTA2, c.Qta3 from COMRIG as c ' +
            'inner join LOTSER as l on l.ID=c.IDARTICO ' +
            'inner join ARTICO as a on a.ID=l.IDARTICO ' +
            'where c.ID=' + IntToStr(iIdComRig));
        QryTmp.Open;
        if not QryTmp.IsEmpty then
        begin
          iIdComTes := QryTmp.FieldByName('IDCOMTES').AsInteger;
          sUmrPre := QryTmp.FieldByName('UMRPRE').AsString;
          dQta1 := QryTmp.FieldByName('QTA1').AsFloat;
          dQta2 := QryTmp.FieldByName('QTA2').AsFloat;
          dQta3 := QryTmp.FieldByName('QTA3').AsFloat;
          dPrezzo := QryTmp.FieldByName('PREZZO').AsFloat;

          ModificaCommessa(iIdComTes, iIdComRig, sUmrPre, dQta1, dQta2, dQta3, dPrezzo);
        end;
      finally
        QryTmp.free;
      end;
    end;
  finally
    FrmPrevInd.free;
  end;
end;
//  ----------------------------------------------------------------------------
//  Modifico i dati della commessa che ha generato il preventivo industriale
//  ----------------------------------------------------------------------------

procedure TGstPI.ModificaCommessa(iIdComTes: Integer; iIdComRig: Integer; sUmrPre: string; dQta1: Double; dQta2: Double; dQta3: Double; dPrezzo: Double);
var
  InTrans: Boolean;
  OComRig: IComRigStd;
  OComTes: IComTesStd;
  QryPar: TCSEQuery;
begin

  InTrans := false;

  if (not GetInterfOggetto('ObjComTes', 'COMTES', IComTesStd, OComTes)) then
  begin
    MessageDlg('Interfaccia Commesse non istanziata correttamente.', mtError, [mbOk], 0);
    Exit;
  end;

  if (not GetInterfOggetto('ObjComRig', 'COMRIG', IComRigStd, OComRig)) then
  begin
    MessageDlg('Interfaccia Righe Commessa non istanziata correttamente.', mtError, [mbOk], 0);
    Exit;
  end;

  QryPar := TCSEQuery.Create(nil);
  QryPar.DatabaseName := DBExec.DatabaseName;
  try
    OComTes.Seek('Id', iIdComTes);
    if not OComTes.Found then
    begin
      MessageDlg('Non è stata trovata una commessa per questa riga.', mtWarning, [mbOK], 0);
      Exit;
    end;

    OComRig.Seek('Id', iIdComRig);
    if not OComRig.Found then
    begin
      MessageDlg('Non è stata trovata una commessa per questa riga.', mtWarning, [mbOK], 0);
      Exit;
    end;

    InTrans := DBExec.InTransaction;
    if not InTrans then
      DBExec.CSStartTransaction;

    QryPar.sql.Text := 'Select cli.SpeInc, cli.SpeBol, cli.AddBollo ' +
      'from ComTes t ' +
      'inner join clienti cli on t.idcliente=cli.id ' +
      'where (t.id= ' + CS_KeyValueTo_SqlStr(iIdComTes) + ') ';
    QryPar.Open;

    if (((sUmrPre = '') or (sUmrPre = 'I')) and (dQta3 <> 0)) then
      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo)) / dQta3
    else if (sUmrPre = 'M') and (dQta2 <> 0) then
      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo)) / dQta2
    else if (sUmrPre = 'V') and (dQta1 <> 0) then
      dPrezzo := zeroifnull(ExtractVariant(FrmGstPI.edtTotale.text, importo)) / dQta1
    else
      dPrezzo := 0.0;

    OComRig.CampiObj['Prezzo'] := dPrezzo;
    OComRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro, Azienda.RValutaSi.DecContEuro);
    OComRig.Modifica;
    OComRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro, Azienda.RValutaSi.DecContEuro);

    OComTes.RicalcolaTotali((QryPar.FieldByName('SpeInc').AsInteger = -1),
        (QryPar.FieldByName('SpeBol').AsInteger = -1),
        (QryPar.FieldByName('AddBollo').AsInteger = -1));

    OComTes.Modifica;

    if not InTrans then
      DBExec.Commit;
  except
    on e: Exception do
    begin
      if not InTrans then
        DBExec.RollBack;
    end;
  end;
end;

procedure TGstPI.PlugIn_PrevInd;
{var
  pi_btnPrevInd: TSpeedButton;}
begin
  {  cv 20.09.05  servivano alla 2.16
  GetFormComp('btnPrevInd', pi_btnPrevInd);
  if not assigned(pi_btnPrevInd) then begin
    showmessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PlugIn_PrevInd).');
  end
  else begin
    pi_btnPrevInd.enabled:=true;
    pi_btnPrevInd.visible:=true;
  end;

  RedirEvent('btnPrevInd', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');}
  // RedirEvent('CkbFatDir', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');
  RedirEvent('btnPrevInd', 'OnClick', 'OEClickbtnPrevInd', 'PIClickbtnPrevInd');
  RedirEvent('edtPrezzo', 'Onexit', 'OEExitedtPrezzo', 'PIExitedtPrezzo');        //  così mi aggiorna i prezzi della riga
  RedirEvent('cbxRiferi1', 'OnChange', 'OEChangecbxRiferi1', 'PIChangecbxRiferi1');     //  così mi aggiorna lo stato della riga
end;

procedure TGstPI.PIExitedtPrezzo(Sender: TObject);
begin
  if Assigned(OEExitedtPrezzo) then
    OEExitedtPrezzo(Sender);
end;

procedure TGstPI.PIChangecbxRiferi1(Sender: TObject);
begin
  if Assigned(OEChangecbxRiferi1) then
    OEChangecbxRiferi1(Sender);
end;

{
procedure TGstPI.PIClickbtnPrevInd(Sender: TObject);
var
  OpenPi        : Integer;
  QryTmp        : TCSEQuery;
  piDbgrComRig  : TSMDBGrid;
  piEdtQta1, piEdtQta2, piEdtQta3, piEdtPrezzo: Tget;
  piF2IdArtico: TF2;
begin
  GetFormComp('dbgrComRig', piDbgrComRig);
  GetFormComp('F2IdArtico', piF2IdArtico);
  GetFormComp('EdtQta1',    piEdtQta1);
  GetFormComp('EdtQta2',    piEdtQta2);
  GetFormComp('EdtQta3',    piEdtQta3);
  GetFormComp('edtPrezzo',  piEdtPrezzo);
  if (not assigned(piDbgrComRig)) or
     (not assigned(piF2IdArtico)) or
     (not assigned(piEdtQta1)) or
     (not assigned(piEdtQta2)) or
     (not assigned(piEdtQta3)) or
     (not assigned(piEdtPrezzo)) then
  begin
    ShowMessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PIClickbtnPrevInd).');
  end
  else
  begin
    QryTmp:=TCSEQuery.Create(nil);
    try
      QryTmp.DataBaseName := Azienda.DataBaseName;
      QryTmp.Sql.Clear;
      QryTmp.Sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id '+
                     'where td.tipdoc=''D'' and o.idcomrig='+inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
      QryTmp.Open;
      if QryTmp.isempty then
      begin
        OpenPi := BTN_PrevInd(Sender);   //   il PI non è creato: lo creo con la loro finestra
        if (OpenPi = 0) then
        begin
          if bValidaUtente and ((iAskAggPrezzoComRig=2) or ((iAskAggPrezzoComRig=1) and
                (Messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
          begin
            if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
              piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta3.getvalue)
            else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
              piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta2.getvalue)
            else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
              piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo))/piEdtQta1.getvalue)
            else
              piEdtPrezzo.settext(0);

            PIExitedtPrezzo(Sender);
            PIChangecbxRiferi1(Sender);
          end;
        end
        else if (OpenPi = 1) then
        begin
          if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI è creato: lo visualizzo con la finestra std
        end;
      end
      else
      begin
        if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI è creato: lo visualizzo con la finestra std
      end;
    finally
      QryTmp.free;
    end;
  end;
end;

function TGstPI.BTN_PrevInd(Sender: TObject) : Integer;
var
  FrmPrevInd: TFrmGstPI;
  piDbgrComRig: TSMDBGrid;
  piEdtQta1, piEdtQta2, piEdtQta3, piEdtPrezzo: Tget;
  piF2IdArtico: TF2;
begin
  GetFormComp('dbgrComRig', piDbgrComRig);
  GetFormComp('F2IdArtico', piF2IdArtico);
  GetFormComp('EdtQta1',    piEdtQta1);
  GetFormComp('EdtQta2',    piEdtQta2);
  GetFormComp('EdtQta3',    piEdtQta3);
  GetFormComp('edtPrezzo',  piEdtPrezzo);
  if (not assigned(piDbgrComRig)) or
     (not assigned(piF2IdArtico)) or
     (not assigned(piEdtQta1)) or
     (not assigned(piEdtQta2)) or
     (not assigned(piEdtQta3)) or
     (not assigned(piEdtPrezzo)) then
  begin
    ShowMessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (BTN_PrevInd).');
    Result := 0;
  end
  else
  begin

    FrmPrevInd:=TFrmGstPI.create(nil);
    try
      FrmPrevInd.livello:=TFormStd(form).livello;
      FrmPrevInd.idcomrig:=TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
      FrmPrevInd.bSolaLettura := false;
      FrmPrevInd.showmodal;

      bValidaUtente       := FrmPrevInd.ValidaUtente();
      iAskAggPrezzoComRig := FrmPrevInd.AskAggPrezzoComRig;
      sEdtTotale          := FrmPrevInd.edtTotale.text;

      // Riportiamo i dati dal preventivo alla riga se l'utente è abilitato

//      if FrmPrevInd.ValidaUtente and
//         ((FrmPrevInd.AskAggPrezzoComRig=2) or
//          ((FrmPrevInd.AskAggPrezzoComRig=1) and
//           (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes))) then
//      begin
//        if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
//          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta3.getvalue)
//        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
//          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta2.getvalue)
//        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
//          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta1.getvalue)
//        else
//          piEdtPrezzo.settext(0);
//
//        PIExitedtPrezzo(Sender);
//        PIChangecbxRiferi1(Sender);
//      end;
//
      Result := FrmPrevInd.OpenPI;

    finally
      FrmPrevInd.free;
    end;
  end;
end;
}

procedure TGstPI.PIClickbtnPrevInd(Sender: TObject);
begin
  BTN_PrevInd(Sender);
end;

procedure TGstPI.BTN_OpenPrevInd(Sender: TObject);
//var
//  FrmPIDT: IFrmPrdStd;
//  LQry: TCSEQuery;
//  LSqlQry, LMsgErr: string;
begin
  if Assigned(OEClickbtnPrevInd) then
    OEClickbtnPrevInd(Sender);   //   il PI è creato: lo visualizzo con la finestra std

//  LQry := TCSEQuery.Create(nil);
//  try
//    LQry.DatabaseName := DBExec.DatabaseName;
//
//    LSqlQry := ''
//      + ' select o.id '
//      + ' from optes o '
//      + ' inner join tipidoc td on o.idtipidoc=td.id '
//      + ' where td.tipdoc=''D'' '
//      + ' and o.idcomrig=' + CS_VariantTo_SqlStr(PropValueVar['IdRiga']);
//
//    LMsgErr := CS_OpenQry(LSqlQry, LQry);
//
//    if LMsgErr <> '' then
//      raise Exception.Create(LMsgErr);
//
////    if not LQry.Eof then
////    begin
////      if LQry.FieldByName('ID').AsInteger > 0 then
////      begin
//    if (not LoadSamModule(ModuloPrd)) then
//      Exit;
//
//    // Faccio vedere il preventivo se ho l'autorizzazione
//    FrmPIDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', LQry.FieldByName('ID').AsInteger, liAll) as IFrmPrdStd;
//
//    if (Assigned(FrmPIDT)) then
//      FrmPIDT.Show;
////      end;
////    end;
//  finally
//    LQry.Close;
//    FreeAndNil(LQry);
//  end;
end;

function TGstPI.BTN_PrevInd(Sender: TObject): Integer;
var
  bModifica: Boolean;
  Ritorno: Integer;
  OpenPi: Integer;
  QryTmp: TCSEQuery;
  piDbgrComRig: TSMDBGrid;
  piEdtQta1: Tget;
  piEdtQta2: Tget;
  piEdtQta3: Tget;
  piEdtPrezzo: Tget;
  piF2IdArtico: TF2;
  FrmPrevInd: TFrmGstPI;
begin
  Result := 0;

  GetFormComp('dbgrComRig', piDbgrComRig);
  GetFormComp('F2IdArtico', piF2IdArtico);
  GetFormComp('EdtQta1', piEdtQta1);
  GetFormComp('EdtQta2', piEdtQta2);
  GetFormComp('EdtQta3', piEdtQta3);
  GetFormComp('edtPrezzo', piEdtPrezzo);
  if (not assigned(piDbgrComRig)) or
    (not assigned(piF2IdArtico)) or
    (not assigned(piEdtQta1)) or
    (not assigned(piEdtQta2)) or
    (not assigned(piEdtQta3)) or
    (not assigned(piEdtPrezzo)) then
  begin
    ShowMessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PIClickbtnPrevInd).');
  end
  else
  begin
    QryTmp := TCSEQuery.Create(nil);
    try
      QryTmp.DataBaseName := Azienda.DataBaseName;
      QryTmp.Sql.Clear;
      QryTmp.Sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id ' +
          'where td.tipdoc=''D'' and o.idcomrig=' + inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
      QryTmp.Open;

      bModifica := false;
      if (QryTmp.IsEmpty() = false) then
      begin
        Ritorno := MessageDlg('Desidera modificare il preventivo industriale?', mtConfirmation, [mbYes, mbNo], 0);
        if (Ritorno = mrYes) then
        begin
          bModifica := true;
        end;
      end;

      if ((QryTmp.IsEmpty()) or ((QryTmp.IsEmpty() = false) and (bModifica = true))) then
      begin
        FrmPrevInd := TFrmGstPI.create(nil);
        try
          FrmPrevInd.livello := TFormStd(form).livello;
          FrmPrevInd.idcomrig := TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
          FrmPrevInd.bSolaLettura := false;
          FrmPrevInd.showmodal;

          bValidaUtente := FrmPrevInd.ValidaUtente();
          iAskAggPrezzoComRig := FrmPrevInd.AskAggPrezzoComRig;
          sEdtTotale := FrmPrevInd.edtTotale.text;

          OpenPi := FrmPrevInd.OpenPI;
          if (OpenPi = 0) then
          begin
            if bValidaUtente and ((iAskAggPrezzoComRig = 2) or ((iAskAggPrezzoComRig = 1) and
              (Messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes))) then
            begin
              if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = '') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = 'I')) and
                (piEdtQta3.getvalue <> 0) then
                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo)) / piEdtQta3.getvalue)
              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = 'M') and (piEdtQta2.getvalue <> 0) then
                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo)) / piEdtQta2.getvalue)
              else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring = 'V') and (piEdtQta1.getvalue <> 0) then
                piEdtPrezzo.settext(zeroifnull(ExtractVariant(sEdtTotale, importo)) / piEdtQta1.getvalue)
              else
                piEdtPrezzo.settext(0);

              PIExitedtPrezzo(Sender);
              PIChangecbxRiferi1(Sender);
            end;
          end
          else if (OpenPi = 1) then
          begin
            if Assigned(OEClickbtnPrevInd) then
              OEClickbtnPrevInd(Sender);   //   il PI è creato: lo visualizzo con la finestra std
          end;
        finally
          FrmPrevInd.free;
        end;
      end
      else
      begin
        if Assigned(OEClickbtnPrevInd) then
          OEClickbtnPrevInd(Sender);   //   il PI è creato: lo visualizzo con la finestra std
      end;
    finally
      QryTmp.free;
    end;
  end;
end;

// LBI 19/10/2016 - Ticket n° 11302/2016	- "plug_in visualizzazione OP Prev Ind su grigli Comm"
procedure TGstPI.GenerazioneOP;
var
  I: Integer;
  objOrPr: TOrPr;
  objOPTes: IOrPr;
  Msg: string;
  Year, Month, Day: Word;
  NewqryRighe: TQueryPars;
  NewdbgrRighe: TSMDBGrid;
  NewTran, FlagErr: Boolean;
  ListaIdComRig, ListaIdComRigOnOP: TStringList;
  QryArtExistsDB, QryComRigExistsOP, QryComRigExistsPI, qryTipiDocOP, QryNumOP: TCSEQuery;
begin
  // Modifica del tipo documento
  GetFormComp('dbgrRighe', NewdbgrRighe);
  GetFormComp('qryRighe', NewqryRighe);
  if NewdbgrRighe.SelectedRows.Count > 0 then
  begin
    Msg := 'Si desidera generare gli Ordini di Produzione per le righe selezionate?';
    if Application.MessageBox(PChar(Msg),
        PChar(Application.Title),
        MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      // Creazione oggetti qry
      QryNumOP := TCSEQuery.Create(nil);
      QryNumOP.DatabaseName := DBExec.DatabaseName;
      qryTipiDocOP := TCSEQuery.Create(nil);
      qryTipiDocOP.DatabaseName := DBExec.DatabaseName;
      QryArtExistsDB := TCSEQuery.Create(nil);
      QryArtExistsDB.DatabaseName := DBExec.DatabaseName;
      QryComRigExistsOP := TCSEQuery.Create(nil);
      QryComRigExistsOP.DatabaseName := DBExec.DatabaseName;
      QryComRigExistsPI := TCSEQuery.Create(nil);
      QryComRigExistsPI.DatabaseName := DBExec.DatabaseName;

      // Creazione dell'oggetto Produzione per generare un Ordine di Produzione
      // dal Preventivo Industriale
      if not Assigned(objOPTes) then
        if not GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, objOPTes) then
        begin
          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente errore ' +
            'durante un errore durante generazione dell''interfaccia "IOrPr".';
          Application.MessageBox(PChar(Msg),
              PChar(Application.Title),
              MB_ICONINFORMATION + MB_OK);
          Exit;
        end;

      // Creazione dell'oggetto Produzione per generare un Ordine di Produzione
      // dalla Distinta Base dell'articolo
      objOrPr := TOrPr.Create(DBExec, Utente);

      // Creazione variabile lista righe di commesse per le quali non è stato possibile
      // generarre un Ordine di Produzione
      ListaIdComRig := TStringList.Create;
      ListaIdComRig.Clear;

      // Creazione variabile lista righe di commesse per le quali non è stato possibile
      // generarre un Ordine di Produzione perchè già esiste
      ListaIdComRigOnOP := TStringList.Create;
      ListaIdComRigOnOP.Clear;

      // Apertura Transazione
      NewTran := not DBExec.InTransaction;
      if NewTran then
        DBExec.CSStartTransaction;
      FlagErr := False;
      try
        QryArtExistsDB.Sql.Text := 'SELECT v.Id, v.Idartico FROM VarDB v ' +
          'INNER JOIN Lotser ls ON v.Idartico = ls.Idartico ' +
          'INNER JOIN Artico art ON ls.Idartico = art.Id ' +
          'WHERE (art.codice = :VCodice) AND ' +
          '(ls.Numser = ' + CS_VariantTo_SqlStr(NUMSERDEF) + ') AND ' +
          '(ls.Numlot = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ')';
        QryArtExistsDB.Prepare;

        QryComRigExistsOP.Sql.Text := 'SELECT op.Id FROM Optes op ' +
          'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
          'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
          '(tp.Tipdoc = ''P'')';
        QryComRigExistsOP.Prepare;

        QryComRigExistsPI.Sql.Text := 'SELECT op.Id FROM Optes op ' +
          'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
          'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
          '(tp.Tipdoc = ''D'')';
        QryComRigExistsPI.Prepare;

        // Modifico solo D.d.T selezionati sulla griglia
        for I := 0 to NewdbgrRighe.SelectedRows.Count - 1 do
        begin
          NewqryRighe.Bookmark := NewdbgrRighe.SelectedRows[I];

          // Verifico se esiste già un OP legato alla mia riga di commessa
          QryComRigExistsOP.Close;
          QryComRigExistsOP.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
          try
            QryComRigExistsOP.Open;

            // L'OP non esiste ancora percui lo devo creare
            if QryComRigExistsOP.Eof then
            begin
              // Verifico se la Riga di Commessa è legata a un Preventivo Industriale
              QryComRigExistsPI.Close;
              QryComRigExistsPI.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
              QryComRigExistsPI.Open;

              if not QryComRigExistsPI.Eof then
              begin
                // Generazione dell'Ordine di Produzione dal Preventivo Industriale legato alla Riga della Commessa
                Msg := '';

                objOPTes.Seek('Id', QryComRigExistsPI.fieldByName('Id').AsInteger);
                if objOPTes.Found then
                begin
                  // Determinazione del tipo Documento Ordine di Produzione
                  qryTipiDocOP.Close;
                  qryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
                    'WHERE (Tipdoc = ''P'') ' +
                    'ORDER BY Tipnum ASC';
                  try
                    qryTipiDocOP.Open;
                  except
                    on E: Exception do
                    begin
                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                        'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
                      FlagErr := True;
                      Exit;
                    end;
                  end;

                  DecodeDate(DBExec.Data, Year, Month, Day);
                  // Determinazione del numero
                  QryNumOP.Close;
                  QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
                    'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(qryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
                    '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
                    'GROUP BY Tipnum';
                  try
                    QryNumOP.Open;
                  except
                    on E: Exception do
                    begin
                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                        'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
                      FlagErr := True;
                      Exit;
                    end;
                  end;

                  // Generazione Ordine di Produzione da Preventivo Industriale
                  Msg := GeneraOPdaPI(objOPTes.CampiObj['Id'],
                      qryTipiDocOP.FieldByName('Id').AsInteger,
                      Year,
                      QryNumOP.FieldByName('Numop').AsInteger,
                      qryTipiDocOP.FieldByName('Tipnum').AsString,
                      (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
                      CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString)),
                      NewqryRighe.FieldByName('Rif_Id').AsInteger,
                      objOrPr);
                  if Msg <> '' then
                  begin
                    FlagErr := True;
                    Exit;
                  end
                end;
              end
              else
              begin
                // Verifico se l'articolo della Riga della Commessa presenta una Distinta Base
                QryArtExistsDB.Close;
                QryArtExistsDB.Params[0].AsString := NewqryRighe.FieldByName('Arti_Codice').AsString;
                QryArtExistsDB.Open;

                if not QryArtExistsDB.Eof then
                begin
                  // Generazione dell'Ordine di Produzione dalla Distinta Base con quantità uguale alla qta1 della Riga di Commmessa
                  Msg := '';

                  // Determinazione del tipo Documento Ordine di Produzione
                  qryTipiDocOP.Close;
                  qryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
                    'WHERE (Tipdoc = ''P'') ' +
                    'ORDER BY Tipnum ASC';
                  try
                    qryTipiDocOP.Open;
                  except
                    on E: Exception do
                    begin
                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                        'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
                      FlagErr := True;
                      Exit;
                    end;
                  end;

                  DecodeDate(DBExec.Data, Year, Month, Day);
                  // Determinazione del numero
                  QryNumOP.Close;
                  QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
                    'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(qryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
                    '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
                    'GROUP BY Tipnum';
                  try
                    QryNumOP.Open;
                  except
                    on E: Exception do
                    begin
                      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                        'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
                      FlagErr := True;
                      Exit;
                    end;
                  end;

                  // Generazione della testata dell'OP relativa all'articolo
                  // riportato sulla riga di commessa
                  with objOPTes do
                  begin
                    Found := False;
                    CampiObj['Idtipidoc'] := qryTipiDocOP.FieldByName('Id').AsInteger;
                    CampiObj['TipNum'] := qryTipiDocOP.FieldByName('Tipnum').AsString;
                    CampiObj['AnnOP'] := Year;
                    CampiObj['NumOP'] := QryNumOP.FieldByName('Numop').AsInteger;
                    CampiObj['Stato'] := 'P';
                    CampiObj['Idartico'] := QryArtExistsDB.FieldByName('Idartico').AsInteger;
                    CampiObj['Qtaop'] := (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
                      CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString));
                    CampiObj['DatVal'] := DBExec.Data;
                    CampiObj['DatEmi'] := DBExec.Data;
                    CampiObj['Idcomrig'] := NewqryRighe.FieldByName('Rif_Id').AsInteger;
                    CampiObj['CodVarDB'] := NewqryRighe.FieldByName('Vdb_Codice').AsString;
                    CampiObj['Idallver'] := GetPardef('ALLPF', DBExec.DatabaseName);
                  end; // end with

                  if not objOPTes.GeneraOP > 0 then
                  begin
                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un ' +
                      'errore durante la generazione dell''Ordine di Produzione.';
                    FlagErr := True;
                    Exit;
                  end
                end;
              end;
            end
            else
            begin
              // Segnalazione delle Righe di Commessa per le quali non è possibile generare
              // un Ordine di Produzione perghè ha gia un Ordine di Produzione
              ListaIdComRigOnOP.Add('Commessa:' +
                  NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
                  NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
                  NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
                  'Riga: ' +
                  NewqryRighe.FieldByName('Crig_DESCR').AsString);
            end;
          except
            on E: Exception do
            begin
              Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                'errore con il database:' + CRLF + E.Message;
              FlagErr := True;
              Break;
            end;
          end; // end try...except
        end; // end for
      finally
        // Chiusura transazione
        if NewTran then
          if not FlagErr then
          begin
            DBExec.Commit;
            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then
            begin
              Msg := 'Operazione di generazione Ordini di Produzione completata.';
              Application.MessageBox(PChar(Msg),
                  PChar(Application.Title),
                  MB_ICONINFORMATION + MB_OK);
            end
            else
            begin
              Msg := 'Operazione di generazione Ordini di Produzione non è andata a buon fine ' +
                'per alcune righe selezionate.';
              if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count <> 0) then
                MsgError(Msg,
                    'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
                    ListaIdComRig.Text + CRLF +
                    'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
                    ListaIdComRigOnOP.Text)
              else
              begin
                if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count = 0) then
                  MsgError(Msg,
                      'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
                      ListaIdComRig.Text);
                if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count <> 0) then
                  MsgError(Msg,
                      'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
                      ListaIdComRigOnOP.Text);
              end;
            end;
          end
          else
          begin
            DBExec.Rollback;
            Msg := 'L''operazione di generazione Ordini di Produzione non è andata a boun fine.' + CRLF + Msg;
            Application.MessageBox(PChar(Msg),
                PChar(Application.Title),
                MB_ICONERROR + MB_OK);
          end;

        // Distruzione oggetti Qry
        if Assigned(qryTipiDocOP) then
        begin
          qryTipiDocOP.Close;
          FreeAndNil(qryTipiDocOP);
        end;

        if Assigned(QryNumOP) then
        begin
          QryNumOP.Close;
          FreeAndNil(QryNumOP);
        end;

        if Assigned(QryArtExistsDB) then
        begin
          QryArtExistsDB.Close;
          if QryArtExistsDB.Prepared then
            QryArtExistsDB.UnPrepare;
          FreeAndNil(QryArtExistsDB);
        end;

        if Assigned(QryComRigExistsOP) then
        begin
          QryComRigExistsOP.Close;
          if QryComRigExistsOP.Prepared then
            QryComRigExistsOP.UnPrepare;
          FreeAndNil(QryComRigExistsOP);
        end;

        if Assigned(QryComRigExistsPI) then
        begin
          QryComRigExistsPI.Close;
          if QryComRigExistsPI.Prepared then
            QryComRigExistsPI.UnPrepare;
          FreeAndNil(QryComRigExistsPI);
        end;
      end; // end try...finally
    end;
  end
  else
  begin
    Msg := 'Nessuna riga è stata selezionata.';
    Application.MessageBox(PChar(Msg),
        PChar(Application.Title),
        MB_ICONINFORMATION + MB_OK);
  end;
end;
// ...lbi

(*procedure TGstPI.GenerazioneOP;
var
  I: Integer;
  objOrPr: TOrPr;
  objOPTes: IOrPr;
  Msg: String;
  Year, Month, Day: Word;
  NewqryRighe: TQueryPars;
  NewdbgrRighe: TSMDBGrid;
  NewTran, FlagErr: Boolean;
  ListaIdComRig, ListaIdComRigOnOP: TStringList;
  QryArtExistsDB, QryComRigExistsOP, QryComRigExistsPI, qryTipiDocOP, QryNumOP: TCSEQuery;
begin
  // Modifica del tipo documento
  GetFormComp('dbgrRighe', NewdbgrRighe);
  GetFormComp('qryRighe', NewqryRighe);
  if NewdbgrRighe.SelectedRows.Count > 0 then
  begin
    Msg := 'Si desidera generare gli Ordini di Produzione per le righe selezionate?';
    if Application.MessageBox(PChar(Msg),
                              PChar(Application.Title),
                              MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      // Creazione oggetti qry
      QryNumOP := TCSEQuery.Create(nil);
      QryNumOP.DatabaseName := DBExec.DatabaseName;
      QryTipiDocOP := TCSEQuery.Create(nil);
      QryTipiDocOP.DatabaseName := DBExec.DatabaseName;
      QryArtExistsDB := TCSEQuery.Create(nil);
      QryArtExistsDB.DatabaseName := DBExec.DatabaseName;
      QryComRigExistsOP := TCSEQuery.Create(nil);
      QryComRigExistsOP.DatabaseName := DBExec.DatabaseName;
      QryComRigExistsPI := TCSEQuery.Create(nil);
      QryComRigExistsPI.DatabaseName := DBExec.DatabaseName;

      // Creazione dell'oggetto Produzione per generare un Ordine di Produzione
      // dal Preventivo Industriale
      if not Assigned(objOPTes) then
        if not GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, objOPTes) then
        begin
          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente errore ' +
                 'durante un errore durante generazione dell''interfaccia "IOrPr".';
          Application.MessageBox(PChar(Msg),
                                 PChar(Application.Title),
                                 MB_ICONINFORMATION + MB_OK);
          Exit;
        end;

      // Creazione dell'oggetto Produzione per generare un Ordine di Produzione
      // dalla Distinta Base dell'articolo
      objOrPr := TOrPr.Create(DBExec, Utente);

      // Creazione variabile lista righe di commesse per le quali non è stato possibile
      // generarre un Ordine di Produzione
      ListaIdComRig := TStringList.Create;
      ListaIdComRig.Clear;

      // Creazione variabile lista righe di commesse per le quali non è stato possibile
      // generarre un Ordine di Produzione perchè già esiste
      ListaIdComRigOnOP := TStringList.Create;
      ListaIdComRigOnOP.Clear;

      // Apertura Transazione
      NewTran := not DBExec.InTransaction;
      if NewTran then DBExec.CSStartTransaction;
      FlagErr := False;
      try
        QryArtExistsDB.Sql.Text := 'SELECT v.Id, v.Idartico FROM VarDB v ' +
                                   'INNER JOIN Lotser ls ON v.Idartico = ls.Idartico ' +
                                   'INNER JOIN Artico art ON ls.Idartico = art.Id ' +
                                   'WHERE (art.codice = :VCodice) AND ' +
                                         '(ls.Numser = ' + CS_VariantTo_SqlStr(NUMSERDEF) + ') AND ' +
                                         '(ls.Numlot = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ')';
        QryArtExistsDB.Prepare;

        QryComRigExistsOP.Sql.Text := 'SELECT op.Id FROM Optes op ' +
                                      'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
                                      'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
                                            '(tp.Tipdoc = ''P'')';
        QryComRigExistsOP.Prepare;

        QryComRigExistsPI.Sql.Text := 'SELECT op.Id FROM Optes op ' +
                                      'INNER JOIN Tipidoc tp ON op.Idtipidoc = tp.Id ' +
                                      'WHERE (op.Idcomrig = :VIdcomrig) AND ' +
                                            '(tp.Tipdoc = ''D'')';
        QryComRigExistsPI.Prepare;

        // Modifico solo D.d.T selezionati sulla griglia
        for I := 0 to NewdbgrRighe.SelectedRows.Count - 1 do
        begin
          NewqryRighe.Bookmark := NewdbgrRighe.SelectedRows[I];

          // Verifico se esiste già un OP legato alla mia riga di commessa
          QryComRigExistsOP.Close;
          QryComRigExistsOP.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
          try
            QryComRigExistsOP.Open;
            // L'OP non esiste ancora percui lo devo creare
            if QryComRigExistsOP.Eof then
            begin

              // Verifico se l'articolo della Riga della Commessa presenta una Distinta Base
              QryArtExistsDB.Close;
              QryArtExistsDB.Params[0].AsString := NewqryRighe.FieldByName('Arti_Codice').AsString;
              QryArtExistsDB.Open;

              // Non esiste una distinta base per l'articolo in esame
              if QryArtExistsDB.Eof then
              begin

                // Verifico se la Riga di Commessa è legata a un Preventivo Industriale
                QryComRigExistsPI.Close;
                QryComRigExistsPI.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
                QryComRigExistsPI.Open;

                if not QryComRigExistsPI.Eof then
                begin
                  // Generazione dell'Ordine di Produzione dal Preventivo Industriale legato alla
                  // Riga della Commessa
                  Msg := '';

                  objOPTes.Seek('Id', QryComRigExistsPI.fieldByName('Id').AsInteger);
                  if objOPTes.Found then
                  begin
                    // Determinazione del tipo Documento Ordine di Produzione
                    QryTipiDocOP.Close;
                    QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
                                             'WHERE (Tipdoc = ''P'') ' +
                                             'ORDER BY Tipnum ASC';
                    try
                      QryTipiDocOP.Open;
                    except
                      on E: Exception do
                      begin
                        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                               'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
                        FlagErr := True;
                        Exit;
                      end;
                    end;

                    DecodeDate(DBExec.Data, Year, Month, Day);
                    // Determinazione del numero
                    QryNumOP.Close;
                    QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
                                         'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
                                               '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
                                         'GROUP BY Tipnum';
                    try
                      QryNumOP.Open;
                    except
                      on E: Exception do
                      begin
                        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                               'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
                        FlagErr := True;
                        Exit;
                      end;
                    end;

                    // Generazione Ordine di Produzione da Preventivo Industriale
                    Msg := GeneraOPdaPI(objOPTes.CampiObj['Id'],
                                        QryTipiDocOP.FieldByName('Id').AsInteger,
                                        Year,
                                        QryNumOP.FieldByName('Numop').AsInteger,
                                        QryTipiDocOP.FieldByName('Tipnum').AsString,
                                        (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
                                         CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString)),
                                        NewqryRighe.FieldByName('Rif_Id').AsInteger,
                                        objOrPr);
                    if Msg <> '' then
                    begin
                      FlagErr := True;
                      Exit;
                    end
                  end;
                end
                else begin
                  // Segnalazione delle Righe di Commessa per le quali non è possibile generare
                  // un Ordine di Produzione
                  ListaIdComRig.Add('Commessa:' +
                                    NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
                                    'Riga: ' +
                                    NewqryRighe.FieldByName('Crig_DESCR').AsString);
                end;
              end
              else
              begin
                // Generazione dell'Ordine di Produzione dalla Distinta Base con quantità uguale
                // alla qta1 della Riga di Commmessa
                Msg := '';

                // Determinazione del tipo Documento Ordine di Produzione
                QryTipiDocOP.Close;
                QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
                                         'WHERE (Tipdoc = ''P'') ' +
                                         'ORDER BY Tipnum ASC';
                try
                  QryTipiDocOP.Open;
                except
                  on E: Exception do
                  begin
                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                           'errore durante la ricerca del Tipo Documento Ordine di Produzione:' + CRLF + E.Message;
                    FlagErr := True;
                    Exit;
                  end;
                end;

                DecodeDate(DBExec.Data, Year, Month, Day);
                // Determinazione del numero
                QryNumOP.Close;
                QryNumOP.Sql.Text := 'SELECT (MAX(NumOP) + 1) Numop FROM Optes ' +
                                     'WHERE (Tipnum = ' + CS_VariantTo_SqlStr(QryTipiDocOP.FieldByName('Tipnum').AsString) + ') AND ' +
                                           '(Annop = ' + CS_VariantTo_SqlStr(Year) + ') ' +
                                     'GROUP BY Tipnum';
                try
                  QryNumOP.Open;
                except
                  on E: Exception do
                  begin
                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                           'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
                    FlagErr := True;
                    Exit;
                  end;
                end;

                // Generazione della testata dell'OP relativa all'articolo
                // riportato sulla riga di commessa
                with objOPTes do
                begin
                  Found := False;
                  CampiObj['Idtipidoc'] := QryTipiDocOP.FieldByName('Id').AsInteger;
                  CampiObj['TipNum'] := QryTipiDocOP.FieldByName('Tipnum').AsString;
                  CampiObj['AnnOP'] := Year;
                  CampiObj['NumOP'] := QryNumOP.FieldByName('Numop').AsInteger;
                  CampiObj['Stato'] := 'P';
                  CampiObj['Idartico'] := QryArtExistsDB.FieldByName('Idartico').AsInteger;
                  CampiObj['Qtaop'] := (NewqryRighe.FieldByName('Crig_QTA1').AsFloat *
                                        CalcolaCoefConv(NewqryRighe.FieldByName('Arti_Codice').AsString));
                  CampiObj['DatVal'] := DBExec.Data;
                  CampiObj['DatEmi'] := DBExec.Data;
                  CampiObj['Idcomrig'] := NewqryRighe.FieldByName('Rif_Id').AsInteger;
                  CampiObj['CodVarDB'] := NewqryRighe.FieldByName('Vdb_Codice').AsString;
                  CampiObj['Idallver'] := GetPardef('ALLPF', DBExec.DatabaseName);
                end; // end with

                if not objOPTes.GeneraOP > 0 then
                begin
                  Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un ' +
                         'errore durante la generazione dell''Ordine di Produzione.';
                  FlagErr := True;
                  Exit;
                end
              end;
            end
            else
            begin
              // Segnalazione delle Righe di Commessa per le quali non è possibile generare
              // un Ordine di Produzione perghè ha gia un Ordine di Produzione
              ListaIdComRigOnOP.Add('Commessa:' +
                                    NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
                                    'Riga: ' +
                                    NewqryRighe.FieldByName('Crig_DESCR').AsString);
            end;
          except
            on E: Exception do
            begin
              Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                     'errore con il database:' + CRLF + E.Message;
              FlagErr := True;
              Break;
            end;
          end; // end try...except
        end; // end for
      finally
        // Chiusura transazione
        if NewTran then
          if not FlagErr then
          begin
            DBExec.Commit;
            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then begin
              Msg := 'Operazione di generazione Ordini di Produzione completata.';
              Application.MessageBox(PChar(Msg),
                                     PChar(Application.Title),
                                     MB_ICONINFORMATION + MB_OK);
            end
            else
            begin
              Msg := 'Operazione di generazione Ordini di Produzione non è andata a buon fine ' +
                     'per alcune righe selezionate.';
              if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count <> 0) then
                MsgError(Msg,
                         'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
                         ListaIdComRig.Text + CRLF +
                         'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
                         ListaIdComRigOnOP.Text)
              else begin
                if (ListaIdComRig.Count <> 0) and (ListaIdComRigOnOP.Count = 0) then
                  MsgError(Msg,
                           'Righe di Commessa che non hanno un Preventivo Industriale o che hanno un articolo senza Distinta Base:' + CRLF +
                           ListaIdComRig.Text);
                if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count <> 0) then
                  MsgError(Msg,
                           'Righe di Commessa che presentano un Ordine di Produzione:' + CRLF +
                           ListaIdComRigOnOP.Text);
              end;
            end;
          end
          else
          begin
            DBExec.Rollback;
            Msg := 'L''operazione di generazione Ordini di Produzione non è andata a boun fine.' + CRLF + Msg;
            Application.MessageBox(PChar(Msg),
                                   PChar(Application.Title),
                                   MB_ICONERROR + MB_OK);
          end;

        // Distruzione oggetti Qry
        if Assigned(QryTipiDocOP) then
        begin
          QryTipiDocOP.Close;
          FreeAndNil(QryTipiDocOP);
        end;

        if Assigned(QryNumOP) then
        begin
          QryNumOP.Close;
          FreeAndNil(QryNumOP);
        end;

        if Assigned(QryArtExistsDB) then
        begin
          QryArtExistsDB.Close;
          if QryArtExistsDB.Prepared then
            QryArtExistsDB.UnPrepare;
          FreeAndNil(QryArtExistsDB);
        end;

        if Assigned(QryComRigExistsOP) then
        begin
          QryComRigExistsOP.Close;
          if QryComRigExistsOP.Prepared then
            QryComRigExistsOP.UnPrepare;
          FreeAndNil(QryComRigExistsOP);
        end;

        if Assigned(QryComRigExistsPI) then
        begin
          QryComRigExistsPI.Close;
          if QryComRigExistsPI.Prepared then
            QryComRigExistsPI.UnPrepare;
          FreeAndNil(QryComRigExistsPI);
        end;

      end; // end try...finally
    end;
  end
  else begin
    Msg := 'Nessuna riga è stata selezionata.';
    Application.MessageBox(PChar(Msg),
                           PChar(Application.Title),
                           MB_ICONINFORMATION + MB_OK);
  end;
end;
*)

function TGstPI.CalcolaCoefConv(ACodArtico: string): Double;
var
  tmpUMPrd: TOriUM;
  QryArtSeek: TCSEQuery;
begin
  QryArtSeek := TCSEQuery.Create(nil);
  QryArtSeek.DataBaseName := DBExec.DataBaseName;
  try
    tmpUMPrd := ouI;
    // Puntamento su Artico
    QryArtSeek.SQL.Text := 'SELECT ' +
      'UMI, UMM, UMV, UMRPro, UMCo1, UMCo2, ' +
      'UMRel1, UMRel2, UMRel3, UMRel4 ' +
      'FROM Artico WHERE (Codice = ' + CS_VariantTo_SqlStr('ACodArtico') + ')';
    try
      QryArtSeek.Open;
      case (QryArtSeek.FieldByName('UMRPro').AsString + ' ')[1] of
        'I', ' ':
          tmpUMPrd := ouI;
        'M':
          tmpUMPrd := ouM;
        'V':
          tmpUMPrd := ouV;
      end; // end case
      Result := ConvUMStd(tmpUMPrd,
          ouI,
          QryArtSeek.FieldByName('UMI').AsString,
          QryArtSeek.FieldByName('UMM').AsString,
          QryArtSeek.FieldByName('UMV').AsString,
          QryArtSeek.FieldByName('UMRel1').AsString,
          QryArtSeek.FieldByName('UMRel2').AsString,
          QryArtSeek.FieldByName('UMRel3').AsString,
          QryArtSeek.FieldByName('UMRel4').AsString,
          QryArtSeek.FieldByName('UMCo1').AsString,
          QryArtSeek.FieldByName('UMCo2').AsString);
    except
      Result := 1;
    end;
  finally
    if Assigned(QryArtSeek) then
    begin
      QryArtSeek.Close;
      FreeAndNil(QryArtSeek);
    end;
  end;
end;

function TGstPI.GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: string; AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): string;
var
  Msg: string;
  tmpOPDT: TCampiOPDT;
  CampiCauMov: TCauMov;
  tmpNewDocPrd: Integer;
  tmpOPTes: TCampiOPTes;
  NewTran: Boolean;
  tmpQry, tmpQry1, QryFas: TCSEQuery;
begin
  Msg := '';

  NewTran := not DBExec.InTransaction;
  if NewTran then
    DBExec.CSStartTransaction;

  tmpQry := TCSEQuery.Create(nil);
  tmpQry.DatabaseName := DBExec.DatabaseName;
  tmpQry1 := TCSEQuery.Create(nil);
  tmpQry1.DatabaseName := DBExec.DatabaseName;
  QryFas := TCSEQuery.Create(nil);
  QryFas.DataBaseName := DBExec.DataBaseName;

  tmpOPTes := GetOPTes(DBExec, AIdOPTes);
  try
    AobjOrPr.Found := False;

    CampiCauMov := GetCauMov(DBExec, Settings.Caucpi);
    // OPTes
    AobjOrPr.CampiOPTes := tmpOPTes;
    (* SF...26/01/2018 : Conversione 5.00
    with AobjOrPr.CampiOPTes do
    begin
      Idtipidoc := AIdTipiDoc;
      Tipnum := ATipnum;
      Annop := AAnnop;
      Numop := ANumop;
      Stato := 'P';
      Opman := False;
      Qtaop := AQtaOP;
      Qtacar := 0;
      Valsch := 0;
      Totmat := 0;
      Datcon := 0;
      Datpre := 0;
      Dateva := 0;
      Datric := tmpOPTes.dafiva;

      if CampiCauMov.Idmagarr <> 0 then
        IdAllVer := CampiCauMov.Idmagarr
      else
        IdAllVer := Settings.Allpf;

      Idcomrig := AIdComRig;
      Mdp := False;
      Mjs := False;
      Datemi := DBExec.Data;
      Doctec := False;
      Docpre := False;
      Docsdl := False;
      Verifi := False;
      OPEvaMod := True;
    end; // end with
    *)

    AobjOrPr.SetCampi('Idtipidoc', AIdTipiDoc);
    AobjOrPr.SetCampi('Tipnum', ATipnum);
    AobjOrPr.SetCampi('Annop', AAnnop);
    AobjOrPr.SetCampi('Numop', ANumop);
    AobjOrPr.SetCampi('Stato', 'P');
    AobjOrPr.SetCampi('Opman', False);
    AobjOrPr.SetCampi('Qtaop', AQtaOP);
    AobjOrPr.SetCampi('Qtacar', 0);
    AobjOrPr.SetCampi('Valsch', 0);
    AobjOrPr.SetCampi('Totmat', 0);
    AobjOrPr.SetCampi('Datcon', 0);
    AobjOrPr.SetCampi('Datpre', 0);
    AobjOrPr.SetCampi('Dateva', 0);
    AobjOrPr.SetCampi('Datric', tmpOPTes.dafiva);

    if CampiCauMov.Idmagarr <> 0 then
      AobjOrPr.SetCampi('IdAllVer', CampiCauMov.Idmagarr)
    else
      AobjOrPr.SetCampi('IdAllVer', Settings.Allpf);

    AobjOrPr.SetCampi('Idcomrig', AIdComRig);
    AobjOrPr.SetCampi('Mdp', False);
    AobjOrPr.SetCampi('flAttMJS', False);
    AobjOrPr.SetCampi('Datemi', DBExec.Data);
    AobjOrPr.SetCampi('Doctec', False);
    AobjOrPr.SetCampi('Docpre', False);
    AobjOrPr.SetCampi('Docsdl', False);
    AobjOrPr.SetCampi('Verifi', False);
    AobjOrPr.SetCampi('OPEvaMod', True);
    // ...SF 26/01/2018

    AobjOrPr.OPTesMemoText := GetNota(DBExec, tmpOPTes.idnote);
    AobjOrPr.OPTesDocFiles := GetNota(DBExec, tmpOPTes.iddoc);
    tmpNewDocPrd := AobjOrPr.Insert;
    if tmpNewDocPrd = -1 then
    begin
      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
        'nell''inserimento della testata dell''Ordine di Produzione.';
      Exit;
    end;

    // OPLotF
    if Msg = '' then
      if not AobjOrPr.GeneraOPLotF(tmpNewDocPrd) then
      begin
        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
          'nella generazione lotti.';
        Exit;
      end;

    // OPDT
    if Msg = '' then
    begin
      //EB...28/04/2003
      tmpQry1.Close;
      tmpQry1.SQL.Text := 'SELECT Id FROM OPDT ' +
        'WHERE (Idoptes = :IdOpTes) AND ' +
        '(Sequen = :Sequen)';
      if tmpQry1.prepared then
        tmpQry1.unPrepare;
      tmpQry1.prepare;
      //...EB

      tmpQry.SQL.Text := 'SELECT ' +
        'Id, Sequen, Livello, Idpadre, Idartico, Idlink, ' +
        'Qtimco, Tipord, Riferi, Note, Codvardb, Idnote, CCCRea ' +
        'FROM OPDT ' +
        'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + ') ' +
        'ORDER BY Sequen';
      tmpQry.Open;
      while not tmpQry.Eof do
      begin
        tmpOPDT := GetOPDT(DBExec, tmpQry.FieldByName('Idpadre').AsInteger);
        tmpQry1.Close;
        tmpQry1.Params[0].asInteger := tmpNewDocPrd;
        tmpQry1.Params[1].asInteger := tmpOPDT.Sequen;
        tmpQry1.Open;
        AobjOrPr.FoundDT := False;

        (* SF...26/01/2018 : Conversione 5.00
        with AobjOrPr.CampiOPDT do begin
          idoptes := tmpNewDocPrd;
          sequen := tmpQry.FieldByName('Sequen').AsInteger;
          livello := tmpQry.FieldByName('Livello').AsInteger;
          idpadre := tmpQry1.FieldByName('Id').AsInteger;
          if tmpQry.FieldByName('Livello').AsInteger = 0 then
            idartico := tmpOPTes.idartico
          else
            idartico := tmpQry.FieldByName('Idartico').AsInteger;
          idlink := tmpQry.FieldByName('Idlink').AsInteger;
          qtimco := tmpQry.FieldByName('Qtimco').AsFloat;
          tipord := tmpQry.FieldByName('Tipord').AsString;
          riferi := tmpQry.FieldByName('Riferi').AsString;
          note := tmpQry.FieldByName('Note').AsString;
          codvardb:= tmpQry.FieldByName('Codvardb').AsString;
          CCCRea := tmpQry.FieldByName('CCCRea').asInteger;
        end;  // with
        *)

        AobjOrPr.SetCampiOPDT('idoptes', tmpNewDocPrd);
        AobjOrPr.SetCampiOPDT('sequen', tmpQry.FieldByName('Sequen').AsInteger);
        AobjOrPr.SetCampiOPDT('livello', tmpQry.FieldByName('Livello').AsInteger);
        AobjOrPr.SetCampiOPDT('idpadre', tmpQry1.FieldByName('Id').AsInteger);

        if tmpQry.FieldByName('Livello').AsInteger = 0 then
          AobjOrPr.SetCampiOPDT('idartico', tmpOPTes.idartico)
        else
          AobjOrPr.SetCampiOPDT('idartico', tmpQry.FieldByName('Idartico').AsInteger);

        AobjOrPr.SetCampiOPDT('idlink', tmpQry.FieldByName('Idlink').AsInteger);
        AobjOrPr.SetCampiOPDT('qtimco', tmpQry.FieldByName('Qtimco').AsFloat);
        AobjOrPr.SetCampiOPDT('tipord', tmpQry.FieldByName('Tipord').AsString);
        AobjOrPr.SetCampiOPDT('riferi', tmpQry.FieldByName('Riferi').AsString);
        AobjOrPr.SetCampiOPDT('note', tmpQry.FieldByName('Note').AsString);
        AobjOrPr.SetCampiOPDT('codvardb', tmpQry.FieldByName('Codvardb').AsString);
        AobjOrPr.SetCampiOPDT('CCCRea', tmpQry.FieldByName('CCCRea').asInteger);
        // ...SF 26/01/2018

        tmpQry1.Close;
        if AobjOrPr.InsertDT = -1 then
        begin
          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
            'nell''inserimento della Distinta Tecnica.';
          Break;
        end;
        tmpQry.Next;
      end; // end while
      tmpQry.Close;
      if Msg <> '' then
        Exit;
    end; // if

    // OPDP
    if Msg = '' then
    begin
      tmpQry.SQL.Text := 'INSERT INTO OPDP (Idoptes, Datpre, Idartico, ' +
        'Idallmag, Qtimco, Qtarpr, Qtaman, Qtapre, Note, ' +
        'Tipord, Cosuni, Tipcos, CCCRea) ' +
        '(SELECT ' + CS_KeyValueTo_SqlStr(tmpNewDocPrd) + ', 0, Idartico, ' +
        'Idallmag, Qtimco, 0, 0, 0, Note, Tipord, Cosuni, Tipcos, CCCRea ' +
        'FROM Opdp ' +
        'WHERE (Idoptes = ' + CS_KeyValueTo_SqlStr(tmpOPTes.id) + '))';
      try
        tmpQry.ExecSQL;
      except
        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
          'nell''inserimento della Distinta di Prelievo.';
        Exit;
      end; // end try...except
    end; // if

    // OPSdlMat
    if Msg = '' then
    begin
      QryFas.SQL.Text := 'SELECT ' +
        'Id, Idoptes, Idopsdlmat, Sequen, Idlav, ' +
        'Fltrasf, Idtiplav, Attrezzo, Iddipend, Idstslav, ' +
        'Cosuni, Cosunima, Cossch, Temavv, Avvsch, Temese, ' +
        'Esesch, Totsch, Prdora, Prdott, Micatt, Macatt, ' +
        'Tematt, Fruomo, Sovfas, Datcar, Datsca, Note, ' +
        'Idinfosl, Iddoc, Idricila ' +
        'FROM Opsdlfas ' +
        'WHERE (Idopsdlmat = :Idopsdlmat)';
      QryFas.Prepare;

      tmpQry.SQL.Text := 'SELECT ' +
        'Id, Idopdt, Idartico, Sequen, Cosavv, Coslav, ' +
        'Coscic, Tipcos, Lticic, Tiptem, Qtimco, Note ' +
        'FROM Opsdlmat ' +
        'WHERE (Idoptes = ' + IntToStr(tmpOPTes.id) + ') ' +
        'ORDER BY Sequen';

      tmpQry.Open;
      while not tmpQry.Eof do
      begin
        tmpOPDT := GetOPDT(DBExec, tmpQry.FieldByName('Idopdt').AsInteger);
        tmpQry1.Close;
        tmpQry1.Params[0].asInteger := tmpNewDocPrd;
        tmpQry1.Params[1].asInteger := tmpOPDT.Sequen;
        tmpQry1.Open;
        AobjOrPr.FoundSdlM := False;

        (* SF...26/01/2018 : Conversione 5.00
        with AobjOrPr.CampiOPSdlM do begin
          idoptes := tmpNewDocPrd;
          idopdt := tmpQry1.FieldByName('Id').AsInteger;
          idartico := tmpOPTes.Idartico;
          sequen := tmpQry.FieldByName('Sequen').AsInteger;
          cosavv := tmpQry.FieldByName('Cosavv').AsFloat;
          coslav := tmpQry.FieldByName('Coslav').AsFloat;
          coscic := tmpQry.FieldByName('Coscic').AsFloat;
          tipcos := tmpQry.FieldByName('Tipcos').AsString;
          lticic := tmpQry.FieldByName('Lticic').AsFloat;
          tiptem := tmpQry.FieldByName('Tiptem').AsString;
          cossch := ZERO;
          qtimco := tmpQry.FieldByName('Qtimco').AsFloat;
          completo := False;
          note := tmpQry.FieldByName('Note').AsString;
        end; // end with
        *)

        AobjOrPr.SetCampiSdlM('idoptes', tmpNewDocPrd);
        AobjOrPr.SetCampiSdlM('idopdt', tmpQry1.FieldByName('Id').AsInteger);
        AobjOrPr.SetCampiSdlM('idartico', tmpOPTes.Idartico);
        AobjOrPr.SetCampiSdlM('sequen', tmpQry.FieldByName('Sequen').AsInteger);
        AobjOrPr.SetCampiSdlM('cosavv', tmpQry.FieldByName('Cosavv').AsFloat);
        AobjOrPr.SetCampiSdlM('coslav', tmpQry.FieldByName('Coslav').AsFloat);
        AobjOrPr.SetCampiSdlM('coscic', tmpQry.FieldByName('Coscic').AsFloat);
        AobjOrPr.SetCampiSdlM('tipcos', tmpQry.FieldByName('Tipcos').AsString);
        AobjOrPr.SetCampiSdlM('lticic', tmpQry.FieldByName('Lticic').AsFloat);
        AobjOrPr.SetCampiSdlM('tiptem', tmpQry.FieldByName('Tiptem').AsString);
        AobjOrPr.SetCampiSdlM('cossch', ZERO);
        AobjOrPr.SetCampiSdlM('qtimco', tmpQry.FieldByName('Qtimco').AsFloat);
        AobjOrPr.SetCampiSdlM('completo', False);
        AobjOrPr.SetCampiSdlM('note', tmpQry.FieldByName('Note').AsString);
        // ...SF 26/01/2018

        tmpQry1.Close;
        if AobjOrPr.InsertSdlM = -1 then
        begin
          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
            'nell''inserimento della Scheda di Lavorazione Materiali.';
          Break;
        end
        else
        begin
          // OPSdlFas
          QryFas.Close;
          QryFas.Params[0].asInteger := tmpQry.FieldByName('id').asInteger;
          QryFas.Open;
          while not QryFas.Eof do
          begin
            AobjOrPr.FoundSdlF := False;
            AobjOrPr.OPSdlFMemoText := GetNota(DBExec, QryFas.FieldByName('idinfosl').AsInteger);
            AobjOrPr.OPSdlFDocFiles := GetNota(DBExec, QryFas.FieldByName('iddoc').AsInteger);

            (* SF...26/01/2018 : Conversione 5.00
            with AobjOrPr.CampiOPSdlF do begin
              idoptes := tmpNewDocPrd;
              idopsdlmat := AobjOrPr.CampiOPSdlM.id;
              sequen := QryFas.FieldByName('Sequen').AsInteger;
              idlav := QryFas.FieldByName('Idlav').AsInteger;
              idRiCiLa := QryFas.FieldByName('Idricila').asInteger;
              fltrasf := (QryFas.FieldByName('Fltrasf').AsInteger = -1);
              idtiplav := QryFas.FieldByName('Idtiplav').AsInteger;
              attrezzo := QryFas.FieldByName('Attrezzo').AsString;
              iddipend := QryFas.FieldByName('Iddipend').AsInteger;
              idstslav := QryFas.FieldByName('Idstslav').AsInteger;
              cosuni := QryFas.FieldByName('Cosuni').AsFloat;
              cosuniMA := QryFas.FieldByName('Cosunima').AsFloat;
              cossch := ZERO;
              temavv := QryFas.FieldByName('Temavv').AsFloat;
              avvsch := ZERO;
              temese := QryFas.FieldByName('Temese').AsFloat;
              esesch := ZERO;
              totsch := ZERO;
              prdora := QryFas.FieldByName('Prdora').AsFloat;
              prdott := QryFas.FieldByName('Prdott').AsFloat;
              micatt := QryFas.FieldByName('Micatt').AsFloat;
              macatt := QryFas.FieldByName('Macatt').AsFloat;
              tematt := QryFas.FieldByName('Tematt').AsFloat;
              fruomo := QryFas.FieldByName('Fruomo').AsFloat;
              sovfas := QryFas.FieldByName('Sovfas').AsFloat;
              datcar := 0;
              datsca := 0;
              note := QryFas.FieldByName('Note').AsString;
              idinfosl := 0;
              iddoc := 0;
            end; //  end with
            *)

            AobjOrPr.SetCampiSdlF('idoptes', tmpNewDocPrd);
            AobjOrPr.SetCampiSdlF('idopsdlmat', AobjOrPr.CampiOPSdlM.id);
            AobjOrPr.SetCampiSdlF('sequen', QryFas.FieldByName('Sequen').AsInteger);
            AobjOrPr.SetCampiSdlF('idlav', QryFas.FieldByName('Idlav').AsInteger);
            AobjOrPr.SetCampiSdlF('idRiCiLa', QryFas.FieldByName('Idricila').asInteger);
            AobjOrPr.SetCampiSdlF('fltrasf', (QryFas.FieldByName('Fltrasf').AsInteger = -1));
            AobjOrPr.SetCampiSdlF('idtiplav', QryFas.FieldByName('Idtiplav').AsInteger);
            AobjOrPr.SetCampiSdlF('attrezzo', QryFas.FieldByName('Attrezzo').AsString);
            AobjOrPr.SetCampiSdlF('iddipend', QryFas.FieldByName('Iddipend').AsInteger);
            AobjOrPr.SetCampiSdlF('idstslav', QryFas.FieldByName('Idstslav').AsInteger);
            AobjOrPr.SetCampiSdlF('cosuni', QryFas.FieldByName('Cosuni').AsFloat);
            AobjOrPr.SetCampiSdlF('cosuniMA', QryFas.FieldByName('Cosunima').AsFloat);
            AobjOrPr.SetCampiSdlF('cossch', ZERO);
            AobjOrPr.SetCampiSdlF('temavv', QryFas.FieldByName('Temavv').AsFloat);
            AobjOrPr.SetCampiSdlF('avvsch', ZERO);
            AobjOrPr.SetCampiSdlF('temese', QryFas.FieldByName('Temese').AsFloat);
            AobjOrPr.SetCampiSdlF('esesch', ZERO);
            AobjOrPr.SetCampiSdlF('totsch', ZERO);
            AobjOrPr.SetCampiSdlF('prdora', QryFas.FieldByName('Prdora').AsFloat);
            AobjOrPr.SetCampiSdlF('prdott', QryFas.FieldByName('Prdott').AsFloat);
            AobjOrPr.SetCampiSdlF('micatt', QryFas.FieldByName('Micatt').AsFloat);
            AobjOrPr.SetCampiSdlF('macatt', QryFas.FieldByName('Macatt').AsFloat);
            AobjOrPr.SetCampiSdlF('tematt', QryFas.FieldByName('Tematt').AsFloat);
            AobjOrPr.SetCampiSdlF('fruomo', QryFas.FieldByName('Fruomo').AsFloat);
            AobjOrPr.SetCampiSdlF('sovfas', QryFas.FieldByName('Sovfas').AsFloat);
            AobjOrPr.SetCampiSdlF('datcar', 0);
            AobjOrPr.SetCampiSdlF('datsca', 0);
            AobjOrPr.SetCampiSdlF('note', QryFas.FieldByName('Note').AsString);
            AobjOrPr.SetCampiSdlF('idinfosl', 0);
            AobjOrPr.SetCampiSdlF('iddoc', 0);
            // ...SF 26/01/2018

            if AobjOrPr.InsertSdlF = -1 then
            begin
              Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
                'nell''inserimento della Scheda di Lavorazione Fase.';
              Break;
            end;  // if
            QryFas.Next;
          end; // end while
          if Msg <> '' then
            Break;
        end;  // if ... else ...
        tmpQry.Next;
      end; // end while
      if Msg <> '' then
        Exit;
    end; // if

    // Nel caso di generazione OP da PI, ricalcolo i costi teorici.
    if Msg = '' then
      if not AobjOrPr.RicValTeo(tmpNewDocPrd) then
      begin
        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
          'nel Ricalcolo dei costi teorici.';
        Exit;
      end; // if
  finally
    if Assigned(tmpQry) then
    begin
      tmpQry.Close;
      FreeAndNil(tmpQry);
    end;

    if Assigned(tmpQry1) then
    begin
      tmpQry1.Close;
      tmpQry1.UnPrepare;
      FreeAndNil(tmpQry1);
    end;

    if Assigned(QryFas) then
    begin
      QryFas.Close;
      QryFas.UnPrepare;
      FreeAndNil(QryFas);
    end;

    // Ciusura della transazione
    if NewTran then
      if Msg = '' then
        DBExec.Commit
      else
      begin
        DBExec.RollBack;
        Result := Msg;
      end
    else
      Result := Msg;
  end; // end try...finally
end;

initialization
  // Identificativo modulo
  CSW___BPL_Identity := 'PI_AltagMI_GstPI';

  if (CfgSAMFile.SectionExists('PI_Altag_GstPI')) then
  begin
    if Inside(CfgSamFile.ReadString('PI_Altag_GstPI', 'Utenti', ''), IntToStr(Utente.Id)) then
    begin
      RegisterPlugIn('PI_AltagMI_GstPI', TGstPI);
    end;
  end;

finalization
  UnRegisterPlugIn('PI_AltagMI_GstPI');

end.

