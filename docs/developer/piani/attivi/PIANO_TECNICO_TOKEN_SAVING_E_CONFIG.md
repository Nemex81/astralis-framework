# Piano Tecnico: ASTRALIS_HOME, Configurazione Deterministica, Context Resolver e Migrazione Progressiva (ASTRALIS v3.1.0)

- **Identificativo**: `PIANO-AST-3.1.0-HOME-CONFIG-MIGRATION`
- **Tipologia**: Implementativo, Architetturale e Migratorio
- **Autori**: Luca (Senior Developer & Author) & Antigravity (AI Pair Programmer)
- **Revisore**: GPT Codex / ChatGPT (Copilota Ausiliario e Senior Reviewer)
- **Data iniziale**: 2026-09-08
- **Ultima revisione documentale**: 2026-09-10
- **Stato Operativo**: `[CONSOLIDATO 1A — 14 DECISIONI D0 APPROVATE, 4 DA CERTIFICARE; ATTESA AUTORIZZAZIONE PER LA SOTTO-FASE 1B]`
- **Baseline osservata**: ASTRALIS `v3.0.4`, da certificare nel Cancello D0
- **Target Version (AVF/SemVer)**: `v3.1.0`
- **Repository Target**: `Nemex81/astralis-framework` e installazioni ASTRALIS locali
- **Strategia approvata di riferimento**: [`STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md`](../../strategie/STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md)
- **Registro decisionale D0**: [`DECISIONI_D0_ASTRALIS_V3_1_0.md`](DECISIONI_D0_ASTRALIS_V3_1_0.md)
- **Fonti normative**:
  - [`automazioni_powershell_e_resilienza.md`](../../../../knowledge/03_architettura_e_metodologie/automazioni_powershell_e_resilienza.md)
  - [`ingegneria_delle_regole_e_meta_governance.md`](../../../../knowledge/03_architettura_e_metodologie/ingegneria_delle_regole_e_meta_governance.md)
  - [`catalogo_protocolli_operativi_astralis.md`](../../../../knowledge/03_architettura_e_metodologie/catalogo_protocolli_operativi_astralis.md)

---

## 1. Esito della formalizzazione

Il piano traduce la strategia **Thin Repo, Rich Home** in contratti implementativi verificabili. La versione 3.1.0 non deve limitarsi a introdurre due file JSON: deve separare in modo esplicito sorgente distribuibile, core installato, configurazione privata, overlay autoappreso, stato operativo e conoscenza portabile di progetto.

Il risultato atteso è il seguente:

1. clone e release ASTRALIS sono sorgenti di installazione o workspace di sviluppo, non cartelle operative quotidiane;
2. il core viene installato sotto `ASTRALIS_HOME` in versioni affiancate e immutabili;
3. configurazioni personali e apprendimenti approvati restano esterni ai repository;
4. ogni progetto conserva nel proprio repository manifest, router e conoscenza tecnica portabile;
5. la configurazione effettiva è deterministica e ogni valore espone la propria provenienza;
6. la migrazione legacy è progressiva, read-only per default, reversibile e senza cancellazioni automatiche;
7. gli script specialistici consumano il resolver comune e non duplicano logica di percorso o configurazione.

---

## 2. Ambito della release v3.1.0

### 2.1 Nucleo obbligatorio

La release 3.1.0 comprende:

1. manifest di distribuzione, installazione e progetto;
2. struttura e lifecycle di `ASTRALIS_HOME`;
3. schemi JSON versionati;
4. classificazione del contesto di esecuzione;
5. resolver deterministico read-only;
6. CLI di interrogazione, audit e proposta;
7. onboarding di nuova installazione e nuovo progetto;
8. inventario e migrazione progressiva di installazioni e progetti legacy;
9. aggiornamento side-by-side, attivazione atomica e rollback;
10. overlay governato per autoapprendimento;
11. audit di privacy, portabilità e coerenza;
12. test headless e documentazione operativa accessibile.

### 2.2 Funzioni differite

Le automazioni specialistiche seguenti non bloccano il nucleo v3.1.0 e devono essere implementate soltanto dopo la stabilizzazione del resolver:

- chiusura RRU;
- ordinamento e verifica I18N;
- estrazione di telemetria;
- automazioni avanzate di pubblicazione;
- promozione assistita di conoscenza dall'overlay al framework pubblico.

La loro progettazione resta inclusa come contratto di integrazione, ma la loro implementazione appartiene a milestone successive.

### 2.3 Esclusioni esplicite

Il piano non autorizza:

- spostamento massivo della knowledge fuori dai repository;
- modifica o eliminazione del Master Hub legacy;
- modifica dei progetti reali durante lo sviluppo del nucleo;
- pubblicazione di dati privati;
- gestione di segreti applicativi;
- aggiornamenti in-place del core attivo;
- riscrittura della storia Git;
- applicazione autonoma di apprendimenti o migrazioni.

---

## 3. Terminologia normativa

1. **Distribution Source**: clone o cartella sorgente del framework.
2. **Release Bundle**: archivio ufficiale o sua estrazione verificata.
3. **ASTRALIS_HOME**: radice operativa locale, predefinita in `%USERPROFILE%\.astralis` e sostituibile tramite `$env:ASTRALIS_HOME`.
4. **Installed Core**: versione immutabile installata in `ASTRALIS_HOME/versions/<versione>/`.
5. **User Overlay**: configurazione e conoscenza privata approvata dall'utente.
6. **Project Workspace**: repository o cartella di progetto registrata mediante manifest portabile.
7. **Legacy Project**: progetto riconoscibile come ASTRALIS ma privo del nuovo manifest.
8. **Development Source**: clone registrato esplicitamente come sorgente modificabile del framework.
9. **Effective Configuration**: vista risolta in memoria combinando i livelli autorizzati.
10. **Provenance**: origine, livello, confidenza e trasformazioni associate a un valore.
11. **Proposal**: risultato read-only che descrive scritture potenziali senza applicarle.
12. **Receipt**: ricevuta immutabile dell'operazione autorizzata, utile a audit e rollback.

---

## 4. Registro di avanzamento e gating

### 4.1 Sotto-Fase 1A — Piano documentale

