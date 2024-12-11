if (-Not (Test-CommandExists fzf)) {
    Write-Host "could not find command: fzf" -ForegroundColor "Red"
    return
}

# FZF config
$env:_PSFZF_DISABLE_GIT_COMMIT_IN_PREVIEW = $true
$env:FZF_DEFAULT_OPTS = '--height=40% --border="rounded" --border-label="fzf" --preview-window="right,1,border-rounded" --preview-label="Preview" --prompt=" ❯ " --marker="*" --pointer="→" --separator="─" --scrollbar="│" --layout="reverse" --info="right" --cycle --keep-right --bind=btab:up,tab:down --tabstop=1'
$env:_PSFZF_FZF_DEFAULT_OPTS = $env:FZF_DEFAULT_OPTS

if (Test-ModuleExists PSFzf) {
    Import-Module PSFzf
    $env:_PSFZF_FZF_TAB_PREVIEW_DEFAULT = "right"

    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
    Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
}