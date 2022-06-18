#!/usr/bin/env bash

set -e -x

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
echo "# Install Software                                      #"
echo "#########################################################"

echo "* Install fzf"
if [ -d "$HOME/.config/fzf/" ]; then
    pushd $HOME/.config/fzf
    git pull 
    popd
else
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.config/fzf && $HOME/.config/fzf/install --bin
fi

if [[ $(uname -s) == "Darwin" ]]; then
    echo "[Installing macOS related stuff]"
    echo "* brew install exa python3 neovim neovim-remote tfswitch kubectl helm ripgrep iproute2mac zsh"
    brew install exa python3 neovim neovim-remote tfswitch kubectl helm ripgrep iproute2mac zsh

    echo "* install gnutils"
    brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
elif [ -f /etc/debian_version ]; then
    echo "* install tfswitch"
    curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

    echo "* apt install exa python3 python3-pip neovim kubectl ripgrep zsh"
    sudo apt install -y exa python3 python3-pip neovim kubectl ripgrep zsh

    echo "* install neovim-remote"
    pip3 install neovim-remote
fi

if [[ ! $(command -v zsh) ]]; then
    echo "* Install GoLang"
    sudo ./update-golang/update-golang.sh
elif [[ $(go version | awk '{print $3}') != "go1.18.3" ]]; then
    echo "* updating GoLang"
    sudo ./update-golang/update-golang.sh
fi

if [ $(command -v zsh) ]; then
    if [ ! -d $HOME/.oh-my-zsh ]; then
        echo "* install oh-my-zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
fi

echo "* Install oh-my-posh"
if [[ $(uname -s) == "Darwin" ]]; then
    brew tap jandedobbeleer/oh-my-posh
    brew install oh-my-posh
else
    aarch="amd64"
    case $(uname -m) in
        "x86_64") aarch="amd64" ;;
        "aarch64") aarch="arm64" ;;
    esac

    sudo wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-$aarch" -O /usr/local/bin/oh-my-posh
    sudo chmod +x /usr/local/bin/oh-my-posh
fi

echo "#########################################################"
echo "# linking dotfiles                                      #"
echo "#########################################################"

if [ $(command -v zsh) ]; then
    echo "* install zshrc"

    if [ -f "$HOME/.zshrc" ]; then
        rm $HOME/.zshrc
    fi
    ln -s "$localDir/zshrc" "$HOME/.zshrc"
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
