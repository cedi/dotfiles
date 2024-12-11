# Set default editor
# Prefer nvim, fallback to vscode, or simply use notepad if nothing else is installed... :(
$editor = "notepad"

if (Test-CommandExists nvim) {
    $editor = "nvim"
}
elseif (Test-CommandExists code) {
    $editor = "code --wait"
}

$env:EDITOR = $editor
$env:KUBE_EDITOR = $editor

if (Test-ModuleExists Terminal-Icons) {
    Import-Module -Name Terminal-Icons
}