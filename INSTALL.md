# Installation

installing the dotfiles and setting up the environment is different for Windows or Linux/MacOS for obvious reasons 😆

## Prerequisites

* [] Have [git](https://git-scm.com/) installed and available in your `$PATH`

### Clone the Repository

```shell
git clone git@github.com:cedi/dotfiles.git $HOME/.dotfiles
```

### Unix (like)

* [] Have [`stow`](https://www.gnu.org/software/stow/) installed
* [] _(MacOS only)_ Have [`homebrew`](https://brew.sh/) installed

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

```

## Setup Environment

### Setup Unix (like) systems

```shell
cd $HOME.dotfiles/
./install.sh
stow .
```

### Setup Windows systems

> [!NOTE]
> This is very much untested (yet) and might be a bit flaky

```powershell
cd $env:HOME\.dotfiles
.\install.ps1
```
