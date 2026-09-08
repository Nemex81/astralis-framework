# Sonificazione, Audio 3D Posizionale e Volumi di Sicurezza
# Autore: Luca (Sviluppatore Senior Non Vedente con Screen Reader NVDA)
# Target AI: [AI Pair Programmer / Assistente AI]
# Ambito: Globale / Universale

Questo documento definisce gli standard per la progettazione del paesaggio sonoro (soundscape), audio posizionale 3D e protezione acustica per utenti non vedenti.

---

## 🎚️ 1. VOLUMI DI SICUREZZA CONGELATI

1. **Soglia Massima Assoluta (0.7f - 0.8f)**:
   - Tutti gli effetti sonori (SFX), la musica ambientale e i suoni di interfaccia devono avere un master volume non superiore al range compreso tra `0.70` (70%) e `0.80` (80%).
   - Questa soglia garantisce un margine di sicurezza (headroom acustico) affinché la sintesi vocale di NVDA rimanga **sempre perfettamente nitida, udibile e comprensibile** in qualsiasi circostanza.

2. **Duck Audio Dinamico**:
   - Quando viene emesso un messaggio vocale critico o un log prioritario di gioco/sistema, il volume degli SFX e della musica deve abbassarsi automaticamente (ducking) di almeno il 40-50% per la durata del parlato.

---

## 🎧 2. SOUND DESIGN & AUDIO POSIZIONALE 3D

1. **Sonificazione degli Eventi**:
   - Ogni azione (apertura menu, cambio selezione, conferma, errore, collisione) deve avere un feedback audio univoco e differenziato per timbro o altezza (pitch).
   - Suoni brevi, puliti, con attacco rapido (punchy) e senza code riverberanti eccessive che possano mascherare la voce.

2. **Audio Spaziale & Panning Stereofonico**:
   - Utilizzo di librerie audio 3D (OpenAL, FMOD, XAudio2, Pygame sound) per posizionare le sorgenti sonore nello spazio stereo/surround.
   - Panning orizzontale chiaro (Sinistra/Centro/Destra) e attenuazione con la distanza per guidare il movimento e l'orientamento dell'utente.

---

## 🛡️ 3. DINAMICA ACUSTICA E FLOOR MINIMO PER SORGENTI OCCLUSE

1. **Protezione della Rilevabilità (Floor Minimo 1% / 0.01f)**:
   - Quando si applicano filtri di occlusione o attenuazioni cumulative da ostacoli/distanza, il volume scalato non deve mai essere azzerato completamente.
   - Mantenere sempre una soglia minima garantita dell'**$1\%$ (`0.01f`)**, sufficiente a trasmettere la presenza del target alle cuffie ad alta dinamica senza creare 'buchi' informativi.
2. **Prevenzione del Sovraccarico Acustico (Headroom Vocale)**:
   - Suoni occlusi da pareti o ostacoli devono scendere sotto il range di $0.20\text{f} - 0.40\text{f}$ per liberare spazio acustico per la sintesi vocale e i segnali prioritari di allerta.

---

## 👣 4. PROPRIOCEZIONE ACUSTICA & GUADAGNO MIRATO DEL GIOCATORE LOCALE

1. **Il Ruolo Propriocezione dei Passi**:
   - Per un utente non vedente, il suono dei passi del proprio personaggio è l'equivalente della sensazione cinestetica e tattile sotto la suola delle scarpe.
2. **Isolamento della Sorgente Sonora**:
   - L'amplificazione dei passi non deve mai essere applicata all'intero bus audio o a tutti i personaggi, ma circoscritta chirurgicamente alla sola entità controllata dall'utente.
   - Questo previene l'effetto cacofonico e preserva l'headroom acustico per la sintesi vocale e i segnali di allarme.



---

## ⚡ 5. ALLARMI DI EMERGENZA SALVAVITA & PENETRAZIONE VOCALE (TRANSIENTI ACUTI)

1. **Il Principio dei Transienti Metallici Acuti**:
   - I suoni di allerta di emergenza e pre-freno imminente (es. ciglio di un baratro, trappola letale, pericolo mortale istantaneo) non devono mai utilizzare toni sordi, morbidi o a bassa frequenza. Tali toni verrebbero facilmente coperti e mascherati dalla sintesi vocale TTS / NVDA in riproduzione contemporanea.
   - È fatto obbligo di impiegare campioni sonori dotati di un attacco istantaneo (transiente d'impatto ad altissima energia) e spettro armonico acuto metallico (es. risonanza d'incudine su ferro). Il picco frequenziale buca istantaneamente il parlato senza richiedere volumi pericolosi per l'apparato uditivo ($0.7\text{f} - 0.8\text{f}$).

2. **Indipendenza del Canale Audio (Bus Personale vs Ambiente)**:
   - I segnali sonori critici per l'incolumità personale del giocatore non devono mai essere emessi sui bus audio ambientali o degli elementi del mondo (es. `BLOCKS` o `WORLD`), dove le impostazioni utente o i filtri di riverbero possono attenuarli.
   - Devono essere sempre instradati sul canale audio diretto del giocatore (`PLAYERS`, `UI` o `SYSTEM`), garantendo immunità assoluta da filtri di occlusione o cursori di volume dell'ambiente.
