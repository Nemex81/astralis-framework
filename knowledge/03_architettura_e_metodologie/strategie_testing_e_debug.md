# Strategie di Testing, Isolamento Bug e Debug Sistemico (v3.0.0)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: Antigravity (Senior AI Pair Programmer & Software Engineer)
# Ambito: Globale / Universale

Questo documento stabilisce le linee guida per la creazione di test automatici, la simulazione preventiva degli scenari, il troubleshooting sistemico delle anomalie e la sicurezza post-bonifica.

---

## 🧪 1. STRATEGIA DI TESTING AUTOMATICO

1. **Piramide dei Test**:
   - *Test Unitari (Base)*: Numerosi, veloci, isolati con mock su Domain e Use Cases.
   - *Test di Integrazione (Centro)*: Verificano il corretto funzionamento tra moduli interni (es. serializzazione, controller e servizi).
   - *Test End-to-End / Pre-Flight (Vertice)*: Testano l'avvio completo e i flussi critici.

2. **Convenzioni di Naming e Struttura**:
   - Pattern Arrange-Act-Assert (AAA) ben distinto in ogni funzione di test.
   - Nomi dei file di test espliciti: `test_<modulo>.py` o `<Componente>Test.cs`.

3. **Esecuzione Veloce e Determinismo**:
   - I test devono essere riproducibili e non dipendere da risorse di rete esterne non controllate (usare fixture e mock).

---

## 🐞 2. PROTOCOLLO DI DEBUG SISTEMICO IN 4 PASSI

1. **Isolamento e Riproduzione Minima**:
   - Creare un test minimale o un comando riproducibile che isoli l'anomalia senza interferenze di contorno.
2. **Ispezione Forense dei Log e Dati**:
   - Tracciare input, stato interno e output al momento dell'errore.
3. **Correzione Chirurgica alla Causa Radice**:
   - Risolvere la causa profonda, non solo il sintomo visibile.
4. **Test di Regressione Permanente**:
   - Aggiungere il test di riproduzione alla suite di test automatici affinché il bug non si ripresenti mai più.

---

## 🛡️ 3. RESILIENZA AI LOCK TRANSITORI CLOUD (ONEDRIVE/DROPBOX ANTI-SNAPSHOT PATTERN)

1. **La Causa del Lock**:
   - Sui percorsi sincronizzati in tempo reale con cloud storage (OneDrive, Google Drive, Dropbox), i file di output generati rapidamente durante la compilazione o la compressione possono essere temporaneamente agganciati dal processo di sincronizzazione, sollevando eccezioni `AccessDeniedException`, `Cannot snapshot ... not a regular file` o file lock in PowerShell/Gradle/Python.
2. **Standard di Prevenzione**:
   - **Flag Anti-Daemon**: Nelle build Gradle/Java, specificare sempre `--no-daemon` per evitare processi in background persistenti su percorsi sincronizzati.
   - **Staging Temporaneo su `$env:TEMP`**: Tutti gli script di compressione o packaging ZIP devono creare l'archivio in una directory temporanea locale isolata e poi spostarlo atomicamente a destinazione.
   - **Pulizia Selettiva Cache**: In caso di errore `Cannot snapshot` o lock di directory di build, eseguire un `clean` selettivo della cartella `build/` o `__pycache__/` senza toccare l'albero dei sorgenti.

---

## 🧪 4. LA MATRICE DI SIMULAZIONE A 3 LIVELLI (STRESS-TEST LOGICO PREVENTIVO)

1. **Scopo Metodologico**:
   - Integrare la validazione formale sui 7 Assi con uno stress-test concettuale dinamico prima di scrivere codice, prevenendo bug di logica, race condition e regressioni posturali.

