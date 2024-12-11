# Windows dotfiles

This is my collection of PowerShell config (dotfiles) for Windows.

## Installation

```pwsh
.\install.ps1
```

## PowerShell Profile

The PowerShell profile is loading individual config components from the [`.config`](.config/) directory:

* `base`: Configures basic but necessary stuff, like using the right namespaces, enabling utf-8 by default, ...
* `functions`: Custom PowerShell functions used throuought the dotfiles
* `aliases`: Configure custom aliases
* `editor`: Configure the default editor to use
* `psreadline`: Configure PSReadline for nicer terminal experience
* `fzf`: Configure [fzf] and [PSFzf]
* `oh-my-posh`: Load my [oh-my-posh] custom prompt
* `zoxide`: Configure and set-up PowerShell to use [zoxide] instead of `cd`
* `completions`: Make auto-completion a bit nicer

## PowerShell DSC

To make the best out of the terminal, PowerShell DSC is used via [winget configuration] to install various tools and configure them appropriately.

[winget configuration]: https://learn.microsoft.com/en-us/windows/package-manager/configuration/
[zoxide]: https://github.com/ajeetdsouza/zoxide
[oh-my-posh]: https://ohmyposh.dev/
[fzf]: https://github.com/junegunn/fzf
[PSFzf]: https://github.com/kelleyma49/PSFzf
