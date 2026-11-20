# get-ecc-skills.ps1 - installs a SELECTION of ECC skills (https://github.com/affaan-m/ECC, MIT licence).
# Downloads ECC's official GitHub archive to a temporary folder, copies only the skills you choose
# into your skills folder (read by Claude Code AND Goose), then deletes the temporary download.
# Never overwrites a skill you already have. No Git or Node.js needed.
#
# List all skills:            .\setup\get-ecc-skills.ps1 -List
# Install the starter set:    .\setup\get-ecc-skills.ps1
# Choose your own:            .\setup\get-ecc-skills.ps1 -Skills council, product-lens, article-writing
# Preview without copying:    .\setup\get-ecc-skills.ps1 -WhatIf
# Other destination:          .\setup\get-ecc-skills.ps1 -Destination "$HOME\.agents\skills"
# If Windows blocks scripts:  powershell -NoProfile -ExecutionPolicy Bypass -File .\setup\get-ecc-skills.ps1

param(
    [string[]]$Skills = @("market-research", "council", "search-first", "article-writing", "brand-voice",
                          "product-lens", "context-budget", "santa-method"),
    [string]$Destination = (Join-Path $HOME ".claude\skills"),
    [string]$Ref = "main",
    [switch]$List,
    [switch]$WhatIf
)

$ErrorActionPreference = "Stop"
$zipUrl = "https://github.com/affaan-m/ECC/archive/refs/heads/$Ref.zip"
$work   = Join-Path ([System.IO.Path]::GetTempPath()) ("ecc-download-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $work | Out-Null

try {
    Write-Host "Downloading ECC ($Ref) from GitHub (a large archive: this can take a few minutes)..."
    $zip = Join-Path $work "ecc.zip"
    $ProgressPreference = "SilentlyContinue"   # makes Invoke-WebRequest much faster
    Invoke-WebRequest -Uri $zipUrl -OutFile $zip -UseBasicParsing
    Expand-Archive -Path $zip -DestinationPath $work

    $root = Get-ChildItem $work -Directory | Where-Object { Test-Path (Join-Path $_.FullName "skills") } | Select-Object -First 1
    if (-not $root) { throw "No skills folder found in the downloaded archive. The ECC layout may have changed." }
    $skillsDir = Join-Path $root.FullName "skills"
    $license   = Join-Path $root.FullName "LICENSE"

    if ($List) {
        foreach ($dir in Get-ChildItem $skillsDir -Directory | Sort-Object Name) {
            $desc = ""
            $md = Join-Path $dir.FullName "SKILL.md"
            if (Test-Path $md) {
                $line = Get-Content $md -TotalCount 15 -Encoding UTF8 | Where-Object { $_ -like "description:*" } | Select-Object -First 1
                if ($line) {
                    $desc = $line.Substring(12).Trim().Trim('"')
                    if ($desc.Length -gt 110) { $desc = $desc.Substring(0, 110) + "..." }
                }
            }
            Write-Host ("{0,-34} {1}" -f $dir.Name, $desc)
        }
        Write-Host "`n$(@(Get-ChildItem $skillsDir -Directory).Count) skills. Install some with: .\setup\get-ecc-skills.ps1 -Skills name1, name2"
        return
    }

    if (-not (Test-Path $Destination)) {
        if ($WhatIf) { Write-Host "Would create $Destination" }
        else { New-Item -ItemType Directory -Path $Destination -Force | Out-Null }
    }

    $installed = 0; $skipped = 0; $missing = @()
    foreach ($name in $Skills) {
        $src = Join-Path $skillsDir $name
        $dst = Join-Path $Destination $name
        if (-not (Test-Path (Join-Path $src "SKILL.md"))) { $missing += $name; continue }
        if (Test-Path $dst) {
            Write-Host "  skip      $name  (already exists, left untouched)" -ForegroundColor Yellow
            $skipped++
        } elseif ($WhatIf) {
            Write-Host "  would copy $name -> $dst"
        } else {
            Copy-Item -Path $src -Destination $dst -Recurse
            if (Test-Path $license) { Copy-Item $license (Join-Path $dst "LICENSE-ECC.txt") }
            Write-Host "  installed $name" -ForegroundColor Green
            $installed++
        }
    }

    Write-Host "`nDone: $installed installed, $skipped skipped. Destination: $Destination"
    if ($missing.Count) { Write-Host "Not found in ECC: $($missing -join ', ')  (run with -List to see exact names)" -ForegroundColor Yellow }
    Write-Host "Start a NEW agent session and ask: 'What skills do you have?'"
}
finally {
    Remove-Item -Path $work -Recurse -Force -ErrorAction SilentlyContinue
}
