source "$HOME/.atuin/bin/env.fish"

atuin init fish --disable-up-arrow | source
atuin gen-completions --shell fish | source
