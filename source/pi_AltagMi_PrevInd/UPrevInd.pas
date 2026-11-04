unit UPrevInd;

interface

uses
  System.Classes, Vcl.Forms, Winapi.Windows, CSETables, System.SysUtils, S3Registry, S3Plugin,
  IProduzione, OOrPr, GetRBas, GetRPrd, UOPTipi, UTipiPrd, RNote, UtilsArticoli;

type
  TPrevInd = class(TCustomPlugIn)
  private
    FOEClickbtnPrevInd: TNotifyEvent;
    FOEExitedtPrezzo: TNotifyEvent;
    FOEChangecbxRiferi1: TNotifyEvent;
    function CalcolaCoefConv(ACodArtico: String): Double;
    function GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
                          AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): String;
  published
    property  OEClickbtnPrevInd: TNotifyEvent read FOEClickbtnPrevInd write FOEClickbtnPrevInd;
    property  OEExitedtPrezzo: TNotifyEvent read FOEExitedtPrezzo write FOEExitedtPrezzo;
    property  OEChangecbxRiferi1: TNotifyEvent read FOEChangecbxRiferi1 write FOEChangecbxRiferi1;
    procedure PlugIn_PrevInd;
    procedure BTN_PrevInd(Sender: TObject);
    procedure PIClickbtnPrevInd(Sender: TObject);   //  cv dalla 2.18 lo vogliono come bottone indipendente
    procedure PIExitedtPrezzo(Sender: TObject);
    procedure PIChangecbxRiferi1(Sender: TObject);
    procedure GenerazioneOP;
  end;

implementation

uses
  RNumb, RMiscComp, UCoreUtils, Vcl.Controls, Vcl.Dialogs, FPrevInd, SMDBGrid,
  QueryPars, FrmStd, Compf2, RSQL, UCoreTipi, UCoreDB;

// -----------------------------------------------------------------------------
//  Funziona di verifica utenti abilitati
// -----------------------------------------------------------------------------
function Inside(lista, compare : String):Boolean;
var
  SL : TStringList;
begin
  Result := False;
  SL := TStringList.create;
  try
    SL.commatext := lista;
    If SL.indexOf(compare) <> -1 then
      Result := True;
  finally
    FreeAndNil(SL);
  end;
end;
  
procedure TPrevInd.PlugIn_PrevInd;
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
  RedirEvent('edtPrezzo', 'Onexit',  'OEExitedtPrezzo',   'PIExitedtPrezzo');        //  cos� mi aggiorna i prezzi della riga
  RedirEvent('cbxRiferi1','OnChange','OEChangecbxRiferi1','PIChangecbxRiferi1');     //  cos� mi aggiorna lo stato della riga
end;

procedure TPrevInd.PIExitedtPrezzo(Sender: TObject);
begin
  if Assigned(OEExitedtPrezzo) then OEExitedtPrezzo(Sender);
end;

procedure TPrevInd.PIChangecbxRiferi1(Sender: TObject);
begin
  if Assigned(OEChangecbxRiferi1) then OEChangecbxRiferi1(Sender);
end;

procedure TPrevInd.PIClickbtnPrevInd(Sender: TObject);
var
  piDbgrComRig: TSMDBGrid;
  QryTmp: TCSEQuery;
begin
  GetFormComp('dbgrComRig', piDbgrComRig);
  if not assigned(piDbgrComRig) then begin
    showmessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (PIClickbtnPrevInd).');
  end
  else begin
    QryTmp:=TCSEQuery.Create(nil);
    try
      QryTmp.DataBaseName := Azienda.DataBaseName;
      QryTmp.sql.clear;
      QryTmp.sql.Add('select o.id from optes o inner join tipidoc td on o.idtipidoc=td.id '+
                     'where td.tipdoc=''D'' and o.idcomrig='+inttostr(TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger));
      QryTmp.open;
      if QryTmp.isempty then begin
        BTN_PrevInd(Sender)   //   il PI non � creato: lo creo con la loro finestra
      end
      else begin
        if Assigned(OEClickbtnPrevInd) then OEClickbtnPrevInd(Sender);   //   il PI � creato: lo visualizzo con la finestra std
      end;
    finally
      QryTmp.free;
    end;
  end;
