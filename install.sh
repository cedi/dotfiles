#!/bin/bash

cwd=$(pwd)

# install .profile file
ln -s "$cwd/profile" "~/.profile"

# set up git
sh $cwd/git.sh

# install tmux
ln -s "$cwd/tmux.conf" "~/.tmux.conf"
tmux source-file ~/.tmux.conf # load the tmux config

