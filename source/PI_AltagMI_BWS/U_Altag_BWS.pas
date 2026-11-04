unit U_Altag_BWS;

interface

uses
 S3Plugin, System.Classes, csFilecfg, system.SysUtils, csctipi, Data.SqlTimSt,
  dialogs, CSButtons, extctrls,StdCtrls,  windows, csetables, ucoredb, ivendite, RSQL,
  Vcl.Buttons, vcl.forms, vcl.controls, MsgCore, UcoreTipi, UVarie, UVariStd, csedit;

type
  TBWS_barcode128 = class

private
  // variabili
  //procedure DecodificaBarcode(Barcode : string);
  //function get_gg_shelfLife(idcliente,idartico : Integer):Integer;
public
  class var itemcode : string;
  class var lotto : string;
  class var scadenza : string;
  class var peso : double;
  class var peso3103 : Boolean;
  class var app_str : string;
  //class var Idartico : integer;

  //function LeggiBarcode128 : string;
  function LeggiBarcode128_2 : string;
  function LeggiBarcodePezzoSingolo : string;
  function VerificaLotto(idartico,idcliente,idcommessa,idallmag:Integer;numlot,numser : string; DataScad : TDate) : boolean;
  function VerificaLottoAcquisto(idartico : Integer; dataLotto : tdatetime) : Boolean;
  function GetArticoFromEan(itemcode : string) : integer;
  function GetPesoFissoFromEan(itemcode : string) : Double;
end;

function GetVersion(sFileName: string): string;
function  DLLFileName : string;

implementation


uses
  ibase, s3registry, updtproc, uBarcode, Updtmsgbox;

function  DLLFileName : string;
begin
  SetLength(Result,MAX_PATH);
  GetModuleFileName(HInstance,PCHar(Result),MAX_PATH);
  SetLength(Result,StrLen(PChar(Result)));
end;

function GetVersion(sFileName: string): string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    //Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    //Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);

end;


{ TBWS_barcode128 }

function TBWS_barcode128.GetArticoFromEan(itemcode: string): integer;
var
  Lqry : TCSEQuery;
