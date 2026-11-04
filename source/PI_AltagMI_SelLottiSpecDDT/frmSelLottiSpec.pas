unit frmSelLottiSpec;

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, FRMSTD,CStd, UCoreTipi, SMDBGrid, Data.DB,
  CSETables, QueryPars, Compf2, CSEdit, IBase, S3Registry, UVarie, RSQL,
  IVendite, CSButtons, CSSplitter, UVarieLottiSpec, OLEDBComponents, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, AdvSplitter, AdvListEditor, CSTagListEditor,
  System.Classes;

type
  TFSelLottiSpec = class(TFormStd)
    Panel1: TPanel;
    smdbgLottoSpec: TSMDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    smdbgLottiSel: TSMDBGrid;
    dsLottoSpec: TDataSource;
    qryLottoSpec: TQueryPars;
    qryLottiSel: TQueryPars;
    dsLottiSel: TDataSource;
    GroupBox3: TGroupBox;
    F2IDArticoGen: TF2;
    Label1: TLabel;
    edtQta3: TCSEdit;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    lblQta3: TLabel;
    edtQta1Rim: TCSEdit;
    Label2: TLabel;
    F2IDLotSer: TF2;
    Label3: TLabel;
    Label5: TLabel;
    edtQta1Sel: TCSEdit;
    lblUM1Spec: TLabel;
    Panel5: TPanel;
    btnSel: TCSBitBtn;
    edtQta2: TCSEdit;
    edtQta1: TCSEdit;
    Label6: TLabel;
    Label7: TLabel;
    lblQta1: TLabel;
    lblQta2: TLabel;
    Label10: TLabel;
    lblQta3rim: TLabel;
    Label12: TLabel;
    edtQta3Rim: TCSEdit;
    lblQta2Rim: TLabel;
    edtQta2Rim: TCSEdit;
    Label14: TLabel;
    lblQta1Rim: TLabel;
    CSSplitter1: TCSSplitter;
    Panel6: TPanel;
    edtQta2Sel: TCSEdit;
    Label8: TLabel;
    lblUM2Spec: TLabel;
    edtQta3Sel: TCSEdit;
    lblUm3SPec: TLabel;
    Label13: TLabel;
    CSBitBtn1: TCSBitBtn;
    edtBase: TCSEdit;
    Label9: TLabel;
    edtAlt: TCSEdit;
    CSBitBtn2: TCSBitBtn;
    edtSpessore: TCSEdit;
    lblSpessore: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    edtNum: TCSEdit;
    Label16: TLabel;
    Label17: TLabel;
    Panel7: TPanel;
    GroupBox5: TGroupBox;
    smdbgLottoDDT: TSMDBGrid;
    dsLottoDDT: TDataSource;
    qryLottoDDT: TQueryPars;
    Panel8: TPanel;
    Panel9: TPanel;
    CSSplitter2: TCSSplitter;
    edtRiferi3: TCSEdit;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CSfrmBaseShow(Sender: TObject);
    procedure dsLottoSpecDataChange(Sender: TObject; Field: TField);
    procedure edtQta2SelExit(Sender: TObject);
    procedure edtQta1SelExit(Sender: TObject);
    procedure edtQta3SelExit(Sender: TObject);
    procedure btnSelClick(Sender: TObject);
    procedure CSBitBtn1Click(Sender: TObject);
    procedure CSBitBtn2Click(Sender: TObject);
    procedure updateQrySpec;
    procedure edtSpessoreExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  public
    IDFatRig, IDLotSer, IDArtico, IDAllMag, IDCauMovFatRig: integer;
    posrif: string;

  private
    procedure aggQtaRim;
    procedure aggiornaLottoDDT;

  protected
    function GetObjSAM: TOStd; override;
  end;

implementation

{$R *.DFM}

Uses CSFileCfg, S3DB, UCoreDB;


procedure TFSelLottiSpec.btnSelClick(Sender: TObject);
var ObjFatRig: IBFRigStd;
    ObjBamTes: IBamTesStd;
    ObjArtico: IArticoStd;
    sql, err: string;
    newIdFatRig, rigaDoc: integer;
    qry: TCSEQuery;
    ObjLottiBF: ILottiBfStd;
