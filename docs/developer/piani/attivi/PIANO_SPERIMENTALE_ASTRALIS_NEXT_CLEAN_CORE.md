# Piano Sperimentale: ASTRALIS Next Clean Core

- **Identificativo**: `EXP-AST-NEXT-CLEAN-CORE-1A`
- **Tipologia**: Piano Sperimentale Architetturale e di Riduzione Sistemica
- **Autore e approvatore del programma**: Luca (Senior Developer & Author)
- **Supporto alla formalizzazione**: GPT Codex / ChatGPT
- **Data di formalizzazione**: 2026-09-10
- **Branch dedicato**: `experiment/astralis-next-clean-core`
- **Baseline Git protetta**: `d28d1f95159f2d4c48916381c3aeb3f1fd4b7d8f`
- **Stato**: `[E2A APPROVATA E CHIUSA — STOP PRIMA DI E2B]`
- **Approvazione E2A**: conferma esplicita di Luca del 2026-09-10
- **Autorizzazione E1**: conferma esplicita di Luca del 2026-09-10
- **Nome di lavoro**: `ASTRALIS Next`
- **Versione finale**: da decidere dopo la prova; candidata v4.0.0 se i contratti pubblici risultano incompatibili con v3.x
- **Strategia di riferimento**: [`STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md`](../../strategie/STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md)
- **Piano architetturale di riferimento**: [`PIANO_TECNICO_TOKEN_SAVING_E_CONFIG.md`](PIANO_TECNICO_TOKEN_SAVING_E_CONFIG.md)
- **Decisioni vincolanti**: [`DECISIONI_D0_ASTRALIS_V3_1_0.md`](DECISIONI_D0_ASTRALIS_V3_1_0.md)
- **Annesso E2A approvato**: [`SPECIFICA_CONTRATTUALE_E2A_ASTRALIS_NEXT.md`](SPECIFICA_CONTRATTUALE_E2A_ASTRALIS_NEXT.md)
- **Annesso invocazioni approvato**: [`SPECIFICA_ARCHITETTURA_INVOCAZIONI_E_CAPABILITY_E2A.md`](SPECIFICA_ARCHITETTURA_INVOCAZIONI_E_CAPABILITY_E2A.md)

---

## 1. Decisione sperimentale

ASTRALIS Next viene progettato come **Clean Core** sul branch sperimentale, conservando la storia Git e usando `main` come baseline stabile recuperabile.

L'esperimento non è una cancellazione indiscriminata né una riscrittura senza requisiti. È una ricostruzione minima guidata da:

1. strategia Thin Repo, Rich Home;
2. contratti D0..D12;
3. decisioni D0.1..D0.14;
4. Regola 0;
5. accessibilità NVDA e zero mouse;
6. riduzione misurabile di file, duplicazioni e token;
7. possibilità di abbandonare l'esperimento senza modificare `main` o il Master Hub.

Il ramo non è orfano: deriva dal commit documentale protetto e permette confronto, recupero e ripristino puntuale.

---

## 2. Obiettivo

Dimostrare con una sola fetta verticale che il nuovo modello può:

1. riconoscere il contesto di avvio;
2. individuare un `ASTRALIS_HOME` esplicito;
3. leggere manifest e configurazioni JSON;
4. validare gli schemi offline;
5. applicare precedenze deterministiche;
6. restituire un valore puntuale;
7. spiegarne la provenienza;
8. non scrivere nella distribuzione sorgente;
9. produrre diagnostica lineare e accessibile;
10. funzionare senza caricare l'intera knowledge base.

La migrazione completa, l'aggiornamento remoto, la pubblicazione e gli strumenti specialistici non fanno parte della prima fetta.

---

## 3. Evidenze della baseline

L'inventario read-only del commit `d28d1f9` ha rilevato 72 file tracciati.

### 3.1 Peso per area

- `knowledge/`: 16 file, circa 190 KB e 1.589 righe testuali.
- `docs/`: 13 file, circa 106 KB e 1.512 righe testuali.
- `scripts/`: 5 file e 759 righe.
- `templates/`: 25 file e 615 righe.
- `prompts/`: 3 file e 254 righe.
- `CHANGELOG.md`: circa 50 KB e 396 righe.
- `.github/`: 4 file e 124 righe.

### 3.2 Accoppiamenti osservati

