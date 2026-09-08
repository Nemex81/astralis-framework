# CHANGELOG — ASTRALIS Framework
# Autore: Luca (Senior Developer & Author) & Antigravity (AI Pair Programmer)
# Standard: Semantic Versioning (SemVer) & Formattazione Lineare per NVDA

Tutte le modifiche rilevanti, i rilasci e le evoluzioni del framework universale **ASTRALIS** sono tracciate in questo documento.

## 🚀 [v3.0.4] — 2026-09-08 (Proactive Update Check, High-Energy Emergency Transients & Token-Saving Scripts)

### 🌟 Rilevamento Proattivo Aggiornamenti & Pattern Deferred Query
- **Pattern Deferred Query & Update Prompt (`templates/GEMINI_TEMPLATE.md` Regola 8, `ISTRUZIONI_DI_AVVIO.md` §5)**:
  - Introdotto il controllo proattivo e non invasivo degli aggiornamenti all'avvio della prima richiesta dell'utente in una chat;
  - Se il sistema è allineato all'ultima versione (o offline), l'esperienza d'uso è fluida e priva di notifiche superflue (zero rumore per NVDA);
  - Se è presente una nuova release ufficiale su GitHub, la richiesta formulata viene salvata e visualizzata chiaramente con un riepilogo semantico ("Obiettivo" e "Descrizione") offrendo il bivio trasparente (Aggiorna prima / Procedi subito con la richiesta originale).
- **Architettura Scripting ad Alto Risparmio Token (`scripts/verifica_aggiornamenti_remoti.ps1`)**:
  - Creazione dello script autonomo portabile delegato a tutte le operazioni di rete, confronto SemVer e fallback;
  - Caching locale temporaneo (12 ore) in `$env:TEMP` per eliminare latenze di rete e chiamate ridondanti nella stessa sessione;
  - Risparmio del 95% del consumo di token per l'assistente AI grazie al disaccoppiamento su script a 1 riga con emissione JSON compatto a 4 campi.
  - Canale a due livelli: interrogazione REST primaria delle GitHub Releases API (`releases/latest`) con fallback fail-safe su `git ls-remote --tags`.

