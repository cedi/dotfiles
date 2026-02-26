if type -q kubectl
    abbr -a k kubectl
    abbr -a kg 'kubectl get'
    abbr -a kgp 'kubectl get pods'
    abbr -a kgs 'kubectl get svc'

    abbr -a kga 'kubectl get all --all-namespaces'
    abbr -a kgap 'kubectl get pods --all-namespaces'
    abbr -a kgas 'kubectl get svc --all-namespaces'

    abbr -a kd 'kubectl describe'
    abbr -a kdp 'kubectl describe pod'
    abbr -a kds 'kubectl describe svc'

    abbr -a kl 'kubectl logs'

    abbr -a kx 'kubectl exec -it'
    abbr -a kxf 'kubectl exec -it -- /bin/sh'
    abbr -a kxc 'kubectl exec -it --container'

    abbr -a kgctx 'kubectl config get-contexts'
    abbr -a kgcl 'kubectl config get-clusters'
    abbr -a kns 'kubectl config set-context --current --namespace'
    abbr -a kctx 'kubectl config use-context'

    abbr -a kpf 'kubectl port-forward'
    abbr -a kdel 'kubectl delete'
    abbr -a kdelp 'kubectl delete pod'
    abbr -a kdes 'kubectl delete svc'
    abbr -a kdelns 'kubectl delete namespace'

    abbr -a ka 'kubectl apply -f'
    abbr -a kscale 'kubectl scale --replicas'
    abbr -a kscaledeploy 'kubectl scale deployment'
    abbr -a kroll 'kubectl rollout deployment'
    abbr -a ktop 'kubectl top'
    abbr -a kedit 'kubectl edit'
end

if type -q kubeval
    abbr -a kubeval 'kubeval --schema-location https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/ --ignore-missing-schemas --strict'
end

if type -q operator-sdk
    operator-sdk completion fish | source
end
