# check-setup.ps1 - checks what's installed for the AI Agent Starter Pack.
# Read-only: it changes nothing on your computer.
# Run from the pack folder:   .\setup\check-setup.ps1
# If Windows blocks scripts:  powershell -NoProfile -ExecutionPolicy Bypass -File .\setup\check-setup.ps1

function Show($ok, $label, $detail) {
    if ($ok) { Write-Host "  [OK] $label" -ForegroundColor Green -NoNewline }
    else     { Write-Host "  [--] $label" -ForegroundColor Yellow -NoNewline }
    if ($detail) { Write-Host "  ($detail)" } else { Write-Host "" }
}

function FirstExisting($paths) {
    foreach ($p in $paths) { if ($p -and (Test-Path $p)) { return $p } }
    return $null
}

Write-Host "`nAgents (you need at least one)" -ForegroundColor Cyan
$claude = Get-Command claude -ErrorAction SilentlyContinue
Show ([bool]$claude) "Claude Code CLI" $(if ($claude) { $claude.Source } else { "module 01, Path A" })
$goose = Get-Command goose -ErrorAction SilentlyContinue
Show ([bool]$goose) "Goose CLI" $(if ($goose) { $goose.Source } else { "module 01, Path B (optional if you use Goose Desktop)" })
$gooseApp = FirstExisting @("$env:LOCALAPPDATA\Programs\Goose\Goose.exe", "$env:LOCALAPPDATA\Goose\Goose.exe")
Show ([bool]$gooseApp) "Goose Desktop" $(if ($gooseApp) { $gooseApp } else { "not found in the usual places; ignore if you use Claude" })

Write-Host "`nMemory" -ForegroundColor Cyan
$obsidian = FirstExisting @("$env:LOCALAPPDATA\Programs\Obsidian\Obsidian.exe", "$env:LOCALAPPDATA\Obsidian\Obsidian.exe", "$env:ProgramFiles\Obsidian\Obsidian.exe")
Show ([bool]$obsidian) "Obsidian" $(if ($obsidian) { $obsidian } else { "module 03: https://obsidian.md" })
$vaultList = "$env:APPDATA\obsidian\obsidian.json"
if (Test-Path $vaultList) {
    $count = 0
    try { $count = @((Get-Content $vaultList -Raw | ConvertFrom-Json).vaults.PSObject.Properties).Count } catch {}
    Show ($count -gt 0) "Obsidian vaults registered" "$count"
}

Write-Host "`nStanding instructions (module 02)" -ForegroundColor Cyan
$claudeMd = Join-Path $HOME ".claude\CLAUDE.md"
Show (Test-Path $claudeMd) "Claude global CLAUDE.md" $claudeMd
$hints = FirstExisting @("$env:APPDATA\Block\goose\config\.goosehints", (Join-Path $HOME ".config\goose\.goosehints"))
Show ([bool]$hints) "Goose global .goosehints" $(if ($hints) { $hints } else { "optional, for the Goose path" })

Write-Host "`nSkills (module 04)" -ForegroundColor Cyan
foreach ($dir in @((Join-Path $HOME ".claude\skills"), (Join-Path $HOME ".agents\skills"))) {
    $n = 0
    if (Test-Path $dir) { $n = @(Get-ChildItem $dir -Directory -ErrorAction SilentlyContinue).Count }
    Show ($n -gt 0) "Skills in $dir" "$n found"
}
$starter = @("vault-ingest", "vault-query", "vault-lint", "session-wrap", "fact-check",
             "shape", "critique", "market", "prd", "explain", "recap")
$missing = @($starter | Where-Object { -not (Test-Path (Join-Path $HOME ".claude\skills\$_\SKILL.md")) })
Show ($missing.Count -eq 0) "Starter skills" $(if ($missing.Count) { "missing: $($missing -join ', '); run .\setup\install-starter-skills.ps1" } else { "all $($starter.Count) installed" })

Write-Host "`nSubagents (module 06)" -ForegroundColor Cyan
$agentsDir = Join-Path $HOME ".claude\agents"
$na = 0
if (Test-Path $agentsDir) { $na = @(Get-ChildItem $agentsDir -Filter *.md -ErrorAction SilentlyContinue).Count }
Show ($na -gt 0) "Claude custom subagents" "$na in $agentsDir"
Show (Test-Path (Join-Path $agentsDir "fact-checker.md")) "fact-checker subagent" $(if (Test-Path (Join-Path $agentsDir "fact-checker.md")) { "installed" } else { "run .\setup\install-starter-skills.ps1" })

Write-Host "`n[--] items are next steps, not errors. Re-run this script any time.`n"
