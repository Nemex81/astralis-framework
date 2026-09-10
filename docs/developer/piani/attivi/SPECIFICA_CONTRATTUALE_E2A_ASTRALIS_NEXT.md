# Specifica Contrattuale E2A: ASTRALIS Next

- **Identificativo**: `EXP-AST-NEXT-E2A-CONTRACTS`
- **Tipologia**: Annesso normativo del piano sperimentale
- **Autore e approvatore del programma**: Luca
- **Supporto alla formalizzazione**: GPT Codex / ChatGPT
- **Data**: 2026-09-10
- **Branch**: `experiment/astralis-next-clean-core`
- **Baseline E2A**: `b697a78df7759c3aaa3987fcfd8c9cb9c7dbfc5f`
- **Stato**: `[PROPOSTA E2A FORMALIZZATA E VALIDATA — APPROVAZIONE DI LUCA PENDENTE]`
- **Piano padre**: [`PIANO_SPERIMENTALE_ASTRALIS_NEXT_CLEAN_CORE.md`](PIANO_SPERIMENTALE_ASTRALIS_NEXT_CLEAN_CORE.md)
- **Strategia**: [`STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md`](../../strategie/STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md)
- **Decisioni D0**: [`DECISIONI_D0_ASTRALIS_V3_1_0.md`](DECISIONI_D0_ASTRALIS_V3_1_0.md)

---

## 1. Scopo e confine

E2A definisce i contratti del Clean Core prima della creazione di cartelle, schemi JSON eseguibili o codice.

La specifica stabilisce:

1. aree e responsabilità;
2. identità di installazione, macchina, progetto e workspace;
3. proprietà e destinazione dei dati;
4. precedenza e provenienza della configurazione;
5. profilo utente e profilo macchina;
6. privacy e proiezione selettiva del contesto per le AI;
7. compatibilità, accessibilità, concorrenza e migrazione.

Non autorizza implementazione, raccolta reale di dati, scansione del computer, creazione di `ASTRALIS_HOME`, migrazione o modifica di progetti.

---

## 2. Decisione architetturale proposta

ASTRALIS Next adotta il modello **Thin Repo, Rich Home, Minimal Context**:

- il repository del framework distribuisce core, schemi, documentazione e valori predefiniti privi di dati personali;
- il repository del progetto conserva identità portabile, router AI e conoscenza tecnica necessaria a comprendere e costruire il progetto;
- `ASTRALIS_HOME` conserva installazioni, profili privati, registrazioni locali, overlay, stato e backup;
- ogni AI riceve una proiezione limitata al compito, mai il caricamento automatico dell'intero profilo utente o macchina;
- i dati rilevati dalla macchina restano distinti dalle preferenze dichiarate dall'utente;
- ogni valore risolto espone provenienza, freschezza e livello di autorità.

Questa separazione consente personalizzazione profonda senza rendere personale la distribuzione pubblica.

---

## 3. Invarianti E2A

1. Distribuzione, release e clone operativo non ricevono dati privati.
2. Il core installato è versionato e non viene modificato in-place.
3. Le scritture sono confinate a una radice locale selezionata e canonicalizzata.
4. Nessun percorso assoluto personale entra nei file pubblici.
5. Un repository di progetto rimane comprensibile senza `ASTRALIS_HOME`.
6. Un dato possiede una sola autorità primaria per ambito.
7. `unknown` è un risultato valido; non viene convertito implicitamente in `false`, zero o valore predefinito.
8. Un fatto dinamico non viene promosso a configurazione autorevole.
9. Nessun dato privato viene inviato, esportato o versionato senza azione esplicita.
10. Le AI ricevono soltanto informazioni pertinenti, redatte e compatibili con il budget di contesto.
11. Discovery, diagnosi e `dry-run` sono read-only.
12. Ogni operazione futura di scrittura richiede piano, verifica e autorizzazione separata.

---

## 4. Aree del sistema

### 4.1 Distribuzione

Contiene il materiale ufficiale. `distribution.json` è l'autorità macchina sulla versione distribuita. Non contiene profili o percorsi locali.

### 4.2 Core installato

Vive sotto `ASTRALIS_HOME/versions/<versione>/`. È eseguibile ma immutabile durante l'uso ordinario. Un aggiornamento installa una nuova versione affiancata.

### 4.3 Home operativo

Il percorso predefinito resta `%USERPROFILE%\.astralis`. L'ordine di selezione proposto è:

