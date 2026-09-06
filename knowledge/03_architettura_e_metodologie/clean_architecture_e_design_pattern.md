# Clean Architecture, Design Pattern & Disciplina di Versionamento AVF (v2.7.0)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: Antigravity (Senior AI Pair Programmer & Software Engineer)
# Ambito: Globale / Universale

Questo documento definisce i principi di Clean Architecture, disaccoppiamento e la disciplina di versionamento semantico applicabili allo sviluppo software e alla documentazione in qualsiasi linguaggio o dominio.

---

## 🏛️ 1. ARCHITETTURA A 4 LAYER

1. **Layer 1: Presentation (UI / Controller / CLI)**:
   - Gestisce l'interazione con l'utente (GUI wxPython, comandi da terminale, finestre, dialoghi).
   - Conosce solo l'Application Layer; non deve mai contenere logica di business pura o query dirette al database.

2. **Layer 2: Application (Use Cases / Servizi)**:
   - Orchestra il flusso delle operazioni, coordina le entità di dominio e implementa i casi d'uso dell'applicazione.
   - Non dipende da framework di terze parti o dettagli di basso livello.

3. **Layer 3: Domain (Entità / Valori / Regole di Business)**:
   - Il cuore logico del programma: definisce i modelli di dati puri, le regole di convalida e la logica aziendale invariante.
   - Zero dipendenze esterne (indipendente da UI, database, file system).

4. **Layer 4: Infrastructure (Accesso Dati / Rete / File System / Audio)**:
   - Implementa i dettagli tecnici: lettura/scrittura file, chiamate API, driver audio, controller hardware.
   - Si interfaccia con gli altri layer tramite interfacce (Protocol / Abstract Base Classes), implementando il principio di inversione delle dipendenze (DIP).

---

## 📐 2. PATTERN DI CODIFICA FONDAMENTALI

- **Single Responsibility Principle (SRP)**: Ogni classe, modulo o funzione deve avere una sola ragione per cambiare.
- **Dependency Injection (DI)**: I moduli ricevono le loro dipendenze dall'esterno, facilitando test unitari con mock.
- **Fail Fast & Explicit Errors**: Intercettare errori e stati non validi immediatamente alla frontiera, sollevando eccezioni tipizzate chiare.

---

## 📜 3. STANDARD DI TRACCIABILITÀ DEL CHANGELOG & RICOSTRUZIONE RETROATTIVA

1. **Distinzione Architetturale tra Progetti Proprietari e Fork**:
   - **Progetto Personale / Proprietario**:
     * File: `CHANGELOG.md` posizionato direttamente alla radice del repository.
     * Lingua & Accessibilità: **100% in Italiano**, conforme ad AVF (SemVer 3+1) e strutturato a categorie lineari per screen reader NVDA (`🌟 Nuove Funzionalità`, `🐛 Correzioni & Bugfix`, `⚙️ Modifiche & Refactoring`, `📚 Documentazione & Note`).
     * Aggiornato sistematicamente in Fase 3 della Pipeline prima del commit.
   - **Fork / Contributo Upstream a Repository di Terzi**:
     * File Ufficiale Upstream: Il `CHANGELOG.md` originale dell'autore rimane intatto e redatto nella lingua ufficiale del repository (Inglese) per non inquinare le Pull Request internazionali.
     * Diario Locale Accessibile: I contributi e le modifiche personali vengono tracciati in italiano lineare all'interno della scheda `knowledge/01_diario_modifiche_e_contributi_fork.md` locale.

2. **Principio di Ricostruzione Storica Retroattiva (Zero Changelog Vuoti)**:
   - Se durante un audit, un bootstrap o un aggiornamento si rileva un progetto privo di changelog o diario, l'assistente **non deve mai limitarsi a creare un template vuoto**.
   - **Estrazione da Git & Docs**: Antigravity ispeziona la cronologia dei commit (`git log --oneline`) e i piani completati in `docs/piani/completati/` (o file di walkthrough), catalogando retroattivamente le modifiche storiche reali all'interno del nuovo changelog/diario generato.

---

## 🛡️ 4. PATTERN COORDINATOR PER FLUSSI VOCALI E AUDIO CONCORRENTI (SCREEN READER RACE CONDITION SHIELD)

