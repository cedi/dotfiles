# Minimal bash profile for AI coding agents (opencode, claude-code, etc.)
# Not intended for interactive use — fish and zsh handle that.
#
# Strategy: reuse .zshenv for the shared environment (PATH, GOPATH, EDITOR,
# locale, cargo, XDG, etc.) and add bash-specific tool activations here.

# Shared environment (PATH, GOPATH, EDITOR, locale, cargo, XDG, etc.)
. ~/.zshenv 2>/dev/null

# Homebrew — must come before tool lookups so `command -v` finds brew-installed binaries
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# mise — runtime version manager (node, python, etc.)
command -v mise >/dev/null 2>&1 && eval "$(mise activate bash)"

# direnv — per-project .envrc support
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"

# Local machine overrides (secrets, tokens, machine-specific vars)
[ -f ~/.env.bash ] && . ~/.env.bash
[ -f ~/.env.zsh ] && . ~/.env.zsh
