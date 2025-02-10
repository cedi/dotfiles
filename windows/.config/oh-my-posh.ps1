if (-Not (Test-CommandExists oh-my-posh)) {
    Write-Host "could not find command: oh-my-posh" -ForegroundColor "Red"
    return;
}

oh-my-posh --init --shell pwsh --config C:\Users\ckienzler\src\gh\cedi\dotfiles\.config\oh-my-posh\themes\tron-cedi.omp.json | Invoke-Expression

Enable-PoshTransientPrompt
Enable-PoshTooltips