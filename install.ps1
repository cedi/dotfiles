function installFonts([String]$fontDir) {
    Write-Output "Install fonts: $fontDir"

    $fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
    foreach ($file in Get-ChildItem $fontDir\\*.ttf)
    {
        $fileName = $file.Name
        if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
            Write-Output $fileName
            Get-ChildItem $file | ForEach-Object{ $fonts.CopyHere($_.fullname) }
        }
    }

    Copy-Item $fontDir\\*.ttf c:\windows\fonts\
}

# Test-CommandExists
Function Test-CommandExists {
    Param ($command)

    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'

    try {
        if (Get-Command $command) {
            return $true
        }
    }
    Catch {
        return $false
    }
    Finally {
        $ErrorActionPreference = $oldPreference
    }
}

Install-Module -Name Terminal-Icons -Repository PSGallery

# Install gsudo
PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"

# fzf
winget install fzf
Install-Module -Name PSFzf

winget install sharkdp.bat # bat is a better pager
winget install eza-community.eza # eza is a better ls
winget install ajeetdsouza.zoxide # zoxide is a better cd
winget install JanDeDobbeleer.OhMyPosh -s winget # nice prompt
winget install -e --id Microsoft.VisualStudioCode # VSCode
winget install Neovim.Neovim

# Install NerdFont patched fonts
installFonts(".\\fonts")

# Install VSCode extensions
if (Test-CommandExists code) {
    code --install-extension aaron-bond.better-comments
    code --install-extension eamodio.gitlens
    code --install-extension devprod.vulnerability-extension
    code --install-extension ms-vsliveshare.vsliveshare
    code --install-extension oderwat.indent-rainbow
    code --install-extension shardulm94.trailing-spaces
    code --install-extension davidanson.vscode-markdownlint
    code --install-extension yzhang.markdown-all-in-one
    code --install-extension bierner.markdown-mermaid
    code --install-extension ms-azuretools.azure-dev
    code --install-extension ms-vscode.azure-account
    code --install-extension ms-azuretools.vscode-azureappservice
    code --install-extension ms-azuretools.vscode-azurecontainerapps
    code --install-extension ms-azuretools.vscode-azurefunctions
    code --install-extension ms-azuretools.vscode-azureresourcegroups
    code --install-extension ms-azuretools.vscode-azurestaticwebapps
    code --install-extension ms-azuretools.vscode-azurestorage
    code --install-extension ms-azuretools.vscode-azurevirtualmachines
    code --install-extension ms-azuretools.vscode-bicep
    code --install-extension ms-azuretools.vscode-cosmosdb
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension ms-vscode.azure-repos
    code --install-extension ms-vscode.azurecli
    code --install-extension bencoleman.armview
    code --install-extension msazurermtools.azurerm-vscode-tools
    code --install-extension ms-dotnettools.csdevkit
    code --install-extension ms-dotnettools.csharp
    code --install-extension ms-dotnettools.vscode-dotnet-runtime
    code --install-extension ms-vscode.cpptools
    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode-remote.remote-containers
    code --install-extension ms-vscode-remote.remote-ssh
    code --install-extension ms-vscode-remote.remote-ssh-edit
    code --install-extension ms-vscode-remote.remote-wsl
    code --install-extension ms-vscode-remote.vscode-remote-extensionpack
}

# Create symlinks for the profile and nvim config
New-Item -Path $ENV:USERPROFILE\\AppData\\Local\\nvim -ItemType SymbolicLink -Value $PSScriptRoot\\.config\nvim
New-Item -Path $profile -ItemType SymbolicLink -Value $PSScriptRoot\\Microsoft.PowerShell_profile.ps1
