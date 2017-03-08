#!/bin/bash

cwd=$(pwd)

# install .profile file
ln -s "$cwd/profile" "~/.profile"

# install tmux
ln -s "$cwd/tmux.conf" "~/.tmux.conf"
tmux source-file ~/.tmux.conf # load the tmux config