1. **Contesto & Problema**:
   - Nelle applicazioni, giochi o interfacce accessibili in cui molteplici sorgenti asincrone (sensori, tick loop continui, input utente, rotazioni della visuale, notifiche di sistema) devono comunicare simultaneamente tramite un canale vocale condiviso non concorrente (lo screen reader con `interrupt: true`).
   - L'invocazione disgiunta di chiamate interruttive tronca i messaggi a metà, distruggendo la comprensibilità e aumentando il carico cognitivo dell'utente non vedente.

2. **La Soluzione Architetturale**:
   - Introdurre un modulo **Coordinator / Single Source of Truth** che:
     1. Riceve gli eventi da tutte le sorgenti informative.
     2. Applica un debouncing atomico (finestra temporale di 80-100ms) per aggregare gli eventi dello stesso frame/tick.
     3. Assembla un'unica frase densa e strutturata secondo le preferenze dell'utente (Pattern Token Composition & Ordering Enum).
     4. Sincronizza lo stato dei listener concorrenti (es. aggiornamento target pregresso) per evitare riesecuzioni o doppie emissioni ridondanti.

3. **Pattern Direct Dispatching vs Stranded Pending Warnings (Divieto di Strutture Pending Asincrone)**:
   - *Antipattern*: Depositare eventi o avvisi in variabili statiche/registri "in sospeso" (`pendingWarning`) confidando che un loop asincrono o un modulo secondario (es. mirino o renderer) li intercetti e li vocalizzi. Se il modulo secondario restituisce un early return (es. mirino nel vuoto o target invariato), il messaggio rimane orfano e la voce ammutolisce.
   - *Soluzione*: I sensori devono **invocare direttamente il metodo del Coordinator** (`coordinator.onEvent(...)`), che valuta istantaneamente il contesto, fonde eventuali dati correnti ed emette all'istante l'output per lo screen reader.

4. **Pattern DirectInteractionShield (Disaccoppiamento Flussi Passivi vs Azioni Motorie Esplicite)**:
   - *Problema*: Nei sistemi con monitoraggio o feed percettivo continuo di fondo (es. scansione automatica, telemetria in tempo reale), un'interazione esplicita richiesta dall'utente (pressione di tasto rapido, comando di query, orientamento manuale) rischia di finire accodata, ritardata o mascherata dal flusso passivo concorrente.
   - *Soluzione*: L'invocazione di qualsiasi comando esplicito da tastiera attiva un token temporale vincolante (`DirectInteractionShield`). L'output del comando manuale viene emesso immediatamente a latenza zero (`interrupt: true`), mentre il Coordinator assorbe o silenzia per l'intera durata della finestra dello scudo qualsiasi evento di background passivo o contestuale.
   - *Gerarchia Inviolabile*: Lo scudo silenzia unicamente il chiacchiericcio passivo; gli allarmi critici di sicurezza mantengono incondizionatamente il diritto di interrompere qualsiasi flusso in qualsiasi millisecondo.

---

## 🧬 5. POLIMORFISMO DI GOVERNANCE: FRAMEWORK ASTRATTO VS SPECIALIZZAZIONI CONCRETE

1. **Applicazione dei Principi OOP alla Governance AI**:
   - **Livello Astratto (Master Hub & Genoma Livello 0)**:
     * Agisce come un'*Interfaccia Astratta*: stabilisce i contratti metodologici (10 Protocolli, standard 7 Assi, simulazioni a 3 livelli, pipeline 4 fasi, principio di simmetria).
     * Non contiene dettagli implementativi legati a singoli motori o framework per non appesantire la memoria.
   - **Livello Concreto (Progetti Locali & Livello 2)**:
     * Agisce come un'*Implementazione Concreta*: eredita i protocolli e li specializza con le classi, le librerie, i comandi di build e le regole geometriche/logiche del proprio dominio.

2. **Vantaggi Architetturali**:
   - *Zero Spreco di Token*: All'avvio in un repository child, l'IA carica solo la specializzazione locale e il router globale (~2.450 token totali).
   - *Flessibilità & Disaccoppiamento*: Permette di evolvere progetti in Java, Python, PowerShell o narrativa senza che le regole di un dominio interferiscano con gli altri.

---