- [x] Strategia architetturale formalizzata.
- [x] Ambito v3.1.0 separato dalle milestone specialistiche.
- [x] Contratti D0..D12 definiti.
- [x] Contratti software S1..S13 definiti.
- [x] Modello dati, precedenze e sicurezza dei percorsi formalizzati.
- [x] Migrazione Master Hub e progetto legacy formalizzata.
- [x] Criteri di accettazione e matrice di simulazione formalizzati.
- [x] Validazione documentale interna eseguita sui 7 Assi.
- [x] Registro unico delle decisioni D0 formalizzato.
- [x] Tutte le 14 decisioni D0 approvate sul piano concettuale da Luca.
- [ ] Certificazioni tecniche D0.3, D0.4, D0.11 e D0.12.
- [ ] Autorizzazione esplicita di Luca per l'avvio della Sotto-Fase 1B.

### 4.2 Sotto-Fase 1B — Implementazione del nucleo

- [ ] Congelare e certificare la baseline.
- [ ] Implementare manifest e schemi.
- [ ] Implementare I/O sicuro, Context Resolver e Config Resolver.
- [ ] Implementare CLI, installazione e onboarding.
- [ ] Implementare migrazione, aggiornamento e rollback.
- [ ] Integrare audit e test headless.

### 4.3 Fase 2 — Pilota controllato

- [ ] Installazione pulita da release in ambiente temporaneo.
- [ ] Migrazione su copia controllata del Master Hub.
- [ ] Registrazione e migrazione su copia di un progetto maturo.
- [ ] Verifica manuale NVDA e verifica di portabilità senza `ASTRALIS_HOME`.
- [ ] Correzione delle sole anomalie dimostrate dalle evidenze.

### 4.4 Fase 3 — Rilascio

- [ ] Allineare `README.md`, `CHANGELOG.md` e `ISTRUZIONI_DI_AVVIO.md`.
- [ ] Costruire e verificare lo Starter Kit v3.1.0.
- [ ] Pubblicare schema, checksum, note di migrazione e matrice di compatibilità.
- [ ] Eseguire una prova di rollback dalla release candidata.
- [ ] Promuovere v3.1.0 soltanto dopo approvazione finale.

### 4.5 Bonifica legacy separata

Qualunque eliminazione, spostamento definitivo o deprecazione dei file originali appartiene a un'attività successiva e richiede nuova autorizzazione. Il completamento della migrazione non implica autorizzazione alla bonifica.

---

## 5. Decisioni architetturali vincolanti

### 5.1 Radice operativa

Il percorso predefinito è `%USERPROFILE%\.astralis`. Un percorso alternativo è ammesso tramite `$env:ASTRALIS_HOME`, ma deve essere:

- assoluto dopo la risoluzione;
- accessibile all'utente corrente;
- distinto dalla sorgente di distribuzione e dai repository di progetto;
- registrato in modo esplicito;
- verificato prima di ogni scrittura.

### 5.2 Struttura logica di ASTRALIS_HOME

- `install.json`: identità dell'installazione e versione del formato.
- `current.json`: puntatore testuale alla versione attiva.
- `versions/<versione>/`: core installati, verificati e immutabili durante l'uso ordinario.
- `config/user.json`: preferenze globali private.
- `overlays/user/`: regole e conoscenza personali approvate.
- `projects/<project-id>/project.local.json`: valori privati e specifici della macchina.
- `projects/<project-id>/knowledge-private/`: conoscenza non portabile.
- `projects/<project-id>/migration/`: inventari, proposte, conflitti e ricevute.
- `state/`: cache ricostruibili, lock e indici.
- `backups/`: materiale strettamente necessario a ripristino e rollback.

### 5.3 Identità del progetto

Ogni progetto nativo possiede un `project-id` persistente e non derivato soltanto dal nome della cartella. Il manifest portabile contiene l'identità logica; la registrazione locale associa tale identità a uno o più workspace fisici.

Ogni clone locale riceve inoltre un `workspace-id` distinto, conservato fuori dal repository. In questo modo due clone dello stesso progetto condividono l'identità logica ma non stato, lock o percorsi locali.

### 5.4 Attivazione del core

`current.json` deve contenere un riferimento validato a una versione installata completa. L'attivazione avviene soltanto dopo verifica di manifest, hash, schemi e test minimi. Un puntatore non valido non deve causare una ricerca arbitraria di cartelle simili.

### 5.5 Portabilità del repository

Il repository conserva:

- `.astralis/project.json` portabile e versionabile;
- router AI snelli e agnostici rispetto alla macchina;
- knowledge tecnica correlata al codice;
- strategie, piani, report e RRU necessari alla continuità progettuale;
- requisiti di build e test senza credenziali o percorsi personali.

L'assenza di `ASTRALIS_HOME` non deve impedire a un collaboratore o a una CI di comprendere il progetto.

---

## 6. Classificazione dei dati e confini di responsabilità

### 6.1 Core ufficiale

Contiene regole, template e default distribuibili. Non contiene nomi utente, hostname, percorsi personali, credenziali o apprendimenti privati.

### 6.2 Configurazione utente

`config/user.json` contiene soltanto preferenze globali dell'utente e riferimenti locali autorizzati. Non deve duplicare dati ricavabili in modo affidabile dall'ambiente.

### 6.3 Manifest portabile di progetto

`.astralis/project.json` contiene identità, dominio, requisiti, convenzioni portabili e riferimenti relativi. Non contiene percorsi assoluti, segreti, hostname o destinazioni personali.

### 6.4 Configurazione locale di progetto

`project.local.json`, esterno al repository, contiene associazioni macchina-specifiche: toolchain, istanze runtime, percorsi di deploy, log e override privati.

### 6.5 Stato derivato

Branch corrente, commit, dirty state, hostname, artefatti presenti e tool disponibili sono rilevati al momento dell'uso. Eventuali cache devono essere revocabili e non autorevoli.

### 6.6 Classi di sensibilità

Ogni campo o file deve essere classificato come:

1. `public`: pubblicabile e portabile;
2. `private`: locale all'utente o al progetto;
3. `sensitive`: ammesso soltanto con protezioni e audit dedicati;
4. `secret`: vietato nei manifest ASTRALIS e gestito da strumenti esterni appropriati.

