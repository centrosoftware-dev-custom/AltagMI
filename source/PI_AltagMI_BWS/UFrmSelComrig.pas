unit UFrmSelComrig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  SMDBGrid, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmComrig = class(TForm)
    BitBtn1: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    DS: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmComrig: TFrmComrig;

implementation

{$R *.dfm}

end.
