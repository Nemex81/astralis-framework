# Standard Modding, Mod Loader e Gestione Runtime Congelati (v3.0.0)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: [AI Pair Programmer / Assistente AI]
# Ambito: Globale / Universale

Questo documento definisce i criteri di stabilità, sicurezza e isolamento per il modding di videogiochi, runtime di terze parti e gestione dei fork open-source.

---

## 🛡️ 1. GESTIONE RUNTIME CONGELATI E PROTETTI

1. **Versioni Fissate e Protezione Aggiornamenti**:
   - Le versioni degli eseguibili di gioco e dei mod loader (es. SKSE, RED4ext, CET, SMAPI, Fabric) devono essere censite e congelate.
   - Proteggere i file di manifesto (es. `appmanifest_*.acf` su Steam) per impedire aggiornamenti automatici silenti che corrompano i binari.

2. **Isolamento dei Salvataggi (Profili di Test)**:
   - Utilizzare sempre profili di mod organizer separati (es. MO2 con `LocalSaves=true`).
   - Mai caricare salvataggi di campagne reali su profili di debug/test.

---

## 🌐 2. DISCIPLINA FORK OPEN-SOURCE E MULTILINGUA (I18N)

1. **Integrità dei File Upstream**:
   - I file di configurazione, documentazione e traduzione in lingua inglese (`*_ENGLISH.txt`) devono rimanere in inglese puro per consentire pull request pulite verso i repository open-source a monte.
2. **Localizzazione Italiana Isolata**:
   - Tutte le traduzioni e le ottimizzazioni in lingua italiana devono essere isolate nei file dedicati (`*_ITALIAN.txt`, `it_it.json`), garantendo zero conflitti con l'albero di sviluppo upstream.

---

## 🔌 3. STANDARD PROTOCOLLI MULTIPLAYER CLIENT-SERVER & OFFLINE UUIDS

1. **Topologia e Calcolo Offline UUIDs (Modalità Mista LAN/Dedicata)**:
   - Nei server di sviluppo o dedicati operanti in modalità `online-mode=false`, l'UUID del giocatore non viene interrogato sui server di autenticazione centralizzati ma è calcolato in locale tramite RFC 4122 v3 (MD5 dei byte UTF-8 della stringa `"OfflinePlayer:" + username`):
     $$\text{UUID}_{\text{offline}} = \text{UUID.nameUUIDFromBytes}\left(\text{"OfflinePlayer:"} + \text{username}\right)$$
   - Nei file di permessi e ruoli amministrativi del server (`ops.json`, permessi mod), registrare sempre **sia l'UUID online ufficiale che l'UUID offline calcolato**, garantendo che il giocatore mantenga ininterrottamente i privilegi di amministratore a prescindere dal tipo di sessione o profilo attivo.
2. **Integrità dei Parametri di Rete e Lunghezza Username**:
   - I protocolli di rete voxel/multiplayer (es. `ServerboundHelloPacket`) impongono limiti rigidi e tassativi sulla lunghezza del nickname (massimo **16 caratteri**).
   - Nelle automazioni di configurazione launcher (es. PrismLauncher, MultiMC), verificare che il campo `userName` sia popolato esclusivamente con il nickname puro (`username`), impedendo fallback involontari su etichette di visualizzazione del launcher (es. `"Nickname (Microsoft)"`, lunghe $> 16$ caratteri) che generano errori `EncoderException: String too big`.

---

## 🕹️ 4. STANDARD GESTIONE INPUT, BINDINGS E PREFERENZE UTENTE

1. **Pre-Audit di Collisione Input a Doppio Livello (Livello Engine/Vanilla vs Livello Mod)**:
   - Quando si progetta una combinazione con tasti modificatori (`Alt`, `Ctrl`, `Shift`) in mod di gioco o applicazioni native, verificare tassativamente che il tasto base non sia intercettato a monte dai gestori nativi dell'engine senza controllo modificatori (es. in Minecraft `T` apre la chat, `E` apre l'inventario, `Q` getta l'oggetto anche se combinati con `Alt`).
   - Assegnare unicamente tasti neutri e privi di binding nativi (es. `B`, `P`) per evitare che l'engine consumi l'evento prima della logica di modding.

2. **Sincronizzazione Obbligatoria della Cache Preferenze Utente (`options.txt` / cfg / ini)**:
   - I motori di gioco danno priorità assoluta ai binding serializzati nei file di opzioni utente (`options.txt`) rispetto ai valori di default (`withDefault`) definiti nel codice Java/C#.
   - **Vincolo di Deploy**: Se durante una sessione di refactoring viene modificato il tasto di default di un comando precedentemente distribuito e testato, l'assistente deve aggiornare programmaticamente anche i file di opzioni delle istanze attive prima di richiedere il collaudo manuale.

---

## ⚙️ 5. STANDARD CLOTH CONFIG, AUTOCONFIG & REFLECTION SAFETY

1. **Esclusione Obbligatoria di Campi Statici e Singleton (`@ConfigEntry.Gui.Excluded`)**:
   - Le librerie di configurazione basate su reflection (es. Cloth Config / AutoConfig per Fabric, NeoForge e Forge) analizzano per riflessione tutti i campi dichiarati nelle classi `@Config`.
   - I campi statici di utilità, logger e istanze singleton (`private static Config instance;`) devono essere tassativamente marcati con `@ConfigEntry.Gui.Excluded`.
   - In assenza di questa annotazione, la reflection tenta di istanziare un widget di editing GUI per l'oggetto stesso, generando errori a runtime nei log (`No GUI provider registered for field`).