begin
  inherited;
  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);
  GetInterfOggetto('ObjLottiBF','LOTTIBF',ILottiBFStd,ObjLottiBF);
  GetInterfOggetto('ObjBamTes','BAMTES',IBamTesStd,ObjBamTes);

  if edtQta3Sel.AsFloat > smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat then
  begin
    if MessageDlg('E'' stata selezionata una quantità superiore a quella disponibile. Sei sicuro di voler proseguire?',mtConfirmation,[mbYes,mbNo],0,mbNo) <> mrYes then
    begin
      exit;
    end;
  end;

  qry := TCSEQuery.Create(nil);

  try
    qry.DataBaseName := Azienda.DatabaseName;

    //Verifico se c'è già una riga di bolla con l'articolo specifico selezionato.
    sql := 'SELECT ID ' +
           'FROM FATRIG ' +
           'WHERE IDARTICO = ' + CS_KeyValueTo_SqlStr(getIDLotserDef(F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger)) + ' ' +
                 'AND extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(idFatRig);
    err := CS_OpenQry(sql,qry);

    if err <> '' then
    begin
      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    //Creo la riga in FATRIG per il lotto che ho buttato dentro in lottibf
//    if qry.Eof then
//    begin
    ObjFatRig.Seek('ID',idFatRig);

    rigaDoc := ObjFatRig.CampiObj['RIGABAM'];

    ObjFatRig.CampiObj['IDARTICO'] := getIDLotserDef(F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);
    ObjFatRig.CampiObj['IDCAUMOV'] := IDCauMovFatRig;

    ObjArtico.Seek('ID',F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);

    if ObjArtico.CampiObj['UMV'] = '' then
    begin
      if ObjArtico.CampiObj['UMM'] = '' then
      begin
        ObjFatRig.CampiObj['QTA1'] := edtQta3Sel.AsFloat;
        ObjFatRig.CampiObj['QTA2'] := edtQta3Sel.AsFloat;
      end
      else
      begin
        ObjFatRig.CampiObj['QTA1'] := edtQta2Sel.AsFloat;
        ObjFatRig.CampiObj['QTA2'] := edtQta2Sel.AsFloat;
      end;
    end
    else
    begin
      if ObjArtico.CampiObj['UMM'] = '' then
      begin
        ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) * edtQta3Sel.AsFloat;
        ObjFatRig.CampiObj['QTA2'] := edtQta3Sel.AsFloat;
      end
      else
      begin
        ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) * edtQta3Sel.AsFloat;
        ObjFatRig.CampiObj['QTA2'] := edtQta2Sel.AsFloat;
      end;
    end;

    ObjFatRig.CampiObj['QTA3'] := edtQta3Sel.AsFloat;
    ObjFatRig.CampiObj['PREZZO'] := 0;
    ObjFatRig.CampiObj['IMPTOT'] := 0;
    ObjFatRig.CampiObj['SCONTO1'] := 0;
    ObjFatRig.CampiObj['SCONTO2'] := 0;
    ObjFatRig.CampiObj['SCONTO3'] := 0;
    ObjFatRig.CampiObj['SCONTO4'] := 0;
    ObjFatRig.CampiObj['SCOQUA'] := 0;
    ObjFatRig.CampiObj['SCONTOL'] := 0;
    ObjFatRig.CampiObj['PREZZON'] := 0;
    ObjFatRig.CampiObj['IDCOMRIG'] := 0;
    ObjFatRig.CampiObj['RIGABAM'] := rigaDoc + 1;
    ObjFatRig.CampiObj['RIFERI3'] := edtRiferi3.Text;

    //Aggiorno i rigadoc per aggiungere la riga di bolla subito sotto al generico.
    sql := 'UPDATE FATRIG SET RIGABAM = RIGABAM + 1 ' +
           'WHERE RIGABAM > ' + CS_VariantTo_SqlStr(rigadoc) + ' ' +
                 'AND IDBAM = ' + CS_KeyValueTo_SqlStr(ObjFatRig.CampiObj['IDBAM']);
    err := CS_ExecDB(sql,DBExec);

    if err <> '' then
    begin
      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    newIdFatRig := ObjFatRig.Insert;

    ObjFatRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro,Azienda.RValutaSI.DecContEuro);
{    end
    else
    begin
      //Se c'è aggiungo la quantità alla riga
      newIdFatRig := qry.FieldByName('ID').AsInteger;
      ObjFatRig.Seek('ID',newIdFatRig);

      ObjFatRig.CampiObj['QTA3'] := ObjFatRig.CampiObj['QTA3'] + edtQta3Sel.AsFloat;
      ObjFatRig.CampiObj['UM3'] := ObjArtico.CampiObj['UMI'];

      ObjArtico.Seek('ID',F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);

      if ObjArtico.CampiObj['UMV'] = '' then
      begin
        if ObjArtico.CampiObj['UMM'] = '' then
        begin
          ObjFatRig.CampiObj['QTA1'] :=  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMI'];
          ObjFatRig.CampiObj['QTA2'] :=  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMI'];
        end
        else
        begin
          ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouM) *  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMM'];
          ObjFatRig.CampiObj['QTA2'] := ObjArtico.ConvUM(OuI,ouI) *  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMI'];
        end;
      end
      else
      begin
        if ObjArtico.CampiObj['UMM'] = '' then
        begin
          ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) *  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMV'];
          ObjFatRig.CampiObj['QTA2'] := ObjArtico.ConvUM(OuI,ouI) *  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMI'];
        end
        else
        begin
          ObjFatRig.CampiObj['QTA1'] := ObjArtico.ConvUM(OuI,ouV) *  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM1'] := ObjArtico.CampiObj['UMV'];
          ObjFatRig.CampiObj['QTA2'] := ObjArtico.ConvUM(OuI,ouM) *  ObjFatRig.CampiObj['QTA3'];
          ObjFatRig.CampiObj['UM2'] := ObjArtico.CampiObj['UMM'];
        end;
      end;

      ObjFatRig.CampiObj['IDCOMRIG'] := 0;

      ObjFatRig.Ricalcola(Azienda.RValutaSI.DecMaxEuro,Azienda.RValutaSI.DecContEuro);

      ObjFatRig.Modifica;
    end;       }

    ObjBamTes.Seek('ID',ObjfatRig.CampiObj['IDBAM']);
    ObjBamTes.RicalcolaTotali(false,false,false);

    //Salvo il riferimento della riga generica
    sql := 'UPDATE FATRIG SET extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(IDFatRig) + ' ' +
           'WHERE ID = ' + CS_KeyValueTo_SqlStr(newIdFatRig);
    err := CS_ExecDB(sql,DBExec);

    if err <> '' then
    begin
      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    sql := 'SELECT LOTTIBF.ID ' +
           'FROM LOTTIBF ' +
           'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID AND LOTSER.NUMLOT = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ' AND LOTSER.NUMSER = ' + CS_VariantTo_SqlStr(NUMSERDEF) + ' ' +
           'WHERE IDFATRIG = ' + CS_KeyValueTo_SqlStr(newIdFatRig);
    err := CS_OpenQry(sql,qry);

    if err <> '' then
    begin
      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    while not qry.Eof do
    begin

      if not ObjLottiBF.Elimina(qry.FieldByName('ID').AsInteger) then
      begin
        Messaggio('Errore nell''eliminazione del lotto di default da LOTTIBF',Application.Title,MB_ICONINFORMATION + MB_OK);
        exit;
      end;

      qry.Next;
    end;

    //Aggiorno i LOTTIBF selezionati alla riga di bolla
    ObjLottiBF.Found := false;

    //Aggiungo le quantità alla riga di bolla
    ObjLottiBF.CampiObj['IDLOTSER'] := F2IDLotSer.KeyValue;
    ObjLottiBF.CampiObj['IDFATRIG'] := newIdFatRig;
    ObjLottiBF.CampiObj['QTAINV'] := edtQta3Sel.AsFloat;
    ObjLottiBF.CampiObj['UMINV'] := ObjArtico.CampiObj['UMI'];
    ObjLottiBF.CampiObj['IDALLPRE'] := IDAllMag;


    if ObjLottiBF.Insert <= 0 then
    begin
      Messaggio('Impossibile inserire il lotto nel DDT.',Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    smdbgLottoSpec.RefreshData;
    smdbgLottiSel.RefreshData;

    aggQtaRim;
  finally
    freeandnil(qry);
  end;
end;

procedure TFSelLottiSpec.CSBitBtn1Click(Sender: TObject);
var ObjLottiBF: ILottiBfStd;
    sql, err: string;
    qry: TCSEQuery;
    idFatRigLBF: integer;
    ObjFatRig: IBFRigStd;
begin
  GetInterfOggetto('ObjLottiBF','LOTTIBF',ILottiBFStd,ObjLottiBF);
  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);

  if MessageDlg('Sei sicuro di voler eliminare il lotto specifico selezionato?',mtConfirmation,[mbyes,mbNo],0) <> mrYes then
  begin
    exit;
  end;

  qry := TCSEQuery.Create(nil);

  try
    qry.DataBaseName := Azienda.DatabaseName;

    idFatRigLBF := smdbgLottiSel.DataSource.DataSet.FieldByName('IDFATRIG').AsInteger;

    ObjLottiBF.Elimina(smdbgLottiSel.DataSource.DataSet.FieldByName('ID').AsInteger);

    sql := 'SELECT ID ' +
           'FROM LOTTIBF ' +
           'WHERE IDFATRIG = ' + CS_KeyValueTo_SqlStr(idFatRigLBF);
    err := CS_OpenQry(sql,qry);

    if err <> '' then
    begin
      MEssaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if qry.Eof then
    begin
      ObjFatRig.Elimina(idFatRigLBF);
    end;

    smdbgLottoSpec.RefreshData;
    smdbgLottiSel.RefreshData; 

    aggQtaRim;
  finally
    freeandnil(qry);
  end;
