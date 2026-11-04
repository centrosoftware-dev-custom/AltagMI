unit U_Fra_Clav;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  CSEdit, Vcl.ExtCtrls, Compf2, u_vari_preparazioneDDT, csetables, UVariStd, ucoredb, MsgCore;

type
  TFrameClav = class(TFRame)
    f2DDT: TF2;
    edt_for: TCSEdit;
    F2Forn: TF2;
    edt_lotto: TCSEdit;
    F2Art: TF2;
    edt_qtatot: TCSEdit;
    edt_qta_x_scatola: TCSEdit;
    edt_scatole: TCSEdit;
    F2Vano: TF2;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbl_umx: TLabel;
    TimerFor: TTimer;
    edt_bolla: TCSEdit;
    edt_numlot: TCSEdit;
    edt_numser: TCSEdit;
    Label8: TLabel;
    lbl_forn: TLabel;

    procedure F2ArtKeyChange(Sender: TObject; NewKey, OldKey: Integer);
    procedure SbiancaCampi;
    procedure ResetControls;
    procedure InserisciSuPDTRIG;
    procedure edt_lottoExit(Sender: TObject);
    procedure edt_scatoleChange(Sender: TObject);
    procedure F2FornKeyChange(Sender: TObject; NewKey, OldKey: Integer);
    procedure TimerForTimer(Sender: TObject);
    procedure edt_forExit(Sender: TObject);
    procedure edt_bollaExit(Sender: TObject);
  private
    { Private declarations }
    FIdLotser : integer;
    FidArtico : integer;
    iprepsped : TPrepSped;
  public
    { Public declarations }

  end;

implementation



{$R *.dfm}

procedure TFrameClav.edt_bollaExit(Sender: TObject);
begin
  f2DDT.KeyValue := edt_bolla.AsInteger;
  edt_lotto.SetFocus;
end;

procedure TFrameClav.edt_forExit(Sender: TObject);
begin
  F2Forn.KeyValue := edt_for.AsInteger;
end;

procedure TFrameClav.edt_lottoExit(Sender: TObject);
var
  numlot,numser : string;
begin
  if edt_lotto.AsString <> '' then
  begin
    FidArtico := 0;
    FIdLotser := 0;
    if not iprepsped.ControllaBCU(edt_lotto.AsString,FidArtico,FIdLotser) then
    begin
      edt_lotto.SetFocus;
    end
    else
    begin
      F2Art.KeyValue := FidArtico;
      iprepsped.GetNumlotNumser(Fidlotser,numlot,numser);
      edt_numlot.AsString := numlot;
      edt_numser.AsString := numser;
    end;
    edt_scatole.SetFocus;
  end;
end;

procedure TFrameClav.edt_scatoleChange(Sender: TObject);
begin
  if edt_scatole.AsFloat = 0 then
    edt_qtatot.AsFloat := 0
  else
  begin
    if edt_qta_x_scatola.AsFloat = 0 then
      edt_qtatot.AsFloat := edt_scatole.AsFloat
    else
      edt_qtatot.AsFloat := edt_scatole.AsFloat * edt_qta_x_scatola.AsFloat;
  end;
end;

procedure TFrameClav.F2ArtKeyChange(Sender: TObject; NewKey, OldKey: Integer);
var
  Um1, Um2, Um3: string;
begin

  if newkey <> oldkey then
  begin
    edt_qta_x_scatola.AsFloat := Iprepsped.GetQtaPerScatolaArticolo(newkey);

    iprepsped.getUnitaMisuraArticolo(newkey, Um1, Um2, Um3);
    if um1 <> '' then
      lbl_umx.Caption := um1;
  end;

end;

procedure TFrameClav.F2FornKeyChange(Sender: TObject; NewKey, OldKey: Integer);
var
  qr : tcsequery;
  str_id : string;
