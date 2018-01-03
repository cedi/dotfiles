# Dotfiles

.files, e.g. zshrc, tmux.conf, ...

## Screenshot
![Screenshot](screenshot.png?raw=true)

## Installation

I'd highly recommended to fork the repository prior to cloning, especially if you intend to ajdust the files.

    $ git clone git@github.com:cedi/dotfiles.git ${HOME}/.config/dotfiles

### ZSH Installation

The provided `.zshrc` is making use of Oh My ZSH by Robby Russell thus follow the *Basic Installation* instructions [here](https://github.com/robbyrussell/oh-my-zsh).

After that create a symlink to the provided `.zshrc`

	$ ln -s ${HOME}/.config/dotfiles/oh-my-zsh/zshrc ${HOME}/.zshrc

### BASH Installation

The provided `.bashrc` is making use of a few Bash v4.x features, but will also work on bash version prior to that.

	$ ln -s ${HOME}/.config/dotfiles/bash/bashrc ${HOME}/.bashrc


### VIM Installation

For installing and configuring vim, please have a look at my dedicated vim repository here on [github](https://github.com/cedi/-vim).
