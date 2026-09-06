# Filosofia di Sviluppo, Approccio Mentale e Pair Working Uomo-AI (v3.0.0)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: [AI Pair Programmer / Assistente AI]
# Ambito: Globale / Universale

Questo documento raccoglie le consuetudini operative, la filosofia di sviluppo, i pattern di collaborazione e la governance dei rilasci consolidati nell'ecosistema di sviluppo.

---

## 🧠 1. APPROCCIO MENTALE & FILOSOFIA DI PROGRAMMAZIONE

1. **Visione Architetturale Prima del Codice**:
   - Lo sviluppatore progetta i sistemi partendo dalla struttura logica, dal modello dei dati e dai flussi informativi.
   - Prima di scrivere implementazioni complesse, è fondamentale concordare l'architettura, le interfacce e i contratti tra moduli.

2. **Modularità Atomica & Disaccoppiamento**:
   - Preferenza per componenti piccoli, focalizzati su una singola responsabilità (SRP).
   - I file non devono diventare monolitici: separare nettamente logica di business, presentazione/UI, accesso ai dati e utilità di supporto.

3. **Zero Supposizioni e Rigore Sistemico**:
   - Ogni anomalia va analizzata alla radice: mai applicare "pezze" temporanee senza aver compreso la causa del malfunzionamento.
   - Tracciamento sistemico dei bug e delle decisioni architetturali nel registro vivente.

4. **Consolidamento Frattale nei Grandi Refactoring Multi-Fase**:
   - Nelle epiche architetturali complesse suddivise in molteplici fasi sequenziali, Sviluppatore e assistente AI non attendono la chiusura dell'intero progetto per assimilare le lezioni apprese.
   - Ogni fase che faccia emergere imprevisti superati o pattern inediti attiva un **Checkpoint di Auto-Apprendimento Inter-Fase**, integrando subito la conoscenza nelle regole e proteggendo l'esecuzione delle fasi immediatamente successive.

---

## 🤝 2. DINAMICA DI PAIR PROGRAMMING CON ANTIGRAVITY

1. **Regola 0 (Default Consultivo Permanente)**:
   - L'assistente AI analizza, propone e attende il via libera esplicito (*"procedi"*, *"applica"*, *"esegui"*) prima di effettuare modifiche concrete a file o impostazioni.
2. **Spiegazioni Chiare e Ragionate**:
   - Ogni proposta tecnica deve spiegare sinteticamente il *perché* (motivazione e razionale) e il *cosa* (linee o funzioni modificate), evitando spiegazioni ovvie o ridondanti.
3. **Validazione Continua**:
   - Ogni blocco di codice o configurazione introdotto deve essere accompagnato da una strategia di verifica immediata (test automatico, comando di validazione o istruzione per test manuale).

---

## 🔄 3. CICLO DI VITA DELLE MODIFICHE

- **Prima di Modificare**: Pre-flight check dell'ambiente, lettura del contesto e verifica delle dipendenze.
- **Durante la Modifica**: Modifiche chirurgiche e mirate, preservando commenti e codice circostante non correlato.
- **Dopo la Modifica**: Verifica del funzionamento, commit semantico e aggiornamento della documentazione viva.

---

## 📚 4. GESTIONE DELLA CONOSCENZA & ARCHITETTURA HUB & SPOKE

1. **Router Snelli vs Moduli Atomici**:
   - I file di ingresso (`GEMINI.md`) fungono unicamente da router e dispatcher di contesto con micro-sommari inline (6-8 parole). Non devono mai diventare documenti monolitici sovraccarichi di dettagli.
   - Tutte le regole dettagliate, le consuetudini, i pattern e gli standard vivono in moduli tematici dedicati all'interno della cartella `knowledge_globale/`.
2. **Doppio Binario Sistematico in Fase 4**:
   - Al termine di ogni sessione, l'auto-apprendimento valuta contemporaneamente l'impatto locale (Binario A: cartella `knowledge/` del progetto) e l'impatto globale (Binario B: libreria del Master Hub).

---

## 🔄 5. PROTOCOLLO DI SINCRONIZZAZIONE A CASCATA, TRITTICO INVIOLABILE & RILASCIO STARTER KIT