2. **Trattamento Polimorfico delle Interfacce GUI nei Classloader Modulari**:
   - Nei runtime con classloader avanzati (es. Knot di Fabric), non dare per scontate le classi concrete sottostanti agli oggetti dell'engine.
   - Trattare sempre le categorie, menu e tab tramite le relative interfacce polimorfiche pubbliche evitando downcast forzati a classi concrete non universali.

3. **Estrazione Identificatori di Registro vs toString() in Ambienti Mojmap Moderni (1.21+ / 26.2)**:
   - In Minecraft moderno, molte entità e categorie (es. `RecipeBookCategory`, `CreativeModeTab`, `Biome`, `Block`) sono registrate dinamicamente e non implementano un `.toString()` user-friendly, restituendo il puntatore Java di default (`NomeClasse@hashcode`).
   - **Risoluzione da Registro Tassativa**: Utilizzare sempre `BuiltInRegistries.<REGISTRO>.getKey(oggetto)` per ottenere l'`Identifier` univoco (`namespace:path`).
   - **Supporto Enum e Search Tabs**: Gestire con pattern matching `instanceof` le implementazioni enum polimorfiche (es. `SearchRecipeBookCategory`).
   - **Fallback Resilienti No-Hash**: Qualsiasi fallback `toString()` deve verificare `if (fallback.contains("@")) return I18n.get("chiave.sconosciuto");` per prevenire la pronuncia di hash esadecimali all'utente non vedente.

---

## 🌿 6. DISCIPLINA DUAL-TRACK CHANGELOG NEI FORK & ISOLAMENTO PR UPSTREAM

Quando si opera all'interno di un repository derivato da un progetto open-source di terzi (fork), l'assistente applica tassativamente il modello di disaccoppiamento strategico in due binari:

1. **Binario Pubblico Upstream (`CHANGELOG.md` di radice)**:
   - Redatto nella lingua ufficiale dell'upstream (es. Inglese puro) adottando lo standard *Keep a Changelog*;
   - Utilizza esclusivamente la sezione **`## [Unreleased]`** in cima al file per raccogliere tutte le feature, modifiche e fix sviluppati nel fork;
   - **Zero Version Forcing**: Non impone numeri di versione ufficiali che spetterebbero ai maintainer upstream, garantendo Pull Request pulite, eleganti e immediatamente mergeabili senza conflitti.

2. **Binario Sovrano Personale (`knowledge/NN_diario_modifiche_e_contributi_fork.md`)**:
   - Redatto in **lingua Italiana** all'interno della cartella `knowledge/`;
   - Applica la disciplina del **Versionamento Semantico Sovrano AVF a 3+1 livelli** (`V.A.R[.M]`) per le build personali/locali dello sviluppatore;
   - Raccoglie il razionale architetturale, le note di accessibilità per screen reader NVDA e la cronologia completa delle versioni locali;
   - **Clausola di Sovranità & Zero Lock-In**: Qualora lo sviluppatore decida in futuro di distribuire la mod come software autonomo o hard fork, il diario sovrano AVF costituisce già un changelog storico valido e completo sin dal giorno zero.

3. **Regola di Isolamento Assoluto delle Pull Request Upstream**:
   - Quando si crea un branch per una PR verso il repository a monte (es. `pr/feature-name` basato su `upstream/dev`):
     * **Incluso nella PR**: Unicamente il codice sorgente modificato, i file di risorse/lingua pertinenti, i test unitari e le righe descrittive sotto `## [Unreleased]` in `CHANGELOG.md`.
     * **Tassativamente Escluso dalla PR**: `gemini.md`, l'intera cartella `knowledge/`, le cartelle `docs/piani/` e `docs/report/`, i prompt e qualsiasi file di governance locale di ASTRALIS.

---

## ☕ 7. DISCIPLINA RUNTIME GRADLE & CONFIGURAZIONE DETERMINISTICA MULTI-JDK

Nei progetti di modding avanzato (es. Minecraft 26.2 con requisiti Java 25) che operano su macchine di sviluppo dotate di versioni JDK eterogenee:

1. **Il Rischio di Conflitto JVM di Sistema**:
   - Quando la shell di sistema (PowerShell/CMD) ha una variabile `JAVA_HOME` o `Path` puntata su un JDK legacy (es. Java 22 o 17), l'invocazione di `gradlew` con task inter-progetto (`:fabric:test`, `:neoforge:test`) può fallire con errori di incompatibilità binaria (`Dependency resolution is looking for a library compatible with JVM runtime version 22, but root project is only compatible with JVM runtime version 25 or newer`).
2. **La Soluzione Deterministica in `gradle.properties`**:
   - Impostare tassativamente sia il percorso di runtime sia i percorsi di installazione in `gradle.properties`:
     ```properties
     org.gradle.java.home=C:/Users/<Username>/AppData/Roaming/PrismLauncher/java/java-runtime-epsilon
     org.gradle.java.installations.paths=C:/Users/<Username>/AppData/Roaming/PrismLauncher/java/java-runtime-epsilon
     ```
   - Questa configurazione garantisce che Gradle utilizzi la JVM corretta fin dal processo di bootstrap del daemon/single-use runner, rendendo la compilazione `shadowJar` e l'esecuzione dei test 100% riproducibili indipendentemente dallo stato globale del sistema operativo.
