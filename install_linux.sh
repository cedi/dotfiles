#!/usr/bin/env bash
# ========================================
# Linux Dotfiles Bootstrap Script
# ========================================
# One-liner for fresh machine:
#   bash <(curl -fsSL https://raw.githubusercontent.com/cedi/dotfiles/main/install_linux.sh)
#
# Features:
#   - Self-bootstrapping: installs git, clones repo
#   - Interactive menu for component selection
#   - Preset modes: full, core, server, extras
#   - Smart detection: skips already-installed tools
#   - Idempotent: safe to run multiple times
#   - Non-interactive mode: ./install_linux.sh --yes --preset server

set -e

# ═══════════════════════════════════════════════════════════════
# Configuration
# ═══════════════════════════════════════════════════════════════

GITHUB_REPO="cedi/dotfiles"
DOTFILES_DIR="${HOME}/.dotfiles"
AUTO_YES=false
PRESET=""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# ═══════════════════════════════════════════════════════════════
# Package Lists
# ═══════════════════════════════════════════════════════════════

# Minimal packages for server preset (homelab/Pi)
SERVER_APT_PACKAGES=(
  fish tmux stow fzf
  bat ripgrep tree
  git neovim gnupg
  htop curl wget unzip
)

# Core packages for development (includes server packages)
CORE_APT_PACKAGES=(
  "${SERVER_APT_PACKAGES[@]}"
  build-essential
  ca-certificates
  jq
  python3 python3-pip
)

# Extra packages (networking, media, build tools)
EXTRAS_APT_PACKAGES=(
  mosh socat rsync tcpdump
  lldpad neofetch
  apt-transport-https
)

# ═══════════════════════════════════════════════════════════════
# Parse Arguments
# ═══════════════════════════════════════════════════════════════

while [[ $# -gt 0 ]]; do
  case $1 in
    -y|--yes)
      AUTO_YES=true
      shift
      ;;
    -p|--preset)
      PRESET="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: $0 [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  -y, --yes              Non-interactive mode"
      echo "  -p, --preset PRESET    Installation preset (full, core, server, extras)"
      echo "  -h, --help             Show this help message"
      echo ""
      echo "Presets:"
      echo "  full    - Workstation: all tools + runtimes + k8s"
      echo "  core    - Dev server: shell, editor, k8s, cloud tools"
      echo "  server  - Homelab/Pi: shell, editor, stow only (default)"
      echo "  extras  - Extra apt packages only"
      exit 0
      ;;
    *)
      shift
      ;;
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

detect_arch() {
  case $(uname -m) in
    x86_64)  echo "amd64" ;;
    aarch64) echo "arm64" ;;
    armv7l)  echo "arm" ;;
    *)       echo "unknown" ;;
  esac
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

  # Ensure git is available
  if ! is_installed git; then
    print_status "install" "Installing git..."
    sudo apt-get update
    sudo apt-get install -y git
    print_status "ok" "git installed"
  else
    print_status "skip" "git"
  fi

  # Clone dotfiles repository
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
  mkdir -p "$HOME/.local/bin"
  print_status "ok" "~/.config and ~/.local/bin exist"
}

install_apt_packages() {
  local packages=("$@")
  local name="${packages[0]}"
  unset 'packages[0]'

  print_header "APT Packages: $name"

  print_status "install" "Updating apt cache..."
  sudo apt-get update

  print_status "install" "Installing $name packages..."
  if sudo apt-get install -y "${packages[@]}"; then
    print_status "ok" "$name packages installed"
  else
    print_status "error" "Some $name packages failed (continuing...)"
  fi
}

install_eza() {
  print_header "External Repo: eza"

  if is_installed eza; then
    print_status "skip" "eza"
    return 0
  fi

  print_status "install" "Adding eza repository..."
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg 2>/dev/null || true
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list > /dev/null
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list 2>/dev/null || true
  sudo apt-get update
  sudo apt-get install -y eza
  print_status "ok" "eza installed"
}

