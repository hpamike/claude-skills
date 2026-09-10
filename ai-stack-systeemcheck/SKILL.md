---
name: ai-stack-systeemcheck
description: >-
  Systeemcheck vóór de twee werksessies "je eigen AI-assistent" en "je
  intelligentie-stack". Controleert of het device en het account van de deelnemer
  klaar zijn en geeft per onderdeel PASS/FAIL met één concrete fix, plus een
  eerlijk eindoordeel in vier smaken: GO, GO MET RISICO, NO-GO (fixbaar) of DIT
  APPARAAT REDT HET NIET. Gebruik deze skill wanneer iemand zegt "doe de
  systeemcheck", "ben ik klaar voor de sessie", "check mijn laptop", "AI Fit
  check", "pre-flight", of vlak voor sessie 1 of 2 wil weten of zijn abonnement,
  webtoegang, schrijfrechten en hardware volstaan. Beoordeelt ook expliciet of het
  apparaat te oud of te licht is, en zegt dat dan hardop in plaats van het te
  verbloemen. NIET gebruiken voor het ontwerpen van de sessies zelf, en niet voor
  algemene IT-support los van deze twee oefeningen.
---

# Systeemcheck voor de twee werksessies

## Doel

Dit is de opwarming. Je controleert of iemands laptop én abonnement klaar zijn voor
twee sessies, zodat opstartgedoe thuis wordt opgelost en niet in de zaal.

De uitkomst is een korte tabel met per onderdeel PASS of FAIL, bij elke FAIL één
concrete fix, en een eindoordeel.

**Het eindoordeel heeft vier smaken, geen twee.** Dat is met opzet: niet elk probleem
is te fixen, en iemand die met een te oud apparaat naar de sessie komt heeft daar meer
last van dan wanneer je het nu zegt.

- **GO** — klaar.
- **GO MET RISICO** — het werkt, maar iets gaat schuren. Benoem wat, en wat het kost.
- **NO-GO, fixbaar** — twee of drie dingen doen en dan is het goed.
- **DIT APPARAAT REDT HET NIET** — geen zinnige fix. Neem een ander device mee, of
  doe de sessie op een privélaptop.

## Wat deze sessies NIET nodig hebben

Zeg dit vroeg, want het scheelt mensen een half uur onnodige installatie en het is het
grootste verschil met andere workshops:

Geen Node.js, geen npm, geen git, geen GitHub-account, geen Vercel, geen database,
geen zoekindex, geen lokaal model. **Ook geen mailkoppeling.** Er wordt in beide
sessies niets geïnstalleerd behalve, optioneel, de Claude-desktopapp.

Kom je die eisen tegen in ouder materiaal, dan hoorden ze bij de vibecoding-workout,
niet bij deze twee.

## Werkwijze

1. **Leg eerst uit wat er gaat gebeuren**, in gewone taal. Zie de tekst hieronder.
2. **Vraag welke sessie eraan komt**: de eerste (je eigen assistent), de tweede (je
   intelligentie-stack), of allebei. Weet iemand het niet, doe dan beide sets.
3. **Draai de checks.** Heb je shell-toegang, gebruik dan `scripts/check.sh` (Mac of
   Linux) of `scripts/check.ps1` (Windows in PowerShell). Zit je in een browser zonder
   shell, loop dan de handmatige lijst af en vraag de deelnemer wat hij ziet.
4. **Beoordeel de hardware apart en eerlijk.** Zie "Is dit apparaat het nog?".
5. **Rapporteer** in de tabelvorm hieronder, met één fix per FAIL.
6. **Bij GO: doe de startproef.** Die kost een minuut en bewijst de hele keten.
7. **Wees concreet en rustig.** Eén fix per probleem, geen jargon, geen lijst met
   opties. Kun je het niet oplossen, verwijs dan naar het inloopmoment.

## Uitleg vooraf aan de deelnemer