end;

procedure TPrevInd.BTN_PrevInd(Sender: TObject);
var
  FrmPrevInd: TFrmPrevInd;
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
     (not assigned(piEdtPrezzo)) then begin
    showmessage('ATTENZIONE: Errore nel collegamento plug-in preventivi industriali (BTN_PrevInd).');
  end
  else begin
    FrmPrevInd:=TFrmPrevInd.create(nil);
    try
      FrmPrevInd.livello:=TFormStd(form).livello;
      FrmPrevInd.idcomrig:=TQueryPars(piDbgrComRig.DataSource.DataSet).FieldByName('id').AsInteger;
      FrmPrevInd.showmodal;
      // if not FrmPrevInd.Abort then begin  //  riportiamo sempre i dati dal preventivo alla riga
      // Riportiamo i dati dal preventivo alla riga se l'utente � abilitato
      if FrmPrevInd.ValidaUtente and
         ((FrmPrevInd.AskAggPrezzoComRig=2) or
          ((FrmPrevInd.AskAggPrezzoComRig=1) and
           (messagedlg('Si desidera Aggiornare la commessa?', mtConfirmation, [mbYes, mbNo], 0)=mrYes)))
      then begin
        if ((piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='') or (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='I')) and (piEdtQta3.getvalue<>0) then
          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta3.getvalue)
        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='M') and (piEdtQta2.getvalue<>0) then
          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta2.getvalue)
        else if (piF2IdArtico.qryf2.fieldbyname('umrpre').asstring='V') and (piEdtQta1.getvalue<>0) then
          piEdtPrezzo.settext(zeroifnull(ExtractVariant(FrmPrevInd.edtTotale.text, importo))/piEdtQta1.getvalue)
        else
          piEdtPrezzo.settext(0);

        PIExitedtPrezzo(Sender);
        PIChangecbxRiferi1(Sender);
      end;
    finally
      FrmPrevInd.free;
    end;
  end;
end;