- il concetto di Master Hub attraversa istruzioni, prompt, script e knowledge;
- `ASTRALIS_HUB` e `user_preferences` appartengono al modello precedente;
- bootstrap, aggiornamento, preflight ed esportazione hanno responsabilità sovrapposte;
- versione, aggiornamento, knowledge e template sono collegati mediante riferimenti testuali;
- root e `docs/guide/` contengono istruzioni parallele;
- template e knowledge replicano regole personali o riferimenti a ruoli specifici;
- alcuni script incorporano autore, repository o percorsi convenzionali;
- gli unici duplicati byte-identici sono due `.gitkeep` vuoti, ma esistono duplicazioni semantiche diffuse.

Conclusione: una bonifica file-per-file del modello corrente rischia di costare più della costruzione di un nucleo nuovo e misurabile.

---

## 4. Confini dell'esperimento

### 4.1 Incluso nella prima fetta

- manifest di distribuzione minimo;
- schemi strettamente necessari;
- adattatore di validazione offline;
- Safe I/O read-only iniziale;
- Context Resolver;
- Config Resolver;
- CLI con `context`, `config get` e `config explain`;
- fixture isolate;
- test headless dei contratti D1, D4, D5 e parte read-only di D6;
- guida minima da tastiera e NVDA.

### 4.2 Escluso dalla prima fetta

- migrazione reale del Master Hub;
- modifica di progetti reali;
- scritture `apply`;
- installazione definitiva sotto il profilo utente;
- aggiornamento remoto;
- sincronizzazione overlay;
- autoapprendimento persistente;
- RRU, I18N e telemetria;
- packaging e release;
- compatibilità automatica completa con tutte le versioni legacy;
- eliminazione o modifica della copia locale del Master Hub.

---

## 5. Criteri di classificazione dei file

Ogni file della baseline appartiene a una sola classe.

### 5.1 MANTENERE

File già compatibile con l'esperimento o necessario a identità, licenza, governance e recupero. Può richiedere soltanto manutenzione ordinaria non strutturale.

### 5.2 RISCRIVERE

Funzione necessaria al Clean Core, ma contenuto o contratto legati al modello precedente. Il nuovo file viene progettato dal contratto e non corretto mediante patch incrementali.

### 5.3 IMPORTARE DOPO

Contenuto potenzialmente valido, non necessario alla prima fetta. Viene rimosso dalla vista sperimentale iniziale e potrà essere recuperato selettivamente da `main` dopo la stabilizzazione del core.

### 5.4 LASCIARE SU MAIN

Materiale storico, superato, personale o specifico del vecchio modello. Rimane recuperabile nella storia e in `main`, ma non viene portato nel prodotto ASTRALIS Next salvo nuova decisione.

---

## 6. Inventario completo della baseline

Controllo di completezza: 10 file `MANTENERE` + 16 `RISCRIVERE` + 34 `IMPORTARE DOPO` + 12 `LASCIARE SU MAIN` = 72 file.

Il presente piano è stato creato dopo lo snapshot dei 72 file ed è automaticamente classificato `MANTENERE` come documento di controllo; non altera il conteggio della baseline.

### 6.1 MANTENERE — 10 file

1. `.gitattributes`
2. `.github/ISSUE_TEMPLATE/bug_report.yml`
3. `.github/ISSUE_TEMPLATE/config.yml`
4. `.github/ISSUE_TEMPLATE/feature_request.yml`
5. `.github/pull_request_template.md`
6. `.gitignore`
7. `LICENSE`
8. `docs/developer/piani/attivi/DECISIONI_D0_ASTRALIS_V3_1_0.md`
9. `docs/developer/piani/attivi/PIANO_TECNICO_TOKEN_SAVING_E_CONFIG.md`
10. `docs/developer/strategie/STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md`

Motivazione sintetica: infrastruttura Git/GitHub, licenza e documenti normativi già verificati.

### 6.2 RISCRIVERE — 16 file

1. `CHANGELOG.md`
2. `ISTRUZIONI_DI_AVVIO.md`
3. `README.md`
4. `docs/architettura/i_canoni_architetturali_astralis.md`
5. `docs/guide/ISTRUZIONI_DI_AVVIO.md`
6. `docs/guide/guida_onboarding_e_adozione.md`
7. `knowledge/01_filosofia_e_metodologia/stile_comunicazione_ed_ergonomia_vocale.md`
8. `knowledge/02_accessibilita_e_audio/standard_accessibilita_tastiera_e_screen_reader.md`
9. `knowledge/03_architettura_e_metodologie/automazioni_powershell_e_resilienza.md`
10. `knowledge/03_architettura_e_metodologie/catalogo_protocolli_operativi_astralis.md`
11. `knowledge/03_architettura_e_metodologie/ingegneria_delle_regole_e_meta_governance.md`
12. `knowledge/README.md`
13. `scripts/bootstrap_progetto.ps1`
14. `scripts/preflight_check_universale.ps1`
15. `templates/GEMINI_TEMPLATE.md`
16. `templates/collaboratori_ai/AGENTS_GPT_TEMPLATE.md`

