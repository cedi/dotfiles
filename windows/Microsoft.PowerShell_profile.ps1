Push-Location (Split-Path -parent $profile)

$debugModuleLoading = $false
$configurationModules = @()

$configurationModules += "base"
$configurationModules += "functions"
$configurationModules += "aliases"
$configurationModules += "editor"
$configurationModules += "psreadline"
$configurationModules += "fzf"
$configurationModules += "oh-my-posh"
$configurationModules += "zoxide"
$configurationModules += "completions"

foreach ($module in $configurationModules) {
    $modulePath = ".config\$module.ps1"
    if (Test-Path $modulePath) {
        if ($debugModuleLoading) {
            Write-Host "loading $module" -ForegroundColor "Yellow"
        }
        Invoke-Expression ". $modulePath"
    } else {
        Write-Host "Failed to load $module, could not find: $modulePath" -ForegroundColor "Red"
    }
}

Pop-Location