if command -q tsh; and command -q fzf
    function tsh-db-ls
        tsh db ls --format=json \
        | jq -r '
          .[]
          | {
              name: .metadata.name,
              json: .,
              labels: (
                .metadata.labels
                | to_entries
                | map(select(.key | test("^(aws|teleport)")==false))
                | map("\(.key)=\(.value)")
                | join(",")
              )
            }
          | "\(.name)\t\t\t\(.labels)\t\(.json | @json)"
        ' \
        | fzf \
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
          --with-nth=1,2 \
          --preview='echo {3} | jq . | bat --language=json --paging=never --color=always -n' \
          --no-hscroll \
        | awk '{print $1}'
    end

    function tsh-kube-ls
        tsh kube ls --format=json \
        | jq -r '
          .[]
          | {
              name: .kube_cluster_name,
              json: .,
              labels: (
                .labels
                | to_entries
                | map(select(.key | test("^(aws|teleport|TeleportKubernetesName)")==false))
                | map("\(.key)=\(.value)")
                | join(",")
              )
            }
          | "\(.name)\t\t\t\(.labels)\t\(.json | @json)"
        ' \
        | fzf \
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
          --with-nth=1,2 \
          --preview='echo {3} | jq . | bat --language=json --paging=never --color=always -n' \
          --no-hscroll \
        | awk '{print $1}'
    end

    function tsh-ls
        tsh ls --format=json \
        | jq -r '
          .[]
          | {
              name: .spec.hostname,
              json: .,
              labels: (
                .metadata.labels
                | to_entries
                | map(select(.key | test("^(aws|teleport|Name)")==false))
                | map("\(.key)=\(.value)")
                | join(",")
              )
            }
          | "\(.name)\t\t\t\(.labels)\t\(.json | @json)"
        ' \
        | fzf \
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
          --with-nth=1,2 \
          --preview='echo {3} | jq . | bat --language=json --paging=never --color=always -n' \
          --no-hscroll \
        | awk '{print $1}'
    end

    alias kube-login 'tsh kube login (tsh-kube-ls)'
    alias dbproxy 'tsh proxy db --tunnel (tsh-db-ls)'
    alias tssh 'tsh ssh (tsh-ls)'
end
