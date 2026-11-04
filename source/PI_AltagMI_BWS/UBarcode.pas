unit UBarcode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, CSEdit;

type
  TFrmBarcode = class(TForm)
    edtBarcode: TCSEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure edtBarcodeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBarcode: TFrmBarcode;

implementation

{$R *.dfm}

procedure TFrmBarcode.edtBarcodeExit(Sender: TObject);
begin
  if edtBarcode.AsString <> '' then
    close;
end;

end.
