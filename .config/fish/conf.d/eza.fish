if type -q eza
    if eza --git &> /dev/null
        alias ls='eza --git --icons --group-directories-first'
    else
        alias ls='eza --icons --group-directories-first'
    end
    alias la='ls --all'
    alias ll='ls --long --time-style=long-iso --time=modified'
    alias lla='ll --all'

    set -x EZA_COLORS "uu=36:\
uR=31:\
un=35:\
gu=37:\
da=2;34:\
ur=34:\
uw=95:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:\
xx=95:"
else
    alias ls='ls --color=always'
    alias ll='ls -ltr'
    alias lla='ll -a'
end