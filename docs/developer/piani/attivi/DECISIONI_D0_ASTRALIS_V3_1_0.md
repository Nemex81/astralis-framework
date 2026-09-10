# Registro Decisionale D0: ASTRALIS v3.1.0

- **Identificativo**: `DEC-D0-AST-3.1.0`
- **Tipologia**: Registro Decisionale Architetturale e di Certificazione
- **Autore e approvatore**: Luca (Senior Developer & Author)
- **Supporto alla formalizzazione**: GPT Codex / ChatGPT
- **Data di approvazione concettuale**: 2026-09-10
- **Stato**: `[14 DECISIONI APPROVATE — 4 CERTIFICAZIONI TECNICHE PENDENTI — IMPLEMENTAZIONE NON AUTORIZZATA]`
- **Strategia collegata**: [`STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md`](../../strategie/STRATEGIA_ARCHITETTURA_ASTRALIS_HOME_E_MIGRAZIONE_PROGRESSIVA.md)
- **Piano collegato**: [`PIANO_TECNICO_TOKEN_SAVING_E_CONFIG.md`](PIANO_TECNICO_TOKEN_SAVING_E_CONFIG.md)

---

## 1. Scopo e valore normativo

Questo registro chiude sul piano concettuale i 14 punti del Cancello D0 della release ASTRALIS v3.1.0. È la fonte di verità per le decisioni operative che consolidano strategia e piano.

Ogni voce distingue:

1. decisione approvata;
2. motivazione;
3. invarianti;
4. evidenze necessarie alla certificazione;
5. criterio di accettazione;
6. stato.

L'approvazione di una decisione stabilisce la direzione architetturale. La certificazione dimostra che la scelta funziona sull'ecosistema reale. Nessuna delle due autorizza da sola modifiche al codice, configurazioni, migrazioni, build, test implementativi, pubblicazioni o bonifiche.

---

## 2. Stati ammessi

- `APPROVATA`: direzione architetturale accettata.
- `DA CERTIFICARE`: servono evidenze tecniche prima dell'implementazione dipendente.
- `CERTIFICATA`: criteri verificati e prove registrate.
- `BLOCCATA`: una prova ha dimostrato incompatibilità o rischio non risolto.
- `SUPERATA`: sostituita da una decisione successiva formalmente collegata.

Una decisione non può essere dichiarata `CERTIFICATA` sulla base di una previsione. Servono risultati ripetibili.

---

## 3. Dipendenze fra le decisioni

Le decisioni vengono governate in sette blocchi:

1. autorità normativa e formato: D0.1, D0.2;
2. runtime e schemi: D0.3, D0.4;
3. filesystem e concorrenza: D0.5, D0.14;
4. integrità e autenticità: D0.6, D0.13;
5. ciclo di vita locale: D0.7, D0.8, D0.9;
6. autoapprendimento: D0.10;
7. prestazioni e supporto legacy: D0.11, D0.12.

D0.3 precede la certificazione di D0.4. D0.5 e D0.14 precedono qualunque scrittura. D0.13 precede l'installazione di una release pubblica. D0.12 precede qualsiasi migrazione reale.

---

## 4. D0.1 — Autorità della versione ufficiale

- **Decisione**: `distribution.json` è la fonte macchina-autorevole della versione contenuta in un pacchetto.
- **Identità della release**: il tag Git identifica la sorgente della release e deve coincidere con il manifest.
- **Documenti umani**: `README.md`, `CHANGELOG.md` e istruzioni sono proiezioni leggibili e devono concordare, ma non vengono usati per risolvere automaticamente un conflitto.
- **Checkout di sviluppo**: manifest, commit, branch, tag e dirty state vengono mostrati separatamente.
- **Invariante**: un conflitto fra manifest, tag, documentazione, nome dello ZIP o artefatto blocca il rilascio.
- **Evidenza richiesta**: inventario della baseline, regola unica di confronto e fixture con versioni discordanti.
- **Criterio di accettazione**: nessuna combinazione incoerente può essere promossa come release valida.
- **Stato**: `APPROVATA — DA CERTIFICARE sulla baseline reale`.