### 🎧 Accessibilità Audio & Transienti Metallici Acuti Salvavita
- **Principio del Transiente Acuto Penetrativo (`knowledge/02_accessibilita_e_audio/sonificazione_e_volumi_sicurezza.md` §5)**:
  - Codificata la regola universale per i segnali sonori di allarme imminente e pre-freno salvavita: divieto di impiegare toni morbidi, sordi o a bassa frequenza che verrebbero coperti dal parlato simultaneo della sintesi vocale TTS / NVDA;
  - Obbligo di impiego di campioni sonori dotati di attacco istantaneo ad altissima energia e spettro acuto metallico (es. risonanza d'incudine su ferro);
  - Immunità del canale audio: obbligo di instradamento degli allarmi di sicurezza personale su bus dedicati al giocatore (`PLAYERS`, `UI`, `SYSTEM`), escludendo i bus audio dell'ambiente soggetti a filtri o attenuazioni dell'utente.

---

## 🚀 [v3.0.3] — 2026-09-07 (Evolutionary Integrity, Centralized FSM, Clean Sweep D0 & Visual Orientation Shield)

### 🌟 Integrità Evolutiva, Zero Residui & Refactoring Disciplinato
- **Principio di Integrità Evolutiva & Bonifica dei Residui (`clean_architecture_e_design_pattern.md` §16, `GEMINI_TEMPLATE.md` Regola Aurea 7)**:
  - Codificato il principio di architettura pulita contro il debito tecnico tossico: divieto categorico di lasciare coesistere codice o strutture obsolete, parziali, morte o concorrenti a seguito dell'introduzione di una nuova soluzione;
  - Obbligo di scansione globale esaustiva (`grep_search`) prima di dichiarare completato qualsiasi refactoring.
- **Pattern FSM Centralizzato vs Catena di Tick Frammentata (`clean_architecture_e_design_pattern.md` §14)**:
  - Superamento delle sequenze a frame/tick dispersi nei moduli di locomozione; adozione di macchine a stati deterministiche sul loop principale con condizioni geometriche misurabili e seam di test headless a 0 ms.
- **Pattern Delegazione Unificata per Azioni Condivise tra Modalità (`clean_architecture_e_design_pattern.md` §15)**:
  - Unificazione implementativa per azioni motorie condivise tra input manuale e guida autonoma, garantendo coerenza percettiva assoluta per lo screen reader ed eliminando biforcazioni di bug.
- **Contratto D0 Clean Sweep Obbligatorio (`catalogo_protocolli_operativi_astralis.md` Protocollo 11, `PIANO_TECNICO_TEMPLATE.md`, `00_consuetudini_operative_template.md`)**:
  - Formalizzato il primo contratto denominato (`D0`) interamente dedicato alla bonifica sistematica dei residui nei piani tecnici di refactoring prima dell'innesto del nuovo sistema.

### 🎮 Accessibilità Gameplay & Preservazione della Bussola Mentale
- **Principio di Intangibilità della Bussola Mentale del Giocatore (`accessibilita_videogiochi_e_gameplay.md` §19)**:
  - Riconoscimento dell'orientamento della telecamera come perno fondamentale della mappa cognitiva dell'utente non vedente;
  - *Per operazioni rapide e semplici*: raccomandazione categorica dell'interazione programmatica/logica diretta a visuale immobile (es. varchi, botole, interruttori alle spalle);
  - *Per automatismi complessi o non codificati*: divieto di rotazioni forzate arbitrarie; obbligo di consultazione preventiva con l'autore e stipula di un apposito Contratto Operativo Contestuale con adeguate tutele sensoriali (cue sonori, beacon audio, ripristino azimut).
- **Estensione Gestione Varchi con AutoClose a Soglia Geometrica (`accessibilita_videogiochi_e_gameplay.md` §5.3)**:
  - Definizione dell'invariante di chiusura automatica determinata dal superamento della distanza euclidea di sicurezza ($d \ge 0.90\text{ m}$) senza rotazione visuale ed escludendo meccanismi metallici/blindati.

---

## 🚀 [v3.0.2] — 2026-09-06 (Conditional Multi-AI Symmetry Guard & Level 0 Detection)

### 🌟 Orchestrazione Multi-AI Condizionale, Anti-Bloat & Probing Esecutivo
- **Istituzione della Guardia Condizionale di Simmetria Multi-AI (`orchestrazione_multi_ai_e_collaboratori.md`, Protocolli 8 e 9)**:
  - Codificato il principio di *Attivazione Selettiva (Anti-Bloat & Zero Inquinamento)*: la gestione e la sincronizzazione di configurazioni per assistenti AI ausiliari (GPT Codex, Claude, Copilot) scattano esclusivamente su *Auto-Discovery* (rilevamento fisico concreto di cartelle client come `.codex` o `.claude` nel sistema operativo o router ausiliari nel workspace) oppure su *Richiesta Esplicita dell'Utente*;
  - In assenza di client ausiliari o richieste, il sistema opera in *Modalità Singola AI (Lean Mode)* per preservare la massima pulizia del filesystem.
- **Implementazione Esecutiva nel Tooling (`scripts/aggiorna_ecosistema.ps1`)**:
  - Aggiunto nella Fase 3 il probing condizionale deterministico per `%USERPROFILE%\.codex` e `%USERPROFILE%\.claude`;
  - Se rilevati, lo script esegue automaticamente il backup preventivo (`AGENTS.md.bak`, `CLAUDE.md.bak`) e segnala chiaramente lo stato nella ricevuta di conformità per NVDA.

---

## 🚀 [v3.0.1] — 2026-09-06 (Universal Role Neutrality, Script Hub Discovery & Multi-AI Alignment)

### 🌟 Perfezionamento Distributivo, Neutralità dei Ruoli & Scripting Portabile
- **Neutralizzazione dei Ruoli Operativi nei Documenti Pubblici**:
  - Separazione netta tra *Riconoscimento Autoriale Morale/Legale* (preservato al 100% per Luca come autore/architetto e Antigravity come copilota originario in README, licenza e metadati) e *Ruoli Operativi nei Moduli*:
    * Sostituite nei testi di flusso operativo tutte le menzioni rigide con ruoli agnostici (`[Sviluppatore]`, `[AI Pair Programmer]`, `[Utente]`);
    * Neutralizzato l'header `Target AI` in tutte le 15 schede `knowledge/` (`Target AI: [AI Pair Programmer / Assistente AI]`);
    * Istruzioni di avvio e prompt di onboarding resi 100% agnostici per supportare nativamente Google Antigravity, Claude Code, OpenAI Codex, Cursor o qualsiasi AI assistente.
- **Implementazione Esecutiva dell'Algoritmo Dinamico di Discovery Hub**:
  - Aggiornato `scripts/esporta_starter_kit_zip.ps1` per consultare esplicitamente la variabile d'ambiente `$env:ASTRALIS_HUB` e il file di configurazione locale `user_preferences.json`, allineando l'implementazione esecutiva alla documentazione formale.
- **Normalizzazione Fine Riga & Igiene Codifica**:
  - Normalizzati tutti gli script PowerShell (`.ps1`) con terminazione CRLF per la massima compatibilità con Windows PowerShell 5.1 e PowerShell 7.
- **Allineamento Template di Progetto & Resilienza Build**:
  - Sincronizzato `templates/GEMINI_TEMPLATE.md` a v3.0.0 con l'integrazione del Cancello 6 Token Budget, Rete Pointer DRY e flag di resilienza build (`--no-daemon --no-watch-fs`).

---

## 🚀 [v3.0.0] — 2026-09-06 (Universal Open Source Release, Convergenza Modulare & Triplo Context Switcher)

### 🌟 Novità di Sistema, Rilascio Open Source & Architettura Universale
- **Rilascio Ufficiale su GitHub (`Nemex81/astralis-framework`)**:
  - Transizione da Master Hub privato a distribuzione open source universale con Licenza Apache-2.0.
  - Separazione architetturale tra *Core del Framework* (pubblico, modulare, universale) e *Profilo Utente Configurato* (locale, isolato tramite onboarding).
  - Riconoscimento morale e legale: Luca ideatore, autore e architetto del framework; Antigravity copilota AI di co-progettazione originario.
- **Istituzione della Matrice di Convergenza Modulare Multidominio (`docs/architettura/matrice_dei_domini_e_convergenza.md`, `templates/progetti_convergenti/`)**:
  - Superamento dei silos: ASTRALIS fa convergere contemporaneamente molteplici dimensioni su qualsiasi progetto.
  - *Game Development Accessibile*: fusione simmetrica tra Clean Architecture, Game Engine/Loop e Accessibilità Ludica (bussola 3D, volumi di sicurezza 0.7f - 0.8f, audio ducking, interazione 100% tastiera con supporto visivo mouse per i vedenti).
  - *Scrittura Creativa, Narrativa & Worldbuilding*: rispetto assoluto della voce autoriale, gestione bozze, scalette e continuità delle linee temporali/lore.
  - *Addon & Strumenti Assistivi*: ingegneria Python/wxPython, speech hooks e navigazione tastiera.
  - *Utility & Automazioni*: script PowerShell resilienti, multi-ambiente e barriere di pre-flight.
  - *Software Engineering & API*: Clean Architecture, test deterministici e CI/CD.
- **Triplo Context Switcher Automatico a Marker (Protocollo 7, `catalogo_protocolli_operativi_astralis.md`)**:
  - Rilevamento deterministico a runtime del perimetro operativo in Fase 4:
    * *Ambito C (Framework Distribuibile)*: modalità Framework Core Maintainer in `astralis-framework` con Dogfooding in `docs/developer/` e zero dati personali;
    * *Ambito B (Master Hub Locale)*: manutenzione della governance della postazione locale dell'utente e dell'Isola Protetta;
    * *Ambito A (Progetto Verticale)*: sviluppo mirato sul singolo workspace con doppio binario locale/globale.
- **Algoritmo Dinamico di Discovery del Master Hub (Zero Hardcoding)**:
  - Eliminazione di percorsi cablati per il Master Hub locale; cascata di rilevamento a 3 livelli: Configurazione Esplicita (Manifest Livello 0 / `$env:ASTRALIS_HUB`) -> Scansione Marker Strutturali -> Fallback interattivo one-time in `user_preferences.md`.
- **Codificazione del Context Fencing & 4 Regole Anti-Conflitto (`ingegneria_delle_regole_e_meta_governance.md`)**:
  - Direzionalità a senso unico della privacy (mai dati privati verso l'upstream pubblico), separazione impermeabile dei registri (RRU vs Meta-Registro) e domanda ponte contestualizzata per NVDA.
- **Governance Interna e Dogfooding (`docs/developer/`)**:
  - Creata l'area di sviluppo interno `docs/developer/` con le sottocartelle `piani/`, `strategie/`, `report/` e `specifiche/`, dove lo sviluppo di ASTRALIS stesso è governato tramite i propri protocolli.
- **Standardizzazione dei Collegamenti (Canone 3 Universale)**:
  - Conversione integrale dei percorsi locali in link relativi Markdown standard portabili su GitHub Web, browser ed editor locali.
- **Suite Template Multi-AI & Manifest Polimorfici (`templates/`)**:
  - Template pronti all'uso per OpenAI/GPT Codex (`AGENTS_GPT_TEMPLATE.md`), Anthropic Claude (`CLAUDE.md`), Google Antigravity/Gemini (`GEMINI.md`) e Custom AI.
- **Audit Forense a 10 Assi & Consolidamento Ecosistema**:
  - Allineamento universale della versione a v3.0.0 su tutti i 69 file e moduli.
  - Risoluzione delle duplicazioni e conformità al Canone 3 DRY (spostamento piano tecnico di rilascio completato in `docs/developer/piani/completati/`, trasformazione delle copie in puntatori DRY).
  - Resilienza e portabilità degli script PowerShell con supporto bidirezionale dei marker (`knowledge` e `knowledge_globale`), compatibilità console e gestione try/catch.
  - Neutralizzazione dei residui operativi rigidi a favore di placeholder universali (`[NOME SVILUPPATORE]`, `user_preferences.md`).
  - Integrazione completa del Cancello 6 (Budget Token & Anti-Bloat Normativo) nelle checklist operative dei piani tecnici e delle strategie cognitive.

---

## 🚀 [v2.8.0] — 2026-09-06 (Universal Multi-AI Orchestration, Suite Collaboratori & Guardia Ausiliaria On-Demand)

### 🌟 Novità di Sistema, Governance Universale & Architettura
- **Orchestrazione Multi-AI, Suite Collaboratori & Guardia Ausiliaria On-Demand (`knowledge_globale/.../orchestrazione_multi_ai_e_collaboratori.md`, `templates/collaboratori_ai/`, Protocolli 8 e 9)**:
  - Formalizzato il **Polimorfismo dei Ruoli Multi-AI**: disaccoppiamento simmetrico tra *AI Primaria* (lead operativa, test, codice, 100% autonoma) e *AI Ausiliarie / Collaboratori* (peer reviewer, dialettica avversariale, brainstorming, in sola consultazione/lettura).
  - Implementata l'**Auto-Deduzione Deterministica dell'Ambiente**: l'assistente attivo riconosce il proprio runtime e si propone come Primaria per default con conferma a 1 riga per NVDA.
  - Creata la cartella `templates/collaboratori_ai/` con template dedicati per: OpenAI/GPT Codex (`AGENTS_GPT_TEMPLATE.md`), Anthropic Claude (`CLAUDE_TEMPLATE.md`), GitHub Copilot (`COPILOT_TEMPLATE.md`) e Custom AI Agnostico (`CUSTOM_AI_TEMPLATE.md`).
  - Istituita **La Guardia Ausiliaria Multi-AI On-Demand**: sentinella silenziosa che rileva collaboratori non configurati o disallineati sulla macchina (`.codex`, `.claude`) e propone l'armonizzazione automatica a 1 comando.
  - Aggiornati i profili globali e locali della postazione di sviluppo (`%USERPROFILE%\.codex\AGENTS.md` e `minecraft-access/AGENTS.md`).

---

## 🚀 [v2.7.3] — 2026-09-06 (ASTRALIS Canon Crafting & Disciplina Formale di Meta-Governance)

### 🌟 Novità di Sistema, Governance Universale & Architettura
- **Formalizzazione della Meta-Governance & Ingegneria delle Regole (ASTRALIS Canon Crafting) (`knowledge_globale/.../ingegneria_delle_regole_e_meta_governance.md`, Protocolli 7, 8, 12 e Regola 7 Globale)**:
  - Codificati i **6 Canoni Architetturali Fondamentali** per creare e manutenere regole:
    1. *Hub & Spoke & Budgeting Token*: Router snello ad alto segnale ($\le 250$ righe / ~2.000 token per i file `GEMINI.md`); spiegazioni estese allocate nei moduli `knowledge/`.
    2. *Disaccoppiamento Manifest vs Modulo*: Nei router locali risiedono unicamente parametri concreti di configurazione (3-6 righe); la teoria architetturale appartiene ai moduli dedicati.
    3. *Rete Documentale Pointer DRY*: Zero duplicazioni testuali; link incrociati navigabili obbligatori tra i 4 nodi.
    4. *Gating Deterministico a 3 Stati*: Notazione standard `[ ]`, `[/]`, `[x]` con divieto di spunta preventiva prima del collaudo reale.
    5. *Accessibilità Cognitiva NVDA*: Flusso 100% lineare, logica "Se... Allora", divieto di tabelle ASCII o grafici 2D, novità sempre in cima.
    6. *Igiene dei File*: Formato UTF-8 senza BOM, rispetto delle terminazioni di riga CRLF su Windows e percorsi dinamici universali.
  - Integrata la **Regola 7** nel Genoma Globale (`<config-dir>\config\GEMINI.md`) e la Regola 5 in `templates/GEMINI_TEMPLATE.md`.
  - Estesi i protocolli: Protocollo 7 (validazione preventiva sui 6 Canoni in Fase 4), Protocollo 8 (audit automatico del token budget e integrità file) e Protocollo 12 (Cancello 6: Custode Critico del Budget Token & Anti-Bloat Normativo).

---

## 🚀 [v2.7.2] — 2026-09-06 (Universal Proactive Cognitive Strategy — UPCS, Rete a 4 Nodi & Profilo di Resilienza Multi-Canale)

### 🌟 Novità di Sistema, Governance Universale & Architettura
- **Istituzione Ufficiale del Framework Strategico Logico-Cognitivo (UPCS) (`templates/STRATEGIA_COGNITIVA_TEMPLATE.md`, `catalogo_protocolli_operativi_astralis.md` — Protocollo 1)**:
  - Introdotto il quarto pilastro documentale dell'ecosistema ASTRALIS dedicato all'elaborazione concettuale proattiva di Fase 0 (*Il Perché e il Modello Mentale*), disaccoppiato sia dai Report (retrospettivi) sia dai Piani Tecnici (esecutivi).
  - Codificati i **7 Archetipi Strategici Formali**: Concettuale-Implementativa, Diagnostico-Correttiva, Refactoring Strutturale & Disaccoppiamento, Euristico-Cognitiva per Screen Reader & Audio 3D, Dialettica Avversariale & Convergenza Multi-AI (Inner Codex), Integrazione & Interoperabilità di Runtime, Bonifica/Migrazione/Deprecazione.
  - Creato il template istituzionale `STRATEGIA_COGNITIVA_TEMPLATE.md` a 5 sezioni con Registro di Convergenza e checklist a 3 stati di Fase 0 per NVDA, con gestione trasparente dello stato iniziale del Piano Tecnico Derivato (`[DA DEFINIRE IN SOTTO-FASE 1A]`).
- **Architettura a Rete a 4 Nodi Comunicanti (DRY & Pointer Hub)**:
  - Interconnessione simmetrica tra **Strategie (`docs/strategie/`)**, **Piani Tecnici (`docs/piani/`)**, **Report di Sessione (`docs/report/archivio/`)** e **Registri Revisioni (`REGISTRO_REVISIONI.md` / `ARCHIVIO_REVISIONI.md`)**.
  - Ogni documento include puntatori espliciti cliccabili verso gli altri tre nodi della catena, garantendo navigabilità istantanea da tastiera per l'utente non vedente.
- **Profilo di Resilienza, Versionamento & Canali Cloud Multi-Scopo (`knowledge_globale/.../automazioni_powershell_e_resilienza.md`, Protocolli 8 e 9)**:
  - Disaccoppiamento funzionale dei 4 canali di memorizzazione per scopo operativo:
    * *Canale 1 (VCS Codice / GitHub)*: tracciamento atomico sorgenti e documentazione;
    * *Canale 2 (Ponte Operativo Multi-Macchina)*: cartella cloud sincronizzata per dati runtime pesanti (saves, istanze, mondi di test) tra postazioni diverse (es. Desktop Salotto <-> Laptop MSI);
    * *Canale 3 (Cold Archive & Disaster Recovery)*: snapshot preventivi pre-fill, JAR compilati e memoria storica;
    * *Canale 4 (Backup Primario Resiliente)*: snapshot automatici zip per progetti No-Git.
  - Procedura di rilevamento adattivo in fase di bootstrap e aggiornamento con dialogo semplificato calibrato sul livello dell'utente.
- **Estensione dell'Archival Guard a Zero Residui (`catalogo_protocolli_operativi_astralis.md` — Protocollo 6)**:
  - All'atto della chiusura tecnica della revisione e collaudo positivo di Luca, la migrazione automatica sposta simultaneamente la Strategia da `docs/strategie/attive/` a `docs/strategie/archiviate/`, il Piano da `attivi/` a `completati/`, il Report in `archivio/` e la voce nel Registro Storico, aggiornando tutti i puntatori incrociati. Zero documenti orfani.

---

## 🚀 [v2.7.1] — 2026-09-05 (URCP In-Flight Ingestion, Pipeline Aggiornamento Ecosistema a 3 Fasi & Bootstrap Zero-Debito)

### 🌟 Novità di Sistema, Governance Universale & Architettura
- **Ingestione & Proposta di Normalizzazione Post-Analisi (URCP In-Flight) (`catalogo_protocolli_operativi_astralis.md` — Protocollo 4)**:
  - Esteso il Protocollo 4 (Telemetria, Diagnosi e Reporting): quando viene sottoposto ad Antigravity un report esterno non conforme (da ChatGPT/Codex, tester o dump grezzi), oltre alla valutazione tecnica e alle risposte di merito, l'assistente formula proattivamente la proposta di normalizzazione URCP a 7 campi.
  - Con il consenso esplicito dell'utente, il file viene subito convertito e reso fruibile con NVDA fin dall'avvio dei lavori, eliminando la permanenza di report disomogenei nel ciclo attivo.
- **Riforma del Ciclo di Aggiornamento Ecosistema a 3 Fasi (`catalogo_protocolli_operativi_astralis.md` — Protocollo 8)**:
  - Strutturata la procedura universale di upgrade macchine esistenti nella sequenza deterministica *Prima $\rightarrow$ Durante $\rightarrow$ Dopo*:
    1. *Fase 1: Pre-Flight Audit dello Stato Attuale (PRIMA)*: scansione preliminare del delta versioni, registri revisione legacy, report non conformi e anomalie di codifica (BOM);
    2. *Fase 2: Aggiornamento Master Hub & Release Starter Kit (DURANTE)*: fusione integrativa salvaguardando l'Isola Protetta Utente e generazione dello Starter Kit ZIP versionato;
    3. *Fase 3: Post-Flight Migration & Riconciliazione Progetti Attivi (DOPO)*: allineamento selettivo della knowledge locale, migrazione retrocompatibile del `REGISTRO_REVISIONI.md` al pointer hub DRY e bonifica URCP di tutti i report storici ed attivi.
- **Bootstrap Nativo Zero-Debito su Nuova Macchina (`catalogo_protocolli_operativi_astralis.md` — Protocollo 9)**:
  - Codificato il bootstrap diretto dall'ultimo Starter Kit ZIP versionato, garantendo che ogni nuova postazione o progetto nasca con architettura disaccoppiata, standard report e registri revisione nativamente conformi al 100%.
- **Guardia di Ingestione & Archiviazione Report (URCP Standard) (`catalogo_protocolli_operativi_astralis.md` — Protocollo 6 & RRU)**:
  - Istituito il controllo automatico a 4 passi all'atto dell'archiviazione: normalizzazione 7 campi, inversione cronologica, compattazione log e bonifica UTF-8 pulita (zero BOM).

---

## 🚀 [v2.7.0] — 2026-09-05 (Protocollo 12 Inner Codex, Report Pointer Hub a Cronologia Inversa & Sinergia RRU)


### 🌟 Novità di Sistema, Governance Universale & Architettura
- **Istituzione Ufficiale del Protocollo 12 — Dialettica Ingegneristica & Auto-Revisione Avversariale (L'Inner Codex Pattern) (`catalogo_protocolli_operativi_astralis.md`)**:
  - Elevata la governance da 11 a 12 Protocolli Operativi Ufficiali.
  - Codificata la capacità nativa e autonoma di Antigravity di agire come Senior Reviewer critico, intransigente e avversariale, strutturato sui **5 Cancelli Inviolabili (The 5 Inviolable Gates)**:
    1. *Cancello 1 — Rifiuto del Patching Euristico (Invariante Topologica vs Sintomo Numerico)*: divieto di mascherare problemi strutturali alterando budget, tick, delay o costanti arbitrarie.
    2. *Cancello 2 — Purezza dell'Intento Fisico nei Sistemi Ibridi (Hardware Grounding)*: ancoraggio obbligatorio del rilevamento di input umano ai probe hardware reali (GLFW / periferiche pure), escludendo stati logici simulati da automatismi concorrenti.
    3. *Cancello 3 — Integrità della Hitbox e Volumetria Continua*: analisi spaziale rigorosa su geometrie 3D continue ($0.6 \times 1.8\text{ m}$), clearance verticale occhi/testa e forme di collisione sottili.
    4. *Cancello 4 — Disciplina dei Contratti Denominati e Chiusi (Named Contract Pattern)*: scomposizione atomica delle modifiche complesse in contratti formali numerati (D0..DN, S1..SN) con precondizioni, postcondizioni e invarianti.
    5. *Cancello 5 — Determinismo Headless e Time-Seam a 0 ms*: obbligo di time-seam package-private per l'esecuzione istantanea di test unitari con clock virtuale senza `Thread.sleep`.
  - Integrato l'Audit Avversariale Preventivo a 5 voci nella Sotto-Fase 1A dei Piani Tecnici (`templates/PIANO_TECNICO_TEMPLATE.md`).
- **Standard del Report di Sessione & Telemetria ad Alto Segnale (`templates/REPORT_SESSIONE_TEMPLATE.md`, `catalogo_protocolli_operativi_astralis.md`)**:
  - Codificata l'intestazione standard a 7 campi (`Autore`, `Revisori`, `Data e Ora`, `Stato dell'Implementazione`, `Obiettivi`, `Piani & Strategie Correlate`, `Breve Descrizione`).
  - *Flusso Messaggi in Ordine Cronologico Inverso (Newest First)*: il messaggio più recente risiede sempre in cima alla sezione messaggi per l'atterraggio istantaneo con tasto rapido `H` in NVDA.
  - *Standard Atomico ad Alto Segnale (4 Campi)*: Contesto/Sintomo ($\le 2$ righe), Causa Radice Concettuale, Approccio Risolutivo & Pattern, Puntatori Espliciti a sorgenti, test, log e piani (divieto di file bloat, dump integrali di log e codice massivo).
  - *Archiviazione Automatica a Zero Residui*: migrazione automatica del report da `docs/report/` a `docs/report/archivio/` durante il Protocollo 6 (Chiusura Tecnica - Fase 3).
- **Sinergia a Puntatore Diretto RRU $\rightarrow$ Report (`templates/REGISTRO_REVISIONI_TEMPLATE.md`, `catalogo_protocolli_operativi_astralis.md`)**:
  - Applicazione rigorosa del principio DRY: le singole voci nel Registro Revisioni mantengono una sintesi estrema e puntano direttamente al Report di Sessione, eliminando la duplicazione degli elenchi di file.
  - Aggiornamento deterministico dei puntatori al path di archivio (`docs/report/archivio/`) al momento della migrazione in `ARCHIVIO_REVISIONI.md`, garantendo zero link rotti.
- **Ergonomia Cognitiva per Screen Reader (`stile_comunicazione_nvda.md`)**:
  - Codificata la Sezione 3 sui vantaggi ergonomici della cronologia inversa e dello standard a puntatori per sintesi vocale NVDA.
- **Pattern dei Contratti Denominati e Chiusi (`clean_architecture_e_design_pattern.md`)**:
  - Codificata la Sezione 12: formalizzazione modulare degli interventi complessi con contratti chiusi per blindare la non-regressione e guidare la scrittura di test unitari 1-a-1.
- **Principio di Purezza dell'Intento Fisico nei Sistemi Ibridi (`clean_architecture_e_design_pattern.md`)**:
  - Codificata la Sezione 13: isolamento assoluto tra le guardie reattive di sicurezza che pilotano stati di emergenza e i canali di intercettazione dell'intento volontario umano.
- **Aggiornamento Diagnostica di Ricerca Grafi (`strategie_testing_e_debug.md`)**:
  - Formalizzata la Sezione 8 sull'isolamento sistemico delle anomalie di pathfinding A*/Dijkstra tramite discriminante open-set vs budget di espansione.
- **Aggiornamento Sicurezza Sistemi di Assistenza Ibridi (`accessibilita_videogiochi_e_gameplay.md`)**:
  - Formalizzata la Sezione 16 sul disaccoppiamento tra automatismi di salvataggio posturale e takeover volontario umano.

---

## 🚀 [v2.6.3] — 2026-09-04 (Buffer di Rifinitura Pre-Release Universale, DirectInteractionShield & Triangolazione a Tre Fonti)

### 🌟 Novità di Sistema, Governance Universale & Architettura
- **Strategia Universale dei Buffer di Rifinitura (`catalogo_protocolli_operativi_astralis.md`)**:
  - Aggiornato il Protocollo 5 (PRAPI): codificato il principio universale agnostico per cui i ritocchi secondari e le rifiniture non bloccanti emersi durante la produzione non devono spezzare l'inerzia del lavoro primario, ma vengono accorpati in un buffer dedicato a conclusione del corpo dell'opera e prima della revisione/collaudo complessivo. Valido per software, scrittura creativa, audio e governance.
- **Principio del Rasoio Funzionale Anti-Sovraingegnerizzazione (`catalogo_protocolli_operativi_astralis.md`)**:
  - Integrato nel Protocollo 2 (Validazione): divieto assoluto di refactoring speculativi o nuove macchine a stati su comportamenti o moduli già convalidati empiricamente come funzionanti e risolti con screen reader NVDA.
- **Pattern "DirectInteractionShield" per Flussi Concorrenti (`clean_architecture_e_design_pattern.md`)**:
  - Integrato nella Sezione 4: token temporale vincolante attivato dalle azioni manuali esplicite dell'utente da tastiera, con emissione immediata a latenza zero (`interrupt: true`) e assorbimento silenzioso dei flussi passivi e di telemetria di fondo.
- **La Triangolazione Empirica a Tre Fonti (`strategie_testing_e_debug.md`)**:
  - Codificata la Sezione 7: standard metodologico di convalida definitiva basato sulla convergenza sincronizzata di Test Automatici Headless a 0 ms (logica), Telemetria Live di Runtime (percezione sensoriale vocale/audio) e Persistenza Dati su Disco (riscontro forense dello stato).

---

## 🚀 [v2.6.2] — 2026-09-04 (Sinergia Multi-AI Triangolo Virtuoso, Ownership Token, Doppio Guard GUI & Flag Gradle --no-watch-fs)

### 🌟 Novità di Sistema, Metodologia & Design Pattern
- **Il Metodo del Triangolo Virtuoso di Pair Programming Multi-AI (`abitudini_sviluppo_luca.md`)**:
  - Codificata la Sezione 16: cooperazione sinergica e non-competitiva tra Luca (Lead Architect & Product Owner sovrano), ChatGPT (Senior Reviewer & Architectural Analyst per second-opinions e confini formali) e Antigravity (Resident Pair Programmer & Esecutore Locale sul filesystem, build e telemetria live).
  - Obbligo metodologico di **Delimitazione Negativa ("Cosa NON Toccare")** e matrice delle **Invarianti Anti-Regressione** nei piani tecnici di Sotto-Fase 1A.
- **Pattern "Ownership Token vs State Probe" (`clean_architecture_e_design_pattern.md`)**:
  - Codificata la Sezione 9: netta separazione tra lo stato osservato dal probe e l'autorità formale di comando (`systemOverrideActive`). Gli automatismi possono revocare esclusivamente gli stati da essi stessi imposti, con divieto assoluto di alterare o resettare la volontà manuale dell'utente.
- **Driver & Probe Purity (`clean_architecture_e_design_pattern.md`)**:
  - Codificata la Sezione 10: i lettori hardware di basso livello devono rimanere puri (Single Responsibility), delegando filtri e regole di business ai layer superiori.
- **Lifecycle-Safe Initialization (`clean_architecture_e_design_pattern.md`)**:
  - Codificata la Sezione 11: prevenzione dei crash statici da singleton prematuri; inizializzazione dei campi con costanti sicure di fallback e binding dinamico differito al lifecycle dedicato.
- **Inviolabilità Input Manuale & Architettura a Doppio Guard nelle GUI (`standard_nvda_e_tastiera.md`)**:
  - Codificate le Sezioni 5 e 6: tutela dei modificatori fisici nei menu e pattern a doppio guard (a monte sui binding, a valle sui metodi fisici, con sincronizzazione atomica in `tick()`) per eliminare crash e ghost narrations.
- **Resilienza ai Lock Cloud OneDrive/Dropbox (`automazioni_powershell_e_resilienza.md`)**:
  - Aggiunto il Livello 4 alla Sezione 6: adozione obbligatoria del flag `--no-watch-fs` nei runner di build/test su Windows per azzerare gli errori di snapshot sui reparse points.

---

## 🚀 [v2.6.1] — 2026-09-04 (Pattern Silent Commit, Monotonic Suppression & Continuità Voxel Verticale)

### 🌟 Novità di Sistema, Accessibilità & Gameplay
- **Pattern "Silent Commit" per Feedback Concorrenti in Movimento (`accessibilita_videogiochi_e_gameplay.md`)**:
  - Codificata la Sezione 15: assorbimento atomico dello stato interno durante le finestre di soppressione temporanea per prevenire l'accumulo di differenziali di mutazione e l'annuncio posticipato di bersagli superati (Lag Mutation Alert).
  - Finestra di soppressione monotona crescente ($\max(T_{\text{active}}, T_{\text{now}} + \Delta T)$) per evitare accorciamenti accidentali da chiamate concorrenti.
  - Bypass assoluto a latenza zero ($0\text{ ms}$) per le interrogazioni manuali esplicite dell'utente.
- **Sonar Podometrico, Aggancio Micro-Voxel & Direct Dispatching (`accessibilita_videogiochi_e_gameplay.md`)**:
  - Consolidata la Sezione 14 sul sonar di marcia metro per metro lungo pareti uniformi e il campionamento micro-raymarch per lamine sottili.

---

## 🚀 [v2.6.0] — 2026-09-02 (Releases Hub, Component-Based Discovery & Starter Kit Immutabili Versionati)

### 🌟 Novità di Sistema, Distribuzione & Governance
- **Istituzione della Cartella `releases/` (Releases Hub)**:
  - Creata la cartella ufficiale `$hubRoot\releases\` nel Master Hub come sede esclusiva e centralizzata per tutti gli archivi ZIP distribuiti, eliminando l'inquinamento del Desktop.
- **Script di Esportazione Potenziato (`scripts/esporta_starter_kit_zip.ps1`)**:
  - *Component-Based Discovery*: Individuazione deterministica del Master Hub tramite i 5 marker strutturali (`knowledge_globale/`, `prompts/`, `templates/`, `scripts/`, `CHANGELOG.md`) per garantire portabilità su qualsiasi macchina o configurazione utente (zero hardcoding).
  - *Packaging Duale & Versioning Automatico*: Generazione dell'archivio storico immutabile `ASTRALIS_Universal_Starter_Kit_v{VERSIONE}.zip` e del puntatore `ASTRALIS_Universal_Starter_Kit_latest.zip`.
  - *Supporto Release Personalizzate*: Parametri dinamici `-Version`, `-CustomTag` (es. "luca-edition"), `-DestinationDir` e `-IncludeLatest`.
  - *Esclusione Ricorsiva & Staging Atomico*: Esclusione di `releases/` e `*.zip` durante la compressione su `$env:TEMP` per azzerare i lock cloud e l'annidamento ricorsivo.
- **Tutor Contestuale & Keybinding Introspection (`accessibilita_videogiochi_e_gameplay.md`)**:
  - Codificata la Sezione 11 (Tutor Vocale & Risoluzione Dinamica Tasti a Runtime) e la Sezione 12 (Calibrazione Hitbox Voxel per Salto Automatico Pilota).
- **Auto-Focus Menu di Pausa `Esc` (`accessibilita_videogiochi_e_gameplay.md`)**:
  - Codificata la Sezione 13 (Iniezione Auto-Focus Proattivo su `PauseScreen` & Zero Pre-Focus con Frecce Immediate).

---

## 🚀 [v2.5.5] — 2026-09-02 (Reattività Container Specialistici, Auto-Focus Dinamico & Disciplina JVM Deterministica)

### 🌟 Novità di Sistema & Governance
- **Reattività Container Specialistici & Auto-Focus Dinamico (`accessibilita_videogiochi_e_gameplay.md`)**:
  - Codificata la Sezione 10 con il pattern per GUI condizionali ed asincrone: tracciamento differenziale di stato $\rightarrow$ vocalizzazione quantitativa immediata $\rightarrow$ Smart Focus Relocation sul gruppo sbloccato (`selectGroupByKey`) e notifiche vocali discrete di fine ciclo.
- **Disciplina Runtime Gradle Deterministica (`standard_modding_e_runtime.md`)**:
  - Codificata la Sezione 7 per l'ancoraggio esplicito di `org.gradle.java.home` in `gradle.properties` al fine di eliminare i conflitti JVM in ambienti multi-JDK.
- **Benchmark Pilota su `minecraft-access`**:
  - Implementata e collaudata `Rev MC-26.4` con avanzamento alla versione locale **`v26.2-1.16.1`**.

---

## 🚀 [v2.5.4] — 2026-09-02 (Disciplina AVF nei Fork: Baseline Inception & Progressione Sovrana)

### 🌟 Novità di Sistema & Governance
- **Disciplina AVF nei Progetti Fork (Baseline & Progressione Sovrana)**:
  - Codificata in `clean_architecture_e_design_pattern.md` (Sezione 6.3) la regola per cui i fork si ancorano alla versione upstream di partenza (`Baseline Inception`) e avanzano progressivamente la numerazione interna nel diario sovrano, mantenendo la totale compatibilità con l'upstream (`## [Unreleased]`).
- **Consolidamento Auto-Apprendimento Fase 4**:
  - Testato e validato l'allineamento integrativo multi-macchina (Protocollo Onboarding e Protocollo Aggiornamento).

---

## 🚀 [v2.5.3] — 2026-09-02 (Disciplina Dual-Track nei Fork & Isolamento PR Upstream)

### 🌟 Novità di Sistema & Governance
- **Disciplina Universale del Doppio Binario nei Fork (Dual-Track Changelog)**:
  - Codificata in `standard_modding_e_runtime.md` (Sezione 6) e `catalogo_protocolli_operativi_astralis.md` (Protocollo 6) la gestione disaccoppiata per i progetti fork:
    * *Binario Pubblico Upstream*: Sezione `## [Unreleased]` in inglese puro nel `CHANGELOG.md` di radice per PR senza conflitti di versione;
    * *Binario Sovrano Personale*: Diario in italiano in `knowledge/` con versionamento semantico AVF a 3+1 livelli per la sovranità totale del fork.
- **Regola di Isolamento Assoluto delle Pull Request Upstream**:
  - Divieto tassativo di includere file di governance ASTRALIS (`gemini.md`, `knowledge/`, `docs/`) nei branch destinati a PR verso l'upstream.
- **Applicazione Pilota su `minecraft-access`**:
  - Creato il `CHANGELOG.md` pubblico in inglese con la ricostruzione integrale di tutte le feature implementate da inizio agosto a oggi;
  - Aggiornata la scheda `knowledge/03_standard_sviluppo_fork_pr.md` e allineato `knowledge/13_diario_modifiche_e_contributi_fork.md`.

---

## 🚀 [v2.5.2] — 2026-09-02 (Pattern RRU Disaccoppiato: Registro Attivo vs Archivio Storico)

### 🌟 Novità di Sistema & Governance
- **Istituzione del Pattern RRU Disaccoppiato**:
  - Separazione netta tra `docs/report/REGISTRO_REVISIONI.md` (registro attivo snello per le sole voci aperte o in lavorazione) e `docs/report/ARCHIVIO_REVISIONI.md` (memoria storica perenne delle revisioni collaudate e chiuse).
  - Ciclo di vita automatizzato: migrazione automatica delle voci collaudate in Fase 3/4 per mantenere i file attivi compatti (< 100 righe) e istantanei da consultare con screen reader NVDA.
- **Aggiornamento Template & Moduli**:
  - Creato `templates/ARCHIVIO_REVISIONI_TEMPLATE.md` e aggiornato `templates/REGISTRO_REVISIONI_TEMPLATE.md`.
  - Aggiornati `catalogo_protocolli_operativi_astralis.md` (Sezione RRU) e `abitudini_sviluppo_luca.md` (Sezione 11).
- **Allineamento a Cascata del Progetto Benchmark `minecraft-access`**:
  - Creato `docs/report/ARCHIVIO_REVISIONI.md` storicizzando le 7 revisioni/anomalie completate del 1 settembre.
  - Creato `docs/report/REGISTRO_REVISIONI.md` snello con le 2 revisioni aperte (Rev MC-26.4 e Rev MC-26.7).
  - Creato `knowledge/01_diario_modifiche_e_contributi_fork.md` in italiano per la disciplina I18N del fork.
  - Aggiornato `gemini.md` locale agli 11 protocolli con Indice Ragionato a micro-sommari inline.

---

## 🚀 [v2.5.1] — 2026-09-02 (Consolidamento Fase 4: Rollback Bonifica & Quarantena Letteraria)

### 📚 Documentazione & Auto-Apprendimento
- **Consolidamento del Testing & Debug**:
  - Inserita la Sezione 5 in `strategie_testing_e_debug.md` definendo la doppia barriera di verifica post-pulizia, la clausola di rollback automatico istantaneo e l'ispezione dinamica retroattiva.
- **Consolidamento del Profilo di Scrittura Creativa**:
  - Inserita la Sezione 3 in `metodo_scrittura_creativa.md` sancendo la Regola Aurea di Zero Cancellazione e la Quarantena Letteraria in `archivio_bozze/` e `note_pregresse/`.

---

## 🚀 [v2.5.0] — 2026-09-02 (Architettura a 11 Protocolli, Protocollo Pulizia, Trittico Inviolabile & Version Coherence Guard)

### 🌟 Novità di Sistema & Governance
- **Formalizzazione dell'11° Protocollo Operativo Ufficiale**:
  - Inserito il **Protocollo 11 — Pulizia & Bonifica *(Code & Asset Grooming / Dead Code Purge)*** a Doppio Binario (Astratto Globale + Specializzazioni Concrete sui 5 Domini).
  - Implementata la **Strategia a 5 Barriere di Sicurezza**:
    * *Barriera 1*: Audit a Doppia Chiave (Statica + Dinamica per JSON/I18N/Reflection con protezione per default degli identificatori dinamici);
    * *Barriera 2*: Prospetto di Bonifica Lineare per NVDA (Dry-run ad alto segnale con ID e livello di rischio `BASSO`, `MEDIO`, `ALTO`);
    * *Barriera 3*: Gating Semantico & Scelta Granulare dell'Utente (Regola 0 / Zero decisioni autonome);
    * *Barriera 4*: Quarantena di Sicurezza Reversibile & Snapshot (Zero Data Loss, divieto assoluto di cancellazione per Scrittura Creativa con archiviazione in `archivio_bozze/`);
    * *Barriera 5*: Compilazione, Test di Non-Regressione & Rollback Automatico a 1-Click.
- **La Regola del Trittico Inviolabile di Rilascio di Root**:
  - Vincolo procedurale: allineamento atomico e contestuale di `CHANGELOG.md`, `README.md` e `ISTRUZIONI_DI_AVVIO.md` prima di qualsiasi rilascio o esportazione Starter Kit.
- **Version Coherence Guard in `scripts/aggiorna_ecosistema.ps1`**:
  - Controllo dinamico automatico che verifica matematicamente che l'intestazione di versione dei file del Trittico coincida all'unisono (`v2.5.0`).
- **Specializzazione Polimorfica di Bonifica sui 5 Domini**:
  - Codificate in `abitudini_sviluppo_luca.md` (Sezione 15) e `clean_architecture_e_design_pattern.md` (Sezione 7) le direttive specifiche per Gaming/Modding, Addon NVDA, Python, PowerShell e Scrittura Creativa.

---

## 🚀 [v2.4.4] — 2026-09-02 (Allineamento Istruzioni di Avvio & Casi Particolari)

### 📚 Documentazione & Starter Kit
- **Allineamento ISTRUZIONI_DI_AVVIO.md con i Casi Particolari**:
  - Inserita la Sezione *Gestione Automatica dei Casi Particolari* con istruzioni esplicite per screen reader NVDA su:
    * Ricostruzione Storica Retroattiva per progetti legacy privi di changelog (da `git log` / `docs/`);
    * Triage e proposta proattiva di inizializzazione per progetti *Candidati Onboarding*;
    * Disciplina deterministica di versionamento AVF (`V.A.R[.M]`) e tutela dei changelog storici.
  - Rimossi tutti i refusi e riferimenti residui a versioni precedenti.

---

## 🚀 [v2.4.3] — 2026-09-02 (Consolidamento Fase 4: Disciplina AVF in Abitudini Sviluppo)

### 📚 Documentazione & Auto-Apprendimento
- **Consolidamento del Profilo & Consuetudini**:
  - Inserita la Sezione 14 in `abitudini_sviluppo_luca.md` codificando l'applicazione di AVF nei 3 momenti della pipeline (Fase 1A stima, Fase 3 calcolo deterministico, Fase 4 incremento per lezioni apprese).

---

## 🚀 [v2.4.2] — 2026-09-02 (Disciplina di Versionamento Semantico Esteso a 3+1 Livelli AVF)

### 🌟 Novità di Sistema & Governance
- **Istituzione della Disciplina AVF (Astralis Versioning Framework)**:
  - Codifica della specifica deterministica a 4 cifre (`V.A.R[.M]`):
    * *1ª Cifra V (Versione / Major)*: Grandi salti architetturali, breaking changes o nuovi Volumi narrativi (`X.0.0[.0]`);
    * *2ª Cifra A (Aggiornamento / Minor / Feature)*: Nuove funzionalità, moduli o capitoli senza rottura (`X.Y.0[.0]`);
    * *3ª Cifra R (Revisione / Patch / PRAPI)*: Bugfix, rifiniture post-collaudo e consolidamento Fase 4 (`X.Y.Z[.0]`);
    * *4ª Cifra M (Micro-Fix / Hotfix / Doc — Facoltativa)*: Typo, rifiniture di documentazione o commenti (`X.Y.Z.W`);
  - Inserita la Sezione 6 in `clean_architecture_e_design_pattern.md` con l'albero decisionale matematico per la proposta in Fase 3;
  - Aggiornato il Protocollo 6 (Chiusura Tecnica) con il passaggio operativo di calcolo deterministico del numero di versione;
  - Aggiornato `templates/CHANGELOG_PROGETTO_TEMPLATE.md` con il formato `V.A.R[.M]` e `templates/PIANO_TECNICO_TEMPLATE.md` con il metadato di stima incremento versione.

---

## 🚀 [v2.4.1] — 2026-09-02 (Architettura dei 10 Protocolli, Polimorfismo di Governance, RRU & Telemetria Live)

### 🌟 Novità di Sistema & Governance
- **Formalizzazione della Matrice dei 10 Protocolli Operativi Ufficiali**:
  - Inserimento del **Protocollo 4 — Telemetria & Monitoraggio in Tempo Reale**: ispezione continua e denoising dei file di log (`latest.log`, `nvda.log`) in tempo reale durante i collaudi (Fase 2) con popolamento proattivo delle anomalie.
  - Estensione del **Protocollo 2 — Validazione**: integrazione obbligatoria della **Matrice di Simulazione Scenari a 3 Livelli** (Scenari Comuni / Happy Path, Scenari Meno Comuni / Concorrenza, Casi Limite / Corner Cases & Boundary Values) a valle dei 7 Assi di Qualità.
  - Universalizzazione del **Protocollo 5 — Revisione & Affinamento Post-Implementazione (PRAPI)**: ciclo rapido di refinement in 4 passi esteso a tutti i 5 domini applicativi.
  - Blindatura del **Protocollo 8 — Aggiornamento Ecosistema**: Smart Merge a 5 fasi, Isola Protetta Globale e Locale, scansione a cascata del workspace con triage progetti e **Audit di Conformità Post-Aggiornamento**.
  - Blindatura del **Protocollo 9 — Onboarding**: Bootstrap zero-config per macchine pulite in 3 domande con generazione automatica dell'albero documentale.
- **Polimorfismo di Governance & Specializzazione Gerarchica**:
  - Distinzione netta tra *Framework Astratto Globale* (Master Hub / Livello 0) che definisce le linee guida universali e *Specializzazione Concreta Locale* (Singolo Progetto / Livello 2) che definisce le regole operative specializzate nel proprio `GEMINI.md` e schede `knowledge/`.
- **Registro Revisioni Universale (RRU) Proattivo**:
  - Standardizzazione dell'artefatto vivo di revisione per tutti i progetti in `docs/report/REGISTRO_REVISIONI.md`;
  - Innesco automatico proattivo durante il collaudo (l'assistente registra i feedback senza richiesta esplicita) con comando di riallineamento di sicurezza;
  - Nuovo template ufficiale `templates/REGISTRO_REVISIONI_TEMPLATE.md`.
- **Tutela Integrale dell'Auto-Apprendimento a Doppio Binario**:
  - *Binario B (Globale)*: Quadruplo presidio su `knowledge_globale/` (Isola Protetta Utente nel Genoma Livello 0, smart merge a sezioni nei moduli tematici, auto-indicizzazione di moduli custom globali nel Dispatcher e snapshot di sicurezza preventivo).
  - *Binario A (Locale)*: Preservazione al 100% di tutte le schede `knowledge/` locali create nelle sessioni di Auto-Apprendimento durante gli aggiornamenti di progetto.
- **Smart Index & Micro-Sommari nei `GEMINI.md`**:
  - Inserimento di micro-sommari inline di 6-8 parole nella Sezione 4 del `GEMINI.md` Globale e negli indici locali;
  - Disaccoppiamento confermato: il `README.md` pubblico di root resta dedicato esclusivamente alla documentazione del software.
- **Dogfooding nel Master Hub & Registro Meta-Revisioni**:
  - Creazione della struttura `docs/` (`docs/piani/attivi/`, `docs/piani/completati/`, `docs/report/`) nel Master Hub;
  - Istituzione del Registro Meta-Revisioni perenne in `docs/report/REGISTRO_REVISIONI_ASTRALIS.md` (censite Rev AST-2.1 fino ad AST-2.9).
- **Audit & Validazione di Conformità Post-Aggiornamento**:
  - Autoverifica sistematica a fine aggiornamento su assenza di contraddizioni, ridondanze riverberate tra livelli e link rotti, con emissione della Ricevuta di Conformità per NVDA.

---

## 🚀 [v2.3.1] — 2026-08-31 (Incoronazione ASTRALIS, 8 Protocolli Operativi & Smart Merge)

### 🌟 Novità di Sistema & Governance
- **Incoronazione Ufficiale del Framework ASTRALIS**:
  - Adozione del nome ufficiale **ASTRALIS** (*Adaptive Standards for Testing, Rules, Accessibility & Level Integration Systems*).
- **Codifica della Gerarchia degli 8 Protocolli Operativi Ufficiali**:
  - Nuova scheda specialistica `knowledge_globale/03_architettura_e_metodologie/catalogo_protocolli_operativi_astralis.md`.
  - Definizione formale degli 8 Protocolli: *Protocollo Progettazione*, *Protocollo Validazione (7 Assi)*, *Protocollo Esecuzione*, *Protocollo Chiusura*, *Protocollo Apprendimento*, *Protocollo Aggiornamento*, *Protocollo Onboarding*, *Protocollo Sicurezza*.
  - **Regola del Riconoscimento Semantico Flessibile & Feedback di Aggancio**: L'assistente riconosce qualsiasi formulazione naturale equivalente e dichiara esplicitamente a inizio risposta il protocollo attivo.
- **Aggiornamento Integrativo & Smart Merge (Livello 0)**:
  - Rilevamento automatico e differenziale di regole, consuetudini e istruzioni custom create dall'utente in `~/.gemini/config/GEMINI.md` o in `knowledge_globale/`.
  - Notifica esplicita di *"Aggiornamento Integrativo"* e fusione non-distruttiva a sezioni protette (`## 🧩 REGOLE & CONSUETUDINI PERSONALIZZATE DELL'UTENTE`).
- **Scansione & Retrofit Integrativo a Cascata dei Progetti (Livello 1 e 2)**:
  - Scansione ricorsiva di tutti i workspace/progetti aperti; allineamento delle meta-regole nei `GEMINI.md` e della conoscenza locale in `knowledge/` preservando tutte le specificità e consuetudini locali.
- **Gestione Standardizzata del Changelog di Progetto & Ricostruzione Storica**:
  - Nuovo template `templates/CHANGELOG_PROGETTO_TEMPLATE.md` in italiano per i progetti personali.
  - Distinzione netta tra Progetti Personali (`CHANGELOG.md` alla radice) e Fork Open-Source (`knowledge/01_diario_modifiche_e_contributi_fork.md` in italiano per non alterare il changelog upstream per le PR).
  - *Ricostruzione Retroattiva da Git*: Se il file manca, viene generato e popolato estraendo la cronologia reale dai commit (`git log`) e dai documenti di implementazione completati.
- **Aggiornamento Script & Governance Tools**:
  - `scripts/esporta_starter_kit_zip.ps1` aggiornato con il pacchetto ufficiale `ASTRALIS_Universal_Starter_Kit.zip`.
  - `scripts/aggiorna_ecosistema.ps1` potenziato con verifica protocolli, diagnostica regole custom e scansione progetti.
  - `scripts/bootstrap_progetto.ps1` aggiornato con il Passo 6 per la creazione automatica del `CHANGELOG.md`.

---

## 🚀 [v2.3.0] — 2026-08-30 (Upgrade In-Place & Protocollo Self-Healing)

### 🌟 Novità di Sistema & Governance
- **Master Prompt di Aggiornamento Ufficiale (`PROMPT_AGGIORNAMENTO_ECOSISTEMA_ESISTENTE.md`)**:
  - Procedura guidata in 5 fasi per eseguire l'aggiornamento in-place su macchine con versioni precedenti dell'ecosistema.
  - Fusione non-distruttiva del Genoma Globale (Livello 0) con preservazione del 100% dell'identità utente, accessibilità NVDA/tastiera e percorsi configurati.
- **Protocollo di Ripristino Automatico (Self-Healing)**:
  - Rilevamento e ripristino proattivo automatico nel caso in cui sulla macchina di destinazione manchino file essenziali come `CHANGELOG.md`, `README.md`, `ISTRUZIONI_DI_AVVIO.md`, template o moduli di `knowledge_globale/`.
- **Nuove Istruzioni di Avvio a Bivio Rapido (`ISTRUZIONI_DI_AVVIO.md`)**:
  - Separazione lineare e chiara per screen reader tra *Opzione A: Prima Installazione da Zero* e *Opzione B: Aggiornamento In-Place*.
- **Script Ausiliario di Verifica & Backup (`scripts/aggiorna_ecosistema.ps1`)**:
  - Utility PowerShell per audit di integrità dei moduli, backup preventivo timestampato del file `GEMINI.md` globale e validazione dell'ambiente.

---

## 🚀 [v2.2.0] — 2026-08-30 (Le 4 Meta-Regole Operative Universali)

### 🌟 Standardizzazione & Governance Globale
- **La Regola del Deploy Proattivo in Fase 2 (Zero Attrito di Collaudo)**:
  - Obbligo per Antigravity di compilare e distribuire automaticamente l'artefatto nelle istanze attive prima di richiedere il test a Luca.
- **La Doppia Barriera di Backup (Fase 3)**:
  - Aggiornamento dei backup stabili su cloud/OneDrive esclusivamente **POST-CONVALIDA positiva** e collaudo confermato da Luca.
- **Protocollo di Resilienza ai Lock Transitori Cloud (OneDrive/Dropbox Anti-Snapshot Pattern)**:
  - Uso sistematico di flag `--no-daemon`, staging su `$env:TEMP` e pulizia selettiva della cartella `build/` in caso di lock da parte del cloud sync.
- **Standardizzazione del Genoma Globale (Livello 0)**:
  - Allineamento di `~/.gemini/config/GEMINI.md`, `abitudini_sviluppo_luca.md`, `strategie_testing_e_debug.md` e `GEMINI_TEMPLATE.md`.
