unit UFrmCaricaMag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,U_Altag_BWS, Vcl.StdCtrls, CSEdit,
  Vcl.Buttons, CSButtons, Vcl.ExtCtrls, Compf2, s3db, csetables, ucoresecure, ucoredb,
  Vcl.ComCtrls, UCoreTipi, Vcl.Grids, Vcl.DBGrids, SMDBGrid, Data.DB,
  OLEDBComponents,FFuncStd;

type
  TFrmCaricaMag = class(TFrmFuncStd)
    PageCtrl: TPageControl;
    tsNuovaRiga: TTabSheet;
    tsGriglia: TTabSheet;
    lbl_nr: TLabel;
    lbl_dt: TLabel;
    lbl_for: TLabel;
    lbl_barcode: TLabel;
    lblArt: TLabel;
    lbl_desforn: TLabel;
    lbl_lotto: TLabel;
    lbl_umf: TLabel;
    lbl_umm: TLabel;
    lbl_umi: TLabel;
    lblVano: TLabel;
    lblDDT: TLabel;
    lblDatalot: TLabel;
    Edtnumdoc: TCSEdit;
    edtDataDoc: TCSEdit;
    edt_barcode: TCSEdit;
    F2forn: TF2;
    F2Art: TF2;
    edtNumser: TCSEdit;
    edtqtaUmf: TCSEdit;
    edtQtaUMm: TCSEdit;
    edtQtaUMI: TCSEdit;
    edtForn: TCSEdit;
    f2Allmag: TF2;
    f2Tipodoc: TF2;
    edtNumlot: TCSEdit;
    edtDatLot: TCSEdit;
    GridRighepreparate: TSMDBGrid;
    QRighepreparate: TCSEQuery;
    DS_RighePreparate: TDataSource;
    lblNumser: TLabel;
    pnlCartoni: TPanel;
    btnDetail: TCSBitBtn;
    BtnAnnulla: TSpeedButton;
    BtnElabora: TBitBtn;
    BtnPreparaRiga: TBitBtn;
    BtnPulisci: TCSBitBtn;
    procedure edt_barcodeEnter(Sender: TObject);
    procedure BtnAnnullaClick(Sender: TObject);
    procedure F2fornKeyChange(Sender: TObject; NewKey, OldKey: Integer);
    procedure BtnElaboraClick(Sender: TObject);
    function OttieniIdBollaFornitore : integer;
    procedure BtnPreparaRigaClick(Sender: TObject);
    function validacontrolli : Boolean;
    procedure edtQtaUMmExit(Sender: TObject);
    procedure edtqtaUmfExit(Sender: TObject);
    procedure F2ArtExit(Sender: TObject);
    function VerificaEsistenzaLotto(idartico : Integer;numlot,numser : string;DataLotto : double) : Integer;
    procedure puliscicampi(cancella_ddt : Boolean = False);
    procedure BtnPulisciClick(Sender: TObject);
    function verificaEsistenzaDDTFornitore(idtipidoc : Integer; numdoc : string; datdoc : tdatetime; idfor : Integer) : Boolean;
    procedure edtFornExit(Sender: TObject);
    procedure LeggiIni;
    function getIdBolla : integer;
    procedure edtQtaUMIExit(Sender: TObject);
    procedure PageCtrlChange(Sender: TObject);
    procedure CSBitBtn1Click(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
     iBWS_barcode : TBWS_barcode128;
     UMFOR,
     UMI,
     UMM : string;
     UMCO : double;
  public
    { Public declarations }
  end;

type
  ini = record
    idcaumov: Integer;
    idvano: integer;
  end;

var
  FrmCaricaMag: TFrmCaricaMag;
  //idbollafornitore : Integer;
  Hw_module : hmodule;
  fIni : ini;
  fl_inizializzazione : Boolean;

implementation

uses
  IBase, System.IniFiles, imagazzino, iacquisti, ifornitori, s3registry,
  System.DateUtils, uvarie, updtproc, uvaristd, UtilsArticoli, ipdt,
  UPDTMsgBox, UCoreInterface, RSQL, UFrmDetailCarico;

{$R *.dfm}

procedure TFrmCaricaMag.BtnPulisciClick(Sender: TObject);
begin
  PulisciCampi;
end;

procedure TFrmCaricaMag.CSBitBtn1Click(Sender: TObject);
var
  PDTRigAcq: IObjStd;
  Lid: integer;
  Lqry : TCSEQuery;
  LMsg: string;
begin
  if QRighePreparate.RecordCount > 0 then
  begin
    if MessaggioPDT('Eliminare i movimenti relativi alla riga selezionata?', APPTITLE, MB_YESNO) = mrYes then
    begin
      if not GetInterfOggetto('ObjPDTRigAcq', 'PDTRigAcq', IObjStd, PDTRigAcq) then begin
        LMsg := 'Si è verificato un errore durante l''inizializzazione del Modulo BWS ' +
               'per l''interfaccia Preparazione Spedizioni.';
        MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
        Exit;
      end;
      Lid := QRighepreparate.FieldByName('IDLOTSER').AsInteger;
      try
        Lqry := TCSEQuery.Create(nil);
        Lqry.DataBaseName := DBExec.DatabaseName;
        Lqry.SQL.Text := 'SELECT ID FROM PDTRIGACQ WHERE IDLOTSER= ' + CS_KeyValueTo_SqlStr(Lid);
        Lqry.Open;
        while not Lqry.Eof do
        begin
          PDTRigAcq.Seek('ID', Lqry.FieldByName('ID').AsInteger);
          if PDTRigAcq.Found then
          begin
            PDTRigAcq.Elimina(Lqry.FieldByName('ID').AsInteger);
          end;

          Lqry.Next;
        end;
        GridRighepreparate.RefreshData;
      finally
        FreeAndNil(Lqry);
      end;


    end;

  end;

end;

procedure TFrmCaricaMag.BtnAnnullaClick(Sender: TObject);
begin
  if MessaggioPDT('Vuoi abbandonare la procedura?',APPTITLE, MB_YESNO) = mrYes then
    Close;
end;

procedure TFrmCaricaMag.btnDetailClick(Sender: TObject);
var
  frmDett : TFrmDetailCarico;
begin
  frmDett := tfrmdetailcarico.create(Self);
  frmdett.Height := self.Height;
  frmdett.Width := self.Width;
  with frmDett.qr_dettaglio do
  begin
    Prepare;
    ParamByName('codice').Asstring     := QRighepreparate.FieldByName('codart').AsString;
    ParamByName('idfor').AsInteger     := QRighepreparate.FieldByName('ext_idfor').AsInteger;
    ParamByName('idtipidoc').AsInteger := QRighepreparate.FieldByName('ext_idtipidoc').AsInteger;
    ParamByName('datadoc').AsFloat     := QRighepreparate.FieldByName('ext_datdoc').AsFloat;
    ParamByName('numdoc').AsString     := QRighepreparate.FieldByName('ext_numdoc').AsString;
    Open;
  end;
  frmDett.showmodal;
  frmDett.Free;
  GridRighepreparate.RefreshData;
end;

procedure TFrmCaricaMag.BtnElaboraClick(Sender: TObject);

  function getLottoStd(idlotto : Integer) : Integer;
  var
    qr : TCSEQuery;
    idartico : integer;
  begin
    qr := TCSEQuery.Create(nil);
    qr.DataBaseName := DBExec.DatabaseName;
    qr.SQL.Text := 'select idartico from lotser where id = ' + IntToStr(idlotto);
    qr.Open;
    idartico := qr.FieldByName('idartico').AsInteger;
    qr.Close;
    qr.SQL.Text := 'select id from lotser where idartico = ' + IntToStr(idartico) + ' and numlot = ''00000000000'' and numser = ''0000000000000''';
    qr.Open;
    result := qr.FieldByName('id').AsInteger;
    qr.Close;
    qr.Free;
  end;

var
  QryTmp,
  qrDelPdtrig,
  Lqr: TCSEQuery;

  LStruFotoRigheAcq: TStruFotoRigheACQ;

  TSRigAcq: TStringList;

  TD1: TRecInfoDocAcqTesGen;
  //FrmCarOARig: TFrmCarOARig;
  MsgErr,
  TabAcqRtoFatR,
  app: string;

  LDatRic: Double;

  LFatRigAcq : IBfRigACQStd;
  objoacrig : IForRig;
  objartico : IArticoStd;
  //objoactes : IForTes;

  objlottibfacq : ILottiBFACQStd;

  FobjLotSer : ILotSerStd;

  LProgRighe,
  idbollafornitore,
  LidFatrigAcq,
  idlottoGenerato : Integer;

  ObjBamTesacq : IBamTesACQStd;
  ForServ: IStFor;

  QtaOrd, QtaOrdM, QtaOrdI: Double;

  StrP: StruPrezzoACQ;

  res : string;
begin

  if edtqtaUmf.AsFloat > 0 then
  begin
    MessaggioPDT('Attenzione riga non preparata.', APPTITLE, MB_OK);
    abort;
  end;

  if MessaggioPDT('Si desidera effettuare il ricevimento?',APPTITLE,MB_YESNO) = mrNo then
    exit;



  ForServ := forservice as IStFor;

  idbollafornitore := 0;

  TD1.TipDoc := 'B';

  TD1.IdTipiDoc := f2Tipodoc.KeyValue;

  TD1.NumDoc := Edtnumdoc.AsString;

  TD1.DatDoc := edtDataDoc.AsDateTime;

  TD1.IdVettore := 0;

  TD1.IdAspBeni := 0;

  TD1.NumCopie := 0;

  TD1.NumCopieEti := 0;

  TD1.Esito := true;

  LDatRic := trunc(Now());

  begin
    TSRigAcq := TStringList.Create;

    QryTmp := TCSEQuery.Create(nil);
    QryTmp.DataBaseName := Azienda.DataBaseName;
    try
      try

        QryTmp.SQL.Text := 'SELECT pd.Id,pd.idoacrig ' +
                           'FROM PDTRigAcq pd ' +
                           'INNER JOIN OAcRig rg ON pd.IdOAcRig=rg.Id ' +
                           'WHERE ext_idfor = :idfor ' +
                           '  and ext_idtipidoc = :idtipidoc ' +
                           '  and ext_numdoc = :numdoc ' +
                           '  and ext_datdoc = :datdoc ' +
                           '  and pd.IdFatRigAcq IS NULL ';

        QryTmp.ParamByName('idfor').AsInteger := F2forn.KeyValue;
        QryTmp.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
        QryTmp.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
        QryTmp.ParamByName('datdoc').Asdatetime := edtDataDoc.Asdatetime;

        QryTmp.Open;
        while not QryTmp.Eof do
        begin
          TSRigAcq.Add(IntToStr(QryTmp.FieldByName('Id').AsInteger));
          QryTmp.Next;
        end;
        //QryTmp.Close;

       // if TSRigAcq.Count <= 0 then
       //   exit;//raise Exception.Create(RS_PDT_FIngrOAFor_008);

        if (TSRigAcq.Count > 0) and (RiempiTabAcqRToFatR(TSRigAcq, TabAcqRtoFatR)) then
        begin

          // All'interno della transazione però non vengono cancellate le righe da PDTRigAcq
          MsgErr := EvadiDocumentiAcquisto(TabAcqRtoFatR, TSRigAcq, TD1, LDatRic);
          if Trim(MsgErr) <> '' then
            raise Exception.Create('Si è verificato il seguente errore : ' + CRLF + MsgErr);

          idbollafornitore := getidbolla;

          // evasione forzata righe oa
          if (not GetInterfOggetto('objForRig', 'OACRIG', IForRig, ObjOAcRig)) then
          begin
            Application.MessageBox(PChar('Interfaccia righe O.A. non istanziata correttamente.'),
                                 PChar(APPTITLE),
                                 MB_ICONERROR + MB_OK);
            exit;
          end;

          QryTmp.First;
          while not QryTmp.Eof do
          begin
            objoacrig.Found := False;
            objoacrig.Seek('ID',qrytmp.FieldByName('idoacrig').AsInteger);
            if objoacrig.Found then
            begin
              objoacrig.CampiObj['FOREVA'] := -1;
              objoacrig.Modifica;
            end;
            QryTmp.Next;
          end;
          // fine evasione forzata

          MsgErr := DeletePDTRigAcq(TSRigAcq);
          if (Trim(MsgErr) <> '') then
          begin
            raise Exception.Create('Si è verificato il seguente errore : ' + CRLF + MsgErr);
          end;
        end;

        // verifico se ci sono degli orfani e li aggiungo al ddt
        QryTmp.Close;
        QryTmp.SQL.Clear;
        QryTmp.SQL.Text := 'select * from pdtrigacq ' +
                           ' where ext_idfor = :idfor ' +
                           '   and ext_idtipidoc = :idtipidoc ' +
                           '   and ext_numdoc = :numdoc ' +
                           '   and ext_datdoc = :datdoc ' +
                           '   and isnull(IdOAcRig,0) = 0';

        QryTmp.ParamByName('idfor').AsInteger := F2forn.KeyValue;
        QryTmp.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
        QryTmp.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
        QryTmp.ParamByName('datdoc').Asdatetime := edtDataDoc.Asdatetime;

        QryTmp.Open;

        if not QryTmp.IsEmpty then
        begin
          // se l'id è zero, il ddt non è stato creato e gli orfani non possono essere agganciati ad un ddt fornitore esistente.
          // devo quindi creare il ddt

          if idbollafornitore = 0 then
            idbollafornitore := OttieniIdBollaFornitore;

          if not GetInterfOggetto('ObjBamTesacq', 'BamTesacq', IBamTesacqStd, ObjBamTesacq) then
          begin
            raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
          end;
          ObjBamTesacq.Seek('id',idbollafornitore);

          qrDelPdtrig := TCSEQuery.Create(nil);
          qrDelPdtrig.DataBaseName := dbexec.DatabaseName;

          if not GetInterfOggetto('ObjBfRigAcq', 'FATRIGACQ', IBfrigacqstd , LFatRigAcq) then
          begin
            raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
          end;

          if not GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, objartico)   then
          begin
            raise Exception.Create('Errore durante l''inizializzazione del modulo articoli');
          end;

          Lqr := DBExec.OpenSql('select max(rigabam) as cont from fatrigacq where idbam='+inttostr(idbollafornitore));

          LProgRighe := lqr.FieldByName('cont').AsInteger;

          while not QryTmp.Eof do
          begin

            LProgRighe := LProgRighe +1;
            LFatRigAcq.CampiObj['IDBAM']  := idbollafornitore;

            LFatRigAcq.CampiObj['RIGABAM']:= LProgRighe;

            //LFatRigAcq.CampiObj['IDARTICO'] := QryTmp.FieldByName('idlotser').AsInteger;
            // cm : ci devo mettere l'id del lotto standard perchè non si capisce una madonna di come ragiona sam.
            LFatRigAcq.CampiObj['IDARTICO'] := getLottoStd(QryTmp.FieldByName('idlotser').AsInteger);

            LFatRigAcq.CampiObj['idanamag'] := f2allmag.keyvalue;

            lqr := DBExec.openSql('select idartico from lotser where id = ' + IntToStr(QryTmp.FieldByName('idlotser').AsInteger));

            objartico.Seek('ID',lqr.FieldByName('idartico').AsInteger);

            LFatRigAcq.CampiObj['DESCR']:= objartico.CampiObj['DESCR'];

            ForServ := forservice as IStFor;
            LStruFotoRigheAcq := ForServ.GetUMFORStd(objartico.CampiObj['ID'], 0, 1,
                                                       QtaOrd, QtaOrdM, QtaOrdI);


            LFatRigAcq.CampiObj['IDUMF']   := LStruFotoRigheAcq.IdUMF;
            LFatRigAcq.CampiObj['UMFCO']   := LStruFotoRigheAcq.UMFCO;
            LFatRigAcq.CampiObj['UMACO']   := LStruFotoRigheAcq.UMACO;
            LFatRigAcq.CampiObj['UMFRIF1'] := LStruFotoRigheAcq.UMFRIF1;
            LFatRigAcq.CampiObj['UMFRIF2'] := LStruFotoRigheAcq.UMFRIF2;
            LFatRigAcq.CampiObj['UMPRACQ'] := LStruFotoRigheAcq.UMPRACQ;
            LFatRigAcq.CampiObj['DAQUOT']  := LStruFotoRigheAcq.daQuot;
            LFatRigAcq.CampiObj['UMF']     := LStruFotoRigheAcq.UMF;
            LFatRigAcq.CampiObj['UMRelVar']:= LStruFotoRigheAcq.UMRelVar;
            LFatRigAcq.CampiObj['COAFOR']  := LStruFotoRigheAcq.COAFOR;
            LFatRigAcq.CampiObj['DAQUOT']   := 0;
            LFatRigAcq.CampiObj['OMASCM']   := 'N';
            LFatRigAcq.CampiObj['TICASC']   := 'A';
            LFatRigAcq.CampiObj['IDCAUMOV'] := fIni.idcaumov;
            LFatRigAcq.CampiObj['IDIVA'] := objartico.CampiObj['IDIVA'];
            LFatRigAcq.CampiObj['IdValuta']:= DBExec.RValutaSI.IdEuro;
            LFatRigAcq.CampiObj['Cambio']:= 1;

            app := IFornitori.CercaPrezzo(dbexec.DataBaseName,
                                       objartico.CampiObj['id'],
                                       QryTmp.FieldByName('ext_idfor').AsInteger,
                                       0,
                                       Trunc(Now),
                                       0,
                                       StrP,
                                       True, // mettendo True restituisce il prezzo nella valuta del S.I.
                                       False);

            LFatRigAcq.CampiObj['PREZZO']  := strp.Prezzo;

            LFatRigAcq.CampiObj['Sconto1'] := StrP.Sconto1;

            LFatRigAcq.CampiObj['Sconto2'] := StrP.Sconto2;

            LFatRigAcq.CampiObj['Sconto3'] := StrP.Sconto3;

            LFatRigAcq.CampiObj['Sconto4'] := StrP.Sconto4;

            LFatRigAcq.CampiObj['ScontoL'] := StrP.ScontoL;

            LFatRigAcq.CampiObj['IDUMF']   := strp.IdUMF;

            LFatRigAcq.CampiObj['UMFCO']   := StrP.UMCO;

            LFatRigAcq.CampiObj['UMFRIF1'] := strp.UMFRIF1;

            LFatRigAcq.CampiObj['UMFRIF2'] := strp.UMFRIF2;

            LFatRigAcq.CampiObj['UMPRACQ'] := strp.UMPRACQ;

            LFatRigAcq.CampiObj['UMARIF1'] := objartico.campiobj['UMREL1'];

            LFatRigAcq.CampiObj['UMARIF2'] := objartico.CampiObj['UMREL2'];

            LFatRigAcq.CampiObj['UMF']     := strp.UMF;

            LFatRigAcq.CampiObj['UMRelVar']:= strp.UMRelVar;

            LFatRigAcq.CampiObj['COAFOR']  := strp.COAFOR;

            LFatRigAcq.CampiObj['IDLISRIGACQ'] := StrP.IdLisRigACQ;



            if StrP.IdLisRigACQ > 0 then
            begin
              LFatRigAcq.CampiObj['DAQUOT']   := -1;
              //LFatRigAcq.CampiObj['IdValuta']:= StrP.IdValutaLis;
            end;
            LFatRigAcq.CampiObj['QTAORD']  := QryTmp.FieldByName('QtaOrd').AsFloat;

            LFatRigAcq.CampiObj['QTAORDI'] := QryTmp.FieldByName('QtaOrdI').AsFloat;

            LFatRigAcq.CampiObj['QTAORDM'] := QryTmp.FieldByName('QtaOrdM').AsFloat;

            LFatRigAcq.Ricalcola(DBExec.RValutaSI.DecMaxEuro , DBExec.RValutaSI.DecContEuro);
            LIdFatRigAcq := LFatRigAcq.Insert;

            if LIdFatRigAcq<1 then
            begin
              raise Exception.Create('Errore creazione riga ddt fornitore!');
            end
            else
            begin
              ObjBamTesacq.RicalcolaTotali(false, false, false);
              ObjBamTesacq.Modifica;
              if not (GetInterfOggetto('ObjLottiBfAcq', 'LOTTIBFACQ', ILottiBFACQStd, objlottibfacq)) then
              begin

                raise Exception.Create('Errore durante l''inizializzazione del modulo lotti acquisto');
              end;
              // una volta generato da standard il nuovo lotto (non si sa per quale cazzo di motivo),
              //vado a sostituire su lottibf quello che effettivamente mi serve e cancello quello
              //generato automaticamente
              objlottibfacq.Found := false;
              objlottibfacq.Seek('IDFATRIGACQ',LidFatrigAcq);
              if objlottibfacq.Found then
              begin
                idLottoGenerato := objlottibfacq.CampiObj['idlotser'];
                objlottibfacq.CampiObj['idlotser'] := QryTmp.FieldByName('idlotser').AsInteger;
                objlottibfacq.Modifica;
                GetInterfOggetto('ObjLotSer', 'LotSer', ILotSerStd, FobjLotSer);
                FobjLotSer.Seek('id',idlottoGenerato);
                FobjLotSer.EliminaNoTrans(idlottogenerato);
              end;
            end;
            qrDelPdtrig.Close;
            qrDelPdtrig.SQL.Text := 'delete from pdtrigacq where id = :id';
            qrDelPdtrig.ParamByName('id').AsInteger := QryTmp.FieldByName('id').AsInteger;
            qrDelPdtrig.ExecSQL;
            qrDelPdtrig.Close;
            QryTmp.Next;
          end;


          FreeAndNil(qrDelPdtrig);
        end;
        QryTmp.Close;
        if not assigned(ObjBamTesacq) then
        begin
          if not GetInterfOggetto('ObjBamTesacq', 'BamTesacq', IBamTesacqStd, ObjBamTesacq) then
          begin
            raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
          end;
        end;
        ObjBamTesacq.Seek('id',idbollafornitore);
        if ObjBamTesacq.Found then
        begin

          res := ObjBamTesacq.ImpostaStato('D');
          if res = '' then
          begin
            ObjBamTesacq.CampiObj['STATO'] := 'D';
            ObjBamTesacq.Modifica;
          end
          else
          begin
            MessaggioPDT('Errore nel passaggio del documento in definitivo : ' + #10+#13+res,APPTITLE,mb_ok);
          end;


        end;
        MessaggioPDT('Operazione completata!',APPTITLE,MB_OK);
      except
        on E: Exception do
          MessaggioPDT(e.Message,APPTITLE,MB_ok);
      end;
    finally
      if Assigned(QryTmp) then
      begin
        QryTmp.Close;
        FreeAndNil(QryTmp);
      end;

      if Assigned(TSRigAcq) then
        FreeAndNil(TSRigAcq);
    end;

    puliscicampi(True);
  end;


end;

procedure TFrmCaricaMag.BtnPreparaRigaClick(Sender: TObject);
  function getIdUM(cod : string) : Integer;
  var
    Lqrd : TCSEQuery;
  begin
    result := 0;
    Lqrd := TCSEQuery.Create(nil);
    Lqrd.DataBaseName := dbexec.DatabaseName;
    Lqrd.SQL.Text := 'select id from umart where codice = :cod';
    Lqrd.ParamByName('cod').AsString := cod;
    Lqrd.Open;
    if not Lqrd.IsEmpty then
      result := Lqrd.FieldByName('id').AsInteger;
    Lqrd.Close;
    FreeAndNil(Lqrd);
  end;
var
  idlotser,
  idpdtrigacq : integer;
  qtares : Double;
  Sqr,
  qr_ins : TCSEQuery;
  flOrfano,
  fluscita : Boolean;
  qta,
  kg : Double;
  objartico : IArticoStd;
  PDTRigAcq: IObjStd;
  Lmsg : string;
begin
  if FL_inizializzazione then
    Exit;

  edtqtaUmfExit(sender);

  flOrfano := False;
  fluscita := false;
  if validacontrolli then
  begin
    if not GetInterfOggetto('ObjPDTRigAcq', 'PDTRigAcq', IObjStd, PDTRigAcq) then
    begin
      LMsg := 'Si è verificato un errore durante l''inizializzazione del Modulo BWS ' +
              'per l''interfaccia Preparazione Spedizioni.';
      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
      Exit;
    end;

    Sqr := tcsequery.Create(nil);
    Sqr.DataBaseName := dbexec.DatabaseName;

    qr_ins := TCSEQuery.Create(nil);
    qr_ins.DataBaseName := DBExec.DatabaseName;

    Sqr.SQL.Text := 'select ' +
                    ' r.id as idoacrig,' +
                    ' r.umf, ' +
                    //' r.umfco, ' +
                    ' case when isnull(r.umfco,0) = 0 then r.umaco else r.umfco end as umfco, ' +
                    ' r.idumf, ' +
                    ' r.idanamag as idvano,' +
                    '       ls.idartico,' +
                    '     r.qtares - (select isnull(sum(isnull(ra.qtaord,0)),0)' +
                    '                   from PDTRIGACQ ra ' +
                    '          where ra.IDOACRIG = r.id) as qtaResTot ' +
                    '  from oactes t ' +
                    '  join oacrig r ' +
                    '    on r.idoactes = t.id ' +
                    '  join lotser ls on ls.id = r.idartico ' +
                    ' where  t.idfor = :idfor ' +
                    '   and ls.idartico = :idartico ' +
                    '   and starig = ''O''' +
                    '   and (r.qtares - (select isnull(sum(isnull(ra.qtaord,0)),0)' +
                    '                   from PDTRIGACQ ra ' +
                    '          where ra.IDOACRIG = r.id)) > 0' +
                    ' order by r.DATCOR';

    Sqr.ParamByName('idfor').AsInteger := F2forn.KeyValue;
    Sqr.ParamByName('idartico').AsInteger := F2Art.KeyValue;
    Sqr.Open;
    if Sqr.IsEmpty then
    begin
      if messaggiopdt('ARTICOLO NON IN ORDINE.'+CRLF+'CONTINUARE?',APPTITLE,mb_yesno) = mrNo then
      begin
        fluscita := true;
        puliscicampi;
      end
      else
        florfano := True;
    end;
    if fluscita then
      Exit;


    idlotser := VerificaEsistenzaLotto(F2Art.KeyValue,edtNumlot.AsString,edtNumser.AsString,edtDatLot.AsFloat);


    if flOrfano then
    begin
       PDTRigAcq.Found := false;
       PDTRigAcq.CampiObj['idlotser'] := idlotser;
       PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
       PDTRigAcq.CampiObj['qtaord']   := edtqtaUmf.AsFloat;
       PDTRigAcq.CampiObj['qtaordm']  := edtqtaUmm.AsFloat;
       PDTRigAcq.CampiObj['qtaordi']  := edtQtaUMI.AsFloat;
       PDTRigAcq.CampiObj['idumf']    := getIdUM(UMFOR);
       PDTRigAcq.CampiObj['idumm']    := getIdUM(UMM);
       PDTRigAcq.CampiObj['idumi']    := getIdUM(UMI);

       idpdtrigacq := PDTRigAcq.Insert;
       if idpdtrigacq > 0 then
       begin
         qr_ins.Close;
         qr_ins.SQL.Text := 'update pdtrigacq ' +
                            '   set ext_idtipidoc = :idtipidoc, '+
                            '       ext_numdoc = :numdoc, '+
                            '       ext_datdoc = :datdoc, '+
                            '       ext_idfor = :idfor ' +
                            ' where id = :idpdtrigacq';


         qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
         qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
         qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
         qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
         qr_ins.ParamByName('idpdtrigacq').AsInteger := idpdtrigacq;
         qr_ins.ExecSQL;
       end;

    end
    else
    begin

      qtares := edtqtaUmf.AsFloat;
      if iBWS_barcode.peso3103 then
        kg := edtQtaUMm.AsFloat / qtares  // i kg possono stare solo in movimentazione
      else
        kg := 0;

      while not Sqr.Eof do
      begin
        if qtares = 0 then
          Break;

        if qtares <= Sqr.FieldByName('qtaResTot').AsFloat then // * sqr.fieldbyname('umfco').asfloat then
        begin
          qta := qtares;
          qtares := 0;
        end
        else
        begin
          qta := Sqr.FieldByName('qtaResTot').AsFloat; //(Sqr.FieldByName('qtaResTot').AsFloat * sqr.fieldbyname('umfco').asfloat);
          qtares := qtares-qta;  // qtares-(Sqr.FieldByName('qtaResTot').AsFloat * sqr.fieldbyname('umfco').asfloat);
        end;


        PDTRigAcq.Found := false;
        PDTRigAcq.CampiObj['idlotser'] := idlotser;
        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
        PDTRigAcq.CampiObj['qtaord']   := qta;

        if UMFOR = UMM then
        begin
          PDTRigAcq.CampiObj['qtaordm'] := qta
        end
        else
        begin
          if iBWS_barcode.peso3103 then
            PDTRigAcq.CampiObj['qtaordm'] := kg * qta
          else
            PDTRigAcq.CampiObj['qtaordm'] := qta / UMCO;
        end;

        if iBWS_barcode.peso3103 then
          PDTRigAcq.CampiObj['qtaordi'] := qta * UMCO
        else
        begin
          if not Assigned(objArtico) then
            GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
          ObjArtico.Seek('ID', F2Art.KeyValue);
          PDTRigAcq.CampiObj['qtaordi'] := PDTRigAcq.CampiObj['qtaordm'] * ObjArtico.ConvUm(oum, ouI);
        end;

        PDTRigAcq.CampiObj['idoacrig'] := sqr.FieldByName('idoacrig').AsInteger;
        PDTRigAcq.CampiObj['idlotser'] := idlotser;
        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
        //PDTRigAcq.CampiObj['idumf']    := sqr.fieldbyname('idumf').asinteger;
        PDTRigAcq.CampiObj['idumf']    := getIdUM(UMFOR);
        PDTRigAcq.CampiObj['idumm']    := getIdUM(UMM);
        PDTRigAcq.CampiObj['idumi']    := getIdUM(UMI);

        idpdtrigacq := PDTRigAcq.Insert;

        if idpdtrigacq > 0 then
        begin
          qr_ins.Close;
          qr_ins.SQL.Text := 'update pdtrigacq ' +
                             '   set ext_idtipidoc = :idtipidoc, '+
                             '       ext_numdoc = :numdoc, '+
                             '       ext_datdoc = :datdoc, '+
                             '       ext_idfor = :idfor ' +
                             ' where id = :idpdtrigacq';


          qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
          qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
          qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
          qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
          qr_ins.ParamByName('idpdtrigacq').AsInteger := idpdtrigacq;
          qr_ins.ExecSQL;
        end;
        Sqr.Next;

      end;

      if qtares > 0 then
      begin

        PDTRigAcq.Found := false;
        PDTRigAcq.CampiObj['idlotser'] := idlotser;
        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
        PDTRigAcq.CampiObj['qtaord']   := qtares;

        if UMFOR = UMM then
        begin
          PDTRigAcq.CampiObj['qtaordm'] := qtares
        end
        else
        begin
          if iBWS_barcode.peso3103 then
            PDTRigAcq.CampiObj['qtaordm'] := kg * qtares
          else
            PDTRigAcq.CampiObj['qtaordm'] := qtares / UMCO;
        end;

        if iBWS_barcode.peso3103 then
          PDTRigAcq.CampiObj['qtaordi'] := qtares * UMCO
        else
        begin
          if not Assigned(objArtico) then
            GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
          ObjArtico.Seek('ID', F2Art.KeyValue);
          PDTRigAcq.CampiObj['qtaordi'] := PDTRigAcq.CampiObj['qtaordm'] * ObjArtico.ConvUm(oum, ouI);
        end;

        PDTRigAcq.CampiObj['idoacrig'] := sqr.FieldByName('idoacrig').AsInteger;
        PDTRigAcq.CampiObj['idlotser'] := idlotser;
        PDTRigAcq.CampiObj['idallmag'] := F2allMag.KeyValue;
        //PDTRigAcq.CampiObj['idumf']    := sqr.fieldbyname('idumf').asinteger;
        PDTRigAcq.CampiObj['idumf']    := getIdUM(UMFOR);
        PDTRigAcq.CampiObj['idumm']    := getIdUM(UMM);
        PDTRigAcq.CampiObj['idumi']    := getIdUM(UMI);
        idpdtrigacq := PDTRigAcq.Insert;

        if idpdtrigacq > 0 then
        begin
          qr_ins.Close;
          qr_ins.SQL.Text := 'update pdtrigacq ' +
                             '   set ext_idtipidoc = :idtipidoc, '+
                             '       ext_numdoc = :numdoc, '+
                             '       ext_datdoc = :datdoc, '+
                             '       ext_idfor = :idfor ' +
                             ' where id = :idpdtrigacq';


          qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
          qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
          qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
          qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
          qr_ins.ParamByName('idpdtrigacq').AsInteger := idpdtrigacq;
          qr_ins.ExecSQL;
        end;

        {
        qr_ins.Close;
        qr_ins.SQL.Text := 'insert into pdtrigacq (idoacrig,idlotser,idallmag,idbam,qtaord,qtaordm,qtaordi,ext_idtipidoc,ext_numdoc,ext_datdoc,ext_idfor,idumf) ' +
                           'values (:idoacrig,:idlotser,:idallmag,:idbam,:qtaord,:qtaordm,:qtaordi,:idtipidoc,:numdoc,:datdoc,:idfor,:idumf)';

        qr_ins.ParamByName('idlotser').AsInteger := sqr.FieldByName('idoacrig').AsInteger;
        qr_ins.ParamByName('idlotser').AsInteger := idlotser;
        qr_ins.ParamByName('idallmag').AsInteger := F2allMag.KeyValue; //Sqr.FieldByName('idvano').AsInteger;

        qr_ins.ParamByName('qtaord').AsFloat  := qtares; // /sqr.fieldbyname('umfco').asfloat;

        if UMFOR = UMM then
        begin
          qr_ins.ParamByName('qtaordm').AsFloat := qtares
        end
        else
        begin
          if iBWS_barcode.peso3103 then
            qr_ins.ParamByName('qtaordm').AsFloat := kg * qtares
          else
            qr_ins.ParamByName('qtaordm').AsFloat := qtares / UMCO;
        end;

        if iBWS_barcode.peso3103 then
          qr_ins.ParamByName('qtaordi').AsFloat := qtares * UMCO
        else
        begin
          if not Assigned(objArtico) then
            GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
          ObjArtico.Seek('ID', F2Art.KeyValue);
          qr_ins.ParamByName('qtaordi').AsFloat := qr_ins.ParamByName('qtaordm').AsFloat * ObjArtico.ConvUm(oum, ouI);
        end;

        qr_ins.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
        qr_ins.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
        qr_ins.ParamByName('datdoc').AsDateTime := edtDataDoc.asdatetime;
        qr_ins.ParamByName('idfor').AsInteger := F2forn.KeyValue;
        qr_ins.ParamByName('idumf').AsInteger := sqr.fieldbyname('idumf').asinteger;
        qr_ins.ExecSQL;

        }
      end;
    end;

    Sqr.Close;
    Sqr.Free;

    qr_ins.Close;
    qr_ins.Free;

    PulisciCampi;
  end;
end;

procedure TFrmCaricaMag.edtFornExit(Sender: TObject);
begin
  F2forn.KeyValue := edtForn.AsInteger;

end;

procedure TFrmCaricaMag.edtQtaUMIExit(Sender: TObject);
var
  objartico : IArticoStd;
begin
  if (lbl_umi.Caption <> 'KG') then
  begin
    if not Assigned(objArtico) then
      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);

    ObjArtico.Seek('ID', F2Art.KeyValue);
    if (lbl_umm.Caption <> 'KG') and (lbl_umm.Caption <> '')  then
    begin
      edtqtaumm.AsFloat := edtqtaumi.AsFloat *  objartico.ConvUM(oui,oum);
      if UMFOR = UMM then
        edtqtaUmf.AsFloat := edtqtaumm.AsFloat
      else
        edtqtaUmf.AsFloat := edtqtaumm.AsFloat * UMCO;
    end
    else
    begin
      if UMCO = 0 then
        edtqtaUmf.AsFloat := edtqtaumi.AsFloat
      else
        edtqtaUmf.AsFloat := edtqtaumi.AsFloat / UMCO;
    end;
  end;
