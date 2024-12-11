# Reload the Shell
function Reload-Powershell {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = "-nologo";
    [System.Diagnostics.Process]::Start($newProcess);
    exit
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

# Test-ModuleExists
Function Test-ModuleExists {
    Param ($module)

    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'

    try {
        if (Get-Module -ListAvailable $module) {
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

Function Test-AliasExists {
    Param ($Name)

    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'

    try {
        if (Get-Alias $Name) {
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

Function Set-CustomAlias {
    Param (
        [string]$Name,
        [string]$Value,
        [string]$Description
    )

    if (Test-AliasExists $Name) {
        Remove-Item Alias:\$Name
    }

    Set-Alias -Name $Name -Value $Value -Description $Description -Scope Global -Option AllScope
}

function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }

function touch($file) { "" | Out-File $file -Encoding ASCII }

function mkcd([String] $path) { New-Item $path -ItemType Directory -ErrorAction SilentlyContinue; Set-Location $path}

function Edit-Profile { Invoke-Expression "$(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $profile" }

function Install-Font([String]$fontDir) {
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