La classificazione più restrittiva prevale. Un dato non classificato viene trattato come privato fino a decisione esplicita.

Backup, ricevute e piani di migrazione ereditano la classificazione più restrittiva dei dati che contengono. Devono essere esclusi dai repository, protetti mediante permessi locali appropriati e sottoposti alla policy di conservazione; una cartella sincronizzata da servizi cloud non viene considerata automaticamente privata.

---

## 7. Schemi, versioni e compatibilità dei dati

### 7.1 Standard e file previsti

Gli schemi adottano JSON Schema Draft 2020-12 e sono distribuibili localmente per consentire validazione offline. Sono previsti almeno:

- `schemas/distribution.schema.json`;
- `schemas/install.schema.json`;
- `schemas/current.schema.json`;
- `schemas/user-config.schema.json`;
- `schemas/project.schema.json`;
- `schemas/project-local.schema.json`;
- `schemas/overlay-entry.schema.json`;
- `schemas/migration-plan.schema.json`;
- `schemas/operation-receipt.schema.json`.

### 7.2 Dimensioni di versione separate

Ogni documento deve distinguere:

1. `frameworkVersion`: versione ASTRALIS;
2. `schemaVersion`: versione della struttura dati;
3. `manifestVersion`: versione del tipo di manifest;
4. `overlayVersion`: versione del formato di apprendimento;
5. `generatorVersion`: versione dello strumento che ha prodotto il file.

Non è ammesso dedurre automaticamente una dimensione dalle altre.

### 7.3 Politica di compatibilità

- Versione schema supportata: caricamento e validazione normali.
- Versione schema precedente supportata: adattamento in memoria, senza riscrittura automatica.
- Versione schema precedente migrabile: proposta esplicita e applicazione separata.
- Versione schema futura: errore protetto, diagnostica e nessuna scrittura.
- Chiave sconosciuta: preservazione in round-trip quando consentito dallo schema.
- Campo obbligatorio mancante: errore di validazione, mai default silenzioso se influenza sicurezza o destinazioni di scrittura.
- Tipo incompatibile: errore esplicito con provenienza dei due valori.

---

## 8. Precedenza e merge deterministico

La Effective Configuration viene costruita in questo ordine, dal livello meno prioritario al più prioritario:

1. default del core attivo;
2. configurazione globale utente;
3. manifest portabile del progetto;
4. configurazione locale privata del workspace;
5. override CLI effimero della singola invocazione.

Regole di merge:

- gli oggetti vengono uniti ricorsivamente;
- gli array vengono sostituiti integralmente, salvo strategia esplicitamente dichiarata dallo schema;
- un campo assente eredita il valore del livello precedente;
- `null` è un valore reale e non significa eliminazione, salvo semantica esplicita dello schema;
- tipi differenti sullo stesso campo producono errore;
- l'override CLI non viene persistito;
- nessun valore può acquisire privilegi di scrittura superiori al proprio ambito;
- ogni valore effettivo conserva livello, file, chiave e trasformazioni di provenienza.

Il resolver deve poter restituire sia il valore compatto sia una spiegazione `explain` completa.

---

## 9. Risoluzione sicura dei percorsi

### 9.1 Forme ammesse

- `%VAR%`;
- `$env:VAR`;
- `~` soltanto all'inizio del percorso;
- percorsi relativi, risolti rispetto alla radice dichiarata dal campo e non rispetto alla directory di esecuzione casuale.

### 9.2 Regole obbligatorie

1. Nessun uso di `Invoke-Expression` o valutazione di codice.
2. Variabile mancante: errore esplicito, non sostituzione con stringa vuota.
3. Espansione ricorsiva limitata e rilevamento dei cicli.
4. Canonicalizzazione prima del confronto fra radici.
5. Confronto case-insensitive su Windows, senza alterare la rappresentazione originale.
6. Rilevamento di junction, link simbolici e reparse point prima di scritture.
7. Confinamento alla radice autorizzata per ogni operazione mutante.
8. Rifiuto del path traversal e delle destinazioni equivalenti alla sorgente protetta.
9. Gestione esplicita di UNC, volumi differenti, Unicode, spazi e percorsi lunghi.
10. Nessuna dipendenza da file `.lnk` come destinazione reale.

### 9.3 Invariante di sicurezza

La stringa iniziale non è sufficiente a determinare il confine. L'autorizzazione viene applicata al percorso canonico finale e verificata nuovamente immediatamente prima della scrittura.

---

## 10. Contratto di output del Context Resolver

Il risultato minimo deve includere:

- `contextType`;
- `contextConfidence`;
- `frameworkVersionObserved`;
- `frameworkVersionSource`;
- `distributionRoot`, se presente;
- `astralisHome`, se disponibile;
- `installedCoreRoot`, se valido;
- `projectRoot`, se riconosciuto;
- `projectId` e `workspaceId`, se registrati;
- `allowedOperations`;
- `warnings` e `conflicts`;
- `evidence`, ordinata per affidabilità.

Classi previste:

1. `DistributionSource`;
2. `ReleaseBundle`;
3. `InstalledCore`;
4. `UserOverlay`;
5. `ProjectWorkspace`;
6. `LegacyProject`;
7. `DevelopmentSource`;
8. `Unknown`.

La classificazione disciplina le operazioni tecniche ammesse; non determina proprietà legale e non impedisce modifiche volontarie a clone o fork.

---

## 11. Contratti architetturali denominati D0..D12

Ogni contratto richiede quattro elementi nella futura implementazione: precondizioni verificabili, output dichiarato, invarianti e prove automatizzate.

### D0 — Baseline certificata e inventario ripetibile

- **Precondizioni**: repository, Master Hub e fixture pilota disponibili in sola lettura.
- **Output**: inventario con hash, versioni dichiarate, riferimenti Git, codifica ed eventuali conflitti.
- **Invarianti**: nessuna modifica; nessuna versione scelta arbitrariamente.
- **Prove**: due scansioni immutate producono lo stesso risultato normalizzato.