end;

procedure TFrmCaricaMag.edtqtaUmfExit(Sender: TObject);
var
  objartico : iarticostd;
begin
  if lbl_umf.Caption <> 'KG' then
  begin
    if not Assigned(objArtico) then
      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
    ObjArtico.Seek('ID', F2Art.KeyValue);
    if lbl_umm.Caption <> 'KG' then
    begin
      if UMM <> '' then
      begin
        if UMFOR = UMM then
          edtqtaUmm.AsFloat := edtqtaumf.AsFloat
        else
          edtqtaUmm.AsFloat := edtqtaumf.AsFloat / UMCO;
        edtqtaumi.AsFloat := edtqtaumm.AsFloat *  objartico.ConvUM(oum,oui);
      end
      else
      begin
        if UMCO > 0 then
          edtqtaumi.AsFloat := edtqtaumf.AsFloat / UMCO
        else
          edtqtaumi.AsFloat := edtqtaumf.AsFloat;

      end;
    end
    else
    begin
      edtqtaUmi.AsFloat := edtqtaumf.AsFloat * UMCO;
    end;
  end;
end;

procedure TFrmCaricaMag.edtQtaUMmExit(Sender: TObject);
var
  objartico : iarticostd;
begin
  if (lbl_umm.Caption <> 'KG') and (lbl_umm.Caption <> '') then
  begin
    if not Assigned(objArtico) then
      GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);

    ObjArtico.Seek('ID', F2Art.KeyValue);
    edtqtaumi.AsFloat := edtqtaumm.AsFloat *  objartico.ConvUM(oum,ouI);
    if UMFOR = UMM then
      edtqtaUmf.AsFloat := edtqtaumm.AsFloat
    else
      edtqtaUmf.AsFloat := edtqtaumm.AsFloat * UMCO;

  end;
