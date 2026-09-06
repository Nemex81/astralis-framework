# Accessibilità nei Videogiochi, Navigazione e Gameplay Accessibile
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: [AI Pair Programmer / Assistente AI]
# Ambito: Globale / Universale

Questo documento raccoglie gli standard di game design e le soluzioni tecniche per rendere qualsiasi videogioco o mondo virtuale accessibile e fruibile al 100% da non vedenti.

---

## 🧭 1. SISTEMI DI ORIENTAMENTO E NAVIGAZIONE SPAZIALE

1. **Bussola Vocale Dinamica**:
   - Un tasto dedicato (es. `Numpad 5` o comando rapido) deve vocalizzare istantaneamente l'orientamento cardinale del personaggio:
     - 8 direzioni cardinali: Nord, Nord-Est, Est, Sud-Est, Sud, Sud-Ovest, Ovest, Nord-Ovest.
     - Gradi esatti (0°-359°) su richiesta o per regolazioni fini.

2. **Feedback Sonoro di Movimento & Terreno (Guadagno Dedicato Giocatore)**:
   - I motori di gioco commerciali tendono ad attenuare drasticamente i passi del personaggio (spesso al 15% del volume) considerandoli rumore di fondo.
   - Nelle interfacce accessibili, implementare un canale di amplificazione indipendente (fino a 200%-300%) dedicato esclusivamente al giocatore locale per garantire ritmo di marcia e discriminazione del terreno (legno, pietra, terra, ghiaia, sabbia, lana).
   - Offrire sempre sia la regolazione statica da menu opzioni, sia comandi rapidi da tastiera con modificatori sicuri (es. `Alt + Page Up/Down`) privi di effetti collaterali sulla postura o sul movimento (Zero-Sneak).
   - Feedback acustico distinto per azioni corporee: accovacciarsi (crouch), scattare (sprint), saltare, atterrare e arrampicarsi.

3. **Sonar e Beep di Puntamento Obiettivi**:
   - Sistema di scansione con segnale acustico (ping) modulato in frequenza (pitch più alto = più vicino) e panning stereofonico verso il target, waypoint o porta più vicina.

---

## 🤖 2. SCANSIONE SCENARIO & INTEGRAZIONE VISIONE/IA

1. **Scansione dello Scenario su Richiesta**:
   - Funzionalità per catturare l'inquadratura attuale ed elaborare tramite IA/riconoscimento visivo l'elenco ordinato degli oggetti, nemici, ostacoli e punti di interesse presenti nel campo visivo.
2. **Modalità Esplorazione a Griglia / Blocchi**:
   - Per giochi strategici o RPG, supporto alla navigazione a celle logiche con sintesi vocale che descrive il contenuto della cella selezionata e le adiacenze.

---

## 🎯 3. SEMANTICA NATURALE DEI VETTORI SPAZIALI PER SCREEN READER

1. **Formule Vettoriali Lineari Dirette**:
   - Nella vocalizzazione delle posizioni relative (target, POI, nemici, NPC, waypoint), evitare tassativamente frammentazioni telegrafiche o calchi letterali dall'inglese (es. *"5 lontano dai blocchi"*).
   - Utilizzare formule vettoriali naturali relative all'orientamento del giocatore:
     - Formato: `"[Nome Bersaglio]: X [unità] avanti/indietro, Y in alto/basso, Z a sinistra/destra"`.
2. **Priorità Cognitiva e Sintesi**:
   - Collocare prima l'asse di avanzamento (avanti/indietro), poi il dislivello (in alto/in basso) e infine l'azimut laterale (a sinistra/a destra) per consentire al giocatore di orientarsi immediatamente senza dover ricalcolare la traiettoria a mente.

---

## 🎧 4. PROPAGAZIONE ACUSTICA REALISTICA & OCCLUSIONE MATERIALE (VOXEL/MESH)

1. **Il Paradosso della Vicinanza Sonora**:
   - Nei motori di gioco 3D privi di occlusione fisica, i suoni esterni attraversano pareti piene senza smorzamento, generando nel giocatore non vedente la falsa percezione che il mob/bersaglio sia nella stessa stanza a portata di mano.