end;

procedure TFSelLottiSpec.CSBitBtn2Click(Sender: TObject);
var ObjArtico: IArticoStd;
begin
  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);

  ObjArtico.Seek('ID',F2IDLotSer.qryF2.FieldByName('IDARTICO').AsInteger);

  edtQta3Sel.AsFloat := ((edtNum.AsFloat * edtBase.AsFloat * edtAlt.AsFloat) / qryLottoSpec.FieldByName('COORD').AsFloat);
  edtQta3SelExit(Sender);
end;

procedure TFSelLottiSpec.updateQrySpec;
var ObjArtico: IArticoStd;
    condCla, condMar, condGrup, condSpe, sql: string;
begin
  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
  ObjArtico.Seek('ID',IDArtico);

    if not ObjArtico.Found then
    begin
      Messaggio('Impossibile identificare l''articolo',Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    qryLottoSpec.DataBaseName := Azienda.DatabaseName;

    if ObjArtico.CampiObj['IDCLASSI'] = 0 then
      condCla := ''
    else
      condCla := 'AND ARTICO.IDCLASSI = ' + CS_KeyValueTo_SqlStr(ObjArtico.CampiObj['IDCLASSI']);

    if ObjArtico.CampiObj['IDCATOMO'] = 0 then
      condMar := ''
    else
      condMar := 'AND ARTICO.IDCATOMO = ' + CS_KeyValueTo_SqlStr(ObjArtico.CampiObj['IDCATOMO']);

    if ObjArtico.CampiObj['IDGRUPPI'] = 0 then
      condGrup := ''
    else
      condGrup := 'AND ARTICO.IDGRUPPI = ' + CS_KeyValueTo_SqlStr(ObjArtico.CampiObj['IDGRUPPI']);

    if edtSpessore.Text <> '' then
    begin
      condSpe := 'AND CLASSI.CODICE = ' + CS_VariantTo_SqlStr(trim(edtSpessore.Text));
    end
    else
      condSpe := '';
    

    sql := 'SELECT ARTICO.ID IDARTICO, ARTICO.CODICE, ARTICO.DESCR, LOTSER.NUMSER, LOTSER.NUMLOT, LOTSER.QTTGIAI, LOTSER.QTTIMPI, ' +
                  'LOTSER.ID, GIAMAG.QTTSPEI, GIAMAG.QTTORDI, (GIAMAG.QTTGIAI - GIAMAG.QTTSPEI) QTTDISPI, CLASSI.CODICE CODCLASSI, CLASSI.DESCR DESCRCLASSI, ' +
                  'CATOMO.CODICE CODCATOMO, CATOMO.DESCR DESCRCATOMO, (GIAMAG.QTTGIAM / GIAMAG.QTTGIAI) AS COEFF, (ISNULL(MAGCOLORI.COORD,1000000)) COORD ' +
           'FROM ARTICO ' +
           'INNER JOIN LOTSER ON ARTICO.ID = LOTSER.IDARTICO ' +
           'INNER JOIN GIAMAG ON LOTSER.ID = GIAMAG.IDARTICO ' +
           'INNER JOIN ALLMAG ON GIAMAG.IDMAG = ALLMAG.ID ' +
           'LEFT JOIN CLASSI ON ARTICO.IDCLASSI = CLASSI.ID ' +
           'LEFT JOIN CATOMO ON ARTICO.IDCATOMO = CATOMO.ID ' +
           'LEFT JOIN MAGCOLORI ON ARTICO.IDMAGCOLORI = MAGCOLORI.ID ' +
           'WHERE (NUMSER <> ' + CS_VariantTo_SqlStr(NUMSERDEF) + ' ' +
                 'OR NUMLOT <> ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ') ' +
                 'AND ROUND(GIAMAG.QTTGIAI,4) > 0 ' +
                 'AND ALLMAG.IDANAMAG = (SELECT IDANAMAG ' +
                                        'FROM ALLMAG ' +
                                        'WHERE ID = ' + CS_KeyValueTo_SqlStr(IDAllMag) + ') '+
                 condCla + ' ' +
                 condMar + ' ' +
                 condGrup + ' ' +
                 condSpe + ' ';
    qryLottoSpec.Close;
    qryLottoSpec.SQL.Text := sql;

    qryLottoSpec.Open;
    smdbgLottoSpec.RefreshData;