end;

procedure TFrmCaricaMag.edt_barcodeEnter(Sender: TObject);
var
  idart : integer;
  objartico : IArticoStd;

begin

  if F2forn.KeyValue = 0 then
  begin
    MessaggioPDT('Fornitore non inserito!',APPTITLE,MB_ok);
    f2forn.SetFocus;
    abort;
  end;

  if edt_barcode.asstring = '' then
  begin
    FL_inizializzazione := true;

    iBWS_barcode := TBWS_barcode128.Create;
    try

      if iBWS_barcode.LeggiBarcode128_2 <> '' then
      begin
        edt_barcode.AsString := iBWS_barcode.itemcode;
        idart := Ibws_barcode.GetArticoFromEan(Ibws_barcode.itemcode);
        if idart = 0 then
          exit;
        F2Art.KeyValue := idart;
        F2Art.SetFocus;
        //F2Art.OnExit(F2Art);
        if not Assigned(objArtico) then
          GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico);
        ObjArtico.Seek('ID', F2Art.KeyValue);

        edtNumlot.AsString := Ibws_barcode.lotto;
        edtNumser.AsString := StringReplace(iBWS_barcode.scadenza,'/','',[rfreplaceall]);
        edtDatLot.AsDateTime := StrToDate(iBWS_barcode.scadenza);
        if not ibws_barcode.VerificaLottoAcquisto(idart,edtDatLot.AsDateTime) then
        begin
          F2Art.KeyValue := 0;
          edtNumlot.AsString := '';
          edtNumser.AsString := '';
          edtqtaumi.AsFloat := 0;
          edtqtaumm.AsFloat := 0;
          edtqtaumf.AsFloat := 0;
        end
        else
        begin
          if not Ibws_barcode.peso3103 then
          begin
            Ibws_barcode.peso := Ibws_barcode.GetPesoFissoFromEan(Ibws_barcode.itemcode);
          end;

          edtqtaumm.AsFloat := Ibws_barcode.peso;
          //edtqtaumm.OnExit(edtqtaumm);
          edtqtaumm.setfocus;
          edtqtaumm.SelectAll;
          edtQtaUMI.AsFloat := edtQtaUMm.AsFloat * ObjArtico.ConvUm(oum, ouI);

          if UMFOR = umm then
            edtqtaUmf.AsFloat := edtQtaUMm.AsFloat
          else
          begin
            if Ibws_barcode.peso3103 then       // è a peso variabile
            begin
              edtqtaUmf.AsFloat := 1;
              edtQtaUMI.AsFloat := edtqtaUmf.AsFloat * umco;
            end
            else
              edtqtaUmf.AsFloat := edtQtaUMm.AsFloat * UMCO;
          end;

        end;
      end;
    finally
      if Assigned(iBWS_barcode) then
        FreeAndNil(iBWS_barcode);
      //f2Allmag.SetFocus;
    end;
    FL_inizializzazione := False;
  end;
