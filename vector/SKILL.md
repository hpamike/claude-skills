---
name: vector
description: "V.E.C.T.O.R. (Vastly Enhanced Capability Through Organized Resources) — denkmodel dat een organisatie, functie of proces leest als één continu draaiende OODA-cyclus van PURPOSE → SENSE → INTERPRET → DECIDE → ORCHESTRATE/ACT → LEARN, met GOVERN/ASSURE als controlevlak. Naar Salim Ismails Intelligence Stack (ExO 3.0) en strateeg John Boyd — wie sneller door de cyclus draait dan zijn omgeving, wint. Gebruik deze skill wanneer de gebruiker wil begrijpen waarom een organisatie traag is, een operating model wil (her)ontwerpen, wil bepalen welke beslissingen een agent autonoom mag nemen en welke bij een mens horen, of een voordeel wil bouwen op snelheid en data. Triggert bij 'waarom zijn we zo traag', 'operating model', 'wat kan AI of agents hier overnemen', 'hoe word ik AI-native', 'intelligence stack', 'OODA', 'vector', 'waar zit onze moat'. NIET gebruiken voor pure feitenvragen, simpele uitvoeringstaken zonder organisatiecomponent, of wanneer de gebruiker expliciet een ander denkmodel vraagt."
---

# V.E.C.T.O.R.

**Vastly Enhanced Capability Through Organized Resources** — een organisatie-diagnoselens op basis van de OODA-loop (John Boyd) en Salim Ismails Intelligence Stack (ExO 3.0).

Lees een organisatie, afdeling of proces niet als een organogram (wie zit boven wie), maar als één **continu draaiende informatiecyclus**. De vraag is nooit "wie is de baas van wat", maar "hoe snel en hoe goed draait dit ding rond van signaal naar actie naar leren — en waar loopt het vast".

## Waarom dit model bestaat

Het komt van twee bronnen die je uit elkaar moet houden:

- **John Boyd** (militair strateeg, 1927–1997) bedacht de **OODA-loop**: Observe → Orient → Decide → Act. Zijn empirische inzicht: in een gevecht wint niet de sterkste maar de snelste door de cyclus. Wie sneller waarneemt, oriënteert, beslist en handelt, dwingt de tegenstander te reageren op een beeld dat al achterhaald is. Dit deel is goed onderbouwd.
- **Salim Ismail** (OpenExO) operationaliseert Boyd's loop als organisatie-architectuur in *The Organizational Singularity* (ExO 3.0, 2026): de **Intelligence Stack**. Dit deel is een consultancy-framework, geen bewezen wetenschap. Behandel het als een bruikbare lens en een hypothese — niet als een natuurwet. De hoofdletter-acroniemen (DRIVE, SHAPE, REWRITE) zijn marketing; de onderliggende vragen zijn het waardevolle.

Gebruik het model dus om **scherpere vragen** te stellen, niet om de conclusie ("word AI-native, anders ga je dood") over te nemen.

### De motor eronder (waarom nu)

Econoom Ronald Coase verklaarde in 1937 (*The Nature of the Firm*) waaróm grote bedrijven bestaan: coördineren binnen een hiërarchie was goedkoper dan alles los op de markt inkopen. AI laat zowel coördinatie- als executiekosten instorten — "een feature bouwen is goedkoper dan de vergadering erover" — waardoor de bestaansreden van grote, traag-besluitende hiërarchieën wegvalt. Dát is waarom dit model nu urgent is, niet alleen interessant.

Tegelijk verdwijnt de organisatie niet: ze blijft nodig als juridische, aansprakelijkheids- en purpose-container. De ruimte tussen wat een mens moet tekenen/verantwoorden en wat een agent kan uitvoeren heet de **fiduciary wedge** — dat is wat er van "het bedrijf" overblijft.

## De cyclus: zes lagen + één controlevlak

Loop elke laag langs voor het ding dat je analyseert. Bij elke laag is de diagnostische vraag belangrijker dan de definitie.

| Laag | Wat het doet | Diagnostische vraag |
|------|--------------|---------------------|
| **PURPOSE** | Missie, doel, constraints, prioriteiten — als toetssteen, niet als poster | Toetst elke beslissing zich echt hieraan, of hangt het doel los van het dagelijks werk? |
| **SENSE** | Signalen uit klant, markt, operatie, omgeving binnenhalen | Welke signalen missen we, of zien we te laat? Op welk tempo? |
| **INTERPRET** | Van ruwe signalen naar betekenis: patronen, context, scenario's | Maken we van data echt inzicht, of stapelen rapporten zich op zonder duiding? |
| **DECIDE** | Opties genereren, afwegen, een keuze vastleggen | Hoe lang duurt een beslissing? Hoeveel goedkeuringslagen? Wat kan sneller? |
| **ORCHESTRATE / ACT** | De keuze uitvoeren: mensen, systemen, agents coördineren | Lekt er waarde tussen besluit en uitvoering? Wie/wat voert echt uit? |
| **LEARN** | Resultaat evalueren en terugvoeren in het systeem | Wordt er structureel geleerd, of herhalen we dezelfde fouten? |