D0 deve risolvere prima dell'implementazione le discordanze già osservate fra `README.md`, `CHANGELOG.md`, istruzioni, tag e contenuti distribuiti.

### D1 — Context Fencing e protezione delle sorgenti

- **Precondizioni**: percorso di avvio esistente.
- **Output**: classe di contesto, confidenza, evidenze e operazioni permesse.
- **Invarianti**: `Unknown` è read-only; distribuzione e release non ricevono dati operativi; una sorgente di sviluppo deve essere registrata esplicitamente.
- **Prove**: clone, fork, ZIP, core installato, progetto, junction e cartella anonima.

### D2 — Core immutabile e versioni affiancate

- **Precondizioni**: manifest di distribuzione e destinazione valida.
- **Output**: core completo in `versions/<versione>` e puntatore attivabile.
- **Invarianti**: niente aggiornamenti in-place; cartella incompleta mai attiva; versione precedente preservata.
- **Prove**: installazione pulita, reinstallazione idempotente, interruzione e rollback.

### D3 — Privacy e separazione degli ambiti

- **Precondizioni**: schema con classificazione dei campi.
- **Output**: destinazione ammessa per ogni valore.
- **Invarianti**: segreti vietati; valori privati fuori da Git; dato sconosciuto trattato come privato.
- **Prove**: nomi utente, hostname, percorsi assoluti, token, dati portabili e casi ambigui.

### D4 — Schemi evolutivi e round-trip conservativo

- **Precondizioni**: schema disponibile localmente.
- **Output**: esito valido, adattato in memoria, migrabile oppure incompatibile.
- **Invarianti**: chiavi preservate; schema futuro non riscritto; nessun default silenzioso sui campi critici.
- **Prove**: versioni corrente, precedente, futura, campo sconosciuto, tipo errato e documento troncato.

### D5 — Risoluzione deterministica e provenienza

- **Precondizioni**: livelli singolarmente validi.
- **Output**: configurazione effettiva più mappa di provenienza.
- **Invarianti**: ordine fisso; merge puro; nessuna modifica dei file sorgente; `explain` disponibile.
- **Prove**: oggetti, array, `null`, chiavi assenti, conflitto di tipo e override CLI.

### D6 — Separazione lettura, proposta e applicazione

- **Precondizioni**: contesto riconosciuto e comando valido.
- **Output**: query, piano dry-run oppure ricevuta di applicazione.
- **Invarianti**: `get`, `audit`, `discover` e `plan` sono read-only; `apply` richiede piano immutato e conferma esplicita.
- **Prove**: confronto hash prima/dopo ogni comando read-only e rifiuto di piani scaduti.

### D7 — Onboarding accessibile e idempotente

- **Precondizioni**: utente informato della destinazione e dei dati richiesti.
- **Output**: installazione valida, configurazione minima e rapporto lineare.
- **Invarianti**: valori personali mai precompilati con dati dell'autore; riesecuzione non duplica né sovrascrive.
- **Prove**: default, percorso personalizzato, cartella esistente, permesso negato e uso completo via tastiera/NVDA.

### D8 — Migrazione legacy progressiva

- **Precondizioni**: inventario, snapshot recuperabile e baseline quando disponibile.
- **Output**: classificazione, proposta, conflitti e ricevuta.
- **Invarianti**: nessuna cancellazione; nessuna scelta arbitraria; originali preservati; applicazione granulare.
- **Prove**: versioni 2.6.x–3.0.x, baseline mancante, file modificati, conflitti e interruzione.

### D9 — Aggiornamento side-by-side e rollback

- **Precondizioni**: core corrente sano e pacchetto nuovo verificato.
- **Output**: nuova versione e, se necessario, copia migrata dell'overlay in staging, testate e poi attivate come coppia compatibile.
- **Invarianti**: overlay originale non sovrascritto; migrazione overlay copy-on-write; puntatore cambiato per ultimo; rollback del core accompagnato dal ripristino della vista overlay compatibile; rollback indipendente dalla rete.
- **Prove**: aggiornamento riuscito, overlay invariato, overlay migrato, hash errato, disco pieno, lock, test fallito e rollback dopo uso della nuova versione.

### D10 — Autoapprendimento governato

- **Precondizioni**: proposta con origine, motivazione, ambito e impatto.
- **Output**: voce in staging o overlay approvato.
- **Invarianti**: nessuna promozione autonoma; conflitti espliciti; core immutabile.
- **Prove**: apprendimento personale, privato di progetto, portabile, universale candidato e temporaneo.

### D11 — Thin Repo e continuità fuori da ASTRALIS_HOME

- **Precondizioni**: clone pulito del progetto.
- **Output**: contesto minimo comprensibile a persona, CI e AI remota.
- **Invarianti**: knowledge tecnica vicina al codice; router snelli; nessun riferimento personale obbligatorio.
- **Prove**: checkout su macchina differente senza profilo locale e audit dei riferimenti assoluti.

### D12 — Integrazione degli strumenti specialistici

- **Precondizioni**: resolver stabile e API interna versionata.
- **Output**: automazioni RRU, I18N, audit e telemetria come consumatori del nucleo.
- **Invarianti**: nessuna duplicazione di merge, path expansion o identificazione progetto.
- **Prove**: contract test comuni e regressioni specifiche di ogni strumento.

---

## 12. Contratti software S1..S13

I nomi dei file sono proposti e possono essere raffinati in 1B senza modificare i contratti architetturali.

### S1 — Manifest di distribuzione

Un manifest del pacchetto dichiara versione, schema, contenuti attesi, hash, canale e compatibilità. L'installazione non si affida al nome della cartella o del file ZIP. Gli hash devono essere confrontati con metadati acquisiti da una fonte attendibile separata dal contenuto da verificare; hash e archivio controllati dalla stessa sorgente non dimostrano autenticità.

### S2 — Schemi e fixture

La cartella `schemas/` contiene schemi offline. La cartella di test contiene fixture valide, legacy, corrotte e future; nessuna fixture contiene dati personali reali.

### S3 — `scripts/lib/AstralisSafeIO.psm1`

Un solo modulo gestisce canonicalizzazione, verifica dei confini, letture UTF-8, scritture atomiche, lock, hash, backup e ricevute. Gli altri moduli non reimplementano queste funzioni.