end;

procedure TFrmCaricaMag.F2ArtExit(Sender: TObject);
var
  objartico : iarticostd;
  qr_list : TCSEQuery;
  ForServ1: IStFor;
  LStruFotoRigheAcq1: TStruFotoRigheACQ;
  QtaOrd, QtaOrdM, QtaOrdI: Double;
begin

  qr_list := TCSEQuery.Create(nil);
  qr_list.DataBaseName := DBExec.DatabaseName;
  qr_list.SQL.Text := 'select ' +
                      '   um.CODICE as UMFOR,' +
                      '   UMCO,       '+
                      '   art.UMI,    '+
                      '   art.UMM,    '+
                      '   art.UMREL1, '+
                      '   art.UMCO1,  '+
                      '   art.UMCO2,  '+
                      '   art.UMREL2, '+
                      '   art.UMREL3  '+
                      ' from SCOFORACQ sa ' +
                      ' join LISRIGACQ r '+
                      '   on r.IDLISTESACQ = sa.IDLISTESACQ ' +
                      ' join umart um    ' +
                      '   on um.id = r.IDUMF '+
                      ' join artico art      '+
                      '   on art.id = r.IDARTICO    '+
                      'where r.idartico = :idartico ' +
                      '  and sa.IDFOR = :idfornitore' +
                      '  and (datfiva >= :dt or isnull(DATFIVA,0) = 0) ';

  qr_list.ParamByName('idartico').AsInteger := F2Art.KeyValue;
  qr_list.ParamByName('idfornitore').AsInteger := F2forn.KeyValue;
  qr_list.ParamByName('dt').AsDateTime := DBExec.Data;
  qr_list.Open;
  if qr_list.IsEmpty then
  begin
    if not GetInterfOggetto('ObjArticoli', 'Artico', IArticoStd, ObjArtico) then
    begin
      exit;
    end;
    ObjArtico.Seek('ID', F2Art.KeyValue);
    if objartico.Found then
    begin
      ForServ1 := forservice as IStFor;
      LStruFotoRigheAcq1 := ForServ1.GetUMFORStd(objartico.CampiObj['ID'], 0, 1,
                                               QtaOrd, QtaOrdM, QtaOrdI);
      UMFOR :=  LStruFotoRigheAcq1.UMF;
      UMCO := LStruFotoRigheAcq1.UMFCO;
      UMM := objartico.CampiObj['UMM'];
      UMI := objartico.CampiObj['UMI'];
    end;

  end
  else
  begin
    UMFOR  := qr_list.FieldByName('UMFOR').AsString;
    UMCO   := qr_list.FieldByName('UMCO').AsFloat;
    UMI    := qr_list.FieldByName('UMI').AsString;
    UMM    := qr_list.FieldByName('UMM').AsString;
  end;

  lbl_umf.Caption := UMFOR;
  lbl_umm.Caption := UMM;
  if UMM = '' then
    edtQtaUMm.Enabled := False
  else
    edtQtaUMm.Enabled := True;

  lbl_umi.Caption := UMI;

  qr_list.Close;
  FreeAndNil(qr_list);
