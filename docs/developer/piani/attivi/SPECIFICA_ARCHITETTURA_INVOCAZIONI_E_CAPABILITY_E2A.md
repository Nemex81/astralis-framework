# Specifica E2A: Architettura delle Invocazioni e delle Capability

- **Identificativo**: `EXP-AST-NEXT-E2A-INVOCATION`
- **Tipologia**: Annesso normativo della proposta E2A
- **Autore e approvatore del programma**: Luca
- **Supporto alla formalizzazione**: GPT Codex / ChatGPT
- **Data**: 2026-09-10
- **Branch**: `experiment/astralis-next-clean-core`
- **Baseline**: `bba70144535ea51f0b06587751367b64a564bfc9`
- **Stato**: `[PROPOSTA FORMALIZZATA E VALIDATA — APPROVAZIONE DI LUCA PENDENTE]`
- **Specifica E2A primaria**: [`SPECIFICA_CONTRATTUALE_E2A_ASTRALIS_NEXT.md`](SPECIFICA_CONTRATTUALE_E2A_ASTRALIS_NEXT.md)
- **Piano padre**: [`PIANO_SPERIMENTALE_ASTRALIS_NEXT_CLEAN_CORE.md`](PIANO_SPERIMENTALE_ASTRALIS_NEXT_CLEAN_CORE.md)

---

## 1. Scopo

Questa specifica definisce una gerarchia stabile per trasformare un intento dell'utente in operazioni ASTRALIS controllate, modulari e verificabili.

Gli obiettivi sono:

1. separare dati, comportamento, orchestrazione e policy;
2. impedire chiamate dirette e non governate fra protocolli, script e file;
3. riutilizzare le stesse funzioni attraverso CLI, AI e automazioni;
4. rendere ogni effetto osservabile e autorizzabile;
5. supportare domini ed estensioni senza dipendenze circolari;
6. ridurre duplicazioni, caricamento documentale e consumo di token;
7. preservare Regola 0, privacy e accessibilità NVDA.

La specifica non autorizza la creazione di manifest, registri, moduli, script, eventi reali o implementazioni.

---

## 2. Decisione architetturale proposta

ASTRALIS Next adotta una catena di invocazione a livelli, con dipendenze rivolte soltanto verso il basso:

1. intento;
2. orchestratore;
3. modalità e policy;
4. protocollo;
5. capability;
6. servizio o routine;
7. adattatore;
8. dato strutturato o risorsa esterna.

Una skill AI è una facciata di ingresso parallela alla CLI: traduce un intento in una richiesta ASTRALIS, ma non contiene la logica della capability.

I livelli superiori dichiarano **che cosa** serve. I livelli inferiori determinano **come** realizzarlo nei limiti dell'Invocation Context ricevuto.

---

## 3. Vocabolario normativo

### 3.1 Intento

Richiesta normalizzata dell'utente, di una AI o di un'automazione autorizzata. Non è ancora un permesso operativo.

### 3.2 Orchestratore

Componente che risolve contesto, modalità e protocollo. Non implementa logica di dominio e non accede direttamente al filesystem.

### 3.3 Modalità

Policy trasversale che definisce effetti, autonomia, privacy, output e cancelli ammessi. Non esegue direttamente capability o script.

### 3.4 Protocollo

Macchina a stati che coordina capability, precondizioni, approvazioni, validazioni e recupero.

### 3.5 Capability

Operazione di dominio riutilizzabile, versionata e indipendente dal canale chiamante.

### 3.6 Servizio

Componente condiviso che applica una regola coerente, per esempio risoluzione configurazione, autorizzazione o redazione.

### 3.7 Routine

Funzione interna, piccola e deterministica. Non conosce modalità, protocollo o AI chiamante.

### 3.8 Adattatore

Confine con filesystem, sistema operativo, Git, hardware, rete, processi o altri strumenti esterni.

### 3.9 Skill AI

Descrittore sottile che rende disponibili capability ASTRALIS a una specifica piattaforma AI senza duplicarne l'implementazione.

### 3.10 Registro

Catalogo validato delle capability e delle relative implementazioni disponibili. Non effettua download o esecuzione implicita.

