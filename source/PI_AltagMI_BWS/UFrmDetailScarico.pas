unit UFrmDetailScarico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, CSButtons, s3registry, UCoreTipi,
  OLEDBComponents, CSETables, Vcl.Grids, Vcl.DBGrids, SMDBGrid, updtmsgbox, ucoreinterface,
  Data.DB, s3db, csctipi, ucoredb;

type
  TFrmDetailScarico = class(TForm)
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
    procedure griddettaglioColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetailScarico: TFrmDetailScarico;

implementation



{$R *.dfm}

procedure TFrmDetailScarico.BtnChiudiClick(Sender: TObject);
begin
  close;
end;

procedure TFrmDetailScarico.BtneliminarigaClick(Sender: TObject);
var
  PDTRig: IObjStd;
  LMsg: string;
  I: Integer;
begin
  if griddettaglio.SelectedRows.Count > 0 then
  begin
    if not GetInterfOggetto('ObjPDTRig', 'PDTRig', IObjStd, PDTRig) then
    begin
      LMsg := 'Si è verificato un errore durante l''inizializzazione del Modulo BWS ' +
              'per l''interfaccia Preparazione Spedizioni.';
      MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
      Exit;
    end;

    for I := 0 to griddettaglio.SelectedRows.Count-1 do
    begin
      griddettaglio.GotoSelection(i);

      PDTRig.Seek('ID', qr_dettaglio.FieldByName('id').AsInteger);
      if PDTRig.Found then
      begin
        PDTRig.Elimina(qr_dettaglio.FieldByName('id').AsInteger);

      end;
    end;
    griddettaglio.RefreshData;
  end;

end;

procedure TFrmDetailScarico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  griddettaglio.SaveToIniFile;
end;

procedure TFrmDetailScarico.FormCreate(Sender: TObject);
begin
  qr_dettaglio.DataBaseName := dbexec.DatabaseName;
end;

procedure TFrmDetailScarico.FormShow(Sender: TObject);
begin
  griddettaglio.IniFileName := Glo.IniUtente;
  griddettaglio.inisection := 'FrmdetailScarico_griddettaglio_'+azienda.id;
  griddettaglio.LoadFromIniFile;
  griddettaglio.RefreshData;
end;



procedure TFrmDetailScarico.griddettaglioColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  griddettaglio.SaveToIniFile;
end;

end.