end;

procedure TFrmCaricaMag.F2fornKeyChange(Sender: TObject; NewKey,
  OldKey: Integer);
var
  qr : TCSEQuery;
begin
  if NewKey = 0 then
  begin
    lbl_desforn.Caption := '';
  end
  else
  begin
    //idbollafornitore := OttieniIdBollaFornitore;
    qr := TCSEQuery.Create(nil);
    qr.DataBaseName := DBExec.DatabaseName;
    qr.SQL.Text := 'select p.descr1,p.indiri,p.cap,p.COMUNE ' +
                   '  from fornitori f ' +
                   '  join persone p ' +
                   '    on f.IDPERSONA = p.id ' +
                   ' where f.id = ' + inttostr(NewKey);
    qr.Open;
    lbl_desforn.Caption := qr.FieldByName('descr1').AsString + ' ' +
                           qr.FieldByName('indiri').AsString + ' ' +
                           qr.FieldByName('cap').AsString + ' ' +
                           qr.FieldByName('comune').AsString;
    qr.Close;
    qr.Free;
    edt_barcode.SetFocus;
  end;
end;

procedure TFrmCaricaMag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  try
    UnloadPackage(Hw_module);
  finally

  end;
end;

procedure TFrmCaricaMag.FormCreate(Sender: TObject);
begin
  inherited;

  BtnElabora.Parent := PnlTasti;
  BtnPreparaRiga.Parent := pnltasti;
  BtnAnnulla.Parent := PnlTasti;
  BtnPulisci.Parent := PnlTasti;

  BtnElabora.top := 0;
  BtnPreparaRiga.top := 0;
  BtnAnnulla.top := 0;
  BtnPulisci.top := 0;

  f2Tipodoc.DBSam := DBExec.DatabaseName;
  F2forn.DBSam := dbexec.DatabaseName;
  F2Art.DBSam := dbexec.DatabaseName;
  f2Allmag.DBSam := dbexec.DatabaseName;

  QRighepreparate.DataBaseName := DBExec.DatabaseName;

  F2forn.open;
  F2Art.open;

  //f2Allmag.WhereSql := 'idanamag in (select id from anamag where tipmag = ''A'' and tipgia = ''G'' and GMAGAUT = -1)';
  f2Allmag.Open;

  f2Tipodoc.WhereSql := 'tipdoc = ''EB''';
  f2Tipodoc.Open;
  f2Tipodoc.KeyValue := GetParDef('DOCRMA',DBExec.DatabaseName);

  //StbBarra.Panels[0].Text := FormatDateTime('dd/mm/yyyy',Now());
  //StbBarra.Panels[1].Text := 'Az. : ' + Azienda.Id + ' - Ut. : ' + Utente.UserName + ' Ver: ' + getversion(DLLFileName);

  Hw_module := LoadPackage(ExtractFilePath(Application.ExeName) + 'M_For.bpl');

  LeggiIni;

  F2allMag.KeyValue := fIni.idvano;

  GridRighepreparate.IniFileName := glo.IniUtente;
  GridRighepreparate.IniSection := 'FrmCaricaMag_GridRighepreparate_' + Azienda.Id;
