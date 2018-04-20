# Dotfiles

.files, e.g. zshrc, tmux.conf, aliases, ...

## Screenshot
![Screenshot](screenshot.png?raw=true)


## Dependencies
1. Rust installed

```
$ curl https://sh.rustup.rs -sSf | sh
```

2. exa installed

```
$ cargo install exa
```

3. zsh installed
4. [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

5. python3 installed
5.1 pip3 installed

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