### S4 — `scripts/lib/AstralisContext.psm1`

Classifica il percorso corrente tramite manifest, marker, Git facoltativo e registrazioni locali. Restituisce evidenze senza scrivere.

### S5 — `scripts/lib/AstralisConfig.psm1`

Valida i livelli, esegue merge puro, espande percorsi e produce valori più provenienza. Il modulo non contiene UI né logica di migrazione.

### S6 — `scripts/astralis.ps1`

CLI sottile con famiglie di comandi:

- `context`;
- `config get`;
- `config explain`;
- `project discover`;
- `project register plan` e `project register apply`;
- `migrate scan`, `migrate plan` e `migrate apply`;
- `update check`, `update plan`, `update apply` e `update rollback`;
- `audit`;
- `doctor`.

Le mutazioni non sono nascoste dentro comandi di lettura.

### S7 — Installer

Installa un pacchetto verificato in staging, convalida i contenuti, lo promuove nella cartella versionata e attiva il puntatore soltanto alla fine.

### S8 — Migratore

Esegue inventario e confronto a tre vie, genera un piano firmato tramite hash dei pre-requisiti, applica soltanto voci approvate e produce una ricevuta.

### S9 — Bootstrap progetto

Evolve `bootstrap_progetto.ps1` per generare il manifest portabile e registrare separatamente il workspace locale. Non incorpora dati personali nei template.

### S10 — Aggiornamento ecosistema

Evolve `aggiorna_ecosistema.ps1` separando obbligatoriamente `scan`, `plan` e `apply`. L'eventuale scansione di più progetti usa un registro esplicito e non presume che siano figli della cartella ASTRALIS.

### S11 — Audit governance e privacy

Verifica almeno: router entro il budget, link locali, BOM, terminazioni dichiarate, schema, percorsi assoluti personali, file sensibili, manifest, provenienza e coerenza di versione.

### S12 — Adattatori specialistici differiti

`chiudi_task_rru.ps1`, `ordina_lang_json.ps1` ed `estrai_telemetria.ps1` usano i moduli S3–S5 e mantengono i propri contratti di dominio.

### S13 — Suite di test headless

I test sono deterministici, senza `sleep` come requisito funzionale, senza rete obbligatoria e con directory temporanee isolate. Devono poter verificare atomicità e rollback mediante fault injection controllata.

---

## 13. Contratto della CLI e semantica degli errori

### 13.1 Canali di output

- `stdout`: dati richiesti o oggetto risultato, privo di testo decorativo in modalità JSON.
- canale diagnostico: spiegazioni, warning e istruzioni di recupero.
- modalità umana: testo lineare, sintetico e ordinato per NVDA.
- modalità `--json`: struttura stabile e versionata per automazioni.
- modalità `--quiet`: nessun output superfluo, ma codici di uscita invariati.

### 13.2 Codici di uscita proposti

1. `0`: successo completo.
2. `2`: argomenti non validi.
3. `3`: contesto non riconosciuto o ambiguo.
4. `4`: schema o configurazione non validi.
5. `5`: operazione vietata dalla policy di contesto.
6. `6`: conflitto che richiede decisione dell'utente.
7. `7`: integrità, hash o baseline non verificabili.
8. `8`: errore I/O, lock o permessi.
9. `9`: verifica o test pre-attivazione fallito.
10. `10`: rollback richiesto o non completato.
11. `11`: piano scaduto perché le precondizioni sono cambiate.

### 13.3 Sicurezza delle operazioni mutanti

Ogni comando `apply` deve richiedere:

- identificativo del piano generato;
- hash delle precondizioni ancora valido;
- contesto e destinazione riesaminati;
- elenco preciso delle scritture;
- conferma esplicita in modalità interattiva oppure flag intenzionale in automazione autorizzata;
- ricevuta finale, anche in caso di fallimento parziale.

Il flag `--force` non può aggirare protezione delle sorgenti, schema futuro, perdita di dati o confini di percorso.

---

## 14. Piano di migrazione del Master Hub legacy

Il Master Hub reale è trattato come installazione legacy personale, sorgente di evidenze e archivio protetto. Non viene trasformato in-place.

### MH0 — Acquisizione forense read-only

1. Registrare hash, dimensioni, timestamp e struttura rilevante.
2. Rilevare versioni dichiarate e marker storici.
3. Associare, quando possibile, lo Starter Kit corrispondente.
4. Registrare file identici, modificati, aggiunti e sconosciuti.
5. Generare un rapporto senza creare file nel Master Hub.

### MH1 — Confronto a tre vie

Confrontare:

1. baseline ufficiale legacy;
2. Master Hub corrente;
3. nuovo core v3.1.0.

Le differenze vengono classificate come:

- core ufficiale invariato;
- core modificato localmente;
- profilo o preferenza personale;
- strumento riservato allo sviluppo;
- conoscenza universale candidata;
- archivio o evidenza storica;
- conflitto;
- elemento sconosciuto protetto.

### MH2 — Staging della nuova installazione

1. Installare il core v3.1.0 in una destinazione nuova.
2. Produrre `user.json` e overlay soltanto in staging.
3. Non copiare automaticamente archivi, release storiche o strumenti di pubblicazione.
4. Conservare per ogni valore il collegamento alla sorgente legacy.
5. Presentare una proposta lineare e granulare.

### MH3 — Applicazione autorizzata

1. Applicare soltanto le voci approvate.
2. Verificare schema, percorsi, privacy e completezza.
3. Eseguire test di equivalenza delle query essenziali.
4. Attivare il nuovo core per ultimo.
5. Generare ricevuta e istruzioni di rollback.

### MH4 — Convivenza e chiusura

Il Master Hub originale resta disponibile e invariato durante il periodo pilota. Qualunque archiviazione o rimozione futura è una bonifica separata soggetta al Protocollo di Eliminazione Protetta.

---

## 15. Piano di migrazione di un progetto ASTRALIS legacy

Il progetto non viene spostato sotto `ASTRALIS_HOME`. Viene registrato nella sua posizione reale e collegato tramite `project-id` e `workspace-id`.

### PR0 — Inventario read-only