1. parametro esplicito del processo;
2. variabile `$env:ASTRALIS_HOME`;
3. percorso predefinito.

Ogni home possiede un `installId` casuale e non derivato dall'hardware.

### 4.4 Profilo utente

`ASTRALIS_HOME/config/user.json` contiene preferenze private, accessibilità, lingua, livello di esperienza e politica di esposizione dei dati.

### 4.5 Profilo macchina

`ASTRALIS_HOME/machines/<machine-id>/machine.json` contiene fatti e capacità della macchina corrente. Il `machine-id` è casuale; non è un fingerprint hardware.

### 4.6 Area progetto locale

`ASTRALIS_HOME/projects/<project-id>/` contiene configurazione privata, registrazioni dei workspace, knowledge privata, migrazioni e ricevute.

### 4.7 Repository di progetto

Conserva `.astralis/project.json`, router AI snelli e conoscenza tecnica portabile. Non conserva profili utente, inventari hardware, segreti o percorsi assoluti.

---

## 5. Catalogo dei contratti nominati

### C1 — Home Resolution

- Risolve una sola home per processo.
- Canonicalizza il percorso prima di confronti o scritture.
- Rifiuta radici ambigue, filesystem non disponibile e reparse point non autorizzati.
- Avvisa se la home è collocata in una cartella sincronizzata.
- Non crea automaticamente la home durante una semplice discovery.

### C2 — Context Classification

Classifica il contesto come `DistributionSource`, `ReleaseBundle`, `InstalledCore`, `UserOverlay`, `ProjectWorkspace`, `LegacyProject`, `DevelopmentSource` oppure `Unknown`.

La classificazione restituisce evidenze, confidenza e operazioni ammesse. Non determina proprietà legale e non autorizza scritture.

### C3 — Ownership and Write Boundary

Ogni documento dichiara un ambito autorevole fra:

- distribuzione;
- installazione;
- utente;
- macchina;
- progetto portabile;
- workspace locale;
- stato derivato.

Una scrittura fuori dall'ambito dichiarato fallisce in modo protetto. `--force` non supera radici protette, traversal o destinazioni non autorizzate.

### C4 — Stable Identity

- `installId`: identifica una home.
- `machineId`: identifica un profilo macchina locale senza fingerprint.
- `projectId`: identifica logicamente un progetto.
- `workspaceId`: identifica una copia locale del progetto.

Nome, percorso, hostname e URL remoto non sostituiscono questi identificatori.

### C5 — Configuration Resolution

La precedenza proposta, dalla più forte alla più debole, è:

1. override esplicito della sessione, non persistente;
2. configurazione privata del workspace o progetto;
3. manifest portabile del progetto;
4. preferenze globali dell'utente;
5. valori predefiniti del core installato.

Ogni risultato contiene valore, sorgente, livello, schema, freschezza ed eventuali conflitti. Un conflitto strutturale non viene risolto con “ultima scrittura vince”.

### C6 — Schema and Evolution

- Standard: JSON Schema Draft 2020-12.
- Validazione: offline e dietro un adattatore unico.
- Formato: UTF-8 senza BOM e terminazioni LF.
- Campi comuni: `$schema`, `documentType`, `schemaVersion`.
- Versione major futura: rifiuto protetto.
- Estensioni: ammesse soltanto in un contenitore `extensions` con namespace.
- Documenti usati per hash: serializzazione canonica e deterministica.
- Campo sconosciuto in un documento critico: errore, non eliminazione silenziosa.

### C7 — User Profile

Il profilo utente è dichiarativo e privato. È autorevole soltanto per preferenze espresse dall'utente, non per fatti rilevati dal sistema.

Deve poter rappresentare:

- nome visualizzato facoltativo;
- lingua e locale preferiti;
- ruolo e livello tecnico dichiarati;
- stile comunicativo e livello di dettaglio;
- modalità di interazione `screen-reader`, `visual`, `mixed` o `unspecified`;
- requisito tastiera-only e preferenza zero-mouse;
- formato preferito di istruzioni, messaggi e riepiloghi;
- tecnologie o domini familiari;
- politica di privacy e condivisione;
- preferenze sui ruoli di percorso, mentre alias concreti e percorsi assoluti restano nei profili macchina, installazione o workspace appropriati.

La modalità di accessibilità descrive esigenze funzionali, non una diagnosi medica.

### C8 — Machine Profile

