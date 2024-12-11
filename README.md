# Dotfiles

This repository contains my dotfiles, ready to be used with [gnu-stow](https://www.gnu.org/software/stow/manual/stow.html)

## Screenshot

![Screenshot](screenshot.png?raw=true)

## Installation

installing the dotfiles and setting up the environment is different for Windows or Linux/MacOS for obvious reasons 😆

### Prerequisites

* [] Have [git](https://git-scm.com/) installed and available in your `$PATH`
* [] Clone this repository (`git clone git@github.com:cedi/dotfiles.git $HOME/.dotfiles`)
* [] _(Unix* only)_ Have [`stow`](https://www.gnu.org/software/stow/) installed

### macOS

```shell
cd $HOME.dotfiles/
./install_macos.sh
stow .
```

### Linux

```shell
cd $HOME.dotfiles/
./install_linux.sh
stow .
```

### Setup Windows systems

> [!NOTE]
> This is very much untested (yet) and might be a bit flaky

```powershell
cd $env:HOME\.dotfiles\windows
.\install.ps2
```

See more about the Windows setup [here](windows/README.md)
