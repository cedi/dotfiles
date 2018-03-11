#!/bin/bash

# install zshrc
ln -s "$HOME/.config/dotfiles/zshrc" "$HOME/.zshrc"

# install profile file
ln -s "$HOME/.config/dotfiles/profile" "$HOME/.profile"

# install tmux.conf
ln -s "$HOME/.config/dotfiles/tmux.conf" "$HOME/.tmux.conf"
tmux source-file .tmux.conf # load the tmux config

# install gdbinit
ln -s "$HOME/.config/dotfiles/gdbinit" "$HOME/.gdbinit"

# install quiltrc
ln -s "$HOME/.config/dotfiles/quiltrc" "$HOME/.quiltrc"

# Install git defaults
sh "$HOME/.config/dotfiles/git.sh"

# Install gitish
ln -s "$HOME/.config/dotfiles/gitconfig" "$HOME/.gitconfig"
