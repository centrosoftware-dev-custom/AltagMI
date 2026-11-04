unit FPrevInd;

interface

uses
  Winapi.Windows, Vcl.Forms, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Compf2,
  Data.DB, CSETables, UCoreTipi, Vcl.Grids, Oext_pialtatg, IProduzione, Vcl.ComCtrls,
  CSGroupBox, OLEDBComponents, AdvGroupBox;

type
  TDatiPI = record
    idcliente: integer;
    IdArticoPF: integer;
    idmarche: integer;
    idmagpre: integer;
    DatRic: double;
    VarDb: string;
    Notapf: string;
    IdArticoC: integer;
    IdOPDTC: integer;
    idopsdlfas: integer;
    NoMat: Boolean;
  end;
  TFrmPrevInd = class(TForm)
    QryextvelAltatg: TCSEQuery;
    QrySelCompPrinc: TCSEQuery;
    QrySelOPDP: TCSEQuery;
    QrySelSdlMat: TCSEQuery;
    QrySelOPDTpf: TCSEQuery;
    QryNextNumOP: TCSEQuery;
    QrySelSdlFas: TCSEQuery;
    PageControl1: TPageControl;
    TabDatiTec: TTabSheet;
    TabDatiCom: TTabSheet;
    Pan_datitestata: TPanel;
    Label1: TLabel;
    Lab_Cliente: TLabel;
    Label3: TLabel;
    Lab_PF: TLabel;
    F2IdTipiDoc: TF2;
    lblTipDoc: TLabel;
    Lab_numPrev: TLabel;
    Pan_CSButtons: TPanel;
    BtnStdAnnulla: TButton;
    BtnAggOV: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Lab_Spessore: TLabel;
    Lab_Qta: TLabel;
    Lab_finitura: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    Label14: TLabel;
    F2Materiale: TF2;
    GB_Sviluppo: TCSGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label22: TLabel;
    Edt_SvilLin: TEdit;
    Edt_NProf: TEdit;
    Edt_NSpig: TEdit;
    edt_SvilCerchi: TEdit;
    GB_CostoTaglio: TCSGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Edt_TotTaglio1Pz: TEdit;
    Edt_TotOrd: TEdit;
    SG_CSvil: TStringGrid;
    GB_Lastre: TCSGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edt_Altezza: TEdit;
    edt_Lunghezza: TEdit;
    edt_NLastre: TEdit;
    Edt_PezziLastra: TEdit;
    Edt_Fmmmin: TEdit;
    Edt_SpazioRall: TEdit;
    Edt_Rall: TEdit;
    Edt_TForat: TEdit;
    Edt_TAttr: TEdit;
    Edt_TempoPrev: TEdit;
    lblMat: TLabel;
    lblRicarico: TLabel;
    lblImpRicarico: TLabel;
    lblLavInt: TLabel;
    lblLavEst: TLabel;
    lblTotali: TLabel;
    lbl: TLabel;
    Label23: TLabel;
    LblCostoUni: TLabel;
    Label25: TLabel;
    edtMa: TEdit;
    edtPeMCMa: TEdit;
    edtImpMa: TEdit;
    edtLI: TEdit;
    edtPeMCLI: TEdit;
    edtImpLI: TEdit;
    edtLE: TEdit;
    edtPeMCLE: TEdit;
    edtImpLE: TEdit;
    edtTot: TEdit;
    edtTotImp: TEdit;
    edtTotPrec1: TEdit;
    edtPeUlMC: TEdit;
    edtImpUl: TEdit;
    edtTotPrec2: TEdit;
    edtPeUlSc: TEdit;
    edtImpSc: TEdit;
    Panel1: TPanel;
    edtTotale: TEdit;
    edtTotMC: TEdit;
    edtTotGen: TEdit;
    edtTotMCGen: TEdit;
    edtTotImpGen: TEdit;
    edtLEUni: TEdit;
    edtLIUni: TEdit;
    edtMaUni: TEdit;
    edtLERic: TEdit;
    edtLIRic: TEdit;
    edtMaRic: TEdit;
    lblCostoTot: TLabel;
    lblCostoRic: TLabel;
    BtnCopia: TButton;
    BtnIncolla: TButton;
    edtTotaleUni: TEdit;
    Label24: TLabel;
    F2Lav: TF2;
    edt_Costo: TEdit;
    Label26: TLabel;
    edt_TCosto: TEdit;
    Label27: TLabel;
    BtnStdOk: TButton;
    QryUpdtOpdtPF: TCSEQuery;
    QryUpdtOpSDLMatPF: TCSEQuery;
    Label28: TLabel;
    Label29: TLabel;
    lblPesoUni: TLabel;
    lblPesoTot: TLabel;
    procedure FormShow(Sender: TObject);
    procedure F2MaterialeKeyChange(Sender: TObject; NewKey,
      OldKey: Integer);
    procedure Edt_SvilLinKeyPress(Sender: TObject; var Key: WideChar);
    procedure Edt_SvilLinExit(Sender: TObject);
    procedure Edt_NProfExit(Sender: TObject);
    procedure Edt_TotTaglio1PzExit(Sender: TObject);
    procedure BtnStdAnnullaClick(Sender: TObject);
    procedure BtnAggOVClick(Sender: TObject);
    procedure Edt_RallExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SG_CSvilKeyPress(Sender: TObject; var Key: WideChar);
    procedure SG_CSvilSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure Edt_SvilLinChange(Sender: TObject);
    procedure Edt_PezziLastraChange(Sender: TObject);
    procedure edtPeMCMaKeyPress(Sender: TObject; var Key: WideChar);
    procedure edtImpMaKeyPress(Sender: TObject; var Key: WideChar);
    procedure edtPeMCMaExit(Sender: TObject);
    procedure edtImpMaExit(Sender: TObject);
    procedure edt_NLastreExit(Sender: TObject);
    procedure BtnCopiaClick(Sender: TObject);
    procedure BtnIncollaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure edt_CostoKeyPress(Sender: TObject; var Key: WideChar);
    procedure F2LavKeyChange(Sender: TObject; NewKey, OldKey: Integer);
    procedure BtnStdOkClick(Sender: TObject);
  private
    // isInIns: Boolean;
    DatiPI: TDatiPI;
    NtabtmpCopia: String;
    DiametroMin: Double;
    IDlavorazione: Integer;
    IDCompDefault: Integer;
    ext_pialtatg: Text_pialtatg;
    UtentiAbilitati: String;
    IDTipiDocVendita : TStrings;
    function cercaextvelAltatg(idgruppi, idmarche, idLav: integer; spessore: Double): boolean;
    procedure PulisciDatiPI(myDatiPI: TDatiPI);
    procedure AssegnaCampiExtRig(idoptes: integer);
    procedure AssegnaControlliExtRig;
    procedure CalcolaSvilLin;
    procedure CalcolaSvilCerchi;
    procedure CalcolaTempo;
    procedure CalcolaNLastre;
    function cercaCompPrinc(ParidComrig: integer): boolean;
    function CalcolaPeso(msg: boolean): double;
    function MinToSecS(Minuti: double): double;
    function SecSToMin(Secondi: double): double;
    function SecCToSecS(MinSecC: double): double;
    function cercaOPDP(idOptes, idArtico: integer): boolean;
    function cercaSdlMat(idopdtPadre, idArtico: integer): boolean;
    procedure AggOPTES(FOP: IPrev);
    function cercaOPDTpf(idoptes, idArticoPF: integer): boolean;
    procedure AggOPDT(FOP: IPrev; idoptes, idDTpadre: integer; var isInIns: Boolean);
    procedure AggOPDP(FOP: IPrev; idoptes, idDTpadre: integer; isInIns: Boolean);
    procedure AggSdlMat(FOP: IPrev; idoptes, idDTpadre: integer);
    procedure AggSdlFas(FOP: IPrev; idoptes, idDTpadre: integer);
    function cercaSdlFas(idopdtPadre, idArtico: integer): boolean;
    function SecSToSecC(MinSecS: double): double;
    procedure CalcolaTotDatiCom;
    procedure AggOPTESDatiCont;
    procedure AssegnaControlliDatiComPI(FOP: IPrev);
    procedure AssegnaCampiOptesDatiCont(FOP: IPrev);
    procedure LeggiMateriale;
    procedure AggiornaCosti;
    procedure AggiornaComtes(ask: Boolean);
    procedure AggiornaPesi(IdOpTes, IdArtico: Integer);
    //SD 04/10/2010 : RI #9595
    function ValidaControlli : Boolean;
    function getTipDocOV(IdComRig : Integer ): Integer;
    { Private declarations }
  public
    { Public declarations }
    idcomrig: integer;
    livello: Tlivello;
    AskAggPrezzoComRig: Integer;
    //CostoTot: double;
    Abort: Boolean;
    function ValidaUtente: Boolean;
  end;

var
  FrmPrevInd: TFrmPrevInd;

implementation

uses
 RNumb, UCoreUtils,RMiscComp, RDate,
 S3DB, UCoreDB, Vcl.Dialogs, System.SysUtils, RSQL, RString, S3Registry, OOrPr, CSFileCfg;

{$R *.DFM}

procedure TFrmPrevInd.FormShow(Sender: TObject);
var
  QryTmp: TCSEQuery;
  ini: TCSFileCfg;
  idCauMovR, i: Integer;
  ValStr, chiave: string;

  //SD 04/10/2010 : RI #9595
  QrytmpArt : TCSEQuery;
  MsgErr : String;
  IDGruppo : Integer; 
