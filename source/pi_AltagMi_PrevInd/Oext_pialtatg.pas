unit Oext_pialtatg;

interface

uses
  System.SysUtils, S3Registry, cStd,
  RSQL;

const
  CAMPICOUNTEXT_PIALTATG = 17;

type
  TCountext_pialtatg = Array[0..(CAMPICOUNTEXT_PIALTATG - 1)] of Boolean;
  TCampiext_pialtatg = record
    id           : Integer;       // PK   O.Identificatore
    idoptes      : Integer;       // FK   1.Id
    idprodfin    : Integer;       // FK   2.Id
    idmateriale  : Integer;       // FK   3.Id
    spaziorall   : Double;        //      4.
    percrall     : Double;        //      5.
    dimfor       : Double;        //      6.
    tforat       : Double;        //      7.
    tattr        : Double;        //      8.
    svillin      : Double;        //      9.
    svilcer      : Double;        //     10.
    nprof        : Integer;       //     11.
    nspig        : Integer;       //     12.
    lastraalt    : Double;        //     13.
    lastralun    : Double;        //     14.
    nlastre      : Integer;       //     15.
    pezzixlastra : Double;        //     16.
    sviluppo     : String; //[250];   //     17.
    idopsdlfas   : Integer;
  end;
  Text_pialtatg = Class(TOStd)
    Campi: TCampiext_pialtatg;
  private
    { Private declarations }
  protected
    procedure AssegnaCampi;override;
    procedure ResetCampi;  override;
  public
    function Insert  : integer; override;
    function Modifica: boolean; override;
  end;

implementation

uses RNumb;

procedure Text_pialtatg.AssegnaCampi;
begin
  with Campi, DM.QrySel do begin
    Id           := FieldByName('Id').AsInteger;
    idoptes      := FieldByName('idoptes').asInteger;
    idprodfin    := FieldByName('idprodfin').asInteger;
    idmateriale  := FieldByName('idmateriale').asInteger;
    idopsdlfas   := FieldByName('idopsdlfas').asInteger;
    spaziorall   := FieldByName('spaziorall').asFloat;
    percrall     := FieldByName('percrall').asFloat;
    dimfor       := FieldByName('dimfor').asFloat;
    tforat       := FieldByName('tforat').asFloat;
    tattr        := FieldByName('tattr').asFloat;
    svillin      := FieldByName('svillin').asFloat;
    svilcer      := FieldByName('svilcer').asFloat;
    nprof        := FieldByName('nprof').asInteger;
    nspig        := FieldByName('nspig').asInteger;
    lastraalt    := FieldByName('lastraalt').asFloat;
    lastralun    := FieldByName('lastralun').asFloat;
    nlastre      := FieldByName('nlastre').asInteger;
    pezzixlastra := FieldByName('pezzixlastra').asFloat;
    sviluppo     := FieldByName('sviluppo').asString;
  end;
end;

procedure Text_pialtatg.ResetCampi;
begin
  with Campi do begin
    Id           := 0;
    idoptes      := 0;
    idprodfin    := 0;
    idmateriale  := 0;
    idopsdlfas   := 0;
    spaziorall   := 0;
    percrall     := 0;
    dimfor       := 0;
    tforat       := 0;
    tattr        := 0;
    svillin      := 0;
    svilcer      := 0;
    nprof        := 0;
    nspig        := 0;
    lastraalt    := 0;
    lastralun    := 0;
    nlastre      := 0;
    pezzixlastra := 0;
    sviluppo     := '';
  end;
end;

function Text_pialtatg.Insert: integer;
begin
  sql := 'insert into ext_pialtatg ('+
            'idoptes,'      +
            'idprodfin,'    +
            'idmateriale,'  +
            'idopsdlfas,'   +
            'spaziorall,'   +
            'percrall,'     +
            'dimfor,'       +
            'tforat,'       +
            'tattr,'        +
            'svillin,'      +
            'svilcer,'      +
            'nprof,'        +
            'nspig,'        +
            'lastraalt,'    +
            'lastralun,'    +
            'nlastre,'      +
            'pezzixlastra,' +
            'sviluppo)';
  sql := sql +
         'values ('+
            CS_KeyValueTo_SqlStr(campi.idoptes)                        + ',' +
            CS_KeyValueTo_SqlStr(campi.idprodfin)                      + ',' +
            CS_KeyValueTo_SqlStr(campi.idmateriale)                    + ',' +
            CS_KeyValueTo_SqlStr(campi.idopsdlfas)                     + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall))          + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall))            + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor))              + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat))              + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr))               + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin))             + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer))             + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof))               + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig))               + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt))           + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun))           + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre))             + ',' +
            CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra))        + ',' +
            CS_VariantTo_SqlStr(campi.sviluppo)                        + ')';

  result := inherited insert;
  Seek('id', result);
end;

function Text_pialtatg.Modifica: boolean;
begin
  // Se l'oggetto non contiene un record valido, invece di un update
  // viene eseguito un insert
  if not Found then begin
    result := (insert > 0);       // se riuscito l'insert posso uscire
    exit;
  end;

  sql := 'update ext_pialtatg set ' +
            'idoptes='      + CS_KeyValueTo_SqlStr(campi.idoptes)                        + ',' +
            'idprodfin='    + CS_KeyValueTo_SqlStr(campi.idprodfin)                      + ',' +
            'idmateriale='  + CS_KeyValueTo_SqlStr(campi.idmateriale)                    + ',' +
            'idopsdlfas='   + CS_KeyValueTo_SqlStr(campi.idopsdlfas)                     + ',' +
            'spaziorall='   + CS_VariantTo_SqlStr(ZeroIfNull(campi.spaziorall))          + ',' +
            'percrall='     + CS_VariantTo_SqlStr(ZeroIfNull(campi.percrall))            + ',' +
            'dimfor='       + CS_VariantTo_SqlStr(ZeroIfNull(campi.dimfor))              + ',' +
            'tforat='       + CS_VariantTo_SqlStr(ZeroIfNull(campi.tforat))              + ',' +
            'tattr='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.tattr))               + ',' +
            'svillin='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.svillin))             + ',' +
            'svilcer='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.svilcer))             + ',' +
            'nprof='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.nprof))               + ',' +
            'nspig='        + CS_VariantTo_SqlStr(ZeroIfNull(campi.nspig))               + ',' +
            'lastraalt='    + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastraalt))           + ',' +
            'lastralun='    + CS_VariantTo_SqlStr(ZeroIfNull(campi.lastralun))           + ',' +
            'nlastre='      + CS_VariantTo_SqlStr(ZeroIfNull(campi.nlastre))             + ',' +
            'pezzixlastra=' + CS_VariantTo_SqlStr(ZeroIfNull(campi.pezzixlastra))        + ',' +
            'sviluppo='     + CS_VariantTo_SqlStr(campi.sviluppo)                        +
         ' where id ='+ IntToStr(campi.id);

  result := inherited Modifica;
end;

initialization
  RegObjStdD2(Text_pialtatg, 'Objext_pialtatg');

finalization
  UnRegOggetto('Objext_pialtatg');
end.
