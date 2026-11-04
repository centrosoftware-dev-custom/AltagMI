(*
 ******************************************************************************
 *                         I N F O R M A Z I O N I                            *
 ******************************************************************************

	 Cliente:             ALTAG S.R.L.
	 RI:                  20135
	 vers:                4.02
	 Autore:              Giordano Ruffaldi
	 Data Creazione:      09/11/2015
	 Data Ultima Modifica:24/11/2015
	 Descrizione:         ALTAG S.R.L. - Campi aggiuntivi in righe commessa
	 Nome Plugin:         PI_ALTAG_CampiAggRigaComm

 ******************************************************************************
 *                        I S T R U Z I O N I                                 *
 ******************************************************************************

- SAM.CFG:
[Moduli]
PI_ALTAG_CampiAggRigaComm=Campi aggiuntivi in righe commessa

- EXTFUN.INI:
[FrmComTes]
AUTORUN=PI_ALTAG_CampiAggRigaComm.Init_FrmComTes

[FrmIntCom]
AUTORUN=PI_ALTAG_CampiAggRigaComm.Init_FrmIntCom

- Campi esterni in COMRIG
ext_TempiLavTaglio [float]
ext_TempiLavAltre [float]
*)

unit UPI_CampiAggRigaComm;

interface

uses
  S3Plugin, System.Classes, Vcl.StdCtrls, Vcl.ComCtrls, System.SysUtils,
  Vcl.ExtCtrls, Data.DB, S3DB, UCoreDB, UCoreTipi, CSEdit, CSETables, CSFileCfg, Rsql,
	VCl.Dialogs, SMDBGrid, QueryPars, FrmStd;

const
	NOME_PLUGIN='PI_ALTAG_CampiAggRigaComm';
	FLAG_FORM_COMTES=0;
	FLAG_FORM_INTOV=1;

