# ========================================
# Full Brewfile - Complete Installation
# ========================================
# This is a wrapper that sources all component Brewfiles.
# For selective installation, use the individual files:
#   - .Brewfile.core   : Essential system tools
#   - .Brewfile.extras : Optional tools (media, networking, build)
#   - .Brewfile.vscode : VS Code extensions
#
# Install everything: brew bundle --file=.Brewfile

# Source core packages (shell, git, editor, k8s, cloud)
instance_eval(File.read("#{ENV['HOME']}/.dotfiles/.Brewfile.core"))

# Source extras (media, networking, build tools)
instance_eval(File.read("#{ENV['HOME']}/.dotfiles/.Brewfile.extras"))

# Source VS Code extensions
instance_eval(File.read("#{ENV['HOME']}/.dotfiles/.Brewfile.vscode"))