Il profilo macchina è una fotografia privata, revocabile e aggiornata per moduli. Deve distinguere `facts`, `capabilities`, `paths`, `freshness` e `provenance`.

Può rappresentare:

- sistema operativo, edizione, versione, build e architettura;
- lingua del sistema, locale, fuso orario e layout di tastiera disponibili;
- processore, architettura, core fisici e logici;
- memoria fisica totale;
- volumi utili, tipo di supporto, capacità e spazio disponibile;
- GPU, memoria video, driver e API rilevanti;
- dispositivi audio predefiniti e capacità di input/output;
- screen reader e tecnologie assistive rilevanti;
- PowerShell, Git e toolchain necessarie ai progetti registrati;
- capacità derivate, per esempio `canRunPwsh76`, `hasNvda` o `supportsGpuCompute`;
- alias locali come `<user-home>`, `<astralis-home>`, `<repositories-root>` e `<workspace>`.

Il nome reale del PC è un fatto derivato e non un'identità. Il profilo può conservare un alias scelto dall'utente; hostname reale, percorsi e nomi dei dispositivi vengono redatti nelle proiezioni remote.

### C9 — Collection and Freshness

La raccolta è composta da provider indipendenti:

- sistema operativo;
- CPU e memoria;
- storage;
- grafica;
- audio;
- input e lingua;
- accessibilità;
- toolchain.

Il fallimento di un provider opzionale produce `unknown` e non invalida l'intero profilo.

Freschezza proposta:

- hardware stabile: aggiornamento manuale o ogni 30 giorni;
- sistema e toolchain: ogni 24 ore o dopo un cambiamento rilevato;
- spazio libero, dispositivo audio attivo e layout corrente: rilevamento per sessione o cache massima di 15 minuti;
- valori richiesti da un'operazione critica: nuova verifica immediata.

Ogni valore rilevato registra sorgente, istante, stato e confidenza. La raccolta completa non parte automaticamente per una richiesta che usa un solo provider.

### C10 — Privacy and Data Minimization

Le classi proposte sono:

- `public`: distribuibile;
- `portable`: versionabile nel progetto;
- `private`: confinato a `ASTRALIS_HOME`;
- `sensitive`: utilizzabile soltanto con policy esplicita;
- `secret`: non gestito né caricato da ASTRALIS;
- `prohibited`: mai raccolto.

Sono proibiti per default:

- seriali hardware e identificatori pubblicitari;
- product key, recovery key e credenziali;
- indirizzi MAC, IP e inventario di rete completo;
- contenuto indiscriminato delle variabili d'ambiente;
- cronologia, documenti personali e lista completa dei programmi;
- fingerprint derivati da più identificatori fisici.

Percorsi, hostname, username e nomi di dispositivi sono privati e vengono sostituiti con alias prima di una proiezione remota.

### C11 — AI Context Projection

ASTRALIS non consegna direttamente i profili completi a un'AI. Un Context Compiler read-only produce una vista effimera contenente soltanto:

1. vincoli universali necessari;
2. identità e requisiti portabili del progetto;
3. preferenze utente pertinenti;
4. capacità macchina richieste dal compito;
5. provenienza e freschezza essenziali;
6. campi omessi o redatti quando influenzano l'interpretazione.

Profili di esposizione proposti:

- `local-minimal`: dati pertinenti per strumenti locali;
- `remote-redacted`: nessun percorso o identificatore personale grezzo;
- `manual-export`: anteprima e autorizzazione dell'utente prima della produzione.

Budget candidati da certificare in E3:

- contesto essenziale: massimo indicativo 250 token;
- proiezione standard: massimo indicativo 800 token;
- proiezione estesa: massimo indicativo 2.000 token e motivazione esplicita.

Il superamento del budget richiede selezione ulteriore, non troncamento cieco.

### C12 — Project Portability

`.astralis/project.json` deve contenere soltanto:

- `projectId`;
- nome descrittivo;
- versione dello schema;
- compatibilità ASTRALIS richiesta;
- capacità necessarie;
- router AI e percorsi portabili dichiarati;
- moduli ASTRALIS abilitati.

La registrazione locale conserva separatamente `workspaceId`, percorso canonico, date e stato. Due clone dello stesso progetto condividono `projectId` ma hanno `workspaceId` differenti.

### C13 — Migration, Concurrency and Recovery

