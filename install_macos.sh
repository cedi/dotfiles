#!/usr/bin/env bash
# ========================================
# macOS Dotfiles Bootstrap Script
# ========================================
# One-liner for fresh Mac:
#   bash <(curl -fsSL https://raw.githubusercontent.com/cedi/dotfiles/main/install_macos.sh)
#
# Features:
#   - Self-bootstrapping: installs Xcode CLI tools, Homebrew, git, clones repo
#   - Interactive menu for component selection
#   - Smart detection: skips already-installed tools
#   - Idempotent: safe to run multiple times
#   - Non-interactive mode: ./install_macos.sh --yes

set -e

# ═══════════════════════════════════════════════════════════════
# Configuration
# ═══════════════════════════════════════════════════════════════

GITHUB_REPO="cedi/dotfiles"
DOTFILES_DIR="${HOME}/.dotfiles"
AUTO_YES=false

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# ═══════════════════════════════════════════════════════════════
# Parse Arguments
# ═══════════════════════════════════════════════════════════════

while [[ $# -gt 0 ]]; do
  case $1 in
    -y|--yes) AUTO_YES=true; shift ;;
    -h|--help)
      echo "Usage: $0 [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  -y, --yes    Non-interactive mode (full installation)"
      echo "  -h, --help   Show this help message"
      exit 0
      ;;
    *) shift ;;
  esac
done

# ═══════════════════════════════════════════════════════════════
# Helper Functions
# ═══════════════════════════════════════════════════════════════

print_header() {
  echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}$1${NC}"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_status() {
  local status=$1
  local message=$2
  case $status in
    "ok")      echo -e "  ${GREEN}✓${NC} $message" ;;
    "skip")    echo -e "  ${YELLOW}○${NC} $message ${YELLOW}(already installed)${NC}" ;;
    "install") echo -e "  ${BLUE}→${NC} $message" ;;
    "error")   echo -e "  ${RED}✗${NC} $message" ;;
  esac
}

is_installed() {
  command -v "$1" &> /dev/null
}

confirm() {
  if $AUTO_YES; then return 0; fi
  local prompt="$1 [Y/n] "
  read -r -p "$prompt" response
  [[ -z "$response" || "$response" =~ ^[Yy]$ ]]
}

# ═══════════════════════════════════════════════════════════════
# Bootstrap (for fresh machines)
# ═══════════════════════════════════════════════════════════════

bootstrap_dotfiles() {
  # If dotfiles already exist, pull latest updates
  if [[ -d "$DOTFILES_DIR" ]]; then
    if [[ -d "$DOTFILES_DIR/.git" ]]; then
      print_status "install" "Updating dotfiles repository..."
      if git -C "$DOTFILES_DIR" pull --ff-only 2>/dev/null; then
        print_status "ok" "Dotfiles updated"
      else
        print_status "skip" "Dotfiles up to date (or merge required)"
      fi
    fi
    return 0
  fi

  print_header "Bootstrap: Fresh Machine Detected"
  echo -e "  ${YELLOW}~/.dotfiles not found. Setting up from scratch...${NC}\n"

  # Step 1: Ensure Xcode Command Line Tools (needed for git on fresh Mac)
  if ! xcode-select -p &>/dev/null; then
    print_status "install" "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo -e "\n  ${YELLOW}Please complete the Xcode tools installation popup,${NC}"
    echo -e "  ${YELLOW}then re-run this script.${NC}\n"
    exit 0
  fi
  print_status "ok" "Xcode Command Line Tools"

  # Step 2: Install Homebrew
  if ! is_installed brew; then
    print_status "install" "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add to PATH for this session (Apple Silicon vs Intel)
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
    print_status "ok" "Homebrew installed"
  else
    print_status "skip" "Homebrew"
  fi

  # Step 3: Install git (Homebrew's version, not Apple's)
  if ! brew list git &>/dev/null; then
    print_status "install" "Installing git via Homebrew..."
    brew install git
    print_status "ok" "git installed"
  else
    print_status "skip" "git"
  fi

  # Step 4: Clone dotfiles repository
  print_status "install" "Cloning dotfiles repository..."
  git clone "https://github.com/${GITHUB_REPO}.git" "$DOTFILES_DIR"
  print_status "ok" "Dotfiles cloned to $DOTFILES_DIR"

  echo -e "\n  ${GREEN}Bootstrap complete!${NC} Continuing with installation...\n"
}

# ═══════════════════════════════════════════════════════════════
# Installation Functions
# ═══════════════════════════════════════════════════════════════

