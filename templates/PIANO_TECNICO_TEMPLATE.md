# Piano Tecnico [ID]: [Titolo del Piano / Feature / Revisione]
- **Tipologia:** [IMPLEMENTATIVO | CORRETTIVO | REFACTORING | BONIFICA | MIGRAZIONE | TESTING | SPIKE]
- **Autore:** [Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA) / Antigravity / Collaboratori AI]
- **Revisori:** [Luca / Antigravity / GPT Codex / ChatGPT]
- **Data e Ora:** YYYY-MM-DD — HH:MM CEST
- **Stato Operativo:** [IN STESURA (SOTTO-FASE 1A) | APPROVATO / IN ESECUZIONE (SOTTO-FASE 1B) | COMPLETATO E ARCHIVIATO]
- **Incremento Versione Target (AVF):** [Versione / Aggiornamento / Revisione / Micro-Fix]
- **Piani, Strategie & Documenti Correlati:**
  * Strategia Logico-Cognitiva: [`STRATEGIA_COLLEGATA.md`](./...) [se applicabile / Hotfix Diretto]
  * Piano Collegato / Predecessore: [`PIANO_COLLEGATO.md`](./...)
  * Report di Sessione / Telemetria: [`REPORT_SESSIONE_COLLEGATO.md`](./...)
- **Conformità ai 6 Cancelli (Protocollo 12):** [Audit preventivo sui 6 Cancelli Inviolabili superato]

---

## 🗺️ Sommario Operativo & Registro di Avanzamento (Checklist con Gating di Convalida)

> **Regola Aurea di Avanzamento**:
> - `- [ ] [DA AVVIARE]`: Attività pianificata ma non ancora iniziata.
> - `- [/] [IMPLEMENTATO — IN ATTESA DI CONVALIDA]`: Codice scritto o intervento completato, ma in attesa di test o collaudo formale (spunta parziale).
> - `- [x] [CONVALIDATO CON SUCCESSO]`: Spunta definitiva concessa **esclusivamente POST-CONVALIDA** (approvazione dello sviluppatore per la 1A, test suite 100% verde per la 1B, collaudo pratico per la Fase 2).

- [ ] **Sotto-Fase 1A — Progettazione, Named Contracts & Validazione (Stop Obbligatorio)**
  - [ ] Redazione requisiti e anatomia del problema / opportunità [DA AVVIARE]
  - [ ] Scomposizione in Named Contracts (D0..DN, S1..SN) [DA AVVIARE]
  - [ ] Audit Preventivo dei 6 Cancelli Inviolabili (Protocollo 12) [DA AVVIARE]
  - [ ] Matrice di simulazione scenari a 3 livelli (Happy Path, Alternative, Corner Cases) [DA AVVIARE]
  - [ ] **Gating di Approvazione**: Stop formale e via libera esplicito dell'utente (*"procedi"*) [IN ATTESA APPROVAZIONE]
- [ ] **Sotto-Fase 1B — Esecuzione Tecnica, Codice & Test Seams Headless**
  - [ ] Intervento chirurgico sui file sorgente core (Contratti S1..SN) [DA AVVIARE]
  - [ ] Implementazione test seams package-private a 0 ms (Cancello 5) [DA AVVIARE]
  - [ ] Compilazione pulita con flag `--no-daemon` ed esecuzione suite test automatici [DA AVVIARE]
  - [ ] **Convalida Tecnica**: 100% test verdi e assenza di regressioni binarie [IN ATTESA TEST AUTOMATICI]
- [ ] **Fase 2 — Deploy Proattivo, Telemetria Live & Collaudo Pratico**
  - [ ] Deploy automatico dell'artefatto compilato nell'istanza attiva di runtime [DA AVVIARE]
  - [ ] Apertura sessione di telemetria e collegamento al `docs/report/REPORT_SESSIONE_[TASK].md` [DA AVVIARE]
  - [ ] Collaudo pratico da tastiera con NVDA sul profilo/ambiente reale [DA AVVIARE]
  - [ ] **Convalida Empirica**: Esito positivo a pieni voti confermato dall'utente [IN ATTESA COLLAUDO]
- [ ] **Fase 3 — Chiusura Tecnica, AVF & Archiviazione a Zero Residui**
  - [ ] Calcolo deterministico nuova versione AVF (`V.A.R[.M]`) e aggiornamento note di rilascio [DA AVVIARE]
  - [ ] Migrazione del presente piano in `docs/piani/completati/` [DA AVVIARE]
  - [ ] Commit Git sul branch attivo e push su remote repository [DA AVVIARE]
  - [ ] Chiusura con Domanda Ponte Obbligatoria per la Fase 4 (Auto-Apprendimento) [DA AVVIARE]

---

## 📌 1. Quadro di Riferimento & Specifiche Tecniche

### 1.1 Sintesi del Requisito / Problema Riscontrato
- Descrizione chiara del contesto operativo, dell'esigenza utente o del sintomo percepito in collaudo.
- Evidenze telemetriche, eccezioni, coordinate o righe di log di supporto.

### 1.2 Root Cause Analysis (RCA) o Motivazione Architetturale
- Diagnosi geometrica, temporale o di threading che spiega il motivo del comportamento pregresso.
- Per i piani correttivi: rigoroso rifiuto di pezze euristiche (Cancello 1).

---

## 🏛️ 2. Architettura Logica, Contratti Denominati & Modello Dati

