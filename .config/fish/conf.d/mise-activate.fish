# Named to shadow Homebrew's vendor_conf.d/mise-activate.fish, so mise activates once.
if type -q mise
    mise activate fish | source # added by https://mise.run/fish
end
