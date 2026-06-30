---
name: ai-fit-systeemcheck
description: >-
  AI Fit Systeemcheck — controleert vóór een AI Fit-workout of het device van de
  deelnemer klaar is (opwarmen en stretchen), en geeft een duidelijk GO/NO-GO.
  Gebruik deze skill wanneer iemand zegt "doe de systeemcheck", "ben ik klaar voor
  de workout", "check mijn systeem/laptop", "AI Fit check", "pre-flight", "klopt
  mijn setup", of vlak voor een vibecoding- of Claude Skills/PA-workout wil weten
  of tools, accounts, Node.js, git, GitHub en schrijfrechten in orde zijn.
  Detecteert Windows of Mac, of de omgeving shell-toegang heeft (Claude Code /
  Cowork desktop) dan wel alleen een browser, draait per spoor (vibecoding of
  skills/PA) de juiste checks en rapporteert per onderdeel PASS/FAIL met een fix.
  NIET gebruiken voor het ontwerpen van de workout zelf (dat doet de skill
  ai-workout-ontwerpen) of voor algemene IT-support los van een AI Fit-workout.
---

# AI Fit Systeemcheck

## Doel
Deze skill is het **opwarmen en stretchen** vóór een AI Fit-workout: ze controleert of het device van de deelnemer klaar is, zodat opstartproblemen thuis worden opgelost en niet tijdens de sessie. De uitkomst is een korte checklist met per onderdeel PASS/FAIL en een eindoordeel: **GO** (klaar) of **NO-GO** (eerst dit fixen).

Mike deelt deze skill met deelnemers. Zij installeren hem en draaien hem in hun Claude-omgeving.

