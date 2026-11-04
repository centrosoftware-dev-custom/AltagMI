unit UFrmSelLotto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, SMDBGrid, Vcl.ExtCtrls;

type
  TFrmSelLotto = class(TForm)
    pnlGrid: TPanel;
    pnlBtn: TPanel;
    SMDBGrid1: TSMDBGrid;
    btnOk: TBitBtn;
    btnAnnulla: TBitBtn;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelLotto: TFrmSelLotto;

implementation

{$R *.dfm}

end.
