#!/usr/bin/env bash

set -e

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

	if [[ ! $(command -v brew) ]]; then
		echo "* Install homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

    echo "* brew install eza python3 neovim neovim-remote tfswitch ripgrep iproute2mac zsh thefuck sops watch wget ansible navi zoxide tmux git-delta"
    brew install eza python3 neovim neovim-remote tfswitch ripgrep iproute2mac zsh thefuck sops watch wget ansible navi zoxide tmux git-delta

    echo "* install gnutils"
    brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep

	echo "* install kubernetes tools"
	brew install kubectl helm k9s stern hcloud

	echo "install krew"
	(
	  set -x; cd "$(mktemp -d)" &&
	  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
	  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
	  KREW="krew-${OS}_${ARCH}" &&
	  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
	  tar zxvf "${KREW}.tar.gz" &&
	  ./"${KREW}" install krew
	)

elif [ -f /etc/debian_version ]; then
    echo "* install tfswitch"
    curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

    echo "* apt install eza python3 python3-pip neovim ripgrep zsh tmux"
    sudo apt install -y eza python3 python3-pip neovim ripgrep zsh tmux

    echo "* install neovim-remote"
    pip3 install neovim-remote

    echo "* install zoxide"
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

if [[ ! $(command -v go) ]]; then
    echo "* Install GoLang"
    sudo ./update-golang/update-golang.sh
elif [[ ! ($(go version | awk '{print $3}') =~ go1.22.*) ]]; then
    echo "* updating GoLang"
    sudo ./update-golang/update-golang.sh
else
    echo "* GoLang installed & up to date"
fi

if [ -f /etc/debian_version ]; then
	if [[ ! $(command -v kubectl) ]]; then
	    echo "* Install kubectl"

	    echo "** download kubectl"
	    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

	    echo "** mark executable"
	    chmod +x ./kubectl

	    echo "** move to /usr/local/bin"
	    sudo mv ./kubectl /usr/local/bin/kubectl
	else
	    echo "* kubectl already installed"
	fi
fi

if [[ $(command -v zsh) ]]; then
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

echo "* Install hcloud completion"
if [[ $(command -v hcloud) ]]; then
    mkdir -p ~/.config/hcloud/completion/zsh
    hcloud completion zsh > ~/.config/hcloud/completion/zsh/_hcloud


fi
