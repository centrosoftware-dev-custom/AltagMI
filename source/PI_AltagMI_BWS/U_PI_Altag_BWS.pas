{
Pdt.cfg
[MODULI]
PI_Altag_BWS=BWS Riunione industrie alimentari

[BWS_MODULI]
PRGSPEC=RicMerAltag

[RicMerAltag]
DRV_NAME=PI_Altag_BWS.bpl
REG_NAME=PI_Altag_Spec
FUNTOCALL=PlugIn_CaricaMag
BTNCAPTION=Carico a Magazzino  

Extfun.ini
[FrmScaCom]
AUTORUN=PI_Altag_BWS.StartPI_ScaricoOP;

[FrmCarPFDoc]
AUTORUN=PI_Altag_BWS.StartPI_CaricoOP;

[FrmSpedOVCom]
AUTORUN=PI_Altag_BWS.StartPI_PrepSpedOV;

[FrmSelTipodoc]
AUTORUN=PI_Altag_BWS.StartPI_SELTipodoc;

[FrmInvMagBWS]
AUTORUN=PI_Altag_BWS.StartPI_Inventario;

SAMW\PI_Altag_BWS.ini
[DDT_FORNITORE]
IDCAUMOV=

[ENTRATA_MERCI]
IDVANO=

SQL
alter table pdtrigacq add ext_idfor int null
alter table pdtrigacq add ext_idtipidoc int null
alter table pdtrigacq add ext_numdoc varchar(50) null
alter table pdtrigacq add ext_datdoc float(53)

alter table movmag add ext_spid int default = @@spid



}



unit U_PI_Altag_BWS;

interface

uses
  S3Plugin, System.Classes, csFilecfg, system.SysUtils, csctipi, CsExtctrls,
  dialogs, CSButtons, extctrls,StdCtrls,  windows, s3db, db, csetables,compf2,
  Vcl.Buttons, vcl.forms,Vcl.Controls, MsgCore, UcoreTipi, UVarie, UVariStd,
  ucoredb, CSEdit, CSLabel, imagazzino, Vcl.ComCtrls, ufrmSelLotto, UFrmDettlot;

type
  TPI_Altag_BWS = class(TCustomPlugIn)

   f2artico,
   f2allmag,
   f2idtipodoc : TF2;

   Rgtipodoc : TRadioGroup;

   edtlotto,
   edtserie,
   edtqtaumi,
   edtqtaumm,
   edtqtaumv,
   edtbarcodeunico,
   edtssccda,
   edttestata : TCSEdit;

   FPnlDescrCli: TPanel;
   FPnlDatiRiga: TCSLabel;
   lblssccda,
   lblsscc,
   lblbamtes,
   lbllotto,
   lblartico,
   lblqtaumv,
   lblqtaumm,
   lblqtaumi,
   lblvano : TLabel;

   pnlinvmag,
   pnltasti,
   pnlstdbtn,
   pnlstdstatus,
   pnlstdgen,
   pnlstato : TPanel;

   stbbarra : tstatusbar;

   FF2AllMag : TF2;

   scbdata : TScrollBox;

   BtnLeggiBarcode,
   btnok,
   btnendmission,
   btnins,
   btnannulla,
   btnsaltariga : TBitBtn;

   f2bamtes :TF2;
   FF2LotSer :TF2;


private
   oldf2bamteskeychange : TKeyChange;
   oldbtnokclick,
   oldbtnendmissionClick,
   oldbtninsclick,
   oldEdtQtaumionExit,
   oldEdtQtaummonExit,
   oldEdtQtaumvonExit,
   oldPagecontrolChange,

   OldEdtSerieOnExit,
   OldEdtLottoOnExit,
   oldFormOnResize: TNotifyEvent;

   FOLD_BWS_F2AllMagOnExit: TNotifyEvent;
   FOLD_BWS_F2AllMagOnKeyChange: TKeyChange;
   FOLD_BWS_BtnInsPDTInvMagOnClick: TNotifyEvent;
   FOLD_BWS_BtnOkOnClick: TNotifyEvent;
   FOld_BWS_TabNewRigaOnShow: TNotifyEvent;

   FIdAllMag: integer;

   function GetDescrVettore(idvet : Integer):string;
   function ControllaPresenzaArticoliDeteriorabili(idcommessa : Integer) : Boolean;
   function ArticoloDerrAlim(idartico : Integer;idcommessa : Integer; DERRALIM : string) : Boolean;
   function getQtaResidua : Double;
   procedure NewF2bamtesKeychange(sender : TObject;newkey,oldkey : integer);
   procedure NewF2ArticoKeychange(sender : TObject;newkey,oldkey : integer);
   procedure CreaButton;
   procedure NewBtnEndmissionClick(sender : TObject);
   procedure NewEdtSerieOnExit(sender : TObject);
   procedure newEdtlottoOnExit(sender : TObject);
   procedure BtnDetailScaricoClick(sender : TObject);
   procedure EdtNewTestataExit(sender : TObject);
   procedure BtnLeggiBarcodeClick(sender : TObject);
   procedure BtnCaricaBarcodeClick(sender : TObject);
   procedure NumSpedizioneKeydown(Sender: TObject; var Key: Word; Shift: TShiftState);
   procedure btngiacenzeclick(sender : TObject);
   procedure BtnLeggiPezzoSingoloClick(sender : TObject);
   procedure ModificaPrepSpedOV;
   procedure newbtnokClick(sender : TObject);
   procedure newbtninsclick(sender : TObject);
   procedure newQtaUmiOnexit(sender : TObject);
   procedure newQtaUmmOnexit(sender : TObject);
   procedure newQtaUmvOnexit(sender : TObject);
   procedure NewPagecontrolChange(sender : TObject);
   procedure newbtinsclick_ScarOP(sender : TObject);
   procedure newBtnInsclick_carOP(sender : TObject);
   procedure NewFormOnResize(sender : TObject);
public

published

  property OLD_BWS_F2AllMagOnExit: TNotifyEvent read FOLD_BWS_F2AllMagOnExit write FOLD_BWS_F2AllMagOnExit;
  procedure NEW_BWS_F2AllMagOnExit(Sender: TObject);

  property OLD_BWS_F2AllMagOnKeyChange: TKeyChange read FOLD_BWS_F2AllMagOnKeyChange write FOLD_BWS_F2AllMagOnKeyChange;
  procedure NEW_BWS_F2AllMagOnKeyChange(Sender: TObject; NewKey, OldKey: Integer);

  property OLD_BWS_BtnInsPDTInvMagOnClick: TNotifyEvent read FOLD_BWS_BtnInsPDTInvMagOnClick write FOLD_BWS_BtnInsPDTInvMagOnClick;
  procedure NEW_BWS_BtnInsPDTInvMagOnClick(Sender: TObject);

  property OLD_BWS_BtnOkOnClick: TNotifyEvent read FOLD_BWS_BtnOkOnClick write FOLD_BWS_BtnOkOnClick;
  procedure NEW_BWS_BtnOkOnClick(Sender: TObject);

  property OLD_BWS_TabNewRigaOnShow: TNotifyEvent read FOLD_BWS_TabNewRigaOnShow write FOLD_BWS_TabNewRigaOnShow;
  procedure NEW_BWS_TabNewRigaOnShow(Sender: TObject);

  Procedure StartPI_Inventario;
  Procedure StartPI_ModLot;
  Procedure StartPI_PrepSpedOV;
  procedure StartPI_SELTipodoc;
  procedure StartPI_ScaricoOP;
  procedure StartPI_CaricoOP;

end;



implementation

uses U_Altag_BWS, udmpdt, UFrmSelComrig, cstd, UFraPrepspedOV, s3registry, ivendite, ibase, UPDTProc, UPDTMsgBox, RSQL, ucoreinterface, UFrmDetailScarico ;

var
  fra_prepspedov : TFra_PrepspedOV;


  fl_resultok : Boolean;


  idtipodocB,
  idtipodocF,
  idtipodocR :Integer;

  idComTes,
  idcomrig: Integer;

  scadenzaLotto: string;

  umv,
  umcomv,
  uminv : string;

  orgumv,
  orgumconv : TOriUM;

  peso3103,
  fl_inizializzazione,
  messaggioSpedizione :Boolean;

  DERRALIM : string;

{ TPI_Prepara_DDT_BWS }




function TPI_Altag_BWS.GetDescrVettore(idvet : Integer):string;
var
  Lqry : tcsequery;