Motivazione sintetica: questi file coprono identità pubblica, onboarding, accessibilità, meta-governance, bootstrap, doctor e router AI minimi; la funzione resta, il modello deve cambiare.

### 6.3 IMPORTARE DOPO — 34 file

1. `docs/architettura/architettura_tre_livelli.md`
2. `docs/architettura/matrice_dei_domini_e_convergenza.md`
3. `knowledge/01_filosofia_e_metodologia/filosofia_sviluppo_e_pair_working.md`
4. `knowledge/01_filosofia_e_metodologia/metodo_scrittura_creativa_e_narrativa.md`
5. `knowledge/02_accessibilita_e_audio/accessibilita_videogiochi_e_gameplay.md`
6. `knowledge/02_accessibilita_e_audio/sonificazione_e_volumi_sicurezza.md`
7. `knowledge/03_architettura_e_metodologie/clean_architecture_e_design_pattern.md`
8. `knowledge/03_architettura_e_metodologie/orchestrazione_multi_ai_e_collaboratori.md`
9. `knowledge/03_architettura_e_metodologie/strategie_testing_e_debug.md`
10. `knowledge/04_standard_tecnologici_trasversali/standard_addon_nvda_wxpython.md`
11. `knowledge/04_standard_tecnologici_trasversali/standard_modding_e_runtime.md`
12. `knowledge/04_standard_tecnologici_trasversali/standard_python.md`
13. `scripts/esporta_starter_kit_zip.ps1`
14. `scripts/verifica_aggiornamenti_remoti.ps1`
15. `templates/ARCHIVIO_REVISIONI_TEMPLATE.md`
16. `templates/CHANGELOG_PROGETTO_TEMPLATE.md`
17. `templates/PIANO_TECNICO_TEMPLATE.md`
18. `templates/README_PROGETTO_TEMPLATE.md`
19. `templates/REGISTRO_REVISIONI_TEMPLATE.md`
20. `templates/REPORT_SESSIONE_TEMPLATE.md`
21. `templates/STRATEGIA_COGNITIVA_TEMPLATE.md`
22. `templates/collaboratori_ai/CLAUDE_TEMPLATE.md`
23. `templates/collaboratori_ai/COPILOT_TEMPLATE.md`
24. `templates/collaboratori_ai/CUSTOM_AI_TEMPLATE.md`
25. `templates/knowledge_schede_base/02_architettura_runtime_template.md`
26. `templates/knowledge_schede_base/03_standard_git_commit_template.md`
27. `templates/knowledge_schede_base/04_struttura_dati_template.md`
28. `templates/knowledge_schede_base/NN_living_documentation_template.md`
29. `templates/knowledge_schede_base/NN_registro_bug_soluzioni_template.md`
30. `templates/progetti_convergenti/addon_e_tecnologie_assistive/GEMINI.md`
31. `templates/progetti_convergenti/scrittura_creativa_e_narrativa/GEMINI.md`
32. `templates/progetti_convergenti/software_engineering_e_api/GEMINI.md`
33. `templates/progetti_convergenti/utility_e_automazioni/GEMINI.md`
34. `templates/progetti_convergenti/videogioco_accessibile/GEMINI.md`

Motivazione sintetica: moduli di dominio, adattatori AI, template avanzati, pubblicazione e aggiornamento sono utili soltanto dopo che il nucleo ha dimostrato i propri contratti.

### 6.4 LASCIARE SU MAIN — 12 file

1. `docs/developer/piani/completati/.gitkeep`
2. `docs/developer/piani/completati/PIANO_TECNICO_RILASCIO_ASTRALIS_V3.md`
3. `docs/developer/report/REGISTRO_META_REVISIONI_ASTRALIS.md`
4. `docs/developer/specifiche/inventario_pubblicabilita_cancello_1.md`
5. `docs/developer/strategie/.gitkeep`
6. `prompts/PROMPT_AGGIORNAMENTO_ECOSISTEMA_ESISTENTE.md`
7. `prompts/PROMPT_INIZIALIZZAZIONE_ECOSISTEMA_REGOLE_UNIVERSALE.md`
8. `prompts/PROMPT_SETUP_INTERATTIVO_NUOVA_MACCHINA.md`
9. `scripts/aggiorna_ecosistema.ps1`
10. `templates/knowledge_schede_base/00_consuetudini_operative_template.md`
11. `templates/knowledge_schede_base/01_accessibilita_vocale_template.md`
12. `templates/user_preferences.template.md`

