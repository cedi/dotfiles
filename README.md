# Dotfiles

This repository contains my dotfiles, ready to be used with [gnu-stow](https://www.gnu.org/software/stow/manual/stow.html)

## Screenshot
![Screenshot](screenshot.png?raw=true)

## Dependencies

### macOS

have homebrew and git installed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

## Installation

I'd highly recommended to fork the repository prior to cloning, especially if you intend to ajdust the files.

```bash
git clone git@github.com:cedi/dotfiles.git $HOME/.dotfiles
cd .dotfiles/install.sh
stow .
```

### install.sh script

The install script installs some basic dependencies that I want on my machine.
