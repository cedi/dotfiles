if type -q eza
    if eza --git &> /dev/null
        alias ls='eza --git --icons --group-directories-first'
    else
        alias ls='eza --icons --group-directories-first'
    end
    alias la='ls --all'
    alias ll='ls --long --time-style=long-iso --time=modified'
    alias lla='ll --all'
else
    alias ls='ls --color=always'
    alias ll='ls -ltr'
    alias lla='ll -a'
end