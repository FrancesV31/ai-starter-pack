# install-starter-skills.ps1 - copies this pack's starter skills and subagents into your agent folders.
#   Skills    -> ~/.claude/skills  (read by Claude Code AND by Goose): vault, fact-check and thinking skills
#   Subagents -> ~/.claude/agents  (Claude Code; Goose users point to the files instead, see module 06)
# It never overwrites anything you already have.
#
# Run from the pack folder:   .\setup\install-starter-skills.ps1
# Preview without copying:    .\setup\install-starter-skills.ps1 -WhatIf
# Skills only:                .\setup\install-starter-skills.ps1 -SkipAgents
# Other destinations:         .\setup\install-starter-skills.ps1 -Destination "$HOME\.agents\skills" -AgentsDestination "D:\agents"
# If Windows blocks scripts:  powershell -NoProfile -ExecutionPolicy Bypass -File .\setup\install-starter-skills.ps1

param(
    [string]$Destination = (Join-Path $HOME ".claude\skills"),
    [string]$AgentsDestination = (Join-Path $HOME ".claude\agents"),
    [switch]$SkipAgents,
    [switch]$WhatIf
)

function Copy-NoOverwrite($items, $destDir, $label) {
    $installed = 0; $skipped = 0
    if (-not (Test-Path $destDir)) {
        if ($WhatIf) { Write-Host "  would create $destDir" }
        else { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
    }
    foreach ($item in $items) {
        $target = Join-Path $destDir $item.Name
        if (Test-Path $target) {
            Write-Host "  skip      $($item.Name)  (already exists, left untouched)" -ForegroundColor Yellow
            $skipped++
        } elseif ($WhatIf) {
            Write-Host "  would copy $($item.Name) -> $target"
        } else {
            Copy-Item -Path $item.FullName -Destination $target -Recurse
            Write-Host "  installed $($item.Name)" -ForegroundColor Green
            $installed++
        }
    }
    Write-Host "  $label`: $installed installed, $skipped skipped -> $destDir`n"
}

$skillsSource = Join-Path $PSScriptRoot "..\skills"
$agentsSource = Join-Path $PSScriptRoot "..\config-examples\subagents"
if (-not (Test-Path $skillsSource)) {
    Write-Error "Can't find the skills folder at $skillsSource. Run this script from inside the starter pack."
    exit 1
}

Write-Host "`nSkills" -ForegroundColor Cyan
Copy-NoOverwrite (Get-ChildItem $skillsSource -Directory) $Destination "Skills"

if (-not $SkipAgents) {
    Write-Host "Subagents" -ForegroundColor Cyan
    Copy-NoOverwrite (Get-ChildItem $agentsSource -Filter *.md -File) $AgentsDestination "Subagents"
}

Write-Host "Start a NEW agent session and ask: 'What skills and subagents do you have?'"
