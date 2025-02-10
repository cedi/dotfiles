Set-Alias -name open ii

# Easier Navigation: ..
# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation

if (Test-CommandExists kubectl) {
    Set-Alias -name k kubectl
}

if (Test-CommandExists bat) {
    Set-Alias -Name cat bat
}

if (Test-CommandExists eza) {
    function Get-ChildItemLS { eza --git --icons --group-directories-first $args }
    Set-CustomAlias -Name ls -Value Get-ChildItemLS -Description "list files/directory using eza instead of Get-ChildItem"

    function Get-ChildItemLA { eza --all --git --icons --group-directories-first $args }
    Set-CustomAlias -Name la -Value Get-ChildItemLA -Description "list all files/directory (including hidden) using eza instead of Get-ChildItem"

    function Get-ChildItemLL { eza --long --time-style=long-iso --time=modified --git --icons --group-directories-first $args }
    Set-CustomAlias -Name ll -Value Get-ChildItemLL -Description "long list files/directory using eza instead of Get-ChildItem"

    function Get-ChildItemLLA { eza --all --long --time-style=long-iso --time=modified --git --icons --group-directories-first }
    Set-CustomAlias -Name lla -Value Get-ChildItemLLA -Description "long list all files/directory (including hidden) using eza instead of Get-ChildItem"
}
else {
    function Get-ChildItemLS { (Get-ChildItem $args | Select-Object -Expand Name) -join "  " }
    Set-CustomAlias -Name ls -Value Get-ChildItemLS -Description "list files/directory in linux-style instead of Get-ChildItem list-style"

    function Get-ChildItemLA { (Get-ChildItem -Force $args | Select-Object -Expand Name) -join "  " }
    Set-CustomAlias -Name la -Value Get-ChildItemLA -Description "list files/directory in linux-style instead of Get-ChildItem list-style"

    function Get-ChildItemLL { (Get-ChildItem $args | Select-Object -Expand Name) }
    Set-CustomAlias -Name ll -Value Get-ChildItemLL -Description "long list files/directory in linux-style instead of Get-ChildItem list-style"

    function Get-ChildItemLLA { (Get-ChildItem -Force $args | Select-Object -Expand Name) }
    Set-CustomAlias -Name lla -Value Get-ChildItemLLA -Description "long list files/directory in linux-style instead of Get-ChildItem list-style"
}

if (Test-Path 'C:\Program Files (x86)\GnuWin32\bin\sed.exe') {
    Set-Alias -Name sed 'C:\Program Files (x86)\GnuWin32\bin\sed.exe'
}

if (Test-CommandExists git-tool) {
    Invoke-Expression (&C:\Users\ckienzler\bin\git-tool.exe shell-init powershell)
    New-Alias -Name gt -Value C:\Users\ckienzler\bin\git-tool.exe
}
