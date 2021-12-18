# Dotfiles

.files, e.g. zshrc, tmux.conf, aliases, ...

## Screenshot
![Screenshot](screenshot.png?raw=true)


## Dependencies

### macOS

have homebrew and git installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

6. python3 installed
6.1 pip3 installed

## Installation

I'd highly recommended to fork the repository prior to cloning, especially if you intend to ajdust the files.

```
$ git clone git@github.com:cedi/dotfiles.git ${HOME}/.config/dotfiles
# remove the .zshrc (is autocreated from oh-my-zsh installation)
$ .zshrc
$ cd ${HOME}/.config/dotfiles
$ sh install.sh
```

## Post-Installation
install zsh-syntax-highlighting

## VIM Installation

For installing and configuring vim, please have a look at my dedicated vim repository here on [github](https://github.com/cedi/-vim).

## macOS Specialityies

Install gnu-utils

```
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
```
