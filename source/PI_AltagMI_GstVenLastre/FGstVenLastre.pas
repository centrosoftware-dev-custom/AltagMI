unit FGstVenLastre;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs,
  SMDBGrid, Data.DB, QueryPars, OLEDBComponents, Vcl.Grids, Vcl.DBGrids,
  Vcl.Controls, Vcl.StdCtrls, Compf2, Vcl.ExtCtrls, UCoreDB, CSETables, UCoreTipi;

type
  TFrmGstVenLastre = class(TForm)
    Panel1: TPanel;
    cbxViste: TSelBox;
    Label1: TLabel;
    DBGrid1: TSMDBGrid;
    SrcList: TDataSource;
    QryList: TQueryPars;
    procedure FormCreate(Sender: TObject);
    procedure cbxVisteChange(Sender: TObject);
  private
    lsNomiViste: String;
    procedure SettaCombo;
    function Leggi_Ini: Boolean;
    procedure PreparaGrid;
  public
    IdComRig: Integer;
  end;

implementation

uses RString, RSQL, CSTipiCommon, CSFileCfg;


{$R *.DFM}


{ TFrmGstVenLastre }

function TFrmGstVenLastre.Leggi_Ini: Boolean;
var strPath,Percorso, NomeFile : String;
    INIF:TCSFileCfg;
begin
  NomeFile:= 'PI_Altag.ini';
  strPath := ExtractFilePath(Application.ExeName);
  Percorso := strPath +  NomeFile; // da leggere nell .ini
  Result:= False;
  // Valori di Default dal .ini (idvaluta Euro, percorso dat articolo/qta)
  If FileExists(Percorso) then
  begin
    INIF := TCSFileCfg.Create(Percorso);
    If Assigned(INIF) then begin
      lsNomiViste:= INIF.ReadString('Viste', 'lsNomiViste', '');

      if lsNomiViste='' then
          MessageDlg('Inserire i parametri obbligatori nel file '+NomeFile+'.'+CRLF+
                     '[Viste]'+CRLF+
                     'lsNomiViste='+ lsNomiViste, mtError, [mbOK], 0)

      else
        Result:= True;

      INIF.free;
    end;
  end
  else
    Showmessage('Il file di configurazione '+NomeFile+' non è presente nella directory del plugin');
end;

procedure TFrmGstVenLastre.SettaCombo;
var I: Integer;
begin
  // Assegno combo
  for I := 0 to (CS_Count_Values(lsNomiViste) - 1) do
  begin
    cbxViste.Items.Add(CS_Extract_SubStr(lsNomiViste,';', I));
    cbxViste.ItemsDeco.Add(CS_Extract_SubStr(lsNomiViste,';', I));
  end;

end;

procedure TFrmGstVenLastre.FormCreate(Sender: TObject);
begin
  Leggi_Ini;
  SettaCombo;
  QryList.DatabaseName:= Azienda.DatabaseName;
end;

procedure TFrmGstVenLastre.cbxVisteChange(Sender: TObject);
var ls : TstringList;
begin
  QryList.Close;
  PreparaGrid;

  if CSTableExists(Azienda, cbxViste.Text) <> '' then
  begin
    MessageDlg('Attenzione!'+CRLF+'La vista non esiste.', mtWarning, [mbOK], 0);
    exit;
  end;

  ls:=Tstringlist.create;
  ls.add('ORD=ASC');
  DBGrid1.SetOrderListCol(ls);
  ls.free;

  QryList.SQL.Text:= 'Select * from '+cbxViste.Text+' '+
                     'where IdComRig='+CS_KeyValueTo_SqlStr(IdComRig);
  DBGrid1.RefreshData;
end;