2. **Gradiente Acustico Multi-Livello per Densità di Materiale**:
   - Calcolare l'assorbimento acustico lungo il raggio 3D (raycast tra occhi del giocatore e sorgente sonoro):
     - **Divisori Leggeri / Porosi** (porte, botole, lastre, vetri): attenuazione leggera ($-10\%$).
     - **Materiali Lavorati Standard** (legno, scale, casse, terra): attenuazione media ($-18\%$).
     - **Materiali Massicci / Fibrosi** (tronchi massicci, ceppi): attenuazione marcata ($-28\%$).
     - **Muratura Minerale** (pietra, mattoni, metalli standard): attenuazione forte ($-38\%$).
     - **Roccia Ultra-Densa / Metalli Pesanti** (ossidiana, deepslate, bedrock): attenuazione quasi totale ($-50\%$).
3. **Floor Minimo di Rilevabilità Acustica (1% / 0.01f)**:
   - Il volume finale attenuato non deve mai scendere al di sotto della soglia minima garantita dell'**$1\%$ (`0.01f`)**, per assicurare che il target rimanga sempre rilevabile a livello subliminale o con cuffie ad alta dinamica senza creare 'buchi' informativi.
4. **Sinergia Audio-Vocale**:
   - In presenza di occlusione significativa ($\ge 20\%$), abbinare all'attenuazione sonora un qualificatore vocale discreto (es. *" (oltre parete)"* o *" (dietro ostacolo)"*).

---

## 🌊⚔️ 5. PREVENZIONE FALSI ALLARMI IN AMBIENTI FLUIDI & THREAT SENTINEL PER LA SOPRAVVIVENZA

1. **Il Paradosso dei Fluidi nei Rilevatori di Cadute e Burroni (Fluid Safety Guard)**:
   - Nei motori di gioco 3D e voxel (es. Minecraft, Skyrim, Unreal/Unity), i blocchi fluidi (acqua, corsi d'acqua, fiumi, mare) hanno volume di collisione solida nullo (`collision shape` vuoto).
   - Un algoritmo di prevenzione cadute non consapevole dei fluidi attraversa l'intera colonna d'acqua fino al fondale roccioso, interpretando il volume d'acqua come un burrone mortale. Questo genera loop continui di allarmi vocali a raffica che saturano e ammutoliscono lo screen reader, lasciando il giocatore cieco di fronte ai pericoli reali.
   - **Regola Universale di Fluid Safety**:
     - Monitorare tutti gli stati fluidi dell'entità giocatore (`isInWater`, `isEyeInFluid`, nuoto a pelo d'acqua, galleggiamento) per sospendere all'istante gli allarmi di caduta.
     - Nei calcoli di dislivello, la presenza di uno stato fluido (`FluidState` non vuoto) lungo la traiettoria o sul fondo deve essere sempre valutata come **atterraggio morbido sicuro (`drop = 0`)**.
2. **Threat Sentinel (Allarme Minacce Ravvicinate Prioritario)**:
   - Durante le fasi notturne, dungeon o ambienti ostili, i nemici aggressivi (`Enemy` / mob ostili) che entrano nel raggio critico di ingaggio (entro 6 metri/blocchi) devono innescare un canale di allerta dedicato:
     - **Segnale Acustico 3D Percussivo**: Avviso sonoro posizionale immediato per stimolare il riflesso rapido.
     - **Vocalizzazione Prioritaria Interruttiva**: Annuncio telegrafico del tipo di minaccia e della coordinata vettoriale relativa (*"Attenzione: [Nemico] X metri avanti/indietro, Y in alto/basso, Z a sinistra/destra"*).
3. **Navigazione Guidata a Step con Gestione Porte e Varchi**:
   - Nei percorsi calcolati da un autopilota o guida passo-passo:
     - In presenza di una porta, botola o cancello chiuso lungo il tragitto, il movimento automatico deve arrestarsi a distanza di sicurezza (1.5-2 metri), orientare la visuale verso l'interruttore/battente e invitare esplicitamente il giocatore all'interazione (*"Porta chiusa davanti a te. Premi [Tasto Interazione] per aprire"*).
     - Non appena il varco viene aperto, il sistema conferma l'azione (*"Porta aperta. Procedi verso [Target]"*) e riprende automaticamente la marcia.

