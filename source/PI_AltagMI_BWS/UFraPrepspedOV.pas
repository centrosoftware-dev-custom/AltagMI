unit UFraPrepspedOV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, OLEDBComponents,
  CSETables, Vcl.Grids, Vcl.DBGrids, SMDBGrid, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, CSEdit, CsLabel, CSButtons;

type
  TFra_PrepspedOV = class(TFrame)
    PgcCtrl: TPageControl;
    Testata: TTabSheet;
    Griglia: TTabSheet;
    NewRiga: TTabSheet;
    QRighepreparate: TCSEQuery;
    DS_RighePreparate: TDataSource;
    GridRighepreparate: TSMDBGrid;
    lbl_datalotto: TLabel;
    lblGiacenza: TLabel;
    edtDataLotto: TCSEdit;
    EdtNewTestata: TCSEdit;
    LblNewBamTes: TLabel;
    EdtNumSpedizione: TCSEdit;
    lblNumSpedizione: TLabel;
    lblDesVettore: TLabel;
    LblVETT: TLabel;
    GroupBox2: TGroupBox;
    lbl_cartoni: TLabel;
    Btngiacenze: TButton;
    btnPezzoSingolo: TBitBtn;
    Pnlbuttons: TPanel;
    btnBarcode: TCSBitBtn;
    btnDetail: TCSBitBtn;


    procedure GridRighepreparateDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnEliminaPreparazioneClick(Sender: TObject);
    procedure GridRighepreparateColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    DERRALIM : string;
  end;

implementation

uses
  UPDTMsgBox, UCoreTipi, S3Registry, UCoreInterface, UCoreDB, RSQL, UFrmDetailScarico;

{$R *.dfm}

procedure TFra_PrepspedOV.btnEliminaPreparazioneClick(Sender: TObject);
var
  PDTRig: IObjStd;
  Lidcomrig: integer;
  Lqry : TCSEQuery;
  LMsg: string;
begin
  if QRighePreparate.RecordCount > 0 then
  begin
    if MessaggioPDT('Eliminare i movimenti relativi alla riga selezionata?', APPTITLE, MB_YESNO) = mrYes then
    begin
      if not GetInterfOggetto('ObjPDTRig', 'PDTRig', IObjStd, PDTRig) then begin
        LMsg := 'Si è verificato un errore durante l''inizializzazione del Modulo BWS ' +
               'per l''interfaccia Preparazione Spedizioni.';
        MessaggioPDT(LMsg, APPTITLE, MB_ICONERROR + MB_OK);
        Exit;
      end;
      Lidcomrig := QRighepreparate.FieldByName('IDCOMRIG').AsInteger;
      try
        Lqry := TCSEQuery.Create(nil);
        Lqry.DataBaseName := DBExec.DatabaseName;
        Lqry.SQL.Text := 'SELECT ID FROM PDTRIG WHERE IDCOMRIG = ' + CS_KeyValueTo_SqlStr(Lidcomrig);
        Lqry.Open;
        while not Lqry.Eof do
        begin
          PDTRig.Seek('ID', Lqry.FieldByName('ID').AsInteger);
          if PDTRig.Found then
          begin
            PDTRig.Elimina(Lqry.FieldByName('ID').AsInteger);
          end;

          Lqry.Next;
        end;
        GridRighepreparate.RefreshData;
      finally
        FreeAndNil(Lqry);
      end;


    end;

  end;

end;

procedure TFra_PrepspedOV.GridRighepreparateColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  GridRighepreparate.savetoinifile;
end;

procedure TFra_PrepspedOV.GridRighepreparateDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if QRighepreparate.FieldByName('StatoRiga').AsString = 'rosso' then
  begin
    GridRighepreparate.Canvas.Brush.Color := clRed;
    GridRighepreparate.Canvas.font.Color := clWhite;
  end;

  if QRighepreparate.FieldByName('StatoRiga').AsString = 'giallo' then
  begin
    GridRighepreparate.Canvas.Brush.Color := clYellow;
    GridRighepreparate.Canvas.font.Color := clBlack;
  end;

  if QRighepreparate.FieldByName('StatoRiga').AsString = 'verde' then
  begin
    GridRighepreparate.Canvas.Brush.Color := clGreen;
    GridRighepreparate.Canvas.font.Color := clBlack;
  end;

  GridRighepreparate.DefaultDrawDataCell (Rect, Column.Field, State);
end;

end.
