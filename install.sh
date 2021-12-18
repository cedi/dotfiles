#!/usr/bin/env bash

localDir=$(pwd)

echo "#########################################################"
echo "# ensure all submodules exist                           #"
echo "#########################################################"

git submodule update --init --recursive

echo "#########################################################"
echo "# ensure dirs exist                                     #"
echo "#########################################################"

echo "* test if \$HOME is defined"

if [ ! -d "$HOME" ]; then
    echo "ERROR: \$HOME is not set!"
    exit 1
fi

if [ ! -d "$HOME/.config" ]; then
    mkdir -p $HOME/.config
fi


echo "#########################################################"
echo "# linking dotfiles                                      #"
echo "#########################################################"

echo "* install zshrc"

if [ -f "$HOME/.zshrc" ]; then
    rm $HOME/.zshrc
fi
ln -s "$localDir/zshrc" "$HOME/.zshrc"

echo "* install p10k theme"

if [ -f "$HOME/.p10k.zsh" ]; then
    rm $HOME/.p10k.zsh
fi

if [[ $(uname -s) == "Darwin" ]]; then
    ln -s "$localDir/p10k.macos.zsh" "$HOME/.p10k.zsh"
else
    ln -s "$localDir/p10k.noicon.zsh" "$HOME/.p10k.zsh"
fi

echo "* install tmux.conf"

if [ -f "$HOME/.tmux.conf" ]; then
    rm $HOME/.tmux.conf
fi
ln -s "$localDir/tmux.conf" "$HOME/.tmux.conf"

echo "* install gitconfig"

if [ -f "$HOME/.gitconfig" ]; then
    rm $HOME/.gitconfig
fi
ln -s "$localDir/gitconfig" "$HOME/.gitconfig"

echo "* install nvim config"

if [ -d "$HOME/.config/nvim" ]; then
    rm -rf $HOME/.config/nvim
fi

ln -s "$localDir/nvim" "$HOME/.config/nvim"

echo "#########################################################"
echo "# Install Software                                      #"
echo "#########################################################"

echo "* Install fzf"
if [ -d "$HOME/.config/fzf/" ]; then
    rm -rf $HOME/.config/fzf
fi
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.config/fzf && $HOME/.config/fzf/install --bin

if [[ $(uname -s) == "Darwin" ]]; then
    echo "[Installing macOS related stuff]"
    echo "* brew install exa python3 neovim neovim-remote tfswitch kubectl helm ripgrep iproute2mac"
    brew install exa python3 neovim neovim-remote tfswitch kubectl helm ripgrep iproute2mac

    echo "* install gnutils"
    brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
elif [ -f /etc/debian_version ]; then
    echo "* install tfswitch"
    curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

    echo "* apt install exa python3 python3-pip neovim kubectl ripgrep"
    sudo apt install -y exa python3 python3-pip neovim kubectl ripgrep

    echo "* install neovim-remote"
    pip3 install neovim-remote
fi

echo "* Install GoLang"
sudo RELEASE=1.18beta1 ./update-golang/update-golang.sh