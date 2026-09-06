# Standard di Accessibilità da Tastiera e Screen Reader (v3.0.0)
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: Antigravity (Senior AI Pair Programmer & Software Engineer)
# Ambito: Globale / Universale

Questo documento stabilisce le regole e i requisiti tecnici inviolabili per garantire che qualsiasi software, interfaccia, applicazione o script sia al 100% utilizzabile da tastiera con screen reader NVDA.

---

## ⌨️ 1. INTERAZIONE 100% DA TASTIERA (ZERO MOUSE)

1. **Focus Management & Navigazione a Schede (Tab Order)**:
   - Ogni elemento interattivo (pulsanti, campi testo, liste, menu a discesa) deve essere raggiungibile tramite `Tab` e `Shift+Tab`.
   - L'ordine di tabulazione deve seguire la sequenza logica di lettura (da sinistra a destra, dall'alto al basso).
   - Nessun controllo deve "intrappolare" il focus della tastiera (zero keyboard trap).

2. **Scorciatoie Rapide & Access Keys**:
   - Fornire tasti di scelta rapida con `Alt+[Lettera]` per tutti i comandi principali.
   - Supporto completo per il tastierino numerico (Numpad) per movimenti, mappe a griglia o navigazione a blocchi.

3. **Ruoli e Stati Accessibili (WCAG & Accessibility APIs)**:
   - Utilizzare correttamente ruoli e proprietà semantiche native (`wx.Button`, `wx.TextCtrl`, MSAA / IAccessible2 / UIA).
   - Notificare esplicitamente i cambi di stato (es. selezionato/deselezionato, espanso/compresso, caricamento completato) tramite eventi di sistema o API vocali.

---

## 🔊 2. COMUNICAZIONE DIRETTA CON NVDA

1. **Libreria `nvdaControllerClient`**:
   - Negli ambienti C/C++ o Python, per inviare notifiche vocali immediate o silenziose, utilizzare la DLL `nvdaControllerClient.dll`:
     - `nvdaController_speakText(const wchar_t* text)`: Pronuncia immediata della stringa.
     - `nvdaController_brailleMessage(const wchar_t* text)`: Invio su display Braille.
     - `nvdaController_cancelSpeech()`: Interruzione immediata della voce per evitare code di sintesi.

2. **Gestione dei Messaggi Multipli**:
   - Evitare l'inondazione di eventi vocali (speech spam). Se si verificano molti eventi consecutivi, raggrupparli o dare priorità all'evento più recente.

---

## 🖐️ 3. ERGONOMIA A UNA MANO (MANO SINISTRA) PER COMANDI FREQUENTI IN-GAME

1. **Azionamento a Una Mano Senza Attrito**:
   - Per i comandi rapidi di diagnostica, navigazione e scansione che il giocatore deve poter attivare mentre si muove o esplora, la scorciatoia da tastiera estesa deve essere progettata per l'azionamento esclusivo con la **sola mano sinistra** (es. `Alt + B`, `Ctrl + G`).
   - La combinazione deve permettere al pollice di poggiare su `Alt` (o al mignolo su `Ctrl`) e all'indice di raggiungere il tasto bersaglio senza spostare l'avambraccio dalla posizione naturale di riposo della tastiera.

---

## 🎯 4. ONESTÀ PERCETTIVA DELLE GUI: ZERO OPZIONI ORFANE O DECORATIVE

1. **Equivalenza Percettiva dello Screen Reader**:
   - Per un utente vedente, un pulsante grigio o un'opzione cosmetica priva di funzionalità può essere percepita visivamente come un "placeholder" o un'anteprima futura.
   - Per un utente non vedente con screen reader NVDA, ogni controllo navigabile viene annunciato con pari dignità e autorevolezza (es. *"Abilita ducking audio: Casella di controllo attivata"*).

2. **Divieto Assoluto di Controlli Decorativi o Orfani**:
   - È tassativamente vietato esporre in schermate di configurazione o interfacce utente opzioni, cursori o toggle prima che il motore logico sottostante sia effettivamente pronto a interpretarne e applicarne il valore a runtime.
   - Qualsiasi parametro futuro deve rimanere nella documentazione di progettazione e comparire nell'interfaccia utente **esclusivamente insieme al codice reale** che ne traduce lo stato in effetti concreti e verificabili.

---

## 🛡️ 5. INVIOLABILITÀ DELL'INPUT MANUALE RISPETTO AGLI AUTOMATISMI

1. **Non-Ingerenza dell'Automazione sulla Volontà dell'Utente**:
   - Qualsiasi automatismo, guida assistita o guardiano di sicurezza non deve mai annullare, forzare il rilascio o sovrascrivere un'azione derivante da un tasto fisico tenuto intenzionalmente premuto dall'utente (es. tasti modificatori, `Shift`, tasti direzionali).
2. **Principio di Titolarità del Comando (Ownership Token)**:
   - Se un automatismo deve sospendere temporaneamente la propria azione (es. quando l'utente entra in un menu), deve verificare se lo stato attivo era stato imposto dal sistema o se corrisponde a una pressione fisica manuale dell'utente.
   - Il sistema ha l'autorità di revocare **esclusivamente i propri comandi sintetici** (governati da un token di override esplicito). Non deve mai intervenire sulla postura o sullo stato generato dalla mano dell'utente.

---

## 🚪 6. ARCHITETTURA A DOPPIO GUARD NELLE INTERFACCE GRAFICHE & ANTI-GHOST NARRATION

Nelle applicazioni e nei giochi in cui gli eventi da tastiera viaggiano in modo asincrono rispetto al ciclo di vita delle schermate (aperture, transizioni, chiusure rapide con `Esc`):

1. **Prevenzione di Ghost Narrations e Crash da NullPointer**:
   - Transizioni repentine possono far giungere comandi di navigazione a elementi GUI in fase di distruzione o già azzerati a `null`.
2. **Lo Standard del Doppio Guard**:
   - *Guard a Monte*: All'ingresso di ogni gestore di input o navigazione, verificare preventivamente l'effettiva corrispondenza tra la schermata registrata e l'istanza attiva nel client.
   - *Guard a Valle*: Nei metodi operativi di basso livello (spostamento cursore, selezione elementi), inserire controlli difensivi null-safe indipendenti.
3. **Sincronizzazione Atomica del Ciclo di Vita**:
   - Nel tick o loop di aggiornamento dell'interfaccia, resettare lo stato di navigazione non appena la schermata non è più attiva, **prima** di elaborare qualsiasi intervallo o debouncer temporale.