Motivazione sintetica: storia della v3, prompt del Master Hub, aggiornamento legacy e template con configurazione o ruoli personali. Il loro valore resta preservato nel commit di baseline e in `main`.

---

## 7. Struttura minima proposta, non ancora creata

La prima fetta dovrebbe convergere verso questi nodi logici:

1. metadati e governance di repository;
2. `distribution.json`;
3. schemi minimi di distribuzione, installazione, utente, progetto e configurazione locale;
4. `scripts/astralis.ps1` come CLI sottile;
5. `scripts/lib/AstralisSafeIO.psm1`;
6. `scripts/lib/AstralisContext.psm1`;
7. `scripts/lib/AstralisConfig.psm1`;
8. bootstrap minimale;
9. fixture isolate;
10. test unitari e contract test;
11. un solo percorso canonico di onboarding;
12. template minimi `GEMINI.md` e `AGENTS.md`;
13. knowledge ridotta ai contratti universali indispensabili;
14. documenti sperimentali e registro delle evidenze.

Questa lista descrive responsabilità e destinazioni future. Non autorizza la creazione dei file.

---

## 8. Budget strutturale dell'MVP

1. Non più di 20 file di produzione fra CLI, moduli, manifest, schemi e template minimi, esclusi test e documenti decisionali.
2. Ogni router AI non supera 250 righe.
3. Ogni modulo possiede una responsabilità primaria.
4. Nessuna logica di merge, path resolution o contesto viene duplicata.
5. Nessun dato personale o di macchina viene incorporato nei default.
6. Nessuna scansione massiva della knowledge nel percorso caldo.
7. Nessuna dipendenza di rete per `context`, `config get` e `config explain`.
8. Nessuna scrittura nella prima fetta verticale.

Il superamento del budget richiede motivazione, analisi di impatto e approvazione esplicita.

---

## 9. Sequenza sperimentale proposta

### E0 — Baseline e documentazione

- [x] commit documentale protetto su `main`;
- [x] branch sperimentale creato dal commit protetto;
- [x] inventario read-only dei 72 file;
- [x] classificazione completa;
- [x] piano sperimentale formalizzato;
- [x] approvazione esplicita del piano e dell'inventario.

### E1 — Potatura protetta del solo branch

- [x] verificare nuovamente commit, branch e working tree;
- [x] rimuovere dal branch i 12 file `LASCIARE SU MAIN` in un commit dedicato;
- [x] rimuovere dal branch i 34 file `IMPORTARE DOPO` in un secondo commit dedicato;
- [x] verificare che nessuna eliminazione interessi `main`, Master Hub o file non tracciati;
- [x] produrre ricevuta con file rimossi e commit di recupero;
- [x] fermarsi prima delle riscritture.

Le due potature sono separate per rendere evidente la differenza fra materiale escluso e materiale differito.

#### Ricevuta E1

- **Piano formalizzato**: commit `7e85307149a4c7bcc7c6f8fbbe7466ead61d8226`.
- **12 file lasciati su main**: commit `9a314545ad31fb2601f2c41b4f3333932a69c786`, contenente esclusivamente 12 eliminazioni.
- **34 file differiti**: commit `65c4795ed9557aa7c8772b4699e5296c37cd1d97`, contenente esclusivamente 34 eliminazioni.
- **Commit di recupero integrale**: baseline `d28d1f95159f2d4c48916381c3aeb3f1fd4b7d8f`.
- **Confine verificato**: nessuna operazione eseguita su `main`, Master Hub o file non tracciati.
- **Esito**: 46 file rimossi soltanto dal ramo sperimentale; E2 non avviata.

### E2 — Contratti e struttura vuota

#### E2A — Specifica contrattuale, sola documentazione

- [x] formalizzare aree, identità, autorità e confini di scrittura;
- [x] formalizzare profilo utente e profilo macchina senza raccolta reale;
- [x] formalizzare precedenza, provenienza, privacy e proiezione AI selettiva;
- [x] formalizzare gerarchia delle invocazioni, capability, routine, protocolli, modalità e skill AI;
- [x] validare la proposta sui 7 Assi e sulla Matrice a 3 Livelli;
- [x] ottenere l'approvazione esplicita di Luca sulla specifica E2A;
- [x] fermarsi prima di E2B.

