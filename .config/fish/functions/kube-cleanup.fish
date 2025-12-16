function kube-cleanup --description "Delete ReplicaSets with 0 replicas in all namespaces"
    if not type -q kubectl
        echo "kubectl not found"
        return 1
    end

    for ns in (kubectl get ns -o jsonpath='{.items[*].metadata.name}')
        set rs (kubectl get rs -n $ns -o jsonpath='{range .items[?(@.spec.replicas==0)]}{.metadata.name}{"\n"}{end}')

        if test -n "$rs"
            echo "Deleting in $ns:"
            for r in $rs
                kubectl delete rs -n $ns $r
            end
        end
    end
end