2. **I 3 Livelli di Simulazione**:
   - **Livello 1: Scenari Comuni (Happy Path / Uso Quotidiano — 80-90% dei casi)**:
     * Verifica del comportamento nominale in condizioni standard (es. avanzamento dritto, apertura finestre nominali).
   - **Livello 2: Scenari Meno Comuni (Alternative Paths & Casi Concorrenti)**:
     * Verifica di combinazioni lecite ma secondarie: filtri composti, cambi rapidi di direzione, input multipli o retromarcia su baratro.
   - **Livello 3: Casi Limite & Condizioni Estreme (Corner Cases, Null & Boundary Values)**:
     * Stress-test su valori zero, quantità unitarie ($T=1$), collezioni vuote ($N=0$), stringhe non tradotte, buffer overflow o timeout.

3. **Formattazione Standard Lineare per NVDA**:
   - Ciascuna simulazione deve essere redatta con lo schema sequenziale:
     * *Stato Iniziale / Input*: [Parametri e contesto]
     * *Flusso Esecutivo ("Se... Allora")*: [Regola logica]
     * *Output Prodotto & Riscontro Vocale*: [Cosa vocalizza lo screen reader]
     * *Esito*: `[Conforme / Fallback Protetto]`

---

## 🛡️ 5. PROTOCOLLO DI NON-REGRESSIONE E ROLLBACK AUTOMATICO POST-BONIFICA (PROTOCOLLO 11)

1. **La Doppia Barriera di Verifica Post-Pulizia**:
   - Subito dopo l'applicazione di una bonifica di codice o asset approvata da Luca, l'assistente esegue tassativamente la sequenza di verifica:
     1. *Compilazione Pulita*: Esecuzione di `gradle build --no-daemon`, `dotnet build` o controllo di sintassi Python per intercettare errori di compilazione;
     2. *Suite Test Automatici*: Esecuzione dei test unitari e di integrazione (`pytest`, test di modulo) per verificare l'integrità dei flussi funzionali.
2. **Clausola di Rollback Automatico Istantaneo**:
   - *Se* la build fallisce o un solo test non passa -> *Allora* l'assistente **annulla immediatamente la modifica (Rollback automatico via Git o Quarantena)**, ripristina lo stato precedente e notifica a Luca l'esatto componente che ha causato la regressione.
   - *Se* i test hanno esito positivo al 100% -> *Allora* rilascia l'artefatto per il collaudo e registra l'intervento nel `CHANGELOG.md` sotto `⚙️ Modifiche & Refactoring`.
3. **Ispezione Dinamica Retroattiva**:
   - Qualsiasi elemento che dovesse fallire a runtime a causa di una chiamata implicita (Reflection o string lookup) viene registrato come `[RIFERIMENTO DINAMICO PERENNE]` e protetto in modo permanente da future campagne di bonifica.

---

## ⏱️ 6. DETERMINISMO TEMPORALE & INIEZIONE DI CLOCK VIRTUALE NEI TEST CON CONTRATTI TTL

1. **La Discrepanza Temporale Virtuale vs Reale**:
   - Quando si testano code con scadenze temporali (TTL, debounce, finestre di soppressione o scudi a tempo), l'uso implicito di `System.currentTimeMillis()` nei costruttori o nelle factory produce eventi con timestamp reale ($t \approx 1.7 \times 10^{12}$).
   - Se il test controlla il flusso del tempo simulando un clock virtuale (es. `now = 10000`), il calcolo della scadenza `isExpired` (`now - timestamp >= ttl`) produce numeri negativi enormi, rendendo i test temporali inaffidabili o fragili.
2. **Lo Standard di Iniezione dei Time Seams**:
   - **Contratti Sovraccaricati**: Ogni metodo che accetta entità temporizzate deve offrire un sovraccarico con parametro esplicito: `submit(item, timestamp)` o `flush(now)`.
   - **Fornitori di Tempo Sostituibili (Time Seams)**: Le classi che calcolano scadenze interne devono esporre fornitori di tempo iniettabili (es. `LongSupplier timeSupplier = System::currentTimeMillis;` con visibilità package-private per i test).
   - **Coerenza del Clock nei Test**: Nei test unitari, la creazione dell'oggetto, l'avanzamento del tempo e il controllo di scadenza devono attingere rigorosamente alla medesima sorgente temporale virtuale controllata (es. `AtomicLong simulatedTime = new AtomicLong(10000)`), garantendo test a 0 ms deterministici, privi di `Thread.sleep` e riproducibili al 100%.