### 2.1 Named Contracts (Decisioni di Design & Contratti Modulari)
- **Contratto D1 / S1 — [Nome Contratto]**:
  - *Precondizioni formali*: [Cosa deve essere vero prima della chiamata]
  - *Postcondizioni osservabili*: [Cosa deve essere garantito dopo l'esecuzione]
  - *Invarianti di Non-Regressione*: [Cosa non deve essere alterato nel resto del sistema]

### 2.2 Impatto sui Componenti & Accessibilità Zero Mouse
- Interazione con NVDA, volumi di sicurezza congelati (0.7f - 0.8f) e zero dipendenza dal mouse.

---

## ⚖️ 3. Audit Preventivo dei 6 Cancelli Inviolabili (Protocollo 12)

- [ ] **Cancello 1 — Rifiuto Patching Euristico**: La soluzione affronta l'invariante logico/topologico reale o maschera il sintomo alterando budget, tick, delay o costanti arbitrarie?
- [ ] **Cancello 2 — Purezza dell'Intento Fisico**: Nei sistemi ibridi/cooperativi, l'intento dell'utente umano è ancorato all'hardware puro (polling periferica/GLFW) o legge stati simulati da guardie logiche? *(Specifico per Game Dev / Input Fisico; N/A per altri domini)*
- [ ] **Cancello 3 — Integrità Hitbox & Volumetria Continua**: L'analisi considera la bounding box 3D continua ($0.6 \times 1.8\text{ m}$), clearance verticale (occhi/testa) e forme di collisione sottili, evitando riduzioni a punti discreti? *(Specifico per Game Dev 3D; N/A per altri domini)*
- [ ] **Cancello 4 — Contratti Denominati & Chiusi**: Le modifiche sono strutturate in contratti atomici e numerati (D0..DN, S1..SN) con precondizioni, postcondizioni, complessità e invarianti esplicite?
- [ ] **Cancello 5 — Determinismo Headless & Time-Seams a 0 ms**: Tutti i componenti a tempo (TTL, cooldown, debouncing) espongono time-seam package-private per test automatici istantanei senza `Thread.sleep`?
- [ ] **Cancello 6 — Custode Critico del Budget Token & Anti-Bloat Normativo**: La proposta rispetta i limiti di token budget (Canone 1, router $\le 250$ righe, zero duplicazioni testuali) e non introduce ridondanze normative?

---

## 🛡️ 4. Validazione Preventiva sui 7 Assi di Qualità

1. **Validità**: Rispetto rigoroso di framework, linguaggi, convenzioni e vincoli di compilazione;
2. **Efficacia**: Risoluzione reale, chirurgica e tangibile dell'esigenza con azzeramento del difetto;
3. **Coerenza**: Armonia con gli altri moduli del progetto e l'architettura Clean a 4 layer;
4. **Completezza**: Trattamento esplicito di tutti i rami condizionali, eccezioni e valori limite;
5. **Precisione**: Linearità formattazione per NVDA, chiarezza "Se... Allora", zero ambiguità;
6. **Affidabilità & Prestazioni**: Zero memory bloat, zero loop incontrollati, calcolo istantaneo;
7. **Assenza di Regressioni**: Tutela dei dati, retrocompatibilità e preservazione delle funzioni preesistenti.

---

## 🧪 5. Matrice di Simulazione Scenari a 3 Livelli (Stress-Test Logico)

### 🟢 Simulazione 1: [Scenario Comune / Happy Path]
- **Stato Iniziale / Input**: [Valori nominali standard]
- **Flusso Esecutivo**: *Se* [Condizione nominale] -> *Allora* [Azione attesa del sistema]
- **Riscontro Vocale**: [Cosa vocalizza NVDA / output atteso]
- **Esito**: [Conforme]

### 🟡 Simulazione 2: [Scenario Meno Comune / Alternative Paths]
- **Stato Iniziale / Input**: [Valori composti, rotazioni rapide, contese tra stati]
- **Flusso Esecutivo**: *Se* [Condizione secondaria] -> *Allora* [Gestione coordinata]
- **Riscontro Vocale**: [Riscontro vocale pulito senza collisioni o troncamenti]
- **Esito**: [Conforme]

### 🔴 Simulazione 3: [Caso Limite / Corner Cases & Boundary]
- **Stato Iniziale / Input**: [Valori nulli, collezioni vuote $N=0$, quantità unitarie $T=1$, blocchi a contatto $d \le 0.1\text{ m}$]
- **Flusso Esecutivo**: *Se* [Condizione estrema] -> *Allora* [Fallback protetto ed elegante]
- **Riscontro Vocale**: [Messaggio di sicurezza pulito senza eccezioni raw]
- **Esito**: [Protetto da crash / Non regressione]

---

## 🛠️ 6. Dettaglio delle Modifiche ai File

### File 1: `[Percorso/FileSorgente.ext]`
- Metodi, campi e contratti implementati o modificati.

### File 2: `[Percorso/FileLingua.json]` (se applicabile)
- Nuove chiavi di localizzazione disposte rigorosamente in **ordine alfabetico crescente**.

---

## 🧪 7. Suite di Test, Deploy & Protocollo di Collaudo

1. **Test Automatici Headless (Sotto-Fase 1B)**:
   - Comandi di esecuzione test a 0 ms senza dipendenze temporali reali.
2. **Deploy Proattivo (Fase 2)**:
   - Copia automatica dell'artefatto compilato nell'istanza runtime di Luca prima del test.
3. **Protocollo di Collaudo con NVDA (Fase 2)**:
   - Istruzioni puntuali passo-passo da tastiera per consentire a Luca di convalidare il comportamento.
