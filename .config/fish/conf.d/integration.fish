# --- zoxide (cd alternative) ---
if type -q zoxide
    zoxide init --cmd cd fish | source
end

# --- navi integration ---
if type -q navi
    navi widget fish | source
end

# --- ts-k8s-auth integration ---
if type -q ts-k8s-auth
    ts-k8s-auth generate integration fish | source
    ts-k8s-auth completion fish | source
end
