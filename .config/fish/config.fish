if status is-interactive
    # Commands to run in interactive sessions can go here

    set HOMEBREW_COMMAND_NOT_FOUND_HANDLER (brew --repository)/Library/Homebrew/command-not-found/handler.fish
    if test -f $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
        source $HOMEBREW_COMMAND_NOT_FOUND_HANDLER
    end

end
