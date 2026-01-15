# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

![Screenshot](screenshot.png?raw=true)

## Quick Start (macOS)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/cedi/dotfiles/main/install_macos.sh)
```

This handles everything: Xcode CLI tools, Homebrew, git, cloning the repo, and runs the interactive installer.

Already have the repo cloned?

```bash
cd ~/.dotfiles
./install_macos.sh
```

## What's Included

### Brewfiles

Split into components for flexibility:

| File               | Contents                                  |
| ------------------ | ----------------------------------------- |
| `.Brewfile.core`   | Shell, editor, git, k8s tools, cloud CLIs |
| `.Brewfile.extras` | Media tools, networking, build tools      |
| `.Brewfile.vscode` | VS Code extensions                        |
| `.Brewfile`        | All of the above                          |

### Shell

- **Fish** as primary shell with modular `conf.d/` config
- **Oh My Posh** prompt with custom theme
- **zsh** config also included

### Editor

- **Neovim** with LazyVim

### Tools managed by mise

Language runtimes are handled by [mise](https://mise.jdx.dev/) instead of Homebrew for easier version management:

- Node.js
- Python
- Go
- Rust
- Terraform

Global defaults in `.config/mise/config.toml`, override per-project with `.mise.toml`.

## Install Options

The installer presents a menu:

```
1) Full installation     (recommended for new machines)
2) Core tools only       (shell, git, editor, k8s, cloud)
3) Extras only           (media, networking, build tools)
4) Custom                (choose components)
5) Exit
```

For automation/CI:

```bash
./install_macos.sh --yes
```

## Linux

```bash
cd ~/.dotfiles
./install_linux.sh
stow .
```

## Windows

See [windows/README.md](windows/README.md)

## Structure

```
.dotfiles/
├── .Brewfile*            # Homebrew packages
├── .config/
│   ├── fish/             # Fish shell
│   ├── nvim/             # Neovim (LazyVim)
│   ├── mise/             # Runtime version manager
│   ├── oh-my-posh/       # Prompt themes
│   ├── tmux/             # Terminal multiplexer
│   └── ...
├── fonts/                # FiraCode + Nerd Fonts
├── install_macos.sh      # macOS bootstrap
└── install_linux.sh      # Linux bootstrap
```
