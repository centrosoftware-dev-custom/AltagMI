unit U_Fra_Bam;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Compf2, Vcl.Buttons, CSEdit, u_vari_preparazioneDDT;

type
  TFrmBam = class(TForm)
    F2Tipidoc: TF2;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    F2Vettore: TF2;
    F2Aspbeni: TF2;
    edt_pesoimballo: TCSEdit;
    edt_collipart: TCSEdit;
    edt_colli: TCSEdit;
    edt_pallets: TCSEdit;
    Label2: TLabel;
    edt_pesolordo: TCSEdit;
    edt_pesonetto: TCSEdit;
    btnOK: TBitBtn;
    BtnCancel: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iprepsped : TPrepSped;
  end;

implementation

uses ivendite, s3registry;

{$R *.dfm}

procedure TFrmBam.BtnCancelClick(Sender: TObject);
begin
  iprepsped.FresultDDT := 0;
  close;
end;

procedure TFrmBam.btnOKClick(Sender: TObject);
var
  ObjBamTes: IBamTesStd;
begin
  if f2tipidoc.KeyValue = 0 then
  begin
    messagedlg('Tipo documento non inserito!',mtinformation,[mbok],0);
    f2tipidoc.SetFocus;
  end
  else
  begin
    iprepsped.FresultDDT := iprepsped.generatestataDDT(F2Tipidoc.KeyValue);

    if not Assigned(ObjBamTes) then
    begin
      if not GetInterfOggetto('ObjBamTes', 'BamTes', IBamTesStd, ObjBamTes) then
      begin
        exit;
      end;
    end;
    objbamtes.Seek('id',iprepsped.FresultDDT);
    if objbamtes.Found then
    begin
      objbamtes.CampiObj['idvettore'] := F2Vettore.KeyValue;
      objbamtes.CampiObj['pesoimb']   := edt_pesoimballo.asfloat;
      objbamtes.CampiObj['aspbeni']   := F2Aspbeni.qryF2.FieldByName('descr').AsString;
      objbamtes.CampiObj['collipart'] := edt_collipart.AsInteger;
      objbamtes.CampiObj['colli']     := edt_colli.AsInteger;
      objbamtes.CampiObj['pallets']   := edt_colli.AsInteger;
      objbamtes.CampiObj['lordo']     := edt_pesolordo.AsFloat;
      objbamtes.CampiObj['netto']     := edt_pesonetto.AsFloat;
      objbamtes.Modifica;
    end;

    close;
  end;
  end;

procedure TFrmBam.FormShow(Sender: TObject);
begin
  F2Tipidoc.SetFocus;
end;

end.
