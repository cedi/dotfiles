# Lazy stub: `ts-k8s-auth generate integration fish` takes ~300ms, so it only
# runs on first use. Sourcing its output redefines `tka`, replacing this stub.
function tka --description "ts-k8s-auth shell integration (lazy)"
    if not type -q ts-k8s-auth
        echo "tka: ts-k8s-auth not found in PATH" >&2
        return 127
    end
    ts-k8s-auth generate integration fish | source
    tka $argv
end
