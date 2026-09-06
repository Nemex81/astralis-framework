# Piano Tecnico: Rilascio e Standardizzazione di ASTRALIS Framework v3.0.0

## Descrizione dell'Obiettivo
Trasformare l'attuale Master Hub di ASTRALIS in una distribuzione pubblica, universale, modulare e open-source (v3.0.0) nel repository GitHub dedicato `Nemex81/astralis-framework` (attualmente clonato in locale in `<repo-root>`), mantenendo intatto e privato il Master Hub personale dell'autore.

---

## 🏛️ Invarianti e Principi Architetturali
- **Autore e Genesi**: Luca (sviluppatore Senior non vedente, 25+ anni di esperienza, utente NVDA). Il framework nasce dall'accessibilità reale e dall'interazione 100% da tastiera.
- **Accessibilità "Design for All" & Simmetria Universale**: Massimo standard cognitivo e vocale per screen reader, perfettamente armonico, moderno e usabile con mouse e monitor per i vedenti.
- **Universalità e Convergenza Modulare**: Supporto nativo polimorfico a tutti i domini:
  - Game Development Accessibile (Ingegneria Software + Game Loop/Engine + Audio 3D/Accessibilità Ludica);
  - Scrittura Creativa & Narrativa (Governance + Voce Autoriale + Worldbuilding/Lore Continuity + Formattazione Lineare);
  - Addon & Strumenti Assistivi (Python + API Screen Reader + Usabilità Tastiera Assoluta);
  - Utility di Sistema & Automazioni (PowerShell + Resilienza Multi-Ambiente + Sicurezza Pre-flight);
  - Ingegneria del Software & API (Clean Architecture + Test + CI/CD);
  - Ricerca, Saggistica & Knowledge Management.
- **Disaccoppiamento Core vs Utente Configurato**: Nessun dato personale o percorso della macchina entra nel repository Git. L'utente operativo è configurabile tramite onboarding e template neutri.
- **Dogfooding & Area Developer**: La cartella `docs/developer/` ospita la governance per lo sviluppo e l'evoluzione di ASTRALIS stesso (piani, strategie, report).
- **Licenza**: Apache License 2.0 (Copyright 2026 Luca).

---

## 📋 CANCELLO 1: Inventario di Pubblicabilità e Mappatura File

### 1. Documenti di Root
- [MODIFY] `README.md`: Presentazione accattivante per la community GitHub, architettura, domini, adozione rapida, crediti.
- [NEW] `CHANGELOG.md`: Cronologia versioni storiche v1.x, v2.x e annuncio ufficiale della major release v3.0.0.
- [NEW] `ISTRUZIONI_DI_AVVIO.md`: Guida rapida di onboarding per nuovi utenti del framework.

### 2. Knowledge Base Modulare (`knowledge/`)
- [NEW] `knowledge/01_filosofia_e_metodologia/filosofia_sviluppo_e_pair_working.md` (da `abitudini_sviluppo_luca.md` generalizzato).
- [NEW] `knowledge/01_filosofia_e_metodologia/metodo_scrittura_creativa_e_narrativa.md` (da `metodo_scrittura_creativa.md`).
- [NEW] `knowledge/01_filosofia_e_metodologia/stile_comunicazione_ed_ergonomia_vocale.md` (da `stile_comunicazione_nvda.md`).
- [NEW] `knowledge/02_accessibilita_e_audio/accessibilita_videogiochi_e_gameplay.md`.
- [NEW] `knowledge/02_accessibilita_e_audio/sonificazione_e_volumi_sicurezza.md`.
- [NEW] `knowledge/02_accessibilita_e_audio/standard_accessibilita_tastiera_e_screen_reader.md`.
- [NEW] `knowledge/03_architettura_e_metodologie/catalogo_protocolli_operativi_astralis.md` (i 12 Protocolli ufficiali polimorfici).
- [NEW] `knowledge/03_architettura_e_metodologie/ingegneria_delle_regole_e_meta_governance.md` (i 6 Canoni).
- [NEW] `knowledge/03_architettura_e_metodologie/clean_architecture_e_design_pattern.md`.
- [NEW] `knowledge/03_architettura_e_metodologie/orchestrazione_multi_ai_e_collaboratori.md`.
- [NEW] `knowledge/03_architettura_e_metodologie/strategie_testing_e_debug.md`.
- [NEW] `knowledge/03_architettura_e_metodologie/automazioni_powershell_e_resilienza.md`.
- [NEW] `knowledge/04_standard_tecnologici_trasversali/standard_python.md`.
- [NEW] `knowledge/04_standard_tecnologici_trasversali/standard_modding_e_runtime.md`.
- [NEW] `knowledge/04_standard_tecnologici_trasversali/standard_addon_nvda_wxpython.md`.
- [NEW] `knowledge/README.md`.

