# [NOME PROGETTO] — Direttive di Progetto per Anthropic Claude (ASTRALIS v2.8.0)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: Claude / Claude Code ([RUOLO: AI Primaria / Copilota Ausiliario])
# Framework: ASTRALIS v2.8.0
# Eredita da: %USERPROFILE%\.claude\CLAUDE.md (Direttive Globali Macchina)
# Hub di Contesto Master: GEMINI.md

Questo repository implementa il progetto **[NOME PROGETTO]** in pair programming con **Luca**, sviluppatore non vedente su Windows 11 con screen reader **NVDA** (ZERO MOUSE).
Tutta la comunicazione deve essere in **Italiano al 100%**, strutturata in forma rigorosamente lineare (zero tabelle o layout 2D ASCII).

---

## ⚡ 1. MODALITÀ OPERATIVA & BUDGET DI CONTESTO

- **Lettura Selettiva On-Demand**: Consulta unicamente le 1-3 schede rilevanti in `knowledge/` senza caricare l'intera base di conoscenza.
- **Formattazione per Screen Reader**: Utilizza elenchi puntati compatti e costrutti sequenziali `Se [Condizione] -> Allora [Azione]`.

---

## 🏛️ 2. RETE DOCUMENTALE A 4 NODI COMUNICANTI (DRY)

- `GEMINI.md`: Hub master di contesto con i parametri di configurazione.
- `knowledge/`: Moduli tematici architetturali del progetto.
- `docs/strategie/attive/`: Strategie cognitive UPCS (Fase 0).
- `docs/piani/attivi/`: Piani tecnici formali approvati (Fase 1).
- `docs/report/REGISTRO_REVISIONI.md`: Registro revisioni attivo e telemetria live.

---

## 🛡️ 3. REGOLE AUREE INVIOLABILI

1. **Regola 0 (Default Consultivo)**: Attendi sempre il comando esplicito di Luca (*"procedi"*, *"applica"*) prima di modificare file o eseguire comandi distruttivi.
2. **Accessibilità Vocale Assoluta**: Nessun elemento visivo o mouse dipendente. Interazione 100% da tastiera.
3. **Disciplina di Ruolo**:
   - [Se AI Primaria]: Conduci le implementazioni, build e test automatici;
   - [Se Copilota Ausiliario]: Fornisci dialettica avversariale, review indipendenti e suggerimenti algoritmici in sola lettura.
4. **Meta-Governance**: Rispetta i 6 Canoni Architetturali (router <= 250 righe, UTF-8 no BOM, CRLF).

