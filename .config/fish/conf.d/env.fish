# Locale (defaults, persistent)
set -q LANG; or set -Ux LANG en_US.UTF-8
set -q LC_CTYPE; or set -Ux LC_CTYPE en_US.UTF-8

# Editor defaults (persistent)
set -q EDITOR; or set -Ux EDITOR nvim
set -q VISUAL; or set -Ux VISUAL nvim
set -q PAGER; or set -Ux PAGER less

# Go settings (persistent defaults)
set -q GO111MODULE; or set -Ux GO111MODULE on

# NVIM socket (session-specific, don’t persist)
set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket

# XDG config home (persistent)
if test -d $HOME/.config
    set -q XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
end

# Dotfile home (persistent)
set -q DOTFILE_HOME; or set -Ux DOTFILE_HOME $XDG_CONFIG_HOME/dotfiles

# Oh-My-Posh config (persistent if exists)
if test -d $XDG_CONFIG_HOME/oh-my-posh/
    set -q OMP_CUSTOM; or set -Ux OMP_CUSTOM $XDG_CONFIG_HOME/oh-my-posh/
end

# SOPS AGE Keys (session-specific, host-dependent)
if test -d "$HOME/.age/sops"
    set keyfile "$HOME/.age/sops/keys_(hostname).txt"
    if test -f $keyfile
        set -x SOPS_AGE_KEY_FILE $keyfile
    end
end

# GOPATH / GOBIN (persistent defaults if dir exists)
if test -d $HOME/src/go
    set -q GOPATH; or set -Ux GOPATH $HOME/src/go
    set -q GOBIN; or set -Ux GOBIN $GOPATH/bin
end

# PATH setup (session-specific, deduped automatically)
if set -q GOPATH
    if test -d $GOPATH/bin
        fish_add_path $GOPATH/bin
    end
end

for dir in \
    $HOME/.krew/bin \
    $HOME/bin \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $HOME/.gem/ruby/2.5.0/bin \
    $XDG_CONFIG_HOME/fzf/bin \
    /usr/local/bin \
    /usr/local/go/bin \
    /usr/local/share/python \
    $HOME/.kube/kubediff
    if test -d $dir
        fish_add_path $dir
    end
end

# Cargo setup
set -q CARGO_HOME; or set -Ux CARGO_HOME $HOME/.cargo
set -q RUSTUP_HOME; or set -Ux RUSTUP_HOME $HOME/.rustup

if test -d $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
end

# Git tool config (persistent)
set -q GITTOOL_CONFIG; or set -Ux GITTOOL_CONFIG $XDG_CONFIG_HOME/git-tool/git-tool.yml

# Local overrides (session-specific)
if test -f $HOME/.env.fish
    source $HOME/.env.fish
end
