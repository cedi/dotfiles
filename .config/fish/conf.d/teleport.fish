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

        case '*'
            # For any other command, just pass it to tsh.
            # `command tsh` ensures we call the actual binary, avoiding alias loops.
            command tsh $argv
    end
end
