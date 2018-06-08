#!/bin/bash

localDir=$(pwd)

# install zshrc
ln -s "$localDir/zshrc" "$HOME/.zshrc"

# install profile file
ln -s "$localDir/profile" "$HOME/.profile"

# install tmux.conf
ln -s "$localDir/tmux.conf" "$HOME/.tmux.conf"

# install gdbinit
ln -s "$localDir/gdbinit" "$HOME/.gdbinit"

# install quiltrc
ln -s "$localDir/quiltrc" "$HOME/.quiltrc"

# Install gitconfig
ln -s "$localDir/gitconfig" "$HOME/.gitconfig"

# Install ctags config
ln -s "$localDir/ctags" "$HOME/.ctags"

