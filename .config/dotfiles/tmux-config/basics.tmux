set -g default-terminal "xterm-256color"

# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# set zsh as default shell
set -g default-shell /bin/zsh

setw -g monitor-activity on
set -s escape-time 0

# Enable mouse mode (tmux 2.1 and above)
set -g mouse on
