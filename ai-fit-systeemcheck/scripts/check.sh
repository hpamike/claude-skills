#!/usr/bin/env bash
# AI Fit Systeemcheck (Mac/Linux). Draait een reeks checks en print PASS/FAIL.
# Gebruik: bash check.sh [vibecoding|skills|all]
set -u
TRACK="${1:-all}"
PASS="PASS"; FAIL="FAIL"
fails=0

line() { printf "%-22s %s\n" "$1" "$2"; }
ok()   { line "$1" "$PASS"; }
bad()  { line "$1" "$FAIL  -> $2"; fails=$((fails+1)); }

echo "== AI Fit Systeemcheck =="
echo "Spoor: $TRACK"
echo

# Basis
echo "-- Basis --"
line "OS" "$(uname -s) $(uname -m)"
WRITE_DIR="${HOME}/aifit-check-tmp"
if mkdir -p "$WRITE_DIR" 2>/dev/null && echo test > "$WRITE_DIR/test.txt" 2>/dev/null; then
  ok "Schrijfrechten"; rm -rf "$WRITE_DIR"
else
  bad "Schrijfrechten" "geen schrijfrechten in home-map; gebruik privelaptop of no-install-pad"
fi
if ping -c1 -W2 github.com >/dev/null 2>&1 || curl -fsI https://github.com >/dev/null 2>&1; then
  ok "Internet"
else
  bad "Internet" "controleer je verbinding/proxy"
fi
echo

# Vibecoding
if [ "$TRACK" = "vibecoding" ] || [ "$TRACK" = "all" ]; then
  echo "-- Vibecoding --"
  if command -v node >/dev/null 2>&1; then ok "Node.js ($(node -v))"; else bad "Node.js" "installeer via https://nodejs.org (LTS)"; fi
  if command -v npm  >/dev/null 2>&1; then ok "npm ($(npm -v))";  else bad "npm" "komt mee met Node.js LTS"; fi
  if command -v git  >/dev/null 2>&1; then ok "git ($(git --version | awk '{print $3}'))"; else bad "git" "installeer via https://git-scm.com"; fi
  if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    ok "GitHub-toegang (gh)"
  elif git config --global user.name >/dev/null 2>&1; then
    line "GitHub-toegang" "DEELS -> git is geconfigureerd, maar log in met 'gh auth login' of GitHub Desktop"
  else
    bad "GitHub-toegang" "log in met 'gh auth login' of installeer GitHub Desktop"
  fi
  echo
fi

# Skills / PA
if [ "$TRACK" = "skills" ] || [ "$TRACK" = "all" ]; then
  echo "-- Skills / PA --"
  SK="${HOME}/aifit-test-skill"
  if mkdir -p "$SK" 2>/dev/null && printf -- "---\nname: hallo\n---\n# Hallo\n" > "$SK/SKILL.md" 2>/dev/null; then
    ok "Map + SKILL.md aanmaken"; rm -rf "$SK"
  else
    bad "Map + SKILL.md aanmaken" "geen lokale schrijfrechten; gebruik desktop-app/privelaptop"
  fi
  echo "Let op: connectoren (agenda/mail/browser) en Cowork-toegang handmatig checken in de app."
  echo
fi

echo "== Eindoordeel =="
if [ "$fails" -eq 0 ]; then
  echo "GO - je device is klaar voor de workout."
else
  echo "NO-GO - $fails punt(en) nog te fixen (zie hierboven). Lukt het niet? Meld je op het inloopmoment."
fi
