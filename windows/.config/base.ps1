using namespace System.Management.Automation
using namespace System.Management.Automation.Language

[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
$env:LESSCHARSET = "utf-8"

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Set my $env:PATH here

$MY_PATH = ""

# Define directories
$paths = @(
    "$HOME\bin"
)

# Check if directories exist and add them
foreach ($p in $paths) {
    if (Test-Path $p) {
        $MY_PATH += "$p;"
    }
}

# Construct PATH variable
$env:Path = ($MY_PATH + $env:Path -split ';' | Select-Object -Unique) -join ';'