ensure_dirs() {
  print_header "Preparing directories"
  mkdir -p "$HOME/.config"
  print_status "ok" "~/.config exists"
}

install_homebrew() {
  print_header "Homebrew"
  if is_installed brew; then
    print_status "skip" "Homebrew"
  else
    print_status "install" "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add to PATH for this session (Apple Silicon vs Intel)
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f "/usr/local/bin/brew" ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
    print_status "ok" "Homebrew installed"
  fi
}

install_brewfile() {
  local brewfile="$1"
  local name="$2"

  print_header "Brewfile: $name"

  if [[ ! -f "$brewfile" ]]; then
    print_status "error" "Brewfile not found: $brewfile"
    return 1
  fi

  print_status "install" "Installing $name packages..."
  if brew bundle --file="$brewfile"; then
    print_status "ok" "$name packages installed"
  else
    print_status "error" "Some $name packages failed (continuing...)"
  fi
}

install_fonts() {
  print_header "System Fonts"

  local fonts_src="$DOTFILES_DIR/fonts"
  local fonts_dest="$HOME/Library/Fonts"

  if [[ ! -d "$fonts_src" ]]; then
    print_status "error" "Fonts directory not found: $fonts_src"
    return 1
  fi

  mkdir -p "$fonts_dest"

  local installed=0
  local skipped=0

  # Use nullglob to handle no matches gracefully
  shopt -s nullglob
  local fonts=("$fonts_src"/*.ttf "$fonts_src"/*.otf)
  shopt -u nullglob

  for font in "${fonts[@]}"; do
    [[ -f "$font" ]] || continue
    local basename
    basename=$(basename "$font")

    if [[ -f "$fonts_dest/$basename" ]]; then
      ((skipped++)) || true
    else
      cp "$font" "$fonts_dest/"
      ((installed++)) || true
    fi
  done

  if [[ $installed -gt 0 ]]; then
    print_status "ok" "Installed $installed fonts"
  fi
  if [[ $skipped -gt 0 ]]; then
    print_status "skip" "$skipped fonts already installed"
  fi
  if [[ $installed -eq 0 && $skipped -eq 0 ]]; then
    print_status "ok" "No fonts to install"
  fi
}

install_stow() {
  print_header "Dotfiles (GNU Stow)"

  if ! is_installed stow; then
    print_status "error" "stow not installed - run Brewfile first"
    return 1
  fi

  print_status "install" "Symlinking dotfiles..."
  cd "$DOTFILES_DIR"

  # Stow will skip already-linked files; use --restow to handle updates
  if stow --restow . 2>/dev/null; then
    print_status "ok" "Dotfiles linked"
  else
    # If restow fails, try regular stow
    if stow . 2>/dev/null; then
      print_status "ok" "Dotfiles linked"
    else
      print_status "error" "Stow failed - check for conflicts"
      return 1
    fi
  fi
}

install_mise_runtimes() {
  print_header "Language Runtimes (mise)"

  if ! is_installed mise; then
    print_status "error" "mise not installed - run Brewfile first"
    return 1
  fi

  # Activate mise for this session
  eval "$(mise activate bash)"

  print_status "install" "Installing global runtimes (node, python, go, rust, terraform)..."
  if mise install --yes 2>/dev/null; then
    print_status "ok" "Runtimes installed"
  else
    print_status "error" "Some runtimes failed to install"
  fi
}

install_krew() {
  print_header "Krew (kubectl plugins)"

  if [[ -d "${HOME}/.krew" ]]; then
    print_status "skip" "Krew"
    return 0
  fi

  print_status "install" "Installing Krew..."
  (
    cd "$(mktemp -d)"
    OS="$(uname | tr '[:upper:]' '[:lower:]')"
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
    KREW="krew-${OS}_${ARCH}"
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz"
    tar zxf "${KREW}.tar.gz"
    ./"${KREW}" install krew
  ) &>/dev/null
  print_status "ok" "Krew installed"
}

configure_dock() {
  print_header "Dock Configuration"

  if ! is_installed dockutil; then
    print_status "error" "dockutil not installed - run Brewfile first"
    return 1
  fi

  print_status "install" "Configuring dock layout..."
  if "$DOTFILES_DIR/setup_dock.sh"; then
    print_status "ok" "Dock configured"
  else
    print_status "error" "Dock configuration failed"
  fi
}

configure_macos_defaults() {
  print_header "macOS System Defaults"

  print_status "install" "Configuring system preferences..."
  if "$DOTFILES_DIR/setup_macos_defaults.sh"; then
    print_status "ok" "System defaults configured"
  else
    print_status "error" "System defaults configuration failed"
  fi
}

# ═══════════════════════════════════════════════════════════════
# Main Menu
# ═══════════════════════════════════════════════════════════════

show_welcome() {
  clear
  echo -e "${CYAN}"
  echo "  ╔═══════════════════════════════════════════════════════╗"
  echo "  ║           macOS Dotfiles Bootstrap                    ║"
  echo "  ╚═══════════════════════════════════════════════════════╝"
  echo -e "${NC}"
  echo "  This script will set up your development environment."
  echo "  It's safe to run multiple times - existing tools are skipped."
  echo ""
}

show_menu() {
  echo -e "${BOLD}What would you like to install?${NC}\n" >&2
  echo "  1) Full installation     (recommended for new machines)" >&2
  echo "  2) Core tools only       (shell, git, editor, k8s, cloud)" >&2
  echo "  3) Extras only           (media, networking, build tools)" >&2
  echo "  4) Custom                (choose components)" >&2
  echo "  5) Exit" >&2
  echo "" >&2
  read -r -p "Selection [1]: " choice
  echo "${choice:-1}"
}

run_custom_menu() {
  local components=()

  echo -e "\n${BOLD}Select components to install:${NC}\n" >&2

  confirm "  Homebrew (package manager)?" && components+=("homebrew")
  confirm "  Core Brewfile (shell, git, editor, k8s, cloud)?" && components+=("core")
  confirm "  Extras Brewfile (media, networking, build tools)?" && components+=("extras")
  confirm "  VS Code extensions?" && components+=("vscode")
  confirm "  System fonts (FiraCode, Nerd Fonts)?" && components+=("fonts")
  confirm "  Symlink dotfiles (stow)?" && components+=("stow")
  confirm "  Language runtimes (mise: node, python, go, rust)?" && components+=("mise")
  confirm "  Krew (kubectl plugin manager)?" && components+=("krew")
  confirm "  Dock configuration (layout and spacers)?" && components+=("dock")
  confirm "  macOS defaults (appearance, finder, keyboard)?" && components+=("macos")

  echo "${components[@]}"
}

# ═══════════════════════════════════════════════════════════════
# Main
# ═══════════════════════════════════════════════════════════════

main() {
  # Validate platform
  if [[ $(uname -s) != "Darwin" ]]; then
    echo -e "${RED}Error: This script is for macOS only.${NC}"
    exit 1
  fi

  # Bootstrap: clone dotfiles if this is a fresh machine
  bootstrap_dotfiles

  show_welcome

  local choice
  if $AUTO_YES; then
    choice="1"  # Full installation in non-interactive mode
  else
    choice=$(show_menu)
  fi

  case $choice in
    1) # Full
      ensure_dirs
      install_homebrew
      install_brewfile "$DOTFILES_DIR/.Brewfile.core" "Core"
      install_brewfile "$DOTFILES_DIR/.Brewfile.extras" "Extras"
      install_brewfile "$DOTFILES_DIR/.Brewfile.vscode" "VS Code"
      install_fonts
      install_stow
      install_mise_runtimes
      install_krew
      configure_macos_defaults
      configure_dock
      ;;
    2) # Core only
      ensure_dirs
      install_homebrew
      install_brewfile "$DOTFILES_DIR/.Brewfile.core" "Core"
      install_fonts
      install_stow
      configure_macos_defaults
      configure_dock
      ;;
    3) # Extras only
      install_brewfile "$DOTFILES_DIR/.Brewfile.extras" "Extras"
      ;;
    4) # Custom
      IFS=' ' read -ra components <<< "$(run_custom_menu)"
      ensure_dirs
      for comp in "${components[@]}"; do
        case $comp in
          homebrew) install_homebrew ;;
          core)     install_brewfile "$DOTFILES_DIR/.Brewfile.core" "Core" ;;
          extras)   install_brewfile "$DOTFILES_DIR/.Brewfile.extras" "Extras" ;;
          vscode)   install_brewfile "$DOTFILES_DIR/.Brewfile.vscode" "VS Code" ;;
          fonts)    install_fonts ;;
          stow)     install_stow ;;
          mise)     install_mise_runtimes ;;
          krew)     install_krew ;;
          dock)     configure_dock ;;
          macos)    configure_macos_defaults ;;
        esac
      done
      ;;
    5)
      echo "Exiting."
      exit 0
      ;;
    *)
      echo "Invalid option"
      exit 1
      ;;
  esac

  print_header "Done!"
  echo -e "  ${GREEN}Your environment is ready.${NC}"
  echo -e "  Restart your terminal or run: ${CYAN}exec fish${NC}"
  echo ""
}

main "$@"