begin

  if itemcode = '' then
   exit(0);

  Lqry := TCSEQuery.Create(nil);
  Lqry.DataBaseName := DBExec.DatabaseName;
  Lqry.SQL.Text := 'select idartico from barart where ean = ''' + itemcode + '''';
  Lqry.Open;
  if Lqry.IsEmpty then
  begin
    MessaggioPDT('Ean ' + itemcode + ' non presente nella tabella BARART!'+#13+#10+'('+itemcode+')',APPTITLE,MB_OK);
    Lqry.Close;
    Lqry.Free;
    Exit(0);
  end
  else
    Result := Lqry.FieldByName('idartico').AsInteger;
  Lqry.Close;
  Lqry.Free;


end;

function TBWS_barcode128.GetPesoFissoFromEan(itemcode: string): Double;
var
  Lqry : TCSEQuery;
begin
  if itemcode = '' then
   Exit(0);

  Lqry := TCSEQuery.Create(nil);
  Lqry.DataBaseName := DBExec.DatabaseName;
  Lqry.SQL.Text := 'select qta from barart where ean = ''' + itemcode + '''';
  Lqry.Open;
  if Lqry.IsEmpty then
  begin
    MessaggioPDT('Ean non presente nella tabella BARART!'+#13+#10+'('+itemcode+')',APPTITLE,MB_OK);
    Lqry.Close;
    Lqry.Free;
    Exit(0);
  end
  else
    Result := Lqry.FieldByName('qta').Asfloat;
  Lqry.Close;
  Lqry.Free;
end;

{
function TBWS_barcode128.get_gg_shelfLife(idcliente,
  idartico: Integer): Integer;
var
  Lqr : TCSEQuery;
begin
  Lqr := TCSEQuery.Create(nil);
  Lqr.DataBaseName := dbexec.DatabaseName;
  Lqr.SQL.Text := 'select ggduga from artcli where IDCLIENTE = ' +inttostr(idcliente) + ' and idartico = ' + inttostr(idartico);
  Lqr.Open;
  result := Lqr.FieldByName('ggduga').AsInteger;
  Lqr.close;
  Lqr.Free;
end;
}

{
function TBWS_barcode128.LeggiBarcode128 : string;
var
  barcode,
  barcode2 : string;

begin
  frmbarcode := tfrmbarcode.Create(nil);
  frmbarcode.showmodal;
  barcode := FrmBarcode.edtBarcode.AsString;
  result := barcode;
  FrmBarcode.Free;
  peso3103 := false;
  if barcode <> '' then
  begin
    if Pos('(10)',barcode) = 0 then
    begin
      frmbarcode := tfrmbarcode.Create(nil);
      frmbarcode.showmodal;
      barcode2 := FrmBarcode.edtBarcode.AsString;
      FrmBarcode.Free;
      if barcode2 = '' then
      begin
        MessageDlg('Barcode non valido',mtInformation,[mbok],0);
        abort;
      end;
      if Pos('(10)',barcode2) = 0 then
      begin
        MessageDlg('Codice a barre non corretto!',mtInformation,[mbok],0);
        Abort;
      end;
      barcode := barcode + barcode2;
    end;
    DecodificaBarcode(barcode);
  end;
end;
}
function TBWS_barcode128.LeggiBarcode128_2 : string;
var
  barcode,
  barcode2,
  Item01,
  Item15,
  Item17,
  Item3103,
  Item10 : string;
begin
  itemcode := '';
  lotto := '';
  scadenza := '';
  peso := 0;
  peso3103 := false;

  frmbarcode := tfrmbarcode.Create(nil);
  frmbarcode.showmodal;
  barcode := FrmBarcode.edtBarcode.AsString;
  result := barcode;
  FrmBarcode.Free;
  peso3103 := false;
  if barcode <> '' then
  begin
    item01 := Copy(barcode,3,14);
    app_str := Copy(barcode,17);
    if Copy(app_str,1,2) = '15' then
    begin
      Item15 := Copy(app_str,3,6);
      Item17 := '';
    end
    else
    begin
      Item17 := Copy(app_str,3,6);
      Item15 := '';
    end;
    app_str := Copy(app_str,9);

    if app_str = '' then
    begin
      frmbarcode := tfrmbarcode.Create(nil);
      frmbarcode.showmodal;
      barcode2 := FrmBarcode.edtBarcode.AsString;
      FrmBarcode.Free;
      if Copy(barcode2,1,2) = '10' then
      begin
        Item10 := Copy(barcode2,3,20);
      end
      else
      begin
        Item3103 := Copy(barcode2,5,6);
        peso3103 := True;
        app_str := copy(barcode2,11);
        if Copy(app_str,1,2) = '10' then
        begin
          Item10 := Copy(app_str,3);
        end
        else
        begin
          MessaggioPDT('Barcode non valido',apptitle,MB_OK);
          abort;
        end;
      end;
    end
    else
    begin
      if Copy(app_str,1,2) = '10' then
      begin
        Item10 := Copy(app_str,3,20);
        app_str := Copy(app_str,23);
        if app_str = '' then
          Item3103 := ''
        else
        begin
          Item3103 := Copy(app_str,5);
          peso3103 := true;
        end;
      end
      else
      begin
        // per forza 3103
        Item3103 := Copy(app_str,5,6);
        peso3103 := true;
        app_str := Copy(app_str,11);
        if app_str = '' then
        begin
          messaggiopdt('Barcode non valido',apptitle,mb_ok);
          abort;
        end
        else
        begin
          if Copy(app_str,1,2) = '10' then
            Item10 := Copy(app_str,3);
        end;
      end;
     end;

    if peso3103 then
      peso := StrToFloat(Item3103) / 1000;

    lotto := Item10;
    itemcode := Item01;
    if Item15 <> '' then
      scadenza := item15;
    if Item17 <> '' then
      scadenza := Item17;

    scadenza := Copy(scadenza,5,2)+'/'+Copy(scadenza,3,2)+'/20'+copy(scadenza,1,2);

   end;
end;

function TBWS_barcode128.LeggiBarcodePezzoSingolo: string;
begin
  frmbarcode := tfrmbarcode.Create(nil);
  frmbarcode.caption := 'Lettura Barcode EAN 13';
  frmbarcode.showmodal;
  result := FrmBarcode.edtBarcode.AsString;
  FrmBarcode.Free;
end;

function TBWS_barcode128.VerificaLotto(idartico,Idcliente,idcommessa,idallmag : Integer; numlot,
  numser: string;DataScad : tdate) : boolean;
var
  Lqr : TCSEQuery;
  Data_Lotto,
  Data_consegnaConfermata,
  data_ultimo_lotto : double;
  //Shelf_life : integer;
begin
  Result := True;
  Lqr := TCSEQuery.Create(nil);
  Lqr.DataBaseName := DBExec.DatabaseName;
//LS 23/03/2020 Utilizzo i metodi STD di formattazione testo per Qry.
//  Lqr.SQL.Text := 'Select isnull(datrif,0) as datrif from lotser where idartico = ' + inttostr(idartico) + ' and numlot = ''' + numlot + ''' and numser = ''' + numser + '''';
  Lqr.SQL.Text := 'Select isnull(datrif,0) as datrif from lotser where idartico = ' + CS_KeyValueTo_SqlStr(idartico) +
                 ' and numlot = ' + CS_VariantTo_SqlStr(numlot) + ' and numser = ' + CS_VariantTo_SqlStr(numser);
//....LS 23/03/2020 
  Lqr.Open;
  Data_Lotto := Lqr.FieldByName('datrif').AsFloat;
  Lqr.Close;
  {
  if (data_lotto) <> (datascad) then
  begin
    MessaggioPDT('A T T E N Z I O N E : '+CRLF+'La data scadenza del lotto è diversa da quella presente nel barcode',APPTITLE,MB_OK);
  end;
  }
  Lqr.SQL.Text := 'select top 1 datrif ' +
                  '  from Ext_V_LottiCliente ' +
                  ' where idclidest = ' + inttostr(idcliente) +
                  '   and idartico = ' + inttostr(idartico) +
                  ' order by datDoc desc';
  Lqr.Open;
  if not lqr.IsEmpty then
  begin
    data_ultimo_lotto := Lqr.FieldByName('datrif').asfloat;

    if Lqr.FieldByName('datrif').asfloat > Data_Lotto then
    begin
      if MessaggioPDT('Il lotto ' + numlot + CrLf + ' è più vecchio dell''ultimo lotto ' + crlf + 'consegnato al cliente.'+crlf+'Vuoi proseguire?',apptitle,MB_YESNO) =  mrno then
      begin
        Result := false;
        exit;
      end;
    end;
  end
  else
    data_ultimo_lotto := 0;

  Lqr.Close;

  //Shelf_life := get_gg_shelfLife(idcliente,idartico);

  Lqr.SQL.Text := 'select datalimite as data ' +
                  '  from v_bws_DataLimite_commessa ' +
                  ' where idcomtes = ' + IntToStr(idcommessa) +
                  '   and idartico = ' + IntToStr(idartico);
  Lqr.Open;
  Data_consegnaConfermata := Lqr.FieldByName('data').AsFloat;
  //Data_consegnaconfermata := Data_consegnaConfermata + Shelf_life;
  Lqr.Close;
  if Data_Lotto < (Data_consegnaConfermata) then
  begin
    if messaggiopdt('Il lotto ' + numlot + crlf + 'ha scadenza antecedente alla data consegna + gg garanzia.'+crlf+
                    'Data scadenza : ' + DateTimeToStr(data_lotto) + CrLf +
                    'Data minima : ' + DateTimeToStr(Data_consegnaConfermata) + CrLf +
                    'Giorni : ' + inttostr(Trunc(Data_consegnaConfermata-Data_Lotto)) + CrLf +
                    'Vuoi proseguire?',apptitle,MB_YESNO) = mrno then
    begin
      Result := false;
      exit;
    end;
  end;
  Lqr.Close;

  Lqr.SQL.Text := 'select top 1 numlot ' +
                  '  from v_bws_giacenza_articolo ' +
                  ' where idartico = :idartico' +
                  '   and idallmag = :idallmag ' +
                  '   and datrif < :data_lotto ' +
                  '   and datrif > :dataconsegnaconfermata ' +
                  '   and datrif > :dataultimolotto ' +
                  ' order by datrif';

  Lqr.ParamByName('idartico').AsInteger := idartico;
  Lqr.ParamByName('idallmag').AsInteger := idallmag;
  Lqr.ParamByName('data_lotto').AsFloat := Data_Lotto;
  Lqr.ParamByName('dataconsegnaconfermata').AsFloat := Data_consegnaConfermata;
  Lqr.ParamByName('dataultimolotto').Asfloat := data_ultimo_lotto;
  Lqr.Open;
  if not Lqr.IsEmpty then
  begin
    if messaggiopdt('Esiste un lotto con data scadenza inferiore a quello selezionato.' + crlf +
                    Lqr.FieldByName('numlot').AsString + crlf +
                    'Vuoi proseguire?',apptitle,MB_YESNO) = mrno then
    begin
      Result := false;
      exit;
    end;
  end;
  Lqr.Close;
  Lqr.Free;
end;

function TBWS_barcode128.VerificaLottoAcquisto(idartico: Integer; dataLotto: TDateTime): Boolean;
var
  qr : tcsequery;
  SHELF_LIFE_ACQ : integer;
  data_limite : tdatetime;
begin
  Result := true;
  qr := TCSEQuery.Create(nil);
  qr.DataBaseName := DBExec.DatabaseName;
  qr.SQL.Text := 'select SHELF_LIFE_ACQ from sam.articogst where idartico = ' + IntToStr(idartico);
  qr.Open;
  SHELF_LIFE_ACQ := qr.FieldByName('SHELF_LIFE_ACQ').AsInteger;
  qr.Close;
  qr.Free;
  data_limite := Trunc(Now + SHELF_LIFE_ACQ);
  if dataLotto <= data_limite then
  begin
    if messaggiopdt('A T T E N Z I O N E'+crlf+
                    'Data Scad. Lotto : ' + DateTimeToStr(datalotto) + crlf +
                    'Data Shelf life : ' + DateTimeToStr(data_limite) + CrLf +
                    'Giorni : ' + floattostr(trunc(data_limite-datalotto)) + CrLf +
                    'Vuoi proseguire?',apptitle,MB_YESNO) = mrno then
    begin
      Result := false;
      exit;
    end;
  end;

end;

{
procedure TBWS_barcode128.DecodificaBarcode(Barcode: string);
var
  tag : string;
begin
  app_str := Copy(Barcode,5);        // elimino direttamente lo (01) tanto il primo è sempre l'item code
  itemcode := Copy(app_str,1,Pos('(',app_str)-1);
  app_str := Copy(app_str,pos('(',app_str));
  while Pos('(',app_str) > 0 do
  begin
    tag := Copy(app_str,2,2);
    if tag = '10' then
    begin
       app_str := Copy(app_str,5);
       if Pos('(',app_str) = 0 then
         lotto := app_str
       else
         lotto := Copy(app_str,1,Pos('(',app_str)-1);
       app_str := Copy(app_str,Pos('(',app_str));
    end;
    if tag = '15' then  // scadenza lunga
    begin
      app_str := Copy(app_str,5);
      if Pos('(',app_str) = 0 then
        scadenza := app_str
      else
        scadenza := Copy(app_str,1,Pos('(',app_str)-1);
      app_str := Copy(app_str,Pos('(',app_str));
    end;
    if tag = '17' then // scadenza breve
    begin
      app_str := Copy(app_str,5);
      if Pos('(',app_str) = 0 then
        scadenza := app_str
      else
        scadenza := Copy(app_str,1,Pos('(',app_str)-1);
      app_str := Copy(app_str,Pos('(',app_str));
    end;
    if tag = '31' then   // peso variabile  3103
    begin
      peso3103 := true;
      app_str := Copy(app_str,7);
      if Pos('(',app_str) = 0 then
        peso := StrToFloat(app_str) /1000
      else
        peso := StrToFloat(Copy(app_str,1,Pos('(',app_str)-1)) / 1000;
      app_str := Copy(app_str,Pos('(',app_str));
    end;

  end;
end;
}

end.
