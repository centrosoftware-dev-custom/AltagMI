unit UFrmDetailCarico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, CSButtons, s3registry, UCoreTipi,
  OLEDBComponents, CSETables, Vcl.Grids, Vcl.DBGrids, SMDBGrid, updtmsgbox, ucoreinterface,
  s3db, csctipi, ucoredb, Data.DB;

type
  TFrmDetailCarico = class(TForm)
    GrpBx1: TGroupBox;
    Btneliminariga: TCSBitBtn;
    BtnChiudi: TCSBitBtn;
    griddettaglio: TSMDBGrid;
    qr_dettaglio: TCSEQuery;
    ds_dettaglio: TDataSource;
    procedure BtnChiudiClick(Sender: TObject);
    procedure BtneliminarigaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetailCarico: TFrmDetailCarico;

implementation

{$R *.dfm}

procedure TFrmDetailCarico.BtnChiudiClick(Sender: TObject);
begin
  close;
end;

procedure TFrmDetailCarico.BtneliminarigaClick(Sender: TObject);
var
  PDTRigAcq: IObjStd;
  LMsg: string;
  I: Integer;
begin
  if griddettaglio.SelectedRows.Count > 0 then
  begin
    if not GetInterfOggetto('ObjPDTRigAcq', 'PDTRigAcq', IObjStd, PDTRigAcq) then
    begin
      LMsg := 'Si è verificato un errore durante l''inizializzazione del Modulo BWS ' +
              'per l''interfaccia Preparazione Spedizioni.';
      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
      Exit;
    end;

    for I := 0 to griddettaglio.SelectedRows.Count -1 do
    begin
      griddettaglio.GotoSelection(i);

      PDTRigAcq.Seek('ID', qr_dettaglio.FieldByName('id').AsInteger);
      if PDTRigAcq.Found then
      begin
        PDTRigAcq.Elimina(qr_dettaglio.FieldByName('id').AsInteger);
      end;
    end;
    griddettaglio.RefreshData;
  end;

end;

procedure TFrmDetailCarico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  griddettaglio.SaveToIniFile;
end;

procedure TFrmDetailCarico.FormCreate(Sender: TObject);
begin
  qr_dettaglio.DataBaseName := dbexec.DatabaseName;
  griddettaglio.IniFileName := Glo.IniUtente;
  griddettaglio.inisection := 'Frmdetailcarico_griddettaglio_'+azienda.id;
end;

procedure TFrmDetailCarico.FormShow(Sender: TObject);
begin
  qr_dettaglio.Open;
  griddettaglio.LoadFromIniFile;
  griddettaglio.RefreshData;
end;



end.
