# run-weekly-lint.ps1
# Runs the vault lint headless, for Windows Task Scheduler (see module 07).
# 1. Edit the two settings below.
# 2. Test it by hand:   powershell -NoProfile -ExecutionPolicy Bypass -File .\run-weekly-lint.ps1
# 3. Then schedule it with the schtasks command from module 07.

# ---- Settings ---------------------------------------------------------------
$VaultPath = "C:\Users\YOUR-NAME\Documents\my-vault"   # folder that contains AGENTS.md
$Agent     = "claude"                                   # "claude" or "goose"
# -----------------------------------------------------------------------------

$ErrorActionPreference = "Stop"

if (-not (Test-Path (Join-Path $VaultPath "AGENTS.md"))) {
    Write-Error "No AGENTS.md found in '$VaultPath'. Edit `$VaultPath at the top of this script."
    exit 1
}

$logFile = Join-Path $VaultPath "sessions\_automation-runs.log"
$stamp   = Get-Date -Format "yyyy-MM-dd HH:mm"
Set-Location $VaultPath

$prompt = "Run the vault-lint skill on this vault (or, if you don't have it, the Lint operation in AGENTS.md). " +
          "You are running unattended: do not ask questions. Write the report to sessions/."

if ($Agent -eq "claude") {
    # Only these tools are allowed: read and write notes. No shell commands, no web.
    $output = & claude -p $prompt --allowedTools "Read,Write,Edit,Glob,Grep" 2>&1
} elseif ($Agent -eq "goose") {
    $output = & goose run --no-session -t $prompt 2>&1
} else {
    Write-Error "Unknown agent '$Agent'. Use 'claude' or 'goose'."
    exit 1
}
$code = $LASTEXITCODE

# Keep a short trace of every run, so you can see that the schedule actually fired.
Add-Content -Path $logFile -Value "[$stamp] agent=$Agent exit=$code"
Add-Content -Path $logFile -Value ($output | Out-String)
exit $code