Rilevare:

- radice Git o radice di progetto;
- router AI e versioni ASTRALIS dichiarate;
- knowledge, strategie, piani, report e RRU;
- build, test, artefatti, deploy e telemetria;
- percorsi assoluti, dati personali e file locali già ignorati;
- branch, commit, tag e dirty state come dati derivati;
- conflitti fra dichiarazioni documentali e stato reale.

### PR1 — Classificazione

- La conoscenza tecnica necessaria a comprendere il codice resta nel repository.
- Preferenze personali e percorsi macchina-specifici vengono proposti per `project.local.json` o overlay privato.
- I router conservano identità, invarianti e puntatori minimi; non diventano vuoti alias alla configurazione esterna.
- I valori derivati non vengono copiati come verità persistente.
- Ogni ambiguità rimane conflitto aperto.

### PR2 — Piano di conversione

Il dry-run propone separatamente:

1. creazione del manifest portabile;
2. registrazione locale del workspace;
3. estrazione dei soli dati privati ad alta confidenza;
4. aggiornamento dei router necessario a rimuovere riferimenti personali;
5. mantenimento esplicito di knowledge e documenti di dominio;
6. test di portabilità e non regressione;
7. elementi lasciati invariati e relativa motivazione.

### PR3 — Applicazione e verifica

L'applicazione futura deve essere granulare, atomica per unità logica e preceduta da snapshot. La migrazione è conclusa soltanto quando:

- il progetto funziona con e senza profilo locale, secondo le capacità dichiarate;
- i test preesistenti non regrediscono;
- nessun riferimento personale nuovo è tracciato;
- router e documentazione concordano sulla versione;
- il rollback è stato provato;
- gli originali e la ricevuta sono recuperabili.

---

## 16. Compatibilità e comportamento degradato

### 16.1 Nuova installazione da release

Il pacchetto verificato installa il core in `ASTRALIS_HOME`, crea una configurazione minima priva di dati dell'autore e non modifica la cartella estratta.

### 16.2 Clone ufficiale

Il clone è `DistributionSource`. Può installare, verificare o essere registrato come `DevelopmentSource`; non riceve dati operativi per default.

### 16.3 Fork

Il remote non canonico non viene trattato come errore. Il fork può essere sorgente di sviluppo dopo registrazione esplicita.

### 16.4 Progetto 3.0.x privo di manifest

Il resolver restituisce `LegacyProject`, costruisce una vista compatibile in memoria e propone la registrazione. Non crea file automaticamente.

### 16.5 Progetto 2.6.x–2.8.x

La migrazione usa una baseline nota quando disponibile. Senza baseline procede in modalità assistita e non classifica elementi come eliminabili.

### 16.6 Progetto senza Git

Il manifest e i marker possono identificare il progetto. Le funzioni Git vengono dichiarate indisponibili senza bloccare query non dipendenti da Git.

### 16.7 ASTRALIS_HOME assente o non raggiungibile

Le letture portabili del repository restano disponibili. Operazioni che richiedono core, overlay o stato locale falliscono con istruzioni di recupero e nessuna scrittura parziale.

### 16.8 Più clone dello stesso progetto

Condividono `project-id` ma possiedono `workspace-id`, percorso locale, lock e cache distinti. Nessun clone eredita implicitamente destinazioni mutanti da un altro.

---

## 17. Piano di verifica e Definition of Done

### 17.1 Test unitari

Devono coprire:

- merge e provenienza;
- espansione delle variabili;
- canonicalizzazione e confini;
- classificazione dei contesti;
- validazione degli schemi;
- versioni future e legacy;
- lock, scrittura atomica e ricevute;
- serializzazione deterministica.

### 17.2 Test di integrazione

Devono coprire:

- installazione pulita;
- reinstallazione idempotente;
- onboarding;
- registrazione di progetto;
- migrazione su fixture;
- aggiornamento affiancato;
- attivazione e rollback;
- esecuzione senza Git e senza rete.

### 17.3 Test di sicurezza e privacy

Devono coprire:

- traversal;
- junction, link simbolici e reparse point;
- destinazione coincidente con sorgente;
- file bloccati e permessi insufficienti;
- variabili mancanti o cicliche;
- dati personali nei file portabili;
- segreti simulati;
- piano alterato fra `plan` e `apply`.

### 17.4 Test di migrazione e recupero

Devono verificare:

- originali byte-identici quando dichiarati invariati;
- inventario completo delle differenze;
- interruzione in ogni fase critica;
- ripartenza idempotente;
- rollback senza rete;
- conservazione degli overlay;
- nessuna eliminazione automatica.

### 17.5 Test di accessibilità

Devono verificare:

- flusso completo da tastiera;
- ordine lineare delle informazioni;
- prompt non ambigui;
- codici di uscita coerenti;
- assenza di tabelle 2D indispensabili;
- prova manuale con NVDA prima del rilascio.

### 17.6 Prestazioni

Target iniziali da misurare su una macchina di riferimento dichiarata:

- query resolver a caldo: p95 non superiore a 150 ms;
- avvio CLI a freddo: p95 non superiore a 1.200 ms;
- memoria proporzionata ai manifest, senza caricamento massivo della knowledge;
- scansioni estese soltanto su richiesta esplicita e con avanzamento osservabile.

I target sono criteri di accettazione, non risultati già ottenuti.

### 17.7 Riduzione token

La riduzione viene misurata su un corpus versionato di almeno 10 richieste rappresentative, confrontando:

1. contesto necessario nella baseline 3.0.4;
2. output puntuale del resolver 3.1.0;
3. completezza delle risposte e anomalie introdotte.

Obiettivo minimo: riduzione mediana almeno del 70% senza perdita di informazioni necessarie. Obiettivo esteso: oltre il 90% nei casi ad alta ripetizione. Non sono ammessi valori stimati presentati come misure.

### 17.8 Definition of Done v3.1.0

La release è completabile soltanto se:

