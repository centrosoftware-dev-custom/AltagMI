(******************************************************************************
 *                         I N F O R M A Z I O N I                            *
 ******************************************************************************
 Cliente : Altag
 RI: 11091
 Autore : Leonardo Burchi
 Data Creazione : 15/02/2013
 Data Ultima Modifica : 15/02/2013
 Descrizione : Selezione lotti specifici in DDT per articolo generico
 In DDT aggiungo la possibilità di selezionare lotti di articolo specifico a 
fronte di una riga di articolo generico. Gli articoli specifici hanno stessa 
marca, gruppo e classe del generico
 ******************************************************************************
 *                        I S T R U Z I O N I ! ! !                           *
 ******************************************************************************
 SAM.CFG
 [Moduli]
 PI_Altag_SelLottiSpecDDT=Selezione lotti specifici in DDT per articolo generico

 Extfun.ini
 [FrmBolle]
 AUTORUN=PI_Altag_SelLottiSpecDDT.AvviaDDT
*)
unit USelLottiSpecDDT;

interface

uses
  S3Plugin, System.Classes, System.SysUtils, CSToolBar, Vcl.Forms, FrmSelLottiSpec,
  SMDBGrid, UVarie, Winapi.Windows, CompF2, Vcl.StdCtrls, S3Registry, IBase,
  UVArieLottiSpec;

type
TSelLottiSpecDDT = class(TCustomPlugIn)
private
  procedure AddButton;
published
  procedure ClickBtn(Sender: TObject);
  procedure avviaDDT;
end;


implementation

uses UCoreTipi, CSFileCfg;

procedure TSelLottiSpecDDT.AddButton;
var
  PnlSpeedBar: TCSToolBar;
  BtnAdded: TCSToolBarButton;
begin
  if not GetFormComp('CSToolbar1', PnlSpeedBar) then
    exit;
  PnlSpeedBar.AddToolBarControl(TCSToolBarSeparator.Create(PnlSpeedBar));
  BtnAdded := TCSToolBarButton.Create(PnlSpeedBar);
  BtnAdded.ShowCaption := true;
  BtnAdded.Caption := 'Materie Prime';
  BtnAdded.Hint := 'Seleziona lotti formato';
  BtnAdded.OnClick := ClickBtn;
  BtnAdded.GlyphLibraryIndex := 302;
  PnlSpeedBar.AddToolBarControl(BtnAdded);
end;

procedure TSelLottiSpecDDT.ClickBtn(Sender: TObject);
var frm: TFSelLottiSpec;
    dbgrComRig: TSMDBGrid;
    F2IDCauMovRig: TF2;
    iniFile: TCSFileCfg;
    idCauMovFatRig: integer;
    edtPosRif: TEdit;
    idMarche: TStringList;
    ObjArtico: IArticoStd;
begin
  GetFormComp('dbgrComRig',dbgrComRig);
  GetFormComp('F2IDCauMovRig', F2IDCauMovRig);
  GetFormComp('edtPosRif',edtPosRif);
  GetInterfOggetto('ObjArticoli', 'ARTICO', IArticoStd, ObjArtico);

  if dbgrComRig.DataSource.DataSet.FieldByName('IDARTICO').AsInteger = 0 then
  begin
    Messaggio('E'' necessario selezionare una riga con articolo compilato',Application.Title,MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  iniFile := TCSFileCfg.Create(Glo.UserPath + 'PI_Altag_SelLottiSpecDDT.ini');

  IDCauMovFatRig := iniFile.ReadInteger('IDCAUFATRIG','IDCAUMOVFATRIG',0);

  idMArche := TStringList.Create;
  idMarche.CommaText := iniFile.ReadString('IDMARCHE','IDMARCHE','');

  ObjArtico.Seek('ID',getIDArticoFromLotser(dbgrComRig.DataSource.DataSet.FieldByName('IDARTICO').AsInteger));

  if F2IDCauMovRig.KeyValue = idCauMovFatRig then
  begin
    Messaggio('E'' necessario selezionare una riga con causale diversa',Application.Title,MB_ICONINFORMATION + MB_OK);
    exit;
  end;


  frm := TFSelLottiSpec.Create(Self);

  try
    frm.IDFatRig := dbgrComRig.DataSource.DataSet.FieldByName('ID').AsInteger;
    frm.IDLotSer := dbgrComRig.DataSource.DataSet.FieldByName('IDARTICO').AsInteger;

    if idMarche.IndexOf(ObjArtico.CampiObj['IDMARCHE']) >= 0 then
    begin
      frm.PosRif := edtPosRif.Text;
    end
    else
      frm.posrif := '';

    frm.ShowModal;

    dbgrComRig.RefreshData;

  finally
    freeandnil(frm);
  end;
end;

procedure TSelLottiSpecDDT.avviaDDT;
begin
  addButton;
end;


initialization
  // Identificativo modulo
  CSW___BPL_Identity :='PI_AltagMI_SelLottiSpecDDT';

  RegisterPlugIn('PI_AltagMI_SelLottiSpecDDT', TSelLottiSpecDDT);
finalization
  UnRegisterPlugIn('PI_AltagMI_SelLottiSpecDDT');

end.
