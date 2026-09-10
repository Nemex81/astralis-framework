# Strategia Architetturale: ASTRALIS_HOME, Thin Repo & Migrazione Progressiva

- **Identificativo**: `STRAT-AST-3.1.0-HOME-MIGRATION`
- **Tipologia**: Strategia Logico-Cognitiva e Architetturale
- **Autori**: Luca (Senior Developer & Author), Antigravity (AI Pair Programmer)
- **Revisore**: GPT Codex / ChatGPT (Copilota Ausiliario e Senior Reviewer)
- **Data di formalizzazione**: 2026-09-10
- **Stato**: `[FORMALIZZATA E CONSOLIDATA — 14 DECISIONI D0 APPROVATE, 4 DA CERTIFICARE; IMPLEMENTAZIONE NON AUTORIZZATA]`
- **Baseline osservata**: ASTRALIS `v3.0.4`
- **Target proposto**: ASTRALIS `v3.1.0`
- **Piano tecnico collegato**: [`PIANO_TECNICO_TOKEN_SAVING_E_CONFIG.md`](../piani/attivi/PIANO_TECNICO_TOKEN_SAVING_E_CONFIG.md)
- **Registro decisionale collegato**: [`DECISIONI_D0_ASTRALIS_V3_1_0.md`](../piani/attivi/DECISIONI_D0_ASTRALIS_V3_1_0.md)
- **Fonti normative**:
  - [`automazioni_powershell_e_resilienza.md`](../../../knowledge/03_architettura_e_metodologie/automazioni_powershell_e_resilienza.md)
  - [`ingegneria_delle_regole_e_meta_governance.md`](../../../knowledge/03_architettura_e_metodologie/ingegneria_delle_regole_e_meta_governance.md)
  - [`catalogo_protocolli_operativi_astralis.md`](../../../knowledge/03_architettura_e_metodologie/catalogo_protocolli_operativi_astralis.md)

---

## 1. Decisione strategica

ASTRALIS deve distinguere in modo formale e verificabile:

1. la distribuzione ufficiale o il clone sorgente;
2. il core operativo installato sul computer dell'utente;
3. il profilo privato e l'autoapprendimento dell'utente;
4. la configurazione locale e privata dei singoli progetti;
5. la conoscenza tecnica portabile che deve rimanere versionata insieme al codice.

La strategia approvata adotta il modello **Thin Repo, Rich Home**:

- `ASTRALIS_HOME` contiene il core installato, i dati privati, gli overlay e lo stato operativo;
- ogni repository conserva un manifest portabile, router AI snelli e la conoscenza tecnica necessaria a comprendere, costruire, testare e revisionare quel progetto;
- nessun processo quotidiano usa il clone ufficiale o una release estratta come cartella operativa mutabile;
- nessuna migrazione sposta o elimina automaticamente la knowledge preesistente;
- i progetti legacy restano utilizzabili durante una conversione progressiva e reversibile.

---

## 2. Problema sistemico da risolvere

Nell'architettura precedente il Master Hub può assumere contemporaneamente i ruoli di:

- sorgente delle regole universali;
- profilo personale dell'utente;
- ambiente operativo quotidiano;
- archivio delle release;
- strumento di pubblicazione;
- memoria delle personalizzazioni e dell'autoapprendimento.

Nei progetti maturi la specializzazione ASTRALIS può inoltre distribuire dati e regole fra:

- router AI;
- knowledge locale;
- documenti di strategia, piano e report;
- script e configurazioni di build;
- percorsi di deploy, backup e telemetria;
- branch Git e riferimenti storici.

Questa sovrapposizione genera quattro rischi:

1. una nuova release può sovrascrivere conoscenza personale;
2. dati di macchina possono essere pubblicati in un repository;
3. informazioni dinamiche possono diventare obsolete nei router;
4. il repository ufficiale può essere modificato accidentalmente da procedure operative.

---

## 3. Evidenze ricavate dai casi reali

### 3.1 Master Hub operativo legacy

L'audit sul Master Hub esistente ha rilevato:

- assenza di una configurazione JSON strutturata;
- compresenza di core, profilo personale, strumenti di pubblicazione e archivi;
- presenza di script che effettuano sia audit sia scritture automatiche;
- discovery dei progetti limitata dalla posizione fisica del Master Hub;
- presenza di percorsi personali negli strumenti riservati allo sviluppo;
- disponibilità di Starter Kit storici da `v2.6.0` a `v3.0.4` utilizzabili come baseline forensi;
- corrispondenza esatta fra i 58 file dello Starter Kit `v3.0.4` e il contenuto corrente non appartenente alla cartella delle release;
- assenza di un manifest formale con identità, ruolo, hash e compatibilità.

Il confronto fra nucleo attivo del Master Hub e repository pubblico ha rilevato:

- 12 file identici;
- 30 file divergenti;
- 8 file presenti soltanto nel Master Hub.

Conclusione: il Master Hub non può essere sostituito integralmente. Deve essere riconciliato mediante confronto a tre vie.

### 3.2 Progetto maturo Minecraft Access

L'audit sul progetto ha rilevato:

- repository Git integro e suite esistente con 354 test senza fallimenti;
- router AI associati a versioni ASTRALIS differenti;
- branch reale diverso da alcuni branch dichiarati nei documenti;
- percorsi assoluti e collegamenti locali dentro file versionati;
- preferenze utente conservate in un file tracciato da Git;
- percorsi Java locali correttamente mantenuti in un file ignorato;
- regole di dominio, decisioni architetturali, strategie e revisioni che devono restare associate al codice;
- valori di versione discordanti fra tag Git, artefatto, commit e documentazione.

Conclusione: la migrazione non deve scegliere una sorgente arbitraria e non deve esternalizzare tutta la knowledge. Deve classificare dati, evidenze e conflitti.

---

## 4. Obiettivi strategici

1. Proteggere distribuzioni, clone e release da scritture operative accidentali.
2. Installare ASTRALIS in una sede locale esplicita e indipendente.
3. Separare core immutabile, dati privati, conoscenza appresa e stato temporaneo.
4. Conservare nei repository la conoscenza tecnica portabile e correlata al codice.
5. Ridurre duplicazioni e consumo di token mediante query puntuali.
6. Migrare progetti e installazioni legacy senza perdita di dati.
7. Consentire aggiornamenti affiancati, verifica preventiva e rollback.
8. Rendere osservabile la provenienza di ogni valore risolto o migrato.
9. Preservare Regola 0, accessibilità NVDA e autorizzazione granulare.
10. Supportare installazioni da release, clone, fork e ambienti privi di Git.

---

## 5. Non-obiettivi

La versione 3.1.0 non deve:

- impedire a un utente di modificare volontariamente un clone o fork Apache-2.0;
- trasformare ASTRALIS in un sistema di gestione dei segreti;
- spostare automaticamente tutto il codice sorgente sotto `ASTRALIS_HOME`;
- esternalizzare piani, strategie, RRU e conoscenza tecnica necessaria al progetto;
- riscrivere la storia Git;
- eliminare il Master Hub o i file legacy durante la prima migrazione;
- sincronizzare automaticamente dati privati con GitHub;
- applicare autonomamente regole apprese senza autorizzazione;
- imporre una conversione immediata a tutti i progetti esistenti;
- includere nella prima milestone ogni automazione specialistica non necessaria al core.

---

## 6. Principi inviolabili

### 6.1 Distribution Is Not Runtime

Una distribuzione ufficiale, un clone o uno ZIP estratto sono sorgenti di installazione o workspace di sviluppo. Non sono la sede dei dati operativi privati.

### 6.2 Immutable Core, Mutable Overlay

Il core installato è versionato e immutabile durante l'uso ordinario. Le personalizzazioni vivono in overlay separati e tracciabili.

### 6.3 Repository Portabile e Autosufficiente

Un clone di progetto deve rimanere comprensibile da collaboratori, CI e agenti remoti anche quando `ASTRALIS_HOME` non è disponibile.

### 6.4 Single Source of Truth per Ambito

Ogni dato possiede un solo ambito autorevole: core, utente, progetto portabile, progetto locale oppure stato derivato.

