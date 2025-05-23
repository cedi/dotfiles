#!/usr/bin/env bash

set -e

if [[ $(uname -s) == "Darwin" ]]; then
  echo "You are running macOS. Why are you trying to run this script?"
  exit 1
fi

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
  mkdir -p "$HOME/.config"
fi

echo "#########################################################"
echo "# Install Software                                      #"
echo "#########################################################"

echo "* Install fzf"
if [ -d "$HOME/.config/fzf/" ]; then
  pushd "$HOME/.config/fzf"
  git pull && "$HOME/.config/fzf/install" --bin
  popd
else
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.config/fzf" && "$HOME/.config/fzf/install" --bin
fi

echo "* install tfswitch"
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

echo "* update apt"
sudo apt update && sudo apt upgrade -y

echo "* install requirements for further stuff"
sudo apt install -y gpg

echo "* install eza"
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

echo "* apt install python3 python3-pip neovim ripgrep zsh tmux stow bat"
sudo apt install -y python3 python3-pip neovim ripgrep zsh tmux stow bat

echo "* install zoxide"
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
echo "* Install node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20

if [[ ! $(command -v go) ]]; then
  echo "* Install GoLang"
  sudo ./update-golang/update-golang.sh
elif [[ ! ($(go version | awk '{print $3}') =~ go1.22.*) ]]; then
  echo "* updating GoLang"
  sudo ./update-golang/update-golang.sh
else
  echo "* GoLang installed & up to date"
fi

if [[ ! $(command -v cargo) ]]; then
  echo "* Install Rust/Cargo"
  curl https://sh.rustup.rs -sSf | sh
fi

if [ -f /etc/debian_version ]; then
  if [[ ! $(command -v kubectl) ]]; then
    echo "* Install kubectl"

    echo "** download kubectl"
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

    echo "** mark executable"
    chmod +x ./kubectl

    echo "** move to /usr/local/bin"
    sudo mv ./kubectl /usr/local/bin/kubectl
  else
    echo "* kubectl already installed"
  fi
fi

echo "* Install oh-my-posh"
aarch="amd64"
case $(uname -m) in
"x86_64") aarch="amd64" ;;
"aarch64") aarch="arm64" ;;
esac

sudo wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-$aarch" -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "* Install hcloud completion"
if [[ $(command -v hcloud) ]]; then
  mkdir -p ~/.config/hcloud/completion/zsh
  hcloud completion zsh >~/.config/hcloud/completion/zsh/_hcloud
fi

echo "* Install and setup tailscale"
curl -fsSL https://tailscale.com/install.sh | sh

tailscale up --ssh

