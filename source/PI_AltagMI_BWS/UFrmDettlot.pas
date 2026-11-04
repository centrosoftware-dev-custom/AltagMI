unit UFrmDettlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, SMDBGrid,
  Data.DB, Vcl.StdCtrls, Vcl.Buttons, ucoredb, ucoresecure, ucoretipi;

type
  TFrmDettLotti = class(TForm)
    btnChiudi: TBitBtn;
    DsLot: TDataSource;
    GridLottiDett: TSMDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridLottiDettColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDettLotti: TFrmDettLotti;

implementation

{$R *.dfm}

procedure TFrmDettLotti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GridLottiDett.SaveToIniFile;
end;

procedure TFrmDettLotti.FormShow(Sender: TObject);
begin
  with GridLottiDett do
  begin
    IniFileName := GLO.IniUtente;
    IniSection  := 'FrmDettLotti_NewGridDettGiacLotPS' + azienda.Id;
    LoadFromIniFile;
  end;
end;

procedure TFrmDettLotti.GridLottiDettColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  GridLottiDett.SaveToIniFile;
end;

end.