**GOVERN / ASSURE** loopt dwars door alle zes: kwaliteit, compliance, logging, menselijk toezicht, en de "noodrem" (escalatie/terugdraaien). De vraag: *waar kan dit ontsporen, en wie of wat vangt dat op?* Concreet rust dit op vier pijlers: **trusted evals** (agents draaien tegen een vaste, geversioneerde testset), **searchable logs** (elke beslissing herleidbaar), **granular rollback** (terug naar een vorige versie zonder de rest plat te leggen) en een **human review queue** (alles wat geld, recht of klantrelaties raakt gaat langs een mens). Elke agent krijgt bovendien een soort **paspoort**: metadata over wat hij wel/niet mag (policy-gecontroleerde API's, welke data hij mag zien, aansprakelijkheidsgrenzen).

De cyclustijd is de kernmetriek. Een traditionele organisatie draait de loop op kwartaal- of jaartempo (kwartaalrapportages, MT-besluiten, jaarevaluaties). Het hele punt van het model: verkort de cyclustijd waar dat verantwoord kan.

## Hoe je het toepast

### Stap 1 — Bepaal het object en doe de disruptietest
Wat draait de loop? Een heel bedrijf, één afdeling, één proces (bv. "hoe wij ons aanbod actueel houden"), of een persoonlijke werkwijze. Hou het concreet — vaag object levert vage analyse.

Stel meteen de scherpste vraag: **is er een hoogmarge-lijn in deze business die twee mensen met AI in 60-90 dagen kunnen namaken?** Zo ja, dan is cyclustijd verkorten geen luxe maar overleving — en weet je meteen wáár je het eerst moet versnellen.

### Stap 2 — Loop de zes lagen + GOVERN langs
Beantwoord per laag de diagnostische vraag. Wees eerlijk over waar je het niet weet — een lege laag is zelf een bevinding (vaak is LEARN of SENSE de zwakste).

### Stap 3 — Vind de bottleneck
Eén laag is meestal de rem op het geheel. Veelvoorkomend: DECIDE (te veel goedkeuringslagen) of LEARN (geen feedback loop). Daar zit de meeste winst.

### Stap 4 — Trek de mens-vs-agent-grens (het scherpste deel van het model)
Niet "wat kan AI overnemen", maar: welke beslissingen zijn **omkeerbaar** en welke niet?

- **Two-way doors** (omkeerbaar, laag risico, testbaar, terug te draaien) → kandidaten voor automatisering / autonome agents binnen een vooraf afgesproken speelruimte ("permission envelope"). Voorbeeld: een tekst bijwerken, een routine-herinnering sturen.
- **One-way doors** (onomkeerbaar, raakt geld, recht, mensen, merk of relaties) → mens beslist, altijd. Voorbeeld: prijswijziging, iemand aannemen, een partnerschap aangaan.

Deze tweedeling (van Jeff Bezos) is de praktisch bruikbaarste exportwaar van het hele framework. Naarmate agents de uitvoering en coördinatie overnemen, schuift de mens een niveau omhóóg: van doener naar oversight, exception handling, probleemoplossing en oordeel/smaak. (Analogie: in Duitse fabrieken staat bijna niemand meer aan de band, maar de werkgelegenheid bleef — mensen doen nu het hogere werk.)

### Stap 5 — Zoek de moat (vijf soorten)
Welke laag wordt **beter naarmate je hem vaker draait**? Het data-vliegwiel (data uit LEARN die SENSE en INTERPRET scherper maakt) is er één van. Er zijn er vijf, ruwweg oplopend in kracht:

1. **Proprietary data** — data die een ander niet kan repliceren.
2. **Regulatory** — vergunningen/regelgeving (reëel, maar erodeert op termijn).
3. **Intelligence / leersnelheid** — sneller leren dan de rest. De sterkste, want een voorsprong in de leerloop is bijna niet in te halen.
4. **Klantrelatie** — een diepe, dedicated relatie die niet wegloopt.
5. **Merk / MTP** — de emotionele band met de eindklant.

Let op (zie kritische checks): een moat is vaak **voorwaardelijk** en kan eroderen — benoem de voorwaarde, claim hem niet als bestaand feit.

### Stap 6 — Check GOVERN
Voor elke laag die je wilt versnellen of automatiseren: wat is het faalpad, en wat is de terugval? Snelheid zonder noodrem is roekeloosheid, geen voordeel.

## Vijf kritische checks (gebruik deze altijd — anders word je de marketing in gepraat)

Het model heeft een ingebouwde bias naar "sneller = beter". Toets dat steeds:

1. **Sneller ≠ beter.** Boyd's loop gaat over een tegenstander die op jóu reageert. In veel contexten (een leerling, een patiënt, een tevreden klant) reageert "de omgeving" helemaal niet op jouw tempo, en is dagelijks bijwerken juist ruis. Vraag: levert kortere cyclustijd hier echt waarde, of alleen drukte?
2. **De moat is meestal voorwaardelijk, niet actueel.** Een data-vliegwiel werkt pas bij schaal en veroudert als het onderwerp snel verandert. Benoem de voorwaarde ("wordt een moat bij N gebruikers") in plaats van het als bestaand feit te claimen.
3. **Automatiseren botst vaak met de belofte.** Als de waarde van het ding juist het menselijke is (oordeel, relatie, vertrouwen), dan ondergraaft "schaalbaar zonder mensen" het product. Benoem die spanning expliciet; kies niet stilzwijgend.
4. **Attribueer en relativeer.** Dit is één guru-framework, en de bron is óók een salestrechter (de aflevering eindigt op "bel ons"). De OODA-kern is sterk; de ExO-overbouw en de getallen (80% personeel eruit, 100x, "binnen 1-2 jaar") zijn onbewezen voorspellingen. Scheid wat je weet van wat het framework beweert of verkoopt.
5. **Automatiseer niet je legacy-bottleneck.** De meeste AI-projecten falen omdat ze AI op bestaande mens-centrische goedkeuringsketens plakken — de radio-omroeper die je op tv zet. Vraag eerst: moet deze stap überhaupt bestaan? Strip de keten vóór je hem automatiseert; anders versnel je verspilling.

## Outputstructuur

Gebruik standaard deze opzet (pas aan waar zinnig):

```
# V.E.C.T.O.R.-analyse: [object]

## De loop in het kort
Eén alinea: hoe draait de cyclus nu, op welk tempo, en wat is de kern-bottleneck.

## Disruptietest
Kan een klein team dit met AI in 60-90 dagen namaken? Hoe kwetsbaar zijn we?

## Per laag
PURPOSE / SENSE / INTERPRET / DECIDE / ORCHESTRATE / LEARN — per laag:
sterk / zwak / blinde vlek, met de diagnostische bevinding.

## GOVERN/ASSURE
Faalpaden en terugval (evals, logs, rollback, human review).

## De bottleneck
De ene laag die het geheel remt + waarom.

## Mens vs. agent
Two-way doors (kandidaat voor automatisering) vs. one-way doors (mens beslist),
als korte tabel.

## De moat
Welke van de vijf moats heb je echt — en onder welke voorwaarde houdt die stand?

## Kritische kanttekeningen
De vijf checks toegepast op dit geval. Waar slaat het model hier mis of overdrijft het?

## Wat ik zou veranderen
Concrete, uitvoerbare ingrepen op de bottleneck.
```

## Voorbeeld (verkort)

**Object:** hoe een opleider zijn cursusaanbod actueel houdt.

- **Disruptietest:** twee mensen met AI kunnen een los e-learningaanbod in ~60 dagen namaken → de moat moet ergens anders zitten (data, relatie, merk), niet in de content zelf.
- **SENSE** (zwak): nieuwe tools worden pas opgemerkt als een deelnemer ernaar vraagt → signaal komt te laat binnen.
- **DECIDE** (bottleneck): elke contentwijziging wacht op het kwartaaloverleg. Cyclustijd: 3 maanden.
- **Mens vs. agent:** een prompt bijwerken of een tool aan de lijst toevoegen is een two-way door (testbaar, terug te draaien) → kan naar een agent met review. Een module schrappen is een one-way door (raakt de merkbelofte) → blijft bij een mens.
- **Moat:** afhaakdata per module → betere content → minder afhakers (intelligence/data). Echte moat? Pas bij genoeg deelnemers, en de tool-data veroudert snel — dus voorwaardelijk.
- **Kritische check:** dagelijks de content bijwerken klinkt als voordeel, maar voor een lerende kan constante verandering juist verwarrend zijn (check 1). Wekelijks is waarschijnlijk genoeg.
- **Ingreep:** haal routine-contentupdates uit het kwartaaloverleg (verkort DECIDE van 3 maanden naar dagen voor two-way doors); hou alleen structurele keuzes in het overleg.

## Wat deze skill niet doet

- **Geen transformatie-playbook.** Hóe je een organisatie hierheen verbouwt (REWRITE: backcast → score → map → cut → build → rewire, en het "edge digital twin"-model: raak de cash cow niet aan, bouw aan de rand, kopieer een workflow, draai parallel) is een apart traject. Deze skill diagnosticeert, ze verbouwt niet.
- Geen kritiekloze overname van de "word AI-native of sterf"-conclusie. Het model is een diagnoselens, geen voorspelling.
- Geen organisatieadvies op terreinen waar snelheid niet de relevante as is (veiligheid, zorgvuldigheid, vertrouwen) zonder dat expliciet te benoemen.
- Geen vervanging voor echte cijfers. De analyse wijst aan wáár te kijken; de gebruiker levert de feiten over de eigen situatie.