begin
  if newkey <> oldkey then
  begin
    qr := tcsequery.Create(nil);
    qr.DataBaseName := dbexec.DatabaseName;
    qr.SQL.text := 'select isnull(ltrim(rtrim(descr1)),'''')+ '' '' +ISNULL(ltrim(rtrim(descr2)),'''')  + '' '' + ISNULL(ltrim(rtrim(indiri)),'''') + '' '' + ISNULL(ltrim(rtrim(cap)),'''') + '' '' + ISNULL(ltrim(rtrim(comune)),'''') + '' ('' + ISNULL (ltrim(rtrim(PROV)),'''') +'')'' as descr ' +
                   ' from persone p ' +
                   'inner join fornitori f ' +
                   '   on f.idpersona = p.id ' +
                   'where f.id = ' + inttostr(newkey);
    qr.Open;
    lbl_forn.Caption := qr.FieldByName('descr').AsString;
    qr.Close;

    qr.SQL.Text := 'select distinct idbam from PDTRIG r inner join BAMTES b on b.ID = r.IDBAM where b.IDFORN = ' + inttostr(newkey);
    qr.Open;
    if not qr.IsEmpty then
    begin
      if qr.RecordCount = 1 then
      begin
        f2DDT.Close;
        f2DDT.WhereSql := 'a.id = ' + inttostr(qr.FieldByName('idbam').AsInteger);
        f2DDT.Open;
        f2ddt.KeyValue := qr.FieldByName('idbam').AsInteger;
        edt_bolla.AsInteger := qr.FieldByName('idbam').AsInteger;
        iprepsped.FresultDDT := qr.FieldByName('idbam').AsInteger;
      end
      else
      begin
        str_id := '';
        while not qr.Eof do
        begin
          if str_id <> '' then
             str_id := str_id + ',';

          str_id := str_id + inttostr(qr.FieldByName('idbam').AsInteger);
          qr.Next;
        end;
        f2ddt.Close;
        f2ddt.WhereSql := 'a.id in (' + str_id + ')';
        f2ddt.Open;
        qr.First;
        f2ddt.KeyValue := qr.FieldByName('idbam').AsInteger;
        iprepsped.FresultDDT := qr.FieldByName('idbam').AsInteger;
      end;
    end
    else
    begin
      f2ddt.Close;
      f2ddt.WhereSql := 'a.id = 0';
      f2ddt.Open;
      f2ddt.keyvalue := 0;
      iprepsped.FresultDDT := 0;
    end;
    qr.Close;
    qr.Free;
    edt_lotto.SetFocus;
  end;
end;

procedure TFrameClav.InserisciSuPDTRIG;
var
  qr_ins : tcsequery;
  qta : double;
begin
  qta := edt_qtatot.AsFloat;
  qr_ins := tcsequery.Create(nil);
  qr_ins.Databasename := dbexec.DatabaseName;
  qr_ins.SQL.text := 'insert into PDTRIG (idlotser,idallmag,idbam,qta1,qta2,qta3,codudc) ' +
                     'values (' + inttostr(FIdLotSer) + ',' +
                                  inttostr(F2Vano.KeyValue) + ',' +
                                  inttostr(f2DDT.KeyValue) + ',' +
                                  stringreplace(floattostr(qta),',','.',[]) + ',' +
                                  stringreplace(floattostr(qta),',','.',[]) + ',' +
                                  stringreplace(floattostr(qta),',','.',[]) + ',0)';

  try
    qr_ins.ExecSQL;
  except
    on e:exception do
    begin
       Application.MessageBox(PChar('Si è verificato il seguente errore' + #10+#13+e.Message),
                           PChar(''),
                           mb_ok + MB_ICONERROR);

    end;
  end;
  qr_ins.Close;
  qr_ins.Free;
end;

procedure TFrameClav.ResetControls;
begin
  edt_for.AsString := '';
  F2Forn.KeyValue := 0;
  edt_bolla.AsInteger := 0;
  f2DDT.Close;
  f2ddt.WhereSql := 'a.id = 0';
  f2ddt.Open;
  f2ddt.KeyValue := 0;

  edt_lotto.AsString := '';
  F2Art.KeyValue := 0;
  F2Vano.KeyValue := 0;
  edt_numlot.AsString := '';
  edt_numser.AsString := '';
  edt_scatole.AsFloat := 0;
  edt_qta_x_scatola.AsFloat := 0;
  edt_qtatot.AsFloat := 0;

  edt_for.SetFocus;
end;

procedure TFrameClav.SbiancaCampi;
begin
  edt_lotto.AsString := '';
  F2Art.KeyValue := 0;
  F2Vano.KeyValue := 0;
  edt_numlot.AsString := '';
  edt_numser.AsString := '';
  edt_scatole.AsFloat := 0;
  edt_qta_x_scatola.AsFloat := 0;
  edt_qtatot.AsFloat := 0;
end;

procedure TFrameClav.TimerForTimer(Sender: TObject);
begin

  TimerFor.Enabled := false;
  edt_for.SetFocus;
end;

end.