---

## 4. Legge delle dipendenze

Sono vincolanti le seguenti regole:

1. l'orchestratore non accede direttamente a file o hardware;
2. una modalità non richiama script;
3. un protocollo richiama capability per identificativo e versione, non file interni;
4. una capability non può aumentare autorizzazioni o sensibilità consentite;
5. una routine non dipende da protocolli, modalità o provider AI;
6. un adattatore esegue un'operazione tecnica ma non decide la policy;
7. un documento JSON contiene dati e riferimenti, non codice arbitrario;
8. una skill AI non replica logica di dominio;
9. un dominio usa i contratti pubblici di un altro dominio, non i suoi file interni;
10. una dipendenza circolare blocca registrazione e avvio;
11. ogni effetto attraversa un controllo di policy immediatamente prima dell'esecuzione;
12. ogni risultato torna attraverso un envelope strutturato e redatto.

Un livello può saltare un livello inferiore soltanto attraverso un contratto pubblico esplicitamente dichiarato. Non sono ammesse scorciatoie verso risorse esterne.

---

## 5. Contratti nominati

### I1 — Intent Envelope

Ogni ingresso viene normalizzato con:

- `requestId`;
- origine della richiesta;
- intento richiesto;
- argomenti dichiarati;
- home, progetto o workspace indicati;
- modalità richiesta o implicita;
- vincoli di privacy;
- lingua e requisiti di accessibilità;
- istante e scadenza;
- autorizzazioni esplicitamente fornite.

Campi mancanti restano `unknown`. L'envelope non converte una richiesta in autorizzazione di scrittura.

### I2 — Invocation Context

L'orchestratore costruisce un contesto immutabile per la singola invocazione. Contiene:

- `operationId` e `correlationId`;
- identità risolte di installazione, macchina, progetto e workspace;
- modalità effettiva;
- policy applicabili;
- effetti concessi;
- classificazioni dei dati accessibili;
- `dryRun`;
- timeout e cancellazione;
- budget di contesto AI;
- profilo di output accessibile;
- provenienza delle decisioni di risoluzione.

Un componente figlio può restringere il contesto, mai ampliarlo.

### I3 — Mode Policy

Le modalità iniziali proposte sono:

- `consultative`: analisi e letture, nessuna mutazione;
- `planning`: inventario e piano, senza applicazione;
- `audit`: raccolta di evidenze senza modifica del bersaglio;
- `execution`: applicazione di un piano autorizzato e non scaduto;
- `recovery`: ripristino delimitato da una ricevuta o da un piano approvato;
- `development`: modifica esplicita della sorgente ASTRALIS.

La rete, l'avvio di processi e la persistenza di un piano sono effetti separati, non conseguenze implicite della modalità.

### I4 — Protocol State Machine

Un protocollo dichiara:

- identificativo e versione;
- stati ammessi;
- transizioni;
- capability richieste;
- precondizioni e postcondizioni;
- cancelli di autorizzazione;
- condizioni di arresto;
- percorso di validazione;
- strategia di recupero;
- ricevuta finale.

Stati minimi proposti:

1. `requested`;
2. `classified`;
3. `planned`;
4. `approval-required`;
5. `approved`;
6. `executing`;
7. `validating`;
8. `completed` oppure `failed`;
9. `rollback-required`, `rolling-back` e `rolled-back` quando applicabili.

Una transizione non prevista è rifiutata. Il protocollo non contiene comandi shell arbitrari.

### I5 — Capability Contract

Ogni capability dichiara:

- identificativo stabile, per esempio `astralis.context.detect`;
- versione SemVer del contratto;
- dominio proprietario;
- descrizione sintetica;
- schema di input e output;
- effetti possibili;
- modalità compatibili;
- precondizioni;
- requisiti di runtime e macchina;
- classi di dati lette e prodotte;
- errori documentati;
- idempotenza e retry;
- supporto a `dry-run`;
- compensazione o rollback;
- test contrattuali richiesti;
- implementazioni disponibili.

Il contratto descrive capacità e limiti, non incorpora l'implementazione.