begin
  Abort:=True;
  // isInIns:=True;
  AskAggPrezzoComRig:=0;  //  nessuna azione

  // Conversione alla 03.02 ...  Riporto le stringa SQL che prima erano nell'oggetto
  QryextvelAltatg.databasename:=Azienda.DatabaseName;
  QryextvelAltatg.SQL.Text:= 'select * from extvelAltatg '+
                             'where idgruppi= :idgruppi '+
                               'and idmarche= :idmarche '+
                               'and idlav= :idlav '+
                               'and spessore= :spessore ';
  QryextvelAltatg.prepare;

  QrySelOPDTpf.databasename:=Azienda.DatabaseName;
  QrySelOPDTpf.SQL.Text:= 'select id, idartico from opdt '+
                          'where idoptes= :idoptes and livello=0 and idpadre is null ';
  QrySelOPDTpf.prepare;

  QrySelCompPrinc.databasename:=Azienda.DatabaseName;
  QrySelCompPrinc.SQL.Text:= 'select opdt.id, opdt.idartico '+
                             'from opdt inner join optes on opdt.idoptes=optes.id '+
                             'where optes.idcomrig= :idcomrig and opdt.livello=1 '+
                               'and opdt.idpadre=(select opdtp.id '+
                                                 'from opdt opdtp '+
                                                 'inner join optes optesp on opdtp.idoptes=optesp.id '+
                                                 'where optesp.id=optes.id '+
                                                   'and opdtp.livello=0 '+
                                                   'and opdtp.idpadre is null) '+
                             'order by opdt.sequen ';
  QrySelCompPrinc.prepare;

  QrySelOPDP.databasename:=Azienda.DatabaseName;
  QrySelOPDP.SQL.Text:= 'select top 1 opdp.id, opdp.qtimco, opdp.tipord, '+
                           'opdp.cosuni, opdp.tipcos from opdp '+
                        'where opdp.idoptes= :idoptes '+
                          'and opdp.idartico= :idartico '+
                        'order by id ';
  QrySelOPDP.prepare;

  QrySelSdlMat.databasename:=Azienda.DatabaseName;
  QrySelSdlMat.SQL.Text:= 'select id from opsdlmat '+
                          'where idopdt= :idopdt and idartico= :idartico '+
                          'order by sequen ';
  QrySelSdlMat.prepare;

  QrySelSdlFas.databasename:=Azienda.DatabaseName;
  QrySelSdlFas.SQL.Text:= 'select id, idlav from opsdlfas '+
                          'where idopsdlmat= :idopsdlmat '+
                          'order by sequen ';
  QrySelSdlFas.prepare;

  QryNextNumOP.databasename:=Azienda.DatabaseName;
  QryNextNumOP.SQL.Text:= 'SELECT MAX(NUMOP) ULTIMO FROM OPTES '+
                          'WHERE (ANNOP= :ANNOP) AND (IDTIPIDOC= :IDTIPIDOC) ';
  QryNextNumOP.prepare;

  QryUpdtOpdtPF.databasename:=Azienda.DatabaseName;
  QryUpdtOpdtPF.SQL.Text:= 'update opdt set idartico= :idartico where id= :id ';

  QryUpdtOpSDLMatPF.databasename:=Azienda.DatabaseName;
  QryUpdtOpSDLMatPF.SQL.Text:= 'update opsdlmat set idartico= :idartico where idopdt= :idopdt';
  // ...Conversione alla 03.02



  //SD 04/10/2010 : RI #9595
  QryTmpArt := TCSEQuery.Create(nil);
  try
    QryTmpArt.DatabaseName := DBExec.DatabaseName;
    QrytmpArt.SQL.Text := 'select '+
                            'a.IDGRUPPI ' +
                          'from ' +
                            'ARTICO a ' +
                          'inner join ' +
                            'Lotser l on l.IDARTICO=a.ID ' +
                          'inner join ' +
                            'ComRig cr on cr.IDARTICO=l.ID ' +
                          'where ' +
                            'cr.ID = '+CS_Keyvalueto_SQLStr(idcomrig);
    Try
      QrytmpArt.Open;
    Except on e:Exception Do
      Begin
        MsgErr := 'ATTENZIONE'+CRLF+ 'Operazione fallita.' + CRLF + CRLF +
                  E.Message + CRLF + CRLF +
                  'SQL:' + CRLF + QrytmpArt.SQL.Text;
      End;
    End;
    if MsgErr <> '' then
    begin
      Application.MessageBox( PChar( MsgErr ), PChar( APPTITLE ), MB_OK + MB_ICONERROR );
    end;
    IDGruppo := QrytmpArt.FieldByName('IDGruppi').AsInteger;
  finally
    FreeAndNil(QryTmpArt);
  end;
  //SD 04/10/2010 : fine
  F2Materiale.DBSAM := Azienda.DatabaseName;
  F2Materiale.WhereSql:=' (a.TipArt=''S'' or a.TipArt=''C'') ';
  //SD 04/10/2010 : RI #9595
  if IDGruppo > 0 then
    F2Materiale.WhereSql := F2Materiale.WhereSql + ' and (a.IDGRUPPI='+CS_Keyvalueto_SQLStr(IDGruppo)+')';
  F2Materiale.open;
  F2Lav.DBSAM := Azienda.DatabaseName;
  F2Lav.open;
  F2IdTipiDoc.DBSAM := Azienda.DatabaseName;
  F2IdTipiDoc.WhereSql:=' (a.TIPDOC=''D'') ';
  F2IdTipiDoc.open;

  edtPeMCMa.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCMA', Azienda.Databasename)), Perc, 2);
  edtPeMCLi.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCLI', Azienda.Databasename)), Perc, 2);
  edtPeMCLe.text:=formatvariant(ZeroifNull(GetParDef('PIPEMCLE', Azienda.Databasename)), Perc, 2);
  edtPeUlMC.text:=formatvariant(ZeroifNull(GetParDef('PIPEULMC', Azienda.Databasename)), Perc, 2);
  edtPeUlSc.text:=formatvariant(ZeroifNull(GetParDef('PIPEULSC', Azienda.Databasename)), Perc, 2);

  PageControl1.ActivePage:=TabDatiTec;

  PulisciDatiPI(DatiPI);
  ext_pialtatg.found:=false;
  idCauMovR:=0;
  NtabtmpCopia:='TmpPIAltag'+IntToStr(Utente.Id);

  QryTmp:=TCSEQuery.Create(nil);
  try
    QryTmp.DataBaseName := Azienda.DataBaseName;
    QryTmp.sql.clear;
    QryTmp.sql.add('select artico.id artico_id, artico.codice artico_codice, artico.descr artico_descr, '+
                     'artico.idmarche, persone.codice persone_codice, persone.descr1, '+
                     'clienti.id clienti_id, tipidoc.descr tipidoc_descr, '+
                     'comtes.numdoc, comtes.anndoc, comrig.qta3, comrig.DatRic, '+
                     'comrig.descr comrig_descr, comrig.idcaumov, comrig.idmagpre, '+
                     'marche.descr marche_descr, vardb.codice vardb_codice, '+
                     'ext_pialtatg.id ext_pialtatg_id, ext_pialtatg.idoptes, ext_pialtatg.idopsdlfas, '+
                     'optes.idtipidoc, optes.annop, optes.numop, optes.peulmc, optes.ricmc, optes.peulsc, optes.impsc, '+
                     'optes.CosMA, optes.pemcma, optes.RicMA, optes.CosLI, optes.pemcli, '+
                     'optes.RicLI, optes.CosLE, optes.pemcle, optes.RicLE '+
                   'from comrig '+
                     'inner join comtes on comtes.id=comrig.idcomtes inner join tipidoc on comtes.idtipidoc=tipidoc.id '+
                     'inner join lotser on lotser.id=comrig.idartico inner join artico on lotser.idartico=artico.id '+
                     'inner join clienti on comtes.idcliente=clienti.id inner join persone on persone.id=clienti.idpersona '+
                     'left outer join marche on artico.idmarche=marche.id '+
                     'left outer join vardb on comrig.idvardb=vardb.id '+
                     'left outer join optes on comrig.id=optes.idcomrig '+
                     'left outer join ext_pialtatg on ext_pialtatg.idoptes=optes.id '+  //LR_CH16565_2024
                   'where tipidoc.tipdoc <> ''P'' and comrig.id='+inttostr(idcomrig)+
                   ' order by ext_pialtatg.idoptes desc');
    QryTmp.open;
    if not QryTmp.isempty then begin
      caption:=caption+' - Commessa '+trim(QryTmp.fieldbyname('tipidoc_descr').asstring)+' '+
                                      inttostr(QryTmp.fieldbyname('anndoc').asinteger)+' '+
                                      inttostr(QryTmp.fieldbyname('numdoc').asinteger);

      Lab_Cliente.caption:=trim(QryTmp.fieldbyname('persone_codice').asstring)+' '+trim(QryTmp.fieldbyname('descr1').asstring);
      Lab_PF.caption:=trim(QryTmp.fieldbyname('artico_codice').asstring)+' '+trim(QryTmp.fieldbyname('artico_descr').asstring);
      Lab_finitura.caption:=trim(QryTmp.fieldbyname('marche_descr').asstring);
      Lab_Qta.caption:=formatvariant(QryTmp.fieldbyname('qta3').asfloat, quantita);
      CalcolaNLastre;
      BtnCopia.enabled:=False;
      if QryTmp.fieldbyname('idoptes').asinteger>0 then begin  //  il preventivo SAM è già inserito
        // isInIns:=False;
        BtnCopia.enabled:=True;
        F2IdTipiDoc.keyvalue:=QryTmp.fieldbyname('idtipidoc').asinteger;
        //CostoTot:=QryTmp.fieldbyname('Valteo').asFloat;
        Lab_numPrev.caption:=inttostr(QryTmp.fieldbyname('annop').asinteger)+' '+inttostr(QryTmp.fieldbyname('numop').asinteger);  //  +'   Costo: '+formatvariant(CostoTot, importo, 2);
        edtMa.text:=formatvariant(QryTmp.fieldbyname('CosMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtLi.text:=formatvariant(QryTmp.fieldbyname('CosLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtLe.text:=formatvariant(QryTmp.fieldbyname('CosLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtPeMCMa.text:=formatvariant(QryTmp.fieldbyname('PeMcMa').asfloat, Perc, 2);
        edtPeMCLi.text:=formatvariant(QryTmp.fieldbyname('PeMcLi').asfloat, Perc, 2);
        edtPeMCLe.text:=formatvariant(QryTmp.fieldbyname('PeMcLe').asfloat, Perc, 2);
        edtImpMa.text:=formatvariant(QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtImpLi.text:=formatvariant(QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtImpLe.text:=formatvariant(QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtPeUlMC.text:=formatvariant(QryTmp.fieldbyname('PeUlMc').asfloat, Perc, 2);
        edtPeUlSc.text:=formatvariant(QryTmp.fieldbyname('PeUlSc').asfloat, Perc, 2);
        edtImpUl.text:=formatvariant(QryTmp.fieldbyname('RicMc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtImpSc.text:=formatvariant(QryTmp.fieldbyname('ImpSc').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtMaRic.text:=formatvariant(QryTmp.fieldbyname('CosMa').asfloat+QryTmp.fieldbyname('RicMa').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtLiRic.text:=formatvariant(QryTmp.fieldbyname('CosLi').asfloat+QryTmp.fieldbyname('RicLi').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        edtLeRic.text:=formatvariant(QryTmp.fieldbyname('CosLe').asfloat+QryTmp.fieldbyname('RicLe').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        {if QryTmp.fieldbyname('qta3').asfloat<>0 then begin
          edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
          edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
          edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/QryTmp.fieldbyname('qta3').asfloat, Importo, Azienda.RValutaSI.DecMaxEuro);
        end;}
        CalcolaTotDatiCom;
        if cercaCompPrinc(idcomrig) then begin  //  cerco l'eventuale componente dalla distinta tecnica del preventivo SAM
          DatiPI.IdOPDTC:=QrySelCompPrinc.fieldbyname('id').asinteger;
          DatiPI.IdArticoC:=QrySelCompPrinc.fieldbyname('idartico').asinteger;
        end;

        if cercaOPDTpf(QryTmp.fieldbyname('idoptes').asinteger, QryTmp.fieldbyname('artico_id').asinteger) then begin
          i:=QrySelOPDTpf.fieldbyname('id').asinteger;
          if cercaSdlFas(i, QryTmp.fieldbyname('artico_id').asinteger) then begin
            DatiPI.idopsdlfas:=QrySelSdlFas.fieldbyname('id').asinteger;
            F2Lav.KeyValue:=QrySelSdlFas.fieldbyname('idLav').asinteger;
          end;
        end;
      end;
      BtnIncolla.enabled:=not BtnCopia.enabled;
      DatiPI.idcliente:=QryTmp.fieldbyname('clienti_id').asinteger;
      DatiPI.IdArticoPF:=QryTmp.fieldbyname('artico_id').asinteger;
      DatiPI.DatRic:=QryTmp.fieldbyname('DatRic').asfloat;
      DatiPI.VarDb:=trim(QryTmp.fieldbyname('vardb_codice').asstring);
      DatiPI.Notapf:=trim(QryTmp.fieldbyname('comrig_descr').asstring);
      DatiPI.idmarche:=QryTmp.fieldbyname('idmarche').asinteger;
      DatiPI.idmagpre:=QryTmp.fieldbyname('idmagpre').asinteger;
      if QryTmp.fieldbyname('ext_pialtatg_id').asinteger>0 then begin  //  leggo i dati relativi al preventivo altag
        ext_pialtatg.Seek('id', QryTmp.fieldbyname('ext_pialtatg_id').asinteger);
        if ext_pialtatg.found then begin
          if ext_pialtatg.campi.idprodfin<>QryTmp.fieldbyname('artico_id').asinteger then begin
            Showmessage('ATTENZIONE: Il preventivo ALTAG è stato creato utilizzando un prodotto finito diverso da quello indicato in commessa.'+#13#10#13#10+
                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
          end
          else if ext_pialtatg.campi.idprodfin<>DatiPI.IdArticoPF then begin
            Showmessage('ATTENZIONE: Il preventivo è stato creato utilizzando un altro prodotto finito.'+#13#10#13#10+
                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
          end;
          {    cv  24.02.06  spostato sotto
          if ext_pialtatg.campi.idmateriale<>DatiPI.IdArticoC then begin
            Showmessage('ATTENZIONE: Il preventivo è stato creato utilizzando un altro materiale.'+#13#10#13#10+
                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
          end;}
          if ext_pialtatg.campi.idopsdlfas<>DatiPI.idopsdlfas then begin
            Showmessage('ATTENZIONE: Il preventivo è stato creato utilizzando un altra lavorazione (Fase).'+#13#10#13#10+
                        'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
          end;
          AssegnaControlliExtRig;
        end;
      end;

      if QryTmp.fieldbyname('idoptes').asinteger>0 then begin
        if DatiPI.IdArticoC<>0 then
          i:=DatiPI.IdArticoC  // se il preventivo è gia inserito prendo il componente del preventivo
        else if ext_pialtatg.found then
          i:=ext_pialtatg.campi.idmateriale
        else
          i:=IDCompDefault;

        if cercaOPDP(QryTmp.fieldbyname('idoptes').asinteger, i) then begin
          edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
          edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
        end;
      end;
      idCauMovR:=QryTmp.fieldbyname('idCauMov').asinteger;

      AggiornaPesi(QryTmp.fieldbyname('idoptes').asinteger, F2Materiale.KeyValue); // SF...31/07/2007
    end;
  finally
    QryTmp.free;
  end;

  // Ini := TCSFileCfg.Create('ALTAG.CFG');
  Ini := TCSFileCfg.Create(extractfilepath(Glo.IniGenerale)+'ALTAG.CFG');
  IDTipiDocVendita := TStringList.Create;
  try
    DiametroMin := Ini.ReadFloat('PrevInd', 'DiametroMin', 0);
    IDlavorazione:= Ini.ReadInteger('PrevInd', 'IDlav', 0);
    IDCompDefault:= Ini.ReadInteger('PrevInd', 'IDCompDef', 0);
    UtentiAbilitati := Ini.ReadString('PrevInd', 'UtentiAbilitati', '');
    if idCauMovR>0 then begin
      for i:=1 to 4 do begin
        case i of
          1: chiave:='IDCAMOVBV';
          2: chiave:='IDCAMOVBL';
          3: chiave:='IDCAMOVMV';
          4: chiave:='IDCAMOVML';
        end;
        ValStr := Ini.ReadString('PrevInd', chiave, '');
        if trim(ValStr)<>''  then begin
          if strtoint(CS_Extract_SubStr(ValStr,',',0))=idCauMovR then begin
            if F2IdTipiDoc.keyvalue=0 then
              F2IdTipiDoc.keyvalue:=strtoint(CS_Extract_SubStr(ValStr,',',1));
            if (i=2) or (i=4) then
              DatiPI.NoMat:=True;
            break;
          end;
        end;
      end;
    end;
  IDTipiDocVendita.CommaText := ini.ReadString('PrevInd', 'IDTipiDocVendita', '');
//  if IDTipiDocVendita.CommaText = '' then
//  begin
//    Application.MessageBox( PChar( Format ('ATTENZIONE: non sono stati impostati gli ID dei tipi documenti di Vendita nel file di configurazione "%s"'''+CRLF+'(sezione [%s], riga ''%s'')', ['ALTAG.CFG', 'PrevInd','IDTipiDocVendita'])),
//                            PChar( APPTITLE ),
//                            MB_OK + MB_ICONWARNING );
//  end;


  finally
    Ini.free;
  end;
  if DiametroMin=0 then
    showmessage('ATTENZIONE: Non è stato impostato il diametro minimo nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''DiametroMin'')');
  if IDlavorazione=0 then
    showmessage('ATTENZIONE: Non è stata impostata la lavorazione nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''IDlav'')');
  if UtentiAbilitati='' then
    showmessage('ATTENZIONE: Non sono stati impostati gli utenti che hanno l''accesso alla pagina ''Dati Commerciali'' e che sono abilitati al salvataggio ' +
                'del Preventivo Industriale nel file di configurazione ''ALTAG.CFG'''+#13+#10+'(sezione [PrevInd], riga ''UtentiAbilitati'')');

  //  cv 24.02.06  spostato da sopra
  if (ext_pialtatg.found) and (ext_pialtatg.campi.idmateriale<>DatiPI.IdArticoC) and (DatiPI.IdArticoC<>IDCompDefault) then begin
    Showmessage('ATTENZIONE: Il preventivo è stato creato utilizzando un altro materiale.'+#13#10#13#10+
                'Aggiornare il preventivo premendo il tasto '''+(BtnStdOk.caption)+'''');
  end;

  {if DatiPI.NoMat then
    lblTipDoc.caption:=lblTipDoc.caption+' (Lavorazione)'
  else
    lblTipDoc.caption:=lblTipDoc.caption+' (Vendita)';}

  if F2Lav.KeyValue=0 then
    F2Lav.KeyValue:=IDlavorazione;

  SG_CSvil.Cells[0, 0]:='Sviluppo';
  SG_CSvil.Cells[1, 0]:='N. Cerchi';
  SG_CSvil.Cells[2, 0]:='Diametro';

  CalcolaTempo;   //  perchè quando lo fa nell'AssegnaControlliExtRig non ha ancora il DiametroMin, quindi è sbagliata
  BtnAggOV.enabled:=ValidaUtente;
end;

function TFrmPrevInd.getTipDocOV(IdComRig: Integer): Integer;
var
  Qry : TCSEQuery;
begin
  Qry := TCSEQuery.Create(nil);
  try
    Qry.DataBaseName := DBExec.DatabaseName;
    Qry.SQL.Text := 'select ct.IDTIPIDOC from COMTES ct inner join COMRIG cr on cr.IDCOMTES=ct.ID where cr.ID='+CS_Keyvalueto_SQLStr(IdComRig);
    try
      Qry.Open;
    except
      Result := -1;
    end;
    Result := Qry.FieldByName('IDTIPIDOC').AsInteger;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TFrmPrevInd.PageControl1Change(Sender: TObject);
var
  Msg: String;
begin
  if (PageControl1.Pages[1].Visible) and
     (PageControl1.Pages[1].Name = 'TabDatiCom') then
    // Verifica se l'utente è abiltato o non abilitato all'accesso alla pagina 'Dati Commerciali'
    if not ValidaUtente then begin
      PageControl1.ActivePage := TabDatiTec;
      Msg := 'Attenzione l''utente non ha l''accesso alla visualizzazione della pagina ''Dati Commerciali''.';
      Application.MessageBox(PChar(Msg),
                             PChar(Application.Title),
                             MB_ICONWARNING + MB_OK);
    end;
end;

procedure TFrmPrevInd.F2MaterialeKeyChange(Sender: TObject; NewKey,
  OldKey: Integer);
begin
  LeggiMateriale;
  edt_Costo.text:='0';
  edt_TCosto.text:='';
end;

procedure TFrmPrevInd.F2LavKeyChange(Sender: TObject; NewKey,
  OldKey: Integer);
begin
  LeggiMateriale;
end;

procedure TFrmPrevInd.LeggiMateriale;
var
  QryTmp: TCSEQuery;
  spessore: double;
begin
  if F2Materiale.Keyvalue>0 then begin
    QryTmp:=TCSEQuery.Create(nil);
    try
      QryTmp.DataBaseName := Azienda.DataBaseName;
      QryTmp.sql.clear;
      QryTmp.sql.add('select codice from classi '+
                     'where id='+inttostr(F2Materiale.qryf2.fieldbyname('idclassi').asinteger));
      QryTmp.open;
      if not QryTmp.isempty then begin
        Lab_Spessore.caption:=trim(formatvariant(QryTmp.fieldbyname('codice').asstring, importo));
      end
      else
        Lab_Spessore.caption:='0';

      try
        spessore:=zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
      except
        spessore:=0;
      end;

      if cercaextvelAltatg(F2Materiale.qryf2.fieldbyname('idgruppi').asinteger, DatiPI.idmarche, F2Lav.KeyValue, spessore) then begin
        try
          //  edt_Fmmmin.text:=formatvariant(QryextvelAltatg.fieldbyname(Lab_finitura.caption).asfloat, importo);
          edt_Fmmmin.text:=formatvariant(QryextvelAltatg.fieldbyname('Q2A').asfloat, importo);
        except
          on e: Exception Do Begin
            MsgError('Si è verificato un problema nella ricerca della velocità dei materiali.',
                     E.message);
          end;
        end;

        edt_SpazioRall.text:=formatvariant(QryextvelAltatg.fieldbyname('spazioRall').asfloat, importo);
        edt_Rall.text:=formatvariant(QryextvelAltatg.fieldbyname('percRall').asfloat, Perc, 2);
        Edt_TAttr.text:=formatvariant(QryextvelAltatg.fieldbyname('TAttrez').asfloat, quantita, 2);    //  lo faccio inserire manualmente dalla tabella di configurazione in minuti
        Edt_TForat.text:=formatvariant(QryextvelAltatg.fieldbyname('TempoFor').asfloat, quantita, 0);  //  lo faccio inserire manualmente dalla tabella di configurazione in secondi
      end;

    finally
      QryTmp.free;
    end;
  end;
end;

function TFrmPrevInd.cercaextvelAltatg(idgruppi, idmarche, idLav: integer; spessore: Double): boolean;
begin
  QryextvelAltatg.close;
  QryextvelAltatg.parambyname('idgruppi').asinteger:=idgruppi;
  QryextvelAltatg.parambyname('idmarche').asinteger:=idmarche;
  QryextvelAltatg.parambyname('idLav').asinteger:=idLav;
  QryextvelAltatg.parambyname('spessore').Asfloat:=spessore;
  QryextvelAltatg.open;
  result:= (not QryextvelAltatg.isempty);
end;

function TFrmPrevInd.cercaCompPrinc(ParidComrig: integer): boolean;
begin
  //  cerco l'eventuale componente principale
  //
  QrySelCompPrinc.close;
  QrySelCompPrinc.parambyname('idcomrig').asinteger:=ParidComrig;
  QrySelCompPrinc.open;
  result:= (not QrySelCompPrinc.isempty);
end;

function TFrmPrevInd.cercaOPDP(idOptes, idArtico: integer): boolean;
begin
  //  cerco l'eventuale componente principale
  //
  QrySelOPDP.close;
  QrySelOPDP.parambyname('idOptes').asinteger:=idOptes;
  QrySelOPDP.parambyname('idArtico').asinteger:=idArtico;
  QrySelOPDP.open;
  result:= (not QrySelOPDP.isempty);
end;

function TFrmPrevInd.cercaSdlMat(idopdtPadre, idArtico: integer): boolean;
begin
  //  cerco l'eventuale componente principale
  //
  QrySelSdlMat.close;
  QrySelSdlMat.parambyname('idopdt').asinteger:=idopdtPadre;
  QrySelSdlMat.parambyname('idArtico').asinteger:=idArtico;
  QrySelSdlMat.open;
  result:= (not QrySelSdlMat.isempty);
end;

function TFrmPrevInd.cercaSdlFas(idopdtPadre, idArtico: integer): boolean;
begin
  result:=False;
  if cercaSdlMat(idopdtPadre, idArtico{DatiPI.IdArticoPF}) then begin
    QrySelSdlFas.close;
    QrySelSdlFas.parambyname('idopsdlmat').asinteger:=QrySelSdlMat.fieldbyname('id').asinteger;
    QrySelSdlFas.open;
    result:= (not QrySelSdlFas.isempty);
  end;
end;

function TFrmPrevInd.cercaOPDTpf(idoptes, idArticoPF: integer): boolean;
begin
  //  cerco nella distinta tecnica il prodotto finito
  //
  QrySelOPDTpf.close;
  QrySelOPDTpf.parambyname('idoptes').asinteger:=idoptes;
  // QrySelOPDTpf.parambyname('idArtico').asinteger:=idArticoPF;
  QrySelOPDTpf.open;
  result:= (not QrySelOPDTpf.isempty);
end;



procedure TFrmPrevInd.Edt_SvilLinKeyPress(Sender: TObject; var Key: WideChar);
begin
  if sender is tedit then begin
    CheckImporto(Key, tedit(sender).text);
  end;
end;

procedure TFrmPrevInd.Edt_SvilLinExit(Sender: TObject);
begin
  if sender is tedit then begin
    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 2);
  end;

end;

procedure TFrmPrevInd.Edt_NProfExit(Sender: TObject);
begin
  if sender is tedit then
    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 0);
end;

procedure TFrmPrevInd.edt_NLastreExit(Sender: TObject);
begin
  if sender is tedit then
    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Quantita, 5);
end;

procedure TFrmPrevInd.Edt_TotTaglio1PzExit(Sender: TObject);
begin
  if sender is tedit then
    tedit(sender).text:=FormatVariant(ExtractVariant(tedit(sender).text, Importo), Importo);
end;

procedure TFrmPrevInd.Edt_RallExit(Sender: TObject);
begin
  if sender is tedit then
    tedit(sender).text:=formatvariant(ExtractVariant(tedit(sender).text, Importo), Perc, 2);
end;

procedure TFrmPrevInd.Edt_SvilLinChange(Sender: TObject);
begin
  if sender is tedit then begin
    if (tedit(sender).name=Edt_SvilLin.name) or
       (tedit(sender).name=Edt_NSpig.name) or
       (tedit(sender).name=Edt_SpazioRall.name) or
       (tedit(sender).name=Edt_Fmmmin.name) or
       (tedit(sender).name=Edt_Rall.name) or
       (tedit(sender).name=Edt_NProf.name) or
       (tedit(sender).name=Edt_TForat.name) or
       (tedit(sender).name=edt_SvilCerchi.name) then
      CalcolaTempo;
  end;
end;

procedure TFrmPrevInd.Edt_PezziLastraChange(Sender: TObject);
begin
  if sender is tedit then begin
    if (tedit(sender).name=Edt_PezziLastra.name) then
      CalcolaNLastre;
  end;
end;

procedure TFrmPrevInd.BtnStdAnnullaClick(Sender: TObject);
begin
  AggOPTESDatiCont;
  close;
end;

procedure TFrmPrevInd.PulisciDatiPI(myDatiPI: TDatiPI);
begin
  myDatiPI.idcliente:=0;
  myDatiPI.IdArticoPF:=0;
  myDatiPI.idmarche:=0;
  myDatiPI.idmagpre:=0;
  myDatiPI.DatRic:=0;
  myDatiPI.VarDb:='0000';
  myDatiPI.Notapf:='';
  myDatiPI.IdArticoC:=0;
  myDatiPI.IdOPDTC:=0;
  myDatiPI.idopsdlfas:=0;
  myDatiPI.NoMat:=False;
end;

function TFrmPrevInd.ValidaControlli: Boolean;
begin
  if ( IDTipiDocVendita.Count > 0 ) and (IDTipiDocVendita.IndexOf(IntToStr(getTipDocOV(idcomrig))) >= 0) then
  begin
    if ZeroIfNull(ExtractVariant(edt_Altezza.Text, Importo)) = 0 then
    begin
      Result := False;
      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire è necessario specificare il valore.' ),
                              PChar( APPTITLE ),
                              MB_OK + MB_ICONINFORMATION );
      if edt_Altezza.CanFocus then
        edt_Altezza.SetFocus;
      Exit;
    end;

    if ZeroIfNull(ExtractVariant(edt_Lunghezza.Text, Importo)) = 0 then
    begin
      Result := False;
      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire è necessario specificare il valore.' ),
                              PChar( APPTITLE ),
                              MB_OK + MB_ICONINFORMATION );
      if edt_Lunghezza.CanFocus then
        edt_Lunghezza.SetFocus;
      Exit;
    end;

    if ZeroIfNull(ExtractVariant(Edt_PezziLastra.Text, Importo)) = 0 then
    begin
      Result := False;
      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire è necessario specificare il valore.' ),
                              PChar( APPTITLE ),
                              MB_OK + MB_ICONINFORMATION );
      if Edt_PezziLastra.CanFocus then
        Edt_PezziLastra.SetFocus;
      Exit;
    end;

    if F2Materiale.KeyValue = 0 then
    begin
      Result := False;
      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire è necessario specificare il valore.' ),
                              PChar( APPTITLE ),
                              MB_OK + MB_ICONINFORMATION );
      if F2Materiale.CanFocus then
        F2Materiale.SetFocus;
      Exit;
    end;

//    if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
//    begin
//      Result := False;
//      Application.MessageBox( PChar( 'Attenzione valore obbligatorio.'+CRLF+'Per proseguire è necessario specificare il valore.' ),
//                              PChar( APPTITLE ),
//                              MB_OK + MB_ICONINFORMATION );
//      if edt_Costo.CanFocus then
//        edt_Costo.SetFocus;
//      Exit;
//    end;
  end;
  Result := True;
end;

function TFrmPrevInd.ValidaUtente: Boolean;
begin
  Result := True;

  if Pos(Utente.ConnectId, UtentiAbilitati) = 0 then
    Result := False;
end;

procedure TFrmPrevInd.BtnStdOkClick(Sender: TObject);
Var
  FOP: IPrev;
  // FPI: TPrev;
  // FrmPrdOPDT: IFrmPrdStd;
  idoptes, idDTpadre: Integer;
  isInIns: Boolean;
begin
  inherited;
  {  cv 08.03.04  Finire di implememtare la visualizzazione dell'op, in quanto
                  ci sono dei problemi perchè i documenti di vendita sono modali
                  e quelli della produzione no  }
   //  if CalcolaPeso(true)>0 then begin
   //SD 04/10/2010 : RI #9595
   if not ValidaControlli then
    Exit;
   
   if CalcolaPeso(false)>0 then begin
    if F2IdTipiDoc.keyvalue>0 then begin
      //  if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin   cv  01.03.06  disponibile dalla 2.18
      if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then begin
        idoptes:=0;

        if ext_pialtatg.found then begin
          FOP.seek('id', ext_pialtatg.campi.idoptes);
        end
        else begin
          FOP.ResetCampi;
        end;

        AggOPTES(FOP);

        if FOP.Found then begin   //  inserimento o modifica optes ok
          idoptes :=fop.GetCampi('id');
          Lab_numPrev.caption:=trim(fop.GetCampi('annop'))+' '+trim(fop.GetCampi('numop'));
          //  cerco il padre
          //
          if cercaOPDTpf(idoptes, DatiPI.IdArticoPF) then
            idDTpadre:=QrySelOPDTpf.fieldbyname('id').asinteger
          else
            idDTpadre:=0;

          AggOPDT(FOP, idoptes, idDTpadre, isInIns);

          // if DatiPI.NoMat then begin  //  cv dal 02.2006 possono modificare il costo, quindi lo passo sempre
            AggOPDP(FOP, idoptes, idDTpadre, isInIns);
          // end;

          AggSdlMat(FOP, idoptes, idDTpadre);
          AggSdlFas(FOP, idoptes, idDTpadre);

          {   cv 01.03.06  dalla 2.18 è interfacciata
          //  nella 2.16 non è interfacciata
          FPI := TPrev.Create(DBExec, Utente);
          try
            FPI.RicValTeoPI(idoptes);
            Abort:=False;
          finally
            FPI.free;
          end;}

          FOP.RicValTeoPI(idoptes);

          FOP.seek('id', idoptes);   //  mi riposiziono sul preventivo per rileggere i valori appena ricalcolati
          AssegnaCampiExtRig(idoptes);
          AssegnaControlliDatiComPI(FOP);
          AskAggPrezzoComRig:=1;  //  il preventivo è stato modificato: in fase di chiusura verra chiesto all'utente se desidera aggiornare la commessa
          // isInIns:=False;


          AggiornaPesi(idoptes, F2Materiale.KeyValue); // SF...31/07/2007
          if ZeroIfNull(ExtractVariant(edt_Costo.Text, Importo)) = 0 then
          begin
            Application.MessageBox( PChar( 'Attenzione.'+CRLF+'il salvataggio è avvenuto correttamente ma il costo non è valorizzato.' ),
                                    PChar( APPTITLE ),
                                    MB_OK + MB_ICONINFORMATION );
            Exit;
          end;

        end;

        // CostoTot:=FOP.GetCampi('Valteo');
        // Lab_numPrev.caption:=Lab_numPrev.caption+'   Costo: '+formatvariant(CostoTot, importo, 2);
        // Lab_CosMA.caption:='Costo Materiali: '+formatvariant(FOP.GetCampi('CosMA')+FOP.GetCampi('RicMA'), importo, 2);
        // Lab_CosLI.caption:='Costo Lavorazioni Interne: '+formatvariant(FOP.GetCampi('CosLI')+FOP.GetCampi('RicLI'), importo, 2);
        // Lab_CosLE.caption:='Costo Lavorazioni Esterne: '+formatvariant(FOP.GetCampi('CosLE')+FOP.GetCampi('RicLE'), importo, 2);

        // FOP.RicValTeo(idoptes);
        // FOP.RicalcoloOP(nil, inttostr(idopdt), nil, nil, nil, nil, nil, false, res);

        if idoptes>0 then begin
          //FOP.seek('id', idoptes);   //  mi riposiziono sul preventivo per rileggere i valori appena ricalcolati
          // AssegnaCampiExtRig(idoptes);
          //AssegnaControlliDatiComPI(FOP);
          BtnCopia.Enabled:=true;
        // end;

          {FrmPrdOPDT := (PrdService as IPrdFormCreator).CreaIFrmPrd(Self, 'FrmPIDT', idoptes, livello) as IFrmPrdStd;

          if (Assigned(FrmPrdOPDT)) then begin
            //tform(FrmPrdOPDT).formstyle:=fsnormal;
            //tform(FrmPrdOPDT).visible:=false;
            //tform(FrmPrdOPDT).close;
            //FrmPrdOPDT.Showmodal;
            //tform(FrmPrdOPDT).close;
            //tform(FrmPrdOPDT).free;
          end
          else
            ShowMessage('ATTENZIONE: Impossibile visualizzare il preventivo creato');}
        end;
      end
      else begin
        Showmessage('ATTENZIONE: Modulo produzione non disponibile');
      end;
    end
    else begin
      Showmessage('ATTENZIONE: Inserire il tipo documento');
    end;
  end;
end;

procedure TFrmPrevInd.AggOPTES(FOP: IPrev);
begin
  if not FOP.Found then begin
    FOP.SetCampi('IdComRig', idcomrig);        //id riga commessa di riferimento
    FOP.SetCampi('DatEmi', Azienda.Data);      // data emissione ... obbligatoria
    FOP.SetCampi('AnnOP',  Year(Azienda.Data)); //Year); //anno ... obbligatorio
    FOP.SetCampi('Stato',  'P');	            //stato ... obbligatorio
    FOP.SetCampi('OPMan',  False);              //generazione manuale ... obbligatorio
    FOP.SetCampi('IdTipiDoc', F2IdTipiDoc.keyvalue); //id tipo documento ... obbligatorio
    FOP.SetCampi('TipNum', F2IdTipiDoc.qryf2.fieldbyname('TIPNUM').asstring); // tipo numerazione ... obbligatorio
    FOP.SetCampi('IdCli',  DatiPI.IdCliente); //id cliente
    FOP.SetCampi('DATVAL', Azienda.Data); //	data validità DB
    FOP.SetCampi('DatRic', DatiPI.DatRic); //	data richiesta
    FOP.SetCampi('DatRpr', DatiPI.DatRic); //	data richiesta prelievo
    FOP.SetCampi('idAllVer', DatiPI.idmagpre); //   id magazzino di prelievo

    QryNextNumOP.Close;
    QryNextNumOP.parambyname('ANNOP').asinteger:=Year(Azienda.Data);
    QryNextNumOP.parambyname('IDTIPIDOC').asinteger:=F2IdTipiDoc.keyvalue;
    QryNextNumOP.Open;
    FOP.SetCampi('NumOP', QryNextNumOP.fieldbyname('ULTIMO').asinteger+1); //numero ... obbligatorio
  end
  else begin
    AggiornaCosti;
  end;

  AssegnaCampiOptesDatiCont(FOP);

  FOP.SetCampi('QtaOP', zeroifnull(extractvariant(Lab_Qta.caption, quantita)));    //quantità da produrre ... obbligatoria   cv controllare
  FOP.SetCampi('IdArtico', DatiPI.IdArticoPF);  //id articolo ... obbligatorio  //  può essere stato modificato sulla riga di commessa, quindi lo riscrivo
  FOP.SetCampi('CODVARDB', DatiPI.VarDb);       // codice variante
  FOP.SetCampi('Note', DatiPI.Notapf);

  if not FOP.Found then
    FOP.GeneraOP
  else begin
    // DF + Alef 15/12/2011: Tolto il ModOPTes
    //FOP.ModOPTes(ext_pialtatg.campi.idoptes);
    FOP.Modifica;
    FOP.RicValTeoPI(FOP.CampiObj['Id']);
  end;
end;

procedure TFrmPrevInd.AggOPTESDatiCont;
var
  FOP: IPrev;
begin
  if ext_pialtatg.found then begin
    // if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FOP) then begin  cv  01.03.06  disponibile dalla 2.18
    if GetInterfOggetto( 'ObjPrdPrev', 'OPTes', IPrev, FOP) then begin
      FOP.seek('id', ext_pialtatg.campi.idoptes);
      if FOP.Found then begin
        AssegnaCampiOptesDatiCont(FOP);
        // DF + Alef 15/12/2011: Tolto il ModOPTes
        //FOP.ModOPTes(ext_pialtatg.campi.idoptes);
        FOP.Modifica;
        FOP.RicValTeoPI(FOP.CampiObj['Id']);
      end;
    end;
  end;
end;

procedure TFrmPrevInd.AssegnaCampiOptesDatiCont(FOP: IPrev);
begin
  FOP.SetCampi('RICMA', zeroifnull(ExtractVariant(edtImpMa.text, Importo)));
  FOP.SetCampi('RICLI', zeroifnull(ExtractVariant(edtImpLi.text, Importo)));
  FOP.SetCampi('RICLE', zeroifnull(ExtractVariant(edtImpLe.text, Importo)));
  FOP.SetCampi('RICMC', zeroifnull(ExtractVariant(edtImpUl.text, Importo)));
  FOP.SetCampi('IMPSC', zeroifnull(ExtractVariant(edtImpSc.text, Importo)));
  FOP.SetCampi('PEMCMA', zeroifnull(ExtractVariant(edtPeMCMa.text, Importo)));
  FOP.SetCampi('PEMCLI', zeroifnull(ExtractVariant(edtPeMCLi.text, Importo)));
  FOP.SetCampi('PEMCLE', zeroifnull(ExtractVariant(edtPeMCLe.text, Importo)));
  FOP.SetCampi('PEULMC', zeroifnull(ExtractVariant(edtPeUlMC.text, Importo)));
  FOP.SetCampi('PEULSC', zeroifnull(ExtractVariant(edtPeUlSc.text, Importo)));
  FOP.SetCampi('VALTEO', zeroifnull(ExtractVariant(edtTotale.text, Importo)));
end;

procedure TFrmPrevInd.AggOPDT(FOP: IPrev; idoptes, idDTpadre: integer; var isInIns: Boolean);
var
  idt, mseq, idmat: Integer;
begin
  if QrySelOPDTpf.fieldbyname('idartico').asinteger<>DatiPI.IdArticoPF then begin
    QryUpdtOpdtPF.parambyname('id').asinteger:=idDTpadre;
    QryUpdtOpdtPF.parambyname('idArtico').asinteger:=DatiPI.IdArticoPF;
    QryUpdtOpdtPF.execsql;
    QryUpdtOpSDLMatPF.parambyname('idopdt').asinteger:=idDTpadre;
    QryUpdtOpSDLMatPF.parambyname('idArtico').asinteger:=DatiPI.IdArticoPF;
    QryUpdtOpSDLMatPF.execsql;
  end;

  idt:=DatiPI.IdOPDTC;    //  sulla DT del componente mi sono posizionato all'ingresso della form (il componente del PI è sempre il primo del livello 1 avente come padre il PF). In inserimento è vuoto
  if idt=0 then
    idt:=-1;

  FOP.SeekDT('id', idt);  //  se idt=-1 imposta FoundDT a false
  if idt<=0 then begin
    //  Inserimento del componente (no modifica)
    //
    mseq:=2000;
    FOP.SetCampiOPDT('idoptes',  idoptes);
    FOP.SetCampiOPDT('idpadre',  idDTpadre);
    FOP.SetCampiOPDT('sequen',   mseq);
    FOP.SetCampiOPDT('livello',  1);
  end;


  if F2Materiale.KeyValue>0 then
    idmat:=F2Materiale.KeyValue
  else
    idmat:=IDCompDefault;

  isInIns:=(QrySelCompPrinc.isempty or ((not QrySelCompPrinc.isempty) and
           (QrySelCompPrinc.fieldbyname('idartico').asinteger<>idmat)));

  FOP.SetCampiOPDT('idartico', idmat);

  FOP.SetCampiOPDT('Note', trim(edt_Altezza.text)+' x '+trim(edt_Lunghezza.text));
  FOP.SetCampiOPDT('qtimco', CalcolaPeso(false));

  if idt<0 then
    idt:=0;
  FOP.AggOPDT(idt);
  if isInIns or (DatiPI.IdOPDTC=0) then begin
    if cercaCompPrinc(idcomrig) then begin  //  aggiorno DatiPI. cosi se premo salva pi un'altra volta non lo accoda
      DatiPI.IdOPDTC:=QrySelCompPrinc.fieldbyname('id').asinteger;
    end;
  end;
  DatiPI.IdArticoC:=F2Materiale.KeyValue;   //  cosi rimane allineato
end;

procedure TFrmPrevInd.AggOPDP(FOP: IPrev; idoptes, idDTpadre: integer; isInIns: Boolean);
var
  idmat: integer;
begin
  if F2Materiale.KeyValue>0 then
    idmat:=F2Materiale.KeyValue
  else
    idmat:=IDCompDefault;

  if cercaOPDP(idoptes, idmat) then begin
    FOP.SeekDP('id',  QrySelOPDP.fieldbyname('id').asinteger);
    {FOP.SetCampiOPDP('cosuni',  0);
    FOP.SetCampiOPDP('tipcos',  '');}
    // if (not isInIns) or (zeroifnull(extractvariant(edt_Costo.Text, Importo))=0) then begin
    if isInIns or (zeroifnull(extractvariant(edt_Costo.Text, Importo))=0) then begin
      //  cv  28.02.06  In inserimento non sono valorizzati (li calcola il PI), quindi andrebbe ad azzerare quelli calcolati dal PI
      //  cv 14.03.06  Se sono a zero (sono in iserimento oppure ho cambiato il materiale) prendo quelli ricalcolati dal PI
      FOP.SetCampiOPDP('cosuni', QrySelOPDP.fieldbyname('cosuni').asFloat);
      FOP.SetCampiOPDP('tipcos', QrySelOPDP.fieldbyname('tipcos').asString);
    end
    else begin
      //  cv  28.02.06  In inserimento non sono valorizzati (li calcola il PI), quindi andrebbe ad azzerare quelli calcolati dal PI
      FOP.SetCampiOPDP('cosuni',  zeroifnull(extractvariant(edt_Costo.Text, Importo)));
      FOP.SetCampiOPDP('tipcos',  edt_TCosto.Text);
    end;
    FOP.AggOPDP(idoptes, idmat,
                CalcolaPeso(false)-QrySelOPDP.fieldbyname('qtimco').asfloat,      //  perchè va in somma
                QrySelOPDP.fieldbyname('tipord').asstring,
                idDTpadre);
  end;
end;

procedure TFrmPrevInd.AggSdlMat(FOP: IPrev; idoptes, idDTpadre: integer);
var
  idMat: integer;
  FTmpOP: IOrPr;
begin
  if cercaSdlMat(idDTpadre, DatiPI.IdArticoPF) then
    idMat:=QrySelSdlMat.fieldbyname('id').asinteger
  else
    idMat:=0;

  if idMat=0 then
    idMat:=-1;

  if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then begin
    FTmpOP.Seek('id', idoptes);
    FTmpOP.SeekSdlM('id', idMat);  //  se idMat=-1 imposta FoundDT a false
    if idMat=-1 then begin
      //  Inserimento del Materiale (no modifica)
      //
      FTmpOP.SetCampiSdlM('idoptes',  idoptes);
      FTmpOP.SetCampiSdlM('idopdt',  idDTpadre);
      FTmpOP.SetCampiSdlM('idartico',  DatiPI.IdArticoPF);
      FTmpOP.SetCampiSdlM('sequen',  10);
    end;

    FTmpOP.SetCampiSdlM('qtimco',  zeroifnull(extractvariant(Lab_Qta.caption, quantita)));
    FTmpOP.ModificaSdlM;  //  cv  01.03.06  nei PI non è interfacciato: mi appoggio all'OP
    FOP.Seek('id', idoptes);
    FOP.SeekSdlM('id', idMat);
  end;
end;

procedure TFrmPrevInd.AggSdlFas(FOP: IPrev; idoptes, idDTpadre: integer);
var
  {idFas: integer;}
  FTmpOP: IOrPr;
begin
  if cercaSdlFas(idDTpadre, DatiPI.IdArticoPF) then
    DatiPI.idopsdlfas:=QrySelSdlFas.fieldbyname('id').asinteger
  else
    DatiPI.idopsdlfas:=0;

  {if idFas=0 then
    idFas:=-1;}


  if DatiPI.idopsdlfas=0 then begin
    //  Inserimento della Fase (no modifica)
    //
    // idFas:=FOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, IDlavorazione, '', False);
    // DatiPI.idopsdlfas:=FOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, F2Lav.KeyValue, '', False);   //  cv 22.02.06  ora lo possono modificare
    if GetInterfOggetto( 'objPrdOrPr', 'OPTes', IOrPr, FTmpOP) then begin
      FTmpOP.seek('id', idoptes);
      //  cv  01.03.06  nei PI non è interfacciato: mi appoggio all'OP
      DatiPI.idopsdlfas:=FTmpOP.AutoAppFase(idoptes, QrySelSdlMat.fieldbyname('id').asinteger, 10, F2Lav.KeyValue, '', False);   //  cv 22.02.06  ora lo possono modificare
      FOP.seek('id', idoptes);
    end;



    {FOP.SetCampiSdlF('idoptes',  idoptes);
    FOP.SetCampiSdlF('idopdt',  idDTpadre);
    FOP.SetCampiSdlF('idartico',  DatiPI.IdArticoPF);
    FOP.SetCampiSdlF('sequen',  10);}
  end;

  if DatiPI.idopsdlfas>0 then begin
    FOP.SeekSdlF('id', DatiPI.idopsdlfas);
    FOP.SetCampiSdlF('idlav', F2Lav.KeyValue);   // cv 23.02.06  per implementare la modifica della fase
    FOP.SetCampiSdlF('temavv',  SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo)))/(24*60));
    FOP.SetCampiSdlF('temese',  SecSToSecC(SecstoMin(MintoSecs(zeroifnull(ExtractVariant(Edt_TempoPrev.text, Importo)))*
                                                               zeroifnull(extractvariant(Lab_Qta.caption, quantita))))/(24*60));
    //FOP.SetCampiSdlF('temese',  SecSToSecC(zeroifnull(ExtractVariant(Edt_TempoPrev.text, Importo)))/(24*60));
    FOP.AggOPSdlF(DatiPI.idopsdlfas);
  end;
end;

procedure TFrmPrevInd.AssegnaCampiExtRig(idoptes: integer);
var
  i: integer;
  tmp: string;
begin
  ext_pialtatg.campi.idoptes:=idoptes;
  ext_pialtatg.campi.idprodfin:=DatiPI.idarticoPF;
  ext_pialtatg.campi.idmateriale:=F2Materiale.keyvalue;
  ext_pialtatg.campi.idopsdlfas:=DatiPI.idopsdlfas;
  ext_pialtatg.campi.spaziorall:=zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
  ext_pialtatg.campi.percrall:=zeroifnull(ExtractVariant(Edt_Rall.text, Importo));
  ext_pialtatg.campi.dimfor:=zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
  ext_pialtatg.campi.tforat:=zeroifnull(ExtractVariant(Edt_TForat.text, Importo))/(24*60*60);   //  è espresso in secondi
  ext_pialtatg.campi.tattr:=SecSToSecC(zeroifnull(ExtractVariant(Edt_TAttr.text, Importo)))/(24*60);
  ext_pialtatg.campi.svillin:=zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
  ext_pialtatg.campi.svilcer:=zeroifnull(ExtractVariant(edt_SvilCerchi.text, Importo));
  ext_pialtatg.campi.nprof:=ExtractVariant(Edt_NProf.text, Importo);
  ext_pialtatg.campi.nspig:=ExtractVariant(Edt_NSpig.text, Importo);
  ext_pialtatg.campi.lastraalt:=zeroifnull(ExtractVariant(edt_Altezza.text, Importo));
  ext_pialtatg.campi.lastralun:=zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo));
  ext_pialtatg.campi.nlastre:=ExtractVariant(edt_NLastre.text, Importo);
  ext_pialtatg.campi.pezzixlastra:=zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo));
  tmp:='';
  for i:=1 to SG_CSvil.rowcount do begin
    tmp:=tmp+floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo)))+';'+
             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+';'+
             floattostr(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo)))+';';
    if length(tmp)>sizeof(ext_pialtatg.campi.sviluppo) then
      ShowMessage('ATTENZIONE: riga '+inttostr(i)+' non salvata correttamente.');
  end;
  ext_pialtatg.campi.sviluppo:=tmp;
  if ext_pialtatg.found then
    ext_pialtatg.modifica
  else
    ext_pialtatg.insert;
end;

procedure TFrmPrevInd.AssegnaControlliExtRig;
var
  i: integer;
  tmp: string;
begin
  if DatiPI.IdArticoC<>0 then
    F2Materiale.keyvalue:=DatiPI.IdArticoC  // se il preventivo è gia inserito prendo il componente del preventivo
  else
    F2Materiale.keyvalue:=ext_pialtatg.campi.idmateriale;

  Edt_SpazioRall.text:= FormatVariant(ext_pialtatg.campi.spaziorall, Quantita, 2);
  Edt_Rall.text:=FormatVariant(ext_pialtatg.campi.percrall, Perc, 2);
  Edt_Fmmmin.text:=FormatVariant(ext_pialtatg.campi.dimfor, Quantita, 2);
  Edt_TForat.text:=FormatVariant(ext_pialtatg.campi.tforat*(24*60*60), Quantita, 0);  //  è espresso in secondi
  Edt_TAttr.text:=FormatVariant(SecCToSecS(ext_pialtatg.campi.tattr*(24*60)), Quantita, 2);
  Edt_NProf.text:=FormatVariant(ext_pialtatg.campi.nprof, Quantita, 0);
  Edt_NSpig.text:=FormatVariant(ext_pialtatg.campi.nspig, Quantita, 0);
  edt_Altezza.text:=FormatVariant(ext_pialtatg.campi.lastraalt, Quantita, 2);
  edt_Lunghezza.text:=FormatVariant(ext_pialtatg.campi.lastralun, Quantita, 2);
  edt_NLastre.text:=FormatVariant(ext_pialtatg.campi.nlastre, Quantita, 0);
  Edt_PezziLastra.text:=FormatVariant(ext_pialtatg.campi.pezzixlastra, Quantita, 0);
  Edt_SvilLin.text:=FormatVariant(ext_pialtatg.campi.svillin, Quantita, 2);
  edt_SvilCerchi.text:=FormatVariant(ext_pialtatg.campi.svilcer, Quantita, 2);

  tmp:=ext_pialtatg.campi.sviluppo;
  for i:=1 to SG_CSvil.rowcount do begin
    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3))<>'' then
      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3)))<>0 then
        SG_CSvil.Cells[0, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3)), Quantita, 2);
    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1))<>'' then
      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)))<>0 then
        SG_CSvil.Cells[1, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)), Quantita, 0);
    if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2))<>'' then
      if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)))<>0 then
        SG_CSvil.Cells[2, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)), Quantita, 2);
  end;
  CalcolaTempo;
end;

procedure TFrmPrevInd.FormCreate(Sender: TObject);
begin
  ext_pialtatg := Text_pialtatg.Create('ext_pialtatg', DbExec, Utente);
end;

procedure TFrmPrevInd.FormDestroy(Sender: TObject);
begin
  ext_pialtatg.free;
  FreeAndNil(IDTipiDocVendita);
end;

procedure TFrmPrevInd.SG_CSvilKeyPress(Sender: TObject; var Key: WideChar);
begin
  CheckImporto(Key, tedit(sender).text);
end;

procedure TFrmPrevInd.SG_CSvilSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  if ACol=0 then
    CalcolaSvilLin
  else if (ACol=1) or (ACol=2) then
    CalcolaSvilCerchi;
end;

procedure TFrmPrevInd.CalcolaSvilLin;
var
  tmp:double;
  i: integer;
begin
  tmp:=0;
  for i:=1 to SG_CSvil.rowcount do begin
    tmp:=tmp+zeroifnull(ExtractVariant(SG_CSvil.Cells[0, i], Importo));
  end;
  Edt_SvilLin.text:=FormatVariant(tmp, Quantita, 2);
end;

procedure TFrmPrevInd.CalcolaSvilCerchi;
var
  tmp:double;
  i: integer;
begin
  tmp:=0;
  for i:=1 to SG_CSvil.rowcount do begin
    tmp:=tmp+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo));
  end;
  edt_SvilCerchi.text:=FormatVariant(tmp*3.14, Quantita, 2);
end;

procedure TFrmPrevInd.CalcolaNLastre;
begin
  // edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))+0.499, Quantita, 0);
  if zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo))<>0 then
    edt_NLastre.text:=FormatVariant(zeroifnull(extractvariant(Lab_Qta.caption, quantita))/zeroifnull(ExtractVariant(Edt_PezziLastra.text, Importo)), Quantita, 5);
end;

procedure TFrmPrevInd.CalcolaTempo;
var
  TLinV, TLinL, TCerV, TCerL, TProf, svilin, NProf, nspig, srall, velocita, PercRall, TForat, tmp :double;
  i: integer;
begin
  TLinV:=0;   //  Tempo lineare veloce
  TLinL:=0;   //  Tempo lineare lento
  TCerV:=0;   //  Tempo cerchi veloce
  TCerL:=0;   //  Tempo cerchi lento
  // TProf:=0;   //  Tempo Profili (in secondi)
  svilin:=zeroifnull(ExtractVariant(Edt_SvilLin.text, Importo));
  NProf:=zeroifnull(ExtractVariant(Edt_NProf.text, Importo));
  nspig:=zeroifnull(ExtractVariant(Edt_NSpig.text, Importo));
  srall:=zeroifnull(ExtractVariant(Edt_SpazioRall.text, Importo));
  velocita:=zeroifnull(ExtractVariant(Edt_Fmmmin.text, Importo));
  PercRall:=zeroifnull(ExtractVariant(Edt_Rall.text, Perc))/100;
  TForat:=zeroifnull(ExtractVariant(Edt_TForat.text, Importo));   //  è espresso in secondi
  TProf:=TForat*NProf;

  if velocita<>0 then begin
    TLinV:=SecCToSecS((svilin-nspig*2*srall)/velocita);
    if PercRall<>0 then
      TLinL:=SecCToSecS((nspig*2*srall)/(velocita*PercRall));

    for i:=1 to SG_CSvil.rowcount do begin
      if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<>0 then begin
        if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<DiametroMin then begin
          if PercRall<>0 then
            TCerL:=SecSToMin(MinToSecS(TCerL)+
                            (TForat*zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+
                             MinToSecS((SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14)/(velocita*PercRall)))));
        end
        else begin      
          tmp:=MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*(zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14-2*srall))/(velocita)));



          if PercRall<>0 then
            tmp:=tmp+MinToSecS(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*2*srall)/(velocita*PercRall)));

          TCerV:=SecSToMin(MinToSecS(TCerV)+
                          (TForat*zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo)))+
                          tmp);
        end;
      end;
    end;


    (*for i:=1 to SG_CSvil.rowcount do begin
      if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<>0 then begin
        if zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))<DiametroMin then begin
          if PercRall<>0 then
            {TCerL:=SecSToMin(MinToSecS(TCerL)+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*
                                            (TForat+(SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14)/(velocita*PercRall)))));}
            TCerL:=SecSToMin(MinToSecS(TCerL)+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*
                                            (TForat+MinToSecS((SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14)/(velocita*PercRall))))));
        end
        else begin
          tmp:=SecCToSecS((zeroifnull(ExtractVariant(SG_CSvil.Cells[2, i], Importo))*3.14-2*srall)/(velocita));
          if PercRall<>0 then
            tmp:=SecSToMin(MinToSecS(tmp)+MinToSecS(SecCToSecS((2*srall)/(velocita*PercRall))));

          TCerV:=SecSToMin(MinToSecS(TCerV)+zeroifnull(ExtractVariant(SG_CSvil.Cells[1, i], Importo))*(TForat+MinToSecS(tmp)));
        end;
      end;
    end;*)
  end;

  Edt_TempoPrev.text:=FormatVariant(SecSToMin(MinToSecS(TLinV)+
                                              MinToSecS(TLinL)+
                                              MinToSecS(TCerV)+
                                              MinToSecS(TCerL)+
                                              TProf), Quantita, 2);
end;

function TFrmPrevInd.CalcolaPeso(msg: boolean): double;
var
  LTmp,
  LCOORD: Double;

//   spessore: double;
  // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
  function GetCOORD(const AIdArtico: Integer): Integer;
  var
    LQTmp: TCSEQuery;
  begin
    Result := 0;
    LQTmp := TCSEQuery.Create(nil);
    try
      LQTmp.DataBaseName := Azienda.DatabaseName;

      LQTmp.sql.clear;
      LQTmp.SQL.Text := ''
                      + ' SELECT C.COORD '
                      + ' FROM ARTICO A '
                      + ' INNER JOIN MAGCOLORI C ON C.ID=A.IDMAGCOLORI '
                      + ' WHERE A.ID = ' + CS_VariantTo_SqlStr(AIdArtico);

      LQTmp.open;

      if not LQTmp.Eof then
      begin
        Result := LQTmp.FieldByName('COORD').AsInteger;
      end;
    finally
      FreeAndNil(LQTmp);
    end;
  end;
  // IK 06/12/2024

begin
  {try
    spessore:=zeroifnull(extractvariant(Lab_Spessore.caption, MaxPrec));
  except
    spessore:=0;
  end;}
  // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
//  result  := (zeroifnull(ExtractVariant(edt_Altezza.text, Importo))*
//              zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo))/1000000)*
//              zeroifnull(ExtractVariant(edt_NLastre.text, Importo))*
//              F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;


  LTmp  := (zeroifnull(ExtractVariant(edt_Altezza.text, Importo))*
            zeroifnull(ExtractVariant(edt_Lunghezza.text, Importo))/1000000)*
            zeroifnull(ExtractVariant(edt_NLastre.text, Importo))*
            F2Materiale.qryf2.fieldbyname('UMCO1').asfloat;

  LCOORD := GetCOORD(F2Materiale.KeyValue);

  if LCOORD = 0 then
  begin
    result := LTmp;
  end
  else
  begin
     result := CSRoundImp(((LTmp/ LCOORD) * 1000000),6);
  end;

  // IK 06/12/2024 RI 53799

  if result=0 then begin
    if msg then begin
      if messagedlg('ATTENZIONE:'+#13#10#10+'Non è stata indicata la quantità di materia prima.'+#13#10#10+
              'Premere ok per impostarla ad uno e continuare oppure premere cancel per indicarla manualmente.', mtWarning, [mbOK, mbCancel], 0)=mrok then
       result:=1
    end
    else
      result:=1;
  end;
end;

function TFrmPrevInd.SecCToSecS(MinSecC: double): double;
var
  TmpMin, TmpSec: Double;
begin
  {  Trasforma i secondi espressi in centesimi in secondi espressi in sessantesimi  }
  TmpMin:=int(MinSecC);
  TmpSec:=Frac(MinSecC)*0.6;
  result:=TmpMin+TmpSec;
end;

function TFrmPrevInd.SecSToSecC(MinSecS: double): double;
var
  TmpMin, TmpSec: Double;
begin
  {  Trasforma i secondi espressi in sessantesimi in secondi espressi in centesimi  }
  TmpMin:=int(MinSecS);
  TmpSec:=Frac(MinSecS)/0.6;
  result:=TmpMin+TmpSec;
end;

function TFrmPrevInd.MinToSecS(Minuti: double): double;
var
  TmpMin, TmpSec: Integer;
begin
  TmpMin:=Trunc(minuti)*60;
  TmpSec:=Trunc(strtofloat(Floattostr(Frac(Minuti)*100+0.5)));
  if TmpSec>=60 then begin
    TmpSec:=TmpSec-60;
    TmpMin:=TmpMin+60;
  end;
  result:=TmpMin+TmpSec;
end;

function TFrmPrevInd.SecSToMin(Secondi: double): double;
var
  TmpMin, TmpSec: Double;
begin
  TmpMin:=int(Secondi/60);
  TmpSec:=(Secondi-TmpMin*60)/100;
  result:=TmpMin+TmpSec;
end;

procedure TFrmPrevInd.edtPeMCMaKeyPress(Sender: TObject; var Key: WideChar);
begin
  if sender is tedit then begin
    CheckImporto(Key, tedit(sender).text);
  end;
end;

procedure TFrmPrevInd.edtImpMaKeyPress(Sender: TObject; var Key: WideChar);
begin
  if sender is tedit then begin
    CheckImporto(Key, tedit(sender).text);
    {  Se imputo l'importo a mano azzero la percentuale (se no all'uscita dalla percentuale l'importo viene ricalcolato)}
    if tedit(sender).name=edtImpMa.name then begin
      edtPeMCMa.text:='0';
    end
    else if tedit(sender).name=edtImpLi.name then begin
      edtPeMCLi.text:='0';
    end
    else if tedit(sender).name=edtImpLe.name then begin
      edtPeMCLe.text:='0';
    end
    else if tedit(sender).name=edtImpUl.name then begin
      edtPeUlMC.text:='0';
    end
    else if tedit(sender).name=edtImpSc.name then begin
      edtPeUlSc.text:='0';
    end;
  end;
end;

procedure TFrmPrevInd.edtPeMCMaExit(Sender: TObject);
begin
  if sender is tedit then begin
    if tedit(sender).name=edtPeMCMa.name then begin
      if zeroifnull(ExtractVariant(edtPeMCMa.text, Importo))<>0 then
        edtImpMa.text:=formatvariant((zeroifnull(ExtractVariant(edtMa.text, Importo))*
                                      zeroifnull(ExtractVariant(edtPeMCMa.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
      else
        edtImpMa.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);

      edtMaRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
                                    zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
    end
    else if tedit(sender).name=edtPeMCLi.name then begin
      if zeroifnull(ExtractVariant(edtPeMCLi.text, Importo))<>0 then
        edtImpLi.text:=formatvariant((zeroifnull(ExtractVariant(edtLi.text, Importo))*
                                      zeroifnull(ExtractVariant(edtPeMCLi.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
      else
        edtImpLi.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);

      edtLiRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
                                    zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
    end
    else if tedit(sender).name=edtPeMCLe.name then begin
      if zeroifnull(ExtractVariant(edtPeMCLe.text, Importo))<>0 then
        edtImpLe.text:=formatvariant((zeroifnull(ExtractVariant(edtLe.text, Importo))*
                                      zeroifnull(ExtractVariant(edtPeMCLe.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro)
      else
        edtImpLe.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);

      edtLeRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))+
                                    zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
    end
    else if (tedit(sender).name=edtPeUlMC.name) and (zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))=0) then begin
      edtImpUl.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li farò dentro la CalcolaTotDatiCom
    end
    else if (tedit(sender).name=edtPeUlSc.name) and (zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))=0)then begin
      edtImpSc.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);  //  se ho azzerato la percentuale azzero l'importo. i calcoli li farò dentro la CalcolaTotDatiCom
    end;

    CalcolaTotDatiCom;
    {if (tedit(sender).name=edtPeUlMC.name) and (zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))<>0) then begin
      edtImpUl.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
                                    zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
    end
    else if (tedit(sender).name=edtPeUlSc.name) and (zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))<>0)then begin
      edtImpSc.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
                                    zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
    end;}

    tedit(sender).text:=formatvariant(zeroifnull(ExtractVariant(tedit(sender).text, Importo)), perc, 2);
    // CalcolaTotDatiCom;
  end;
end;

procedure TFrmPrevInd.edtImpMaExit(Sender: TObject);
begin
  if sender is tedit then begin
    if tedit(sender).name=edtImpMa.name then begin
      {if zeroifnull(ExtractVariant(edtMa.text, Importo))<>0 then begin
        edtPeMCMa.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))/
                                       zeroifnull(ExtractVariant(edtMa.text, Importo))*100), perc, 2);
      end
      else
        edtPeMCMa.text:='0';}
      edtMaRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
                                    zeroifnull(ExtractVariant(edtMa.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
    end
    else if tedit(sender).name=edtImpLi.name then begin
      {if zeroifnull(ExtractVariant(edtLi.text, Importo))<>0 then begin
        edtPeMCLi.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))/
                                       zeroifnull(ExtractVariant(edtLi.text, Importo))*100), perc, 2);
      end
      else
        edtPeMCLi.text:='0';}
      edtLiRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
                                    zeroifnull(ExtractVariant(edtLi.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
    end
    else if tedit(sender).name=edtImpLe.name then begin
      {if zeroifnull(ExtractVariant(edtLe.text, Importo))<>0 then begin
        edtPeMCLe.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))/
                                       zeroifnull(ExtractVariant(edtLe.text, Importo))*100), perc, 2);
      end
      else
        edtPeMCLe.text:='0';}
      edtLeRic.text:=formatvariant((zeroifnull(ExtractVariant(edtImpLe.text, Importo))+
                                    zeroifnull(ExtractVariant(edtLe.text, Importo))), Importo, Azienda.RValutaSI.DecMaxEuro);
    end;

    CalcolaTotDatiCom;
    (*if tedit(sender).name=edtImpUl.name then begin
      {if zeroifnull(ExtractVariant(edtTot.text, Importo))<>0 then begin
        edtPeUlMC.text:=formatvariant((zeroifnull(ExtractVariant(edtImpUl.text, Importo))/
                                       zeroifnull(ExtractVariant(edtTot.text, Importo))*100), perc, 2);
      end
      else
        edtPeUlMC.text:='0';}
    end
    else if tedit(sender).name=edtImpSc.name then begin
      {if zeroifnull(ExtractVariant(edtTot.text, Importo))<>0 then begin
        edtPeUlSc.text:=formatvariant((zeroifnull(ExtractVariant(edtImpSc.text, Importo))/
                                       zeroifnull(ExtractVariant(edtTot.text, Importo))*100), perc, 2);
      end
      else
        edtPeUlSc.text:='0';}
    end;*)
    tedit(sender).text:=formatvariant(zeroifnull(ExtractVariant(tedit(sender).text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
    //CalcolaTotDatiCom;
  end;
end;

procedure TFrmPrevInd.CalcolaTotDatiCom;
begin
  edtTot.text:=formatvariant(zeroifnull(ExtractVariant(edtMa.text, Importo))+
                             zeroifnull(ExtractVariant(edtLi.text, Importo))+
                             zeroifnull(ExtractVariant(edtLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtTotGen.text:=edtTot.text;

  edtTotImp.text:=formatvariant(zeroifnull(ExtractVariant(edtImpMa.text, Importo))+
                                zeroifnull(ExtractVariant(edtImpLi.text, Importo))+
                                zeroifnull(ExtractVariant(edtImpLe.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);

  edtTotPrec1.text:=formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo))+
                                  zeroifnull(ExtractVariant(edtTotImp.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);

  if zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))<>0 then begin
    edtImpUl.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
                                  zeroifnull(ExtractVariant(edtPeUlMC.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
  end;
  {else
    edtImpUl.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);}

  {if zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))<>0 then begin
    edtImpSc.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))*
                                  zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
  end;}
  {else
    edtImpSc.text:=formatvariant(0, Importo, Azienda.RValutaSI.DecMaxEuro);}

  edtTotPrec2.text:=formatvariant(zeroifnull(ExtractVariant(edtTotPrec1.text, Importo))+
                                  zeroifnull(ExtractVariant(edtImpUl.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);

  if zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))<>0 then begin
    edtImpSc.text:=formatvariant((zeroifnull(ExtractVariant(edtTotPrec2.text, Importo))*
                                  zeroifnull(ExtractVariant(edtPeUlSc.text, Importo))/100), Importo, Azienda.RValutaSI.DecMaxEuro);
  end;

  edtTotImpGen.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo))+
                                   zeroifnull(ExtractVariant(edtImpUl.text, Importo))-
                                   zeroifnull(ExtractVariant(edtImpSc.text, Importo)), Importo, Azienda.RValutaSI.DecMaxEuro);

  if zeroifnull(ExtractVariant(edtTot.text, Importo))<>0 then begin
    edtTotMC.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImp.text, Importo))/
                                  zeroifnull(ExtractVariant(edtTot.text, Importo))*100, Perc, 2);
    edtTotMCGen.text:=formatvariant(zeroifnull(ExtractVariant(edtTotImpGen.text, Importo))/
                                    zeroifnull(ExtractVariant(edtTot.text, Importo))*100, Perc, 2);
  end;

  edtTotale.text:=formatvariant(zeroifnull(ExtractVariant(edtTot.text, Importo))+
                                zeroifnull(ExtractVariant(edtTotImpGen.text, Importo)) , Importo, 2);

  if zeroifnull(extractvariant(Lab_Qta.caption, importo))<>0 then begin
    edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
    edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
    edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
    edtTotaleUni.text:=formatvariant(zeroifnull(ExtractVariant(edtTotale.text, Importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)) , Importo, Azienda.RValutaSI.DecMaxEuro);
  end;
end;

procedure TFrmPrevInd.AssegnaControlliDatiComPI(FOP: IPrev);
var
  idmat: integer;
begin
  if F2Materiale.KeyValue>0 then
    idmat:=F2Materiale.KeyValue
  else
    idmat:=IDCompDefault;

  if cercaOPDP(fop.GetCampi('id'), idmat) then begin
    edt_Costo.Text:=formatvariant(QrySelOPDP.fieldbyname('cosuni').asFloat, Importo, Azienda.RValutaSI.DecMaxEuro);
    edt_TCosto.Text:=QrySelOPDP.fieldbyname('tipcos').asString;
  end;

  edtMa.text:=formatvariant(FOP.GetCampi('CosMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtLi.text:=formatvariant(FOP.GetCampi('CosLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtLe.text:=formatvariant(FOP.GetCampi('CosLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtPeMCMa.text:=formatvariant(FOP.GetCampi('PeMcMa'), Perc, 2);
  edtPeMCLi.text:=formatvariant(FOP.GetCampi('PeMcLi'), Perc, 2);
  edtPeMCLe.text:=formatvariant(FOP.GetCampi('PeMcLe'), Perc, 2);
  edtImpMa.text:=formatvariant(FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtImpLi.text:=formatvariant(FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtImpLe.text:=formatvariant(FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtPeUlMC.text:=formatvariant(FOP.GetCampi('PeUlMc'), Perc, 2);
  edtPeUlSc.text:=formatvariant(FOP.GetCampi('PeUlSc'), Perc, 2);
  edtImpUl.text:=formatvariant(FOP.GetCampi('RicMc'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtImpSc.text:=formatvariant(FOP.GetCampi('ImpSc'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtMaRic.text:=formatvariant(FOP.GetCampi('CosMa')+FOP.GetCampi('RicMa'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtLiRic.text:=formatvariant(FOP.GetCampi('CosLi')+FOP.GetCampi('RicLi'), Importo, Azienda.RValutaSI.DecMaxEuro);
  edtLeRic.text:=formatvariant(FOP.GetCampi('CosLe')+FOP.GetCampi('RicLe'), Importo, Azienda.RValutaSI.DecMaxEuro);
  {if zeroifnull(extractvariant(Lab_Qta.caption, importo))<>0 then begin
    edtMaUni.text:=formatvariant(zeroifnull(extractvariant(edtMaRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
    edtLiUni.text:=formatvariant(zeroifnull(extractvariant(edtLiRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
    edtLeUni.text:=formatvariant(zeroifnull(extractvariant(edtLeRic.text, importo))/zeroifnull(extractvariant(Lab_Qta.caption, importo)), Importo, Azienda.RValutaSI.DecMaxEuro);
  end;}
  CalcolaTotDatiCom;
end;

procedure TFrmPrevInd.BtnCopiaClick(Sender: TObject);
var
  TmpTab :TCSETable;
  FDefs:TFieldDefs;
  IDefs:TIndexDefs;
  QryTmp: TCSEQuery;
  Esiste: Boolean;
  Ciclo: integer;
begin
  Esiste:=True;
  QryTmp:=TCSEQuery.Create(nil);
  try
    QryTmp.DataBaseName := Azienda.DataBaseName;
    QryTmp.sql.clear;
    QryTmp.sql.add('delete from '+NtabtmpCopia);
    try
      QryTmp.execsql;
    except
      Esiste:=False;
    end;
    if not Esiste then begin
      TmpTab := TCSETable.Create( nil );
      Try
        QryTmp.sql.clear;
        QryTmp.Sql.Add('Select * From ext_pialtatg Where ID=0');  // Non seleziona nulla per evitare tempi inutili
        QryTmp.Open;

        // Creo la nuova tabella
        FDefs := TmpTab.FieldDefs;

        // Assegnazione dei campi interessanti
        FDefs.Clear;

        // copio la struttura di fatrig a cui aggiungerò altri campi
        For Ciclo := 0 To ( QryTmp.FieldDefs.Count -1 ) Do
        Begin
           With QryTmp.FieldDefs[ciclo] Do
           Begin
             // If (UpperCase(Name) <> 'ID') Then
               FDefs.Add( Name, DataType, Size, False );
           End;
        End;

        // Creazione Indici
        IDefs := TmpTab.IndexDefs;
        IDefs.Clear;

        CreateTableAppStd(Azienda, NtabtmpCopia, FDefs, IDefs, False);
      Finally
        TmpTab.Free;
      End;
    end;
    QryTmp.sql.clear;
    QryTmp.sql.add('insert into '+NtabtmpCopia+' select * from ext_pialtatg Where ID='+inttostr(ext_pialtatg.campi.id));
    QryTmp.execsql;
  finally
    QryTmp.free;
  end;
end;

procedure TFrmPrevInd.BtnIncollaClick(Sender: TObject);
var
  QryTmp: TCSEQuery;
  tmp: string;
  i: Integer;
begin
  QryTmp:=TCSEQuery.Create(nil);
  try
    QryTmp.DataBaseName := Azienda.DataBaseName;
    QryTmp.sql.clear;
    QryTmp.sql.add('select tmp.*, f.idlav from '+NtabtmpCopia+' tmp '+
                   'left outer join opsdlfas f on f.id=tmp.idopsdlfas');
    QryTmp.open;
    if not QryTmp.isempty then begin
      F2Materiale.keyvalue:=QryTmp.fieldbyname('idmateriale').asinteger;
      F2Lav.keyvalue:=QryTmp.fieldbyname('idlav').asinteger;
      //  Impostati nella LeggiMateriale
      //  Edt_SpazioRall.text:= FormatVariant(QryTmp.fieldbyname('spaziorall').asFloat, Quantita, 2);
      //  Edt_Rall.text:=FormatVariant(QryTmp.fieldbyname('percrall').asFloat, Perc, 2);
      //  Edt_Fmmmin.text:=FormatVariant(QryTmp.fieldbyname('dimfor').asFloat, Quantita, 2);
      //  Edt_TForat.text:=FormatVariant(QryTmp.fieldbyname('tforat').asFloat*(24*60*60), Quantita, 0);  //  è espresso in secondi
      //  Edt_TAttr.text:=FormatVariant(SecCToSecS(QryTmp.fieldbyname('tattr').asFloat*(24*60)), Quantita, 2);   11.05.04  lo incollo dopo
      Edt_NProf.text:=FormatVariant(QryTmp.fieldbyname('nprof').asFloat, Quantita, 0);
      Edt_NSpig.text:=FormatVariant(QryTmp.fieldbyname('nspig').asFloat, Quantita, 0);
      edt_Altezza.text:=FormatVariant(QryTmp.fieldbyname('lastraalt').asFloat, Quantita, 2);
      edt_Lunghezza.text:=FormatVariant(QryTmp.fieldbyname('lastralun').asFloat, Quantita, 2);
      edt_NLastre.text:=FormatVariant(QryTmp.fieldbyname('nlastre').asFloat, Quantita, 0);
      Edt_PezziLastra.text:=FormatVariant(QryTmp.fieldbyname('pezzixlastra').asFloat, Quantita, 0);
      Edt_SvilLin.text:=FormatVariant(QryTmp.fieldbyname('svillin').asFloat, Quantita, 2);
      edt_SvilCerchi.text:=FormatVariant(QryTmp.fieldbyname('svilcer').asFloat, Quantita, 2);
      tmp:=QryTmp.fieldbyname('sviluppo').asstring;
      for i:=1 to SG_CSvil.rowcount do begin
        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3))<>'' then
          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3)))<>0 then
            SG_CSvil.Cells[0, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3)), Quantita, 2);
        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1))<>'' then
          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)))<>0 then
            SG_CSvil.Cells[1, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+1)), Quantita, 0);
        if trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2))<>'' then
          if zeroifnull(trim(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)))<>0 then
            SG_CSvil.Cells[2, i]:=FormatVariant(zeroifnull(CS_Extract_SubStr(tmp, ';', (i-1)*3+2)), Quantita, 2);
      end;

      LeggiMateriale;

      Edt_SpazioRall.text:= FormatVariant(QryTmp.fieldbyname('spaziorall').asFloat, Quantita, 2);
      Edt_Rall.text:=FormatVariant(QryTmp.fieldbyname('percrall').asFloat, Perc, 2);
      Edt_Fmmmin.text:=FormatVariant(QryTmp.fieldbyname('dimfor').asFloat, Quantita, 2);
      Edt_TForat.text:=FormatVariant(QryTmp.fieldbyname('tforat').asFloat*(24*60*60), Quantita, 0);  //  è espresso in secondi

      Edt_TAttr.text:=FormatVariant(SecCToSecS(QryTmp.fieldbyname('tattr').asFloat*(24*60)), Quantita, 2);   //  11.05.04  lo incollo adesso perchè la LeggiMateriale lo va a leggere dalle tabelle
      CalcolaTempo;
    end;
  finally
    QryTmp.free;
  end;
end;

procedure TFrmPrevInd.AggiornaCosti;
var
  FOPtmp: TOrPr;
  OrCos1, OrCos2, OrCos3, OrCos4, OrCos5, tmpOrdVal: string;
begin

  OrCos1       := GetParDef('PIOrCos1', Azienda.databasename);
  OrCos2       := GetParDef('PIOrCos2', Azienda.databasename);
  OrCos3       := GetParDef('PIOrCos3', Azienda.databasename);
  OrCos4       := GetParDef('PIOrCos4', Azienda.databasename);
  OrCos5       := GetParDef('PIOrCos5', Azienda.databasename);

  tmpOrdVal:='';
  if OrCos1 <> '' then
    tmpOrdVal := tmpOrdVal + OrCos1 + ';';
  if OrCos2 <> '' then
    tmpOrdVal := tmpOrdVal + OrCos2 + ';';
  if OrCos3 <> '' then
    tmpOrdVal := tmpOrdVal + OrCos3 + ';';
  if OrCos4 <> '' then
    tmpOrdVal := tmpOrdVal + OrCos4 + ';';
  if OrCos5 <> '' then
    tmpOrdVal := tmpOrdVal + OrCos5 + ';';

  if (tmpOrdVal <> '') then
  begin

    FOPtmp := TOrPr.Create(DBExec, Utente);
    try
      FOPtmp.seek('id', ext_pialtatg.campi.idoptes);
      FOPtmp.AggVOPDP(ext_pialtatg.campi.idoptes, tmpOrdVal, 'C', True)
    finally
      FOPtmp.free;
    end;
  end;

  {  Per adesso non li gestiamo
  // ATTUALIZZAZIONE COSTI INSIEMI E SOTTOINSIEMI ESTERNI
  if Settings.OrCosIEGS <> '' then
    tmpOrdVal := Settings.OrCosIEGS + ';';

  if (msg = '') and (tmpOrdVal <> '') then
  begin
    if not FOPtmp.AggVOPDP(FOPtmp.CampiOPTes.Id, tmpOrdVal, 'IE', True) then
      msg := RS_PRD_FOPDP_006;
  end;

  // ATTUALIZZAZIONE COSTI INSIEMI E SOTTOINSIEMI INTERNI
  if Settings.OrCosIIGS <> '' then
    tmpOrdVal := Settings.OrCosIIGS + ';';

  if (msg = '') and (tmpOrdVal <> '') then
  begin
    if not FOPtmp.AggVOPDP(FOPtmp.CampiOPTes.Id, tmpOrdVal, 'II', True) then
      msg := RS_PRD_FOPDP_008;
  end;}
end;

procedure TFrmPrevInd.edt_CostoKeyPress(Sender: TObject; var Key: WideChar);
begin
  if sender is tedit then begin
    CheckImporto(Key, tedit(sender).text);
  end;
  edt_TCosto.text:='';
end;
procedure TFrmPrevInd.BtnAggOVClick(Sender: TObject);
begin
  AggiornaComtes(False);
end;

procedure TFrmPrevInd.AggiornaComtes(ask: Boolean);
begin
  AskAggPrezzoComRig:=2;  //  l'utente desidera aggiornare la commessa
end;

procedure TFrmPrevInd.AggiornaPesi(IdOpTes, IdArtico: Integer);
var
  QryArt: TCSEQuery;
  LCoOrd : integer;
  // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
  function GetCOORD(const AIdArtico: Integer): Integer;
  var
    LQTmp: TCSEQuery;
  begin
    Result := 0;
    LQTmp := TCSEQuery.Create(nil);
    try
      LQTmp.DataBaseName := Azienda.DatabaseName;

      LQTmp.sql.clear;
      LQTmp.SQL.Text := ''
                      + ' SELECT C.COORD '
                      + ' FROM ARTICO A '
                      + ' INNER JOIN MAGCOLORI C ON C.ID=A.IDMAGCOLORI '
                      + ' WHERE A.ID = ' + CS_VariantTo_SqlStr(AIdArtico);

      LQTmp.open;

      if not LQTmp.Eof then
      begin
        Result := LQTmp.FieldByName('COORD').AsInteger;
      end;
    finally
      FreeAndNil(LQTmp);
    end;
  end;
  // IK 06/12/2024
begin
  // SF...31/07/2007 : Estraggo il peso unitario e totale
  QryArt:=TCSEQuery.Create(nil);
  QryArt.DataBaseName := Azienda.DataBaseName;
  try // finally
    if (IdOpTes=0) or (IdArtico=0) then
      exit;

    QryArt.sql.clear;
    QryArt.sql.Text:= 'select sum(dp.qtimco) qtimco, t.QtaOP '+
                      'from opdp dp '+
                      'inner join OpTes t on t.id=dp.IdOpTes '+
                      'where (dp.idoptes= '+CS_KeyValueTo_SqlStr(IdOpTes)+') '+
                        'and (dp.idartico='+CS_KeyValueTo_SqlStr(IdArtico)+') '+
                      'Group by t.QtaOP ';
    QryArt.open;

    // IK 06/12/2024 RI 53799 Modifica peso totale in caso di colore
    if IdArtico = 0 then
    begin
      LCoOrd := 0;
    end
    else
    begin
      LCoOrd := GetCOORD(IdArtico);
    end;

//    try
//      lblPesoUni.Caption:=trim(formatvariant((QryArt.fieldbyname('QtImCo').AsFloat/QryArt.fieldbyname('QtaOP').AsFloat), Quantita));
//    except
//      lblPesoUni.Caption:='0';
//    end;
//    try
//      lblPesoTot.Caption:=trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
//    except
//      lblPesoTot.Caption:='0';
//    end;

    try
      lblPesoUni.Caption:=trim(formatvariant((QryArt.fieldbyname('QtImCo').AsFloat/QryArt.fieldbyname('QtaOP').AsFloat), Quantita));
    except
      lblPesoUni.Caption:='0';
    end;
    try
      // Quando si effettua il calcolo del peso se la materia prima indicata ha il campo
      // Colore Indicato il valore indicato va diviso per il campo CoOrd della
      // Tabella colore e moltiplicato per 1000000 (il campo è indicato in mm quadrati)
      if LCoOrd = 0 then
      begin
        lblPesoTot.Caption:=trim(formatvariant(QryArt.fieldbyname('QtImCo').asstring, Quantita));
      end
      else
      begin
        lblPesoTot.Caption:=trim(formatvariant(((QryArt.fieldbyname('QtImCo').AsFloat/ LCoOrd) * 1000000 ), Quantita));
      end;
    except
      lblPesoTot.Caption:='0';
    end;
     // ...IK 06/12/2024 RI 53799
  finally
    FreeAndNil(QryArt);
  end;
end;

end.