procedure TPrevInd.GenerazioneOP;
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
  if NewdbgrRighe.SelectedRows.Count > 0 then begin
    Msg := 'Si desidera generare gli Ordini di Produzione per le righe selezionate?';
    if Application.MessageBox(PChar(Msg),
                              PChar(Application.Title),
                              MB_ICONQUESTION + MB_YESNO) = IDYES then begin
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
        if not GetInterfOggetto('objPrdOrPr', 'OPTes', IOrPr, objOPTes) then begin
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

      // Creazione variabile lista righe di commesse per le quali non � stato possibile
      // generarre un Ordine di Produzione
      ListaIdComRig := TStringList.Create;
      ListaIdComRig.Clear;

      // Creazione variabile lista righe di commesse per le quali non � stato possibile
      // generarre un Ordine di Produzione perch� gi� esiste
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
        for I := 0 to NewdbgrRighe.SelectedRows.Count - 1 do begin
          NewqryRighe.Bookmark := NewdbgrRighe.SelectedRows[I];

          // Verifico se la Riga della Commessa ha un Ordine di Produzione
          QryComRigExistsOP.Close;
          QryComRigExistsOP.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
          try
            QryComRigExistsOP.Open;
            if QryComRigExistsOP.Eof then begin
              // Verifico se l'articolo della Riga della Commessa presenta una Distinta Base
              QryArtExistsDB.Close;
              QryArtExistsDB.Params[0].AsString := NewqryRighe.FieldByName('Arti_Codice').AsString;
              QryArtExistsDB.Open;
              if QryArtExistsDB.Eof then begin
                // Verifico se la Riga di Commessa � legata a un Preventivo Industriale
                QryComRigExistsPI.Close;
                QryComRigExistsPI.Params[0].AsInteger := NewqryRighe.FieldByName('Rif_Id').AsInteger;
                QryComRigExistsPI.Open;
                if not QryComRigExistsPI.Eof then begin
                  // Generazione dell'Ordine di Produzione dal Preventivo Industriale legato alla
                  // Riga della Commessa
                  Msg := '';

                  objOPTes.Seek('Id', QryComRigExistsPI.fieldByName('Id').AsInteger);
                  if objOPTes.Found then begin
                    // Determinazione del tipo Documento Ordine di Produzione
                    QryTipiDocOP.Close;
                    QryTipiDocOP.Sql.Text := 'SELECT Id, Tipnum FROM TipiDoc ' +
                                             'WHERE (Tipdoc = ''P'') ' +
                                             'ORDER BY Tipnum ASC';
                    try
                      QryTipiDocOP.Open;
                    except
                      on E: Exception do begin
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
                      on E: Exception do begin
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
                    if Msg <> '' then begin
                      FlagErr := True;
                      Exit;
                    end
                  end;
                end
                else begin
                  // Segnalazione delle Righe di Commessa per le quali non � possibile generare
                  // un Ordine di Produzione
                  ListaIdComRig.Add('Commessa:' +
                                    NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
                                    'Riga: ' +
                                    NewqryRighe.FieldByName('Crig_DESCR').AsString);
                end;
              end
              else begin
                // Generazione dell'Ordine di Produzione dalla Distinta Base con quantit� uguale
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
                  on E: Exception do begin
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
                  on E: Exception do begin
                    Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato il seguente ' +
                           'errore durante la ricerca del numero Ordine di Produzione:' + CRLF + E.Message;
                    FlagErr := True;
                    Exit;
                  end;
                end;

                // Generazione della testata dell'OP relativa all'articolo
                // riportato sulla riga di commessa
                with objOPTes do begin
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

                if not objOPTes.GeneraOP > 0 then begin
                  Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un ' +
                         'errore durante la generazione dell''Ordine di Produzione.';
                  FlagErr := True;
                  Exit;
                end
              end;
            end
            else begin
              // Segnalazione delle Righe di Commessa per le quali non � possibile generare
              // un Ordine di Produzione pergh� ha gia un Ordine di Produzione
              ListaIdComRigOnOP.Add('Commessa:' +
                                    NewqryRighe.FieldByName('TDoc_Descr').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_Anndoc').AsString + ' ' +
                                    NewqryRighe.FieldByName('Ctes_NumDoc').AsString + ' ' +
                                    'Riga: ' +
                                    NewqryRighe.FieldByName('Crig_DESCR').AsString);
            end;
          except
            on E: Exception do begin
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
          if not FlagErr then begin
            DBExec.Commit;
            if (ListaIdComRig.Count = 0) and (ListaIdComRigOnOP.Count = 0) then begin
              Msg := 'Operazione di generazione Ordini di Produzione completata.';
              Application.MessageBox(PChar(Msg),
                                     PChar(Application.Title),
                                     MB_ICONINFORMATION + MB_OK);
            end
            else begin
              Msg := 'Operazione di generazione Ordini di Produzione non � andata a buon fine ' +
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
          else begin
            DBExec.Rollback;
            Msg := 'L''operazione di generazione Ordini di Produzione non � andata a boun fine.' + CRLF + Msg;
            Application.MessageBox(PChar(Msg),
                                   PChar(Application.Title),
                                   MB_ICONERROR + MB_OK);
          end;

        // Distruzione oggetti Qry
        if Assigned(QryTipiDocOP) then begin
          QryTipiDocOP.Close;
          FreeAndNil(QryTipiDocOP);
        end;

        if Assigned(QryNumOP) then begin
          QryNumOP.Close;
          FreeAndNil(QryNumOP);
        end;

        if Assigned(QryArtExistsDB) then begin
          QryArtExistsDB.Close;
          if QryArtExistsDB.Prepared then
            QryArtExistsDB.UnPrepare;
          FreeAndNil(QryArtExistsDB);
        end;

        if Assigned(QryComRigExistsOP) then begin
          QryComRigExistsOP.Close;
          if QryComRigExistsOP.Prepared then
            QryComRigExistsOP.UnPrepare;
          FreeAndNil(QryComRigExistsOP);
        end;

        if Assigned(QryComRigExistsPI) then begin
          QryComRigExistsPI.Close;
          if QryComRigExistsPI.Prepared then
            QryComRigExistsPI.UnPrepare;
          FreeAndNil(QryComRigExistsPI);
        end;

      end; // end try...finally
    end;
  end
  else begin
    Msg := 'Nessuna riga � stata selezionata.';
    Application.MessageBox(PChar(Msg),
                           PChar(Application.Title),
                           MB_ICONINFORMATION + MB_OK);
  end;