## 🔢 6. DISCIPLINA DI VERSIONAMENTO SEMANTICO ESTESO A 3+1 LIVELLI (AVF — ASTRALIS VERSIONING FRAMEWORK)

Lo standard **AVF** regola in modo matematico e oggettivo l'assegnazione dei numeri di versione (`V.A.R[.M]`) al termine dei collaudi e dei cicli implementativi:

### 1. Le 4 Cifre e i Criteri di Scatto
- **1ª Cifra — `V` (VERSIONE / MAJOR — `X.0.0[.0]`)**:
  - *Criterio*: Grandi salti generazionali, breaking changes architetturali, cambi di motore/runtime, rifacimento di modelli dati o nuovi Volumi/Ere narrative.
  - *Regola di Reset*: Le cifre successive si azzerano (`v2.0.0.0`).
- **2ª Cifra — `A` (AGGIORNAMENTO / MINOR / FEATURE — `X.Y.0[.0]`)**:
  - *Criterio*: Nuove funzionalità complete, nuovi moduli, nuove interfacce grafiche o capitoli narrativi senza rottura di compatibilità retroattiva.
  - *Regola di Reset*: Le cifre subordinate si azzerano (`v2.5.0.0`).
- **3ª Cifra — `R` (REVISIONE / PATCH / PRAPI — `X.Y.Z[.0]`)**:
  - *Criterio*: Bugfix, risoluzione voci del Registro Revisioni (`Rev X.Y`), calibrazioni metriche/acustiche post-collaudo, rifiniture e consolidamento lezioni in Fase 4.
  - *Regola di Reset*: La quarta cifra si azzera (`v2.5.1.0`).
- **4ª Cifra — `M` (MICRO-FIX / HOTFIX / DOC — FACOLTATIVA — `X.Y.Z.W`)**:
  - *Criterio*: Micro-ritocchi interni alla revisione attiva che non alterano la logica funzionale (es. correzione typo, fix commenti/docstring, ritocchi di documentazione o hotfix locali).

### 2. Albero Decisionale per la Proposta in Fase 3
Durante la Chiusura Tecnica (Protocollo 6), Antigravity valuta le modifiche collaudate e propone formalmente il numero di versione applicando la seguente logica:
- *Se* sono presenti breaking changes o cambi generazionali -> *Allora* incrementa la 1ª cifra (`Versione`).
- *Altrimenti se* sono state aggiunte nuove funzionalità/moduli -> *Allora* incrementa la 2ª cifra (`Aggiornamento`).
- *Altrimenti se* sono stati risolti bug, rifiniture PRAPI o voci di registro -> *Allora* incrementa la 3ª cifra (`Revisione`).
- *Altrimenti se* sono stati corretti solo refusi/documentazione -> *Allora* incrementa la 4ª cifra (`Micro-Fix`).

### 3. Applicazione della Disciplina AVF nei Progetti Fork (Baseline & Progressione Sovrana)

Quando si lavora all'interno di un repository derivato da un progetto open-source di terzi (fork), la numerazione delle versioni personali segue una regola deterministica precisa:

1. **La Baseline di Inception (Punto Zero del Fork)**:
   - Il versionamento personale non parte mai da zero né da numeri inferiori storici dell'upstream, ma **si aggancia esattamente al numero di versione ufficiale presente nel momento in cui è stato creato il fork** (es. `v26.2-1.12.0` o `v1.12.0`).
2. **Progressione Sovrana in Avanti**:
   - Tutte le milestone, piani tecnici e feature sviluppate sul fork fanno avanzare progressivamente la numerazione AVF locale in avanti a partire dalla baseline:
     * *Nuove Macro-Feature / Milestone*: Incremento della 2ª cifra (Aggiornamento / Minor: `v1.12.0` $\rightarrow$ `v1.13.0` $\rightarrow$ `v1.14.0` $\rightarrow$ `v1.15.0` $\rightarrow$ `v1.16.0`);
     * *Bugfix & PRAPI*: Incremento della 3ª cifra (Revisione / Patch: `v1.16.1`);
     * *Micro-Fix & Refusi*: Incremento della 4ª cifra facoltativa (`v1.16.1.1`).
3. **Disaccoppiamento con il Binario Upstream**:
   - Nel file pubblico `CHANGELOG.md` di radice, tutte le modifiche restano raccolte sotto `## [Unreleased]`, preservando i tag e le release dei maintainers upstream e azzerando i conflitti di merge nelle PR.