end;

procedure TFSelLottiSpec.CSfrmBaseShow(Sender: TObject);
var sql, err: string;
    ObjArtico: IArticoStd;
    qry: TCSEQuery;
    ObjFatRig: IBFRigStd;
    prevInd: Boolean;
begin
  inherited;
  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);

  qry := TCSEQuery.Create(nil);

  try
    qry.DataBaseName := Azienda.DatabaseName;

    ObjFatRig.Seek('ID',IDFatRig);
    IDAllMag := ObjFatRig.CampiObj['IDMAGPRE'];


    //Verifico se ho un articolo specifico in DP del Prev. Ind.
    sql := 'SELECT TOP 1 OPDT.IDARTICO, OPDP.IDALLMAG, OPDP.QTIMCO ' +
           'FROM OPTES ' +
           'INNER JOIN OPDT ON OPDT.IDOPTES = OPTES.ID AND OPDT.LIVELLO > 0 ' +
           'INNER JOIN OPDP ON OPDP.IDOPTES = OPTES.ID AND OPDT.IDARTICO = OPDP.IDARTICO ' +
           'INNER JOIN TIPIDOC ON OPTES.IDTIPIDOC = TIPIDOC.ID ' +
           'INNER JOIN FATRIG ON OPTES.IDCOMRIG = FATRIG.IDCOMRIG ' +
           'WHERE TIPIDOC.TIPDOC = ''D'' ' +
                 'AND FATRIG.ID = ' + CS_KeyValueTo_SqlStr(idFatRig) + ' ' +
           'ORDER BY OPDT.SEQUEN';

    err := CS_OpenQry(sql,qry);

    if err <> '' then
    begin
      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if qry.Eof then
    begin 
      sql := 'SELECT IDARTICO ' +
             'FROM LOTSER ' +
             'WHERE ID = ' + CS_KeyValueTo_SqlStr(IDLotSer);
      err := CS_OpenQry(sql,qry);

      if err <> '' then
      begin
        Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
        exit;
      end;
      prevInd := false;
    end
    else
    begin
      idAllMag := qry.FieldByName('IDALLMAG').AsInteger;
      prevInd := true;
      posrif := '';
    end;

    if posrif <> '' then
      edtSpessore.AsString := posrif
    else
    begin
      lblSpessore.Visible := false;
      edtSpessore.Visible := false;
    end;

    idArtico := qry.FieldByName('IDARTICO').AsInteger;

    ObjArtico.Seek('ID',idArtico);

    updateQrySpec;

    qryLottiSel.DataBaseName := Azienda.DatabaseName;

    sql := 'SELECT LOTTIBF.ID, FATRIG.ID IDFATRIG, ARTICO.CODICE, ARTICO.DESCR, LOTSER.NUMSER, LOTSER.NUMLOT, LOTTIBF.QTAINV, LOTTIBF.UMINV,  ' +
                  'FATRIG.QTA1, FATRIG.QTA2, FATRIG.QTA3, FATRIG.UM1, FATRIG.UM2, FATRIG.UM3 ' +
           'FROM FATRIG ' +
           'INNER JOIN LOTTIBF ON FATRIG.ID = LOTTIBF.IDFATRIG ' +
           'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID ' +
           //'INNER JOIN LOTSER LD ON FATRIG.IDARTICO = LD.ID ' +
           'INNER JOIN ARTICO ON LOTSER.IDARTICO = ARTICO.ID ' +
           'WHERE extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(IDFatRig);
    qryLottiSel.SQL.Text := sql;
    qryLottiSel.Open;
    smdbgLottiSel.RefreshData;

    F2IDArticoGen.KeyValue := IDArtico;

    //Se c'è l'articolo specifico nel prev. ind., prendo la quantità in distinta di prelievo
    if not prevInd then
    begin
      edtQta1.AsFloat := ObjFatRig.CampiObj['QTA1'];
      edtQta2.AsFloat := ObjFatRig.CampiObj['QTA2'];
      edtQta3.AsFloat := ObjFatRig.CampiObj['QTA3'];
      lblQta1.Caption := ObjFatRig.CampiObj['UM1'];
      lblQta2.Caption := ObjFatRig.CampiObj['UM2'];
      lblQta3.Caption := ObjFatRig.CampiObj['UM3'];
    end
    else
    begin
      edtQta1.AsFloat := qry.FieldByName('QTIMCO').AsFloat;
      edtQta2.AsFloat := qry.FieldByName('QTIMCO').AsFloat;
      edtQta3.AsFloat := qry.FieldByName('QTIMCO').AsFloat;
      lblQta1.Caption := ObjArtico.CampiObj['UM' + ObjArtico.CampiObj['UMRPRO']];
      lblQta2.Caption := ObjArtico.CampiObj['UM' + ObjArtico.CampiObj['UMRPRO']];
      lblQta3.Caption := ObjArtico.CampiObj['UM' + ObjArtico.CampiObj['UMRPRO']];
    end;

    aggQtaRim;

  finally
    freeandnil(qry);
  end;
