// Cliente: Altag   RI 5045
// Autore: Signorato Federica   30/07/2007

// Gestione Vendite Lastre

// SAM.CFG
// [Moduli]
// PI_Altag_GstVenLastre=Gestione Vendite Lastre

// Extfun.ini
// [FrmComTes]
// AUTORUN=PI_Altag_GstVenLastre.GstVenLastre
// btnPromettibilita=PI_Altag_GstVenLastre.VisVista

// PI_Altag.ini
// [Viste]
// lsNomiViste=v_pippo;v_pluto


unit UGstVenLastre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FRMSTD, Vcl.StdCtrls, Vcl.ExtCtrls, UCoreTipi, UVarie, Vcl.Menus, Vcl.DBCtrls, CompF2, Data.DB,
  Vcl.ComCtrls, CSMemo, CSButtons, RSQL, CSETables, CStd, MemoEx, Vcl.Mask, S3PlugIn,
 CSLinkFile, S3Registry, S3DB, UCoreDB, SMDBGrid, QueryPars;

type
  TLastre = class(TCustomPlugIn)
  public
  private
    FOldRiferi1Exit: TNotifyEvent;
    FOldQta1Exit: TNotifyEvent;
    FOldQta3Exit: TNotifyEvent;
    FOldQta2Exit: TNotifyEvent;
    Procedure RicalcolaQta2;
  published
    procedure GstVenLastre;
    procedure NewRiferi1Exit(Sender: TObject);
    property  OldRiferi1Exit : TNotifyEvent read FOldRiferi1Exit write FOldRiferi1Exit;

    procedure NewQta1Exit(Sender: TObject);
    property  OldQta1Exit : TNotifyEvent read FOldQta1Exit write FOldQta1Exit;
    procedure NewQta2Exit(Sender: TObject);
    property  OldQta2Exit : TNotifyEvent read FOldQta2Exit write FOldQta2Exit;
    procedure NewQta3Exit(Sender: TObject);
    property  OldQta3Exit : TNotifyEvent read FOldQta3Exit write FOldQta3Exit;

    procedure VisVista;
  end;

implementation

uses FGstVenLastre;

procedure TLastre.GstVenLastre;
begin
  RedirEvent('cbxRiferi1', 'OnExit', 'OldRiferi1Exit', 'NewRiferi1Exit');
  RedirEvent('edtQta1', 'OnExit', 'OldQta1Exit', 'NewQta1Exit');
  RedirEvent('edtQta2', 'OnExit', 'OldQta2Exit', 'NewQta2Exit');
  RedirEvent('edtQta3', 'OnExit', 'OldQta3Exit', 'NewQta3Exit');
end;

procedure TLastre.NewQta1Exit(Sender: TObject);
begin
  if (Assigned(OldQta1Exit)) then
    OldQta1Exit(Sender);

  RicalcolaQta2;
end;

procedure TLastre.NewQta2Exit(Sender: TObject);
begin
  if (Assigned(OldQta2Exit)) then
    OldQta2Exit(Sender);

  RicalcolaQta2;
end;

procedure TLastre.NewQta3Exit(Sender: TObject);
begin
  if (Assigned(OldQta3Exit)) then
    OldQta3Exit(Sender);

  RicalcolaQta2;
end;

procedure TLastre.NewRiferi1Exit(Sender: TObject);
begin
  if (Assigned(OldRiferi1Exit)) then
    OldRiferi1Exit(Sender);

  RicalcolaQta2;
end;

procedure TLastre.RicalcolaQta2;
var cbxRiferi1: TComboBox;
    Peso, part1, part2: Double;
    PosX: Integer;
    edtQta1, edtQta2: TGet;
    F2IdArtico: TF2;
    QryArt: TCSEQuery;
begin

  GetFormComp('cbxRiferi1', cbxRiferi1);
  GetFormComp('F2IdArtico', F2IdArtico);
  GetFormComp('edtQta1', edtQta1);
  GetFormComp('edtQta2', edtQta2);

  if F2IdArtico.KeyValue=0 then
    exit;

  if cbxRiferi1.Text='' then
    exit;

  // Se non c'è la X esco
  PosX:= pos('X', UpperCase(cbxRiferi1.Text));
  if PosX=0 then
    exit;

  QryArt:= TCSEQuery.Create(nil);
  QryArt.DatabaseName:= Azienda.DatabaseName;
  try // finally
    QryArt.SQL.Text:= 'Select GLOTTI, GEAMAT, UMI, UMM, UMV, UMRPRE, UMCO1 '+
                      'From lotser l '+
                      'inner join artico a on a.id=l.idartico '+
                      'where l.id='+CS_KeyValueTo_SqlStr(F2IdArtico.KeyValue);
    QryArt.Open;

    if not ((QryArt.FieldByName('GLOTTI').AsInteger=-1)
      and (QryArt.FieldByName('GEAMAT').AsInteger=0)
      and (UpperCase(QryArt.FieldByName('UMM').AsString)='KG')
      and (QryArt.FieldByName('UMRPRE').AsString='M')
      and (QryArt.FieldByName('UMV').AsString=QryArt.FieldByName('UMI').AsString)) then
    exit;

    try // except

      part1:= StrToFloat(copy(cbxRiferi1.Text, 1, (PosX-1)));
      part2:= StrToFloat(copy(cbxRiferi1.Text, PosX+1, length(cbxRiferi1.Text)-PosX));

      Peso:= (((part1*part2)/1000000)*QryArt.FieldByName('UMCO1').AsFloat)*edtQta1.GetValue;

      edtQta2.SetText(Peso);
      if (Assigned(OldQta2Exit)) then
        OldQta2Exit(nil);

      // edtQta2.onexit(Sender);
    except
      ShowMessage('Errore nel calcolo del peso.'+CRLF+
                  'Controllare che nel testo del Riferi1 prima e dopo il caratere X ci siano valori numerici.');
    end;

  finally
    FreeAndNil(QryArt);
  end;
end;

procedure TLastre.VisVista;
var QryComRig: TQueryPars;
    frmGstLastre: TFrmGstVenLastre;
begin
  GetFormComp('QryComRig',QryComRig);
  frmGstLastre:= TFrmGstVenLastre.Create(nil);
  try // finally
    frmGstLastre.IdComRig:= qryComRig.fieldByName('Id').AsInteger;
    frmGstLastre.ShowModal;
  finally
    frmGstLastre.Free;
  end;
end;

initialization
  // Identificativo modulo
  CSW___BPL_Identity :='PI_AltagMI_GstVenLastre';


  RegisterPlugIn('PI_AltagMI_GstVenLastre', TLastre);

finalization
  UnRegisterPlugIn('PI_AltagMI_GstVenLastre');

end.

