# AI Fit Systeemcheck (Windows, PowerShell). Draait checks en print PASS/FAIL.
# Gebruik in Windows Terminal/PowerShell: powershell -ExecutionPolicy Bypass -File check.ps1 [vibecoding|skills|all]
param([string]$Track = "all")
$fails = 0
function Ok($n)      { "{0,-22} PASS" -f $n }
function Bad($n,$f)  { $script:fails++; "{0,-22} FAIL  -> {1}" -f $n,$f }

Write-Output "== AI Fit Systeemcheck =="
Write-Output "Spoor: $Track"
Write-Output ""

Write-Output "-- Basis --"
Write-Output ("{0,-22} {1}" -f "OS", (("Windows " + [System.Environment]::OSVersion.Version.ToString())))
$dir = Join-Path $env:USERPROFILE "aifit-check-tmp"
try { New-Item -ItemType Directory -Force -Path $dir | Out-Null; "test" | Out-File (Join-Path $dir "test.txt") -ErrorAction Stop; Ok "Schrijfrechten"; Remove-Item $dir -Recurse -Force }
catch { Bad "Schrijfrechten" "geen schrijfrechten; gebruik privelaptop of no-install-pad" }
try { if (Test-Connection github.com -Count 1 -Quiet) { Ok "Internet" } else { Bad "Internet" "controleer verbinding/proxy" } }
catch { Bad "Internet" "controleer verbinding/proxy" }
Write-Output ""

if ($Track -eq "vibecoding" -or $Track -eq "all") {
  Write-Output "-- Vibecoding --"
  if (Get-Command node -ErrorAction SilentlyContinue) { Ok ("Node.js (" + (node -v) + ")") } else { Bad "Node.js" "installeer via https://nodejs.org (LTS)" }
  if (Get-Command npm  -ErrorAction SilentlyContinue) { Ok ("npm (" + (npm -v) + ")") } else { Bad "npm" "komt mee met Node.js LTS" }
  if (Get-Command git  -ErrorAction SilentlyContinue) { Ok ("git (" + ((git --version) -replace 'git version ','') + ")") } else { Bad "git" "installeer via https://git-scm.com" }
  $ghOk = $false
  if (Get-Command gh -ErrorAction SilentlyContinue) { gh auth status 2>$null | Out-Null; if ($LASTEXITCODE -eq 0) { $ghOk = $true } }
  if ($ghOk) { Ok "GitHub-toegang (gh)" } else { Bad "GitHub-toegang" "log in met 'gh auth login' of installeer GitHub Desktop" }
  Write-Output ""
}

if ($Track -eq "skills" -or $Track -eq "all") {
  Write-Output "-- Skills / PA --"
  $sk = Join-Path $env:USERPROFILE "aifit-test-skill"
  try { New-Item -ItemType Directory -Force -Path $sk | Out-Null; "---`nname: hallo`n---`n# Hallo" | Out-File (Join-Path $sk "SKILL.md") -ErrorAction Stop; Ok "Map + SKILL.md aanmaken"; Remove-Item $sk -Recurse -Force }
  catch { Bad "Map + SKILL.md aanmaken" "geen lokale schrijfrechten; gebruik desktop-app/privelaptop" }
  Write-Output "Let op: connectoren (agenda/mail/browser) en Cowork-toegang handmatig checken in de app."
  Write-Output ""
}

Write-Output "== Eindoordeel =="
if ($fails -eq 0) { Write-Output "GO - je device is klaar voor de workout." }
else { Write-Output ("NO-GO - {0} punt(en) nog te fixen (zie hierboven). Lukt het niet? Meld je op het inloopmoment." -f $fails) }