end;

procedure TFSelLottiSpec.aggiornaLottoDDT;
begin
  qryLottoDDT.Close;
  qryLottoDDT.SQL.Text := 'SELECT FATRIG.QTA1, FATRIG.UM1, FATRIG.UM2, FATRIG.UM3, FATRIG.QTA2, FATRIG.Qta3, PERSONE.DESCR1, PERSONE.DESCR2, ' +
                                 'BAMTES.NUMDOC, BAMTES.ANNDOC, BAMTES.DATDOC, LOTSER.NUMLOT, LOTSER.NUMSER ' +
                                 'FROM LOTTIBF ' +
                                 'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID ' +
                                 'INNER JOIN FATRIG ON LOTTIBF.IDFATRIG = FATRIG.ID ' +
                                 'INNER JOIN BAMTES ON FATRIG.IDBAM = BAMTES.ID ' +
                                 'INNER JOIN CLIENTI ON BAMTES.IDCLIENTE = CLIENTI.ID ' +
                                 'INNER JOIN PERSONE ON CLIENTI.IDPERSONA = PERSONE.ID ' +
                                 'WHERE BAMTES.STATO = ''P'' ' +
                                       'AND FATRIG.extIDFATRIGGEN <> ' + CS_KeyValueTo_SqlStr(idFatRig) + ' ' +
                                       'AND (LOTTIBF.IDLOTSER = ' + CS_KeyValueTo_SqlStr(smdbgLottoSpec.DataSource.DataSet.FieldByName('ID').AsInteger) + ' ' +
                                            'OR LOTTIBF.IDLOTSER = ' + CS_KeyValueTo_SqlStr(getIDLotserDef(smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger)) + ')';
 smdbgLottoDDT.RefreshData;