### I6 — Routine and Service Contract

Una routine:

- riceve input espliciti;
- restituisce output deterministico o errore nominato;
- non legge stato globale nascosto;
- non compie rete o scritture non dichiarate;
- è verificabile headless e a zero millisecondi quando pura.

Un servizio può coordinare routine, ma conserva un solo ambito di responsabilità e pubblica un'interfaccia indipendente dall'adattatore.

### I7 — Adapter Contract

Ogni adattatore dichiara:

- piattaforma e versione supportate;
- effetti tecnici;
- risorse raggiunte;
- canonicalizzazione richiesta;
- codici d'errore normalizzati;
- comportamento offline;
- timeout e cancellazione;
- capacità di simulazione;
- redazione di output e diagnostica.

L'adattatore non interpreta consenso, modalità o priorità di configurazione.

### I8 — Effect Model

Gli effetti iniziali sono:

- `none`;
- `read-local`;
- `read-derived`;
- `write-home`;
- `write-project`;
- `delete`;
- `network-read`;
- `network-write`;
- `process-readonly`;
- `process-mutating`.

Ogni capability dichiara l'insieme massimo. L'Invocation Context concede un sottoinsieme. L'effetto effettivo deve appartenere a entrambi.

`delete`, `network-write`, `process-mutating` e ogni scrittura richiedono autorizzazioni distinte quando coinvolgono bersagli o sistemi differenti.

### I9 — Capability Registry

Il registro risolve una capability soltanto se:

1. identificativo e versione sono compatibili;
2. il manifest supera la validazione offline;
3. l'implementazione è disponibile localmente;
4. piattaforma e runtime sono compatibili;
5. le dipendenze sono acicliche;
6. gli effetti sono compatibili con la modalità;
7. la provenienza soddisfa la policy;
8. non esistono provider ambigui con la stessa priorità.

Il registro non scarica, aggiorna o abilita automaticamente implementazioni. Un provider non disponibile produce `CAPABILITY_UNAVAILABLE`.

### I10 — Result Envelope

Ogni invocazione restituisce:

- stato finale;
- codice stabile;
- risultato o riferimento al risultato;
- evidenze essenziali;
- provenienza;
- avvisi;
- dati mancanti o scaduti;
- effetti realmente eseguiti;
- eventi significativi;
- riferimento a piano, ricevuta o rollback;
- prossima azione consentita.

L'envelope non include segreti e applica la redazione prima di log, AI o output utente.

Codici minimi specifici della catena, complementari a quelli della specifica E2A primaria:

- `INTENT_INVALID`;
- `MODE_DENIED`;
- `PROTOCOL_UNAVAILABLE`;
- `TRANSITION_DENIED`;
- `CAPABILITY_UNKNOWN`;
- `CAPABILITY_UNAVAILABLE`;
- `CAPABILITY_VERSION_MISMATCH`;
- `DEPENDENCY_CYCLE`;
- `EFFECT_DENIED`;
- `AUTHORIZATION_EXPIRED`;
- `ADAPTER_FAILURE`;
- `RESULT_BUDGET_EXCEEDED`.

### I11 — Event and Receipt Contract

Gli eventi persistenti sono limitati ai confini significativi:

- `requested`;
- `classified`;
- `planned`;
- `approval-required`;
- `approved`;
- `started`;
- `step-completed`;
- `validation-failed`;
- `failed`;
- `rollback-started`;
- `rolled-back`;
- `completed`.

Ogni evento contiene identificativi di correlazione, fase, capability, risultato, data, classificazione e riferimento alle evidenze. Le singole letture tecniche rimangono diagnostica locale opzionale.

Una ricevuta registra piano applicato, precondizioni, effetti, hash, esito, elementi di recupero e accettazione. Non duplica payload sensibili.

### I12 — AI Skill Facade

Una skill AI dichiara:

- provider o formato supportato;
- intenti riconosciuti;
- capability o protocolli esposti;
- modalità predefinita;
- dati contestuali richiesti;
- limiti di autonomia;
- forma dell'output;
- fallback quando ASTRALIS non è disponibile.