---

## 🎯 7. LA TRIANGOLAZIONE EMPIRICA A TRE FONTI PER LA CONVALIDA FINALE (TEST + TELEMETRIA + PERSISTENZA)

1. **Il Limite del Test Singolo**:
   - I test unitari certificano la logica interna ma non la percezione d'uso; la telemetria dal vivo certifica ciò che viene inviato al canale sensoriale ma non garantisce che il motore applicativo abbia persistito lo stato; l'ispezione postuma dei dati non rivela la reattività o i tempi percepiti dall'utente.
2. **La Triangolazione a Tre Fonti**:
   - Nelle applicazioni interattive o accessibili per non vedenti, una feature o un refactor complesso si considerano convalidati in modo definitivo solo quando convergono tre fonti indipendenti:
     1. *Fonte 1 — Test Automatici Headless*: suite unitaria verde a 0 ms che valida contratti, contratti TTL, code e invarianti logiche;
     2. *Fonte 2 — Telemetria Live & Logging di Runtime*: tracciamento in tempo reale degli eventi vocalizzati, dello scudo interruttivo (`interrupt: true` vs `interrupt: false`) e dell'assenza di eccezioni o warning anomali;
     3. *Fonte 3 — Persistenza Dati su Disco*: riscontro forense sui file di stato, database o salvataggi (es. file di configurazione, statistiche, database locale), confermando che ogni operazione percepita e vocalizzata corrisponde a una mutazione deterministica registrata su disco.

---

## 🗺️ 8. DIAGNOSI FORENSE NEI GRAFI DI NAVIGAZIONE E PATHFINDING (A* / DIJKSTRA)

1. **La Trappola del Budget vs Connettività Topologica**:
   - Quando un algoritmo di ricerca percorso (A*, Dijkstra o BFS) restituisce fallimento (`NO_PATH`), non cedere alla tentazione ingenua di incrementare i limiti computazionali (es. raddoppiare il budget dei nodi espansi da 2.500 a 5.000 o 10.000).
   - Un aumento del budget è utile **unicamente** se il fallimento si manifesta per esaurimento del budget (`SEARCH_BUDGET_EXHAUSTED`) e l'open-set contiene ancora nodi promettenti in espansione verso la meta attraverso varchi aperti complessi.
2. **La Discriminante dell'Open-Set a Pochi Nodi**:
   - *Se* la ricerca termina con `NO_PATH` avendo esplorato una quantità esigua di nodi (es. poche decine o centinaia) in una stanza o corridoio ristretto;
   - *Allora* la causa è matematicamente e tassativamente **un arco mancante o bloccato nel grafo topologico** tra due nodi contigui.
   - Indagare immediatamente le funzioni di transizione geometrica (`isPassable`, `isClearHeadroom`, `isStandable`, `isSolid`) e le collision box dei blocchi o elementi decorativi presenti sulla soglia critica (es. scale a pioli, cartelli, torce, stipiti o mezze altezze).
3. **Clearance Volumetrica Multi-Punto per Entità Verticali**:
   - Nei motori a griglia o voxel in cui le entità superano l'unità di blocco ($H > 1.0\text{ m}$), ogni verifica di percorribilità, transizione o rischio caduta non deve mai limitarsi al solo piano di appoggio ($Y$).
   - Verificare obbligatoriamente l'intero volume della hitbox: se la cella a quota testa/occhi ($Y+1 \dots Y+H$) è occlusa da solidi o soffitti bassi, il passaggio fisico è precluso e l'allarme inferiore deve essere scartato come non percorribile.
