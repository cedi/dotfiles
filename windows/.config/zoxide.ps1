if (-Not (Test-CommandExists zoxide)) {
    Write-Host "could not find command: zoxide" -ForegroundColor "Red"
    return
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Set-CustomAlias -Name cd -Value z -Description "use zoxide for cd"
Set-CustomAlias -Name cdi -Value zi -Description "use zoxide for cd"