end;

procedure TFSelLottiSpec.dsLottoSpecDataChange(Sender: TObject; Field: TField);
var ObjArtico: IArticoStd;
begin
  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);

  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);

  aggiornaLottoDDT;

  F2IDLotSer.KeyValue := smdbgLottoSpec.DataSource.DataSet.FieldByName('ID').AsInteger;
  lblUM1Spec.Caption := ObjArtico.CampiObj['UMV'];
  lblUM2Spec.Caption := ObjArtico.CampiObj['UMM'];
  lblUM3Spec.Caption := ObjArtico.CampiObj['UMI'];

  lblQta1Rim.Caption := ObjArtico.CampiObj['UMV'];
  lblQta2Rim.Caption := ObjArtico.CampiObj['UMM'];
  lblQta3Rim.Caption := ObjArtico.CampiObj['UMI'];

  edtQta3Sel.AsFloat := smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat;
  edtQta3SelExit(Sender);

  {if smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat >= edtQta3Rim.AsFloat then
  begin
    edtQta3Sel.AsFloat := edtQta3Rim.AsFloat;
    edtQta3SelExit(edtQta3Sel);
  end
  else
  begin
    edtQta3Sel.AsFloat := smdbgLottoSpec.DataSource.DataSet.FieldByName('QTTDISPI').AsFloat;
    edtQta3SelExit(edtQta3Sel);
  end;}