end;

function TPrevInd.CalcolaCoefConv(ACodArtico: String): Double;
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
      case (qryArtSeek.FieldByName('UMRPro').AsString + ' ')[1] of
        'I',' ': tmpUMPrd := ouI;
        'M'    : tmpUMPrd := ouM;
        'V'    : tmpUMPrd := ouV;
      end; // end case
      Result := ConvUMStd(tmpUMPrd,
                          ouI,
                          qryArtSeek.FieldByName('UMI').AsString,
                          qryArtSeek.FieldByName('UMM').AsString,
                          qryArtSeek.FieldByName('UMV').AsString,
                          qryArtSeek.FieldByName('UMRel1').AsString,
                          qryArtSeek.FieldByName('UMRel2').AsString,
                          qryArtSeek.FieldByName('UMRel3').AsString,
                          qryArtSeek.FieldByName('UMRel4').AsString,
                          qryArtSeek.FieldByName('UMCo1').AsString,
                          qryArtSeek.FieldByName('UMCo2').AsString);
    except
      Result := 1;
    end;
  finally
    if Assigned(qryArtSeek) then begin
      qryArtSeek.Close;
      FreeAndNil(qryArtSeek);
    end;
  end;
end;

function TPrevInd.GeneraOPdaPI(AIdOPTes, AIdTipiDoc, AAnnop, ANumop: Integer; ATipnum: String;
                               AQtaOP: Double; AIdComRig: Integer; AobjOrPr: TOrPr): String;
var
  Msg: String;
  tmpOPDT: TCampiOPDT;
  CampiCauMov: TCauMov;
  tmpNewDocPrd: Integer;
  tmpOPTes: TCampiOPTes;
  NewTran: Boolean;
  tmpQry, tmpQry1, QryFas: TCSEQuery;
