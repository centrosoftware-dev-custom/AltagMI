# Rinomina plugin AltagMI

## Obiettivo

E' stata creata una copia isolata dei sorgenti Altag con nuova identita cliente `AltagMI`.
Gli originali presenti in `C:\plugin_new\Altag` non sono stati modificati.

La copia di lavoro e' disponibile in:

```text
C:\plugin_new\AltagMI\source
```

## Plugin rinominati

Sono state rinominate le cartelle dei seguenti plugin:

| Nome originale | Nuovo nome cartella |
|---|---|
| `PI_Altag_SelLottiSpecDDT` | `PI_AltagMI_SelLottiSpecDDT` |
| `pi_Altag_PrevInd` | `pi_AltagMi_PrevInd` |
| `PI_Altag_GstVenLastre` | `PI_AltagMI_GstVenLastre` |
| `PI_Altag_GstPI` | `PI_AltagMI_GstPI` |
| `PI_ALTAG_CampiAggRigaComm` | `PI_ALTAGMI_CampiAggRigaComm` |
| `PI_Altag_BWS` | `PI_AltagMI_BWS` |

Per ogni plugin sono state aggiornate le registrazioni Delphi trovate nei sorgenti Pascal:

- `CSW___BPL_Identity`;
- `RegisterPlugIn`;
- `UnRegisterPlugIn`/`UnregisterPlugIn`.

Esempio:

```pascal
CSW___BPL_Identity := 'PI_Altag_PrevInd';
```

e' diventato:

```pascal
CSW___BPL_Identity := 'PI_AltagMi_PrevInd';
```

## Applicazione DataEntry

Il programma `PS_Altag_DataEntry` non e' un package BPL, ma un'applicazione Delphi compilata come `.exe`.
E' stato comunque rinominato nella copia AltagMI:

```text
PS_Altag_DataEntry
```

in:

```text
PS_AltagMI_DataEntry
```

Sono stati aggiornati:

- nome della cartella;
- file `.dpr`;
- nome del programma Delphi;
- file `.dproj`;
- riferimento `MainSource`;
- nome prodotto nelle informazioni versione;
- file `.res`;
- `README.md`.

L'eseguibile previsto dal progetto resta `DataEntryPrd.exe`, perche' questo e' il nome di output configurato storicamente nel progetto.

## Plugin esclusi

La cartella `CIAMPALINI` e' stata esclusa dalla copia iniziale e non fa parte del lavoro AltagMI.

Sono inoltre rimasti fuori dalle configurazioni `SAM.cfg` ed `extfun.ini` tutti i progetti che non sono plugin registrati, compreso il programma DataEntry.

## Configurazioni generate

Sono stati creati:

```text
C:\plugin_new\AltagMI\SAM.cfg
C:\plugin_new\AltagMI\extfun.ini
```

### `SAM.cfg`

Contiene le registrazioni documentate nelle sezioni:

- `[Moduli]`;
- `[Plugin]`;
- configurazione utenti per `PI_AltagMI_GstPI`;
- configurazione utenti per `pi_AltagMi_PrevInd`;
- registrazione speciale `RicMerAltag` usata dal plugin BWS.

### `extfun.ini`

Contiene le funzioni documentate nei sorgenti e nei changelog dei plugin:

- avvio selezione lotti in `FrmBolle`;
- avvio e pulsanti preventivi in `FrmComTes` e `FrmIntCom`;
- funzioni gestione vendite lastre;
- funzioni campi aggiuntivi commessa;
- funzioni del plugin BWS per scarico, carico, preparazione spedizione, selezione tipo documento e inventario;
- funzioni e caption del plugin Gestione Preventivi.

Le voci sono state adattate ai nuovi nomi `AltagMI`.

## Gruppo Delphi XE3

Per aprire i progetti dalla GUI di Delphi XE3 e' stato creato:

```text
C:\plugin_new\AltagMI\source\AltagMI.groupproj
```

Il gruppo contiene i sei package/plugin rinominati e l'applicazione DataEntry rinominata.

I progetti inclusi sono:

- `PI_AltagMI_SelLottiSpecDDT.dproj`;
- `pi_AltagMi_PrevInd.dproj`;
- `PI_AltagMI_GstVenLastre.dproj`;
- `PI_AltagMI_GstPI.dproj`;
- `PI_ALTAGMI_CampiAggRigaComm.dproj`;
- `PI_AltagMI_BWS.dproj`;
- `PS_AltagMI_DataEntry.dproj`.

Il file gruppo deve essere aperto dalla stessa cartella `source`, dove sono presenti i percorsi relativi dei progetti.

## Compilazione XE3

E' stato verificato l'ambiente Delphi XE3:

```text
C:\Program Files (x86)\Embarcadero\RAD Studio\10.0\bin\dcc32.exe
```

Il compilatore rilevato e' la versione `24.0`.

Le dipendenze Centro Software di base sono state individuate in:

```text
C:\outsamw2
```

Sono disponibili, tra gli altri:

- `CSApplication.dcp`;
- `M_Base.dcp`;
- `M_Acq.dcp`;
- `M_Prd.dcp`;
- `M_Mag.dcp`.

E' stato inoltre creato uno script di supporto:

```text
C:\plugin_new\AltagMI\compila_AltagMI_XE3.cmd
```

La compilazione testata in precedenza sui sorgenti Altag originali ha prodotto correttamente i BPL dei plugin disponibili, mentre DataEntry richiede `CSETables.dcu`, che non era presente nei percorsi disponibili.

## Limiti e controlli consigliati

La rinomina eseguita e' stata limitata alle identita' di registrazione e alle cartelle. Non sono stati rinominati indiscriminatamente:

- nomi delle unit Pascal;
- nomi delle classi Delphi;
- GUID;
- tabelle, campi e query database;
- nomi storici delle configurazioni applicative;
- riferimenti funzionali non riconducibili con certezza all'identita' del plugin.

Prima dell'installazione e' consigliato:

1. compilare ogni progetto dalla GUI Delphi XE3;
2. controllare i log di compilazione e le dipendenze `.dcp`;
3. verificare che i BPL prodotti abbiano i nuovi nomi attesi;
4. installare `SAM.cfg` ed `extfun.ini` nell'ambiente corretto;
5. verificare le sezioni utente e le autorizzazioni del cliente;
6. testare l'avvio delle funzioni da `FrmBolle`, `FrmComTes`, `FrmIntCom` e dalle altre form coinvolte;
7. verificare separatamente l'applicazione `PS_AltagMI_DataEntry`.