install_gh_cli() {
  print_header "External Repo: GitHub CLI"

  if is_installed gh; then
    print_status "skip" "GitHub CLI"
    return 0
  fi

  print_status "install" "Adding GitHub CLI repository..."
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y gh
  print_status "ok" "GitHub CLI installed"
}

install_oh_my_posh() {
  print_header "Binary Tool: oh-my-posh"

  if is_installed oh-my-posh; then
    print_status "skip" "oh-my-posh"
    return 0
  fi

  local arch
  arch=$(detect_arch)
  local url="https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-${arch}"

  print_status "install" "Downloading oh-my-posh..."
  sudo wget -q "$url" -O /usr/local/bin/oh-my-posh
  sudo chmod +x /usr/local/bin/oh-my-posh
  print_status "ok" "oh-my-posh installed"
}

install_zoxide() {
  print_header "Binary Tool: zoxide"

  if is_installed zoxide; then
    print_status "skip" "zoxide"
    return 0
  fi

  print_status "install" "Installing zoxide..."
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash -s -- --bin-dir "$HOME/.local/bin" 2>/dev/null
  print_status "ok" "zoxide installed"
}

install_mise() {
  print_header "Binary Tool: mise"

  if is_installed mise; then
    print_status "skip" "mise"
    return 0
  fi

  print_status "install" "Installing mise..."
  curl -fsSL https://mise.run | sh
  print_status "ok" "mise installed"
}

install_yq() {
  print_header "Binary Tool: yq"

  if is_installed yq; then
    print_status "skip" "yq"
    return 0
  fi

  local arch
  arch=$(detect_arch)
  local url="https://github.com/mikefarah/yq/releases/latest/download/yq_linux_${arch}"

  print_status "install" "Downloading yq..."
  sudo wget -q "$url" -O /usr/local/bin/yq
  sudo chmod +x /usr/local/bin/yq
  print_status "ok" "yq installed"
}

install_delta() {
  print_header "Binary Tool: delta"

  if is_installed delta; then
    print_status "skip" "delta"
    return 0
  fi

  local arch
  arch=$(detect_arch)
  local deb_arch
  case $arch in
    amd64) deb_arch="amd64" ;;
    arm64) deb_arch="arm64" ;;
    *)     print_status "error" "Unsupported architecture for delta"; return 1 ;;
  esac

  print_status "install" "Downloading delta..."
  local tmp_dir
  tmp_dir=$(mktemp -d)
  local version
  version=$(curl -sL https://api.github.com/repos/dandavison/delta/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
  wget -q "https://github.com/dandavison/delta/releases/download/${version}/git-delta_${version}_${deb_arch}.deb" -O "${tmp_dir}/delta.deb"
  sudo dpkg -i "${tmp_dir}/delta.deb"
  rm -rf "${tmp_dir}"
  print_status "ok" "delta installed"
}

install_kubectl() {
  print_header "Kubernetes: kubectl"

  if is_installed kubectl; then
    print_status "skip" "kubectl"
    return 0
  fi

  print_status "install" "Adding Kubernetes repository..."
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg 2>/dev/null || true
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y kubectl
  print_status "ok" "kubectl installed"
}

