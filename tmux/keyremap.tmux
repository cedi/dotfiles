unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

bind -n C-n new-window -a
bind -n S-left  prev
bind -n S-right next
bind -n S-C-left  swap-window -t -1
bind -n S-C-right swap-window -t +1

# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# resize panes
bind-key -n C-M-Up resize-p -U 1
bind-key -n C-M-Down resize-p -D 1
bind-key -n C-M-Right resize-p -R 1
bind-key -n C-M-Left resize-p -L 1

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# switch panes using Alt-arrow without prefix
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D