end;

procedure TFSelLottiSpec.aggQtaRim;
var sql, err: string;
    qry: TCSEQuery;
    ObjFatRig: IBFRigStd;
    ObjArtico: IARticoStd;
begin
  inherited;
  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);
  GetInterfOggetto('ObjBFRig','FATRIG',IBFRigStd,ObjFatRig);

  qry := TCSEQuery.Create(nil);

  try
    qry.DataBaseName := Azienda.DatabaseName;

    ObjFatRig.Seek('ID',IDFatRig);

    if smdbgLottiSel.DataSource.DataSet.RecordCount <= 0 then
    begin
      edtQta1Rim.AsFloat := 0;
      edtQta2Rim.AsFloat := 0;
      edtQta3Rim.AsFloat := 0;
    end
    else
    begin

      sql := 'SELECT QTAINV, LOTSER.IDARTICO ' +
             'FROM LOTTIBF ' +
             'INNER JOIN LOTSER ON LOTTIBF.IDLOTSER = LOTSER.ID ' +
             'INNER JOIN FATRIG ON LOTTIBF.IDFATRIG = FATRIG.ID ' +
             'WHERE FATRIG.extIDFATRIGGEN = ' + CS_KeyValueTo_SqlStr(IDFatRig);
      err := CS_OpenQry(sql,qry);

      if err <> '' then
      begin
        Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
        exit;
      end;

      edtQta3Rim.AsFloat := 0;
      edtQta1Rim.AsFloat := 0;
      edtQta2Rim.AsFloat := 0;


      while not qry.Eof do
      begin
        ObjArtico.Seek('ID',qry.FieldByName('IDARTICO').AsInteger);
        edtQta3Rim.AsFloat := edtQta3Rim.AsFloat + qry.FieldByName('QTAINV').AsFloat;
        edtQta2Rim.AsFloat := edtQta2Rim.AsFloat + (qry.FieldByName('QTAINV').AsFloat * ObjArtico.ConvUM(ouI,ouM));
        edtQta1Rim.AsFloat := edtQta1Rim.AsFloat + (qry.FieldByName('QTAINV').AsFloat * ObjArtico.ConvUM(ouI,ouV));

        qry.Next;
      end; 
    end;
  finally
    freeandnil(qry);
  end;