E2A è stata approvata nella sua composizione formata dagli annessi [`SPECIFICA_CONTRATTUALE_E2A_ASTRALIS_NEXT.md`](SPECIFICA_CONTRATTUALE_E2A_ASTRALIS_NEXT.md) e [`SPECIFICA_ARCHITETTURA_INVOCAZIONI_E_CAPABILITY_E2A.md`](SPECIFICA_ARCHITETTURA_INVOCAZIONI_E_CAPABILITY_E2A.md). Nessun profilo, schema eseguibile, collector, capability o struttura operativa è stato creato.

#### E2B ed E2C — Non avviate

- [ ] riscrivere soltanto i documenti minimi di identità e onboarding;
- [ ] formalizzare lo schema dei nuovi file prima di crearli;
- [ ] predisporre la struttura minima senza migrazione o aggiornamento;
- [ ] validare privacy, portabilità e accessibilità;
- [ ] fermarsi prima del comportamento esecutivo.

### E3 — Fetta verticale read-only

- [ ] implementare Safe I/O in sola lettura;
- [ ] implementare Context Resolver;
- [ ] implementare validazione JSON Schema offline;
- [ ] implementare Config Resolver e provenienza;
- [ ] esporre `context`, `config get`, `config explain`;
- [ ] eseguire test headless e prova NVDA;
- [ ] misurare prestazioni e token;
- [ ] fermarsi per la decisione di continuazione.

### E4 — Decisione dell'esperimento

Sulla base delle evidenze scegliere una sola direzione:

1. promuovere Clean Core come nuova versione principale;
2. trasferire selettivamente le soluzioni valide nel modello v3;
3. continuare il ramo con correzioni delimitate;
4. abbandonare il ramo senza effetti su `main`.

### E5 — Funzioni successive, soltanto dopo promozione

- scritture pianificate;
- installazione reale;
- overlay;
- migrazione v3.0.4;
- aggiornamento e rollback;
- importazione selettiva dei 34 file differiti;
- strumenti specialistici;
- packaging e release.

---

## 10. Criteri di successo dell'esperimento

L'esperimento è riuscito soltanto se:

1. la fetta verticale soddisfa i contratti selezionati senza accesso alla knowledge completa;
2. clone e release rimangono read-only durante l'uso operativo;
3. ogni valore restituito espone provenienza e livello;
4. schema futuro, file corrotto e contesto sconosciuto falliscono in modo protetto;
5. il percorso completo è utilizzabile da tastiera e comprensibile con NVDA;
6. i test sono deterministici e senza rete obbligatoria;
7. struttura e responsabilità rispettano il budget dell'MVP;
8. il consumo di token viene misurato sul corpus definito;
9. nessun dato personale entra nei file distribuibili;
10. il ramo può essere eliminato o ripristinato senza perdita di `main` o del Master Hub.

---

## 11. Criteri di arresto o revisione

L'esperimento viene fermato o ripianificato se:

- richiede duplicazione sistematica fra PowerShell 5.1 e 7.6;
- il validatore offline non soddisfa le keyword adottate;
- il nuovo core supera il budget senza giustificazione;
- la provenienza richiede caricamenti massivi;
- la compatibilità legacy invade il nucleo prima della sua stabilizzazione;
- le scritture non possono essere confinate in modo affidabile;
- il modello riduce i file ma aumenta ambiguità o carico cognitivo;
- una potatura coinvolge contenuti non recuperabili dal commit protetto.

---

## 12. Rischi e mitigazioni

### R1 — Perdita di contenuti utili

Mitigazione: branch normale, baseline protetta, inventario completo, due commit di potatura e importazione selettiva.

### R2 — Riscrittura più costosa del refactoring

Mitigazione: una sola fetta verticale prima di qualsiasi migrazione o funzione specialistica.

### R3 — Nuovo sistema incompatibile

Mitigazione: ASTRALIS Next come nome sperimentale, decisione v3/v4 rinviata e `main` invariato.

### R4 — Reintroduzione del Master Hub

Mitigazione: nessuna copia massiva; consultazione puntuale e classificazione prima dell'importazione.

### R5 — Nuovo bloat documentale

Mitigazione: un piano attivo, un registro D0, router snelli e knowledge caricata su richiesta.