end;

procedure TFrmCaricaMag.FormResize(Sender: TObject);
begin
  inherited;
  PageCtrl.Align := alClient;
end;

procedure TFrmCaricaMag.FormShow(Sender: TObject);
begin
  inherited;
  Edtnumdoc.SetFocus;
end;

function TFrmCaricaMag.getIdBolla: integer;
var
  lqr : TCSEQuery;
begin

  Lqr := TCSEQuery.Create(nil);
  Lqr.DataBaseName := DBExec.DatabaseName;
  lqr.SQL.Text := 'select id from bamtesacq ' +
                  ' where idtipidoc = :idtipidoc ' +
                  '   and anndoc = :anndoc ' +
                  '   and numdoc = :numdoc ' +
                  '   and datdoc = :datdoc ' +
                  '   and idfor = :idfor';

  lqr.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
  lqr.ParamByName('anndoc').AsInteger := YearOf(edtDataDoc.AsDateTime);
  lqr.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
  lqr.ParamByName('datdoc').AsDateTime := edtDataDoc.AsDateTime;
  lqr.ParamByName('idfor').AsInteger := F2forn.KeyValue;
  Lqr.open;

  Result := lqr.FieldByName('id').AsInteger;
  lqr.Close;
  FreeAndNil(lqr);
end;

