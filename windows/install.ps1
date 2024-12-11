. $PSScriptRoot\.config\functions.ps1

Write-Host "Install PowerShell Modules..." -ForegroundColor "Yellow"

Install-Module Microsoft.WinGet.Client -AcceptLicense
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module Terminal-Icons -AcceptLicense -Force
Install-Module PSFzf -AcceptLicense -Force

Write-Host "Install Fonts..." -ForegroundColor "Yellow"

# Install NerdFont patched fonts
# Install-Font $PSScriptRoot\..\fonts

Write-Host "Configuring Privacy..." -ForegroundColor "Yellow"

# General: Don't let apps use advertising ID for experiences across apps: Allow: 1, Disallow: 0
if (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Type Folder | Out-Null}
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Id" -ErrorAction SilentlyContinue

# General: Disable Application launch tracking: Enable: 1, Disable: 0
Set-ItemProperty "HKCU:\\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Start-TrackProgs" 0

# General: Disable suggested content in settings app: Enable: 1, Disable: 0
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338393Enabled" 0
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338394Enabled" 0
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338396Enabled" 0

# General: Disable tips and suggestions for welcome and what's new: Enable: 1, Disable: 0
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-310093Enabled" 0

# General: Disable tips and suggestions when I use windows: Enable: 1, Disable: 0
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338389Enabled" 0

# # Install VSCode extensions
# if (Test-CommandExists code) {
#     Write-Host "Install VSCode Plugins..." -ForegroundColor "Yellow"
#     code --install-extension aaron-bond.better-comments
#     code --install-extension eamodio.gitlens
#     code --install-extension devprod.vulnerability-extension
#     code --install-extension ms-vsliveshare.vsliveshare
#     code --install-extension oderwat.indent-rainbow
#     code --install-extension shardulm94.trailing-spaces
#     code --install-extension davidanson.vscode-markdownlint
#     code --install-extension yzhang.markdown-all-in-one
#     code --install-extension bierner.markdown-mermaid
#     code --install-extension ms-azuretools.azure-dev
#     code --install-extension ms-vscode.azure-account
#     code --install-extension ms-azuretools.vscode-azureappservice
#     code --install-extension ms-azuretools.vscode-azurecontainerapps
#     code --install-extension ms-azuretools.vscode-azurefunctions
#     code --install-extension ms-azuretools.vscode-azureresourcegroups
#     code --install-extension ms-azuretools.vscode-azurestaticwebapps
#     code --install-extension ms-azuretools.vscode-azurestorage
#     code --install-extension ms-azuretools.vscode-azurevirtualmachines
#     code --install-extension ms-azuretools.vscode-bicep
#     code --install-extension ms-azuretools.vscode-cosmosdb
#     code --install-extension ms-azuretools.vscode-docker
#     code --install-extension ms-vscode.azure-repos
#     code --install-extension ms-vscode.azurecli
#     code --install-extension bencoleman.armview
#     code --install-extension msazurermtools.azurerm-vscode-tools
#     code --install-extension ms-dotnettools.csdevkit
#     code --install-extension ms-dotnettools.csharp
#     code --install-extension ms-dotnettools.vscode-dotnet-runtime
#     code --install-extension ms-vscode.cpptools
#     code --install-extension ms-vscode.powershell
#     code --install-extension ms-vscode-remote.remote-containers
#     code --install-extension ms-vscode-remote.remote-ssh
#     code --install-extension ms-vscode-remote.remote-ssh-edit
#     code --install-extension ms-vscode-remote.remote-wsl
#     code --install-extension ms-vscode-remote.vscode-remote-extensionpack
# }

# Install tools
Write-Host "Installing tools using winget configuration" -ForegroundColor "Yellow"
winget configure -f $PSScriptRoot\configuration.dsc.yaml --accept-configuration-agreements

# Install dotfiles
Write-Host "Installing dotfiles" -ForegroundColor "Yellow"
$profileDir = Split-Path -parent $profile
$configDir = Join-Path $profileDir ".config"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $configDir -ItemType Directory -Force -ErrorAction SilentlyContinue

# Symlink PowerShell_profile
if (Test-Path $profile -PathType Leaf) {
    Remove-Item $profile
}
New-Item -Path $profile -ItemType SymbolicLink -Value $PSScriptRoot\\Microsoft.PowerShell_profile.ps1

# Symlink powershell config
if (Test-Path "$profileDir\powershell.config.json" -PathType Leaf) {
    Remove-Item "$profileDir\powershell.config.json"
}
New-Item -Path "$profileDir\powershell.config.json" -ItemType SymbolicLink -Value $PSScriptRoot\\powershell.config.json

# Symlink PowerShell specific config
if (Test-Path $configDir -PathType Container) {
    Remove-Item -Recurse $configDir
}
New-Item -Path $configDir -ItemType SymbolicLink -Value $PSScriptRoot\\.config

# Symlink global configs
if (Test-Path "$home\.gitconfig" -PathType Leaf) {
    Remove-Item "$home\.gitconfig"
}
New-Item -Path "$home\.gitconfig" -ItemType SymbolicLink -Value $PSScriptRoot\\..\.gitconfig

# Symlink nvim config
if (Test-Path "$ENV:USERPROFILE\\AppData\\Local\\nvim" -PathType Container) {
    Remove-Item -Recurse "$ENV:USERPROFILE\\AppData\\Local\\nvim"
}
New-Item -Path $ENV:USERPROFILE\\AppData\\Local\\nvim -ItemType SymbolicLink -Value $PSScriptRoot\\..\.config\nvim

Remove-Variable configDir
Remove-Variable profileDir
