set nvim_remote_socket_path /tmp/nvim.socket

# normal nvim always opens a new window, but the first time we open nvim, we open one with a server
function nvim --wraps nvim --description "nvim with remote"
    if test -e $nvim_remote_socket_path
        command nvim $argv
    else
        command nvim --listen $nvim_remote_socket_path $argv
    end
end

function rvim --wraps nvim --description "nvim with remote"

    if test -e $nvim_remote_socket_path
        command nvim --server $nvim_remote_socket_path --remote $argv
    else
        command nvim --listen $nvim_remote_socket_path $argv
    end
end

function rvim-cleanup --description "remove nvim socket for rvim to function properly again"
    set -l force_delete false

    # Check for a --force flag and remove it from the argument list
    if contains -- --force $argv
        set -l force_delete true
        set -l argv (string match --invert --regex -- --force $argv)
    end

    # Check if the socket file exists
    if test -e $nvim_remote_socket_path
        # A process is using the socket if pgrep finds a matching process
        if pgrep -f "nvim --listen $nvim_remote_socket_path" >/dev/null
            echo "[!]  The nvim socket is currently in use."
            if $force_delete
                echo "  However, --force was passed. Deleting..."
                rm $nvim_remote_socket_path
            else
                echo "[OK] rvim should be able to connect. If not, re-run with --force"
            end
        else
            # No process found, so the socket is stale.
            echo "[-]  Found stale nvim socket - deleting"
            rm $nvim_remote_socket_path
        end
    else
        echo "[-]  No nvim socket found at $nvim_remote_socket_path."
    end
end