procedure TFrmGstVenLastre.PreparaGrid;
var QryCampi: TCSEQuery;
    NewCampiGrid : TGridCampi;

  procedure ImpostaCampo(nome,titolo:String; Tipo:Tipodato);
  begin
    NewCampiGrid.FieldName := nome;
    NewCampiGrid.Titolo    := titolo;
    NewCampiGrid.Tipo      := tipo;
    NewCampiGrid.Width     := 100;
    NewCampiGrid.Align     := taLeftJustify;
    NewCampiGrid.EnableOrd := true;
    NewCampiGrid.EnableTot := true;
  end;

  procedure AggiungiCampoSMDBGrid(Grid: TSMDBGrid; campo: TGridCampi);
  var i:smallint;
  begin
    for i:= 0 to Grid.Columns.count-1 do
    begin
      // se la colonna esiste non la creo
      if uppercase(Grid.Columns[i].FieldName)=uppercase(campo.FieldName) then
        exit;
    end;
    Grid.Columns.Add;
    i:=Grid.Columns.count-1;
    Grid.Columns[i].Expanded        := False;
    Grid.Columns[i].Visible         := True;
    Grid.Columns[i].Alignment       := campo.Align;
    Grid.Columns[i].FieldName       := campo.FieldName;
    Grid.Columns[i].Width           := campo.Width;
    Grid.Columns[i].Color           := clWhite;
    Grid.Columns[i].Title.Caption   := campo.Titolo;
    Grid.Columns[i].Title.Alignment := taCenter;
    if (campo.Tipo=DareAvere)then
    begin
      TS3Column(Grid.Columns[i]).DataType := dtCombinato;
      TS3Column(Grid.Columns[i]).MappaValori.add('-1=A');
      TS3Column(Grid.Columns[i]).MappaValori.add('1=D');
    end
    else if (campo.Tipo=Stringa) or (campo.Tipo=Anno) then
    begin
      TS3Column(Grid.Columns[i]).DataType := dtTesto;
    end
    else if (campo.Tipo=Int16) or (campo.Tipo=Int32) then
    begin
      TS3Column(Grid.Columns[i]).DataType := dtNumerico;
      TS3Column(Grid.Columns[i]).ThousandSep := False;
    end
    else if (campo.Tipo=Importo) or (campo.Tipo=Quantita) then
    begin
      TS3Column(Grid.Columns[i]).DataType  := dtNumerico;
      TS3Column(Grid.Columns[i]).FormatZero:= fzDecimal;
      if (campo.Tipo=Importo) then
        TS3Column(Grid.Columns[i]).DigitsDec:= 5;
    end
    else if campo.Tipo=Perc then
    begin
      TS3Column(Grid.Columns[i]).DataType   := dtNumerico;
      TS3Column(Grid.Columns[i]).PercSign   := True;
      TS3Column(Grid.Columns[i]).FormatZero := fzDecimal;
    end
    else if campo.Tipo=SoloData then
    begin
      TS3Column(Grid.Columns[i]).DataType   := dtData;
    end
    else if campo.Tipo=Booleano then
    begin
      TS3Column(Grid.Columns[i]).DataType   := dtSiNo;
    end;
  end;

begin
  QryCampi:= TCSEQuery.Create(nil);
  QryCampi.DatabaseName:= Azienda.DatabaseName;
  try // finally
    DBGrid1.Columns.Clear;

    QryCampi.SQL.Text:= 'Select o.name, c.name NomeCol, t.name, c.xType '+
                        'From SysColumns c '+
                        'inner join SysObjects o on c.Id=o.id '+
                        'inner join SysTypes t on c.xType=t.xType '+
                        'where o.name='+CS_VariantTo_SqlStr(cbxViste.Text)+' '+
                        'order by c.colid';
    QryCampi.Open;

    while not QryCampi.Eof do
    begin
      // - Aggiunge i campi alla griglia
      if (QryCampi.fieldByName('xType').AsInteger=175)
        or (QryCampi.fieldByName('xType').AsInteger=167)
        or (QryCampi.fieldByName('xType').AsInteger=35) then
        ImpostaCampo(QryCampi.fieldByName('NomeCol').AsString, QryCampi.fieldByName('NomeCol').AsString, stringa)
      else
      if (QryCampi.fieldByName('xType').AsInteger=56)
        or (QryCampi.fieldByName('xType').AsInteger=108)
        or (QryCampi.fieldByName('xType').AsInteger=52) then
        ImpostaCampo(QryCampi.fieldByName('NomeCol').AsString, QryCampi.fieldByName('NomeCol').AsString, Int16)
      else
      if (QryCampi.fieldByName('xType').AsInteger=106)
        or (QryCampi.fieldByName('xType').AsInteger=62) then
        ImpostaCampo(QryCampi.fieldByName('NomeCol').AsString, QryCampi.fieldByName('NomeCol').AsString, Importo);

      AggiungiCampoSMDBGrid(DBGrid1, NewCampiGrid);
      QryCampi.Next;
    end;

  finally
    FreeAndNil(QryCampi);
  end;

end;

end.
