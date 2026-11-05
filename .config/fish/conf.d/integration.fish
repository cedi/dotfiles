# --- navi integration ---
if type -q navi
    navi widget fish | source
end

# zoxide lives in zoxide.fish: it must load after mise-activate.fish so `zoxide`
# resolves to the real binary instead of the (slow) mise shim.
# ts-k8s-auth's `tka` function is lazy-loaded from functions/tka.fish.
