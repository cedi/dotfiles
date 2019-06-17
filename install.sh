#!/bin/bash

localDir=$(pwd)

# install zshrc
ln -s "$localDir/zshrc" "$HOME/.zshrc"

# install tmux.conf
ln -s "$localDir/tmux.conf" "$HOME/.tmux.conf"

# Install gitconfig
ln -s "$localDir/gitconfig" "$HOME/.gitconfig"

# Install ctags config
ln -s "$localDir/ctags" "$HOME/.ctags"

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
