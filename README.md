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
$ cd $HOME/src
$ git clone https://github.com/ogham/exa.git
$ cd exa
$ make
$ sudo ln -s $HOME/src/exa/target/release/exa /usr/local/bin/exa
```
## Installation

I'd highly recommended to fork the repository prior to cloning, especially if you intend to ajdust the files.
```
$ git clone git@github.com:cedi/dotfiles.git ${HOME}/.config/dotfiles
$ cd ${HOME}/.config/dotfiles
$ sh install.sh
```

### VIM Installation

For installing and configuring vim, please have a look at my dedicated vim repository here on [github](https://github.com/cedi/-vim).
