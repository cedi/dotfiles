# Resolve the mise binary once — works whether installed via Homebrew or mise's own installer
if command -q mise
    set -g __mise_bin (command -s mise)
else if test -x /opt/homebrew/bin/mise
    set -g __mise_bin /opt/homebrew/bin/mise
else if test -x $HOME/.local/bin/mise
    set -g __mise_bin $HOME/.local/bin/mise
else
    # mise not found, nothing to do
    return
end

set -gx MISE_SHELL fish
set -gx __MISE_ORIG_PATH $PATH

function mise
    if test (count $argv) -eq 0
        command $__mise_bin
        return
    end

    set command $argv[1]
    set -e argv[1]

    if contains -- --help $argv
        command $__mise_bin "$command" $argv
        return $status
    end

    switch "$command"
        case deactivate shell sh
            # if help is requested, don't eval
            if contains -- -h $argv
                command $__mise_bin "$command" $argv
            else if contains -- --help $argv
                command $__mise_bin "$command" $argv
            else
                source (command $__mise_bin "$command" $argv | psub)
            end
        case '*'
            command $__mise_bin "$command" $argv
    end
end

function __mise_env_eval --on-event fish_prompt --description 'Update mise environment when changing directories'
    $__mise_bin hook-env -s fish | source

    if test "$mise_fish_mode" != disable_arrow
        function __mise_cd_hook --on-variable PWD --description 'Update mise environment when changing directories'
            if test "$mise_fish_mode" = eval_after_arrow
                set -g __mise_env_again 0
            else
                $__mise_bin hook-env -s fish | source
            end
        end
    end
end

function __mise_env_eval_2 --on-event fish_preexec --description 'Update mise environment when changing directories'
    if set -q __mise_env_again
        set -e __mise_env_again
        $__mise_bin hook-env -s fish | source
        echo
    end

    functions --erase __mise_cd_hook
end

__mise_env_eval
if functions -q fish_command_not_found; and not functions -q __mise_fish_command_not_found
    functions -e __mise_fish_command_not_found
    functions -c fish_command_not_found __mise_fish_command_not_found
end

function fish_command_not_found
    if string match -qrv -- '^(?:mise$|mise-)' $argv[1] &&
            $__mise_bin hook-not-found -s fish -- $argv[1]
        $__mise_bin hook-env -s fish | source
    else if functions -q __mise_fish_command_not_found
        __mise_fish_command_not_found $argv
    else
        __fish_default_command_not_found_handler $argv
    end
end
