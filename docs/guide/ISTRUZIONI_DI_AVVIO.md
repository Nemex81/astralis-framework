# 🚀 ASTRALIS STARTER KIT — ISTRUZIONI RAPIDE DI AVVIO (v2.8.0)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA) & Antigravity
# Framework: ASTRALIS (Adaptive Standards for Testing, Rules, Accessibility & Level Integration Systems)
# Master Hub: <astralis-hub>

Benvenuto in **ASTRALIS v2.8.0**, l'ecosistema di governance a 3 livelli, 12 protocolli operativi, disciplina di versionamento AVF e accessibilità universale di Luca & Antigravity!

Questo pacchetto ti consente sia di configurare da zero il tuo ambiente in meno di 1 minuto (Protocollo Onboarding), sia di aggiornare un'installazione preesistente preservando al 100% tutte le tue personalizzazioni con l'**Aggiornamento Integrativo a Cascata** (Protocollo Aggiornamento).

---

## 🧭 SCEGLI IL TUO PERCORSO

---

### 🌟 OPZIONE A: PRIMA INSTALLAZIONE SU QUESTO COMPUTER (PROTOCOLLO ONBOARDING)

Segui questi 3 semplici passi se usi ASTRALIS per la prima volta:

1. **PASSO 1: Posiziona questa cartella**  
   Copia o clona l'intera cartella `astralis-framework` all'interno della cartella in cui tieni i tuoi progetti (ad esempio in `C:\Users\TuoNome\Progetti\` oppure nella tua cartella di sviluppo).

2. **PASSO 2: Apri Antigravity**  
   Apri il tuo editor / client di sviluppo con **Antigravity** posizionandoti nella cartella dei tuoi progetti.

3. **PASSO 3: Avvia l'intervista guidata**  
   Scrivi semplicemente in chat:  
   > *"Avvia Protocollo Onboarding"*  
   *(Oppure: "Ciao, vorrei configurare l'ambiente di lavoro con ASTRALIS!").*

Antigravity ti farà 3 veloci domande (nome, se usi screen reader NVDA o monitor, e preferenze di accessibilità), configurando automaticamente il Genoma Globale (Livello 0), l'albero documentale `docs/` e inizializzando i nuovi progetti con la baseline AVF (`v1.0.0` o `v0.1.0`), `CHANGELOG.md` e `REGISTRO_REVISIONI.md`.

---

### 🔄 OPZIONE B: AGGIORNAMENTO INTEGRATIVO & ALLINEAMENTO PROGETTI (PROTOCOLLO AGGIORNAMENTO)

Segui questi 3 semplici passi se hai già installato in passato una versione precedente delle regole:

1. **PASSO 1: Sostituisci la cartella del Master Hub**  
   Estrai lo Starter Kit ZIP aggiornato (`ASTRALIS_Universal_Starter_Kit.zip`) e sovrascrivi la cartella `astralis-framework` all'interno dei tuoi progetti.

2. **PASSO 2: Apri Antigravity**  
   Apri Antigravity nella tua cartella progetti.

3. **PASSO 3: Avvia l'aggiornamento automatico**  
   Scrivi semplicemente in chat:  
   > *"Avvia Protocollo Aggiornamento"*  
   *(Oppure: "Aggiorna ASTRALIS a questa versione").*

Antigravity eseguirà:
- **Diff Semantico & Backup Preventivo Globale**: Rileva le tue regole/consuetudini custom e crea copie di sicurezza timestampate (`GEMINI_[timestamp].bak` e `knowledge_globale_[timestamp].bak`).
- **Aggiornamento Integrativo Globale (Smart Merge)**: Fonde il nuovo Genoma preservando nell'Isola Protetta Utente tutte le tue personalizzazioni e fondendo a sezioni i moduli di `knowledge_globale/`.
- **Scansione a Cascata del Workspace (Triage)**: Identifica e classifica i progetti in `[DA AGGIORNARE IN MODO INTEGRATIVO]`, `[GIÀ ALLINEATO]` e `[CANDIDATO ONBOARDING]`.
- **Fusione Integrativa nei Progetti Locali**: Allinea i file `GEMINI.md` e la struttura `docs/` preservando al 100% tutte le schede `knowledge/` accumulate nelle sessioni di Auto-Apprendimento.
- **Audit di Conformità Post-Aggiornamento**: Verifica l'assenza di conflitti, doppioni o refusi ed emette la Ricevuta di Conformità finale per NVDA.

---

## 🧩 GESTIONE AUTOMATICA DEI CASI PARTICOLARI

Durante l'Onboarding o l'Aggiornamento Integrativo, ASTRALIS gestisce automaticamente tutti i casi limite:

1. **Caso Progetto Legacy SENZA `CHANGELOG.md` (Ricostruzione Storica Retroattiva)**:
   - Se un progetto esistente non possiede un changelog, l'assistente non crea un file vuoto: interroga la cronologia `git log` e i documenti completati in `docs/`, ricostruisce retroattivamente i rilasci storici e imposta la baseline conforme ad AVF a zero perdita dati.
2. **Caso Progetti "Candidati Onboarding" (Proposta Inizializzazione)**:
   - Se durante la scansione del workspace vengono individuati progetti che non hanno ancora la governance ASTRALIS, l'assistente li elenca nel triage e propone a Luca la loro inizializzazione guidata a 1-click.
3. **Disciplina di Versionamento AVF (`V.A.R[.M]`)**:
   - Tutti i progetti adottano la specifica a 3+1 cifre (`1ª Versione / Major`, `2ª Aggiornamento / Minor`, `3ª Revisione / Patch`, `4ª Micro-Fix / Doc`). Nei progetti con changelog esistente, lo storico pregresso a 3 cifre viene tutelato e integrato senza alcuna alterazione.
4. **Integrazione Opzionale Copiloti Secondari (ChatGPT / Codex — `AGENTS.md`)**:
   - Se utilizzi un secondo assistente AI per il pair programming (come ChatGPT / Codex), ASTRALIS include il template pronto all'uso `templates/AGENTS_TEMPLATE.md`. Questa funzionalità è al 100% facoltativa (Opt-In): non vincola in alcun modo l'inizializzazione su una nuova macchina né l'aggiornamento di sistemi esistenti, che rimangono completamente autosufficienti con Antigravity.