procedure TFrmCaricaMag.LeggiIni;
var
  Lini : tinifile;
begin
  Lini := tinifile.Create(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)))+'PI_Altag_BWS.ini');
  fini.idcaumov := Lini.Readinteger('DDT_FORNITORE','IDCAUMOV',0);
  fini.idvano := Lini.Readinteger('ENTRATA_MERCI','IDVANO',0);
  Lini.Free;
end;

function TFrmCaricaMag.OttieniIdBollaFornitore: integer;
var

  qrytipdoc,
  qryforn,
  qryCaumov : TCSEQuery;
  ObjBamTesacq : IBamTesACQStd;
  idbam : integer;

  qr : TCSEQuery;

begin
  Result := 0;

  qr := TCSEQuery.Create(nil);
  qr.DataBaseName := dbexec.DatabaseName;
  qr.SQL.Text := 'select id from bamtesacq ' +
                 ' where idfor = :idfor ' +
                 '   and idtipidoc = :idtipidoc ' +
                 '   and numdoc = :numdoc ' +
                 '   and datdoc = :datdoc ' +
                 '   and stato = ''P''';
  qr.ParamByName('idfor').AsInteger := F2forn.KeyValue;
  qr.ParamByName('idtipidoc').AsInteger := f2Tipodoc.KeyValue;
  qr.ParamByName('numdoc').AsString := Edtnumdoc.AsString;
  qr.ParamByName('datdoc').Asdatetime := edtDataDoc.asdatetime;
  qr.Open;
  if not qr.IsEmpty then
  begin
    result := qr.FieldByName('id').AsInteger;
    exit;
  end;

  if not Assigned(ObjBamTesacq) then
  begin
    if not GetInterfOggetto('ObjBamTesacq', 'BamTesacq', IBamTesacqStd, ObjBamTesacq) then
    begin
      raise Exception.Create('Errore durante l''inizializzazione del modulo bolle');
    end;
  end;

  qrytipdoc := TCSEQuery.Create(nil);
  qrytipdoc.DataBaseName := DBExec.DatabaseName;

  qryforn := TCSEQuery.Create(nil);
  qryforn.DataBaseName := DBExec.DatabaseName;

  qryCaumov := TCSEQuery.Create(nil);
  qryCaumov.DataBaseName := DBExec.DatabaseName;

  QryForn.SQL.Text := 'SELECT c.Id,' +
                      'c.Idiva,' +
                      'c.Idanapag,' +
                      'c.Idvaluta,' +
                      'c.Idvettore,' +
                      'c.Sospiva,' +
                      'c.Idmtrasp,' +
                      'c.Idcons,' +
                      'c.Idbanca,' +
                      'c.Idnsbanca,' +
                      'c.Scobas,' +
                      'c.Spetra,' +
                      'c.Tipspetra,' +
                      'c.Idanalin,' +
                      'p.Descr1,' +
                      'p.Indiri,' +
                      'p.Cap,' +
                      'p.Localita,' +
                      'p.Prov,' +
                      'p.Idnazioni,' +
                      'a.Tippag ' +
                      'FROM Fornitori c ' +
                      'INNER JOIN Persone p ON c.Idpersona=p.Id ' +
                      'LEFT OUTER JOIN Anapag a ON c.Idanapag=a.Id ' +
                      'WHERE (c.Id = :IdFornitore)';

  qryforn.ParamByName('idfornitore').AsInteger := F2forn.KeyValue;
  QryForn.Open;

  qrytipdoc.SQL.Text := 'select * from tipidoc where id = ' + IntToStr(f2Tipodoc.KeyValue);
  qrytipdoc.Open;

  qryCaumov.SQL.Text := 'select * from caumov where id = ' + inttostr(FIni.idcaumov);
  qryCaumov.Open;

  with ObjBamTesacq do
  begin
    Found := false;

    CampiObj['IDTIPIDOC']  := qrytipdoc.FieldByName('id').AsInteger;

    CampiObj['TIPNUM']     := qrytipdoc.FieldByName('tipnum').AsString;

    CampiObj['ANNDOC']     := YearOf(edtDataDoc.AsDateTime);

    CampiObj['NUMDOC']     := Edtnumdoc.AsString;

    CampiObj['DATDOC']     := edtDataDoc.AsDateTime;

    CampiObj['STATO']      := 'P';

    CampiObj['seguefat']   := -1;

    CampiObj['IDFOR']      := F2forn.KeyValue;

    CampiObj['IDFORSPED']  := F2forn.KeyValue;

    CampiObj['IDIVA']      := qryforn.FieldByName('Idiva').AsInteger;

    CampiObj['IDCAUMOV']   := qryCaumov.FieldByName('id').AsInteger;

    CampiObj['IDANAMAG']   := qryCaumov.FieldByName('idmagarr').AsInteger;

    CampiObj['IDANAPAG']   := qryforn.FieldByName('idanapag').AsInteger;

    if ( QryForn.FieldByName('Idvaluta').AsInteger <> 0 ) then
      CampiObj['IDVALUTA'] := QryForn.FieldByName('Idvaluta').AsInteger
    else
      CampiObj['IDVALUTA'] := Azienda.RValutaSI.IdEuro;

    CampiObj['cambio']     := CambioVal(QryForn.FieldByName('Idvaluta').AsInteger, DBExec.Data);

    CampiObj['DESCRFOR1']  := QryForn.FieldByName('Descr1').AsString;

    CampiObj['INDFOR']     := QryForn.FieldByName('Indiri').AsString;

    CampiObj['CAPFOR']     := QryForn.FieldByName('Cap').AsString;

    CampiObj['COMUNEFOR']  := QryForn.FieldByName('Localita').AsString;

    CampiObj['PROVFOR']    := QryForn.FieldByName('Prov').AsString;

    CampiObj['DESCRSPED1'] := QryForn.FieldByName('Descr1').AsString;

    CampiObj['INDSPED']    := QryForn.FieldByName('Indiri').AsString;

    CampiObj['CAPSPED']    := QryForn.FieldByName('Cap').AsString;

    CampiObj['COMUNESPED'] := QryForn.FieldByName('Localita').AsString;

    CampiObj['PROVSPED']   := QryForn.FieldByName('Prov').AsString;

    CampiObj['IDNAZSPED']  := QryForn.FieldByName('idnazioni').AsInteger;

    CampiObj['DATRIC'] := dbexec.Data;

    CampiObj['DATEMI'] := DBExec.Data;

    idbam := Insert;
    if idbam = 0 then
    begin
      MessaggioPDt('Si è verificato un errore durante l''inserimento del ddt fornitore',APPTITLE,MB_ok);
      exit;
    end;
  end;

  result := idbam;

end;

