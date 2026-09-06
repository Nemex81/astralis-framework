# [NOME PROGETTO] — Hub di Contesto & Governance Locale (GEMINI.md — ASTRALIS v2.8.0)

# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)

# Target AI: Antigravity (Primario) & Codex/ChatGPT (Copilota Ausiliario)

# Eredita da:

#   1. $HOME\.gemini\config\GEMINI.md (Genoma Globale — Livello 0)

#   2. <percorso-router-livello-1>\GEMINI.md (Ponte Amministrativo — Livello 1)

# Master Hub: <astralis-hub>



Questo repository implementa il progetto **[NOME PROGETTO]** ed è sviluppato in pair programming con **Luca**, sviluppatore completamente non vedente su Windows 11 con screen reader **NVDA** (**ZERO MOUSE**).

Tutta l'interazione con l'ambiente, il codice, i log e i menu avviene tramite sintesi vocale (NVDA / SAPI), feedback acustici e comandi da tastiera completi.



Questo file costituisce l'**Hub Centrale di Contesto Locale** del progetto, vincolante sia per l'assistente AI primario (**Antigravity**) che per i copiloti ausiliari di peer programming (come **Codex / ChatGPT**). Tutti i dettagli specialistici risiedono nella cartella [`knowledge/`](./).



---



## 🌟 Le Regole Auree Inviolabili del Progetto



0. **Consuetudini Operative, Dialogo a 2 Tempi & Gating Semantico**:

   - Default consultivo: analizza, verifica i log, consulta le schede di riferimento e **attendi sempre la conferma esplicita di Luca prima di modificare codice o file**.

   - *Gating Semantico Fase 1*: Comandi come *"passa alla fase 1"* autorizzano **esclusivamente la stesura del Piano Tecnico Formale (Sotto-Fase 1A)** in `docs/piani/attivi/` e impongono lo **Stop Obbligatorio** prima di toccare codice o configurazioni (Sotto-Fase 1B).

   - *Protocollo di Eliminazione Protetta*: Motivazione chiara, analisi d'impatto, verifica assenza perdita dati e attesa di autorizzazione esplicita prima di qualsiasi cancellazione.



1. **Accessibilità Vocale Assoluta & Volumi di Sicurezza**:

   - Nessuna funzione deve dipendere da mouse o elementi visivi (interazione 100% da tastiera).

   - Volumi audio posizionale o effetti sonori congelati a un massimo compreso tra `0.7f` e `0.8f` per non coprire mai la voce dello screen reader.



2. **Standard I18N & Convenzioni Formato**:

   - Nello sviluppo e fork ci concentriamo su **Italiano** e **Inglese** (standard PR upstream);

   - Nei file `.json` di lingua, chiavi disposte in **rigoroso ordine alfabetico crescente**.



3. **Rete Documentale a 4 Nodi Comunicanti (Pointer Hub DRY) in `docs/`**:

   - `docs/strategie/attive/`: Strategie logico-cognitive in elaborazione o discussione (Fase 0);

   - `docs/strategie/archiviate/`: Strategie convalidate e convertite in piani tecnici;

   - `docs/piani/attivi/`: Piani tecnici in stesura (1A) o in attesa di collaudo (1B);

   - `docs/piani/completati/`: Piani tecnici collaudati con successo e archiviati;

   - `docs/report/`: Registro Revisioni attivo (`REGISTRO_REVISIONI.md`) e archivio storico (`ARCHIVIO_REVISIONI.md`);

   - `docs/report/archivio/`: Report di sessione e telemetria storici (URCP Standard);

   - `docs/manuali/`: Guide all'uso e protocolli di collaudo.

   - **Disaccoppiamento `README.md`**: Il `README.md` di root è riservato alla documentazione funzionale del software per gli utenti finali e la community. L'Indice Ragionato delle regole risiede unicamente in questo `GEMINI.md`.

4. **Pipeline Operativa a 4 Fasi & Protocollo Telemetria Live**:

   - *Fase 1A (Piano Tecnico & Stop)*: Stesura piano in `docs/piani/attivi/` con validazione sui 7 Assi e Matrice di Simulazione a 3 Livelli;

   - *Fase 1B (Esecuzione Tecnica & Test)*: Modifiche al codice, compilazione con flag anti-lock (`--no-daemon`) e test automatici eseguiti solo POST-APPROVAZIONE;

   - *Fase 2 (Deploy Proattivo, Telemetria & Test Manuale)*: Deploy automatico nelle istanze attive prima del test di Luca. Durante il collaudo opera la **Telemetria Live** (Protocollo 4) con aggiornamento automatico proattivo del **Registro Revisioni**;

   - *Fase PRAPI (Protocollo 5)*: Ciclo rapido di revisione e affinamento post-collaudo in 4 passi;

   - *Fase 3 (Chiusura Tecnica)*: Commit Git (`feat:`, `fix:`, `docs:`), aggiornamento `CHANGELOG.md`, archiviazione del piano in `docs/piani/completati/`, aggiornamento backup e chiusura tassativa con la **Domanda Ponte Obbligatoria**:

     > *"Vuoi che avviamo ora la sessione formale di Auto-Apprendimento (Fase 4) per elaborare la bozza dettagliata delle regole e aggiornare le schede di conoscenza e governance?"*

   - *Fase 4 (Auto-Apprendimento Continuo a Doppio Binario)*:

     - **Binario A (Locale)**: Aggiornamento delle schede in `knowledge/` del progetto;

     - **Binario B (Globale)**: Aggiornamento dei moduli in `knowledge_globale/` del Master Hub.

5. **Disciplina di Meta-Governance & Ingegneria delle Regole (ASTRALIS Canon Crafting)**:

   - Divieto assoluto di inventare regole ad-hoc o appesantire questo file (limite di sicurezza: $\le 250$ righe / ~2.000 token).

   - Ogni integrazione segue i **6 Canoni**: Hub & Spoke, Manifest vs Modulo, Rete Documentale Pointer DRY con link relativi o locali, Gating Deterministico a 3 Stati (`[ ]`, `[/]`, `[x]`), Linearità NVDA e Igiene File (UTF-8 no BOM, CRLF).



---



## 🧭 Indice Ragionato della Base di Conoscenza Locale (`knowledge/`)



- [`00_architettura_e_struttura.md`](./00_architettura_e_struttura.md): Panoramica architetturale, moduli e flussi di dati del progetto.

- [`01_accessibilita_e_controlli.md`](./01_accessibilita_e_controlli.md): Mappatura tasti, gestione focus ed eventi di sintesi vocale.

- [`02_standard_sviluppo_e_convenzioni.md`](./02_standard_sviluppo_e_convenzioni.md): Convenzioni di codice, gestione branch Git e internazionalizzazione.

- [`03_gestione_errori_e_diagnostica.md`](./03_gestione_errori_e_diagnostica.md): Gestione eccezioni, log diagnostici e protocolli di debug.



---



## 🛡️ SEZIONE PERSONALIZZATA PROGETTO (REGOLE SPECIALISTICHE)



*Spazio riservato alle regole tecniche e consuetudini specifiche di questo repository.*