end;

procedure TFSelLottiSpec.edtQta1SelExit(Sender: TObject);
var ObjArtico: IArticoStd;
begin
  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);

  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);

  edtQta2Sel.AsFloat := edtQta1Sel.AsFloat * ObjArtico.ConvUM(ouV,ouM);
  edtQta3Sel.AsFloat := edtQta1Sel.AsFloat * ObjArtico.ConvUM(ouV,ouI);

end;

procedure TFSelLottiSpec.edtQta2SelExit(Sender: TObject);
var ObjArtico: IArticoStd;
begin
  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);

  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);

  //edtQta1Sel.AsFloat := edtQta2Sel.AsFloat * ObjArtico.ConvUM(ouM,ouV);
  edtQta3Sel.AsFloat := edtQta2Sel.AsFloat / qryLottoSpec.FieldByName('COEFF').AsFloat;   //ObjArtico.ConvUM(ouM,ouI);

end;

procedure TFSelLottiSpec.edtQta3SelExit(Sender: TObject);
var ObjArtico: IArticoStd;
begin
  GetInterfOggetto('ObjArticoli','ARTICO',IArticoStd,ObjArtico);

  ObjArtico.Seek('ID',smdbgLottoSpec.DataSource.DataSet.FieldByName('IDARTICO').AsInteger);

  //edtQta1Sel.AsFloat := edtQta3Sel.AsFloat * ObjArtico.ConvUM(ouI,ouV);
  edtQta2Sel.AsFloat := edtQta3Sel.AsFloat * qryLottoSpec.FieldByName('COEFF').AsFloat;

end;

procedure TFSelLottiSpec.edtSpessoreExit(Sender: TObject);
begin
  inherited;
  updateQrySpec;
end;

procedure TFSelLottiSpec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  smdbgLottiSel.SaveToIniFile;
  smdbgLottoSpec.SaveToIniFile;
  smdbgLottoDDT.SaveToIniFile;

  inherited;

end;

procedure TFSelLottiSpec.FormCreate(Sender: TObject);
var sql,err: string;
    iniFile: TCSFileCfg;
begin
  inherited;

  IDFatRig := 0;

  iniFile := TCSFileCfg.Create(Glo.UserPath + 'PI_Altag_SelLottiSpecDDT.ini');

  IDCauMovFatRig := iniFile.ReadInteger('IDCAUFATRIG','IDCAUMOVFATRIG',0);

  F2IDArticoGen.DBSam := Azienda.DatabaseName;
  F2IDArticoGen.Open;

  F2IDlotSer.DBSam := Azienda.DatabaseName;
  F2IDLotSer.Open;

  edtNum.AsFloat := 1;

  if CSColumnExists(DBExec,'FATRIG','extIDFATRIGGEN') <> '' then
  begin
    sql := 'ALTER TABLE FATRIG ADD extIDFATRIGGEN int';
    err := CS_ExecDB(sql,DBExec);

    if err <> '' then
    begin
      Messaggio(err,Application.Title,MB_ICONINFORMATION + MB_OK);
      exit;
    end;
  end;

  qryLottoDDT.DataBaseName := Azienda.DatabaseName;

  smdbgLottiSel.IniFileName := Glo.IniUtente;
  smdbgLottiSel.IniSection := 'PI_Altag_LottiSel';
  smdbgLottiSel.LoadFromIniFile;

  smdbgLottoSpec.IniFileName := Glo.IniUtente;
  smdbgLottoSpec.IniSection := 'PI_Altag_LottoSpec';
  smdbgLottoSpec.LoadFromIniFile;

  smdbgLottoDDT.IniFileName := Glo.IniUtente;
  smdbgLottoDDT.IniSection := 'PI_Altag_lottoDDT';
  smdbgLottoDDT.LoadFromIniFile;
end;

function TFSelLottiSpec.GetObjSam: TOStd;
begin
  Result := nil;
end;

end.