---

## 🔍 6. SONDE VIRTUALI DI CAMMINO (PATH LOOK-AHEAD PROBES) & MODELLO A 3 LIVELLI DI VERBOSITÀ

1. **Il Ruolo della Sonda Virtuale di Cammino**:
   - Nei giochi 3D/Voxel, consentire al giocatore di esplorare in anticipo le direttrici cardinali e relative (Avanti nello sguardo, Dietro alle spalle, Nord, Sud, Ovest, Est, Diagonali) per conoscere calpestabilità, dislivelli, terreno e ostacoli prima di muoversi.
2. **La Triade dei Livelli di Verbosità**:
   - **`SUMMARY_ONLY` (Sintesi Istantanea a 1 Tocco)**: Informa solo se il cammino è libero o qual è il primo ostacolo di blocco (es. *"Nord: bloccato a 6 metri da Muro di pietra su Blocco d'erba"*).
   - **`COMPACT` (Operatività Quotidiana — Default)**: Comunica la lunghezza del primo tratto sicuro, il materiale del suolo calpestabile, le risorse/creature incontrate nel tratto e il primo ostacolo.
   - **`DETAILED` (Mappatura Spaziale Continua a Pieno Raggio)**: Non si arresta al primo ostacolo; prosegue fino alla fine del raggio impostato per descrivere l'intera sezione spaziale (tratti liberi, ostacoli attraversati, cambi di quota/gradini $\Delta Y$ e tutte le risorse/mob presenti).
3. **Campionamento Combinato di Entità e Blocchi Pianta Non-Solidi**:
   - Gli ortaggi, le colture e le piante commestibili hanno collisione vuota per consentire il passaggio fisico del giocatore: non devono essere ignorati come semplice aria vuota ma campionati a quota piedi e segnalati come risorse raccoglibili.
4. **Isolamento dei Modificatori & Prevenzione Conflitti con Mod Esterne**:
   - Evitare lettere alfabetiche contese da utility/motori grafici (es. shader, menu esterni); preferire le frecce direzionali o griglie numeriche isolate con modificatori composti espliciti (`Ctrl + Alt`).

---

## 🛡️ 7. SICUREZZA ANTICADUTA A DUE ZONE & FEEDBACK DI CONTATTO A BARRIERA ATTIVA (EDGE BUMP)

1. **Il Principio di Non-Degradazione della Marcia (Due Zone di Sicurezza)**:
   - Nei motori 3D/Voxel, i sistemi di assistenza fisica alla postura (es. auto-accovacciamento / auto-sneak anticaduta) non devono mai essere attivati alla stessa distanza della pre-allerta informativa.
   - **Zona 1 (Informativa / Pre-Allerta)**: A 2-4 metri dal baratro, avvisare con segnali sonori 3D e voce, e interrompere l'eventuale sprint per evitare slanci incontrollati. La camminata standard dell'utente rimane libera e a piena velocità.
   - **Zona 2 (Fisica / Bordo Immediato)**: Sul blocco confinante con il vuoto ($\le 0.85\text{ metri}$), attivare l'accovacciamento forzato per bloccare fisicamente il passo fatale tramite la fisica del motore di gioco.
2. **Disimpegno Istantaneo e Non-Interferenza Posturale**:
   - Se l'utente orienta i comandi in direzione opposta (retromarcia) o verso terreno solido, la postura di sicurezza deve essere rilasciata all'istante senza attrito né tempi di attesa.
3. **Feedback di Contatto a Barriera Attiva (Debounced Contact Bump)**:
   - Quando una barriera invisibile o un automatismo blocca il movimento dell'utente, l'insistenza sui comandi di marcia verso l'ostacolo non deve risultare muta (che darebbe la falsa impressione di tasti non funzionanti).
   - Emettere un riscontro sonoro 3D percussivo e un avviso vocale dedicato (*"Sul ciglio del dislivello, avanzamento protetto"*) con un debouncing temporale calibrato (es. $1.5\text{ secondi}$).