---

## 🛡️ 7. PATTERN DI BONIFICA PROTETTA & QUARANTENA REVERSIBILE (DEAD CODE & ASSET PURGE)

1. **Il Principio di Non-Distruttività**:
   - Qualsiasi operazione di pulizia o refactoring del debito tecnico deve operare attraverso un flusso reversibile a 5 passi:
     1. *Scansione a Doppia Chiave*: AST/chiamate dirette + ricerca dinamica di stringhe in manifest, configurazioni JSON e file lingua I18N.
     2. *Prospetto ad Alto Segnale*: Classificazione del rischio per ciascun elemento (`BASSO`, `MEDIO`, `ALTO`).
     3. *Gating dell'Utente (Regola 0)*: Zero modifiche autonome senza convalida esplicita.
     4. *Quarantena Reversibile*: Spostamento in area di staging sicura (`docs/quarantena_[timestamp]/` o `archivio_bozze/`) prima della cancellazione fisica.
     5. *Test & Rollback Istantaneo*: Compilazione e suite di test automatici immediati; se si verifica una regressione, scatta il ripristino automatico a 1-click.

---

## 🔌 8. INTEGRITÀ DEGLI ADAPTER & FACADE: SEAM DI TEST VS DIVIETO DI CATCH-ALL SILENZIOSO

1. **Il Principio di Trasparenza degli Errori negli Adapter**:
   - Quando si progetta una facciata o un adapter di retrocompatibilità verso componenti legacy, la classe deve preservare l'esatta semantica storica: se un modulo a valle fallisce o solleva un'eccezione, l'errore deve emergere chiaramente per consentire diagnosi forensi immediate.
2. **L'Anti-Pattern del `catch (Throwable ignored)`**:
   - È severamente vietato avvolgere chiamate a metodi di produzione con blocchi `try/catch (Throwable ignored)` per evitare fallimenti nei test headless privi del runtime completo.
   - Catturare `Throwable` silenzia errori critici della JVM (`OutOfMemoryError`, `LinkageError`), corrompe lo stato interno del sistema e produce anomalie fantasma o disallineamenti percettivi difficili da riprodurre.
3. **Lo Standard dei Package-Private Test Seams**:
   - La testabilità headless di un adapter si ottiene esponendo delegate con visibilità di package (es. `static Consumer<Long> scannerSuppressor = ...`, `static LongSupplier timeSupplier = System::currentTimeMillis`).
   - Nei test unitari: il delegate viene sostituito in `@BeforeEach` con un mock/accumulatore controllato.
   - In produzione: il delegate punta direttamente ai componenti reali, propagando in modo trasparente qualsiasi eccezione.
   - Nel teardown: un metodo `resetTestSeams()` ripristina sempre i puntatori originari di produzione in `@AfterEach`.

---

## 🛡️ 9. PATTERN OWNERSHIP TOKEN VS STATE PROBE

1. **Separazione Concettuale**:
   - *State Probe*: Legge lo stato corrente del sistema o di un componente (es. "il giocatore è accovacciato?").
   - *Ownership Token*: Rappresenta l'autorità o il mandato che ha generato quello stato (es. "lo stato è stato imposto dall'automatismo di sicurezza o dall'utente manuale?").
2. **Regola di Non-Ingerenza**:
   - Un gestore automatico può modificare o revocare uno stato **soltanto se detiene l'Ownership Token** corrispondente. Se lo stato attuale è stato instaurato da un'azione manuale dell'utente, l'automatismo deve considerarlo inviolabile e sospendersi senza alterarlo.

---

## 🔌 10. DRIVER & PROBE PURITY (SINGLE RESPONSIBILITY NEI DRIVER HARDWARE)

1. **La Verità del Basso Livello**:
   - I probe o driver di basso livello (es. lettori di eventi GLFW, driver audio, controller I/O) devono avere un'unica responsabilità: interrogare l'hardware e riportarne il valore fedele senza applicare filtri o decisioni di contesto.
2. **Divieto di Inquinamento di Contesto**:
   - È vietato inserire controlli di stato applicativo (es. finestre aperte, modalità di gioco, flag di business) all'interno dei driver hardware. L'orchestrazione e il filtraggio appartengono ai layer Application e Domain superiori.