La skill genera un Intent Envelope e usa i contratti pubblici. Non chiama direttamente script, adattatori o file privati.

### I13 — Domain Boundary

I domini iniziali candidati sono:

- `context`;
- `home`;
- `profiles`;
- `machine`;
- `configuration`;
- `projects`;
- `filesystem`;
- `knowledge`;
- `migration`;
- `installation`;
- `update`;
- `validation`;
- `recovery`;
- `accessibility`;
- `ai-context`;
- `diagnostics`.

Ogni dominio possiede capability, contratti e test. Le utilità condivise devono restare piccole e non diventare un dominio universale privo di responsabilità.

### I14 — Version and Compatibility

- Le capability usano SemVer.
- Un protocollo dichiara intervalli compatibili, non implementazioni concrete.
- Una major incompatibile blocca la risoluzione.
- Una minor aggiunge comportamento compatibile senza cambiare semantica esistente.
- Una patch non modifica input, output o effetti dichiarati.
- Modalità, protocolli e skill dichiarano le versioni contrattuali richieste.
- Una sostituzione mantiene alias deprecati soltanto per una finestra documentata.
- Nessun fallback sceglie silenziosamente una capability semanticamente differente.

### I15 — Authorization Monotonicity

L'autorizzazione può soltanto restringersi scendendo nella catena.

- L'intento non costituisce consenso implicito per effetti aggiuntivi.
- Il protocollo non può concedere ciò che la modalità vieta.
- La capability non può concedere ciò che il protocollo non richiede.
- L'adattatore riceve un mandato delimitato a effetto, risorsa e scadenza.
- Un retry non rinnova automaticamente un'autorizzazione scaduta.
- Un nuovo bersaglio richiede una nuova decisione.

### I16 — Extension and Provider Isolation

Un'estensione futura deve:

- avere namespace e versione propri;
- dichiarare dipendenze ed effetti;
- superare gli stessi controlli del core;
- non sostituire implicitamente una capability ufficiale;
- poter essere disabilitata senza corrompere configurazioni;
- conservare i dati nel proprio ambito;
- non modificare il registro durante una risoluzione;
- degradare in modo controllato quando assente.

E2A non approva ancora un sistema di plugin o download dinamico. Definisce soltanto il confine necessario a non impedirlo in futuro.

---

## 6. Separazione fra formati e responsabilità

### 6.1 Markdown

Contiene principi, motivazioni, onboarding e documentazione leggibile. Non è interrogato come configurazione macchina-autorevole.

### 6.2 JSON

Contiene manifest, configurazioni, piani, eventi e ricevute. Non contiene script o espressioni arbitrarie.

### 6.3 JSON Schema

Definisce struttura e vincoli dei documenti macchina. È validato offline attraverso l'adattatore stabilito da D0.4.

### 6.4 Moduli e librerie

Contengono servizi, capability e routine riutilizzabili. La logica non viene duplicata nelle interfacce AI.

### 6.5 Script

Gli script `.ps1` sono punti di ingresso sottili, bootstrap o adattatori. Non diventano contenitori universali di workflow e regole.

### 6.6 Skill AI

Contengono istruzioni minime per riconoscere intenti e richiamare contratti ASTRALIS. Le differenze fra provider restano nella facciata.

---

## 7. Risoluzione di una invocazione

L'orchestratore segue questa sequenza:

1. normalizza la richiesta in un Intent Envelope;
2. risolve home, progetto, workspace e contesto;
3. determina la modalità effettiva;
4. costruisce l'Invocation Context;
5. seleziona il protocollo;
6. verifica capability e versioni richieste;
7. applica policy, privacy e budget;
8. esegue soltanto la transizione ammessa;
9. raccoglie risultati ed eventi significativi;
10. applica redazione;
11. produce Result Envelope e ricevuta quando prevista;
12. si arresta al primo cancello non soddisfatto.

La risoluzione deve essere deterministica a parità di input, registro e profili.

---

## 8. Esempio: protocollo di aggiornamento

Un futuro protocollo `ProjectUpdate` potrebbe coordinare:

1. `astralis.context.detect`;
2. `astralis.home.resolve`;
3. `astralis.project.identify`;
4. `astralis.profile.project-for-task`;
5. `astralis.compatibility.inspect`;
6. `astralis.update.plan`;
7. cancello di approvazione;
8. `astralis.backup.create`;
9. `astralis.update.apply`;
10. `astralis.validation.run`;
11. `astralis.receipt.create`;
12. eventuale `astralis.recovery.rollback`.

In modalità `consultative` la sequenza termina prima di ogni capability con effetti di scrittura. In modalità `execution` le scritture restano vincolate al piano approvato.

---

## 9. Esempio: uso selettivo del profilo macchina

Per preparare istruzioni di build, un protocollo richiede soltanto capability pertinenti:

- sistema operativo e architettura;
- runtime richiesto;
- memoria sufficiente;
- spazio libero;
- eventuale supporto GPU;
- requisiti di accessibilità dell'output.

Il Context Compiler riceve i risultati redatti e non il profilo macchina completo. Se l'audio non è coinvolto, il provider audio non viene caricato. Se la GPU non è richiesta, i relativi dati non entrano nel contesto AI.

---

## 10. Strategia di eventi e diagnostica

Sono separati tre livelli:

1. **Esito utente**: messaggio breve, accessibile e privo di rumore.
2. **Evento operativo**: transizione significativa correlabile e redatta.
3. **Diagnostica tecnica**: dettaglio locale attivabile, con retention limitata.

Non viene introdotto nella prima milestone un event bus distribuito. Un registro append-only locale e delimitato è sufficiente per provare i contratti.

Eventi e diagnostica non diventano una fonte alternativa di configurazione.

---

## 11. MVP della catena di invocazione

La prima fetta E3 dovrà usare soltanto:

- modalità `consultative`;
- protocollo `InspectContext`;
- capability `astralis.context.detect`;
- capability `astralis.home.resolve`;
- capability `astralis.profile.project-for-task`;
- capability `astralis.config.resolve`;
- capability `astralis.ai-context.compile`;
- routine pure per JSON, percorsi, precedenza, provenienza e redazione;
- adattatori read-only per filesystem e ambiente;
- Result Envelope accessibile.

Sono esclusi dall'MVP:

- plugin dinamici;
- download di provider;
- event bus distribuito;
- esecuzione remota;
- capability di scrittura;
- migrazione e aggiornamento;
- autoapprendimento;
- discovery indiscriminata di hardware o software.

---

## 12. Anti-pattern vietati

1. Protocollo che apre direttamente un file.
2. Modalità che contiene comandi tecnici.
3. Script monolitico che implementa più protocolli.
4. JSON contenente codice o condizioni arbitrarie.
5. Skill AI che replica logica del core.
6. Capability che nasconde rete, scrittura o avvio di processi.
7. Utility globale usata come contenitore senza dominio.
8. Registro che scarica automaticamente implementazioni.
9. Fallback silenzioso verso una capability incompatibile.
10. Evento contenente profili o payload privati completi.
11. Retry di operazioni non idempotenti senza nuova verifica.
12. Protocollo che interpreta l'assenza di dati come consenso.

---

## 13. Criteri di accettazione

La proposta è approvabile se:

1. ogni livello possiede una responsabilità non sovrapposta;
2. le dipendenze sono unidirezionali e acicliche;
3. protocolli e skill non accedono direttamente alle risorse;
4. capability e adattatori dichiarano tutti gli effetti;
5. l'autorizzazione non può ampliarsi lungo la catena;
6. input, output ed errori sono versionati e validabili;
7. una capability può essere sostituita senza riscrivere il protocollo;
8. le interfacce AI riusano la stessa logica di CLI e automazioni;
9. eventi e ricevute conservano provenienza senza esporre dati privati;
10. il sistema degrada in modo esplicito quando una capability manca;
11. il percorso consultivo non può raggiungere una scrittura;
12. l'MVP prova l'architettura senza costruire anticipatamente plugin o workflow complessi.

---

## 14. Matrice di simulazione a 3 livelli

### Livello 1 — Happy Path

