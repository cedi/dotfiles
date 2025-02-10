if (-Not (Test-CommandExists oh-my-posh)) {
    Write-Host "could not find command: oh-my-posh" -ForegroundColor "Red"
    return;
}

$profileDir = Split-Path -parent $profile
oh-my-posh --init --shell pwsh --config $profileDir\tron-cedi.omp.json | Invoke-Expression

Enable-PoshTransientPrompt
Enable-PoshTooltips