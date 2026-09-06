# [NOME PROGETTO] — Direttive di Progetto per Codex / ChatGPT (ASTRALIS v2.6.3)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: Codex / ChatGPT (Copilota Ausiliario e Peer Programmer - Opzionale)
# Framework: ASTRALIS v2.6.3
# Eredita da: $HOME\.codex\AGENTS.md (Direttive Globali)
# Hub di Contesto Master: GEMINI.md

> [!NOTE]
> **Componente Opzionale**: Questo file è un template facoltativo per chi utilizza un secondo assistente AI (ChatGPT / Codex) in modalità pair programming insieme ad Antigravity. Se utilizzi unicamente Antigravity, questo file non è necessario e può essere omesso.

Questo repository implementa il progetto **[NOME PROGETTO]**.
Tutta l'interazione con l'ambiente, il codice, i menu e gli strumenti di sviluppo avviene tramite sintesi vocale (NVDA / SAPI), feedback acustici e comandi da tastiera completi (**ZERO MOUSE**).

---

## ⚡ 1. REGOLA DI INGAGGIO E CARICAMENTO PROGRESSIVO (ON-DEMAND)

Per garantire la massima velocità di risposta e preservare la finestra di contesto di Codex:
- **Richieste brevi, chiarimenti o domande rapide**: usa unicamente questo file `AGENTS.md` senza caricare documentazione esterna.
- **Pianificazione, implementazione, diagnosi o test**: attiva la consultazione approfondita delle Fonti di Verità (Sezione 2) caricando **esclusivamente le 1–3 schede in `knowledge/` strettamente pertinenti** al componente su cui si lavora (tramite l'Indice Ragionato in `GEMINI.md`).
- **Divieto di sovraccarico**: non caricare mai in massa l'intera cartella `knowledge/`, i piani archiviati in `docs/piani/completati/` o i registri storici.

---

## 🏛️ 2. FONTI DI VERITÀ E REGOLE DI PROGETTO (ATTIVAZIONE CONDIZIONALE)

Quando il compito richiede pianificazione, implementazione, diagnosi o test approfonditi (secondo la Regola di Ingaggio sopra), consulta i seguenti file di riferimento presenti nel repository:
- `GEMINI.md`: Hub centrale di contesto, governance e regole specifiche del progetto.
- `knowledge/`: Base di conoscenza modulare del progetto (architettura, flussi, convenzioni e diario modifiche).
- `docs/piani/attivi/`: Piani tecnici formali delle attività correnti.
- `docs/report/REGISTRO_REVISIONI.md`: Registro aperto delle anomalie e revisioni emerse dai collaudi.

---

## 🛡️ 3. VINCOLI TECNICI INVIOLABILI

1. **Regola 0 (Default Consultivo Permanente)**:
   - Non effettuare MAI modifiche autonome al codice sorgente o ai file di configurazione senza il comando esplicito di Luca (*"procedi"*, *"applica"*, *"esegui"*).
   - Richieste come *"cosa ne pensi?"*, *"valuta"*, *"analizza"* richiedono risposte esclusivamente consultive.
2. **Accessibilità Vocale & Zero Mouse**:
   - Nessuna interfaccia o funzionalità deve richiedere l'uso del mouse.
   - I volumi sonori ed effetti audio devono sempre rispettare la sicurezza acustica dell'utente e non coprire la sintesi vocale dello screen reader.
3. **Organizzazione Documentale**:
   - Tutta la documentazione tecnica vive all'interno del repository in `docs/` e `knowledge/`.
   - Il `README.md` di root è riservato alla presentazione funzionale del progetto agli utenti finali.