Una richiesta consultiva viene normalizzata, il protocollo `InspectContext` risolve capability compatibili e restituisce un contesto redatto senza scritture.

### Livello 2 — Alternative e concorrenza

- CLI e skill AI invocano la stessa capability;
- due protocolli leggono in parallelo profili immutabili;
- un provider opzionale non è disponibile;
- una capability possiede due implementazioni con priorità esplicita;
- una modalità più restrittiva riduce gli effetti concessi;
- una cancellazione interrompe una discovery senza lasciare stato parziale.

### Livello 3 — Corner Cases

- dipendenza circolare nel registro;
- capability con versione incompatibile;
- manifest valido ma implementazione assente;
- adattatore dichiara meno effetti di quelli realmente tentati;
- protocollo tenta una transizione non prevista;
- autorizzazione scade fra piano ed esecuzione;
- retry dopo effetto parzialmente completato;
- skill AI richiede direttamente un file privato;
- evento contiene un percorso non redatto;
- registro cambia durante la risoluzione;
- provider differenti hanno la stessa priorità;
- risultato supera il budget AI senza criterio di selezione.

L'esito richiesto è arresto protetto, degradazione esplicita o richiesta mirata. Non sono ammessi fallback ambigui o aumento dei permessi.

---

## 15. Validazione sui 7 Assi di Qualità

1. **Validità**: la gerarchia traduce Regola 0 e i contratti E2A in confini eseguibili futuri.
2. **Efficacia**: capability riutilizzabili eliminano chiamate dirette e duplicazioni fra protocolli.
3. **Coerenza**: modalità governa policy, protocollo governa flusso e capability governa dominio.
4. **Completezza**: sono coperti ingresso, autorizzazione, esecuzione, risultato, eventi, compatibilità ed estensione.
5. **Precisione**: responsabilità, effetti, identità e versioni hanno semantiche nominate.
6. **Prestazioni**: risoluzione selettiva e caricamento on-demand evitano registri e prompt massivi.
7. **Assenza di regressioni**: CLI, AI e automazioni possono convivere senza cambiare i contratti di dominio.

### 15.1 Esito della validazione documentale

- **Protocollo**: 62 controlli su struttura, dipendenze, policy, effetti, autorizzazioni, versioni, domini, eventi, accessibilità, collegamenti e confini Git.
- **Esito**: 62 controlli superati su 62; nessun difetto documentale bloccante.
- **Matrice**: Happy Path, alternative, concorrenza e Corner Cases coperti.
- **Confine dell'evidenza**: l'esito valida la proposta, non certifica implementazioni, prestazioni o comportamento runtime.
- **Stato operativo**: nessun manifest, registro, modulo, script, profilo o artefatto eseguibile creato.

---

## 16. Decisioni proposte a Luca

Si propone di approvare:

1. la gerarchia a otto livelli;
2. modalità come policy e non come esecutore;
3. protocolli come macchine a stati;
4. capability come confine funzionale pubblico;
5. routine pure, servizi coesi e adattatori tecnici;
6. skill AI come facciate senza logica duplicata;
7. Invocation Context immutabile e autorizzazione monotona;
8. modello esplicito degli effetti;
9. registro locale validato e privo di download impliciti;
10. eventi soltanto ai confini significativi;
11. versionamento SemVer dei contratti;
12. domini aciclici e provider isolati;
13. MVP read-only limitato a `InspectContext`;
14. esclusione iniziale di plugin, event bus e capability di scrittura.

---

## 17. Gating e stop obbligatorio

Questa specifica è esclusivamente documentale. Non sono autorizzati:

- creazione del registro delle capability;
- creazione di manifest o JSON Schema;
- creazione di moduli, routine, adattatori o skill;
- modifica degli script esistenti;
- raccolta o proiezione reale di profili;
- esecuzione di capability;
- implementazione di protocolli o modalità;
- avvio di E2B, E2C o E3;
- modifica di `main`, Master Hub o repository di progetto.

L'approvazione della specifica stabilirà i contratti, ma non autorizzerà la loro implementazione. Ogni fase successiva richiederà un nuovo consenso esplicito.
