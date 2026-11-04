unit UVarieLottiSpec;

interface
uses CSETables, S3DB, UCoreDB, RSQL, UCoreTipi, System.SysUtils;

function getIDLotserDef(idArtico: integer): integer;
function getIDArticoFromLotser(idLotser: integer): integer;

implementation

function getIDArticoFromLotser(idLotser: integer): integer;
var sql, err: string;
    qry: TCSEQuery;
begin
  Result := 0;

  qry := TCSEQuery.Create(nil);
  try
    qry.DataBaseName := DBExec.DatabaseName;
    sql := 'SELECT IDARTICO ' +
           'FROM LOTSER ' +
           'WHERE ID = ' + CS_KeyValueTo_SqlStr(idLotser);

    err := CS_OpenQry(sql,qry);

    if (err <> '') OR qry.Eof then
      exit;

    Result := qry.FieldByName('IDARTICO').AsInteger;
    
  finally
    freeandnil(qry);
  end;

end;

function getIDLotserDef(idArtico: integer): integer;
var sql, err: string;
    qry: TCSEQuery;
begin
  Result := 0;

  qry := TCSEQuery.Create(nil);
  try
    qry.DataBaseName := DBExec.DatabaseName;
    sql := 'SELECT ID ' +
           'FROM LOTSER ' +
           'WHERE IDARTICO = ' + CS_KeyValueTo_SqlStr(idArtico) + ' ' +
                 'AND NUMLOT = ' + CS_VariantTo_SqlStr(NUMLOTDEF) + ' ' +
                 'AND NUMSER = ' + CS_VariantTo_SqlStr(NUMSERDEF);
    err := CS_OpenQry(sql,qry);

    if (err <> '') OR qry.Eof then
      exit;

    Result := qry.FieldByName('ID').AsInteger;
    
  finally
    freeandnil(qry);
  end;

end;

end.