- tutti i contratti D0..D11 sono soddisfatti;
- D12 dispone almeno di contract test e interfaccia stabile;
- nessun test critico fallisce;
- il pilota su copie controllate di Master Hub e progetto maturo è superato;
- installazione, aggiornamento e rollback sono dimostrati;
- audit privacy e portabilità sono puliti;
- documentazione, manifest, tag e artefatti concordano;
- prova NVDA è completata;
- criteri token e prestazioni sono misurati;
- nessuna bonifica legacy è stata eseguita implicitamente.

---

## 18. Matrice di simulazione a 3 livelli

### Livello 1 — Happy Path

- **H1**: release verificata, installazione predefinita, nuovo progetto e query di configurazione.
- **H2**: progetto legacy 3.0.4 con baseline riconosciuta, proposta approvata e migrazione riuscita.
- **H3**: aggiornamento da 3.1.0 a versione successiva, test superati, attivazione e conservazione del core precedente.

### Livello 2 — Alternative e concorrenza

- **A1**: `ASTRALIS_HOME` personalizzato su altro volume.
- **A2**: due clone dello stesso progetto aperti contemporaneamente.
- **A3**: installazione senza rete e progetto senza Git.
- **A4**: due processi tentano di aggiornare o migrare la stessa destinazione.
- **A5**: fork registrato come sorgente di sviluppo e repository ufficiale usato soltanto per confronto.

### Livello 3 — Corner Cases e fault injection

- **C1**: manifest troncato o schema futuro.
- **C2**: variabile ambiente mancante, ricorsiva o malformata.
- **C3**: junction che porta fuori dalla radice autorizzata.
- **C4**: sorgente e destinazione risolvono allo stesso percorso fisico.
- **C5**: disco pieno o processo interrotto prima dell'attivazione.
- **C6**: file bloccato, permesso negato o antivirus concorrente.
- **C7**: baseline assente e tre fonti di versione discordanti.
- **C8**: configurazione modificata dopo la generazione del piano.
- **C9**: rollback durante una migrazione parzialmente applicata.
- **C10**: nome progetto duplicato, `project-id` uguale e workspace differenti.

---

## 19. Applicazione dei 6 Cancelli Inner Codex

1. **Rifiuto del patching euristico**: nessun fallback silenzioso o auto-riparazione distruttiva; gli errori di modello vengono resi espliciti.
2. **Hardware Grounding**: dati macchina e runtime sono rilevati o configurati localmente, mai incorporati nel core.
3. **Confini continui**: canonicalizzazione e verifica della destinazione avvengono prima della proposta e subito prima della scrittura.
4. **Named Contracts**: D0..D12 e S1..S13 rendono atomiche responsabilità e prove.
5. **Determinismo headless**: test senza `sleep`, senza rete obbligatoria e con fault injection controllata.
6. **Budget token e anti-bloat**: router entro 250 righe, query puntuali e dati strutturati senza duplicare le norme.

---

## 20. Validazione preventiva sui 7 Assi

1. **Validità**: il piano usa primitive disponibili su Windows, Git facoltativo e formati aperti; la scelta della libreria JSON Schema resta da certificare in D0.
2. **Efficacia**: separa sorgente, runtime, profilo, progetto e stato; affronta le cause strutturali osservate nei casi reali.
3. **Coerenza**: rispetta Regola 0, Isola Protetta, Context Fencing, Hub & Spoke, DRY e migrazione progressiva.
4. **Completezza**: copre installazione, onboarding, uso, migrazione, aggiornamento, rollback, autoapprendimento, audit e rilascio.
5. **Precisione**: definisce precedenze, confini, errori, identità, provenienza e criteri di chiusura senza presentare target come risultati.
6. **Prestazioni**: limita il percorso caldo a manifest e configurazioni piccole; rinvia scansioni e knowledge a comandi espliciti.
7. **Assenza di regressioni**: preserva originali, core precedente, modalità legacy e test dei progetti pilota.

---

## 21. Protocollo di validazione esteso del piano

Oltre ai 7 Assi e alla matrice a 3 livelli, la revisione deve includere:

1. **Tracciabilità**: ogni obiettivo strategico deve essere coperto da almeno un contratto e un criterio di accettazione.
2. **Non contraddizione**: termini, precedenze, ruoli e stati non devono divergere fra strategia e piano.
3. **Threat modeling locale**: traversal, reparse point, manomissione del piano, dati personali e sorgente protetta.
4. **Recuperabilità**: ogni mutazione deve avere staging, ricevuta, comportamento d'interruzione e rollback.
5. **Idempotenza e concorrenza**: riesecuzione e processi concorrenti non devono duplicare o corrompere stato.
6. **Osservabilità**: provenienza, warning, conflitti, codici di uscita e rapporti devono permettere diagnosi senza log massivi.
7. **Accessibilità NVDA**: struttura lineare, comandi da tastiera, prompt espliciti e nessuna dipendenza visiva.
8. **Portabilità**: clone, fork, ZIP, assenza di Git, assenza di rete e percorso personalizzato.
9. **Evolvibilità**: schemi futuri, chiavi sconosciute, versioni affiancate e adattatori specialistici.
10. **Economia token**: misure riproducibili e controllo della perdita informativa.
11. **Governance**: separazione fra analisi, piano, applicazione, validazione e bonifica.
12. **Integrità documentale**: link, codifica, terminazioni, marker temporanei, riferimenti e stato Git.

### 21.1 Tracciabilità degli obiettivi strategici

1. Protezione di clone e release: D1, D2, D6; test di confinamento e coincidenza fisica.
2. Installazione locale indipendente: D2, D7; S7; installazione pulita e idempotente.
3. Separazione core, privato, apprendimento e stato: D2, D3, D10; audit di classificazione.
4. Knowledge tecnica portabile nel repository: D11; test su clone privo di profilo locale.
5. Riduzione duplicazioni e token: D5, D12; misure definite nella sezione 17.7.
6. Migrazione senza perdita: D8; prove di originali, staging, interruzione e ricevuta.
7. Aggiornamento e rollback: D9; test della coppia compatibile core-overlay.
8. Provenienza di valori e deduzioni: D0, D5, D8; output `explain` e rapporti di conflitto.
9. Regola 0 e autorizzazione granulare: D6, D8, D10; separazione `scan`, `plan` e `apply`.
10. Release, clone, fork e ambienti senza Git: D1, D2, D11; casi di compatibilità della sezione 16.