### 3. Modelli e Template (`templates/`)
- [NEW] `templates/user_preferences.template.md`.
- [NEW] Template di governance base (`AGENTS_TEMPLATE.md`, `GEMINI_TEMPLATE.md`, `STRATEGIA_COGNITIVA_TEMPLATE.md`, `PIANO_TECNICO_TEMPLATE.md`, `REGISTRO_REVISIONI_TEMPLATE.md`, `ARCHIVIO_REVISIONI_TEMPLATE.md`, `REPORT_SESSIONE_TEMPLATE.md`, `CHANGELOG_PROGETTO_TEMPLATE.md`, `README_PROGETTO_TEMPLATE.md`).
- [NEW] `templates/collaboratori_ai/` (`AGENTS_GPT_TEMPLATE.md`, `CLAUDE_TEMPLATE.md`, `COPILOT_TEMPLATE.md`, `CUSTOM_AI_TEMPLATE.md`).
- [NEW] `templates/knowledge_schede_base/` (le schede `00_` .. `10_`).
- [NEW] Nuovi template per la Convergenza Modulare (`templates/progetti_convergenti/`):
  - `videogioco_accessibile/`
  - `scrittura_creativa_e_narrativa/`
  - `software_engineering_e_api/`
  - `addon_e_tecnologie_assistive/`
  - `utility_e_automazioni/`

### 4. Prompt Master Universali (`prompts/`)
- [NEW] `prompts/PROMPT_INIZIALIZZAZIONE_ECOSISTEMA_REGOLE_UNIVERSALE.md`.
- [NEW] `prompts/PROMPT_AGGIORNAMENTO_ECOSISTEMA_ESISTENTE.md`.
- [NEW] `prompts/PROMPT_SETUP_INTERATTIVO_NUOVA_MACCHINA.md`.

### 5. Script di Automazione (`scripts/`)
- [NEW] `scripts/bootstrap_progetto.ps1`.
- [NEW] `scripts/preflight_check_universale.ps1`.
- [NEW] `scripts/aggiorna_ecosistema.ps1`.
- [NEW] `scripts/esporta_starter_kit_zip.ps1`.

### 6. Documentazione Pubblica & Developer Hub (`docs/`)
- [NEW] `docs/architettura/architettura_tre_livelli.md`.
- [NEW] `docs/architettura/matrice_dei_domini_e_convergenza.md`.
- [NEW] `docs/architettura/i_canoni_architetturali_astralis.md`.
- [NEW] `docs/guide/guida_onboarding_e_adozione.md`.
- [NEW] `docs/developer/piani/attivi/PIANO_TECNICO_RILASCIO_ASTRALIS_V3.md`.
- [NEW] `docs/developer/specifiche/inventario_pubblicabilita_cancello_1.md`.
- [NEW] `docs/developer/report/REGISTRO_META_REVISIONI_ASTRALIS.md`.

---

## 🛠️ CANCELLO 2: Specifiche di Trasformazione e Contratti di Standardizzazione

1. **Regola dei Link Markdown (Canone 3 Universale)**:
   - Sostituzione di tutti gli URI assoluti locali schemi di percorsi assoluti locali con link relativi Markdown standard `[Nome](./rel/path.md)`.
2. **Contratto Autore vs Utente**:
   - Paternità inalterata: `Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA) & Antigravity (AI Pair Programmer)`.
   - Utente operativo generalizzato: l'utilizzatore è configurabile tramite `templates/user_preferences.template.md`.
3. **Contratto Multi-AI Agnostico**:
   - Supporto nativo per AI Primaria e AI Ausiliarie su tutti i principali modelli (Antigravity, Codex/GPT, Claude, Copilot, Cursor).
4. **Contratto Matrice di Convergenza Modulare**:
   - I progetti dichiarano composizioni additive (es. Videogioco = Software + Game Loop + Accessibilità Ludica; Scrittura = Governance + Voce Autoriale + Worldbuilding).
5. **Contratto Portabilità Percorsi**:
   - Zero percorsi assoluti hardcodati; utilizzo esclusivo di `$PSScriptRoot`, `$env:USERPROFILE`, `$HOME`, `./`.
6. **Igiene File e Codifica**:
   - UTF-8 senza BOM per tutti i file.
   - Fine riga LF per Markdown/configurazioni; fine riga CRLF per script PowerShell.

---

## Piano di Verifica e Controllo Privacy Pre-Commit
1. **Scansione Privacy & Path Audit**:
   - Verifica automatica tramite script/grep per escludere stringhe come percorsi assoluti personali, cartelle private, email e credenziali.
2. **Controllo Integrità Link Markdown**:
   - Verifica che tutti i link `[Testo](./percorso.md)` puntino a file validi e non usino schemi locali.
3. **Verifica Codifica ed EOL**:
   - Documentazione Markdown in UTF-8 senza BOM con terminazioni LF.
   - Script PowerShell in UTF-8 senza BOM con terminazioni CRLF.
4. **Git Status & Diff Review**:
   - Revisione finale dello stato dell'albero Git prima del commit.