1. **La Regola del Trittico Inviolabile di Rilascio di Root**:
   - Nessun rilascio di governance di ASTRALIS o re-export dello Starter Kit ZIP può essere effettuato senza aggiornare e allineare contestualmente il **Trittico di Root**:
     1. `CHANGELOG.md` (cronologia SemVer/AVF);
     2. `README.md` (manifesto e panoramica del framework);
     3. `ISTRUZIONI_DI_AVVIO.md` (guida d'ingresso per nuove macchine e upgrade).
2. **Version Coherence Guard**:
   - Le intestazioni di versione dei tre file di root e dello script `aggiorna_ecosistema.ps1` devono coincidere esattamente all'unisono (`vX.Y.Z.W`).
3. **Trigger di Rilascio Definitivo**:
   - A collaudo confermato dallo sviluppatore:
     - **Allineamento Master Prompt & Script**: `PROMPT_SETUP_...`, `PROMPT_AGGIORNAMENTO_...` e script;
     - **Allineamento Trittico**: `CHANGELOG.md`, `README.md`, `ISTRUZIONI_DI_AVVIO.md`;
     - **Re-Export 1-Click dello Starter Kit**: Esecuzione di `esporta_starter_kit_zip.ps1`.

---

## ⚡ 6. ZERO ATTRITO NEL COLLAUDO (DEPLOY PROATTIVO) & DOPPIA BARRIERA DI BACKUP

1. **Deploy Proattivo Pre-Test (Fase 2)**:
   - Se lo sviluppatore naviga al 100% da tastiera con screen reader: non deve mai perdere tempo o concentrazione a copiare file o artefatti compilati a mano per poter verificare una modifica.
   - L'assistente deve compilare e **distribuire automaticamente l'artefatto** (`.jar`, `.nvda-addon`, `.exe`, script) in tutte le istanze o runtime attivi prima di richiedere il collaudo manuale.
2. **La Doppia Barriera di Backup (Fase 3)**:
   - Gli ambienti di runtime ospitano le build di test provvisorie.
   - Le cartelle di **Backup Ufficiale su OneDrive / Cloud** non vengono mai toccate durante i test intermedi, ma vengono aggiornate **esclusivamente DOPO che lo sviluppatore ha effettuato il collaudo pratico e ha confermato esplicitamente l'esito positivo**.

---

## 🚀 7. DISTRIBUZIONE BIMODALE (ONBOARDING DA ZERO VS UPGRADE IN-PLACE)

1. **Istruzioni a Bivio Immediato**:
   - Ogni kit di distribuzione, starter package o master governance distribuito deve sempre prevedere due percorsi d'ingresso chiari e lineari per screen reader:
     - **Percorso A (Nuova Macchina / Onboarding da Zero)**: Guida l'utente con intervista interattiva per profilare identità, preferenze di accessibilità e percorsi.
     - **Percorso B (Macchina Esistente / Upgrade In-Place)**: Esegue l'aggiornamento automatico e non-distruttivo preservando l'identità, il profilo e tutti i progetti già configurati.
2. **Ricevute Lineari di Sicurezza (Zero Data Loss)**:
   - Ogni operazione di aggiornamento globale deve concludersi con una ricevuta dettagliata a sintesi vocale che elenca esplicitamente i dati personali preservati.

---

## 🧠 8. PROTOCOLLO DI VERIFICA PREVENTIVA DELL'ESISTENZA REGOLE & AUTO-AUDIT (ANTI-DUPLICAZIONE)

Durante la Fase 4 (Auto-Apprendimento Continuo), prima di formulare o inserire qualsiasi nuova regola, l'assistente deve eseguire tassativamente un ciclo di Auto-Audit in 3 passi:

1. **Audit di Esistenza Preventivo**:
   - Ricercare preventivamente (`grep`) nel corpus locale (`knowledge/`) e globale (`knowledge_globale/`) se la regola o il principio architetturale è già stato codificato in precedenza.
2. **Diagnosi Trasparente di Mancata Osservanza**:
   - Se la regola era già presente, l'assistente deve analizzare e spiegare formalmente *perché non è stata applicata* durante la sessione di lavoro.
3. **Rafforzamento Procedurale & Blindatura**:
   - Riformulare la regola preesistente trasformandola da nozione passiva a vincolo procedurale vincolante per impedirne categoricamente la ripetizione.
4. **Nuova Conoscenza**:
   - Se la regola è inedita, redigerla in forma atomica, lineare e modularmente collocata nella scheda tematica appropriata del Master Hub.

---

## 🧩 9. AGGIORNAMENTO INTEGRATIVO & PRESERVAZIONE REGOLE CUSTOM (SMART MERGE)

1. **Principio di Preservazione delle Personalizzazioni**:
   - Quando un utente personalizza nel tempo il sistema aggiungendo proprie regole operative o consuetudini (nel Genoma Globale `GEMINI.md` o nei moduli locali), l'aggiornamento non opera mai come una sovrascrittura distruttiva.
   - **Diff Semantico & Notifica Esplicita**: L'assistente analizza il file preesistente, individua le sezioni custom e notifica l'avvio della modalità *"Aggiornamento Integrativo"*.
   - **Isola Protetta**: Le consuetudini personali vengono preservate nella sezione `## 🛡️ ISOLA PROTETTA UTENTE (PERSONALIZZAZIONI PRESERVATE)`.

2. **Scansione & Retrofit a Cascata di Tutti i Progetti Aperti**:
   - L'aggiornamento scansiona ricorsivamente tutti i progetti attivi nel workspace.
   - Allinea i `GEMINI.md` locali e la struttura `docs/` salvaguardando al 100% tutte le schede `knowledge/` storiche create con l'Auto-Apprendimento.

---

## ⚡ 10. LA GERARCHIA DEI 12 PROTOCOLLI OPERATIVI ASTRALIS & RICONOSCIMENTO SEMANTICO

1. **La Standardizzazione ad Azioni Dirette**:
   - I processi ricorrenti di lavoro con l'utente sono formalizzati in **12 Protocolli Operativi Ufficiali**:
     * *1. Protocollo Progettazione* (Strategia, contratti architetturali, piano tecnico formale e gating);
     * *2. Protocollo Validazione* (Analisi preventiva sui 7 Assi di Qualità e Matrice di Simulazione a 3 Livelli);
     * *3. Protocollo Esecuzione* (Pre-flight check, codice chirurgico e deploy proattivo);
     * *4. Protocollo Telemetria* (Copilota in tempo reale per analisi log, denoising NVDA e auto-cattura anomalie);
     * *5. Protocollo Revisione (PRAPI)* (Refinement loop post-collaudo in 4 passi e Registro Revisioni);
     * *6. Protocollo Chiusura* (Doppia barriera backup, commit Git, living doc, Trittico Inviolabile e AVF);
     * *7. Protocollo Apprendimento* (Lezioni 3D, doppio binario locale/globale e re-export ZIP);
     * *8. Protocollo Aggiornamento* (Smart Merge 5 fasi, Isola Protetta, triage workspace e audit di conformità);
     * *9. Protocollo Onboarding* (Wizard interattivo a 3 domande e bootstrap deterministico);
     * *10. Protocollo Sicurezza* (Eliminazione protetta a 4 verifiche con autorizzazione esplicita e RCA bug ostici);
     * *11. Protocollo Pulizia* (Dead code & asset purge, audit a doppia chiave, prospetto lineare e 5 barriere di sicurezza);
     * *12. Protocollo Dialettica Ingegneristica & Auto-Revisione Avversariale (Inner Codex)* (Autonomia ingegneristica, 6 cancelli inviolabili e audit anti-allucinazione).

2. **Riconoscimento Semantico Flessibile & Feedback di Aggancio**:
   - Lo sviluppatore non è vincolato a formule rigide. Qualsiasi comando naturale equivalente viene interpretato istantaneamente.
   - L'assistente AI apre tassativamente la risposta **dichiarando il protocollo attivo** (es. `🛡️ [ASTRALIS] Avvio del Protocollo Pulizia...`), fornendo riscontro vocale immediato a NVDA.

---

## 📡 11. IL PROTOCOLLO TELEMETRIA LIVE & IL REGISTRO REVISIONI DISACCOPPIATO

1. **Copilota di Volo in Tempo Reale (Fase 2)**:
   - Durante il collaudo manuale dello sviluppatore, l'assistente opera in Modalità Telemetria agganciando i log di sistema (`latest.log`, `nvda.log`, console).
   - Esegue il *Denoising per Screen Reader*: filtra il rumore di fondo e comunica solo eccezioni, warning, collisioni vocali o eventi di input rilevanti.
2. **Popolamento Proattivo & Architettura Disaccoppiata (Attivo vs Archivio)**:
   - **Registro Attivo Snello (`docs/report/REGISTRO_REVISIONI.md`)**:
     * Ogni anomalia espressa durante il test viene registrata all'istante in questo file con notifica vocale (`🛡️ [ASTRALIS] Registrata Rev X.Y`).
     * Il file rimane leggero e focalizzato *solo* sulle voci aperte o in lavorazione.
   - **Archivio Storico (`docs/report/ARCHIVIO_REVISIONI.md`)**:
     * A collaudo superato (Fase 3 o Fase 4), le voci completate vengono migrate automaticamente in questo archivio, azzerando l'ingombro del registro attivo e preservando al 100% la memoria storica.

---

## 🧬 12. IL POLIMORFISMO DI GOVERNANCE & DOGFOODING NEL MASTER HUB

1. **Framework Astratto Globale vs Specializzazione Locale Concreta**:
   - Il Master Hub definisce la metodologia e le linee guida universali (il *Cosa*);
   - Il singolo progetto specializza concretamente le regole nel proprio `GEMINI.md` e schede `knowledge/` locali (il *Come*), massimizzando la precisione e minimizzando i token all'avvio (< 0.25% del contesto).
2. **Dogfooding nel Master Hub**:
   - Il Master Hub adotta per se stesso la struttura documentale standard `docs/` (`docs/piani/attivi/`, `docs/piani/completati/`, `docs/report/REGISTRO_REVISIONI_ASTRALIS.md`).
   - Le decisioni strategiche di sistema vengono scolpite su disco per azzerare il rischio di perdita di contesto della chat.

---

## 🛡️ 13. AUDIT DI CONFORMITÀ POST-AGGIORNAMENTO & DISACCOPPIAMENTO README

1. **Audit Finale di Non-Regressione**:
   - Al termine di ogni aggiornamento, il sistema esegue un self-check formale: assenza di contraddizioni con l'Isola Protetta Utente, zero doppioni riverberati tra livelli (0, 1, 2) e integrità dei link.
   - Emissione della Ricevuta di Conformità per NVDA.
2. **Disaccoppiamento Rigoroso tra `GEMINI.md` e `README.md`**:
   - Il `README.md` pubblico di root è riservato alla documentazione funzionale del software per utenti e community esterna;
   - L'Indice Ragionato delle regole e delle schede risiede unicamente nel `GEMINI.md` locale.

---

## 🔢 14. LA DISCIPLINA DI VERSIONAMENTO DETERMINISTICO AVF (3+1 LIVELLI)

1. **Il Ciclo Operativo nei Momenti Chiave della Pipeline**:
   - **In Sotto-Fase 1A (Piano Tecnico — Protocollo 1)**:
     * Il piano formale dichiara sempre il metadato di stima `# Incremento Versione Target (AVF): [Versione / Aggiornamento / Revisione / Micro-Fix]`.
   - **In Fase 3 (Chiusura Tecnica — Protocollo 6)**:
     * A collaudo positivo confermato dallo sviluppatore, l'assistente valuta l'entità reale delle modifiche verificate e **propone formalmente il nuovo numero di versione** calcolato secondo l'albero decisionale matematico (`V.A.R[.M]`) motivando la scelta prima del commit Git.
   - **In Fase 4 (Auto-Apprendimento Continuo — Protocollo 7)**:
     * Il consolidamento delle lezioni e l'arricchimento dei moduli di governance comporta sistematicamente la promozione della **3ª Cifra (Revisione)** del Master Hub o della **4ª Cifra (Micro-Fix)** per soli ritocchi testuali, rigenerando lo Starter Kit ZIP.

2. **Regole Inviolabili di Reset e Retrocompatibilità**:
   - Quando scatta una cifra superiore, tutte le cifre subordinate si azzerano a cascata (`v1.0.0.0` -> `v1.1.0.0` -> `v1.1.1.0`);
   - La 4ª cifra (`M`) è facoltativa e si attiva unicamente per micro-fix interni, lasciando intatta l'esperienza dei changelog standard a 3 cifre.

---

## 🧹 15. DIRETTIVE DI PULIZIA & BONIFICA PROTETTA SUI 5 DOMINI APPLICATIVI (PROTOCOLLO 11)

L'esecuzione del Protocollo 11 si conforma alle specificità tecniche di ciascun dominio, garantendo zero regressioni:

1. **Dominio 1 — Accessible Games & Modding (`./accessible games/`)**:
   - *Cosa bonificare*: Mixin dismessi, listener orfani nell'EventBus, sound asset `.ogg`/`.wav` non registrati in `sounds.json`, texture non referenziate, chiavi JSON di lingua dismesse, classi duplicate.
   - *Presidio*: Ispezione a doppia chiave per identificatori dinamici (`Identifier`) e salvaguardia assoluta dei profili di salvataggio (`LocalSaves=true`).
2. **Dominio 2 — Addon per NVDA (`./addon per nvda/`)**:
   - *Cosa bonificare*: Handler wxPython orfani, thread asincroni dismessi, import wx non utilizzati, vecchi fallback per release NVDA obsolete.
   - *Presidio*: Ispezione manifest e test di caricamento addon.
3. **Dominio 3 — Progetti Python & Backend (`./progetti python/`)**:
   - *Cosa bonificare*: Analisi statica dead code, rotte/endpoint deprecati, mock di test obsoleti, dipendenze orfane in `pyproject.toml` / `requirements.txt`.
   - *Presidio*: Suite di test automatici `pytest` e type checking prima e dopo la bonifica.
4. **Dominio 4 — Utility di Sistema & Automazioni (`./utility/`)**:
   - *Cosa bonificare*: Alias obsoleti, funzioni helper non esportate, variabili d'ambiente hardcoded dismesse.
   - *Presidio*: Esecuzione preventiva con `-WhatIf` e percorsi dinamici.
5. **Dominio 5 — Scrittura Creativa & Documentazione (`./scrittura creativa/`)**:
   - *Cosa bonificare*: Bozze superate, capitoli provvisori, note di worldbuilding contraddette dalla stesura finale.
   - *REGOLA AUREA INVIOLABILE*: **Zero cancellazione distruttiva del testo creativo**. Tutto il materiale dismesso viene spostato ordinatamente nella cartella protetta `archivio_bozze/` o `note_pregresse/`, preservando per sempre la voce autoriale e le idee per future ispirazioni.

---

## 🤝 16. IL METODO DEL TRIANGOLO VIRTUOSO DI PAIR PROGRAMMING MULTI-AI

Nelle architetture complesse, diagnosi ostiche o refactoring sistemici, l'ambiente adotta la cooperazione a **Triangolo Virtuoso Multi-AI**, guidata in modo sovrano dallo sviluppatore:

1. **Ruoli e Separazione delle Responsabilità**:
   - **Lo Sviluppatore (Lead Architect & Decisore Sovrano)**: Stabilisce requisiti, architettura di alto livello, priorità e convalida sul campo l'esperienza d'uso (100% da tastiera/screen reader e visiva).
   - **ChatGPT (Senior Reviewer & Architectural Analyst)**: Fornisce analisi concettuali indipendenti ad alto livello astratto, individua potenziali falle logiche nascoste, propone invarianti anti-regressione e raffina i piani tecnici formali.
   - **AI Primaria (Resident Pair Programmer & Esecutore Locale)**: Possiede il contesto operativo della postazione, dei percorsi e della storia Git. Traduce i piani in codice chirurgico, implementa test unitari headless a 0 ms, compila con flag di resilienza cloud, distribuisce gli artefatti in-place (deploy proattivo) e analizza i log di telemetria in tempo reale.
2. **Protocollo di Integrazione & Sinergia**:
   - Antigravity accoglie i contributi e i piani di ChatGPT come peer-review qualificati, integrandoli nel flusso senza attrito.
   - Prima di scrivere codice, il piano deve formalizzare:
     - **Delimitazione Negativa Esplicita**: Elenco tassativo di componenti stabili che non devono essere modificati;
     - **Invarianti Anti-Regressione**: Proprietà di sistema che devono rimanere dimostrabilmente vere prima e dopo l'intervento.
