# Locale (defaults, persistent)
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_MESSAGES en_US.UTF-8

# Editor defaults (persistent)
set -q EDITOR; or set -x EDITOR nvim
set -q VISUAL; or set -x VISUAL nvim
set -q PAGER; or set -x PAGER less

# Go settings (persistent defaults)
set -q GO111MODULE; or set -x GO111MODULE on

# NVIM socket (session-specific, don’t persist)
set -x NVIM_LISTEN_ADDRESS /tmp/nvimsocket

# XDG config home (persistent)
if test -d $HOME/.config
    set -q XDG_CONFIG_HOME; or set -x XDG_CONFIG_HOME $HOME/.config
end

# Dotfile home (persistent)
set -q DOTFILE_HOME; or set -x DOTFILE_HOME $XDG_CONFIG_HOME/dotfiles

# dracula theme for GNU grep
set -x GREP_COLORS "mt=1;38;2;255;85;85:fn=38;2;255;121;198:ln=38;2;80;250;123:bn=38;2;80;250;123:se=38;2;139;233;253"

# Oh-My-Posh config (persistent if exists)
if test -d $XDG_CONFIG_HOME/oh-my-posh/
    set -q OMP_CUSTOM; or set -x OMP_CUSTOM $XDG_CONFIG_HOME/oh-my-posh/
end

# SOPS AGE Keys (session-specific, host-dependent)
if test -d "$HOME/.age/sops"
    set keyfile "$HOME/.age/sops/keys_$hostname.txt"
    if test -f $keyfile
        set -x SOPS_AGE_KEY_FILE $keyfile
    end
end

# GOPATH / GOBIN (persistent defaults if dir exists)
if test -d $HOME/src/go
    set -q GOPATH; or set -x GOPATH $HOME/src/go
    set -q GOBIN; or set -x GOBIN $GOPATH/bin
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
set -q CARGO_HOME; or set -x CARGO_HOME $HOME/.cargo
set -q RUSTUP_HOME; or set -x RUSTUP_HOME $HOME/.rustup

if test -d $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
end

# Local overrides (session-specific)
if test -f $HOME/.env.fish
    source $HOME/.env.fish
end
