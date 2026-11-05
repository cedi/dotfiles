# Sorts after mise-activate.fish on purpose: by now mise has put the real zoxide
# on PATH. Before that, `zoxide` is a mise shim and every call costs ~450ms.
if type -q zoxide
    zoxide init --cmd cd fish | source
end
