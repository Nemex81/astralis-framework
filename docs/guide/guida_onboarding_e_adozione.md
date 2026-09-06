# Guida di Onboarding e Adozione Rapida di ASTRALIS (v3.0.0)
# Autore: Luca (Senior Developer & Author) & Antigravity (AI Pair Programmer)

Questa guida illustra come adottare ASTRALIS su un nuovo progetto o su un computer pulito in pochi passaggi semplici e accessibili.

---

## 🚀 PASSO 1: PRE-FLIGHT ENVIRONMENT CHECK

Prima di inizializzare l'ambiente, esegui lo script di verifica d'ambiente:
```powershell
./scripts/preflight_check_universale.ps1
```
Lo script verificherà la presenza di Git, Python, Java, Rust e dei percorsi principali del sistema.

---

## 📁 PASSO 2: BOOTSTRAP DEL PROGETTO

Per inizializzare un progetto esistente o una cartella vuota:
```powershell
./scripts/bootstrap_progetto.ps1 -TargetDir "C:\Percorso\Tuo\Progetto"
```
Lo script genererà:
- La gerarchia `docs/` (piani, strategie, report, idee, manuali);
- La base di conoscenza `knowledge/` con le schede modulari di default;
- Il manifest di ingresso `GEMINI.md` o `AGENTS.md`;
- Il segnaposto `README.md` e `CHANGELOG.md`.

---

## 🧩 PASSO 3: CONFIGURAZIONE DELLE PREFERENZE PERSONALI

1. Copia `templates/user_preferences.template.md` nella tua cartella personale o nella radice del progetto rinominandolo in `user_preferences.md`.
2. Compila i campi: nome, modalità di interazione (tastiera/mouse), screen reader usato, domini di lavoro attivi.
3. Il file `user_preferences.md` è automaticamente protetto e ignorato dal `.gitignore`, salvaguardando la tua privacy.

---

## 🤖 PASSO 4: COLLABORAZIONE CON L'AI

All'avvio della sessione con il tuo assistente AI preferito (Antigravity, ChatGPT, Claude, Copilot):
- Incolla il prompt master da `prompts/PROMPT_INIZIALIZZAZIONE_ECOSISTEMA_REGOLE_UNIVERSALE.md`;
- L'AI identificherà il dominio del progetto, applicherà la Regola 0 (default consultivo permanente) e attiverà i protocolli operativi ASTRALIS.