const
	RS_NOME_COLONNA_TEMPO_TAGLIO = 'Tempo Taglio';
	RS_NOME_COLONNA_TEMPO_ALTRE = 'Tempo Altre';
	{}
	RS_LABEL_TEMPO_TAGLIO = 'Tempo Lav. Taglio';
	RS_LABEL_TEMPO_ALTRE = 'Tempo Lav. Altre';
	{}
	RS_ERROR_AGGIUNTA_COLONNA = 'ATTENZIONE: Errore plug-in '''+NOME_PLUGIN+''' (Procedure TDescrRigaDDT.AggiungiCampoSMDBGrid).';
	{}
	RS_ERROR_COLUMN_MISSING = 'Non è stata trovata la colonna: ';

type
	TCampiAggRigaComm = class(TCustomPlugin)
		private
			FOldOnChange: TNotifyEvent;
			FOldOnChange2: TNotifyEvent;
			FOldOnRefresh: TNotifyEvent;
			FOldOnRefresh2: TNotifyEvent;
			FOldOnRefreshAddDoc: TNotifyEvent;
			FOld_dbgrComRig_dsuComRig_OnDataChange: TDataChangeEvent;
			FOld_btnSalvaArt_OnClick: TNotifyEvent;
			flagForm: smallint;
			dbgr: TSMDBGrid;
			dbgr2: TSMDBGrid;  // 15-02-2016: Per RiepilogoRighe in Interrogazioni OV
			qry: TQueryPars;
			qry2: TQueryPars;  // 15-02-2016: Per RiepilogoRighe in Interrogazioni OV
			lblTempoTaglio: TLabel;
			editTempoTaglio: TCSEdit;
			lblTempoLav: TLabel;
			editTempoLav: TCSEdit;
			procedure AggiungiColonne(grid: TSMDBGrid);
			procedure ParsingQuery;
			procedure AggiungiCampoSMDBGrid(grid: TSMDBGrid; campo: TGridCampi; idx: Integer);
			procedure RefreshEditAggiuntivi;
		published
			procedure Init_FrmComTes;
			procedure Init_FrmIntCom;
			procedure NewOnChangePage(Sender: Tobject);
			procedure NewOnChangePage2(Sender: Tobject); // 15-02-2016: Per RiepilogoRighe in Interrogazioni OV
			procedure NewOnRefresh(Sender :TObject );
			procedure NewOnRefresh2(Sender :TObject );
			procedure NewOnRefreshAddDoc(Sender: TObject);
			procedure New_dbgrComRig_dsuComRig_OnDataChange(Sender: TObject; Field: TField);
			procedure New_btnSalvaArt_OnClick(Sender: TObject);
			property OldOnChange : TNotifyEvent read FOldOnChange write FOldOnChange;
			property OldOnChange2 : TNotifyEvent read FOldOnChange2 write FOldOnChange2;  // 15-02-2016: Per RiepilogoRighe in Interrogazioni OV
			property OldOnRefresh : TNotifyEvent read FOldOnRefresh write FOldOnRefresh;
			property OldOnRefresh2 : TNotifyEvent read FOldOnRefresh2 write FOldOnRefresh2; // 15-02-2016: Per RiepilogoRighe in Interrogazioni OV
			property OldOnRefreshAddDoc : TNotifyEvent read FOldOnRefreshAddDoc write FOldOnRefreshAddDoc;
			property Old_dbgrComRig_dsuComRig_OnDataChange: TDataChangeEvent read FOld_dbgrComRig_dsuComRig_OnDataChange write FOld_dbgrComRig_dsuComRig_OnDataChange;
			property Old_btnSalvaArt_OnClick: TNotifyEvent read FOld_btnSalvaArt_OnClick write FOld_btnSalvaArt_OnClick;
end;

implementation

uses CSTipiCommon, RString;

{ TCampiAggRigaComm }

procedure TCampiAggRigaComm.Init_FrmComTes;
var
	_pnlDettRig: TPanel;
	_cbxRiferi1: TComboBox;
begin
	self.flagForm := FLAG_FORM_COMTES;
	{}
	if CSColumnExists(Azienda, 'ComRig', 'ext_TempiLavTaglio')<>'' then
	begin
		MessageDlg(RS_ERROR_COLUMN_MISSING + ' ext_TempiLavTaglio', mtInformation, [MBOK], 0);
		Exit;
	end;
	if CSColumnExists(Azienda, 'ComRig', 'ext_TempiLavAltre')<>'' then
	begin
		MessageDlg(RS_ERROR_COLUMN_MISSING + ' ext_TempiLavAltre', mtInformation, [MBOK], 0);
		Exit;
	end;
	{}
	try
		GetFormComp('dbgrComRig', self.dbgr);
		GetFormComp('QryComRig', self.qry);
		GetFormComp('PnlDettRig', _pnlDettRig);
		GetFormComp('cbxRiferi1', _cbxRiferi1);
	except
		on e:Exception do
		begin
			MessageDlg(
				NOME_PLUGIN + CRLF + 'Function GetFormComp "' + e.Message + '"' + CRLF + self.Name,
				mtWarning, [MBOK], 0);
			Exit;
		end;
	end;
	{}
	self.lblTempoTaglio :=  TLabel.Create(form);
	lblTempoTaglio.Name := 'lblTempoTaglio';
	lblTempoTaglio.Caption := RS_LABEL_TEMPO_TAGLIO;
	lblTempoTaglio.Parent := _pnlDettRig;
	lblTempoTaglio.Top := 267;
	lblTempoTaglio.Height := 13;
	lblTempoTaglio.Left := 108;
	{}
	self.editTempoTaglio := TCSEdit.Create(form);
	self.editTempoTaglio.DataType := dtTempo;
	self.editTempoTaglio.Name := 'edtTempoTaglio';
	self.editTempoTaglio.Parent := _pnlDettRig;
	self.editTempoTaglio.Top := 282;
	self.editTempoTaglio.Height := 21;
	self.editTempoTaglio.Left := 108;
	self.editTempoTaglio.Width := 102;
	self.editTempoTaglio.OnChange := _cbxRiferi1.OnChange;
	{}
	self.lblTempoLav := TLabel.Create(form);
	self.lblTempoLav.Name := 'lblTempoLav';
	self.lblTempoLav.Caption := RS_LABEL_TEMPO_ALTRE;
	self.lblTempoLav.Parent := _pnlDettRig;
	self.lblTempoLav.Top := 267;
	self.lblTempoLav.Height := 13;
	self.lblTempoLav.Left := 216;
	{}
	self.editTempoLav := TCSEdit.Create(form);
	self.editTempoLav.DataType := dtTempo;
	self.editTempoLav.Name := 'edtTempoLav';
	self.editTempoLav.Parent := _pnlDettRig;
	self.editTempoLav.Top := 282;
	self.editTempoLav.Height := 21;
	self.editTempoLav.Left := 216;
	self.editTempoLav.Width := 102;
	self.editTempoLav.OnChange := _cbxRiferi1.OnChange;
	{}
	RedirEvent('PageControl1', 'OnChange', 'OldOnChange', 'NewOnChangePage');
	RedirEvent('dbgrComRig', 'OnRefreshData', 'OldOnRefresh', 'NewOnRefresh');
	RedirEvent('dsuComRig','OnDataChange','Old_dbgrComRig_dsuComRig_OnDataChange','New_dbgrComRig_dsuComRig_OnDataChange');
	RedirEvent('btnSalvaArt', 'OnClick', 'Old_btnSalvaArt_OnClick', 'New_btnSalvaArt_OnClick');
	{}
	self.AggiungiColonne(self.dbgr);
	{}
  self.dbgr.CallLoaded;
  self.dbgr.LoadFromIniFile;
	if self.qry.ParamByName('parIdComtes').AsInteger > 0 then
		self.dbgr.RefreshData;

end;

procedure TCampiAggRigaComm.Init_FrmIntCom;
begin
	self.flagForm := FLAG_FORM_INTOV;
	{}
	if CSColumnExists(Azienda, 'ComRig', 'ext_TempiLavTaglio')<>'' then
	begin
		MessageDlg(RS_ERROR_COLUMN_MISSING + ' ext_TempiLavTaglio', mtInformation, [MBOK], 0);
		Exit;
	end;
	if CSColumnExists(Azienda, 'ComRig', 'ext_TempiLavAltre')<>'' then
	begin
		MessageDlg(RS_ERROR_COLUMN_MISSING + ' ext_TempiLavAltre', mtInformation, [MBOK], 0);
		Exit;
	end;
	{}
	try
		GetFormComp('dbgrRigheDoc', self.dbgr);
		GetFormComp('dbgrRighe', self.dbgr2);
		GetFormComp('qryRigheDoc', self.qry);
		GetFormComp('qryRighe', self.qry2);
	except
		on e:Exception do
		begin
			MessageDlg(
				NOME_PLUGIN + CRLF + 'Function GetFormComp "' + e.Message + '"' + CRLF + self.Name,
				mtWarning, [MBOK], 0);
			Exit;
		end;
	end;
	{}
	RedirEvent('PageControl1', 'OnChange', 'OldOnChange', 'NewOnChangePage');
	RedirEvent('PageControl2', 'OnChange', 'OldOnChange2', 'NewOnChangePage2');
	RedirEvent('dbgrRigheDoc', 'OnRefreshData', 'OldOnRefresh', 'NewOnRefresh');
	RedirEvent('dbgrRighe', 'OnRefreshData', 'OldOnRefresh2', 'NewOnRefresh2');  // 15-02-2016: Per RiepilogoRighe in Interrogazioni OV
	RedirEvent('dsuRigheDoc','OnDataChange','Old_dbgrComRig_dsuComRig_OnDataChange','New_dbgrComRig_dsuComRig_OnDataChange');
	{}
	self.AggiungiColonne(self.dbgr);
	self.AggiungiColonne(self.dbgr2);
end;

procedure TCampiAggRigaComm.AggiungiColonne(grid: TSMDBGrid);
var
	_i : Integer;
	_tmp : TGridCampi;
	_lsCol: TStrings;
	_f: TCSFileCFG;
	_s : String;
	_locale, _flagColonna: Boolean;
begin
	self.ParsingQuery;
	{}
	_flagColonna := true;
	for _i := 0 to grid.Columns.Count - 1 do
		if (grid.Columns[_i].Title.Caption = RS_NOME_COLONNA_TEMPO_TAGLIO) OR (grid.Columns[_i].Title.Caption = RS_NOME_COLONNA_TEMPO_ALTRE) then
		begin
			_flagColonna := false;
			break;
		end;
	begin
	{}
	end;
	if (_flagColonna) then
	begin
		_f := TCSFileCfg.Create(grid.IniFileName);
		_lsCol:=TStringList.Create;
		try
			_s := _f.ReadString(grid.IniSection, 'LAYOUT', '');
			if (_s <> '')and(_s[1] = '{')and(_s[Length(_s)] = '}') then
      begin
				_s := Copy(_s, 2, Length(_s)-2);
      end;
			_lsCol.CommaText := _s;
			_locale := False;
			for _i := 0 to _lsCol.Count - 1 do
      begin
				if (_lsCol.Names[_i] <> RS_NOME_COLONNA_TEMPO_TAGLIO) and
					 (_lsCol.Names[_i] <> RS_NOME_COLONNA_TEMPO_ALTRE) then
          Continue
        else
        begin
					_locale := True;
					if _lsCol.Names[_i] = RS_NOME_COLONNA_TEMPO_TAGLIO then
					begin
						_tmp.FieldName := 'ext_str_TempiLavTaglio';
						_tmp.Titolo    := RS_NOME_COLONNA_TEMPO_TAGLIO;
						_tmp.Tipo      := Stringa;
						_tmp.Width     := 80;
						_tmp.Align     := taLeftJustify;
						_tmp.EnableOrd := true;
						_tmp.EnableTot := false;
					end
          else
					if _lsCol.Names[_i] = RS_NOME_COLONNA_TEMPO_ALTRE then
					begin
						_tmp.FieldName := 'ext_str_TempiLavAltre';
						_tmp.Titolo    := RS_NOME_COLONNA_TEMPO_ALTRE;
						_tmp.Tipo      := Stringa;
						_tmp.Width     := 80;
						_tmp.Align     := taLeftJustify;
						_tmp.EnableOrd := true;
						_tmp.EnableTot := false;
					end;
					_tmp.Width:=strtoint(_lsCol.values[_tmp.Titolo]);
					self.AggiungiCampoSMDBGrid(grid, _tmp, _i);
				end;
      end;
			if not _locale then
      begin
				_i := 0;
				_tmp.FieldName := 'ext_str_TempiLavTaglio';
				_tmp.Titolo    := RS_NOME_COLONNA_TEMPO_TAGLIO;
				_tmp.Tipo      := Stringa;
				_tmp.Width     := 80;
				_tmp.Align     := taLeftJustify;
				_tmp.EnableOrd := true;
				_tmp.EnableTot := false;
				self.AggiungiCampoSMDBGrid(grid, _tmp, _i);
        {}
				_i := _i + 1;
				_tmp.FieldName := 'ext_str_TempiLavAltre';
				_tmp.Titolo    := RS_NOME_COLONNA_TEMPO_ALTRE;
				_tmp.Tipo      := Stringa;
				_tmp.Width     := 80;
				_tmp.Align     := taLeftJustify;
				_tmp.EnableOrd := true;
				_tmp.EnableTot := false;
				self.AggiungiCampoSMDBGrid(grid, _tmp, _i);
			end;
    finally
			_lsCol.Free;
			_f.Free;
    end;
  end;
end;

procedure TCampiAggRigaComm.NewOnChangePage(Sender: Tobject);
begin
	self.AggiungiColonne(self.dbgr);
	{}
	if self.flagForm = FLAG_FORM_INTOV then
	begin
		self.AggiungiColonne(self.dbgr2);
		self.dbgr2.RefreshData;
	end;
	{}
	if (self.flagForm = FLAG_FORM_COMTES) and (self.qry.ParamByName('parIdComtes').AsInteger > 0) then
		self.dbgr.RefreshData;
	{}
	if Assigned(self.OldOnChange) then
		self.OldOnChange(Sender);
end;

procedure TCampiAggRigaComm.NewOnChangePage2(Sender: Tobject);
begin
	self.AggiungiColonne(self.dbgr);
//	{}
	if self.flagForm = FLAG_FORM_INTOV then
	begin
		self.AggiungiColonne(self.dbgr2);
		self.dbgr2.RefreshData;
	end;
	{}
	if Assigned(self.OldOnChange2) then
		self.OldOnChange2(Sender);
end;

procedure TCampiAggRigaComm.NewOnRefresh(Sender: TObject);
var
	_tmpBkMrk : TBookMark;
begin
	if Assigned(self.OldOnChange) then
	begin
		if (UPPERCASE(TFormStd(Form).ObjSAM.TableName) = 'COMTES') then //and ( TFormStd(Form).Stato = stMod ) then
			_tmpBkMrk := self.dbgr.DataSource.DataSet.Bookmark;
		{}
		self.ParsingQuery;
		self.OldOnRefresh(Sender);
		{}
		if (UPPERCASE(TFormStd(Form).ObjSAM.TableName) = 'COMTES') then
			self.dbgr.DataSource.DataSet.Bookmark := _tmpBkMrk;
	end;
end;

procedure TCampiAggRigaComm.NewOnRefresh2(Sender: TObject);
begin
	if Assigned(self.OldOnChange2) then
	begin
		self.ParsingQuery;
		self.OldOnRefresh2(Sender);
	end;
end;

procedure TCampiAggRigaComm.NewOnRefreshAddDoc(Sender: TObject);
begin
  if Assigned(self.OldOnRefreshAddDoc ) then
  begin
		self.ParsingQuery;
		self.OldOnRefreshAddDoc(Sender);
  end;
end;

procedure TCampiAggRigaComm.New_btnSalvaArt_OnClick(Sender: TObject);
var
	_queryString, _errMsg, _value_ext_TempiLavTaglio, _value_ext_TempiLavAltre: string;
	_lastId: integer;
begin
	// Lasciare per primo
	_value_ext_TempiLavTaglio := CS_VariantTo_SqlStr(self.editTempoTaglio.AsFloat, mRound_Standard);
	_value_ext_TempiLavAltre := CS_VariantTo_SqlStr(self.editTempoLav.AsFloat, mRound_Standard);
	{}
	if Assigned(Self.Old_btnSalvaArt_OnClick) then
		self.Old_btnSalvaArt_OnClick(Sender);
	{}
	_lastId := self.dbgr.DataSource.DataSet.FieldByName('id').AsInteger;
	_queryString :=
		' UPDATE COMRIG set '
		+'    ext_TempiLavTaglio = ' + _value_ext_TempiLavTaglio + ' , '
		+'    ext_TempiLavAltre = ' + _value_ext_TempiLavAltre
		+'  WHERE ID = '
		+ CS_VariantTo_SqlStr(_lastId);
	{}
	try
		_errMsg := CS_ExecDb(_queryString, DbExec);
		{}
		if _errMsg <> '' then
		begin
			MessageDlg(_errMsg, mtWarning, [MBOK], 0);
		end;
		{}
		self.dbgr.RefreshData;
		{}
		self.RefreshEditAggiuntivi;
		{}
		TQueryPars(self.dbgr.DataSource.DataSet).Locate('ID', _lastId, []);
	finally
	end;
end;

procedure TCampiAggRigaComm.New_dbgrComRig_dsuComRig_OnDataChange(Sender: TObject; Field: TField);
begin
	self.RefreshEditAggiuntivi;
	{}
	if Assigned(self.Old_dbgrComRig_dsuComRig_OnDataChange) then
		self.Old_dbgrComRig_dsuComRig_OnDataChange(Sender, Field);
end;

procedure TCampiAggRigaComm.ParsingQuery;
begin
//	// Usato in comune da entrambi le form (OV e InterrogazioniOV)
//	if Pos('ext_TempiLavTaglio', self.qry.SQL.Text) = 0 then
//		self.qry.SQL.Text:= Subst(self.qry.sql.text,'FROM',' , ext_TempiLavTaglio, '
//		+'   (right(''00'' + cast(convert(int,ext_TempiLavTaglio*24) as varchar),2) + '':'' + right(''00'' + cast(round(60* (ext_TempiLavTaglio*24 - convert(int,ext_TempiLavTaglio*24)),2)as varchar),2)) as ext_str_TempiLavTaglio '
//		+' FROM ');
//	{}
//	if Pos('ext_TempiLavAltre', self.qry.SQL.Text) = 0 then
//		self.qry.SQL.Text:= Subst(self.qry.sql.text,'FROM',' , ext_TempiLavAltre, '
//		+'   (right(''00'' + cast(convert(int,ext_TempiLavAltre*24) as varchar),2) + '':'' + right(''00'' + cast(round(60* (ext_TempiLavAltre*24 - convert(int,ext_TempiLavAltre*24)),2)as varchar),2)) as ext_str_TempiLavAltre '
//		+' FROM ');
	if Pos('ext_TempiLavTaglio', self.qry.SQL.Text) = 0 then
	begin
		self.qry.SQL.Text:= CS_Sub_Str(self.qry.sql.text,'FROM ComRig a ',' , ext_TempiLavTaglio, '
	+'(replace(right(''00'' + cast(round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) as varchar),2)+''h ''+'
	+'right(''00'' + cast(round((ext_TempiLavTaglio+0.00000011574074)*(24*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 60), 0,1)as varchar),2) + '''''' '' + '
	+'right(''00'' + cast(round(((ext_TempiLavTaglio+0.00000011574074)*(24*60*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 3600))'+' - (round((ext_TempiLavTaglio+0.00000011574074)*(24*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 60), 0,1) * 60),0) as varchar),2) + '''''''', ''00'', ''0'')) '
	+' as ext_str_TempiLavTaglio '
	+' FROM ComRig a ');
	end;
	{}
	if Pos('ext_TempiLavAltre', self.qry.SQL.Text) = 0 then
	begin
		self.qry.SQL.Text:= CS_Sub_Str(self.qry.sql.text,'FROM ComRig a ',' , ext_TempiLavAltre, '
	+'(replace(right(''00'' + cast(round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) as varchar),2)+''h ''+'
	+'right(''00'' + cast(round((ext_TempiLavAltre+0.00000011574074)*(24*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 60), 0,1)as varchar),2) + '''''' '' + '
	+'right(''00'' + cast(round(((ext_TempiLavAltre+0.00000011574074)*(24*60*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 3600))'+' - (round((ext_TempiLavAltre+0.00000011574074)*(24*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 60), 0,1) * 60),0) as varchar),2) + '''''''', ''00'', ''0'')) as ext_str_TempiLavAltre '
	+' FROM ComRig a ');
	end;
	{}
	if self.flagForm = FLAG_FORM_INTOV then
	begin
		if Pos('ext_TempiLavTaglio', self.qry2.SQL.Text) = 0 then
		begin
			self.qry2.SQL.Text:= CS_Sub_Str(self.qry2.sql.text,'FROM',' , ext_TempiLavTaglio, '
		+'(replace(right(''00'' + cast(round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) as varchar),2)+''h ''+'
		+'right(''00'' + cast(round((ext_TempiLavTaglio+0.00000011574074)*(24*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 60), 0,1)as varchar),2) + '''''' '' + '
		+'right(''00'' + cast(round(((ext_TempiLavTaglio+0.00000011574074)*(24*60*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 3600))'+' - (round((ext_TempiLavTaglio+0.00000011574074)*(24*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 60), 0,1) * 60),0) as varchar),2) + '''''''', ''00'', ''0'')) '
		+' as ext_str_TempiLavTaglio '
		+' FROM ');
		end;
		{}
		if Pos('ext_TempiLavAltre', self.qry2.SQL.Text) = 0 then
		begin
			self.qry2.SQL.Text:= CS_Sub_Str(self.qry2.sql.text,'FROM',' , ext_TempiLavAltre, '
	+'(replace(right(''00'' + cast(round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) as varchar),2)+''h ''+'
	+'right(''00'' + cast(round((ext_TempiLavAltre+0.00000011574074)*(24*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 60), 0,1)as varchar),2) + '''''' '' + '
	+'right(''00'' + cast(round(((ext_TempiLavAltre+0.00000011574074)*(24*60*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 3600))'+' - (round((ext_TempiLavAltre+0.00000011574074)*(24*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 60), 0,1) * 60),0) as varchar),2) + '''''''', ''00'', ''0'')) as ext_str_TempiLavAltre '
	+' FROM ');
		end;
	end;
end;

procedure TCampiAggRigaComm.RefreshEditAggiuntivi;
var
	_pageControl1, _pgCtrlRighe: TPageControl;
	_queryString, _errMsg: string;
	_qry: TCSEQuery;
	_saveEvent: TNotifyEvent;
begin
	// Usato solo dalla form delle righe di commessa
	try
		GetFormComp('PageControl1', _pageControl1);
		GetFormComp('PgCtrlRighe', _pgCtrlRighe);
	except
		on e:Exception do
		begin
			MessageDlg(
				NOME_PLUGIN + CRLF + 'Function GetFormComp "' + e.Message + '"' + CRLF + self.Name,
				mtWarning, [MBOK], 0);
			Exit;
		end;
	end;
	{}
	if (_pageControl1.ActivePage.Name <> 'TabRighe') OR (_pgCtrlRighe.ActivePage.Name <> 'TSRighe') then
		Exit;
	{}
	_qry := TCSEQuery.Create(nil);
	try
		_queryString :=
			' select '
			+'   ext_TempiLavTaglio, '
			+'   ext_TempiLavAltre, '
	+'(replace(right(''00'' + cast(round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) as varchar),2)+''h ''+'
	+'right(''00'' + cast(round((ext_TempiLavTaglio+0.00000011574074)*(24*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 60), 0,1)as varchar),2) + '''''' '' + '
	+'right(''00'' + cast(round(((ext_TempiLavTaglio+0.00000011574074)*(24*60*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 3600))'+' - (round((ext_TempiLavTaglio+0.00000011574074)*(24*60) - (round((ext_TempiLavTaglio+0.00000011574074)*(24),0,1) * 60), 0,1) * 60),0) as varchar),2) + '''''''', ''00'', ''0'')) '
	+' as ext_str_TempiLavTaglio, '
	+'(replace(right(''00'' + cast(round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) as varchar),2)+''h ''+'
	+'right(''00'' + cast(round((ext_TempiLavAltre+0.00000011574074)*(24*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 60), 0,1)as varchar),2) + '''''' '' + '
	+'right(''00'' + cast(round(((ext_TempiLavAltre+0.00000011574074)*(24*60*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 3600))'+' - (round((ext_TempiLavAltre+0.00000011574074)*(24*60) - (round((ext_TempiLavAltre+0.00000011574074)*(24),0,1) * 60), 0,1) * 60),0) as varchar),2) + '''''''', ''00'', ''0'')) as ext_str_TempiLavAltre '
//			+'   (right(''00'' + cast(convert(int,ext_TempiLavTaglio*24) as varchar),2) + '':'' + right(''00'' + cast(round(60* (ext_TempiLavTaglio*24 - convert(int,ext_TempiLavTaglio*24)),2)as varchar),2)) as ext_str_TempiLavTaglio, '
//			+'   (right(''00'' + cast(convert(int,(ext_TempiLavAltre+0.00000011574074)*24) as varchar),2) + '':'' + right(''00'' + cast(round(60* ((ext_TempiLavAltre+0.00000011574074)*24 - convert(int,(ext_TempiLavAltre+0.00000011574074)*24)),2)as varchar),2)) as ext_str_TempiLavAltre '
			+' from COMRIG where ID = '
			+ CS_VariantTo_SqlStr(self.dbgr.DataSource.DataSet.FieldByName('id').AsInteger);
		_qry.DataBaseName := Azienda.DatabaseName;
		_errMsg := CS_OpenQry(_queryString, _qry);
		if _errMsg <> '' then
		begin
			MessageDlg(_errMsg, mtWarning, [MBOK], 0);
			Exit;
		end;
		{}
		_saveEvent := self.editTempoTaglio.OnChange;
		self.editTempoTaglio.OnChange := nil;
		self.editTempoTaglio.AsFloat := _qry.FieldByName('ext_TempiLavTaglio').AsFloat;
		if self.editTempoTaglio.Text = '' then
			self.editTempoTaglio.Text := '0h 0'' 0"';
		self.editTempoTaglio.OnChange := _saveEvent;
		{}
		_saveEvent := self.editTempoLav.OnChange;
		self.editTempoLav.OnChange := nil;
		self.editTempoLav.AsFloat := _qry.FieldByName('ext_TempiLavAltre').AsFloat;
		if self.editTempoLav.Text = '' then
			self.editTempoLav.Text := '0h 0'' 0"';
		self.editTempoLav.OnChange := _saveEvent;
	finally
		_qry.Close;
		FreeAndNil(_qry);
	end;
	{}
	self.editTempoTaglio.Enabled := self.lblTempoTaglio.Enabled;
	self.editTempoLav.Enabled := self.lblTempoLav.Enabled;
end;

procedure TCampiAggRigaComm.AggiungiCampoSMDBGrid(grid: TSMDBGrid; campo: TGridCampi; idx: Integer);
var
	_i:smallint;
begin
	if idx<0 then
		begin
			grid.Columns.Add;
			_i:=grid.Columns.count-1;
		end
	else
		begin
			grid.Columns.insert(idx);
			_i:=idx;
	end;
	{}
	TS3Column(grid.Columns[_i]).Expanded:=False;
	TS3Column(grid.Columns[_i]).Visible:= True;
	TS3Column(grid.Columns[_i]).Alignment:=campo.Align;
	TS3Column(grid.Columns[_i]).FieldName:=campo.FieldName;
	TS3Column(grid.Columns[_i]).Width:=campo.Width;
	TS3Column(grid.Columns[_i]).Title.Caption:=campo.Titolo;
	TS3Column(grid.Columns[_i]).Title.Alignment:= taCenter;
	TS3Column(grid.Columns[_i]).FastFilter := true;
	{}
  if (campo.Tipo=Stringa) or (campo.Tipo=Anno) then begin
		TS3Column(grid.Columns[_i]).DataType:=dtTesto;
  end
	else if (campo.Tipo=Int16) or (campo.Tipo=Int32) then begin
		TS3Column(grid.Columns[_i]).DataType:=dtNumerico;
		TS3Column(grid.Columns[_i]).ThousandSep:=False;
	end
  else if (campo.Tipo=Importo) or (campo.Tipo=Quantita) then begin
		TS3Column(grid.Columns[_i]).DataType:=dtNumerico;
		TS3Column(grid.Columns[_i]).FormatZero:=fzDecimal;
  end
	else if campo.Tipo=Perc then begin
		TS3Column(grid.Columns[_i]).DataType:=dtNumerico;
		TS3Column(grid.Columns[_i]).PercSign:= True;
		TS3Column(grid.Columns[_i]).FormatZero:=fzDecimal;
  end
	else if campo.Tipo=SoloData then begin
		TS3Column(grid.Columns[_i]).DataType:=dtData;
	end
	else if campo.Tipo=Tempo then begin
		TS3Column(grid.Columns[_i]).DataType:=dtTempo;
	end
  else if campo.Tipo=Booleano then begin
		TS3Column(grid.Columns[_i]).DataType:=dtSiNo;
	end
  else
		showmessage(RS_ERROR_AGGIUNTA_COLONNA);
end;

initialization
  // Identificativo modulo
  CSW___BPL_Identity :='PI_ALTAGMI_CampiAggRigaComm';

	RegisterPlugIn('PI_ALTAGMI_CampiAggRigaComm', TCampiAggRigaComm);

finalization
	UnRegisterPlugIn('PI_ALTAGMI_CampiAggRigaComm');


end.
