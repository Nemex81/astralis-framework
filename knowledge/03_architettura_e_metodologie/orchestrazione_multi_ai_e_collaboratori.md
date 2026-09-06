# Orchestrazione Multi-AI, Collaboratori Ausiliari e Polimorfismo dei Ruoli
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: Antigravity, GPT Codex, Claude, Copilot & Collaboratori Custom
# Ambito: Globale / Universale
# Master Hub: <astralis-hub>

Questo documento definisce l'architettura formale, le regole di coordinamento e i flussi operativi per consentire a molteplici intelligenze artificiali di collaborare in perfetta armonia sui progetti dell'utente, garantendo zero conflitti di concorrenza, pieno rispetto dell'accessibilità NVDA e conformità ai 6 Canoni di Meta-Governance.

---

## 🏛️ 1. PRINCIPI FONDAMENTALI DELL'ARCHITETTURA MULTI-AI

1. **Polimorfismo e Simmetria dei Ruoli**:
   - Il framework ASTRALIS è agnostico rispetto ai modelli AI.
   - In ogni sessione e progetto sono definiti due ruoli precisi e simmetrici:
     * **AI Primaria (Lead Operativa)**: È l'assistente con cui l'utente sta interagendo in prima persona per sviluppare. Ha il mandato operativo di analizzare, compilare, eseguire comandi e applicare modifiche (sempre previo comando esplicito dello sviluppatore, Regola 0). Ha **autonomia al 100%** e può lavorare completamente da sola in qualsiasi sessione.
     * **AI Ausiliaria / Collaboratore (Peer Reviewer & Dialettica)**: È l'assistente consultato per ottenere un secondo parere critico indipendente, sfidare scelte di design (Inner Codex esterno), effettuare revisioni formali del codice (PR Review) o svolgere sessioni di brainstorming algoritmico.
   - **Invertibilità Completa**: Il modello di ruoli è universale e invertibile. Nel setup tipico l'AI Primaria può essere Antigravity e l'AI Ausiliaria un secondo modello (es. Claude o GPT Codex); tuttavia, se l'utente opera tramite Claude Code, Cursor o Codex CLI, tali modelli assumono il ruolo di Primaria e Antigravity assume il ruolo ausiliario senza alterare le regole di sistema.

2. **Disciplina di Non-Concorrenza & Integrità File**:
   - Per prevenire race conditions, conflitti di merge e file lock:
     * Solo l'AI Primaria è autorizzata a modificare il codice sorgente, lanciare task di build o effettuare commit Git;
     * Le AI Ausiliarie operano in modalità consultiva pura (lettura della documentazione e delle schede `knowledge/`), restituendo suggerimenti, difetti isolati o patch concettuali senza sovrascritture dirette.

---

## ⚡ 2. AUTO-DEDUZIONE DETERMINISTICA DELL'AMBIENTE ATTIVO

1. **Zero Burocrazia & Auto-Riconoscimento**:
   - Ogni assistente AI riconosce nativamente il proprio ambiente di esecuzione tramite il contesto di sistema, le directory applicative e i canali di runtime:
     * Se l'ambiente attivo è Google Antigravity -> l'assistente si dichiara **AI Primaria per default**;
     * Se l'ambiente attivo è Claude Code / Anthropic -> Claude si dichiara **AI Primaria per default**;
     * Se l'ambiente attivo è OpenAI Codex / CLI -> Codex si dichiara **AI Primaria per default**.
2. **Interazione NVDA ad Alto Segnale (1 Sola Riga)**:
   - L'assistente evita qualsiasi questionario prolisso, proponendo una singola domanda lineare a conferma rapida:
     > *"Rilevato ambiente [Nome AI]: imposto [Nome AI] come Primaria di sviluppo. Vuoi attivare anche collaboratori ausiliari (es. GPT Codex, Claude, Copilot) o procediamo in modalità solitaria?"*

---

## 🗺️ 3. TOPOLOGIA A DOPPIO LIVELLO (GLOBALE MACCHINA VS LOCALE PROGETTO)