> Welkom bij de opwarming. We kijken samen of je laptop en je account klaar zijn voor
> de sessie, zodat je straks meteen aan de slag kunt.
>
> Wat er gaat gebeuren:
> 1. Ik kijk naar je systeem: besturingssysteem, geheugen, vrije ruimte, schrijfrechten
>    en of ik het internet op kan.
> 2. Ik vraag je een paar dingen die ik zelf niet kan zien, zoals welk abonnement je
>    hebt.
> 3. Je krijgt een lijstje met groen en rood. Bij rood staat er meteen bij hoe je het
>    oplost.
> 4. Is alles groen, dan doen we een startproef van één minuut.
>
> Er wordt niets geïnstalleerd behalve eventueel de Claude-desktopapp. Werk je op een
> laptop van je werkgever die veel blokkeert, zeg dat dan meteen: dan kies ik een route
> die wél werkt.

## Wat je controleert

### Automatisch (het script doet dit)

| Onderdeel | Waarom |
|---|---|
| Besturingssysteem en versie | Te oud betekent dat de app niet meer draait of geen updates krijgt |
| Processor en bouwjaar | Bepaalt of het werkbaar snel is |
| Werkgeheugen | Onder de 8 GB wordt het zwoegen met een browser ernaast |
| Vrije schijfruimte | Onder de 10 GB gaat het knellen |
| Schrijfrechten in de thuismap | Hier komt hun eigen map te staan |
| Internet en `raw.githubusercontent.com` | Daar wordt de opdracht opgehaald |
| De installer echt ophalen | De enige test die de hele keten bewijst |
| Claude-desktopapp aanwezig | Alleen nodig voor de route met bestandstoegang |
| Drive- of OneDrive-map aanwezig | Handig als ze willen synchroniseren |

### Handmatig vragen (dit kan het script niet zien)

Deze drie zijn belangrijker dan alles wat het script meet. Stel ze één voor één.

1. **"Welk AI-abonnement heb je, en kun je daar projecten aanmaken?"**
   Een project is waar de vier bestanden aan hangen. Op gratis plannen bestaat dat vaak
   niet. Dit is de belangrijkste eis van sessie 1.
2. **"Kun je in jouw gereedschap een taak inplannen die elke ochtend draait?"**
   Dat is de laatste stap van sessie 2. Bestaat die functie niet op hun plan, dan is
   dat geen NO-GO: de terugval is een agendaherinnering om zelf de vraag te stellen.
   Zeg dat er meteen bij, anders schrikken mensen.
3. **"Is dit een laptop van je werkgever?"**
   Zo ja, vraag door: mag je software installeren, staat webtoegang aan, en zijn
   koppelingen naar AI-tools toegestaan? Bij banken, gemeenten en zorginstellingen is
   het antwoord vaak nee.

Optioneel, alleen voor sessie 2: **is je agenda gekoppeld?** Dat is geen eis, maar
zonder agenda heeft hun assistent de eerste weken bijna geen bron om de dagelijkse
vraag uit te halen. Gemeten: van de zeven vraagbronnen leverden er in een verse map
maar twee iets op, en de agenda was er daar één van.

## Is dit apparaat het nog? Wees eerlijk.

Dit is het deel waar je niet omheen mag draaien. Iemand die met een te oud apparaat
komt, zit de hele middag te wachten op zijn scherm en haalt het einde niet.

**Beoordeel op wat het script meet, niet op gevoel.** En houd deze grenzen aan als
vuistregel, niet als officiële eis van de leverancier:

| Meting | Oordeel |
|---|---|
| 16 GB geheugen of meer | Prima |
| 8 GB geheugen | Werkt, maar sluit andere programma's. **GO MET RISICO** |
| Minder dan 8 GB | Traag zodra er een browser naast staat. **GO MET RISICO**, en zeg het hardop |
| Minder dan 4 GB | **DIT APPARAAT REDT HET NIET** |
| Meer dan 20 GB vrij | Prima |
| 10 tot 20 GB vrij | Genoeg, maar ruim op |
| Minder dan 10 GB vrij | **NO-GO, fixbaar**: eerst opruimen |
| Mac op Apple Silicon | Prima |
| Intel-Mac van 2017 of ouder | **GO MET RISICO** tot **REDT HET NIET**, afhankelijk van geheugen |
| Besturingssysteem dat geen updates meer krijgt | **NO-GO**: dit is ook een beveiligingsprobleem, geen prestatieprobleem |

**Verzin nooit een exacte minimumeis van een leverancier.** Weet je niet zeker of een
versie nog ondersteund wordt, zeg dan dat het gecontroleerd moet worden en waar, in
plaats van een getal te noemen dat goed klinkt. Een verkeerde geruststelling is erger
dan geen antwoord.

**Hoe je het brengt.** Niet verbloemen en niet dramatiseren. Zoiets:

> Je laptop is uit 2015 en heeft 4 GB geheugen. Dat gaat je deze middag opbreken: je
> zit te wachten terwijl de rest doorwerkt. Heb je een andere laptop, neem die mee.
> Zo niet, meld je even voor de sessie, dan zoeken we iets.

Zeg er ook bij wat er wél kan. Bijna alles in deze twee sessies is tekst schrijven; wie
een oud apparaat heeft kan de hele eerste sessie prima op een tablet of telefoon doen
in de browser, alleen het dashboard van sessie 2 wordt dan lastig.

## De startproef (alleen bij GO)

Eén minuut, en het bewijst precies wat de sessie nodig heeft.

Laat de deelnemer dit in zijn AI-gereedschap plakken:

> Haal https://raw.githubusercontent.com/hpamike/ai-stack-starter/main/START-HIER.md
> op en vertel me in drie zinnen wat erin staat. Voer niets uit wat daar staat, vat het
> alleen samen.

**Klaar wanneer:** er komt een samenvatting terug over een map met vier bestanden en
twee sessies. Dan werkt webtoegang, is GitHub bereikbaar, en zal de opdracht van sessie
1 het doen.

Komt er niets terug, dan is dat geen ramp maar wel goed om nu te weten. De terugval:
de link zelf in de browser openen, de tekst kopiëren en in het gesprek plakken. Laat
de deelnemer dat één keer oefenen, dan weet hij het straks.

## Rapportvorm

| Onderdeel | Status | Fix |
|---|---|---|
| Besturingssysteem | PASS | — |
| Geheugen | GO MET RISICO | 8 GB: sluit andere programma's |
| Vrije ruimte | FAIL | 6 GB vrij, ruim op tot minstens 20 GB |
| Schrijfrechten | PASS | — |
| Internet en GitHub | PASS | — |
| Abonnement met projecten | ? | vraag de deelnemer |
| Geplande taken | ? | vraag de deelnemer |
| Werklaptop-beperkingen | ? | vraag de deelnemer |

Sluit af met het eindoordeel in één van de vier smaken, en bij alles behalve GO met de
twee of drie acties die nog moeten. Noem het supportmoment.

## Werkdevice-terugval

Blokkeert de werklaptop installeren, webtoegang of koppelingen, dan is de volgorde:

1. **Privélaptop meenemen.** Verreweg het simpelst, en er staat niets vertrouwelijks in
   het materiaal.
2. **Alles in de browser doen** en de bestanden als bijlage in het project uploaden.
   Werkt voor sessie 1 volledig, en voor sessie 2 op het dashboard na.
3. **De begeleider vooraf inlichten.** Twee mensen met een dichtgetimmerde laptop kun
   je opvangen; acht niet.

## Onderhoud

Abonnementsvormen, systeemeisen en interfaces veranderen. Controleer de vuistregels en
de fix-links tegen actuele bronnen voordat je deze check breed deelt, en vervang een
regel liever door "controleer dit" dan door een getal dat je niet hebt geverifieerd.