## Werkwijze
1. **Leg eerst uit wat we gaan doen.** Open met een korte uitleg in gewone taal voor de deelnemer (zie "Uitleg vooraf aan de deelnemer"). Zo weet iemand wat er gaat gebeuren en waarom, vóór er iets draait.
2. **Bepaal het spoor.** Vraag kort: doe je de **vibecoding**-workout of de **skills/PA**-workout? Tailor de checks daarop. Weet de deelnemer het niet, doe dan beide kernsets.
3. **Detecteer de omgeving.** Heb je shell-toegang (Claude Code of Cowork desktop)? Draai dan de automatische checks via het script. Zit de deelnemer in een browser zonder shell, gebruik dan de handmatige checklist hieronder.
4. **Draai de checks.**
   - Mac/Linux: voer `scripts/check.sh` uit (of de losse commando's hieronder).
   - Windows: voer `scripts/check.ps1` uit in Windows Terminal/PowerShell (of de losse commando's).
   - Als scripts niet kunnen draaien, voer de commando's één voor één uit en interpreteer de uitvoer.
5. **Rapporteer.** Geef een nette tabel met per onderdeel PASS/FAIL, en bij elke FAIL een concrete fix met link. Sluit af met **GO** of **NO-GO** en, bij NO-GO, de twee tot drie acties die nog moeten.
6. **Bij GO: doe de Hello World-test.** Is alles groen, geef de deelnemer dan de afsluitende Hello World-test (zie "Afsluitende Hello World-test") met kant-en-klare instructies, zodat ze met eigen ogen zien dat de keten werkt. Bij NO-GO sla je deze stap over tot de punten zijn opgelost.
7. **Wees geruststellend en concreet.** Gewone taal, geen jargon. Eén fix per probleem. Verwijs bij twijfel naar het inloop-/supportmoment.

## Uitleg vooraf aan de deelnemer
Begin met een korte, vriendelijke uitleg, ongeveer zo (pas aan op het spoor):

> Welkom bij de opwarming voor je AI Fit-workout. We checken nu samen even of je laptop klaar is, zodat je straks tijdens de sessie meteen aan de slag kunt en niet vastloopt op de techniek. Dit duurt een paar minuten.
>
> Wat ga je doen:
> 1. Ik controleer je systeem (besturingssysteem, benodigde programma's, accounts en schrijfrechten).
> 2. Je krijgt een lijstje met groen (in orde) en rood (nog fixen). Bij rood zeg ik er meteen bij hoe je het oplost.
> 3. Staat alles op groen, dan doe je een korte Hello World-test om te zien dat alles écht werkt.
>
> Heb je een werklaptop die veel blokkeert? Geef dat aan — dan kies ik een route die wél werkt (privélaptop of een variant zonder installaties).

Vertel ook kort wat de deelnemer zelf bij de hand moet hebben: het juiste account en **minimaal abonnement**, de desktop-app (niet alleen de browser), en — voor vibecoding — een GitHub- en Vercel-account.

## Wat je controleert

### Altijd (basis)
- **Besturingssysteem en versie** (Windows of Mac, architectuur).
- **Omgeving**: desktop-app met bestands-/maptoegang óf alleen browser. Leg het verschil uit: de desktop-app kan lokaal bestanden en mappen gebruiken en opslaan, de browser niet.
- **Schrijfrechten**: kun je een map en bestand aanmaken op een normale locatie? (Werkdevices blokkeren dit soms.)
- **Internet**: bereik je de benodigde diensten?

### Spoor vibecoding
- **Node.js** aanwezig en recente versie (`node -v`).
- **npm** aanwezig (`npm -v`).
- **git** aanwezig (`git --version`).
- **GitHub-toegang**: ingelogd / kunt pushen (`gh auth status` of git-credential aanwezig; anders GitHub Desktop of `gh auth login`).
- **Schrijfrechten** in een projectmap (kan code opslaan).
- **Terminal op Windows**: gebruik Windows Terminal/PowerShell, niet alleen de oude CMD.

### Spoor skills/PA
- **Claude Cowork / Desktop** met lokale bestands-/maptoegang: kun je een map `test-skill` en `SKILL.md` aanmaken en opslaan?
- **Connectoren** (agenda, mail, browser) waar de workout die gebruikt: zijn ze gekoppeld? (Vaak handmatig te checken in de app.)
- **Werkdevice-toegang**: mag Cowork draaien en lokaal opslaan op dit device?

## Werkdevice-fallback
Als installeren, Cowork-toegang of lokaal opslaan geblokkeerd is op een vergrendelde werklaptop: adviseer het **no-install-pad** (cloud/browser-alternatief) of een **privélaptop**, en markeer dit als aandachtspunt in het rapport.

## Afsluitende Hello World-test (alleen bij GO)
Staat alles op groen, laat de deelnemer dan met eigen ogen zien dat de keten werkt. Geef de instructies kant-en-klaar en stap voor stap. Kies de test die bij het spoor past.

### Vibecoding — Hello World-pagina
1. Open Claude Code (of Cowork desktop) en kies of maak een lege map op je laptop.
2. Plak deze prompt:

> Maak in deze map een mapje `hello-world` met daarin een `index.html` die op een nette pagina groot "Hello World" toont. Start daarna een lokale webserver en geef me de link (bijvoorbeeld http://localhost:3000) zodat ik het in mijn browser kan openen.

3. Open de link in je browser.
4. **Klaar wanneer:** je ziet "Hello World" in je browser. Dan werkt je editor- en bestandsketen. (Optioneel, als je GitHub en Vercel al klaar hebt: vraag Claude om de pagina via GitHub en Vercel live te zetten en open de live-link.)

### Skills/PA — Hello-skill
1. Open Cowork desktop (met lokale bestandstoegang).
2. Plak deze prompt:

> Maak een skill met de naam `hallo` die als ik "test de hallo-skill" zeg, antwoordt met "Hallo, [vul je voornaam in] — je systeem werkt!". Maak een map `hallo` met daarin `SKILL.md` en sla die lokaal op.

3. Typ daarna: `test de hallo-skill`.
4. **Klaar wanneer:** je krijgt het "Hallo, … — je systeem werkt!"-antwoord én je ziet de map `hallo` met `SKILL.md` op je laptop staan. Dan werken Cowork-toegang en lokaal opslaan.

Lukt de Hello World-test → echt GO, je bent klaar voor de workout. Lukt hij niet → noteer waar het stokt en meld je op het inloop-/supportmoment.

## Handmatige checklist (browser, geen shell)
Loop met de deelnemer na: juiste account en **minimaal abonnement** actief, desktop-app geïnstalleerd (niet alleen browser), benodigde connectoren gekoppeld, en — voor vibecoding — GitHub- en Vercel-account werkend. Geen shell-toegang? Dan kunnen Node.js/git niet automatisch gecheckt worden; verwijs naar het inloopmoment.

## Rapportvorm
Gebruik een korte tabel:

| Onderdeel | Status | Fix bij FAIL |
| --- | --- | --- |
| Node.js | PASS/FAIL | installeer via … |
| git | PASS/FAIL | installeer via … |
| GitHub-toegang | PASS/FAIL | `gh auth login` of GitHub Desktop |
| Schrijfrechten | PASS/FAIL | privélaptop / no-install-pad |
| … | … | … |

**Eindoordeel: GO / NO-GO.** Bij NO-GO: de 2–3 acties die nog moeten, plus het supportmoment.

## Onderhoud
Interfaces, versies en minimale abonnementen veranderen. Verifieer fix-links en minimumeisen met actuele bronnen voordat je de check breed deelt.