### 6.5 Migrazione Progressiva

Un progetto legacy continua a funzionare. La migrazione produce prima inventario e proposta, poi applica soltanto gli interventi approvati.

### 6.6 Three-Way Reconciliation

Quando è disponibile una baseline, il sistema confronta:

1. vecchio core ufficiale;
2. installazione o progetto corrente;
3. nuovo core ufficiale.

Le differenze dell'utente non vengono confuse con quelle della nuova release.

### 6.7 Provenance First

Ogni valore dedotto registra sorgente, livello di confidenza e conflitti. In caso di dubbio il sistema propone e non decide.

### 6.8 Regola 0 End-to-End

La discovery e il dry-run sono read-only. Scrittura, migrazione, bonifica e cancellazione richiedono autorizzazione esplicita.

---

## 7. Modello Thin Repo, Rich Home

### 7.1 ASTRALIS_HOME

Percorso predefinito proposto:

`%USERPROFILE%\.astralis`

Un percorso personalizzato viene dichiarato tramite `$env:ASTRALIS_HOME` e confermato durante l'onboarding.

La sede contiene logicamente:

- `install.json`: identità e stato dell'installazione;
- `current.json`: puntatore testuale alla versione attiva;
- `versions/<versione>/`: core ufficiali installati e immutabili;
- `config/user.json`: configurazione globale privata;
- `overlays/user/`: conoscenza e regole personali approvate;
- `projects/<project-id>/project.local.json`: configurazione privata del progetto;
- `projects/<project-id>/knowledge-private/`: apprendimento non portabile;
- `projects/<project-id>/migration/`: inventari, proposte e ricevute;
- `state/`: cache, lock, indici e controlli remoti;
- `backups/`: copie necessarie a rollback e recupero.

### 7.2 Repository di progetto

Il repository conserva:

- `.astralis/project.json`, portabile e versionabile;
- router AI snelli;
- knowledge tecnica specifica del dominio;
- strategie, piani e report collegati al codice;
- RRU e archivio delle revisioni;
- requisiti di build, test e compatibilità;
- configurazioni prive di dati macchina o segreti.

### 7.3 Dati derivati

Non devono essere duplicati come configurazione autorevole:

- branch Git corrente;
- stato della working tree;
- tag e commit correnti;
- hostname attivo;
- artefatto effettivamente generato;
- istanze runtime disponibili;
- disponibilità di toolchain e AI.

Questi valori vengono rilevati, validati e memorizzati soltanto in cache revocabile.

---

## 8. Classificazione dei contesti

Il Context Resolver deve distinguere:

1. `DistributionSource`: clone o sorgente del framework.
2. `ReleaseBundle`: contenuto estratto da una release.
3. `InstalledCore`: versione installata sotto `ASTRALIS_HOME`.
4. `UserOverlay`: profilo o conoscenza privata dell'utente.
5. `ProjectWorkspace`: progetto dotato di manifest ASTRALIS.
6. `LegacyProject`: progetto con marker storici ma senza manifest.
7. `DevelopmentSource`: clone registrato esplicitamente per lo sviluppo.
8. `Unknown`: cartella non riconosciuta con affidabilità sufficiente.

La classificazione indica le operazioni ammesse. Non determina proprietà legale e non limita la libertà di modifica di fork o clone.

---

## 9. Politica delle operazioni

### 9.1 Distribuzione o release

Sono ammesse per default:

- verifica;
- lettura della versione;
- installazione;
- controllo aggiornamenti;
- consultazione della documentazione.

Sono negate o reindirizzate:

- autoapprendimento dentro la sorgente;
- scrittura di configurazioni personali;
- migrazione senza destinazione esplicita;
- self-healing della sorgente in modalità operativa.

### 9.2 Core installato

È consentita l'esecuzione. Ogni aggiornamento installa una nuova versione affiancata e non modifica quella attiva in-place.

### 9.3 Overlay utente

Può ricevere soltanto dati privati e apprendimenti approvati. Ogni voce deve avere provenienza e data.

### 9.4 Progetto

Le modifiche sono limitate alla radice riconosciuta. Percorsi risolti devono essere canonici e verificati contro traversal, junction e reparse point.

