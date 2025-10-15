# fuzzy selector for AWS profiles
function _aws_fzf_select
    # Collect profile names
    set -l profiles (aws configure list-profiles)

    # Optionally enrich with account / role info
    set -l rows
    for p in $profiles
        set -l info (aws sts get-caller-identity --profile $p 2>/dev/null | jq -r '"\(.Account) – " + (.Arn | split("/")[-1])' || echo "unauthenticated")
        set -a rows "$p\t$info"
    end

    # Pick one with fzf
    echo $rows | fzf \
        --height=60% \
        --border=rounded \
        --prompt=" AWS ❯ " \
        --pointer="→" \
        --delimiter='\t' \
        --with-nth=1,2 \
        --preview='echo {2}' \
        --preview-window=right:30%:wrap \
        --layout=reverse \
        --info=inline | awk '{print $1}'
end

# fzf‑powered wrapper around aws
function awsx --wraps aws --description "AWS CLI helper with fzf profile picker"
    switch $argv[1]
        case login
            set -l sel (_aws_fzf_select)
            if test -n "$sel"
                echo "Logging in to $sel..."
                command aws sso login --profile $sel
            end

        case switch
            set -l sel (_aws_fzf_select)
            if test -n "$sel"
                set -gx AWS_PROFILE $sel
                echo "Switched to AWS_PROFILE=$AWS_PROFILE"
            end

        case '*'
            # delegate everything else straight to aws
            command aws $argv
    end
end

function aws --wraps aws --description "AWS CLI with SSO --all support"
    if test (count $argv) -gt 0 -a "$argv[1]" = "sso" -a (count $argv) -ge 3 -a "$argv[2]" = "login" -a "$argv[3]" = "--all"
        echo "• Logging in to all AWS profiles..."
        for profile in (aws configure list-profiles)
            echo "→ Logging in: $profile"
            command aws sso login --profile $profile
        end
        echo "✓ All profiles logged in."
    else
        command aws $argv
    end
end

