# helper function to list, format, and select Teleport resources.
#
# Arguments:
# name_path    The jq path to the resource's name (e.g., '.metadata.name').
# labels_path: The jq path to the resource's labels object (e.g., '.metadata.labels').
# command      The `tsh` command to execute (e.g., 'tsh db ls --format=json').
function _tsh_fzf_select
    set -l name_path $argv[1]
    set -l labels_path $argv[2]
    set -l cmd $argv[3..-1]

    # reusable jq template. We'll inject the correct paths into it.
    set -l jq_template '
      [
        .[] | {
          name: (##NAME_PATH##),
          labels: (
            (##LABELS_PATH##)
            | to_entries
            | map("\(.key)=\(.value | gsub(" "; ""))")
            | join(",")
          ),
          json: .
        }
      ]
      | . as $items
      | (map(.name | length) | max) as $max_len
      | "                                                                                " as $spaces
      | $items[]
      | "\(.name)\($spaces[0:($max_len + 4 - (.name | length))])\(.labels)\t\(.json | @json)"
    '

    # Substitute the placeholders with the actual paths provided as arguments.
    set -l final_jq_filter (string replace '##NAME_PATH##' "$name_path" -- (string replace '##LABELS_PATH##' "$labels_path" -- $jq_template))

    # fzf options for the fuzzy picker
    set -l fzf_opts \
        --height=60% \
        --border=rounded \
        --preview-window=right:33%:border-rounded:wrap \
        --prompt=" ❯ " \
        --marker="*" \
        --pointer="→" \
        --separator="─" \
        --scrollbar="│" \
        --layout=reverse \
        --info=inline \
        --cycle \
        --keep-right \
        --bind=btab:up,tab:down \
        --tabstop=1 \
        --delimiter='\t' \
        --with-nth=1 \
        --preview='echo {2} | yq -P | bat --language=yaml --paging=never --color=always -n' \
        --no-hscroll

    # no run the pipeline
    $cmd | jq -r "$final_jq_filter" | fzf $fzf_opts | awk '{print $1}'
end

# @description Print the environment of the Kubernetes cluster in the current context.
function _tsh_kube-environment
    set -l context_details (kubectl config view --minify --output=json 2>/dev/null | jq --exit-status --raw-output \
        '.["current-context"], ((.contexts[0].context.extensions // [] | map(select(.name == "teleport.kube.name")))[0].extension // empty)')
    if test $status -ne 0; or test -z "$context_details[1]"
        echo "Error: no current Kubernetes context is set" >&2
        return 1
    end

    # Teleport stores the Kubernetes resource name in this context extension.
    set -l context $context_details[1]
    set -l cluster $context_details[2]
    if test -z "$cluster"
        echo "Error: current Kubernetes context '$context' is not managed by Teleport" >&2
        return 1
    end

    for cached in $__kube_environment_cache
        set -l entry (string split --max=1 = "$cached")
        if test "$entry[1]" = "$cluster"
            echo $entry[2]
            return
        end
    end

    set -l environment (tsh kube ls --format=json --search="$cluster" | jq --exit-status --raw-output \
        --arg cluster "$cluster" \
        'map(select(.kube_cluster_name == $cluster))[0].labels.environment // empty')
    if test $status -ne 0; or test -z "$environment"
        echo "Error: no Teleport environment label found for cluster '$cluster'" >&2
        return 1
    end

    set --universal --append __kube_environment_cache "$cluster=$environment"
    echo $environment
end

# @description Wrapper for tsh that provides fzf-powered 'ls' commands.
function tshx --wraps tsh
    # We check the arguments passed to the function to decide what to do.
    switch (string join " " -- $argv)
        # fzf-powered cases
        case "kube ls"
            _tsh_fzf_select '.kube_cluster_name' '.labels' tsh kube ls --format=json

        case "kube login"
            set -l selection (_tsh_fzf_select '.kube_cluster_name' '.labels' tsh kube ls --format=json)
            if test -n "$selection"
                command tsh kube login $selection
            end
        case "db ls"
            _tsh_fzf_select '.metadata.name' '.metadata.labels' tsh db ls --format=json

        case "db proxy"
            set -l selection (_tsh_fzf_select '.metadata.name' '.metadata.labels' tsh db ls --format=json)
            if test -n "$selection"
                command tsh proxy db --tunnel $selection
            end

        case ls
            _tsh_fzf_select '.spec.hostname' '.metadata.labels' tsh ls --format=json

        case ssh
            set -l selection (_tsh_fzf_select '.spec.hostname' '.metadata.labels' tsh ls --format=json)
            if test -n "$selection"
                command tsh ssh $selection
            end

        case "kube env"
            _tsh_kube-environment

        case '*'
            # For any other command, just pass it to tsh.
            # `command tsh` ensures we call the actual binary, avoiding alias loops.
            command tsh $argv
    end
end
