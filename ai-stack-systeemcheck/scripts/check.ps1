# Systeemcheck voor de sessies "je eigen AI-assistent" en "je intelligentie-stack".
# Windows / PowerShell. Meet feiten en oordeelt met vuistregels; verzint geen
# leverancierseisen.
# Gebruik:  powershell -ExecutionPolicy Bypass -File check.ps1 -Sessie all

param([string]$Sessie = "all")

$Installer = "https://raw.githubusercontent.com/hpamike/ai-stack-starter/main/START-HIER.md"
$script:fails = 0; $script:risico = 0; $script:fataal = 0

function Line($n, $s) { "{0,-28} {1}" -f "  $n", $s | Write-Host }
function Ok($n, $s)   { Line $n "PASS  $s" }
function Warn($n, $s) { Line $n "RISICO  $s"; $script:risico++ }
function Bad($n, $s)  { Line $n "FAIL  -> $s"; $script:fails++ }
function Dood($n, $s) { Line $n "REDT HET NIET  -> $s"; $script:fataal++ }

Write-Host "== Systeemcheck =="
Write-Host "Sessie: $Sessie"
Write-Host ""

Write-Host "-- Apparaat --"
$os  = Get-CimInstance Win32_OperatingSystem
$cs  = Get-CimInstance Win32_ComputerSystem
$cpu = (Get-CimInstance Win32_Processor | Select-Object -First 1).Name

Line "Besturingssysteem" "$($os.Caption) (build $($os.BuildNumber))"
Line "Model"             "$($cs.Manufacturer) $($cs.Model)"
Line "Processor"         $cpu

# Geen einddatum van ondersteuning noemen die niet geverifieerd is: melden en laten checken.
if ($os.Caption -match "Windows 1[01]") {
  if ($os.Caption -match "Windows 10") {
    Warn "Windows-versie" "Windows 10 loopt op zijn eind; controleer of dit toestel nog beveiligingsupdates krijgt"
  } else { Ok "Windows-versie" "Windows 11" }
} else {
  Dood "Windows-versie" "ouder dan Windows 10; dit krijgt geen updates meer en is ook een beveiligingsrisico"
}

$memGB = [math]::Round($cs.TotalPhysicalMemory / 1GB)
if     ($memGB -ge 16) { Ok   "Werkgeheugen" "$memGB GB" }
elseif ($memGB -ge 8)  { Warn "Werkgeheugen" "$memGB GB; sluit andere programma's tijdens de sessie" }
elseif ($memGB -ge 4)  { Warn "Werkgeheugen" "$memGB GB; traag zodra er een browser naast staat" }
else                   { Dood "Werkgeheugen" "$memGB GB is te weinig; neem een ander apparaat mee" }

$sys = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$($env:SystemDrive)'"
$vrijGB = [math]::Round($sys.FreeSpace / 1GB)
if     ($vrijGB -ge 20) { Ok   "Vrije schijfruimte" "$vrijGB GB" }
elseif ($vrijGB -ge 10) { Warn "Vrije schijfruimte" "$vrijGB GB; ruim wat op" }
else                    { Bad  "Vrije schijfruimte" "$vrijGB GB vrij; ruim op tot minstens 20 GB" }
Write-Host ""

Write-Host "-- Kan ik werken op dit apparaat? --"
$t = Join-Path $env:USERPROFILE ".stackcheck-tmp"
try {
  New-Item -ItemType Directory -Path $t -Force -ErrorAction Stop | Out-Null
  "test" | Set-Content (Join-Path $t "test.md") -ErrorAction Stop
  Ok "Schrijfrechten" "map en bestand aanmaken lukt"
  Remove-Item $t -Recurse -Force -ErrorAction SilentlyContinue
} catch {
  Bad "Schrijfrechten" "geen schrijfrechten in je gebruikersmap; gebruik een privelaptop"
}

$claude = @(
  (Join-Path $env:LOCALAPPDATA "AnthropicClaude"),
  (Join-Path $env:LOCALAPPDATA "Programs\claude")
) | Where-Object { Test-Path $_ }
if ($claude) { Ok "Claude-desktopapp" "geinstalleerd" }
else { Line "Claude-desktopapp" "niet gevonden (alleen nodig voor de route met bestandstoegang)" }

$sync = @("$env:USERPROFILE\OneDrive", "$env:USERPROFILE\Dropbox", "$env:USERPROFILE\Google Drive") |
        Where-Object { Test-Path $_ } | ForEach-Object { Split-Path $_ -Leaf }
if ($sync) { Ok "Synchronisatiemap" ("gevonden: " + ($sync -join ", ")) }
else { Line "Synchronisatiemap" "geen OneDrive/Drive/Dropbox gevonden; je map komt dan lokaal te staan" }
Write-Host ""

Write-Host "-- Internet en de opdracht --"
try {
  Invoke-WebRequest -Uri "https://raw.githubusercontent.com" -Method Head -TimeoutSec 8 -UseBasicParsing | Out-Null
  Ok "raw.githubusercontent.com" "bereikbaar"
} catch {
  Bad "raw.githubusercontent.com" "geblokkeerd op dit netwerk; terugval is kopieren en plakken"
}

try {
  $r = Invoke-WebRequest -Uri $Installer -TimeoutSec 15 -UseBasicParsing
  $bytes = $r.Content.Length
  if ($bytes -gt 500) { Ok "Opdracht ophalen" "$bytes bytes binnengehaald" }
  else { Bad "Opdracht ophalen" "leeg antwoord; open de link zelf en plak de tekst in het gesprek" }
} catch {
  Bad "Opdracht ophalen" "lukt niet; open de link in je browser, kopieer de tekst en plak die in het gesprek"
}
Write-Host ""

if ($Sessie -eq "2" -or $Sessie -eq "all") {
  Write-Host "-- Extra voor sessie 2 --"
  Line "Browser" "nodig om je dashboard te openen; vrijwel altijd aanwezig"
  Line "Agendakoppeling" "handmatig checken in je AI-gereedschap (geen eis, wel sterk aangeraden)"
  Write-Host ""
}

Write-Host "-- Wat ik NIET kan zien, vraag dit zelf --"
Write-Host "  1. Heb je een abonnement waarin je projecten kunt aanmaken?"
Write-Host "  2. Kun je een taak inplannen die elke ochtend draait?"
Write-Host "  3. Is dit een laptop van je werkgever, en blokkeert die installaties of webtoegang?"
Write-Host ""

Write-Host "== Eindoordeel =="
if ($script:fataal -gt 0) {
  Write-Host "DIT APPARAAT REDT HET NIET - $($script:fataal) onoplosbaar punt(en). Neem een ander device mee."
} elseif ($script:fails -gt 0) {
  Write-Host "NO-GO, fixbaar - $($script:fails) punt(en) te doen, en $($script:risico) aandachtspunt(en)."
} elseif ($script:risico -gt 0) {
  Write-Host "GO MET RISICO - het werkt, maar $($script:risico) punt(en) gaan schuren. Zie hierboven."
} else {
  Write-Host "GO - je apparaat is klaar. Beantwoord nog wel de drie vragen hierboven."
}
