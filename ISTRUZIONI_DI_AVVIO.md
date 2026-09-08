# 🚀 ASTRALIS STARTER KIT — ISTRUZIONI RAPIDE DI AVVIO (v3.0.4)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA) & Antigravity
# Framework: ASTRALIS (Adaptive Standards for Testing, Rules, Accessibility & Level Integration Systems)
# Master Hub: <astralis-hub>

Benvenuto in **ASTRALIS v3.0.4**, l'ecosistema di governance a 3 livelli, 12 protocolli operativi, disciplina di versionamento AVF e accessibilità universale di Luca & Antigravity!

Questo pacchetto ti consente sia di configurare da zero il tuo ambiente in meno di 1 minuto (Protocollo Onboarding), sia di aggiornare un'installazione preesistente preservando al 100% tutte le tue personalizzazioni con l'**Aggiornamento Integrativo a Cascata** (Protocollo Aggiornamento).

---

## 🧭 SCEGLI IL TUO PERCORSO

---

### 🌟 OPZIONE A: PRIMA INSTALLAZIONE SU QUESTO COMPUTER (PROTOCOLLO ONBOARDING)

Segui questi 3 semplici passi se usi ASTRALIS per la prima volta:

1. **PASSO 1: Posiziona questa cartella**  
   Copia o clona l'intera cartella `astralis-framework` all'interno della cartella in cui tieni i tuoi progetti (ad esempio in `C:\Users\TuoNome\Progetti\` oppure nella tua cartella di sviluppo).

2. **PASSO 2: Apri il tuo assistente AI**  
   Apri il tuo editor o client di sviluppo con l'assistente AI prescelto (Google Antigravity, Claude Code, OpenAI Codex, o altro) posizionandoti nella cartella dei tuoi progetti.

3. **PASSO 3: Avvia l'intervista guidata**  
   Scrivi semplicemente in chat:  
   > *"Avvia Protocollo Onboarding"*  
   *(Oppure: "Ciao, vorrei configurare l'ambiente di lavoro con ASTRALIS!").*

L'assistente AI ti farà 3 veloci domande (nome, se usi screen reader NVDA o monitor, e preferenze di accessibilità), configurando automaticamente il Genoma Globale (Livello 0), l'albero documentale `docs/` e inizializzando i nuovi progetti con la baseline AVF (`v1.0.0` o `v0.1.0`), `CHANGELOG.md` e `REGISTRO_REVISIONI.md`.

---

### 🔄 OPZIONE B: AGGIORNAMENTO INTEGRATIVO & ALLINEAMENTO PROGETTI (PROTOCOLLO AGGIORNAMENTO)

Segui questi 3 semplici passi se hai già installato in passato una versione precedente delle regole:

1. **PASSO 1: Sostituisci la cartella del Master Hub**  
   Estrai lo Starter Kit ZIP aggiornato (`ASTRALIS_Universal_Starter_Kit.zip`) e sovrascrivi la cartella `astralis-framework` all'interno dei tuoi progetti.

2. **PASSO 2: Apri il tuo assistente AI**  
   Apri il tuo assistente AI nella cartella progetti.

3. **PASSO 3: Avvia l'aggiornamento automatico**  
   Scrivi semplicemente in chat:  
   > *"Avvia Protocollo Aggiornamento"*  
   *(Oppure: "Aggiorna ASTRALIS a questa versione").*

L'assistente AI eseguirà:
- **Diff Semantico & Backup Preventivo Globale**: Rileva le tue regole/consuetudini custom e crea copie di sicurezza timestampate (`GEMINI_[timestamp].bak` e `knowledge_[timestamp].bak`).
- **Aggiornamento Integrativo Globale (Smart Merge)**: Fonde il nuovo Genoma preservando nell'Isola Protetta Utente tutte le tue personalizzazioni e fondendo a sezioni i moduli di `knowledge/` (o `knowledge_globale/` nell'hub locale).
- **Scansione a Cascata del Workspace (Triage)**: Identifica e classifica i progetti in `[DA AGGIORNARE IN MODO INTEGRATIVO]`, `[GIÀ ALLINEATO]` e `[CANDIDATO ONBOARDING]`.
- **Fusione Integrativa nei Progetti Locali**: Allinea i file `GEMINI.md` e la struttura `docs/` preservando al 100% tutte le schede `knowledge/` accumulate nelle sessioni di Auto-Apprendimento.
- **Audit di Conformità Post-Aggiornamento**: Verifica l'assenza di conflitti, doppioni o refusi ed emette la Ricevuta di Conformità finale per NVDA.

---

## 🧩 GESTIONE AUTOMATICA DEI CASI PARTICOLARI

Durante l'Onboarding o l'Aggiornamento Integrativo, ASTRALIS gestisce automaticamente tutti i casi limite:

1. **Caso Progetto Legacy SENZA `CHANGELOG.md` (Ricostruzione Storica Retroattiva)**:
   - Se un progetto esistente non possiede un changelog, l'assistente non crea un file vuoto: interroga la cronologia `git log` e i documenti completati in `docs/`, ricostruisce retroattivamente i rilasci storici e imposta la baseline conforme ad AVF a zero perdita dati.
2. **Caso Progetti "Candidati Onboarding" (Proposta Inizializzazione)**:
   - Se durante la scansione del workspace vengono individuati progetti che non hanno ancora la governance ASTRALIS, l'assistente li elenca nel triage e propone allo sviluppatore la loro inizializzazione guidata a 1-click.
3. **Disciplina di Versionamento AVF (`V.A.R[.M]`)**:
   - Tutti i progetti adottano la specifica a 3+1 cifre (`1ª Versione / Major`, `2ª Aggiornamento / Minor`, `3ª Revisione / Patch`, `4ª Micro-Fix / Doc`). Nei progetti con changelog esistente, lo storico pregresso a 3 cifre viene tutelato e integrato senza alcuna alterazione.
4. **Integrazione Opzionale Copiloti Secondari (ChatGPT / Codex / Claude — `AGENTS.md`)**:
   - Se utilizzi un secondo assistente AI per il pair programming (come ChatGPT / Codex / Claude), ASTRALIS include la suite di template pronti all'uso in `templates/collaboratori_ai/`. Questa funzionalità è al 100% facoltativa (Opt-In): non vincola in alcun modo l'inizializzazione su una nuova macchina né l'aggiornamento di sistemi esistenti, che rimangono completamente autosufficienti con Antigravity.
5. **Rilevamento Proattivo Aggiornamenti (Pattern Deferred Query & Update Prompt)**:
   - All'avvio della prima interazione di ogni sessione, ASTRALIS verifica silenciosamente la presenza di nuove release nel repository ufficiale (`https://github.com/Nemex81/astralis-framework`) tramite lo script leggero `scripts/verifica_aggiornamenti_remoti.ps1`.
   - Se il sistema è aggiornato o offline, il controllo è impercettibile (zero rumore per NVDA); se è disponibile una nuova versione, la tua domanda viene salvata e visualizzata con un breve riassunto prima di chiederti se aggiornare subito o proseguire con la richiesta.
