if status is-interactive
    # Manual installer drops env.fish; brew install puts atuin on PATH directly
    if test -f "$HOME/.atuin/bin/env.fish"
        source "$HOME/.atuin/bin/env.fish"
    end

    if type -q atuin
        atuin init fish --disable-up-arrow | source
        atuin gen-completions --shell fish | source
    end
end