---

## 22. Decisioni approvate nel Cancello D0

La fonte normativa completa è il [`Registro Decisionale D0`](DECISIONI_D0_ASTRALIS_V3_1_0.md). Le 14 direzioni architetturali sono approvate:

1. `D0.1`: manifest macchina-autorevole, tag Git concordante e rilascio bloccato in caso di conflitto.
2. `D0.2`: `.gitattributes` locale prevalente; default LF per documenti/configurazioni, CRLF per PowerShell, UTF-8 senza BOM.
3. `D0.3`: bootstrap compatibile con Windows PowerShell 5.1 e core di riferimento PowerShell 7.6 LTS.
4. `D0.4`: JSON Schema 2020-12 offline tramite adattatore primario `Test-Json`, con fallback separato.
5. `D0.5`: scritture negate attraverso reparse point salvo allowlist canonica esplicita.
6. `D0.6`: piano canonico con SHA-256 e hash delle precondizioni; firma digitale locale non obbligatoria.
7. `D0.7`: conservazione differenziata e nessuna cancellazione automatica nella v3.1.0.
8. `D0.8`: installazioni per utente, home isolati e `workspace-id` distinti.
9. `D0.9`: nessuna sincronizzazione automatica degli overlay nella v3.1.0.
10. `D0.10`: promozione della conoscenza mediante stati governati e autorizzazione esplicita.
11. `D0.11`: benchmark ripetibile con due profili macchina e soglie candidate misurate, non presunte.
12. `D0.12`: supporto legacy a livelli, iniziando dalla certificazione completa di v3.0.4.
13. `D0.13`: rilascio con provenienza, manifest, hash, SBOM e attestazione quando disponibile.
14. `D0.14`: lock granulari, nessuna rottura basata sul solo timeout e recupero tramite piano autorizzato.

### 22.1 Certificazioni ancora pendenti

Non restano quesiti architetturali aperti. Restano quattro dimostrazioni tecniche:

1. `D0.3`: matrice runtime sugli script reali.
2. `D0.4`: suite JSON Schema 2020-12 offline.
3. `D0.11`: benchmark baseline e profili macchina.
4. `D0.12`: catalogo, hash e fixture delle baseline legacy.

Queste certificazioni bloccano l'implementazione dipendente e richiedono autorizzazione separata perché potranno comportare fixture, prototipi o dipendenze.

---

## 23. Ordine di esecuzione proposto per la Sotto-Fase 1B

1. Eseguire e registrare le quattro certificazioni tecniche D0 ancora pendenti.
2. Implementare S1–S3: manifest, schemi e I/O sicuro.
3. Implementare S4–S6: Context Resolver, Config Resolver e CLI read-only.
4. Validare D1–D6 con fixture isolate.
5. Implementare installer e onboarding, S7 e S9.
6. Implementare migratore, S8, inizialmente soltanto `scan` e `plan`.
7. Implementare `apply`, ricevute e rollback dopo la convalida dei dry-run.
8. Implementare aggiornamento side-by-side, S10.
9. Integrare audit e suite headless, S11 e S13.
10. Eseguire pilota su copie controllate, mai sugli originali come primo tentativo.
11. Stabilizzare l'API per D12 e pianificare le milestone specialistiche.
12. Allineare documentazione e costruire la release candidata.

Ogni punto richiede evidenza di chiusura prima del successivo quando influenza sicurezza, compatibilità o recuperabilità.

---

## 24. Registro della validazione documentale del 2026-09-10

### 24.1 Controlli da registrare

- [x] coerenza fra strategia e piano;
- [x] copertura obiettivi, rischi, contratti e prove;
- [x] simulazione Happy Path, alternative e corner case;
- [x] controllo di privacy, percorsi e rollback;
- [x] controllo di accessibilità e linearità;
- [x] verifica dei link locali;
- [x] verifica UTF-8 senza BOM;
- [x] verifica terminazioni di riga rispetto alla policy del repository;
- [x] ricerca di marker temporanei o affermazioni non dimostrate;
- [x] verifica dello stato Git limitata ai documenti modificati.

### 24.2 Esito

Il protocollo è stato eseguito dopo la formalizzazione e ripetuto dopo le correzioni emerse al primo passaggio.

- **Esito meccanico precedente**: 28 controlli superati su 28 prima del consolidamento D0.
- **Esito di consolidamento D0**: 42 controlli superati su 42 dopo la creazione e il collegamento del registro decisionale.
- **Esito sui 7 Assi**: conforme; tutte le decisioni D0 sono approvate e le quattro certificazioni pendenti sono dichiarate senza simulare risultati.
- **Esito matrice a 3 livelli**: copertura completa di Happy Path, alternative/concorrenza e corner case/fault injection.
- **Esito protocollo esteso**: tracciabilità completa dei 10 obiettivi; copertura di privacy, autenticità, recuperabilità, idempotenza, accessibilità, portabilità ed economia token.
- **Anomalie corrette durante la validazione**: terminazioni miste nel piano; stato documentale della strategia; rollback della coppia core-overlay; autenticità del pacchetto; protezione dei backup; tracciabilità esplicita.
- **Anomalie residue del piano**: nessuna contraddizione interna nota.
- **Decisioni residue**: nessun quesito architetturale aperto; D0.3, D0.4, D0.11 e D0.12 richiedono certificazione tecnica prima dell'implementazione dipendente.
- **Stato Git osservato**: strategia, piano e registro D0 risultano nuovi e non ancora tracciati; nessun commit o pubblicazione è stato eseguito.
- **Limite della validazione**: la verifica riguarda strategia e piano. Test del codice, build, migrazioni reali e misure prestazionali/token restano intenzionalmente non eseguiti.

---

## 25. Stop obbligatorio prima della Sotto-Fase 1B

Questo documento autorizza esclusivamente la progettazione. Non sono autorizzati implementazione, creazione di manifest o configurazioni, migrazione di dati, modifica del Master Hub o dei progetti, build, test del codice, rilascio o bonifica.

L'avvio della Sotto-Fase 1B richiede un nuovo comando esplicito di Luca dopo la lettura e l'approvazione del presente piano e delle decisioni D0.