- La migrazione segue `detect`, `inventory`, `plan`, `approve`, `apply`, `validate`, `accept` e `cleanup`.
- `plan` è deterministico e possiede hash di contenuto e precondizioni.
- `apply` ricontrolla percorso, link, lock e hash.
- Un lock appartiene a una home e a un workspace; non viene condiviso implicitamente via cloud.
- Core precedente, backup e ricevute restano disponibili secondo D0.7.
- Un'interruzione non promuove una configurazione parziale.
- Nessun profilo privato entra nel backup pubblico o nella release.

### C14 — Accessible and Deterministic Interface

Ogni futura interfaccia deve fornire:

- utilizzo completo da tastiera;
- output lineare compatibile con NVDA;
- modalità normale concisa e modalità diagnostica separata;
- codici di uscita stabili;
- nessuna informazione affidata soltanto a colore, animazione o layout visuale;
- anteprima leggibile prima di operazioni sensibili;
- riepilogo finale con esito, dati non disponibili e prossima azione.

Codici concettuali minimi:

- `CTX_UNKNOWN`;
- `HOME_AMBIGUOUS`;
- `PROFILE_INVALID`;
- `SCHEMA_FUTURE`;
- `PRIVACY_DENIED`;
- `FACT_STALE`;
- `CAPABILITY_UNKNOWN`;
- `PLAN_STALE`;
- `WRITE_BOUNDARY_DENIED`.

---

## 6. Autorità dei metadati

### 6.1 Dati dichiarati

Preferenze, accessibilità funzionale, lingua, livello tecnico e policy di privacy provengono dall'utente. Una rilevazione non può sovrascriverli.

### 6.2 Dati rilevati

Hardware, sistema, toolchain, hostname attivo, spazio libero e dispositivi correnti provengono dai collector. Possono scadere o diventare `unknown`.

### 6.3 Dati derivati

Capacità, compatibilità e raccomandazioni derivano da dati dichiarati e rilevati. Devono citare input e regola applicata.

### 6.4 Dati confermati

Un dato rilevato può essere confermato dall'utente, ma conserva la sua provenienza originaria e non diventa identità stabile se per natura è dinamico.

---

## 7. Utilità sistemica del profilo macchina

Il profilo macchina è ammesso soltanto quando migliora una decisione concreta. Esempi:

- scegliere correttamente runtime e architettura;
- calibrare concorrenza e benchmark senza forzare la macchina;
- individuare spazio insufficiente prima di installazione o backup;
- selezionare toolchain realmente presenti;
- adattare istruzioni a lingua, tastiera e screen reader;
- diagnosticare audio, GPU o driver in progetti che li usano;
- evitare suggerimenti incompatibili con il sistema operativo.

Non deve essere usato per profilazione commerciale, identificazione persistente, telemetria remota automatica o caricamento indiscriminato nel prompt.

---

## 8. Compatibilità e degradazione controllata

1. Profilo utente mancante: usare default neutrali e chiedere soltanto dati necessari.
2. Profilo macchina mancante: eseguire discovery puntuale in lettura oppure restituire `unknown`.
3. Collector non disponibile: disabilitare soltanto la capacità dipendente.
4. Schema minor compatibile: accettare secondo lo schema locale.
5. Schema major futuro: arresto protetto senza riscrittura.
6. Progetto privo di manifest: classificare `LegacyProject` e proporre onboarding.
7. `ASTRALIS_HOME` assente: repository e documentazione restano utilizzabili; funzioni locali vengono dichiarate non disponibili.
8. Più home candidate: nessuna selezione implicita.
9. Dati scaduti: ricalcolo puntuale o avviso, mai uso silenzioso in operazioni critiche.

---

## 9. Criteri di accettazione E2A

La proposta è approvabile se:

1. ogni dato ha un'autorità e una destinazione univoche;
2. profilo utente e macchina restano privati e separati;
3. il profilo macchina non costituisce un fingerprint;
4. il repository non dipende da percorsi locali per essere compreso;
5. la proiezione AI è pertinente, redatta e limitata;
6. contesti sconosciuti e dati scaduti falliscono in modo protetto;
7. schema e compatibilità sono evolutivi ma deterministici;
8. il modello supporta più home, macchine, progetti e workspace;
9. l'interfaccia futura è lineare e accessibile con NVDA;
10. nessun contratto autorizza implicitamente scritture o raccolte reali.

---

## 10. Matrice di simulazione a 3 livelli

### Livello 1 — Happy Path