### 9.5 Sorgente di sviluppo

Le modifiche al framework sono ammesse soltanto quando l'utente richiede esplicitamente un'operazione di sviluppo. La registrazione della radice affidabile vive nel profilo privato.

---

## 10. Strategia di migrazione legacy

### 10.1 Rilevamento versione

Ordine di affidabilità:

1. manifest installazione firmato o verificato;
2. manifest della release;
3. tag Git coerente con il contenuto;
4. `CHANGELOG.md` e router concordanti;
5. corrispondenza hash con una baseline nota;
6. deduzione assistita e conferma dell'utente.

### 10.2 Baseline

La baseline può provenire da:

- Starter Kit locale corrispondente;
- release ufficiale già presente in cache;
- tag o release remota, soltanto se l'accesso alla rete è autorizzato;
- inventario conservato da una precedente installazione.

Se la baseline manca, la migrazione opera in modalità conservativa e non classifica automaticamente le differenze come eliminabili.

### 10.3 Classificazione delle differenze

Ogni elemento viene marcato come:

- core ufficiale invariato;
- core ufficiale modificato localmente;
- personalizzazione utente;
- conoscenza portabile di progetto;
- configurazione locale privata;
- stato derivato o cache;
- conflitto;
- elemento sconosciuto protetto per default.

### 10.4 Sequenza

1. Inventario read-only.
2. Snapshot o riferimento Git verificato.
3. Riconoscimento della baseline.
4. Confronto a tre vie quando possibile.
5. Proposta di configurazioni e overlay in staging.
6. Rapporto dry-run lineare per NVDA.
7. Approvazione granulare.
8. Installazione della nuova versione affiancata.
9. Applicazione atomica su copie o file nuovi.
10. Validazione di equivalenza.
11. Attivazione mediante `current.json`.
12. Conservazione della precedente versione e degli originali.
13. Bonifica separata e facoltativa con nuova autorizzazione.

---

## 11. Compatibilità progressiva

ASTRALIS 3.1.0 deve supportare:

- nuovi progetti nativi;
- progetti migrati con manifest e overlay;
- progetti ASTRALIS 3.0.x senza manifest;
- progetti ASTRALIS 2.6.x, 2.7.x e 2.8.x quando è disponibile una baseline;
- progetti più vecchi in modalità assistita e conservativa;
- repository senza Git;
- fork con remote non canonico;
- ambienti temporaneamente privi di `ASTRALIS_HOME`.

Un progetto legacy non viene bloccato. Il resolver costruisce una vista compatibile in memoria e propone la registrazione.

---

## 12. Autoapprendimento a destinazione controllata

Ogni nuova conoscenza viene classificata prima di essere proposta:

1. personale globale: overlay utente;
2. privata del progetto: `knowledge-private` esterna;
3. tecnica portabile del progetto: knowledge del repository;
4. candidata universale: area proposte dell'overlay, poi eventuale contributo al framework;
5. temporanea o telemetrica: stato revocabile.

Il sistema può rilevare e formulare proposte autonomamente. L'applicazione permanente richiede sempre autorizzazione esplicita.

---

## 13. Aggiornamento e rollback

L'aggiornamento segue queste invarianti:

- staging fuori dal core attivo;
- verifica manifest e hash;
- nessuna scrittura nella distribuzione sorgente;
- migrazione della configurazione su copia;
- verifica degli overlay contro la nuova versione;
- test prima dell'attivazione;
- cambio atomico del puntatore;
- conservazione della versione precedente;
- rollback senza ricostruzione manuale;
- rapporto finale con file cambiati e file preservati.

---

## 14. Strategia di contenimento del costo

La prima milestone 3.1.0 deve concentrarsi sul nucleo:

1. manifest;
2. `ASTRALIS_HOME`;
3. classificazione del contesto;
4. configurazione a strati;
5. resolver read-only;
6. onboarding;
7. migrazione progressiva;
8. aggiornamento e rollback;
9. audit e test del nucleo.

Gli script specialistici RRU, I18N e telemetria possono essere implementati come milestone successive, consumando il resolver già stabilizzato.

