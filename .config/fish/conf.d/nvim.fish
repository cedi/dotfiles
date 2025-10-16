function rvim --wraps nvim --description "nvim with remote"
    set -l socket_path /tmp/nvim.socket

    if test -e $socket_path
        command nvim --server $socket_path --remote $argv
    else
        command nvim --listen $socket_path $argv
    end
end

function rvim-cleanup --description "remove nvim socket for rvim to function properly again"
    set -l force_delete false
    set -l socket_path /tmp/nvim.socket

    # Check for a --force flag and remove it from the argument list
    if contains -- --force $argv
        set -l force_delete true
        set -l argv (string match --invert --regex -- --force $argv)
    end

    # Check if the socket file exists
    if test -e $socket_path
        # A process is using the socket if pgrep finds a matching process
        if pgrep -f "nvim --listen $socket_path" >/dev/null
            echo "[!]  The nvim socket is currently in use."
            if $force_delete
                echo "  However, --force was passed. Deleting..."
                rm $socket_path
            else
                echo "[OK] rvim should be able to connect. If not, re-run with --force"
            end
        else
            # No process found, so the socket is stale.
            echo "[-]  Found stale nvim socket - deleting"
            rm $socket_path
        end
    else
        echo "[-]  No nvim socket found at $socket_path."
    end
end