Una home esplicita contiene un profilo utente valido e un profilo macchina fresco. Un progetto registrato viene risolto e l'AI riceve una proiezione redatta con le sole capacità necessarie.

### Livello 2 — Alternative e concorrenza

- due computer usano lo stesso progetto con `machineId` e `workspaceId` differenti;
- due home dello stesso account non si fondono;
- un collector audio fallisce mentre gli altri restano validi;
- un'AI locale e una remota ricevono proiezioni diverse secondo policy;
- il progetto funziona in CI senza profilo personale;
- un clone viene spostato e la registrazione locale viene riconciliata per identità.

### Livello 3 — Corner Cases

- profilo JSON corrotto o con schema futuro;
- hostname, nome dispositivo o percorso contenente dati personali;
- stesso `projectId` assegnato erroneamente a progetti differenti;
- profilo macchina copiato tramite cloud su un altro PC;
- junction modificata fra piano e applicazione;
- spazio libero diventato insufficiente dopo la discovery;
- screen reader non rilevabile ma requisito tastiera-only dichiarato;
- toolchain aggiornata mentre una proiezione è in costruzione;
- tentativo di esportare dati `sensitive`, `secret` o `prohibited`.

L'esito richiesto è degradazione esplicita, richiesta mirata o arresto protetto; mai fusione implicita, perdita di dati o esposizione silenziosa.

---

## 11. Validazione sui 7 Assi di Qualità

1. **Validità**: i contratti rispettano Thin Repo, Rich Home e le decisioni D0 approvate.
2. **Efficacia**: i metadati vengono raccolti e caricati soltanto quando migliorano una decisione reale.
3. **Coerenza**: autorità, precedenza, identità e confini di scrittura non si sovrappongono.
4. **Completezza**: sono coperti installazione, utente, macchina, progetto, workspace, AI, privacy, compatibilità e migrazione.
5. **Precisione**: fatti dichiarati, rilevati, derivati e dinamici possiedono semantiche distinte.
6. **Prestazioni**: collector modulari, freschezza e proiezioni limitate evitano scansioni e prompt massivi.
7. **Assenza di regressioni**: progetto e distribuzione rimangono utilizzabili senza profili locali; E1 e `main` non vengono alterati.

### 11.1 Esito della validazione documentale

- **Protocollo**: 43 controlli su struttura, coerenza, privacy, portabilità, modularità, compatibilità, accessibilità, collegamenti e confini Git.
- **Esito**: 43 controlli superati su 43; nessun difetto documentale bloccante.
- **Confine dell'evidenza**: la validazione riguarda la proposta E2A e non certifica runtime, validatore JSON Schema, prestazioni o baseline legacy.
- **Stato operativo**: nessun dato è stato raccolto e nessun artefatto runtime è stato creato.

---

## 12. Decisioni proposte a Luca

Si propone di approvare congiuntamente:

1. due profili privati distinti: utente dichiarativo e macchina rilevata;
2. `machineId` casuale e divieto di fingerprint hardware;
3. hostname reale come dato derivato e redatto, con alias facoltativo;
4. metadati hardware modulari, con provenienza e scadenza;
5. percorsi assoluti confinati ai documenti locali e sostituiti da alias nelle proiezioni;
6. `.astralis/project.json` come identità portabile minima del progetto;
7. Context Compiler selettivo come unico accesso ordinario dei collaboratori AI ai profili;
8. nessuna raccolta, sincronizzazione o esportazione automatica;
9. schema Draft 2020-12 offline con adattatore unico;
10. stop obbligatorio dopo E2A prima di struttura, schemi reali o codice.

---

## 13. Gating e prossima fase

E2A è una proposta documentale. Fino all'approvazione esplicita di Luca non sono autorizzati:

- creazione di `ASTRALIS_HOME`;
- raccolta di dati utente o macchina;
- creazione dei file JSON o dei relativi schemi;
- riscrittura dei documenti di onboarding;
- modifica di script o template;
- implementazione dei collector o del Context Compiler;
- avvio di E2B, E2C o E3;
- migrazione o modifica di repository di progetto;
- modifica di `main` o del Master Hub.

Dopo l'approvazione, E2B dovrà definire gli schemi formali e l'albero minimo su carta prima di crearli. E2C dovrà riscrivere soltanto i documenti minimi approvati. Il comportamento eseguibile resterà confinato a E3 e richiederà una nuova autorizzazione.