4. **Validazione Continua delle Strutture di Discesa Verticale**:
   - Riconoscere le vie di discesa sicure (scale a pioli, liane, corde, colonne d'acqua, atterraggi morbidi) scansionando la colonna verticale verso il basso per non bloccare mai le discese intenzionali.
5. **Chiusura della Fuga Verticale nei Sistemi di Protezione Ciglio (Anti-Jump Bypass)**:
   - Nei motori di gioco 3D (come Minecraft, Unreal, Unity), i vincoli di attrito orizzontale o raycast sul bordo agiscono quasi sempre solo quando l'entità è a contatto con la superficie calpestabile (`onGround == true`).
   - Se il giocatore preme il tasto di salto mentre è trattenuto sul ciglio, l'impulso verticale stacca il personaggio dal suolo e l'inerzia aerea supera la barriera facendolo precipitare.
   - **Regola Universale**: Quando un sistema di assistenza anticaduta o barriera fisica è attivo sul ciglio, **neutralizzare l'impulso fisico di salto alla radice** (intercettando il metodo di generazione della spinta verticale), mantenendo l'entità incollata a terra finché non si disimpegna o disattiva intenzionalmente la protezione.

---

## 🎯 8. UNIFICAZIONE ATOMICA DI PUNTAMENTO & ORIENTAMENTO (PATTERN TOKEN COMPOSITION & ORDERING ENUM)

1. **La Race Condition nei Sottosistemi di Puntamento e Telecamera**:
   - Nei giochi 3D/Voxel, i moduli di raycast continuo del mirino (cosa c'è sotto il reticolo) e i controller di rotazione della visuale (in che direzione guardo) operano spesso su loop indipendenti.
   - Se ciascun modulo invoca autonomamente la sintesi vocale con interruzione immediata (`interrupt: true`), la rotazione genera un troncamento vocale continuo e caotico (la voce legge l'angolo e viene tagliata dal blocco, o viceversa).

2. **Il Pattern Token Composition & Ordering Enum**:
   - Invece di moltiplicare all'infinito le costanti Enum per ogni combinazione possibile, suddividere il feedback in **token atomici indipendenti**:
     - Bersaglio/Entità (toggle booleano).
     - Distanza metrica (toggle booleano con gestione singolare/plurale).
     - Punto cardinale orizzontale (toggle booleano).
     - Gradi bussola $0^\circ..359^\circ$ (toggle booleano).
     - Inclinazione verticale/Pitch (toggle booleano per percepire la quota).
   - Governare la sequenza con un **Enum di Ordinamento Strutturale** (`TARGET_FIRST`, `ORIENTATION_FIRST`, `TARGET_CARDINAL_INLINE`).

3. **Debouncing & Sincronizzazione di Stato**:
   - Quando la telecamera ruota, il manager campiona istantaneamente sia la nuova direzione sia il bersaglio attuale, emette un'unica frase atomica e imposta una finestra di soppressione/sincronizzazione (80-100ms) sul loop continuo, azzerando il rumore e garantendo la massima fluidità con lo screen reader.

---

## 🎛️ 9. FEEDBACK ATOMICO SU CAMBI CONTESTO GUI, STATISTICHE DINAMICHE & BOUNDARY GATING

1. **Il Principio di Prevenzione delle "Silent Actions"**:
   - In un'interfaccia grafica (GUI), il cambio di categoria, scheda, pagina o filtro produce una trasformazione visiva immediata ma è completamente muto per lo screen reader a meno che non sia esplicitamente sonificato e vocalizzato.
   - Un'azione di cambio scheda che aggiorna solo gli elementi a schermo senza annunciare il nuovo stato lascia il giocatore non vedente disorientato e privo di feedback di conferma.

2. **La Triade di Feedback Coordinato per i Cambi di Stato**:
   - **Audio Cue Istantaneo**: Click sonoro dedicato per confermare fisicamente l'avvenuto azionamento del comando.
   - **Vocalizzazione Atomica del Nuovo Contesto**: Annuncio esplicito del nuovo stato (es. *"Categoria: [Nome]"*, *"Pagina [X] di [Y]"*).
   - **Auto-Posizionamento del Focus (Smart Focus Relocation)**: Spostamento automatico del cursore/focus logico sul primo elemento interattivo utile del nuovo contesto con lettura del suo contenuto, evitando che il puntatore rimanga fermo su coordinate o elementi appartenenti al contesto precedente.

3. **Il Pattern della Narrazione a 3 Livelli Atomici per GUI e Griglie Filtrabili**:
   - Nelle interfacce complesse (ricettari, elenchi di fabbricazione, inventari filtrabili):
     - *Livello 1 — Contesto & Stato*: Enunciazione del contesto corrente (Categoria, Pagina o Filtro applicato).
     - *Livello 2 — Statistiche Aggregate di Pagina*: Sintesi quantitativa immediata con concordanza grammaticale singolare/plurale:
       - Miste: `"[T] elementi: [R] disponibili, [N] non disponibili"` (es. *"15 ricette: 1 realizzabile, 14 non realizzabili"*).
       - Tutte disponibili: `"[T] elementi disponibili"` (o *"1 elemento disponibile"*).
       - Nessuna disponibile: `"[T] elementi non disponibili"` (o *"1 elemento non disponibile"*).
     - *Livello 3 — Dettaglio Elemento Puntato*: Lettura istantanea dell'elemento su cui è stato automaticamente riposizionato il cursore.

4. **Gestione Semantica dei Limiti di Paginazione (Boundary Gating)**:
   - Quando un utente tenta di avanzare oltre l'ultima pagina o retrocedere prima della prima pagina:
     - **Zero Azioni a Vuoto**: Non inviare eventi click di scorrimento ridondanti o non ammessi.
     - **Feedback Semantico Specifico**: Distinguere esplicitamente tra *"Prima pagina"*, *"Ultima pagina"* e *"Unica pagina"*.
     - **Riaffermazione del Focus**: Riaffermare il posizionamento del cursore sul primo elemento utile della pagina corrente con lettura immediata.

5. **Navigazione Universale a Frecce Direzionali (Dual-Binding Ergonomico)**:
   - In tutte le schermate a lista o a matrice di celle, offrire il doppio canale di input: tasti alfanumerici dedicati per la mano destra + le 4 Frecce Direzionali per la navigazione a una mano.
   - Mantenere il disaccoppiamento rigoroso con i campi di testo: se la casella di ricerca è a fuoco, le frecce pilotano il testo; quando defocalizzata (es. con `Invio`), tornano a pilotare le celle.

---

## ⚡ 10. REATTIVITÀ CONTAINER SPECIALISTICI & AUTO-FOCUS DINAMICO SU EVENTI DI TRASFORMAZIONE

1. **La Sfida dei Container a Trasformazione Asincrona o Condizionale**:
   - Nelle schermate specialistiche (banchi di taglio/tagliapietre, telai per stendardi, fornaci, alambicchi, banchi di ricerca), gli elementi interattivi o le opzioni di scelta non esistono finché il giocatore non inserisce i reagenti/ingredienti necessari, oppure compaiono solo al termine di una barra di caricamento (cottura o distillazione).
   - Senza listener dedicati, il giocatore non vedente non sa quando o quante opzioni sono disponibili, ed è costretto a navigare manualmente alla cieca tra gruppi vuoti.

2. **Il Pattern Tracciamento Differenziale & Auto-Focus (`selectGroupByKey`)**:
   - **Rilevamento del Delta di Stato**: Campionare lo stato del contenitore ad ogni tick o evento GUI (es. $N > 0 \land N_{\text{prev}} == 0$);
   - **Vocalizzazione Quantitativa Immediata**: Annunciare subito le opzioni sbloccate (es. *"%d forme disponibili per il taglio"*, *"%d motivi disponibili per lo stendardo"*);
   - **Smart Focus Relocation sul Gruppo Attivo**: Rigenerare l'albero dei gruppi di navigazione e posizionare automaticamente il focus logico e il puntatore sul primo elemento sbloccato (`recipes` o `output`), consentendo la selezione immediata da tastiera o 4 frecce senza passaggi intermedi a vuoto.

3. **Notifiche Discrete di Fine Ciclo (Discrete Cycle Finish Notices)**:
   - Per lavorazioni asincrone continue (es. fornaci, alambicchi, code di fabbricazione), monitorare il timer di avanzamento e notificare discretamente il completamento (*"Cottura completata"*, *"Distillazione completata"*) con priorità non bloccante (`interrupt: false`), preservando la leggibilità delle altre informazioni in corso senza creare sovrapposizioni sgradevoli.

---

## 🧠 11. TUTOR CONTESTUALE (CONTEXTUAL MENTOR) & KEYBINDING INTROSPECTION A RUNTIME

1. **Il Ruolo del Tutor Vocale Non Invasivo**:
   - Nei giochi complessi o sandbox, i giocatori non vedenti possono trovarsi temporaneamente disorientati (fermi da tempo, bloccati contro un ostacolo, al buio, affamati). Un sistema di tutoraggio contestuale discreto analizza periodicamente lo snapshot del giocatore ed eroga suggerimenti proattivi dotati di cooldown e rintocco acustico delicato.

2. **Contestualizzazione Spaziale Dinamica dell'Impatto**:
   - Non utilizzare frasi statiche ("Hai un ostacolo di fronte"): analizzare i vettori di input attivi al momento della collisione (assi WASD / joystick) per determinare la direzione effettiva di impatto (*"a sinistra"*, *"a destra"*, *"davanti"*, *"dietro"*).

3. **Pattern Keybinding Introspection (Risoluzione Dinamica dei Tasti)**:
   - **Zero Hardcoding di Tasti nei Testi**: I testi dei suggerimenti non devono mai contenere nomi fissi di tasti (es. *"Premi Spazio"* o *"Premi Alt+V"*), poiché il giocatore potrebbe aver riconfigurato i comandi nel menu Opzioni.
   - **Introspezione a Runtime**: Il motore di mentoring estrae dinamicamente la mappatura reale associata all'azione interrogando il mapper di input del gioco (es. Kuma API, KeyMapping vanilla, GLFW) e formattando modificatori (`Alt`, `Ctrl`, `Shift`) e nome del tasto in una stringa leggibile.
   - **Formato Strutturato & I18N Pulito**: Passare sempre i tasti risolti come argomenti formattabili al resolver di lingua (es. `I18n.get("rule_key", dir, jumpKey, inspectKey)`), evitando doppie valutazioni non sincronizzate che potrebbero generare artefatti di formato (*"Format error:"*).

---

## 🏃 12. GEOMETRIA DELLE HITBOX & CALIBRAZIONE SALTO NEI SISTEMI DI AUTONAVIGAZIONE VOXEL

1. **Il Paradosso della Distanza Minima di Collisione**:
   - Nei motori di gioco basati su griglia voxel (es. Minecraft), i blocchi hanno coordinate di centro a $(X+0.5, Z+0.5)$.
   - Quando l'entità del giocatore approccia un gradino solido di altezza $+1$, la collisione fisica della hitbox (es. raggio $0.3\text{ m}$) contro la parete (distante $0.5\text{ m}$ dal centro) arresta il movimento a una distanza orizzontale euclidea di contatto:
     $$d_{\text{collision}} = 0.5 + 0.3 = 0.80\text{ metri (fino a 1.0 m per approcci angolari)}$$
2. **Regola di Calibrazione del Salto nel Pilota Automatico**:
   - Non imporre mai soglie di distanza inferiori alla distanza fisica di collisione (es. $d < 0.65\text{ m}$), poiché richiederebbero una compenetrazione fisica impossibile all'interno del blocco solido.
   - Impostare una finestra di approccio naturale ($d \le 1.25\text{ m}$) abbinata all'ascolto della collisione fisica orizzontale (`horizontalCollision`), con impulso di salto sostenuto (almeno $200\text{ ms}$ / 4 tick) per superare il gradino senza arresti né micro-salti falliti.

---

## 🕹️ 13. AUTO-FOCUS PROATTIVO SUI MENU DI PAUSA (`Esc`) & ZERO PRE-FOCUS

1. **Il Problema dell'Elemento Non Focalizzato**:
   - Nei motori di gioco grafici, quando il giocatore preme il tasto di pausa/uscita (`Esc`), la finestra modale si apre ma spesso nessun widget possiede il focus della tastiera se il puntatore del mouse era dislocato in un'area neutra.
   - Questo costringe l'utente non vedente a premere un tasto di pre-focus (es. `Tab`) prima che le frecce direzionali possano scorrere le opzioni.
2. **Il Pattern di Iniezione Auto-Focus Proattivo (`ensureInitialFocus`)**:
   - All'apertura di una schermata di menu o di pausa:
     1. Spostare il cursore del mouse in una posizione neutrale (es. coordinate di sicurezza $10, 10$);
     2. Assegnare immediatamente il focus logico al primo elemento interattivo valido (`AbstractWidget` attivo e visibile);
     3. Emettere l'evento di accessibilità per lo screen reader e sbloccare all'istante la navigazione con le frecce direzionali (Zero Mouse & Zero Pre-Focus).

---

## 👣 14. SONAR DI CADENZA PODOMETRICA, AGGANCIO MICRO-VOXEL & DISPACCIAMENTO DIRETTO

1. **Il Principio del Sonar Podometrico di Parete**:
   - Quando un giocatore non vedente si muove lungo una superficie o parete uniforme (es. corridoi di legno, mura di pietra), non sopprimere l'annuncio dei blocchi attraversati anche se appartengono allo stesso materiale.
   - La ripetizione ritmica metro per metro funge da **sonar di velocità e cadenza spaziale essenziale**, confermando che il personaggio è in moto e permettendo di stimare le distanze percorse a orecchio.

2. **Aggancio Volumetrico a Micro-Passo per Lamine Sottili (Micro-Raymarch)**:
   - Nei motori 3D a griglia o voxel, gli elementi sottili (porte, vetri, grate, ringhiere, staccionate) occupano uno spessore trascurabile ($< 20\text{ cm}$) rispetto al volume del blocco.
   - Un raycast a passo troppo rado ($> 0.20\text{ m}$) o con partenza distante oltrepassa la lamina, rendendola invisibile nei passi rapidi e provocando salti di coordinate negative (`Math.floor`).
   - **Regola Micro-Raymarch**: Campionare lungo la linea di vista a partire da $d = 0.05\text{ m}$ con passo fisso di $0.10\text{ m}$ per intercettare infallibilmente qualsiasi elemento sottile a contatto.

3. **Pattern Direct Dispatching per Sensori Ambientali & Audio-Voice Synchronization**:
   - È vietato depositare allarmi ostacoli in registri passivi "in sospeso" in attesa che altri moduli grafici o di puntamento li consumino.
   - All'attivazione dell'allarme di prossimità o collisione, il sensore deve **invocare direttamente il Coordinator di Presentazione**, garantendo sincronia assoluta e istantanea tra il segnale audio 3D nelle cuffie e la voce sintetizzata dello screen reader.

---

## 🔇 15. PATTERN "SILENT COMMIT" PER LA SOPPRESSIONE DI FEEDBACK CONCORRENTI IN MOVIMENTO

1. **Il Problema dell'Annuncio Posticipato Fuori Tempo (Lag Mutation Alert)**:
   - Quando un sottosistema primario ad alta priorità (es. sensore ostacoli, allarme burroni o minacce) sopprime temporaneamente un sottosistema secondario a monitoraggio continuo (es. mirino o sensore del blocco/suolo puntato), il semplice blocco della chiamata vocale (early return o mute condizionale) genera un accumulo di divergenza tra lo stato registrato e la realtà fisica.
   - Durante il cammino rapido, l'ambiente circostante muta continuamente; se la voce viene soppressa per una breve finestra (es. 100 ms) senza aggiornare le variabili di stato interne, al primo tick utile dopo la scadenza del timer il modulo secondario confronta lo stato congelato prima del blocco con la nuova posizione, rilevando un finto cambio di contesto. Questo provoca la vocalizzazione in ritardo di bersagli o distanze superate proprio quando il personaggio si è già fermato.
2. **Il Principio del "Silent Commit"**:
   - Durante una finestra di soppressione attiva in movimento, il sottosistema secondario non deve limitarsi a tacere: deve **eseguire il commit atomico dello stato** (`absorbStateIfSuppressed`), aggiornando internamente tutti i riferimenti di memoria (bersaglio puntato, distanza corrente, impronta semantica) prima di scartare l'uscita vocale.
   - Alla scadenza della soppressione, lo stato interno coincide perfettamente con la realtà fisica attuale: zero allarmi residui, zero annunci fantasma e voce pulita che interviene unicamente se avviene una reale nuova mutazione successiva.
3. **Finestra di Soppressione Monotona Crescente**:
   - Il prolungamento di una finestra di soppressione temporale deve essere monotonicamente non decrescente:
     $$T_{\text{suppressedUntil}} = \max(T_{\text{suppressedUntil}}, T_{\text{now}} + \Delta T)$$
     garantendo che chiamate concorrenti o ravvicinate da eventi sovrapposti mantengano viva la protezione senza mai resettare o abbreviare la scadenza già attiva.
4. **Bypass Assoluto per Interrogazioni Manuali Intenzionali (Zero-Latency Direct Query)**:
   - Qualsiasi azione esplicita di interrogazione attivata intenzionalmente dal giocatore da tastiera o controller (es. orientamento, ispezione mirino a comando, query bussola) deve bypassare incondizionatamente qualsiasi soppressione automatica in corso, rispondendo a latenza zero ($0\text{ ms}$) con priorità assoluta.

---

## 🎮 16. PRINCIPIO DI PUREZZA DELL'INTENTO FISICO NEI SISTEMI DI ASSISTENZA IBRIDI (HUMAN-IN-THE-LOOP)

1. **Il Paradosso del Takeover Falso Positivo (Synthetic Override Hijack)**:
   - Nei videogiochi o mondi virtuali accessibili in cui convivono motori di guida autonoma o assistita (es. AutoWalk, pathfollowing vocale, autopilota) e sottosistemi di sicurezza reattiva attiva (es. frenata d'emergenza, auto-accovacciamento da ciglio/burrone, schivata ostacoli);
   - I sistemi di sicurezza scrivono frequentemente stati simulati o sintetici nei registri di input del motore di gioco (es. `setDown(true)` su comandi di movimento o tasti di camminata lenta);
   - Se la routine di **Human Takeover** (il controllo che restituisce il controllo all'utente non appena questi tocca i tasti) interroga lo stato logico o aggregato del motore di gioco (`isDown()`), l'intervento salvavita del bot viene scambiato per un'azione manuale dell'utente, provocando l'immediato e ingiustificato annullamento della navigazione automatica proprio nei punti più critici (es. cigli, pianerottoli stretti, curve a gomito).
2. **Regola Aurea della Purezza Hardware dell'Intento Umano**:
   - Qualsiasi logica deputata a determinare l'intento umano di interruzione o ripresa manuale (`isManualMovementKeyPressed`, `checkHumanTakeover`) deve interrogare **esclusivamente lo strato hardware fisico reale** (polling GLFW nativo, Win32 Raw Input, DirectInput o hook a basso livello), con totale immunità dagli stati sintetici iniettati dai sottosistemi software.
3. **Coesistenza Non Distruttiva di Pilota e Sicurezza**:
   - L'attivazione di una manovra protettiva automatica (es. sneak salvavita da ciglio) non deve interrompere l'autopilota, ma operare come un modulatore di velocità/postura trasparente: il pilota prosegue la rotta a velocità protetta e la navigazione si conclude felicemente a destinazione.

