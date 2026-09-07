# [NOME PROGETTO] — Hub di Contesto & Governance Locale (GEMINI.md — ASTRALIS v3.0.0)
# Autore: [NOME SVILUPPATORE] (Default da user_preferences.md)
# Target AI: [AI Pair Programmer] (Antigravity / Claude / OpenAI Codex / Custom AI)
# Eredita da:
#   1. $HOME\.gemini\config\GEMINI.md (Genoma Globale — Livello 0)
#   2. <percorso-router-livello-1>\GEMINI.md (Ponte Amministrativo — Livello 1)
# Master Hub: <astralis-hub>

Questo repository implementa il progetto **[NOME PROGETTO]** ed è sviluppato in pair programming secondo il profilo di accessibilità configurato in `user_preferences.md` (Default: screen reader **NVDA**, interazione 100% da tastiera, **ZERO MOUSE**).
Tutta l'interazione con l'ambiente, il codice, i log e i menu rispetta il Principio di Simmetria Universale Bi-Direzionale (ergonomia vocale per non vedenti e interfaccia moderna per vedenti).

Questo file costituisce l'**Hub Centrale di Contesto Locale** del progetto, vincolante sia per l'assistente AI primario che per i copiloti ausiliari di peer programming. Tutti i dettagli specialistici risiedono nella cartella [`knowledge/`](./knowledge/).

---

## 🛡️ LE 7 REGOLE AUREE LOCALI INVIOLABILI

1. **Regola 0: Dialogo a 2 Tempi & Gating Semantico (Default Consultivo Permanente)**:
   - L'assistente AI analizza, propone e pianifica; non modifica mai file in modo autonomo: attendi sempre la conferma esplicita dell'utente (*"procedi"*, *"applica"*, *"esegui"*).
   - Comandi esplorativi (*"cosa ne pensi?"*, *"valuta"*, *"analizza"*) impongono la modalità consultiva pura (zero modifiche).
   - *Gating Semantico Fase 1*: Comandi come *"passa alla fase 1"* autorizzano **esclusivamente la stesura del Piano Tecnico Formale (Sotto-Fase 1A)** in `docs/piani/attivi/` e impongono lo **Stop Obbligatorio** prima di toccare codice o configurazioni (Sotto-Fase 1B).
   - *Validazione Preventiva*: Ogni proposta deve essere verificata sui **7 Assi di Qualità** e **3 Livelli di Simulazione**.
   - *Protocollo di Eliminazione Protetta*: Nessun file può essere eliminato senza spiegare motivazione, impatto, assenza perdita dati e attendere conferma.

2. **Accessibilità Vocale Assoluta & Simmetria Bi-Direzionale**:
   - Zero dipendenza dal mouse per lo sviluppatore; navigazione sequenziale, linearità per sintesi vocale.
   - Volumi di sicurezza congelati (0.7f - 0.8f) e ducking audio nei giochi/mod.
   - L'assistente garantisce la coesistenza armonica: GUI moderna per utenti vedenti, piena accessibilità da tastiera per tutti.

3. **Rigore I18N, Convenzioni & Trasparenza Documentale**:
   - Documentazione interna, piani, report e commit: convenzionali e ordinati.
   - Nelle lingue JSON, chiavi disposte in **rigoroso ordine alfabetico crescente**.
   - Fork internazionali e PR upstream: contributi in lingua inglese isolati nei file appositi.

4. **Pipeline Operativa a 4 Fasi & Rete a 4 Nodi Comunicanti (DRY)**:
   - *Fase 0 (Strategia UPCS)*: Analisi logico-cognitiva per compiti complessi in `docs/strategie/attive/`;
   - *Fase 1A (Piano Tecnico & Stop)*: Stesura piano in `docs/piani/attivi/` con validazione sui 7 Assi e Matrice di Simulazione a 3 Livelli;
   - *Fase 1B (Esecuzione Tecnica & Test)*: Modifiche al codice, compilazione con flag anti-lock su Windows/Cloud (`--no-daemon --no-watch-fs` per build Gradle) e test automatici eseguiti solo POST-APPROVAZIONE;
   - *Fase 2 (Deploy Proattivo, Telemetria & Test Manuale)*: Deploy automatico nelle istanze attive prima del collaudo manuale. Durante il collaudo opera la **Telemetria Live** (Protocollo 4) con aggiornamento proattivo del **Registro Revisioni** (`docs/report/REGISTRO_REVISIONI.md`);
   - *Fase PRAPI (Protocollo 5)*: Ciclo rapido di revisione e affinamento post-collaudo in 4 passi;
   - *Fase 3 (Chiusura Tecnica)*: Commit Git (`feat:`, `fix:`, `docs:`), aggiornamento `CHANGELOG.md`, archiviazione del piano in `docs/piani/completati/`, aggiornamento backup e chiusura tassativa con la **Domanda Ponte Obbligatoria**:
     > *"Vuoi che avviamo ora la sessione formale di Auto-Apprendimento (Fase 4) per elaborare la bozza dettagliata delle regole e aggiornare le schede di conoscenza e governance?"*
   - *Fase 4 (Auto-Apprendimento Continuo a Doppio Binario)*:
     - **Binario A (Locale)**: Aggiornamento delle schede in `knowledge/` del progetto;
     - **Binario B (Globale)**: Aggiornamento dei moduli nel Master Hub.