### R6 — Falsa sicurezza delle eliminazioni

Mitigazione: verificare che ogni file sia tracciato nel commit di baseline; nessuna operazione sul Master Hub o su file non tracciati.

### R7 — Divergenza prolungata da main

Mitigazione: esperimento time-boxed per milestone, commit atomici e decisione obbligatoria dopo E3.

---

## 13. Matrice di simulazione a 3 livelli

### Livello 1 — Happy Path

Il ramo viene potato secondo inventario, la fetta read-only risolve una configurazione valida e `main` resta invariato.

### Livello 2 — Alternative e concorrenza

- un file differito diventa necessario e viene recuperato selettivamente;
- due clone condividono `project-id` ma non stato locale;
- PowerShell 5.1 avvia il bootstrap e delega al core 7.6;
- il repository opera senza rete e senza Git disponibile al runtime.

### Livello 3 — Corner Cases

- file classificato erroneamente ma recuperabile dalla baseline;
- working tree sporca prima della potatura;
- file non tracciato nella destinazione di eliminazione;
- junction o percorso equivalente a una radice protetta;
- schema futuro o configurazione corrotta;
- esperimento abbandonato dopo una potatura parziale.

In tutti i casi l'esito richiesto è arresto protetto o recupero senza modifica di `main` e Master Hub.

---

## 14. Validazione sui 7 Assi

1. **Validità**: branch e baseline protetti rendono l'esperimento recuperabile.
2. **Efficacia**: la fetta verticale verifica l'architettura prima delle funzioni costose.
3. **Coerenza**: inventario, D0, Thin Repo e Regola 0 usano gli stessi confini.
4. **Completezza**: sono definiti ambito, classificazione, sequenza, criteri, rischi e uscita.
5. **Precisione**: tutti i 72 file sono assegnati una sola volta e i conteggi coincidono.
6. **Prestazioni**: il percorso caldo esclude knowledge, rete e scansioni estese.
7. **Assenza di regressioni**: `main` e Master Hub restano invariati; ogni potatura futura è recuperabile.

### 14.1 Esito del protocollo preventivo

Validazione eseguita il 10 settembre 2026 sul ramo sperimentale, prima di qualsiasi potatura o implementazione.

- **Esito meccanico**: 32 controlli superati su 32; nessun errore rilevato.
- **Inventario**: 72 file tracciati su 72 classificati, 72 assegnazioni univoche, nessun file mancante, aggiuntivo o duplicato.
- **Ripartizione**: 10 `MANTENERE`, 16 `RISCRIVERE`, 34 `IMPORTARE DOPO`, 12 `LASCIARE SU MAIN`; totale coerente pari a 72.
- **Integrità documentale**: UTF-8 senza BOM, terminazioni LF, nessuno spazio finale, sezioni numerate in sequenza e collegamenti locali risolti.
- **Neutralità**: nessun percorso assoluto personale o nome utente introdotto nel piano.
- **Protezione Git**: branch corrente, `main` e branch remoto sperimentale allineati alla baseline `d28d1f95159f2d4c48916381c3aeb3f1fd4b7d8f`.
- **Isolamento della modifica**: il solo nuovo elemento della working tree è questo piano non tracciato; nessuna modifica a file già tracciati e nessun contenuto in staging.
- **Revisione concettuale**: nessuna contraddizione bloccante rilevata fra obiettivo, confini, inventario, sequenza E0-E5, criteri di successo, rischi, Matrice a 3 Livelli e 7 Assi di Qualità.

L'esito rende il piano idoneo alla revisione decisionale di Luca, ma non autorizza automaticamente E1 o le fasi successive.

---

## 15. Gating e stop obbligatorio

Alla formalizzazione iniziale questo piano autorizzava esclusivamente analisi, classificazione e documentazione. Luca ha successivamente autorizzato E1, ora completata, e la sola formalizzazione documentale E2A.

Con E1 conclusa, non sono autorizzati:

- spostamenti;
- riscritture dei 16 file;
- creazione della struttura minima;
- manifest, schemi, script, fixture o test;
- modifica di `main` o del Master Hub;
- importazione dei 34 file differiti;
- raccolta reale di dati utente o macchina;
- creazione o esecuzione di capability, routine, protocolli, registri o skill AI;
- avvio di E2B, E2C, E3 o fasi successive.

L'approvazione della proposta E2A non autorizza E2B, E2C o E3. Lo stato corrente impone lo stop prima di ogni schema eseguibile, riscrittura, raccolta dati o creazione strutturale.