---

## 🧱 11. LIFECYCLE-SAFE INITIALIZATION (DECOUPLING DA SINGLETON E CONFIG)

1. **L'Insidia dei Crash Statici Prematuri**:
   - Istanziare campi di classe dereferenziando singleton globali (es. `Config.getInstance()`) provoca crash `NullPointerException` se la classe viene caricata prima dell'inizializzazione del framework o in ambienti di test headless JUnit/pytest.
2. **La Soluzione a 2 Fasi**:
   - *Fase 1 (Istanziazione)*: I campi di classe vengono inizializzati con valori costanti di fallback sicuri (es. `Interval.ms(150)`).
   - *Fase 2 (Binding Dinamico)*: Il caricamento dei parametri dalla configurazione reale viene eseguito all'interno di un metodo di ciclo di vita dedicato (`loadConfig()`), invocato quando il framework è completamente pronto.

---

## 📜 12. IL PATTERN DEI CONTRATTI DENOMINATI E CHIUSI (NAMED CONTRACT PATTERN)

1. **Contesto & Problema**:
   - Nelle modifiche architetturali o nei refactoring complessi che coinvolgono molteplici componenti interagenti, descrivere l'intervento con prosa discorsiva o frammentata genera fraintendimenti, scope creep, assunzioni non verificate e regressioni silenziose.
2. **La Struttura del Contratto Denominato**:
   - Ogni componente dell'intervento deve essere formalizzato come un contratto atomico, numerato e autosufficiente (es. $D_0 \dots D_N$ per decisioni concettuali/dominio, $S_1 \dots S_N$ per contratti software/sorgenti).
   - Ciascun contratto dichiara tassativamente:
     - *Identificativo & Nome*: `[ID] — [Nome Descrittivo]`;
     - *Componenti Coinvolti*: Classi, interfacce o metodi target;
     - *Precondizioni*: Stato del sistema o vincoli richiesti prima dell'attivazione;
     - *Postcondizioni*: Comportamento osservabile e invarianti garantite al termine;
     - *Budget di Complessità*: Impatto algoritmico ($O(1)$, $O(N)$) o vincoli temporali (es. latenza $0\text{ ms}$);
     - *Invariante Anti-Regressione*: Proprietà di sistema che il contratto garantisce di non alterare.
3. **Vantaggi di Governance & Testabilità**:
   - I contratti fungono da base oggettiva per i test unitari a 0 ms (1 test per clausola contrattuale) e consentono a Luca e all'AI di validare matematicamente l'integrità del sistema prima e dopo il rilascio.

---

## 🔌 13. PRINCIPIO DI PUREZZA DELL'INTENTO FISICO NEI SISTEMI IBRIDI (HARDWARE GROUNDING PATTERN)

1. **Il Rischio di Cortocircuito nei Sistemi Human-in-the-Loop**:
   - Nei sistemi ibridi in cui convivono automatismi di assistenza/sicurezza e controllo manuale umano, un automatismo reattivo può simulare programmaticamente un comando dell'utente (es. forzare l'accovacciamento, la frenata o la deviazione di rotta).
   - Se un altro modulo (es. disattivatore di pilota automatico o human takeover handler) verifica l'intento dell'utente interrogando lo stato logico simulato (`isSneaking()`, `isKeyPressed()`), scatta un **falso positivo catastrofico**: il sistema scambia l'automatismo per un comando umano e abortisce le operazioni.
2. **Lo Standard di Hardware Grounding**:
   - La rilevazione dell'intento o della volontà fisica dell'utente umano **deve essere rigorosamente ancorata all'hardware reale (Grounding Fisico)**.
   - *Se* si deve determinare se l'utente sta intervenendo fisicamente sui comandi -> *Allora* si interroga esclusivamente il probe di basso livello (polling GLFW raw input, controller I/O, tastiera fisica) prima che qualsiasi logica o simulazione sintetica possa inquinarne lo stato.
3. **Disaccoppiamento Assoluto tra Guardie e Intento**:
   - Le guardie di sicurezza sintetiche mantengono la libertà di pilotare lo stato di gioco per proteggere l'entità, ma non possono mai contaminare il canale di lettura dell'intento fisico umano.