install_kubectx() {
  print_header "Kubernetes: kubectx/kubens"

  if is_installed kubectx; then
    print_status "skip" "kubectx"
    return 0
  fi

  local arch
  arch=$(detect_arch)
  local version
  version=$(curl -sL https://api.github.com/repos/ahmetb/kubectx/releases/latest | grep '"tag_name"' | sed -E 's/.*"v?([^"]+)".*/\1/')

  print_status "install" "Downloading kubectx/kubens..."
  local tmp_dir
  tmp_dir=$(mktemp -d)

  wget -q "https://github.com/ahmetb/kubectx/releases/download/v${version}/kubectx_v${version}_linux_${arch}.tar.gz" -O "${tmp_dir}/kubectx.tar.gz"
  wget -q "https://github.com/ahmetb/kubectx/releases/download/v${version}/kubens_v${version}_linux_${arch}.tar.gz" -O "${tmp_dir}/kubens.tar.gz"

  tar -xzf "${tmp_dir}/kubectx.tar.gz" -C "${tmp_dir}"
  tar -xzf "${tmp_dir}/kubens.tar.gz" -C "${tmp_dir}"

  sudo mv "${tmp_dir}/kubectx" /usr/local/bin/
  sudo mv "${tmp_dir}/kubens" /usr/local/bin/
  rm -rf "${tmp_dir}"
  print_status "ok" "kubectx/kubens installed"
}

install_k9s() {
  print_header "Kubernetes: k9s"

  if is_installed k9s; then
    print_status "skip" "k9s"
    return 0
  fi

  local arch
  arch=$(detect_arch)
  local version
  version=$(curl -sL https://api.github.com/repos/derailed/k9s/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')

  print_status "install" "Downloading k9s..."
  local tmp_dir
  tmp_dir=$(mktemp -d)

  wget -q "https://github.com/derailed/k9s/releases/download/${version}/k9s_Linux_${arch}.tar.gz" -O "${tmp_dir}/k9s.tar.gz"
  tar -xzf "${tmp_dir}/k9s.tar.gz" -C "${tmp_dir}"
  sudo mv "${tmp_dir}/k9s" /usr/local/bin/
  rm -rf "${tmp_dir}"
  print_status "ok" "k9s installed"
}

install_helm() {
  print_header "Kubernetes: Helm"

  if is_installed helm; then
    print_status "skip" "Helm"
    return 0
  fi

  print_status "install" "Installing Helm..."
  curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  print_status "ok" "Helm installed"
}

install_krew() {
  print_header "Kubernetes: Krew"

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

install_stow() {
  print_header "Dotfiles (GNU Stow)"

  if ! is_installed stow; then
    print_status "error" "stow not installed - install apt packages first"
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
    print_status "error" "mise not installed - install binary tools first"
    return 1
  fi

  # Activate mise for this session
  eval "$(~/.local/bin/mise activate bash 2>/dev/null || mise activate bash)"

  print_status "install" "Installing global runtimes..."
  if mise install --yes 2>/dev/null; then
    print_status "ok" "Runtimes installed"
  else
    print_status "error" "Some runtimes failed to install"
  fi
}

# ═══════════════════════════════════════════════════════════════
# Main Menu
# ═══════════════════════════════════════════════════════════════

show_welcome() {
  clear
  echo -e "${CYAN}"
  echo "  ╔═══════════════════════════════════════════════════════╗"
  echo "  ║           Linux Dotfiles Bootstrap                    ║"
  echo "  ╚═══════════════════════════════════════════════════════╝"
  echo -e "${NC}"
  echo "  This script will set up your development environment."
  echo "  It's safe to run multiple times - existing tools are skipped."
  echo ""
}

show_menu() {
  echo -e "${BOLD}What would you like to install?${NC}\n" >&2
  echo "  1) Full installation     (workstation: all tools + runtimes)" >&2
  echo "  2) Core tools            (dev server: shell, editor, k8s, cloud)" >&2
  echo "  3) Server minimal        (homelab: shell, editor, stow only)" >&2
  echo "  4) Extras only           (networking, build tools)" >&2
  echo "  5) Custom                (choose components)" >&2
  echo "  6) Exit" >&2
  echo "" >&2
  read -r -p "Selection [3]: " choice
  echo "${choice:-3}"
}

run_custom_menu() {
  local components=()

  echo -e "\n${BOLD}Select components to install:${NC}\n" >&2

  confirm "  Server APT packages (fish, tmux, neovim, etc.)?" && components+=("server_apt")
  confirm "  Core APT packages (build-essential, jq, python)?" && components+=("core_apt")
  confirm "  Extra APT packages (mosh, tcpdump, neofetch)?" && components+=("extras_apt")
  confirm "  eza (modern ls)?" && components+=("eza")
  confirm "  GitHub CLI?" && components+=("gh")
  confirm "  oh-my-posh (prompt theme)?" && components+=("oh_my_posh")
  confirm "  zoxide (smart cd)?" && components+=("zoxide")
  confirm "  mise (runtime manager)?" && components+=("mise")
  confirm "  yq (YAML processor)?" && components+=("yq")
  confirm "  delta (git diff)?" && components+=("delta")
  confirm "  Symlink dotfiles (stow)?" && components+=("stow")
  confirm "  Language runtimes (mise install)?" && components+=("runtimes")
  confirm "  Kubernetes tools (kubectl, kubectx, k9s, helm)?" && components+=("k8s")
  confirm "  Krew (kubectl plugin manager)?" && components+=("krew")

  echo "${components[@]}"
}

run_full() {
  ensure_dirs
  install_apt_packages "Core" "${CORE_APT_PACKAGES[@]}"
  install_apt_packages "Extras" "${EXTRAS_APT_PACKAGES[@]}"
  install_eza
  install_gh_cli
  install_oh_my_posh
  install_zoxide
  install_mise
  install_yq
  install_delta
  install_stow
  install_mise_runtimes
  install_kubectl
  install_kubectx
  install_k9s
  install_helm
  install_krew
}

run_core() {
  ensure_dirs
  install_apt_packages "Core" "${CORE_APT_PACKAGES[@]}"
  install_eza
  install_gh_cli
  install_oh_my_posh
  install_zoxide
  install_mise
  install_yq
  install_delta
  install_stow
  install_kubectl
  install_kubectx
  install_k9s
  install_helm
  install_krew
}

run_server() {
  ensure_dirs
  install_apt_packages "Server" "${SERVER_APT_PACKAGES[@]}"
  install_eza
  install_oh_my_posh
  install_zoxide
  install_stow
}

run_extras() {
  install_apt_packages "Extras" "${EXTRAS_APT_PACKAGES[@]}"
}

run_custom() {
  IFS=' ' read -ra components <<< "$(run_custom_menu)"
  ensure_dirs
  for comp in "${components[@]}"; do
    case $comp in
      server_apt)  install_apt_packages "Server" "${SERVER_APT_PACKAGES[@]}" ;;
      core_apt)    install_apt_packages "Core" "${CORE_APT_PACKAGES[@]}" ;;
      extras_apt)  install_apt_packages "Extras" "${EXTRAS_APT_PACKAGES[@]}" ;;
      eza)         install_eza ;;
      gh)          install_gh_cli ;;
      oh_my_posh)  install_oh_my_posh ;;
      zoxide)      install_zoxide ;;
      mise)        install_mise ;;
      yq)          install_yq ;;
      delta)       install_delta ;;
      stow)        install_stow ;;
      runtimes)    install_mise_runtimes ;;
      k8s)
        install_kubectl
        install_kubectx
        install_k9s
        install_helm
        ;;
      krew)        install_krew ;;
    esac
  done
}

# ═══════════════════════════════════════════════════════════════
# Main
# ═══════════════════════════════════════════════════════════════

main() {
  # Validate platform
  if [[ $(uname -s) == "Darwin" ]]; then
    echo -e "${RED}Error: This script is for Linux only. Use install_macos.sh instead.${NC}"
    exit 1
  fi

  # Bootstrap: clone dotfiles if this is a fresh machine
  bootstrap_dotfiles

  show_welcome

  local choice
  if [[ -n "$PRESET" ]]; then
    # Preset mode
    case $PRESET in
      full)   choice="1" ;;
      core)   choice="2" ;;
      server) choice="3" ;;
      extras) choice="4" ;;
      *)
        echo -e "${RED}Error: Unknown preset '$PRESET'. Use: full, core, server, extras${NC}"
        exit 1
        ;;
    esac
  elif $AUTO_YES; then
    choice="3"  # Default to server in non-interactive mode
  else
    choice=$(show_menu)
  fi

  case $choice in
    1) run_full ;;
    2) run_core ;;
    3) run_server ;;
    4) run_extras ;;
    5) run_custom ;;
    6)
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
