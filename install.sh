#!/bin/bash

cwd=$(pwd)

# set up git
sh $cwd/git.sh

cd ~ 

# install profile file
ln -s "$cwd/profile" ".profile"

# install tmux.conf
ln -s "$cwd/tmux.conf" ".tmux.conf"
tmux source-file .tmux.conf # load the tmux config

# install gdbinit
ln -s "$cwd/gdbinit" "~/.gdbinit"