procedure TFrmCaricaMag.PageCtrlChange(Sender: TObject);
begin
  if PageCtrl.ActivePageIndex = 1 then
  begin
    with QRighepreparate do
    begin
      close;
      sql.Text := 'select  ' +
                  'A.CODICE AS CODART,    '+
                  'A.DESCR AS DESCRART,   '+
                  'SUM(PRA.QTAORD) AS QTAORDSPA,  '+
                  'um.CODICE as umFor,            '+
                  'um1.codice as umMov,           '+
                  'um2.codice as umInv,           '+
                  'SUM(PRA.QTAORDM) AS QTAORDMSPA,'+
                  'SUM(PRA.QTAORDI) AS QTAORDISPA,'+
                  'OAR.TOTQTAORD,                 '+
                  'pra.ext_idfor,                 '+
                  'pra.ext_idtipidoc,             '+
                  'pra.ext_datdoc,                '+
                  'ext_numdoc                     '+
                  'from PDTRIGACQ PRA             '+
                  'LEFT JOIN LOTSER LS ON LS.ID = PRA.IDLOTSER  '+
                  'LEFT JOIN ARTICO A ON A.ID = LS.IDARTICO     '+
                  'left join umart um on um.id = pra.IDUMF      '+
                  'left join umart um1 on um1.id = pra.IDUMM    '+
                  'left join umart um2 on um2.id = pra.IDUMI    '+
                  'OUTER APPLY (SELECT SUM(OAR.QTAORD) AS TOTQTAORD  '+
                  'FROM OACRIG OAR                                   '+
                  'join oactes oa on oa.id = oar.IDOACTES             '+
                  'LEFT JOIN LOTSER LS1 ON LS1.ID = OAR.IDARTICO     '+
                  'LEFT JOIN ARTICO A1 ON A1.ID = LS1.IDARTICO        '+
                  'WHERE OAR.STARIG = ''O''                             '+
                  'AND A1.ID = A.ID                                   '+
                  'and oa.IDFOR = ' + IntToStr(F2forn.KeyValue) +' ) OAR  '+
                  'where pra.ext_idfor = ' + inttostr(F2forn.KeyValue) +
                  '  and pra.ext_idtipidoc = ' + IntToStr(f2Tipodoc.KeyValue) +
                  '  and pra.ext_datdoc = ' + inttostr(Trunc(edtDataDoc.GetValue)) +
                  '  and ext_numdoc = ''' + Edtnumdoc.AsString +  '''' +
                  'GROUP BY A.CODICE, A.DESCR,                        '+
                  ' OAR.TOTQTAORD,um.CODICE,um1.codice,               '+
                  ' um2.codice,pra.ext_idfor, pra.ext_idtipidoc,      '+
                  ' pra.ext_datdoc,ext_numdoc                         '+
                  'ORDER BY A.CODICE, A.DESCR';


      Open;
    end;

    GridRighepreparate.LoadFromIniFile;
    GridRighepreparate.RefreshData;
    pnlCartoni.Visible := true;
  end
  else
  begin
    GridRighepreparate.SaveToIniFile;
    QRighepreparate.Close;
    pnlCartoni.Visible := false;
  end;
end;

procedure TFrmCaricaMag.puliscicampi(cancella_ddt : Boolean = False);
begin
  if cancella_ddt then
  begin
    //f2Tipodoc.KeyValue := 0;
    Edtnumdoc.AsString := '';
    edtDataDoc.AsDateTime := 0;
    edtforn.AsInteger := 0;
    F2forn.KeyValue := 0;
  end;
  edt_barcode.asstring := '';
  F2Art.KeyValue := 0;
  edtNumlot.asstring := '';
  edtnumser.AsString := '';
  edtqtaUmm.enabled := true;
  edtqtaUmm.AsFloat := 0;
  edtQtaUMf.AsFloat := 0;
  edtQtaUMI.AsFloat := 0;
  edtDatLot.AsString := '';
  lbl_umm.Caption := '[UMX]';
  lbl_umf.Caption := '[UMX]';
  lbl_umi.Caption := '[UMX]';
  if not cancella_ddt then
  Begin
    edt_barcode.SetFocus;
    //edt_barcodeEnter(edt_barcode);
  End
  else
    f2Tipodoc.SetFocus;
end;

function TFrmCaricaMag.validacontrolli: Boolean;
begin
  result := true;
  {
  if f2Allmag.KeyValue = 0 then
  begin
    messagedlg('Vano non inserito!',mtInformation,[mbok],0);
    f2Allmag.SetFocus;
    exit(false);
  end;
  }
  if F2Art.keyvalue = 0 then
  begin
    MessaggioPDt('Aricolo non inserito!',APPTITLE,MB_ok);
    F2Art.SetFocus;
    exit(false);
  end;

  if edtNumlot.AsString = '' then
  begin
    MessaggioPDt('Num. lotto non inserito!',APPTITLE,MB_ok);
    edtNumlot.SetFocus;
    exit(false);
  end;


  if edtNumser.AsString = '' then
  begin
    MessaggioPDt('Num. serie non inserito!',APPTITLE,MB_ok);
    edtNumser.SetFocus;
    exit(false);
  end;

  if F2forn.KeyValue = 0 then
  begin
    MessaggioPDt('Fornitore non inserito!',APPTITLE,MB_ok);
    F2forn.SetFocus;
    Exit(False);
  end;

  if Edtnumdoc.AsString = '' then
  begin
    MessaggioPDt('Numero documento non inserito!',APPTITLE,MB_ok);
    Edtnumdoc.SetFocus;
    Exit(false);
  end;

  if edtDataDoc.AsDateTime = 0 then
  begin
    MessaggioPDt('Data documento non inserita!',APPTITLE,MB_ok);
    edtDataDoc.SetFocus;
    Exit(false);
  end;

  if f2Tipodoc.KeyValue = 0 then
  begin
    MessaggioPDt('Tipo documento non impostato!',APPTITLE,MB_ok);
    f2Tipodoc.SetFocus;
    Exit(False);
  end;

  if verificaEsistenzaDDTFornitore(f2Tipodoc.KeyValue,edtnumdoc.asstring,edtDataDoc.AsDateTime,F2forn.KeyValue) then
  begin
    MessaggioPDt('Ddt fornitore già presente!',APPTITLE,MB_ok);
    Exit(False);
  end;

  if edtqtaUmi.AsFloat = 0 then
  begin
    Exit(false);
  end;
end;

function TFrmCaricaMag.verificaEsistenzaDDTFornitore(idtipidoc: Integer;
  numdoc: string; datdoc: tdatetime; idfor: Integer): Boolean;
var
  qr : TCSEQuery;
begin
  result := true;
  qr := tcsequery.Create(nil);
  try
    qr.DataBaseName := dbexec.DatabaseName;
    qr.SQL.Text := 'select * from bamtesacq ' +
                   ' where idtipidoc = :idtipidoc ' +
                   '   and anndoc = :anndoc ' +
                   '   and numdoc = :numdoc ' +
                   '   and datdoc = :datdoc ' +
                   '   and idfor = :idfor';

    qr.ParamByName('idtipidoc').AsInteger := idtipidoc;
    qr.ParamByName('anndoc').AsInteger := YearOf(datdoc);
    qr.ParamByName('numdoc').AsString := numdoc;
    qr.ParamByName('datdoc').AsDateTime := datdoc;
    qr.ParamByName('idfor').AsInteger := idfor;
    qr.Open;
    if qr.IsEmpty then
      result := false;
  finally
    FreeAndNil(qr);
  end;
end;

function TFrmCaricaMag.VerificaEsistenzaLotto(idartico: Integer; numlot,
  numser: string; DataLotto : double): Integer;
var
  qrlot : TCSEQuery;
  ObjLotSer : ilotserstd;
  lotexists : boolean;
  id :integer;
begin
  result := 0;
  qrlot := TCSEQuery.Create(nil);
  qrlot.DataBaseName := dbexec.DatabaseName;
  qrlot.SQL.Text := 'select id ' +
                    '  from lotser ' +
                    ' where idartico = :idartico ' +
                    '   and numlot = :numlot ' +
                    '   and numser = :numser';

  qrlot.ParamByName('idartico').AsInteger := idartico;
  qrlot.ParamByName('numlot').AsString := numlot;
  qrlot.ParamByName('numser').AsString := numser;
  qrlot.Open;
  if qrlot.IsEmpty then
  begin
    if not GetInterfOggetto('ObjLotSer', 'Lotser', ILotSerStd, ObjLotSer) then
        raise Exception.Create('ATTENZIONE: Caricamento del modulo Lotser fallito');


    id := ObjLotSer.InsLotto(DBExec,idartico,numlot,numser,FloatToStr(Now()),FloatToStr(Now()),'',False,lotexists);
    if id = 0 then
    begin
      MessaggioPDT('Errore nella creazione del lotto!',apptitle,mb_OK);
      exit;
    end
    else
      Result := id;
  end
  else
    Result := qrlot.FieldByName('id').AsInteger;
  qrlot.Close;
  qrlot.SQL.Text := 'Update lotser set datrif = :datalotto where id = :idlotto';
  qrlot.ParamByName('datalotto').AsFloat := DataLotto;
  qrlot.ParamByName('idlotto').AsInteger := result;
  qrlot.ExecSQL;
  qrlot.Free;
end;


end.