La migrazione iniziale non sposta tutta la knowledge. Estrae prima soltanto dati personali e di macchina ad alta confidenza.

---

## 15. Rischi strategici e mitigazioni

### Rischio 1: perdita di personalizzazioni

Mitigazione: confronto a tre vie, staging, backup, protezione degli elementi sconosciuti e nessuna cancellazione automatica.

### Rischio 2: repository non autosufficiente

Mitigazione: mantenere nel repository knowledge tecnica, piani, strategie, RRU e manifest portabile.

### Rischio 3: configurazione divergente

Mitigazione: precedenza univoca, schema versionato e provenienza di ogni valore.

### Rischio 4: aggiornamento parziale

Mitigazione: installazione affiancata, marker di completezza e puntatore attivato soltanto dopo i test.

### Rischio 5: dati privati pubblicati

Mitigazione: classificazione preventiva, file locali esterni e audit Git prima di ogni commit.

### Rischio 6: eccesso di complessità

Mitigazione: milestone core ridotta, compatibilità legacy read-only e automazioni specialistiche differite.

### Rischio 7: fonte di versione ambigua

Mitigazione: gerarchia delle evidenze e conflitto esplicito senza scelta arbitraria.

### Rischio 8: lock o percorsi equivalenti

Mitigazione: canonicalizzazione, controllo reparse point, lock con timeout e scritture atomiche sullo stesso volume.

---

## 16. Criteri strategici di successo

La strategia è realizzata quando:

- un clone o ZIP può installare ASTRALIS senza diventare ambiente operativo;
- un progetto legacy resta utilizzabile prima, durante e dopo la migrazione;
- un aggiornamento non modifica il core attivo in-place;
- dati personali non vengono inseriti nei repository;
- knowledge tecnica resta collegata al commit del codice;
- ogni valore risolto può dichiarare la propria provenienza;
- una migrazione interrotta non rende inutilizzabile il sistema;
- il rollback ripristina la versione precedente senza perdita di overlay;
- le query puntuali riducono il contesto senza nascondere invarianti essenziali;
- ogni scrittura permanente rispetta la Regola 0.

---

## 17. Validazione preventiva sui 7 Assi

1. **Validità**: modello compatibile con filesystem, Git, release ZIP e configurazioni locali.
2. **Efficacia**: elimina la coincidenza pericolosa fra sorgente, runtime e personalizzazioni.
3. **Coerenza**: applica Context Fencing, DRY, Isola Protetta, Hub & Spoke e Regola 0.
4. **Completezza**: comprende installazione, uso quotidiano, migrazione, aggiornamento, rollback e autoapprendimento.
5. **Precisione**: definisce ruoli, sorgenti, precedenze e comportamenti in caso di dubbio.
6. **Prestazioni**: privilegia manifest piccoli, lookup limitati e cache revocabile.
7. **Assenza di regressioni**: mantiene modalità legacy e preserva originali e versione precedente.

---

## 18. Matrice di simulazione a 3 livelli

### Livello 1: Happy Path

Una release verificata installa un core nuovo in `ASTRALIS_HOME`, registra un progetto, risolve la configurazione e non modifica la sorgente.

### Livello 2: Alternative e concorrenza

Clone, fork, repository senza Git, percorso personalizzato, più versioni e processi concorrenti producono esiti deterministici, lock controllati e nessuna sovrascrittura implicita.

### Livello 3: Corner Cases

Manifest corrotto, baseline assente, percorso equivalente alla sorgente, disco pieno, file bloccato, configurazione futura o migrazione interrotta causano arresto protetto, diagnostica lineare e rollback.

---

## 19. Gating finale della strategia

Questa strategia formalizza il modello approvato in fase consultiva. Le 14 decisioni del Cancello D0 sono approvate nel registro collegato; runtime, validatore JSON Schema, prestazioni e baseline legacy richiedono ancora certificazione tecnica.

La strategia non autorizza implementazione, fixture, dipendenze, test implementativi, migrazione, scrittura di configurazioni o bonifica. L'avvio delle certificazioni e della Sotto-Fase 1B richiede un comando esplicito successivo di Luca.