begin
  Msg := '';

  NewTran := not DBExec.InTransaction;
  if NewTran then DBExec.CSStartTransaction;

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
      idTipiDoc := AIdTipiDoc;
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

    AobjOrPr.SetCampi('idTipiDoc', AIdTipiDoc);
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
    if tmpNewDocPrd = -1 then begin
      Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
             'nell''inserimento della testata dell''Ordine di Produzione.';
      Exit;
    end;

    // OPLotF
    if Msg = '' then
      if not AobjOrPr.GeneraOPLotF(tmpNewDocPrd) then begin
        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
               'nella generazione lotti.';
        Exit;
      end;

    // OPDT
    if Msg = '' then begin
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
      while not tmpQry.Eof do begin
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
        AobjOrPr.SetCampiOPDT('sequen',  tmpQry.FieldByName('Sequen').AsInteger);
        AobjOrPr.SetCampiOPDT('livello', tmpQry.FieldByName('Livello').AsInteger);
        AobjOrPr.SetCampiOPDT('idpadre', tmpQry1.FieldByName('Id').AsInteger);
        if tmpQry.FieldByName('Livello').AsInteger = 0 then
          AobjOrPr.SetCampiOPDT('idartico', tmpOPTes.idartico)
        else
          AobjOrPr.SetCampiOPDT('idartico', tmpQry.FieldByName('Idartico').AsInteger);
        AobjOrPr.SetCampiOPDT('idlink',   tmpQry.FieldByName('Idlink').AsInteger);
        AobjOrPr.SetCampiOPDT('qtimco',   tmpQry.FieldByName('Qtimco').AsFloat);
        AobjOrPr.SetCampiOPDT('tipord',   tmpQry.FieldByName('Tipord').AsString);
        AobjOrPr.SetCampiOPDT('riferi',   tmpQry.FieldByName('Riferi').AsString);
        AobjOrPr.SetCampiOPDT('note',     tmpQry.FieldByName('Note').AsString);
        AobjOrPr.SetCampiOPDT('codvardb', tmpQry.FieldByName('Codvardb').AsString);
        AobjOrPr.SetCampiOPDT('CCCRea',   tmpQry.FieldByName('CCCRea').asInteger);
        // ...SF 26/01/2018

        tmpQry1.Close;
        if AobjOrPr.InsertDT = -1 then begin
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
    if Msg = '' then begin
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
    if Msg = '' then begin
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
      while not tmpQry.Eof do begin
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
        AobjOrPr.SetCampiSdlM('idopdt',  tmpQry1.FieldByName('Id').AsInteger);
        AobjOrPr.SetCampiSdlM('idartico',tmpOPTes.Idartico);
        AobjOrPr.SetCampiSdlM('sequen',  tmpQry.FieldByName('Sequen').AsInteger);
        AobjOrPr.SetCampiSdlM('cosavv',  tmpQry.FieldByName('Cosavv').AsFloat);
        AobjOrPr.SetCampiSdlM('coslav',  tmpQry.FieldByName('Coslav').AsFloat);
        AobjOrPr.SetCampiSdlM('coscic',  tmpQry.FieldByName('Coscic').AsFloat);
        AobjOrPr.SetCampiSdlM('tipcos',  tmpQry.FieldByName('Tipcos').AsString);
        AobjOrPr.SetCampiSdlM('lticic',  tmpQry.FieldByName('Lticic').AsFloat);
        AobjOrPr.SetCampiSdlM('tiptem',  tmpQry.FieldByName('Tiptem').AsString);
        AobjOrPr.SetCampiSdlM('cossch',  ZERO);
        AobjOrPr.SetCampiSdlM('qtimco',  tmpQry.FieldByName('Qtimco').AsFloat);
        AobjOrPr.SetCampiSdlM('completo',False);
        AobjOrPr.SetCampiSdlM('note',    tmpQry.FieldByName('Note').AsString);
        // ...SF 26/01/2018

        tmpQry1.Close;
        if AobjOrPr.InsertSdlM = -1 then begin
          Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
                 'nell''inserimento della Scheda di Lavorazione Materiali.';
          Break;
        end
        else begin
          // OPSdlFas
          QryFas.Close;
          QryFas.Params[0].asInteger := tmpQry.FieldByName('id').asInteger;
          QryFas.Open;
          while not QryFas.Eof do begin
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

            AobjOrPr.SetCampiSdlF('idoptes',   tmpNewDocPrd);
            AobjOrPr.SetCampiSdlF('idopsdlmat',AobjOrPr.CampiOPSdlM.id);
            AobjOrPr.SetCampiSdlF('sequen',    QryFas.FieldByName('Sequen').AsInteger);
            AobjOrPr.SetCampiSdlF('idlav',     QryFas.FieldByName('Idlav').AsInteger);
            AobjOrPr.SetCampiSdlF('idRiCiLa',  QryFas.FieldByName('Idricila').asInteger);
            AobjOrPr.SetCampiSdlF('fltrasf',   (QryFas.FieldByName('Fltrasf').AsInteger = -1));
            AobjOrPr.SetCampiSdlF('idtiplav',  QryFas.FieldByName('Idtiplav').AsInteger);
            AobjOrPr.SetCampiSdlF('attrezzo',  QryFas.FieldByName('Attrezzo').AsString);
            AobjOrPr.SetCampiSdlF('iddipend',  QryFas.FieldByName('Iddipend').AsInteger);
            AobjOrPr.SetCampiSdlF('idstslav',  QryFas.FieldByName('Idstslav').AsInteger);
            AobjOrPr.SetCampiSdlF('cosuni',    QryFas.FieldByName('Cosuni').AsFloat);
            AobjOrPr.SetCampiSdlF('cosuniMA',  QryFas.FieldByName('Cosunima').AsFloat);
            AobjOrPr.SetCampiSdlF('cossch',    ZERO);
            AobjOrPr.SetCampiSdlF('temavv',    QryFas.FieldByName('Temavv').AsFloat);
            AobjOrPr.SetCampiSdlF('avvsch',    ZERO);
            AobjOrPr.SetCampiSdlF('temese',    QryFas.FieldByName('Temese').AsFloat);
            AobjOrPr.SetCampiSdlF('esesch',    ZERO);
            AobjOrPr.SetCampiSdlF('totsch',    ZERO);
            AobjOrPr.SetCampiSdlF('prdora',    QryFas.FieldByName('Prdora').AsFloat);
            AobjOrPr.SetCampiSdlF('prdott',    QryFas.FieldByName('Prdott').AsFloat);
            AobjOrPr.SetCampiSdlF('micatt',    QryFas.FieldByName('Micatt').AsFloat);
            AobjOrPr.SetCampiSdlF('macatt',    QryFas.FieldByName('Macatt').AsFloat);
            AobjOrPr.SetCampiSdlF('tematt',    QryFas.FieldByName('Tematt').AsFloat);
            AobjOrPr.SetCampiSdlF('fruomo',    QryFas.FieldByName('Fruomo').AsFloat);
            AobjOrPr.SetCampiSdlF('sovfas',    QryFas.FieldByName('Sovfas').AsFloat);
            AobjOrPr.SetCampiSdlF('datcar',    0);
            AobjOrPr.SetCampiSdlF('datsca',    0);
            AobjOrPr.SetCampiSdlF('note',      QryFas.FieldByName('Note').AsString);
            AobjOrPr.SetCampiSdlF('idinfosl',  0);
            AobjOrPr.SetCampiSdlF('iddoc',     0);
            // ...SF 26/01/2018

            if AobjOrPr.InsertSdlF = -1 then begin
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
      if not AobjOrPr.RicValTeo(tmpNewDocPrd) then begin
        Msg := 'La personalizzazione software "PI_Altag_PrevInd" ha generato un errore ' +
               'nel Ricalcolo dei costi teorici.';
        Exit;
      end; // if

  finally
    if Assigned(tmpQry) then begin
      tmpQry.Close;
      FreeAndNil(tmpQry);
    end;

    if Assigned(tmpQry1) then begin
      tmpQry1.Close;
      tmpQry1.UnPrepare;
      FreeAndNil(tmpQry1);
    end;

    if Assigned(QryFas) then begin
      QryFas.Close;
      QryFas.UnPrepare;
      FreeAndNil(QryFas);
    end;

    // Ciusura della transazione
    if NewTran then
      if Msg = '' then
        DBExec.Commit
      else begin
        DBExec.RollBack;
        Result := Msg;
      end
    else
      Result := Msg;
  end; // end try...finally
end;

initialization
  // Identificativo modulo
   CSW___BPL_Identity :='PI_AltagMi_PrevInd';

  if (CfgSAMFile.SectionExists('PI_Altag_PrevInd')) then
  begin
    if Inside( CfgSamFile.ReadString('PI_Altag_PrevInd', 'Utenti', ''), IntToStr(Utente.Id) ) then
    begin
      RegisterPlugIn('PI_AltagMi_PrevInd', TPrevInd);
    end;
  end;

finalization
  UnRegisterPlugIn('PI_AltagMi_PrevInd');
end.
