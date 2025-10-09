#!/usr/bin/env bash

set -e

if [[ $(uname -s) != "Darwin" ]]; then
  echo "You are not running macOS. Why are you trying to run this script?"
  exit 1
fi

echo "#########################################################"
echo "# ensure all submodules exist                           #"
echo "#########################################################"

#git submodule update --init --recursive

echo "#########################################################"
echo "# ensure dirs exist                                     #"
echo "#########################################################"

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

echo "* install fzf"
if [ -d "$HOME/.config/fzf/" ]; then
  pushd "$HOME/.config/fzf"
  git pull && "$HOME/.config/fzf/install" --all
  popd
else
  git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.config/fzf" && "$HOME/.config/fzf/install" --all
fi

if [[ ! $(command -v brew) ]]; then
  echo "* Install homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "* install eza neovim ripgrep iproute2mac zsh thefuck sops watch wget ansible navi zoxide tmux git-delta"
brew install eza neovim ripgrep iproute2mac zsh thefuck sops watch wget ansible navi zoxide tmux git-delta bat

echo "* install gnutils"
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep

echo "* install kubernetes tools"
brew install kubectl helm k9s stern hcloud

echo "* Install oh-my-posh"
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-posh

echo "* install language features"
brew install node@20 markdownlint-cli2

echo "* install mise"
curl https://mise.run | sh

echo "install krew"
(
  set -x
  cd "$(mktemp -d)" &&
    OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
    KREW="krew-${OS}_${ARCH}" &&
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
    tar zxvf "${KREW}.tar.gz" &&
    ./"${KREW}" install krew
)

#if [[ ! $(command -v cargo) ]]; then
#  echo "* Install Rust/Cargo"
#  curl https://sh.rustup.rs -sSf | sh
#fi