begin
  result := '';
  Lqry := TCSEQuery.Create(nil);
  Lqry.DataBaseName := DBExec.DatabaseName;
  Lqry.SQL.Text := 'select descr1,isnull(descr2,'''') as descr2,indiri,cap,comune from persone where id = ' + IntToStr(idvet);
  Lqry.Open;
  if not Lqry.IsEmpty then
  begin
    Result := Lqry.FieldByName('descr1').AsString + ' ' +
              Lqry.FieldByName('descr2').AsString + ' ' +
              Lqry.FieldByName('indiri').AsString + ' ' +
              Lqry.FieldByName('cap').AsString + ' ' +
              Lqry.FieldByName('comune').AsString;
  end;
  Lqry.Close;
  FreeAndNil(Lqry);
  //TOStd( (Form as TFrmSpedOVStd).Lista.Items[(Form as TFrmSpedOVStd).Lista.Count - 1]).   CampiObj['Id'])
end;

function TPI_Altag_BWS.getQtaResidua: Double;
var
  qr_res : TCSEQuery;
begin
  //Result := 0;
  qr_res := TCSEQuery.Create(nil);
  qr_res.DataBaseName := DBExec.DatabaseName;
  {
  qr_res.SQL.Text := 'select ' +
                     '   sum(isnull(cr.qta1,0)) - ' +
                     '  (sum(isnull(p.qta1,0)) + ' +
                     '   sum(isnull(cr.qtaspe,0))) as qtares ' +
                     '  from comtes c ' +
                     '  join comrig cr on cr.IDCOMTES = c.id ' +
                     '  join lotser l on l.ID = cr.IDARTICO ' +
                     '  join artico a on a.id = l.IDARTICO ' +
                     '  left join PDTRIG p on p.IDCOMRIG = cr.id ' +
                     ' where c.id = ' + inttostr(f2bamtes.KeyValue) +
                     '   and a.id = ' + IntToStr(f2artico.KeyValue) +
                     '   and a.derralim = ''' + DERRALIM + '''';

  }     // cambiato perchè vogliono la qta residua per la prima riga di comrig da evadere..
  qr_res.SQL.Text := 'select ' +
                     '  isnull(cr.qta1,0) - ' +
                     '  (sum(isnull(p.qta1,0)) + ' +
                     '   isnull(cr.qtaspe,0)) as qtares ' +
                     '  from comrig cr ' +
                     '  left join PDTRIG p on p.IDCOMRIG = cr.id ' +
                     ' where cr.id = ' + inttostr(udmpdt.DMPDT.Qry_EVACom.fieldbyname('idcomrig').asinteger) +
                     ' group by cr.qta1,cr.QTASPE';

  qr_res.Open;
  if qr_res.FieldByName('qtares').Asfloat > 0 then
    result := qr_res.FieldByName('qtares').Asfloat
  else
    result := 0;
  qr_res.Close;
  FreeAndNil(qr_res);
end;

function TPI_Altag_BWS.ArticoloDerrAlim(idartico, idcommessa: Integer;
  DERRALIM: string): Boolean;
var
  qr_ts : TCSEQuery;
  qtares,
  qtaprep : Double;
begin
  Result := false;
  qr_ts := TCSEQuery.Create(nil);
  qr_ts.DataBaseName := dbexec.DatabaseName;
  qr_ts.SQL.Text := 'select sum(isnull(qtares,0)) as qta' +
                    '  from comrig cr ' +
                    '  join lotser ls ' +
                    '    on ls.id = cr.idartico ' +
                    '  join artico art ' +
                    '    on art.id = ls.idartico ' +
                    ' where cr.idcomtes = ' + IntToStr(idcommessa) +
                    '   and art.id = ' + IntToStr(idartico);

  if DERRALIM <> 'T' then
    qr_ts.SQL.Text := qr_ts.SQL.Text + ' and art.derralim = ''' + DERRALIM + '''';

  qr_ts.Open;
  if qr_ts.FieldByName('qta').AsFloat > 0 then
  begin
    qtares := qr_ts.FieldByName('qta').AsFloat;
    qr_ts.Close;
    qr_ts.SQL.Text := 'select sum(isnull(p.qta1,0)) as qta ' +
                      ' from pdtrig p ' +
                      ' join comrig cr ' +
                      '   on cr.id = p.idcomrig ' +
                      ' join lotser ls ' +
                      '   on ls.id = cr.idartico ' +
                      ' join artico art ' +
                      '   on art.id = ls.idartico ' +
                      'where art.id = ' + inttostr(idartico) +
                      '  and cr.idcomtes = ' + IntToStr(idcommessa);

    if DERRALIM <> 'T' then
      qr_ts.SQL.Text := qr_ts.SQL.Text + ' and art.derralim = ''' + DERRALIM + '''';

    qr_ts.Open;
    qtaprep := qr_ts.FieldByName('qta').AsFloat;
    if qtaprep > 0 then
    begin
      if qtares - qtaprep > 0 then
        Result := True;
    end
    else
      Result := true;

  end;
  qr_ts.Close;
  FreeAndNil(qr_ts);
end;




procedure TPI_Altag_BWS.BtnCaricaBarcodeClick(sender: TObject);
var
  Ibws_barcode : TBWS_barcode128;
  objartico : IArticoStd;
  id_articolo : integer;
begin
  Ibws_barcode := TBWS_barcode128.Create;

  try
    if Ibws_barcode.LeggiBarcode128_2 <> '' then
    begin
      if Ibws_barcode.itemcode <> '' then
      begin
        id_articolo := Ibws_barcode.GetArticoFromEan(Ibws_barcode.itemcode);
        if id_articolo > 0 then
        begin

          scadenzaLotto := Ibws_barcode.scadenza;
          peso3103 := Ibws_barcode.peso3103;

          if not Ibws_barcode.VerificaLotto(id_articolo,f2bamtes.qryF2.FieldByName('idclidest').AsInteger,f2bamtes.KeyValue,f2allmag.KeyValue,Ibws_barcode.lotto,StringReplace(scadenzaLotto,'/','',[rfReplaceAll]),StrToDateTime(Ibws_barcode.scadenza)) then
          begin
            exit;
          end;
          f2artico.KeyValue := id_articolo;
          f2artico.OnExit(f2artico);
          if f2artico.KeyValue <> 0 then
          begin
            if not Assigned(objArtico) then
                GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);

            ObjArtico.Seek('ID', f2artico.KeyValue);
            objartico.UMVend(umv,orgumv,umcomv,orgumconv,uminv);
            fl_inizializzazione := true;
            edtlotto.AsString := Ibws_barcode.lotto;
            edtlotto.OnExit(edtlotto);
            edtserie.AsString := StringReplace(scadenzaLotto,'/','',[rfReplaceAll]) ;
            edtserie.OnExit(edtserie);
            fl_inizializzazione := false;
            fra_prepspedov.edtDataLotto.AsDateTime := StrToDateTime(Ibws_barcode.scadenza);
            fra_prepspedov.PgcCtrl.TabIndex := 2;
            NewPagecontrolChange(fra_prepspedov.PgcCtrl);
            if not Ibws_barcode.peso3103 then
            begin
              //Ibws_barcode.peso := Ibws_barcode.GetPesoFissoFromEan(Ibws_barcode.itemcode);
              //edtqtaumv.AsFloat := Ibws_barcode.peso;

              edtqtaumv.AsFloat := getQtaResidua;

              edtqtaumv.OnExit(edtqtaumv);
              edtqtaumv.SetFocus;
            end
            else
            begin
              edtqtaumv.AsFloat := 1;                     //cartoni
              edtqtaumm.AsFloat := Ibws_barcode.peso;    // kili
              edtqtaumi.AsFloat := edtqtaumv.AsFloat * objartico.ConvUM(orgumv,ouI);         //Pezzi
              edtqtaumv.SetFocus;
            end;

          end;
        end;
      end;
    end;
  finally
    if Assigned(iBWS_barcode) then
      FreeAndNil(iBWS_barcode);
  end;

end;


procedure TPI_Altag_BWS.BtnDetailScaricoClick(sender: TObject);
var
  frmDett : TFrmDetailsCarico;
begin
  frmDett := TFrmDetailsCarico.create(form);
  frmDett.Height := Form.Height;
  frmdett.Width := Form.Width;
  with frmDett.qr_dettaglio do
  begin
    close;
    SQL.Text := 'select ' +
                '  pr.id, ' +
                '  art.codice as articolo,  ' +
                '  ls.NUMLOT as lotto,      ' +
                '  ls.NUMSER as serie,      ' +
                '  ls.Datrif as data_lotto, ' +
                '  pr.QTA1,   ' +
                '  pr.QTA2,   ' +
                '  pr.QTA3,   ' +
                '  pr.UM3     ' +
                ' from PDTRIG Pr  ' +
                ' join lotser ls on ls.id = pr.IDLOTSER   ' +
                ' join artico art on art.id = ls.IDARTICO  ' +
                ' left join comrig cr on cr.id = pr.idcomrig ' +
                ' left join comtes ct on ct.id = cr.IDCOMTES ' +
                'where cr.id = :IDCOMRIG ';

    if derralim <> 'T' then
      SQL.Text := sql.Text + 'ANd art.DERRALIM = ''' + DERRALIM + '''';

    SQL.Text := sql.text + ' order by data_lotto,lotto,serie';

    Prepare;
    ParamByName('idcomrig').Asstring   := fra_prepspedov.QRighepreparate.FieldByName('idcomrig').AsString;

    Open;
  end;
  frmDett.showmodal;
  frmDett.Free;
  fra_prepspedov.GridRighepreparate.RefreshData;
  fra_prepspedov.lbl_cartoni.Caption := 'Colli ' + fra_prepspedov.QRighepreparate.FieldByName('qtasparata').AsString + '/' + fra_prepspedov.QRighepreparate.FieldByName('qtatot').AsString;
  DMPDT.Qry_EVACom.close;
  udmpdt.DMPDT.Qry_EVACom.open;
  fra_prepspedov.QRighepreparate.Locate('idcomrig',idcomrig,[]);
  fra_prepspedov.GridRighepreparate.SelectedRows.CurrentRowSelected := True;
end;

procedure TPI_Altag_BWS.btngiacenzeclick(sender: TObject);
var
  QrG : tcsequery;
  frmlotti : tfrmdettlotti;
begin
  QrG := TCSEQuery.Create(nil);
  QrG.DataBaseName := dbexec.DatabaseName;
  QrG.SQL.Text := 'select         '+
                  '   ls.NUMLOT,    '+
                  '   ls.DATRIF,   '+
                  ' allm.DESCR, '+
                  ' (g.QTTGIAI - SUM(isnull(pd.QTA3,0))) as qtaLotto '+
                  ' from GIAMAG g '+
                  ' join LOTSER ls ' +
                  '   on ls.ID = g.IDARTICO ' +
                  ' join ARTICO art ' +
                  '   on art.ID = ls.IDARTICO ' +
                  ' join ALLMAG allm ' +
                  '   on allm.ID = g.IDMAG ' +
                  ' left join PDTRIG pd ' +
                  '   on pd.IDLOTSER = ls.ID ' +
                  'where art.ID = ' + inttostr(f2artico.KeyValue) +
                  ' group by ls.NUMLOT, ' +
                  '      ls.DATRIF,    ' +
                  '      allm.DESCR,   ' +
                  '      g.QTTGIAI ';
  QrG.Open;

  frmlotti := tfrmdettlotti.Create(form);
  frmlotti.Height := Form.Height;
  frmlotti.Width := Form.Width;
  frmlotti.DsLot.DataSet := QrG;
  frmlotti.ShowModal;
  frmlotti.free;
  QrG.Close;
  FreeAndNil(qrg);
end;

procedure TPI_Altag_BWS.BtnLeggiBarcodeClick(sender: TObject);
var
  Ibws_barcode : TBWS_barcode128;
  objartico : iarticostd;
begin
  Ibws_barcode := TBWS_barcode128.Create;
  try
    Ibws_barcode.LeggiBarcode128_2;
    if Ibws_barcode.itemcode <> '' then
    begin
      scadenzaLotto := Ibws_barcode.scadenza;
      f2artico.KeyValue := Ibws_barcode.GetArticoFromEan(Ibws_barcode.itemcode);
      f2artico.OnExit(f2artico);
      if f2artico.KeyValue <> 0 then
      begin
        if not Assigned(objArtico) then
          GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);

        ObjArtico.Seek('ID', f2artico.KeyValue);
        objartico.UMVend(umv,orgumv,umcomv,orgumconv,uminv);

        edtlotto.AsString := Ibws_barcode.lotto;
        edtlotto.OnExit(edtlotto);
        edtserie.AsString := StringReplace(scadenzaLotto,'/','',[rfreplaceall]) ;
        edtserie.OnExit(edtserie);
        if not Ibws_barcode.peso3103 then
        begin
          edtqtaumm.AsFloat := 1;        //cartoni
          edtqtaumi.asfloat := edtqtaumm.AsFloat * objartico.ConvUM(orgumv,ouI); // pezzi
        end
        else
        begin
          edtqtaumv.AsFloat := 1;            //cartoni
          edtqtaumm.AsFloat := Ibws_barcode.peso;    // kili
          edtqtaumi.AsFloat := edtqtaumv.AsFloat * objartico.ConvUM(orgumv,ouI);         //Pezzi
        end;

      end;
    end;
  finally
    if Assigned(Ibws_barcode) then
      FreeAndNil(iBWS_barcode);
  end;

end;


procedure TPI_Altag_BWS.BtnLeggiPezzoSingoloClick(sender: TObject);
var
  Ibws_barcode : TBWS_barcode128;
  codice : string;
  peso,
  umm,
  umi : double;
begin
  Ibws_barcode := TBWS_barcode128.Create;
  try
    if (f2artico.KeyValue > 0) and (edtlotto.AsString <> '') and peso3103 then
    begin
      umm := 0;
      umi := 0;
      codice := Ibws_barcode.LeggiBarcodePezzoSingolo;
      while codice <> '' do
      begin
        if Length(codice) > 13 then
        begin
          MessaggioPDT('Barcode non valido!',APPTITLE,MB_OK);
        end
        else
        begin
          peso := StrToInt(Copy(codice,8,5)) / 1000;
          if peso > 0 then
          begin
            umm := umm + peso;
            umi := umi + 1;
          end;
        end;
         codice := Ibws_barcode.LeggiBarcodePezzoSingolo;
      end;
      edtqtaumm.AsFloat := umm;
      edtqtaumi.AsFloat := umi;
      edtqtaumi.OnExit(edtqtaumi);
      //mi posiziono alla pagina dopo
      fra_prepspedov.PgcCtrl.TabIndex := 2;
      NewPagecontrolChange(fra_prepspedov.PgcCtrl);
    end;
  finally
    if Assigned(Ibws_barcode) then
      FreeAndNil(iBWS_barcode);
  end;
end;

function TPI_Altag_BWS.ControllaPresenzaArticoliDeteriorabili(
  idcommessa: Integer) : boolean;
var
  qr_sel : tcsequery;
begin
  Result := false;
  qr_sel := TCSEQuery.Create(nil);
  qr_sel.DataBaseName := dbexec.DatabaseName;
  qr_sel.SQL.Text := 'select isnull(idAnaPagDet,0) as iddet ' +
                     ' from comrig cr ' +
                     ' join COMTES c on c.id = cr.idcomtes ' +
                     ' join CLIENTI cli on cli.id = c.idcliente ' +
                     ' where cr.idcomtes = ' + inttostr(idcommessa);
  qr_sel.Open;
  if qr_sel.FieldByName('iddet').AsInteger > 0 then
    result := true;
  qr_sel.Close;
  FreeAndNil(qr_sel);

end;

procedure TPI_Altag_BWS.CreaButton;
begin
  BtnLeggiBarcode := TBitBtn.Create(form);
  with(BtnLeggiBarcode) do
  begin
    Name := 'btnleggibarcode';
    Caption := 'Barcode GS1';
    Height := 25;

    Align := Albottom;
    visible := true;
    enabled := true;
    parent := pnlinvmag;

    OnClick := BtnLeggiBarcodeClick;

  end;

end;


procedure TPI_Altag_BWS.EdtNewTestataExit(sender: TObject);
begin
  if (fra_prepspedov.EdtNewTestata.AsString <> '') then
  begin
    if Copy(fra_prepspedov.EdtNewTestata.AsString,1,1) = 'D' then
    begin
      edttestata.Asinteger := StrToInt(copy(fra_prepspedov.EdtNewTestata.AsString,2));
      DERRALIM := 'D';
      fra_prepspedov.DERRALIM := 'D';
    end
    else if Copy(fra_prepspedov.EdtNewTestata.AsString,1,1) = 'N' then
    begin
      edttestata.Asinteger := StrToInt(copy(fra_prepspedov.EdtNewTestata.AsString,2));
      DERRALIM := 'N';
      fra_prepspedov.DERRALIM := 'N';
    end
    else
    begin
      edttestata.AsInteger := StrToInt(fra_prepspedov.EdtNewTestata.AsString);
      DERRALIM := 'T';
      fra_prepspedov.DERRALIM := 'T';
    end;
    edttestata.OnExit(sender);
  end;
end;

procedure TPI_Altag_BWS.NewFormOnResize(sender: TObject);
begin
  if Assigned(oldFormOnResize) then
    oldFormOnResize(sender);
  ModificaPrepSpedOV;
end;

procedure TPI_Altag_BWS.ModificaPrepSpedOV;
begin
  if Assigned(fra_prepspedov) then
    fra_prepspedov.Free;

  fra_prepspedov := TFra_PrepspedOV.create(nil);
  fra_prepspedov.Parent := scbdata;
  fra_prepspedov.Height := scbdata.Height;
  fra_prepspedov.Width := scbdata.Width;
  fra_prepspedov.Align := alclient;
  with(pnltasti) do
  begin
    Parent := fra_prepspedov.NewRiga;
    Align := alBottom;
  end;
  pnlstdbtn.height := 0;
  pnlstdstatus.height := 0;
  pnlstdgen.height := 0;
  pnlstato.height := stbbarra.height;

  fra_prepspedov.Align := alClient;
  fra_prepspedov.lblGiacenza.Width := fra_prepspedov.newriga.width - fra_prepspedov.lblGiacenza.Left - 4;

  with edttestata do
  begin
    parent  := fra_prepspedov.Testata;
    Top     := fra_prepspedov.EdtNewTestata.Top;
    Left    := fra_prepspedov.EdtNewTestata.Left;
    Height  := fra_prepspedov.EdtNewTestata.Height;
    Width   := fra_prepspedov.EdtNewTestata.Width;
    Anchors := fra_prepspedov.EdtNewTestata.Anchors;
    SendToBack;
  end;

  fra_prepspedov.LblNewBamTes.Top := fra_prepspedov.EdtNewTestata.Top - fra_prepspedov.LblNewBamTes.Height;
  fra_prepspedov.LblNewBamTes.Left := fra_prepspedov.EdtNewTestata.Left;

  with f2bamtes do
  begin
    parent := fra_prepspedov.Testata;
    top := fra_prepspedov.EdtNewTestata.Top;
    Left := fra_prepspedov.EdtNewTestata.Left + fra_prepspedov.EdtNewTestata.Width + 2;
    Width := fra_prepspedov.Testata.Width - fra_prepspedov.EdtNewTestata.left - fra_prepspedov.EdtNewTestata.Width -2;
    Anchors := [akTop,akleft];
    oldf2bamteskeychange := onkeychange;
    OnKeyChange := NewF2bamtesKeychange;
    TabOrder := 1;
  end;



  with FPnlDescrCli do
  begin
    parent := fra_prepspedov.Testata;
    top := f2bamtes.Top + f2bamtes.Height + 5;
    Left := fra_prepspedov.EdtNewTestata.left;
    TabStop := false;
  end;

  fra_prepspedov.LblVETT.Top := FPnlDescrCli.Top + FPnlDescrCli.Height + 5;
  fra_prepspedov.LblVETT.Left := FPnlDescrCli.Left;

  fra_prepspedov.lblDesVettore.Top := fra_prepspedov.LblVETT.Top + fra_prepspedov.LblVETT.Height + 2;
  fra_prepspedov.lblDesVettore.Left := fra_prepspedov.LblVETT.Left;

  fra_prepspedov.lblNumSpedizione.Top := fra_prepspedov.lblDesVettore.Top + fra_prepspedov.lblDesVettore.Height +5;
  fra_prepspedov.lblNumSpedizione.Left := fra_prepspedov.lblDesVettore.Left;

  fra_prepspedov.EdtNumSpedizione.Top := fra_prepspedov.lblNumSpedizione.Top + fra_prepspedov.lblNumSpedizione.Height + 2;
  fra_prepspedov.EdtNumSpedizione.Left := fra_prepspedov.lblNumSpedizione.Left;

  with(lblartico) do
  begin
    Parent := fra_prepspedov.NewRiga;
    top := fra_prepspedov.lblGiacenza.Top + fra_prepspedov.lblGiacenza.Height +4;
    Left := fra_prepspedov.lblGiacenza.Left -1;
  end;

  with(f2artico) do
  begin
    parent := fra_prepspedov.NewRiga;
    Top := lblartico.Top + lblartico.Height + 1;
    left := fra_prepspedov.lblGiacenza.Left;
    Width := fra_prepspedov.lblGiacenza.Width - fra_prepspedov.btnPezzoSingolo.Width - 1;
    OnKeyChange := NewF2ArticoKeychange;
  end;

  with fra_prepspedov.btnPezzoSingolo do
  begin
    Top := f2artico.Top;
    Left := f2artico.Left + f2artico.Width + 1;
    Height := f2artico.Height;
    OnClick := BtnLeggiPezzoSingoloClick;
  end;

  with(lbllotto) do
  begin
    parent := fra_prepspedov.NewRiga;
    left := lblartico.Left;
    top := f2artico.Top + f2artico.Height + 4;
  end;

  with(edtlotto) do
  begin
    parent := fra_prepspedov.NewRiga;
    top :=  lbllotto.Top + lbllotto.Height + 1;
    Left := fra_prepspedov.lblGiacenza.Left;
    OldEdtLottoOnExit := OnExit;
    onexit := newEdtlottoOnExit;
  end;

  with(edtserie) do
  begin
    Parent := fra_prepspedov.NewRiga;
    top :=  edtlotto.Top;
    Left := edtlotto.Left + edtlotto.Width + 1;
    OldEdtSerieOnExit := onexit;
    onexit := NewEdtserieOnexit;
  end;



  with(lblqtaumv) do
  begin
    Parent := fra_prepspedov.NewRiga;
    top := edtlotto.Top + edtlotto.Height + 4;
    Left := edtlotto.Left-1;
  end;

  with (edtqtaumv) do
  begin
    Parent := fra_prepspedov.NewRiga;
    Top := lblqtaumv.Top + lblqtaumv.Height + 1;
    Left:= edtlotto.Left;

  end;

  with(lblqtaumm) do
  begin
    Parent := fra_prepspedov.NewRiga;
    top := edtlotto.Top + edtlotto.Height + 4;
    //Left := edtlotto.Left-1;
  end;

  with (edtqtaumm) do
  begin
    Parent := fra_prepspedov.NewRiga;
    Top := lblqtaumm.Top + lblqtaumm.Height + 1;
    Left:= edtqtaumv.Left + edtqtaumv.Width + 2;
    lblqtaumm.Left := edtqtaumm.Left -1;
  end;

  with(lblqtaumi) do
  begin
    Parent := fra_prepspedov.NewRiga;
    top := edtlotto.Top + edtlotto.Height + 4;
    //Left := edtlotto.Left-1;
  end;

  with (edtqtaumi) do
  begin
    Parent := fra_prepspedov.NewRiga;
    top := lblqtaumi.Top + lblqtaumi.Height + 1;
    left := edtqtaumm.Left + edtqtaumm.Width + 2;
    lblqtaumi.Left := edtqtaumi.Left -1;

  end;



  with fra_prepspedov.lbl_datalotto do
  begin

    //top :=
    left := edtqtaumv.Left -1;
    top := edtqtaumv.Top + edtqtaumv.Height + 4;
  end;

  with fra_prepspedov.edtDataLotto do
  begin
    Top := fra_prepspedov.lbl_datalotto.Top + fra_prepspedov.lbl_datalotto.Height + 1;
    Left := edtlotto.left;
  end;

  with(lblvano) do
  begin
    parent := fra_prepspedov.NewRiga;
    top := fra_prepspedov.lbl_datalotto.Top;

  end;

  with(f2allmag) do
  begin
    parent := fra_prepspedov.NewRiga;
    Top := fra_prepspedov.edtDataLotto.Top;
    Left := fra_prepspedov.edtDataLotto.Left + fra_prepspedov.edtDataLotto.Width + 3;
    width :=  fra_prepspedov.Testata.Width - fra_prepspedov.edtDataLotto.Left - fra_prepspedov.edtDataLotto.Width - 3;
    lblvano.left := f2allmag.Left -1;
  end;

  lblbamtes.visible := false;
  FPnlDatiRiga.Visible := False;
  lblsscc.Visible := false;
  lblssccda.Visible := False;
  edtssccda.Visible := false;
  edtbarcodeunico.Visible := False;

  with fra_prepspedov.PgcCtrl do
  begin
    oldPagecontrolChange := OnChange;
    OnChange := NewPagecontrolChange;
  end;

  with fra_prepspedov.GridRighepreparate do
  begin
    IniFileName := GLO.IniUtente;
    IniSection  := Form.Name + '_NewGridRighepreparate_' + azienda.Id;
    LoadFromIniFile;
  end;

  with fra_prepspedov.Btngiacenze do
  begin
    Top := edtserie.Top;
    Height := edtserie.Height;
    Left := edtserie.Left + edtserie.Width + 1;
    OnClick := btngiacenzeclick;
  end;

  fra_prepspedov.EdtNewTestata.OnExit := EdtNewTestataExit;
  fra_prepspedov.btnBarcode.OnClick := BtnCaricaBarcodeClick;

  fra_prepspedov.btnDetail.OnClick := BtnDetailScaricoClick;
  fra_prepspedov.EdtNumSpedizione.OnKeyDown := NumSpedizioneKeydown;
  fra_prepspedov.QRighepreparate.DataBaseName := dbexec.DatabaseName;
  fra_prepspedov.Visible := true;

  fra_prepspedov.SetFocus;
  fra_prepspedov.EdtNewTestata.SetFocus;
  fra_prepspedov.PgcCtrl.TabIndex := 0;
  NewPagecontrolChange(fra_prepspedov.PgcCtrl);

end;


procedure TPI_Altag_BWS.newbtinsclick_ScarOP(sender: TObject);
var
  Lqry : TCSEQuery;
  SPID,
  idmovmag : integer;
  objMovMag: IMovMagStd;
  qtainv,
  qtamov,
  qtaven : double;
  str : string;
  fl_mod : Boolean;
begin
  // mi prendo i valori prima del tasto ok per evitare che vengano sbiancati
  fl_mod := false;
  qtainv := edtqtaumi.AsFloat;
  qtamov := edtqtaumm.AsFloat;
  qtaven := edtqtaumv.AsFloat;

  if Assigned(oldbtninsclick) then
    oldbtninsclick(sender);

  if not GetInterfOggetto('objMovMag', 'MOVMAG', IMovMagStd, objMovMag) then
  begin
    MessaggioPDT('Errore interfacciamento oggetto objmovmag',APPTITLE,mb_ok);
    exit;
  end;

  Lqry := TCSEQuery.Create(nil);
  Lqry.DataBaseName := DBExec.DatabaseName;
  Lqry.SQL.Text := 'select @@spid as spid';
  Lqry.open;
  SPID := Lqry.FieldByName('spid').AsInteger;
  Lqry.Close;
  Lqry.SQL.Clear;
  Lqry.SQL.Text := 'select max(id) as id from movmag where ext_spid = :spid and idopdp is not null';
  Lqry.ParamByName('spid').AsInteger := SPID;
  Lqry.Open;
  if Lqry.IsEmpty then
  begin
    MessaggioPDT('Errore nel recupero del movimento di magazzino',APPTITLE,MB_OK);
  end
  else
  begin
    idmovmag := Lqry.FieldByName('id').AsInteger;
    Lqry.SQL.Text := 'select qtainv,qtamov,qtaven from movmag where id = ' + IntToStr(idmovmag);
    Lqry.Open;

    objMovMag.Found := false;
    objMovMag.Seek('ID',idmovmag);
    if objMovMag.Found then
    begin
      if qtainv <> Lqry.FieldByName('qtainv').AsFloat then
      begin
        objMovMag.CampiObj['qtainv'] := qtainv;
        fl_mod := true;
      end;
      if qtamov <> Lqry.FieldByName('qtamov').AsFloat then
      begin
        objMovMag.CampiObj['qtamov'] := qtamov;
        fl_mod := true;
      end;
      if qtaven <> Lqry.FieldByName('qtaven').AsFloat then
      begin
        objMovMag.CampiObj['qtaven'] := qtaven;
        fl_mod := true;
      end;

      if fl_mod then
      begin
        objMovMag.CampiObj['idsalva'] := 1;
        objmovmag.addgenmov;
        str := objmovmag.GeneraMovimento(False,false);
      end;
    end
    else
    begin
      MessaggioPDT('Non è stato possibile recuperare movimento di magazziono id = ' + IntToStr(idmovmag),APPTITLE,MB_OK);
    end;

  end;
  objMovMag.FreeGenMov;
  Lqry.Close;
  FreeAndNil(Lqry);
end;



procedure TPI_Altag_BWS.NewBtnEndmissionClick(sender: TObject);

  procedure GestArticoliDerralimPDTRIG(Azione : string);   // D = delete I = inserisci
  var
    lqry : TCSEQuery;
    nome_tabella : string;
    //PDTRig: IObjStd;
    //LMsg: string;
  begin
    nome_tabella := 'PDTRIGTMP' + Utente.ConnectId;
    lqry := TCSEQuery.Create(nil);
    lqry.DataBaseName := dbexec.DatabaseName;
    {
    if not GetInterfOggetto('ObjPDTRig', 'PDTRig', IObjStd, PDTRig) then
    begin
      LMsg := 'Si è verificato un errore durante l''inizializzazione del Modulo BWS ' +
              'per l''interfaccia Preparazione Spedizioni.';
      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
      Exit;
    end;
    }
    if Azione = 'D' then
    begin
      lqry.Close;
      lqry.SQL.Text := 'select * from sysobjects where name = ''' + nome_tabella + ''' and xtype = ''U''';
      lqry.Open;
      if not lqry.IsEmpty then
      begin
        lqry.Close;
        lqry.SQL.Text := 'drop table ' + nome_tabella;
        try
          lqry.ExecSQL;
        except
          on e:exception do
          begin
            MessaggioPDT('Si è verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
            Abort;
          end;
        end;
        lqry.Close;
      end;
      lqry.Close;
      lqry.SQL.Text := 'select p.* into ' + nome_tabella  +
                       '  from pdtrig p ' +
                       '  join comrig cr on cr.id = p.idcomrig ' +
                       '  join lotser ls on ls.id = cr.idartico ' +
                       '  join artico art on art.id = ls.idartico ' +
                       ' where cr.idcomtes = ' + inttostr(f2bamtes.KeyValue) +
                       '   and art.derralim <> ''' + DERRALIM + '''';



      try
        lqry.ExecSQL;
      except
        on e:exception do
        begin
          MessaggioPDT('Si è verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
          Abort;
        end;
      end;
      lqry.Close;
      lqry.SQL.Text := 'delete p ' +
                       '  from pdtrig p ' +
                       '  join comrig cr on cr.id = p.idcomrig ' +
                       '  join lotser ls on ls.id = cr.idartico ' +
                       '  join artico art on art.id = ls.idartico ' +
                       ' where cr.idcomtes = ' + inttostr(f2bamtes.KeyValue) +
                       '   and art.derralim <> ''' + DERRALIM + '''';

      try
        lqry.ExecSQL;
      except
        on e:exception do
        begin
          MessaggioPDT('Si è verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
          Abort;
        end;
      end;
      lqry.Close;
    end;

    if Azione = 'I' then
    begin
      lqry.Close;
      lqry.SQL.Text := 'insert into pdtrig ' +
                       'select IDFATRIG,IDCOMRIG,IDLOTSER,IDALLMAG,IDDIPENDENTI,' +
                       'IDBAM,CODUDC,QTA1,QTA2,QTA3,UM3,IDFAT,IDRIC,SSCC,IDMOVMAG,IDLOTTIBF,' +
                       'NUMBANC,CONTAINER,NUMPACK,RIFERI,IDARTIMB from ' + nome_tabella;
      try
        lqry.ExecSQL;
      except
        on e:exception do
        begin
          MessaggioPDT('Si è verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
          Abort;
        end;
      end;
      Lqry.Close;
      lqry.SQL.Text := 'Drop table ' + nome_tabella;
      try
        lqry.ExecSQL;
      except
        on e:exception do
        begin
          MessaggioPDT('Si è verificato il seguente errore : ' +CrLf + e.Message,apptitle,MB_OK);
          Abort;
        end;
      end;
    end;

    lqry.Close;
    FreeAndNil(Lqry);

  end;

var
  Lderralim : string;
  //Lqry : TCSEQuery;
  //sql,res : string;
  //id_doc : Integer;
  //ObjBamTes: IBamTesStd;
  //SPID : integer;
begin
  Lderralim := DERRALIM;

  if Lderralim <> 'T' then
    GestArticoliDerralimPDTRIG('D');

  if Lderralim <> 'T' then
  begin
    DBExec.ExecSql('Update pdtrig ' +
                   '   set codudc = ' + inttostr(fra_prepspedov.EdtNumSpedizione.AsInteger) +
                   '  from pdtrig p ' +
                   '  join comrig cr ' +
                   '    on cr.id = p.idcomrig ' +
                   '  join lotser ls on ls.id = cr.idartico ' +
                   '  join artico art on art.id = ls.idartico ' +
                   '  join comtes ct ' +
                   '    on ct.id = cr.idcomtes ' +
                   ' where art.derralim = ''' + Lderralim + '''' +
                   '   and ct.id = ' + IntToStr(f2bamtes.KeyValue));
  end
  else
  begin
    DBExec.ExecSql('Update pdtrig ' +
                   '   set codudc = ' + inttostr(fra_prepspedov.EdtNumSpedizione.AsInteger) +
                   '  from pdtrig p ' +
                   '  join comrig cr ' +
                   '    on cr.id = p.idcomrig ' +
                   '  join lotser ls on ls.id = cr.idartico ' +
                   '  join artico art on art.id = ls.idartico ' +
                   '  join comtes ct ' +
                   '    on ct.id = cr.idcomtes ' +
                   ' where ct.id = ' + IntToStr(f2bamtes.KeyValue));
  end;



  if Assigned(oldbtnendmissionClick) then
    oldbtnendmissionClick(sender);

  if Lderralim <> 'T' then
    GestArticoliDerralimPDTRIG('I');

  if fl_resultok then
  begin



     // blocco commentato perchè non serve più.
     //Il numero di spedizione è stato spostato nel trigger e il documento non serve più portarlo in definitivo
    //Lqry := TCSEQuery.Create(nil);
    //Lqry.DataBaseName := DBExec.DatabaseName;
    //Lqry.SQL.Text := 'select @@spid as spid';
    //Lqry.open;
    //SPID := Lqry.FieldByName('spid').AsInteger;
    //Lqry.Close;
    //Lqry.SQL.Clear;

    //if idtipodocB <> 0 then
    //begin

    //  sql := 'select max(id) id from bamtes where idtipidoc = ' + inttostr(idtipodocB) + ' and ext_spid = ' + IntToStr(spid);

    //  Lqry.SQL.Text := sql;
    //  Lqry.Open;
    //  id_doc := Lqry.FieldByName('id').AsInteger;
    //  Lqry.Close;

      //Lqry.SQL.Text := 'update bamtes set riferi1 = ''' + nr_spedizione + ''' where id = ' + inttostr(id_doc);

      //Lqry.ExecSQL;
      //if not Assigned(ObjBamTes) then
      //begin
      //  if not GetInterfOggetto('ObjBamTes', 'BamTes', IBamTesStd, ObjBamTes) then
      //  begin
       //   raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');

       // end;
    //  end;

      //ObjBamTes.Found := false;
      //ObjBamTes.Seek('id',id_doc);
      //if ObjBamTes.Found then
      //begin
      //  res := ObjBamTes.ImpostaStato('D');
      //  if res = '' then
      //  begin
      //    ObjBamTes.CampiObj['stato'] := 'D';
      //    ObjBamTes.Modifica;
      //  end
      //  else
      //    MessaggioPDT('Errore nel passaggio del ddt in definitivo : '+#10+#13+res, APPTITLE,MB_OK);

      //end;

    //end;

    {
    if idtipodocF <> 0 then
    begin
      sql := 'select max(id) id from fattes where idtipidoc = ' + inttostr(idtipodocF) + ' and ext_spid = ' + IntToStr(spid);
      Lqry.SQL.Text := sql;
      Lqry.Open;
      id_doc := Lqry.FieldByName('id').AsInteger;
      Lqry.Close;

      //Lqry.SQL.Text := 'update fattes set riferi1 = ''' + nr_spedizione + ''' where id = ' + inttostr(id_doc);
      //Lqry.ExecSQL;
    end;

    if idtipodocR <> 0 then
    begin
      sql := 'select max(id) id from rifisc where idtipidoc = ' + inttostr(idtipodocR) + ' and ext_spid = ' + IntToStr(spid);
      Lqry.SQL.Text := sql;
      Lqry.Open;
      id_doc := Lqry.FieldByName('id').AsInteger;
      Lqry.Close;

      //Lqry.SQL.Text := 'update rifisc set riferi1 = ''' + nr_spedizione + ''' where id = ' + inttostr(id_doc);
      //Lqry.ExecSQL;
    end;
    }
    //Lqry.Close;
    //Lqry.Free;

    fra_prepspedov.edtDataLotto.Clear;

    fra_prepspedov.EdtNewTestata.AsString := '';
    fra_prepspedov.EdtNumSpedizione.Clear;
    fra_prepspedov.PgcCtrl.TabIndex := 0;
    NewPagecontrolChange(fra_prepspedov.PgcCtrl);
    messaggiospedizione := false;
  end;
end;

procedure TPI_Altag_BWS.newbtninsclick(sender: TObject);
var
  Lidcomrig : Integer;
  strcomrig : string;
  qr_crig : TCSEQuery;
  frmselcrig : tfrmcomrig;
  book : TBookmark;
begin
  //if fl_inizializzazione then
  //  exit;

  Lidcomrig := 0;
  strcomrig := '';
  book := udmpdt.DMPDT.Qry_EVACom.GetBookmark;

  udmpdt.DMPDT.Qry_EVACom.Filter := 'codice = ''' + f2artico.qryF2.FieldByName('codice').AsString;
  udmpdt.DMPDT.Qry_EVACom.Filtered := true;
  if udmpdt.DMPDT.Qry_EVACom.RecordCount > 1 then
  begin
    while not udmpdt.DMPDT.Qry_EVACom.eof do
    begin
      if strcomrig <> '' then
        strcomrig := strcomrig + ',';
      strcomrig := strcomrig + inttostr(udmpdt.DMPDT.Qry_EVACom.fieldbyname('idcomrig').asinteger);
      udmpdt.DMPDT.Qry_EVACom.Next;
    end;

    qr_crig := TCSEQuery.Create(nil);
    qr_crig.DataBaseName := dbexec.DatabaseName;
    qr_crig.SQL.Text := 'select cr.id,art.codice,cr.omascm '+
                        ' from comrig cr ' +
                        ' join lotser ls ' +
                        '   on ls.id = cr.idartico ' +
                        ' join artico art ' +
                        '   on art.id = ls.idartico ' +
                        'where cr.id in ('+strcomrig+') ';

    if DERRALIM <> 'T' then
      qr_crig.SQL.Text := qr_crig.SQL.Text + ' and art.derralim = ''' + DERRALIM + '''';

    qr_crig.Open;
    frmselcrig := TFrmComrig.Create(self);
    frmselcrig.DS.DataSet := qr_crig;
    frmselcrig.Height := form.Height;
    frmselcrig.Width := Form.Width;
    frmselcrig.ShowModal;
    Lidcomrig := qr_crig.FieldByName('id').AsInteger;
    frmselcrig.Free;
    qr_crig.Close;
  end;
  udmpdt.DMPDT.Qry_EVACom.Filtered := false;
  udmpdt.DMPDT.Qry_EVACom.Filter := '';
  udmpdt.DMPDT.Qry_EVACom.Refresh;
  udmpdt.DMPDT.Qry_EVACom.GotoBookmark(book);
  udmpdt.DMPDT.Qry_EVACom.FreeBookmark(book);

  if Lidcomrig > 0 then
  begin
    if not udmpdt.DMPDT.Qry_EVACom.Locate('idcomrig',Lidcomrig,[]) then
    begin
      MessaggioPDT('Errore nel recupero della riga comrig',APPTITLE,MB_OK);
      abort;
    end;
  end;

  idcomrig := udmpdt.DMPDT.Qry_EVACom.FieldByName('idcomrig').AsInteger;

  if Assigned(oldbtninsclick) then
    oldbtninsclick(sender);

  fra_prepspedov.PgcCtrl.TabIndex := 1;
  NewPagecontrolChange(fra_prepspedov.PgcCtrl);
  BtnCaricaBarcodeClick(sender);
end;

procedure TPI_Altag_BWS.newBtnInsclick_carOP(sender: TObject);
var
  Lqry : TCSEQuery;
  SPID,
  idmovmag : integer;
  objMovMag: IMovMagStd;
  qtainv,
  qtamov,
  qtaven : double;
  str : string;
  fl_mod : Boolean;
begin
  // mi prendo i valori prima del tasto ok per evitare che vengano sbiancati
  fl_mod := false;
  qtainv := edtqtaumi.AsFloat;
  qtamov := edtqtaumm.AsFloat;
  qtaven := edtqtaumv.AsFloat;

  if Assigned(oldbtninsclick) then
    oldbtninsclick(sender);

  if not GetInterfOggetto('objMovMag', 'MOVMAG', IMovMagStd, objMovMag) then
  begin
    MessaggioPDT('Errore interfacciamento oggetto objmovmag',APPTITLE,mb_ok);
    exit;
  end;

  Lqry := TCSEQuery.Create(nil);
  Lqry.DataBaseName := DBExec.DatabaseName;
  Lqry.SQL.Text := 'select @@spid as spid';
  Lqry.open;
  SPID := Lqry.FieldByName('spid').AsInteger;
  Lqry.Close;
  Lqry.SQL.Clear;
  Lqry.SQL.Text := 'select max(id) as id from movmag where ext_spid = :spid and IDOPLotF is not null';
  Lqry.ParamByName('spid').AsInteger := SPID;
  Lqry.Open;
  if Lqry.IsEmpty then
  begin
    MessaggioPDT('Errore nel recupero del movimento di magazzino',APPTITLE,MB_OK);
  end
  else
  begin
    idmovmag := Lqry.FieldByName('id').AsInteger;
    Lqry.SQL.Text := 'select qtainv,qtamov,qtaven from movmag where id = ' + IntToStr(idmovmag);
    Lqry.Open;

    objMovMag.Found := false;
    objMovMag.Seek('ID',idmovmag);
    if objMovMag.Found then
    begin
      if qtainv <> Lqry.FieldByName('qtainv').AsFloat then
      begin
        objMovMag.CampiObj['qtainv'] := qtainv;
        fl_mod := true;
      end;
      if qtamov <> Lqry.FieldByName('qtamov').AsFloat then
      begin
        objMovMag.CampiObj['qtamov'] := qtamov;
        fl_mod := true;
      end;
      if qtaven <> Lqry.FieldByName('qtaven').AsFloat then
      begin
        objMovMag.CampiObj['qtaven'] := qtaven;
        fl_mod := true;
      end;

      if fl_mod then
      begin
        objMovMag.CampiObj['idsalva'] := 1;
        objmovmag.addgenmov;
        str := objmovmag.GeneraMovimento(False,false);
      end;
    end
    else
    begin
      MessaggioPDT('Non è stato possibile recuperare movimento di magazziono. id = ' + IntToStr(idmovmag),APPTITLE,MB_OK);
    end;

  end;
  objMovMag.FreeGenMov;
  //movmagprd.FreeMovMag;
  Lqry.Close;
  FreeAndNil(Lqry);

end;

procedure TPI_Altag_BWS.newbtnokClick(sender: TObject);
begin
  fl_resultok := true;
  //nr_spedizione := InputBox('Numero di spedizione','','');
  case Rgtipodoc.ItemIndex of
    0:begin
      idtipodocB := f2idtipodoc.KeyValue;
    end;
    1:begin
      idtipodocF := f2idtipodoc.KeyValue;
    end;
    2:begin
      idtipodocR := f2idtipodoc.KeyValue;
    end;
  end;
  if Assigned(oldbtnokclick) then
    oldbtnokclick(sender);
end;

procedure TPI_Altag_BWS.newEdtlottoOnExit(sender: TObject);
var
  Lqry : TCSEQuery;
  frmSelLotto : TfrmSelLotto;
begin
  if Assigned(OldEdtLottoOnExit) then
    OldEdtLottoOnExit(sender);

  if not fl_inizializzazione then
  begin
    if (edtlotto.AsString <> '') and (edtserie.AsString = '') then
    begin
      Lqry := TCSEQuery.Create(nil);
      Lqry.DataBaseName := DBExec.DatabaseName;
      Lqry.SQL.Text := 'select numser ' +
                       '  from lotser ls ' +
                       '  join artico art ' +
                       '    on art.id = ls.idartico ' +
                       ' where art.id = ' + IntToStr(f2artico.KeyValue) +
                       ' and ls.numlot = ''' + edtlotto.AsString + '''';
      Lqry.Open;
      if Lqry.IsEmpty then
      begin
        MessaggioPDT('Nessuna serie disponibile per il lotto ' + edtlotto.AsString,APPTITLE,mb_ok);
      end
      else
      begin
        frmSelLotto := tfrmsellotto.create(form);
        frmSelLotto.Height := form.Height;
        frmSelLotto.Width := form.Width;
        frmsellotto.DataSource1.DataSet := Lqry;
        frmSelLotto.showmodal;
        if frmSelLotto.ModalResult = mrOk then
        begin
          edtserie.AsString := Lqry.FieldByName('numser').AsString;
        end;
        frmSelLotto.Free;
      end;
      Lqry.Close;
      FreeAndNil(Lqry);
    end;
  end;
end;

procedure TPI_Altag_BWS.NewEdtSerieOnExit(sender: TObject);
var
  Lqry : TCSEQuery;
  LqtaVen, LqtaMov, LqtaInv, Lqtaprep : double;
  objArtico: IArticoStd;
begin
  if Assigned(OldEdtSerieOnExit) then
    OldEdtSerieOnExit(sender);

  //if not fl_inizializzazione then      non c'è bisogno in quanto deve valorizzare le giacenze del lotto
  begin
    if FF2LotSer.KeyValue > 0 then
    begin
      try
         Lqry := TCSEQuery.Create(nil);
         Lqry.DataBaseName := Azienda.DatabaseName;

         Lqry.SQL.Text := 'select sum(isnull(qta3,0)) as tot from pdtrig where idlotser = ' +CS_KeyValueTo_SqlStr(FF2LotSer.KeyValue);
         Lqry.Open;
         Lqtaprep := Lqry.FieldByName('tot').AsFloat;
         Lqry.Close;
         Lqry.SQL.Text := 'SELECT QTTGIAI, QTTGIAM ' +
                          'FROM LOTSER WHERE ID = ' + CS_KeyValueTo_SqlStr(FF2LotSer.KeyValue);
         Lqry.Open;
         if not Lqry.Eof then
         begin

           LqtaInv := Lqry.FieldByName('QTTGIAI').AsFloat - Lqtaprep;
           LqtaMov := Lqry.FieldByName('QTTGIAM').AsFloat;
           if not Assigned(objArtico) then
             GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
           ObjArtico.Seek('ID', f2artico.KeyValue);
           if umcomv <> 'KG' then
           begin
             LqtaMov := LqtaInv;
           end;
           LqtaVen := LqtaInv * objartico.ConvUM(ouI, orgumv);

           fra_prepspedov.lblGiacenza.Caption := 'GIACENZA ' + #10+#13;

           if lblqtaumv.Caption <> '[UMX]' then
             fra_prepspedov.lblGiacenza.Caption := fra_prepspedov.lblGiacenza.Caption  + lblqtaumv.Caption + ' : ' + (Format('%.2f',[LqtaVen])) + #10+#13;

           if lblqtaumm.Caption <> '[UMX]' then
             fra_prepspedov.lblGiacenza.Caption := fra_prepspedov.lblGiacenza.Caption + lblqtaumm.Caption + ' : ' + (Format('%.2f',[LqtaMov])) + #10+#13;

           if lblqtaumi.Caption <> '[UMX]' then
             fra_prepspedov.lblGiacenza.Caption := fra_prepspedov.lblGiacenza.Caption + lblqtaumi.Caption + ' : ' + (Format('%.2f',[LqtaInv])) + #10+#13;

         end;
      finally
        FreeAndNil(Lqry);
      end;
    end;
  end;
end;

procedure TPI_Altag_BWS.NewF2ArticoKeychange(sender: TObject; newkey,
  oldkey: integer);
begin
  if (newkey <> oldkey) and (newkey > 0) then
  begin
    if not ArticoloDerrAlim(newkey,f2bamtes.KeyValue,DERRALIM) then
    begin
      MessaggioPDT('L''articolo inserito non è corretto!',APPTITLE,MB_OK);
      abort;
    end;
  end;
end;

procedure TPI_Altag_BWS.NewF2bamtesKeychange(sender: TObject;newkey,oldkey : integer);
begin

  if newkey <> oldkey then
  begin
    if fra_prepspedov.EdtNewTestata.AsString = '' then
    begin
      EdtTestata.AsString := IntToStr(newkey);
      fra_prepspedov.EdtNewTestata.AsString := IntToStr(newkey);
      if ControllaPresenzaArticoliDeteriorabili(newkey) then
      begin
        if messaggiopdt('Si desidera evadere articoli deteriorabili?',APPTITLE,MB_YESNO) = mrYes  then
        begin
          DERRALIM := 'D' ;
          fra_prepspedov.EdtNewTestata.AsString := 'D'+inttostr(newkey);
          fra_prepspedov.DERRALIM := 'D'
        end
        else
        begin
          DERRALIM:= 'N';
          fra_prepspedov.EdtNewTestata.AsString := 'N'+inttostr(newkey);
          fra_prepspedov.DERRALIM := 'N';
        end;
      end
      else
      begin
        DERRALIM := 'T';
        fra_prepspedov.DERRALIM := 'T';
      end;
    end
    else
    begin
      if not ControllaPresenzaArticoliDeteriorabili(newkey) then
      begin
        DERRALIM := 'T';
        fra_prepspedov.DERRALIM := 'T';
      end;
    end;
  end;

  if Assigned(oldf2bamteskeychange) then
    oldf2bamteskeychange(sender,newkey,oldkey);

  fra_prepspedov.lblDesVettore.Caption := GetDescrVettore(F2BamTes.QryF2.FieldByName('idvettore').AsInteger);

  fra_prepspedov.QRighepreparate.Close;
  if DERRALIM = 'T' then
  begin
    with(fra_prepspedov.QRighepreparate) do
    begin
      SQL.Text := 'select '+
                    'cr.id as idcomrig,   '+
                    'a.codice as codArt,  '+
                    'a.descr as descrArt, '+
                    'sum(isnull(p.qta1,0)) as qtaprep, '+
                    'cr.qta1 as qtaComm,  '+
                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
                    'from comtes c  '+
                    'join comrig cr on cr.IDCOMTES = c.id  '+
                    'join lotser l on l.ID = cr.IDARTICO '+
                    'join artico a on a.id = l.IDARTICO '+
                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key) oa1 '+
                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key ) oa2 '+
                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
                    'left join artico a2 on a2.id = l1.idartico '+
                    'where p2.idcomrig = cr.id '+
                    'and a2.UMM = ''kg'' '+
                    ') oa3 '+
                    'where c.id = :key '+
                    'group by '+
                    'cr.id,   '+
                    'a.codice, '+
                    'a.descr,  '+
                    'cr.qta1,  '+
                    'cr.qtaspe, '+
                    'oa1.qtatot,  '+
                    'oa2.qtasparata, '+
                    'oa3.qtasparatakg,'+
                    'cr.rigadoc '+
                    'order by a.codice,cr.id,cr.rigadoc ';
        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
    end;

   end
  else
  begin
    with(fra_prepspedov.QRighepreparate) do
    begin
        SQL.Text := 'select '+
                    'cr.id as idcomrig,   '+
                    'a.codice as codArt,  '+
                    'a.descr as descrArt, '+
                    'sum(isnull(p.qta1,0)) as qtaprep, '+
                    'cr.qta1 as qtaComm,  '+
                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
                    'from comtes c  '+
                    'join comrig cr on cr.IDCOMTES = c.id  '+
                    'join lotser l on l.ID = cr.IDARTICO '+
                    'join artico a on a.id = l.IDARTICO '+
                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.derralim = :derralim ) oa1 '+
                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.DERRALIM = :derralim) oa2 '+
                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
                    'left join artico a2 on a2.id = l1.idartico '+
                    'where p2.idcomrig = cr.id '+
                    'and a2.UMM = ''kg'' '+
                    'and a2.derralim = :derralim) oa3 '+
                    'where c.id = :key '+
                    'and a.derralim = :derralim  '+
                    'group by '+
                    'cr.id,   '+
                    'a.codice, '+
                    'a.descr,  '+
                    'cr.qta1,  '+
                    'cr.qtaspe, '+
                    'oa1.qtatot,  '+
                    'oa2.qtasparata, '+
                    'oa3.qtasparatakg,'+
                    'cr.rigadoc '+
                    'order by a.codice,cr.id,cr.rigadoc ';

        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
        ParamByName('derralim').AsString := DERRALIM;
    end;
  end;

  fra_prepspedov.QRighepreparate.ParamByName('key').AsInteger := newkey;

  idComTes := f2bamtes.KeyValue;
  idcomrig := 0;

end;



procedure TPI_Altag_BWS.NewPagecontrolChange(sender: TObject);
begin
  if fra_prepspedov.PgcCtrl.ActivePageIndex <> 0 then
  begin
    if (F2Bamtes.KeyValue = 0) then
    begin
      MessaggioPDT('Selezionare una commessa prima di proseguire!',APPTITLE,MB_OK);
      fra_prepspedov.PgcCtrl.TabIndex := 0;
      Abort;
    end;
    if (fra_prepspedov.EdtNumSpedizione.Asinteger = 0) then
    begin
      if not messaggioSpedizione then
      begin
        MessaggioPDT('Numero di spedizione non inserito!',APPTITLE,MB_OK);
        messaggiospedizione := true;
      end;
      //fra_prepspedov.PgcCtrl.TabIndex := 0;
      //uabort;
    end;
  end;

  if fra_prepspedov.PgcCtrl.ActivePageIndex = 1 then
  begin
    fra_prepspedov.QRighepreparate.Close;

    if DERRALIM = 'T' then
    begin
      with(fra_prepspedov.QRighepreparate) do
      begin
        SQL.Text := 'select '+
                    'cr.id as idcomrig,   '+
                    'a.codice as codArt,  '+
                    'a.descr as descrArt, '+
                    'sum(isnull(p.qta1,0)) as qtaprep, '+
                    'cr.qta1 as qtaComm,  '+
                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
                    'from comtes c  '+
                    'join comrig cr on cr.IDCOMTES = c.id  '+
                    'join lotser l on l.ID = cr.IDARTICO '+
                    'join artico a on a.id = l.IDARTICO '+
                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key) oa1 '+
                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key ) oa2 '+
                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
                    'left join artico a2 on a2.id = l1.idartico '+
                    'where p2.idcomrig = cr.id '+
                    'and a2.UMM = ''kg'' '+
                    ') oa3 '+
                    'where c.id = :key '+
                    'group by '+
                    'cr.id,   '+
                    'a.codice, '+
                    'a.descr,  '+
                    'cr.qta1,  '+
                    'cr.qtaspe, '+
                    'oa1.qtatot,  '+
                    'oa2.qtasparata, '+
                    'oa3.qtasparatakg,'+
                    'cr.rigadoc '+
                    'order by a.codice,cr.id,cr.rigadoc ';
        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
      end;

    end
    else
    begin
      with(fra_prepspedov.QRighepreparate) do
      begin
        SQL.Text := 'select '+
                    'cr.id as idcomrig,   '+
                    'a.codice as codArt,  '+
                    'a.descr as descrArt, '+
                    'sum(isnull(p.qta1,0)) as qtaprep, '+
                    'cr.qta1 as qtaComm,  '+
                    'cr.qtaspe as qtasped, oa1.qtatot, oa2.qtasparata, oa3.qtasparatakg as kg, '+
                    'case when (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) = 0 then ''rosso'' else case when  (sum(isnull(p.qta1,0)) + sum(isnull(cr.qtaspe,0))) >= cr.qta1 then ''verde'' else ''giallo'' end end as statoRiga '+
                    'from comtes c  '+
                    'join comrig cr on cr.IDCOMTES = c.id  '+
                    'join lotser l on l.ID = cr.IDARTICO '+
                    'join artico a on a.id = l.IDARTICO '+
                    'left join PDTRIG p on p.IDCOMRIG = cr.id '+
                    'outer apply (select sum(qta1) as qtatot from comrig x join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.derralim = :derralim ) oa1 '+
                    'outer apply (select sum(p.qta1) as qtasparata from pdtrig p join comrig x on x.ID = p.IDCOMRIG join LOTSER lx on lx.ID = x.IDARTICO join ARTICO ax on ax.ID = lx.IDARTICO  where x.idcomtes = :key and ax.DERRALIM = :derralim) oa2 '+
                    'outer apply (select sum(p2.qta2) as qtasparatakg from comrig cr2 '+
                    'left join pdtrig p2 on p2.IDCOMRIG = cr2.id '+
                    'left join lotser l1 on l1.id = cr2.IDARTICO '+
                    'left join artico a2 on a2.id = l1.idartico '+
                    'where p2.idcomrig = cr.id '+
                    'and a2.UMM = ''kg'' '+
                    'and a2.derralim = :derralim) oa3 '+
                    'where c.id = :key '+
                    'and a.derralim = :derralim  '+
                    'group by '+
                    'cr.id,   '+
                    'a.codice, '+
                    'a.descr,  '+
                    'cr.qta1,  '+
                    'cr.qtaspe, '+
                    'oa1.qtatot,  '+
                    'oa2.qtasparata, '+
                    'oa3.qtasparatakg,'+
                    'cr.rigadoc '+
                    'order by a.codice,cr.id,cr.rigadoc ';

        ParamByName('key').AsInteger := F2Bamtes.Keyvalue;
        ParamByName('derralim').AsString := DERRALIM;
      end;


    end;


    fra_prepspedov.QRighepreparate.Open;
    fra_prepspedov.GridRighepreparate.LoadFromIniFile;
    fra_prepspedov.GridRighepreparate.RefreshData;
    fra_prepspedov.lbl_cartoni.Caption := 'Colli ' + fra_prepspedov.QRighepreparate.FieldByName('qtasparata').AsString + '/' + fra_prepspedov.QRighepreparate.FieldByName('qtatot').AsString;
    if idcomrig > 0 then
    begin
      fra_prepspedov.QRighepreparate.Locate('idcomrig',idcomrig,[]);
      fra_prepspedov.GridRighepreparate.SelectedRows.CurrentRowSelected := True;
    end;
  end
  else
  begin
    fra_prepspedov.GridRighepreparate.SaveToIniFile;
    fra_prepspedov.QRighepreparate.Close;

  end;
end;

procedure TPI_Altag_BWS.newQtaUmiOnexit(sender: TObject);
var
  objartico : IArticoStd;
begin
  if not Assigned(objArtico) then
    GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);

  ObjArtico.Seek('ID', f2artico.KeyValue);

  edtqtaumv.AsFloat := edtqtaumi.AsFloat * objartico.ConvUM(ouI, orgumv);

  if umcomv <> 'KG' then
  begin
    edtqtaumm.AsFloat := edtqtaumi.AsFloat;
  end;

end;

procedure TPI_Altag_BWS.newQtaUmmOnexit(sender: TObject);
var
  objartico : IArticoStd;
begin
  if umcomv <> 'KG' then
  begin
    if not Assigned(objArtico) then
      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);

    ObjArtico.Seek('ID', f2artico.KeyValue);

    if umcomv <> 'KG' then
    begin
      edtqtaumv.AsFloat := edtqtaumm.AsFloat * objartico.ConvUM(orgumconv, orgumv);
      edtqtaumi.AsFloat := edtqtaumm.AsFloat;
    end;
  end;

end;

procedure TPI_Altag_BWS.newQtaUmvOnexit(sender: TObject);
var
  objartico : IArticoStd;
begin
  // --
  //exit;
  if not Assigned(objArtico) then
      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);

  ObjArtico.Seek('ID', f2artico.KeyValue);


  if not fl_inizializzazione and peso3103 and (ObjArtico.CampiObj['umrelvar2'] = -1) then
  begin

  end
  else
  begin

    if umv <> 'KG' then
    begin


      if umcomv <> 'KG' then
      begin
        edtqtaumm.AsFloat := edtqtaumv.AsFloat *  objartico.ConvUM(orgumv,orgumconv);
        edtqtaumi.AsFloat := edtqtaumv.AsFloat *  objartico.ConvUM(orgumv,orgumconv);
      end
      else
        edtqtaumi.AsFloat := edtqtaumv.AsFloat *  objartico.ConvUM(orgumv,ouI);
    end;
  end;
end;

procedure TPI_Altag_BWS.NEW_BWS_BtnInsPDTInvMagOnClick(Sender: TObject);
begin
  if Assigned(OLD_BWS_BtnInsPDTInvMagOnClick) then
    OLD_BWS_BtnInsPDTInvMagOnClick(Sender);

  f2artico.KeyValue := 0;
  f2artico.OnExit(f2artico);
  edtlotto.AsString := '';
  edtserie.AsString := '';
  if (FIdAllMag > 0) and (FF2AllMag.KeyValue = 0) then
  begin
    FF2AllMag.KeyValue := FIdAllMag;
  end;
end;

procedure TPI_Altag_BWS.NEW_BWS_BtnOkOnClick(Sender: TObject);
begin
  if (FF2AllMag.KeyValue > 0) and (F2Artico.KeyValue > 0)  then
  begin
    if MessaggioPDT('Attenzione, uscendo l''operazione corrente non verrà salvata. Uscire?', APPTITLE, MB_YESNO) = mrYes then
    begin
      if Assigned(OLD_BWS_BtnOkOnClick) then
        OLD_BWS_BtnOkOnClick(Sender);
    end
    else
    begin
      // Per ora non faccio nulla
    end;

  end
  else
    if Assigned(OLD_BWS_BtnOkOnClick) then
      OLD_BWS_BtnOkOnClick(Sender)



end;

procedure TPI_Altag_BWS.NEW_BWS_F2AllMagOnExit(Sender: TObject);
begin
  if Assigned(OLD_BWS_F2AllMagOnExit) then
    OLD_BWS_F2AllMagOnExit(Sender);

end;

procedure TPI_Altag_BWS.NEW_BWS_F2AllMagOnKeyChange(Sender: TObject; NewKey,
  OldKey: Integer);
begin
  if Assigned(OLD_BWS_F2AllMagOnKeyChange) then
    OLD_BWS_F2AllMagOnKeyChange(Sender, NewKey, OldKey);


  if FF2AllMag.KeyValue > 0 then
  begin
    FIdAllMag := FF2AllMag.KeyValue;
    BtnLeggiBarcode.Click;

    if edtqtaumi.CanFocus then
      edtqtaumi.SetFocus;

    FF2AllMag.OnExit(FF2AllMag);
  end;

end;

procedure TPI_Altag_BWS.NEW_BWS_TabNewRigaOnShow(Sender: TObject);
begin
  if Assigned(OLD_BWS_TabNewRigaOnShow) then
    OLD_BWS_TabNewRigaOnShow(Sender);

  if edtTestata.CanFocus then
    edtTestata.SetFocus;
end;

procedure TPI_Altag_BWS.NumSpedizioneKeydown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) or (key = VK_TAB) then
  begin
    fra_prepspedov.PgcCtrl.TabIndex := 1;
    NewPagecontrolChange(fra_prepspedov.PgcCtrl);
  end;
end;

procedure TPI_Altag_BWS.StartPI_CaricoOP;
begin
  if not GetFormComp('edtqtaumi',edtqtaumi) then
    exit;
  if not GetFormComp('edtqtaumm',edtqtaumm) then
    exit;
  if not GetFormComp('edtqtaumv',edtqtaumv) then
    exit;
  if not GetFormComp('btnins',btnins) then
    exit;

  oldbtninsclick := btnins.OnClick;
  btnins.OnClick := newBtnInsclick_carOP;
end;

procedure TPI_Altag_BWS.StartPI_Inventario;
begin


  if not getformcomp('f2artico',f2artico) then
    exit;

  if not getformcomp('edtlotto',edtlotto) then
    exit;

  if not getformcomp('edtserie',edtserie) then
    exit;

  if not getformcomp('edtqtaumi',edtqtaumi) then
    exit;

  if not getformcomp('edtqtaumm',edtqtaumm) then
    Exit;

  if not getformcomp('edtqtaumv',edtqtaumv) then
    Exit;

  if not GetFormComp('pnlinvmag',pnlinvmag) then
    exit;

  if not GetFormComp('F2AllMag',FF2AllMag) then
    exit;

  RedirEvent('F2AllMag', 'OnExit', 'OLD_BWS_F2AllMagOnExit', 'NEW_BWS_F2AllMagOnExit');
  RedirEvent('F2AllMag', 'OnKeyChange', 'OLD_BWS_F2AllMagOnKeyChange', 'NEW_BWS_F2AllMagOnKeyChange');
  RedirEvent('BtnInsPDTInvMag', 'OnClick', 'OLD_BWS_BtnInsPDTInvMagOnClick', 'NEW_BWS_BtnInsPDTInvMagOnClick');
  RedirEvent('BtnOk', 'OnClick', 'OLD_BWS_BtnOkOnClick', 'NEW_BWS_BtnOkOnClick');


  CreaButton;

  edtqtaumi.OnExit := nil;
  edtqtaumm.OnExit := nil;
  edtqtaumv.OnExit := nil;
end;


procedure TPI_Altag_BWS.StartPI_ModLot;
var
  LMedDatRif: TData;
begin
  if not getformcomp('MedDatRif',LMedDatRif) then
    exit;

  LMedDatRif.Text := scadenzaLotto;
end;

procedure TPI_Altag_BWS.StartPI_PrepSpedOV;
begin
  messaggioSpedizione := false;

  fra_prepspedov := nil;

  form.Caption := 'Prep. Sped. ' + GetVersion(DLLFileName);

  if not GetFormComp('edttestata',edttestata) then
    exit;

  if not GetFormComp('f2bamtes',f2bamtes) then
    exit;

  if not GetFormComp('f2lotser',FF2LotSer) then
    exit;

  if not GetFormComp('scbdata',scbdata) then
    exit;

  if not GetFormComp('edtbarcodeunico',edtbarcodeunico) then
    exit;

  if not GetFormComp('f2artico',f2artico) then
    exit;

  if not GetFormComp('edtlotto',edtlotto) then
    exit;

  if not GetFormComp('edtserie',edtserie) then
    exit;

  if not GetFormComp('edtqtaumm',edtqtaumm) then
    exit;

  if not GetFormComp('edtqtaumv',edtqtaumv) then
    exit;

  if not GetFormComp('edtqtaumi',edtqtaumi) then
    exit;

  if not GetFormComp('edtssccda',edtssccda) then
    exit;

  if not GetFormComp('f2allmag',f2allmag) then
    Exit;

  if not GetFormComp('btnendmission',btnendmission) then
    exit;

  if not GetFormComp('btnins',btnins) then
    exit;

  if not GetFormComp('lblssccda',lblssccda) then
    exit;

  if not GetFormComp('edtssccda',edtssccda) then
    exit;

  if not GetFormComp('lblsscc',lblsscc) then
    exit;

  if not GetFormComp('pnlDescrCli',FPnlDescrCli) then
    exit;

  if not GetFormComp('pnlDatiRiga',FPnlDatiRiga) then
    exit;

  if not GetFormComp('btnins',btnins) then
    Exit;

  if not GetFormComp('btnendmission',btnendmission) then
    Exit;

  if not GetFormComp('btnsaltariga',btnsaltariga) then
    Exit;

  if not GetFormComp('btnannulla',btnannulla) then
    Exit;

  if not GetFormComp('lblbamtes',lblbamtes) then
    exit;

  if not GetFormComp('lbllotto',lbllotto) then
    Exit;

  if not GetFormComp('pnltasti',pnltasti) then
    exit;

  if not GetFormComp('pnlstdbtn',pnlstdbtn) then
    exit;

  if not GetFormComp('pnlstdstatus',pnlstdstatus) then
    exit;

  if not GetFormComp('pnlstdgen',pnlstdgen) then
    exit;

  if not GetFormComp('pnlstato',pnlstato) then
    exit;

  if not GetFormComp('stbbarra',stbbarra) then
    exit;

  if not GetFormComp('lblartico',lblartico) then
    exit;

  if not GetFormComp('lblqtaumv',lblqtaumv) then
    Exit;

  if not GetFormComp('lblqtaumm',lblqtaumm) then
    Exit;

  if not GetFormComp('lblqtaumi',lblqtaumi) then
    Exit;

  if not GetFormComp('lblvano',lblvano) then
    Exit;

  OldformOnResize := Form.OnResize;
  Form.OnResize := NewFormOnResize;

  //ModificaPrepSpedOV;

  //Redirect eventi
  //oldf2bamteskeychange := f2bamtes.OnKeyChange;
  //f2bamtes.OnKeyChange := newf2bamteskeychange;

  oldbtninsclick := btnins.onclick;
  btnins.OnClick := newbtninsclick;

  oldbtnendmissionClick := btnendmission.OnClick;
  btnendmission.OnClick := NewBtnEndmissionClick;

  //sostituzione eventi
  oldEdtQtaumionExit := edtqtaumi.OnExit;
  edtqtaumi.OnExit := newQtaUmiOnexit;

  OldedtqtaummOnExit := edtqtaumm.OnExit;
  edtqtaumm.OnExit := newQtaUmmOnExit;

  oldedtQtaUmvOnexit := edtqtaumv.OnExit;
  edtqtaumv.OnExit := newQtaUmvOnExit;

  scbdata.SetFocus;

end;

procedure TPI_Altag_BWS.StartPI_ScaricoOP;
begin
  if not GetFormComp('btnins',btnins) then
    exit;
  if not GetFormComp('edtqtaumi',edtqtaumi) then
    exit;
  if not GetFormComp('edtqtaumm',edtqtaumm) then
    exit;
  if not GetFormComp('edtqtaumv',edtqtaumv) then
    exit;

  oldbtninsclick := btnins.OnClick;
  btnins.OnClick := newbtinsclick_ScarOP;

end;

procedure TPI_Altag_BWS.StartPI_SELTipodoc;
var
  LF2Vettore: TF2;
  LEdtColli, LedtNettoTes: TCSEdit;
  Lqry: TCSEQuery;
begin
  GetFormComp('rgtipodoc',rgtipodoc);
  GetFormComp('f2idtipidoc',f2idtipodoc);
  GetFormComp('btnok',btnok);
  GetFormComp('F2Vettore', LF2Vettore);
  GetFormComp('edtColli', LEdtColli);
  GetFormComp('edtNettoTes', LedtNettoTes);

  idtipodocB := 0;
  idtipodocF := 0;
  idtipodocR := 0;

  fl_resultok := False;

  try
    Lqry := TCSEQuery.Create(nil);
    Lqry.DataBaseName := Azienda.DatabaseName;
    Lqry.SQL.Text := 'SELECT IDVETTORE FROM COMTES WHERE ID = ' + CS_KeyValueTo_SqlStr(idComTes)  ;
    Lqry.Open;
    if not Lqry.Eof then
      LF2Vettore.KeyValue := Lqry.FieldByName('IDVETTORE').AsInteger;

    Lqry.Close;

    Lqry.SQL.Text:= 'SELECT sum(qta1) AS TOTCA , SUM( ' +
                    'CASE WHEN A.UMM = ''KG'' THEN PR.QTA2 ' +
                    'ELSE (PR.QTA3 * A.NETTO / 1000) END) AS PESONETTO ' +
                    'FROM PDTRIG PR ' +
                    'LEFT JOIN LOTSER L ON L.ID = PR.IDLOTSER ' +
                    'LEFT JOIN ARTICO A ON A.ID = L.IDARTICO ' +
                    'WHERE IDCOMRIG IN ' +
                    '(SELECT CR.ID FROM COMRIG CR ' +
                    'INNER JOIN COMTES CT ON CT.ID = CR.IDCOMTES ' +
                    'WHERE CT.ID = ' + CS_KeyValueTo_SqlStr(idComTes) + ')';
    Lqry.Open;
    if not Lqry.Eof then
    begin
      LedtColli.AsFloat := Lqry.FieldByName('TOTCA').AsFloat;
      LedtNettoTes.AsFloat := Lqry.FieldByName('PESONETTO').AsFloat;
    end;

  finally
    FreeAndNil(Lqry);
  end;


  oldbtnokclick := btnok.OnClick;
  btnok.OnClick := newbtnokClick;

  
end;

initialization
  CSW___BPL_Identity := 'PI_AltagMI_BWS';

  RegisterPlugIn('PI_AltagMI_BWS',TPI_Altag_BWS);

finalization

  UnregisterPlugIn('PI_Altag_BWS');
end.