5. **Disciplina di Meta-Governance & Ingegneria delle Regole (ASTRALIS Canon Crafting)**:
   - Divieto assoluto di inventare regole ad-hoc o appesantire questo file (limite di sicurezza: $\le 250$ righe / ~2.000 token).
   - Ogni integrazione segue i **6 Canoni**: Hub & Spoke, Manifest vs Modulo, Rete Documentale Pointer DRY con link relativi o locali, Gating Deterministico a 3 Stati (`[ ]`, `[/]`, `[x]`), Linearità NVDA e Igiene File (UTF-8 no BOM, CRLF).

6. **Protocollo 12 — Inner Codex Pattern (6 Cancelli Inviolabili)**:
   - Cancello 1 (Rifiuto Patching Euristico): divieto di forzare ritardi o pesi artificiali;
   - Cancello 2 (Hardware Grounding): disaccoppiamento tra input diretto da periferica e guardie reattive;
   - Cancello 3 (Hitbox & Clearance Continua): controllo geometrico rigoroso delle collisioni e volumi di sicurezza;
   - Cancello 4 (Named Contracts D0..DN / S1..SN): contratti formali numerati;
   - Cancello 5 (Determinismo Headless): test seams a 0 ms senza dipendenze temporali;
   - Cancello 6 (Budget Token & Anti-Bloat Normativo): file router $\le 250$ righe, zero duplicazioni nei prompt.

7. **Principio di Integrità Evolutiva & Bonifica dei Residui (Zero Meccanismi Concorrenti Obsoleti)**:
   - Quando un'architettura, flusso, funzione o componente viene sostituito o evoluto da una nuova soluzione, è fatto divieto categorico di lasciare coesistere elementi del vecchio meccanismo (codice morto, campi orfani, logiche concorrenti, frammenti obsoleti o deleteri).
   - Ogni transizione include sistematicamente, come parte integrante dell'intervento, la bonifica completa e l'eliminazione verificata di tutti i residui del sistema superato prima di dichiarare conclusa l'opera, azzerando alla radice ambiguità cognitive e debiti tecnici silenti.

---

## 🧭 Indice Ragionato della Base di Conoscenza Locale (`knowledge/`)

- [`00_consuetudini_operative_e_sinergia_assistente.md`](./knowledge/00_consuetudini_operative_e_sinergia_assistente.md): Consuetudini operative, dialogo a 2 tempi ed eliminazione protetta.
- [`01_accessibilita_vocale_e_interazione_tastiera.md`](./knowledge/01_accessibilita_vocale_e_interazione_tastiera.md): Focus management, tastiera 100% e sintesi vocale.
- [`02_architettura_stack_e_runtime.md`](./knowledge/02_architettura_stack_e_runtime.md): Architettura stack, linguaggi, toolchain e runtime protetti.
- [`03_standard_git_branching_e_commit.md`](./knowledge/03_standard_git_branching_e_commit.md): Convenzioni Git, commit semantici e disciplina I18N.
- [`04_struttura_progetto_e_gestione_dati.md`](./knowledge/04_struttura_progetto_e_gestione_dati.md): Mappa cartelle, gestione dati e percorsi dinamici.
- [`09_registro_bug_e_soluzioni.md`](./knowledge/09_registro_bug_e_soluzioni.md): Memoria tecnica di anomalie riscontrate e risolte.
- [`10_standard_piani_verifiche_e_living_documentation.md`](./knowledge/10_standard_piani_verifiche_e_living_documentation.md): Standard di verifica, piani e documentazione viva.

---

## 🛡️ SEZIONE PERSONALIZZATA PROGETTO (REGOLE SPECIALISTICHE)

*Spazio riservato alle regole tecniche e consuetudini specifiche di questo repository.*