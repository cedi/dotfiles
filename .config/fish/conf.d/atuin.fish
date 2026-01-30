if status is-interactive
    if type -q atuin
        source "$HOME/.atuin/bin/env.fish"

        atuin init fish --disable-up-arrow | source
        atuin gen-completions --shell fish | source
    end
end