Ogni famiglia di assistenti adotta la struttura disaccoppiata a 2 livelli:

1. **Google Gemini / Antigravity**:
   - *Globale (Macchina)*: `<config-dir>\config\GEMINI.md` (Genoma Globale Utente);
   - *Locale (Progetto)*: `./GEMINI.md` (Manifest di Progetto).
2. **OpenAI / GPT Codex / Cursor**:
   - *Globale (Macchina)*: `%USERPROFILE%\.codex\AGENTS.md` (Direttive Globali Codex);
   - *Locale (Progetto)*: `./AGENTS.md` (Manifest di Progetto).
3. **Anthropic Claude (Claude Code / Dev)**:
   - *Globale (Macchina)*: `%USERPROFILE%\.claude\CLAUDE.md` (Direttive Globali Claude);
   - *Locale (Progetto)*: `./CLAUDE.md` (Manifest di Progetto).
4. **GitHub Copilot**:
   - *Globale (Macchina)*: `%USERPROFILE%\.copilot\config.md` (oppure estensione IDE);
   - *Locale (Progetto)*: `./.github/copilot-instructions.md` (Istruzioni di Repository).
5. **Custom AI Jolly (Modello Parametrabile)**:
   - Template agnostico universale configurabile per qualsiasi modello locale (Ollama, DeepSeek, Qwen, Open-Code).

---

## 🔄 4. I TRE MOMENTI SISTEMICI DI INTERCETTAZIONE & LA GUARDIA AUSILIARIA

1. **Momento 1 — Inizializzazione (Protocollo 9 — Onboarding)**:
   - Nel bootstrap di un nuovo workspace o macchina:
     - L'AI attiva si auto-rileva e si propone come Primaria;
     - Su conferma dell'utente, genera i file master locali e, se richiesto, i manifest per i collaboratori ausiliari selezionati attingendo alla cartella `templates/collaboratori_ai/`.
2. **Momento 2 — Aggiornamento Ecosistema (Protocollo 8 — Upgrade)**:
   - Durante l'upgrade del Master Hub:
     - L'AI Primaria scansiona la macchina dell'utente per individuare le cartelle dei client installati (`.codex`, `.claude`);
     - Aggiorna atomicamente sia le proprie regole globali che quelle dei collaboratori rilevati, sincronizzando i riferimenti a nuovi protocolli e preservando le personalizzazioni utente.
3. **Momento 3 — La Guardia Ausiliaria On-Demand (Proactive Multi-AI Health Check)**:
   - Funziona come sentinella continua in qualsiasi sessione di lavoro:
     - *Se* in un progetto aperto l'AI Primaria rileva un file manifest di un collaboratore (es. `./AGENTS.md` o `./CLAUDE.md`), ma sulla macchina manca il corrispondente file globale (es. `%USERPROFILE%\.codex\AGENTS.md`);
     - *Oppure se* il file del collaboratore risulta obsoleto o disallineato rispetto alla versione corrente di ASTRALIS;
     - *Allora* emette proattivamente una notifica vocale discreta a 1 riga:
       > *"🛡️ [ASTRALIS] Rilevato collaboratore AI ([Nome AI]) con configurazione incompleta o disallineata. Vuoi che generi il profilo globale e armonizzi le direttive con 1 comando?"*

---

## 📋 5. CHECKLIST DI ARMONIZZAZIONE MULTI-AI

Prima di iniziare un lavoro collaborativo multi-AI, verificare:
- [ ] L'AI Primaria è chiaramente dichiarata e gestisce l'iniziativa di modifica del codice?
- [ ] Le AI Ausiliarie sono configurate per operare in sola consultazione/revisione?
- [ ] I file globali nella macchina (`.gemini/`, `.codex/`, `.claude/`) sono tutti presenti e aggiornati?
- [ ] Tutti i router locali (`GEMINI.md`, `AGENTS.md`, `CLAUDE.md`) puntano alla stessa cartella `knowledge/` condivisa del progetto?
- [ ] È rispettato il budget di token (tutti i file router master $\le 250$ righe)?

