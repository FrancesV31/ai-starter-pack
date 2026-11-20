# install-starter-skills.ps1 - copies this pack's starter skills into your skills folder.
# Default destination: ~/.claude/skills (read by Claude Code AND by Goose).
# It never overwrites a skill you already have.
#
# Run from the pack folder:   .\setup\install-starter-skills.ps1
# Preview without copying:    .\setup\install-starter-skills.ps1 -WhatIf
# Other destination:          .\setup\install-starter-skills.ps1 -Destination "$HOME\.agents\skills"
# If Windows blocks scripts:  powershell -NoProfile -ExecutionPolicy Bypass -File .\setup\install-starter-skills.ps1

param(
    [string]$Destination = (Join-Path $HOME ".claude\skills"),
    [switch]$WhatIf
)

$source = Join-Path $PSScriptRoot "..\skills"
if (-not (Test-Path $source)) {
    Write-Error "Can't find the skills folder at $source. Run this script from inside the starter pack."
    exit 1
}

if (-not (Test-Path $Destination)) {
    if ($WhatIf) { Write-Host "Would create $Destination" }
    else { New-Item -ItemType Directory -Path $Destination -Force | Out-Null }
}

$installed = 0; $skipped = 0
foreach ($skill in Get-ChildItem $source -Directory) {
    $target = Join-Path $Destination $skill.Name
    if (Test-Path $target) {
        Write-Host "  skip     $($skill.Name)  (already exists, left untouched)" -ForegroundColor Yellow
        $skipped++
    } elseif ($WhatIf) {
        Write-Host "  would copy $($skill.Name) -> $target"
    } else {
        Copy-Item -Path $skill.FullName -Destination $target -Recurse
        Write-Host "  installed $($skill.Name)" -ForegroundColor Green
        $installed++
    }
}

Write-Host "`nDone: $installed installed, $skipped skipped. Destination: $Destination"
Write-Host "Start a NEW agent session and ask: 'What skills do you have?'"