---

## 5. D0.2 — Codifica e terminazioni di riga

- **Decisione**: la `.gitattributes` del repository prevale per i file versionati.
- **Default ASTRALIS**:
  - Markdown, JSON, YAML, TOML, XML e testo: LF;
  - PowerShell `.ps1`, `.psm1`, `.psd1`: CRLF;
  - ogni file testuale: UTF-8 senza BOM.
- **Repository senza policy**: vengono applicati i default ASTRALIS.
- **Direttiva globale**: deve essere successivamente raffinata da “tutto CRLF” a “policy locale prevalente, default ASTRALIS in sua assenza”.
- **Invariante**: nessun file può avere terminazioni miste.
- **Evidenza richiesta**: audit `.gitattributes`, fixture e round-trip Git su Windows.
- **Criterio di accettazione**: checkout, audit e ricostruzione non generano modifiche spurie.
- **Stato**: `APPROVATA`.

---

## 6. D0.3 — Runtime PowerShell

- **Decisione**: architettura a due livelli.
- **Livello bootstrap**: Windows PowerShell 5.1 esegue soltanto rilevamento, diagnostica iniziale e avvio controllato.
- **Livello core**: PowerShell 7.6 LTS è il runtime di riferimento per ASTRALIS v3.1.0.
- **Compatibilità legacy**: gli script attuali 5.1/7 restano disponibili durante la transizione e vengono classificati prima di qualsiasi riscrittura.
- **Installazione runtime**: nessun download o aggiornamento silenzioso; l'utente riceve istruzioni lineari e accessibili.
- **Fallback**: se una funzione può restare realmente compatibile 5.1 senza duplicazioni o degrado, la compatibilità è ammessa ma non obbligatoria per il core.
- **Evidenza richiesta**: matrice sui cinque script correnti, verifica di sintassi, codifica, errori, moduli e comportamento headless.
- **Criterio di accettazione**: bootstrap 5.1 affidabile e core 7.6 deterministico, senza due implementazioni divergenti.
- **Stato**: `APPROVATA — DA CERTIFICARE`.
- **Fonte tecnica corrente**: [PowerShell Support Lifecycle](https://learn.microsoft.com/en-us/powershell/scripting/install/powershell-support-lifecycle).

---

## 7. D0.4 — Validazione JSON Schema offline

- **Decisione primaria**: usare `Test-Json -SchemaFile` del runtime PowerShell 7.6 dietro un adattatore interno unico.
- **Standard**: JSON Schema Draft 2020-12.
- **Modalità**: schemi e meta-schemi necessari distribuiti localmente; nessun recupero implicito dalla rete.
- **Versione futura**: rifiuto protetto senza riscrittura.
- **Fallback**: se la suite dimostra lacune bloccanti, valutare un adattatore Corvus.JsonSchema separato e versionato, compatibile Apache-2.0.
- **Invariante**: CLI, migratore e installer non dipendono direttamente dall'implementazione del validatore.
- **Evidenza richiesta**: sottoinsieme versionato della suite ufficiale 2020-12, riferimenti locali, errori deterministici e funzionamento offline.
- **Criterio di accettazione**: tutte le keyword utilizzate da ASTRALIS vengono validate correttamente e producono diagnostica stabile.
- **Stato**: `APPROVATA CON FALLBACK — DA CERTIFICARE`.
- **Fonti tecniche correnti**:
  - [Test-Json](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/test-json);
  - [JSON Schema Draft 2020-12](https://json-schema.org/draft/2020-12);
  - [Corvus.JsonSchema](https://github.com/corvus-dotnet/Corvus.JsonSchema).

---

## 8. D0.5 — Junction, link simbolici e reparse point

- **Letture**: ammesse con destinazione canonica dichiarata.
- **Scritture**: negate per default attraverso reparse point.
- **Eccezione**: allowlist locale esplicita della destinazione canonica.
- **Doppia verifica**: durante `plan` e immediatamente prima di `apply`.
- **Scadenza del piano**: ogni variazione della destinazione fisica invalida il piano.
- **Confronto**: sorgente e destinazione vengono confrontate soltanto dopo canonicalizzazione.
- **Invariante**: `--force` non aggira traversal, confini, sorgenti protette o coincidenza fisica.
- **Evidenza richiesta**: fixture con junction interne, esterne, cicliche e modificate fra piano e applicazione.
- **Criterio di accettazione**: nessuna scrittura raggiunge una radice non autorizzata.
- **Stato**: `APPROVATA`.

---

## 9. D0.6 — Integrità del piano di migrazione

- **Formato**: serializzazione canonica e deterministica.
- **Integrità**: SHA-256 del piano e hash distinti delle precondizioni.
- **Precondizioni**: sorgenti, baseline, configurazioni, manifest e destinazioni rilevanti.
- **Applicazione**: `apply` ricalcola gli hash e rifiuta un piano scaduto.
- **Firma digitale locale**: non obbligatoria nella v3.1.0.
- **Motivazione**: il piano locale deve impedire applicazioni accidentali di proposte alterate o vecchie; la gestione di chiavi locali allargherebbe inutilmente il perimetro.
- **Invariante**: la convalida dell'hash non sostituisce la nuova verifica dei confini e delle policy.
- **Evidenza richiesta**: alterazione di ogni precondizione fra `plan` e `apply`.
- **Criterio di accettazione**: ogni cambiamento rilevante produce codice di uscita “piano scaduto” e zero scritture.
- **Stato**: `APPROVATA`.

---

## 10. D0.7 — Conservazione e pulizia

- **Core**: versione attiva, precedente nota come funzionante e una seconda versione di recupero.
- **Protezione**: una versione collegata a migrazione o rollback pendente non è eliminabile.
- **Backup di migrazione**: almeno 90 giorni dopo accettazione esplicita.
- **Ricevute**: 365 giorni per default.
- **Cache ricostruibili**: 7 giorni per default.
- **Configurazione e overlay**: nessuna scadenza automatica.
- **Pulizia v3.1.0**: nessuna cancellazione automatica.
- **Procedura**: `cleanup plan` mostra dimensione, età, dipendenze e recuperabilità; `cleanup apply` richiede autorizzazione separata.
- **Invariante**: le durate sono criteri di eleggibilità, non autorizzazioni alla cancellazione.
- **Evidenza richiesta**: simulazioni con rollback pendente, spazio ridotto e conservazione personalizzata.
- **Criterio di accettazione**: nessun elemento necessario al recupero entra in un piano di pulizia.
- **Stato**: `APPROVATA`.

---

## 11. D0.8 — Più installazioni e profili Windows

- **Perimetro v3.1.0**: installazione per utente; nessuna installazione machine-wide.
- **Identità**: ogni `ASTRALIS_HOME` possiede un `installId`.
- **Selezione**: un solo home attivo per processo, tramite parametro esplicito o `$env:ASTRALIS_HOME`.
- **Isolamento**: configurazioni e overlay di home differenti non vengono uniti implicitamente.
- **Progetti**: uno stesso `project-id` può essere registrato in più home, con `workspace-id` distinti.
- **Cloud**: un home dentro una cartella sincronizzata genera avviso di rischio e non acquisisce garanzie di concorrenza distribuita.
- **Invariante**: stato, lock e percorsi mutanti appartengono a un solo home e workspace.
- **Evidenza richiesta**: due account, due home dello stesso account e due clone dello stesso progetto.
- **Criterio di accettazione**: nessun dato locale viene ereditato da un home o workspace non selezionato.
- **Stato**: `APPROVATA`.

---

## 12. D0.9 — Sincronizzazione degli overlay

- **Decisione v3.1.0**: nessuna sincronizzazione automatica.
- **Cloud e Git**: non sono considerati automaticamente privati.
- **Esportazione futura**: soltanto `export plan` e `export apply`, con classificazione dei dati e destinazione scelta dall'utente.
- **Cifratura**: demandata a strumenti esterni esplicitamente selezionati.
- **Importazione futura**: sempre come proposta con provenienza e conflitti.
- **Conflitti**: vietato il modello “ultima scrittura vince”.
- **Invariante**: nessun dato privato lascia `ASTRALIS_HOME` senza azione esplicita.
- **Evidenza richiesta**: audit dei comandi v3.1.0 e assenza di canali automatici di esportazione.
- **Criterio di accettazione**: uso ordinario e aggiornamento non producono traffico o copie dell'overlay.
- **Stato**: `APPROVATA`.

---

## 13. D0.10 — Promozione della conoscenza

- **Ciclo**: `observed`, `candidate`, `reviewed`, `approved`, `applied`.
- **Controlli prima dell'approvazione**: evidenza, origine, ambito, duplicazioni, privacy, licenza, conflitti e impatto.
- **Destinazioni**:
  - personale globale: overlay utente;
  - privata del progetto: `knowledge-private`;
  - tecnica portabile: repository del progetto;
  - universale: proposta o Pull Request verso ASTRALIS;
  - temporanea: stato revocabile.
- **Invariante**: una voce non passa direttamente da `candidate` ad `applied`.
- **Separazione**: scrittura nel repository o contributo pubblico sono operazioni distinte e autorizzate separatamente.
- **Evidenza richiesta**: una fixture per ciascuna destinazione e conflitti di classificazione.
- **Criterio di accettazione**: ogni conoscenza persistente possiede provenienza, approvazione e destinazione corretta.
- **Stato**: `APPROVATA`.

---

## 14. D0.11 — Prestazioni e benchmark

- **Soglie candidate**:
  - resolver a caldo: p95 non superiore a 150 ms;
  - avvio CLI a freddo: p95 non superiore a 1.200 ms.
- **Misure**: p50, p95 e massimo.
- **Campione**: almeno 5 riscaldamenti e 30 iterazioni misurate.
- **Fixture**: dimensioni, numero di livelli, chiavi e progetti registrati dichiarati e versionati.
- **Profili macchina**: minima supportata e riferimento, con Windows, PowerShell, filesystem e condizioni di sincronizzazione documentati.
- **Separazione**: resolver puro, avvio CLI, discovery estesa e accesso rete misurati indipendentemente.
- **Token**: corpus di almeno 10 richieste e controllo della perdita informativa.
- **Invariante**: nessuna soglia viene dichiarata raggiunta prima delle misure.
- **Fallback**: una soglia irrealistica viene aggiornata sulla base delle evidenze, senza cache o scorciatoie premature.
- **Criterio di accettazione**: protocollo ripetibile e risultati confrontabili con la baseline 3.0.4.
- **Stato**: `APPROVATA — DA CERTIFICARE`.

---

## 15. D0.12 — Baseline legacy supportate

- **Livello A, certificato**: v3.0.4 con inventario, hash completi, confronto a tre vie e `plan/apply` automatizzabile.
- **Livello B, assistito**: v2.6.x–v3.0.3 quando esiste una baseline riconoscibile; automazione limitata alle classificazioni ad alta confidenza.
- **Livello C, conservativo**: versione o baseline non riconosciuta; sola discovery e proposta, nessuna classificazione automatica come eliminabile.
- **Promozione**: una baseline passa al livello A soltanto dopo inventario, fixture, test di interruzione e rollback.
- **Invariante**: il supporto assistito non viene descritto come migrazione automatica garantita.
- **Evidenza richiesta**: catalogo degli Starter Kit, hash, contenuti attesi e anomalie note.
- **Criterio di accettazione**: v3.0.4 certificata per prima; ogni versione precedente viene promossa separatamente.
- **Stato**: `APPROVATA — DA CERTIFICARE`.

---

## 16. D0.13 — Autenticità di pacchetti e release

- **Origine**: release generata dalla pipeline a partire da tag protetto.
- **Materiale prodotto**: ZIP, manifest, inventario, SHA-256 e SBOM.
- **Provenienza**: attestazione del pacchetto e del manifest quando disponibile nel piano GitHub e nella visibilità del repository.
- **Verifica**: repository, workflow, commit e tag devono rispettare la policy ASTRALIS.
- **Offline**: conservazione del bundle necessario alla verifica di un pacchetto già scaricato.
- **Classi di fiducia**:
  - `trusted-release`: provenienza e integrità verificate;
  - `integrity-only`: hash coerenti ma autenticità non dimostrata;
  - `unverified`: verifica assente o fallita.
- **Repository privato**: finché le attestazioni non sono disponibili nel piano GitHub usato, la build resta interna oppure usa una firma distaccata esplicitamente documentata.
- **Invariante**: hash e archivio provenienti dalla stessa sorgente non dimostrano autenticità.
- **Evidenza richiesta**: release candidata valida, pacchetto alterato, attestazione errata, verifica offline e repository non corrispondente.
- **Criterio di accettazione**: soltanto `trusted-release` può essere installata senza avviso rafforzato.
- **Stato**: `APPROVATA`.
- **Fonti tecniche correnti**:
  - [Artifact attestations](https://docs.github.com/en/actions/concepts/security/artifact-attestations);
  - [Generazione e verifica delle attestazioni](https://docs.github.com/en/actions/how-tos/secure-your-work/use-artifact-attestations/use-artifact-attestations).

---

## 17. D0.14 — Lock, concorrenza e recupero

- **Granularità**: lock distinti per installazione, progetto e overlay.
- **Letture**: snapshot validi senza lock globale.
- **Scritture**: un solo writer per risorsa.
- **Creazione**: lock atomico ed esclusivo.
- **Metadati**: `operationId`, processo, ora di avvio del processo, hostname, identità logica, risorsa, timestamp e heartbeat.
- **Lock locale obsoleto**: recuperabile soltanto quando processo e relativa ora di avvio non corrispondono più.
- **Lock remoto o ambiguo**: mai interrotto automaticamente.
- **Recupero**: `doctor lock plan` e successivo `apply`, quindi nuova validazione di staging, ricevute e destinazione.
- **Cloud**: OneDrive o altri sistemi di sincronizzazione non vengono usati come lock distribuito.
- **Invariante**: il solo superamento di un timeout non autorizza la rottura del lock.
- **Evidenza richiesta**: writer concorrenti, PID riutilizzato, crash, lock remoto, heartbeat fermo e recupero interrotto.
- **Criterio di accettazione**: nessuna concorrenza produce due writer o stato parzialmente promosso.
- **Stato**: `APPROVATA`.

---

## 18. Certificazioni tecniche pendenti

Quattro decisioni richiedono una prova dedicata prima dell'implementazione che ne dipende:

1. **D0.3 Runtime**: matrice Windows PowerShell 5.1 e PowerShell 7.6 sugli script reali.
2. **D0.4 JSON Schema**: suite 2020-12 offline e verifica del fallback.
3. **D0.11 Prestazioni**: benchmark baseline e definizione dei due profili macchina.
4. **D0.12 Legacy**: inventario e hash ufficiali, iniziando dalla v3.0.4.

Le prove devono essere pianificate e autorizzate separatamente. Eventuali fixture, script di prova o dipendenze appartengono alla Sotto-Fase 1B e non sono autorizzati da questo registro.

---

## 19. Sequenza di consolidamento

1. Collegare questo registro a strategia e piano.
2. Dichiarare chiusi i 14 quesiti concettuali.
3. Mantenere aperte soltanto le quattro certificazioni tecniche.
4. Eseguire un audit documentale di coerenza e collegamenti.
5. Fermarsi prima di creare fixture o prototipi.
6. Richiedere autorizzazione esplicita per la certificazione tecnica.
7. Dopo le certificazioni, aggiornare gli stati senza riscrivere le decisioni già approvate.
8. Avviare l'implementazione soltanto con una distinta autorizzazione di Luca.

---

## 20. Gating finale

Le 14 decisioni sono approvate come direzione architetturale. D0.3, D0.4, D0.11 e D0.12 restano `DA CERTIFICARE`.

Questo documento non autorizza codice, configurazioni, fixture, dipendenze, test implementativi, migrazioni, build, release, commit, pubblicazioni o cancellazioni. Ogni passaggio successivo richiede il comando esplicito previsto dalla Regola 0.
