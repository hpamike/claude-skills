#!/usr/bin/env bash
# Systeemcheck voor de sessies "je eigen AI-assistent" en "je intelligentie-stack".
# Mac en Linux. Meet feiten en oordeelt met vuistregels; verzint geen leverancierseisen.
# Gebruik: bash check.sh [1|2|all]
#
# Dit script MEET alleen. Het stelt geen vragen en drukt geen checklist af: het
# abonnement, de geplande taken, de werklaptop en de agendakoppeling horen in het
# gesprek thuis, waar ze uitgezocht kunnen worden. Zie SKILL.md stap 4.
#
# LET OP: draait dit script in een Cowork-sandbox, dan meten de geheugen- en
# schijfregels die sandbox en NIET de laptop van de deelnemer. Gebruik voor het
# hardware-oordeel de officiele readiness-check:
#   https://claude.ai/api/desktop/darwin/universal/cowork-readiness-check/latest/redirect
# De netwerk- en schrijfrechtenchecks hieronder kloppen wel, waar ze ook draaien.
set -u
SESSIE="${SESSIE:-${1:-all}}"
INSTALLER="https://raw.githubusercontent.com/hpamike/ai-stack-starter/main/START-HIER.md"

fails=0; risico=0; fataal=0
line() { printf "  %-26s %s\n" "$1" "$2"; }
ok()   { line "$1" "PASS  $2"; }
warn() { line "$1" "RISICO  $2"; risico=$((risico+1)); }
bad()  { line "$1" "FAIL  -> $2"; fails=$((fails+1)); }
dood() { line "$1" "REDT HET NIET  -> $2"; fataal=$((fataal+1)); }

echo "== Systeemcheck =="
echo "Sessie: $SESSIE"
echo

echo "-- Apparaat --"
OS="$(uname -s)"; ARCH="$(uname -m)"
if [ "$OS" = "Darwin" ]; then
  VER="$(sw_vers -productVersion 2>/dev/null || echo onbekend)"
  MODEL="$(sysctl -n hw.model 2>/dev/null || echo onbekend)"
  line "Besturingssysteem" "macOS $VER"
  line "Model" "$MODEL"
  if [ "$ARCH" = "arm64" ]; then
    ok "Processor" "Apple Silicon"
  else
    warn "Processor" "Intel-Mac; bij 8 GB of minder wordt dit traag"
  fi
  MEM_B="$(sysctl -n hw.memsize 2>/dev/null || echo 0)"
  MEM_GB=$(( MEM_B / 1024 / 1024 / 1024 ))
else
  line "Besturingssysteem" "$(uname -sr)"
  line "Architectuur" "$ARCH"
  MEM_KB="$(awk '/MemTotal/{print $2}' /proc/meminfo 2>/dev/null || echo 0)"
  MEM_GB=$(( MEM_KB / 1024 / 1024 ))
fi

if   [ "$MEM_GB" -ge 16 ]; then ok   "Werkgeheugen" "${MEM_GB} GB"
elif [ "$MEM_GB" -ge 8  ]; then warn "Werkgeheugen" "${MEM_GB} GB; sluit andere programma's tijdens de sessie"
elif [ "$MEM_GB" -ge 4  ]; then warn "Werkgeheugen" "${MEM_GB} GB; traag zodra er een browser naast staat"
elif [ "$MEM_GB" -gt 0  ]; then dood "Werkgeheugen" "${MEM_GB} GB is te weinig; neem een ander apparaat mee"
else                            line "Werkgeheugen" "niet te meten"
fi

VRIJ_GB="$(df -g / 2>/dev/null | awk 'NR==2{print $4}')"
[ -z "${VRIJ_GB:-}" ] && VRIJ_GB="$(df -BG / 2>/dev/null | awk 'NR==2{gsub(/G/,"",$4); print $4}')"
if   [ -z "${VRIJ_GB:-}" ];   then line "Vrije schijfruimte" "niet te meten"
elif [ "$VRIJ_GB" -ge 20 ];   then ok   "Vrije schijfruimte" "${VRIJ_GB} GB"
elif [ "$VRIJ_GB" -ge 10 ];   then warn "Vrije schijfruimte" "${VRIJ_GB} GB; ruim wat op"
else                               bad  "Vrije schijfruimte" "${VRIJ_GB} GB vrij; ruim op tot minstens 20 GB"
fi
echo

echo "-- Kan ik werken op dit apparaat? --"
T="${HOME}/.stackcheck-tmp"
if mkdir -p "$T" 2>/dev/null && echo test > "$T/test.md" 2>/dev/null; then
  ok "Schrijfrechten" "map en bestand aanmaken lukt"; rm -rf "$T"
else
  bad "Schrijfrechten" "geen schrijfrechten in je thuismap; gebruik een privelaptop"
fi

if [ -d "/Applications/Claude.app" ]; then
  ok "Claude-desktopapp" "geinstalleerd"
else
  line "Claude-desktopapp" "niet gevonden (alleen nodig voor de route met bestandstoegang)"
fi

SYNC=""
for d in "$HOME/Library/CloudStorage" "$HOME/OneDrive" "$HOME/Dropbox" "$HOME/Google Drive"; do
  [ -d "$d" ] && SYNC="$SYNC $(basename "$d")"
done
if [ -n "$SYNC" ]; then ok "Synchronisatiemap" "gevonden:$SYNC"
else line "Synchronisatiemap" "geen Drive/OneDrive/Dropbox gevonden; je map komt dan lokaal te staan"; fi
echo

echo "-- Internet en de opdracht --"
if curl -fsI -m 8 https://raw.githubusercontent.com >/dev/null 2>&1; then
  ok "raw.githubusercontent.com" "bereikbaar"
else
  bad "raw.githubusercontent.com" "geblokkeerd op dit netwerk; terugval is kopieren en plakken"
fi

BYTES="$(curl -fsL -m 15 "$INSTALLER" 2>/dev/null | wc -c | tr -d ' ')"
if [ "${BYTES:-0}" -gt 500 ]; then
  ok "Opdracht ophalen" "${BYTES} bytes binnengehaald"
else
  bad "Opdracht ophalen" "lukt niet; open de link in je browser, kopieer de tekst en plak die in het gesprek"
fi
echo

if [ "$SESSIE" = "2" ] || [ "$SESSIE" = "all" ]; then
  echo "-- Extra voor sessie 2 --"
  line "Browser" "nodig om je dashboard te openen; vrijwel altijd aanwezig"
  echo
fi

echo "== Eindoordeel =="
if [ "$fataal" -gt 0 ]; then
  echo "DIT APPARAAT REDT HET NIET - $fataal onoplosbaar punt(en). Neem een ander device mee."
elif [ "$fails" -gt 0 ]; then
  echo "NO-GO, fixbaar - $fails punt(en) te doen, en $risico aandachtspunt(en)."
elif [ "$risico" -gt 0 ]; then
  echo "GO MET RISICO - het werkt, maar $risico punt(en) gaan schuren. Zie hierboven."
else
  echo "GO - de metingen zijn in orde."
fi
