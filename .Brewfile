# ========================================
# Homebrew Taps
# ========================================

# --- Core tooling taps ---
# Missing command suggestions when a binary is not installed
tap "homebrew/command-not-found"
# HashiCorp maintained releases (Terraform, Consul, etc.)
tap "hashicorp/tap"
# Manage Terraform version switching
tap "warrensbox/tap"

# --- Developer utility taps ---
# Custom FFmpeg builds with optional codecs
tap "homebrew-ffmpeg/ffmpeg"
# Terminal screenshot capture helper
tap "homeport/tap"
# Prompt theming and status segments via Oh My Posh
tap "jandedobbeleer/oh-my-posh"
# USB device discovery tools for macOS
tap "jlhonora/lsusb"
# GitGuardian CLI for secret scanning
tap "gitguardian/tap"
# Releases for golangci-lint toolchain
tap "golangci/tap"
# TinyGo compiler and utilities
tap "tinygo-org/tools"
# S3-compatible MinIO client updates
tap "minio/stable"
# AI assistant for Kubernetes troubleshooting
tap "robusta-dev/holmesgpt"
# Media transcoding utilities from Sandreas
tap "sandreas/tap"

# ========================================
# Homebrew Formulae
# ========================================

# --- System & Shell Experience ---
# GNU core utilities for consistent CLI behavior on macOS
brew "coreutils"
# Friendly interactive shell with advanced scripting
brew "fish"
# Terminal multiplexer for persistent sessions
brew "tmux"
# Manage dotfiles via symlinks
brew "stow"
# Smarter cd command with directory ranking
brew "zoxide"

# --- GNU Userland Enhancements ---
# GNU find, locate, updatedb, xargs, and more
brew "findutils"
# GNU implementations of tar with extended features
brew "gnu-tar"
# GNU sed with enhanced regex support
brew "gnu-sed"
# GNU awk for text processing pipelines
brew "gawk"
# Transport layer security library from GNU
brew "gnutls"
# GNU indent for C/C++ source formatting
brew "gnu-indent"
# GNU getopt for consistent argument parsing
brew "gnu-getopt"
# GNU grep with Perl-compatible regex support
brew "grep"

# --- CLI Enhancements & Productivity ---
# Modern replacement for ls with git/status integration
brew "eza"
# Syntax-highlighted cat clone
brew "bat"
# Render Markdown files directly in the terminal
brew "glow"
# Interactive cheatsheet navigator for the terminal
brew "navi"
# System info dashboard for shell screenshots
brew "neofetch"
# Context-aware correction of previous console commands
brew "thefuck"
# Community-driven TL;DR cheatsheets viewer
brew "tldr"
# Visual directory tree listing
brew "tree"
# Customizable prompt theming via Oh My Posh
brew "jandedobbeleer/oh-my-posh/oh-my-posh"
# Capture terminal output as shareable images
brew "homeport/tap/termshot"

# --- Version Control & Collaboration ---
# GitHub CLI for repo management and workflows
brew "gh"
# Distributed version control system
brew "git"
# Enhanced diff viewer for Git output
brew "git-delta"
# Colorized diff utility for comparing files
brew "colordiff"

# --- File, Text & Data Utilities ---
# Fast recursive search across files
brew "ripgrep"
# Command-line JSON processor
brew "jq"
# YAML processor mirroring jq syntax
brew "yq"
# Markdown linter with extensible rules
brew "markdownlint-cli2"
# Count lines of code across languages
brew "cloc"
# Incremental parsing library tooling for editors
brew "tree-sitter"

# --- Networking & Diagnostics ---
# Interactive process viewer for system monitoring
brew "htop"
# Network diagnostic tool combining traceroute and ping
brew "mtr"
# Network exploration and security auditing toolkit
brew "nmap"
# Calculate IP address ranges and subnet masks
brew "ipcalc"
# Linux-style networking utilities adapted for macOS
brew "iproute2mac"
# Mobile shell for resilient SSH connections
brew "mosh"
# Classic telnet client for legacy systems
brew "telnet"
# Periodically rerun commands and display output
brew "watch"
# Non-interactive network downloader
brew "wget"

# --- Security & Secrets Management ---
# Modern encryption tool for simple key management
brew "age"
# GNU Privacy Guard for OpenPGP encryption and signing
brew "gnupg"
# Container image signing and verification CLI
brew "cosign"
# Secret management tool compatible with GitOps workflows
brew "sops"

# --- Build & Language Tooling ---
# Generate configure scripts for compiling software
brew "autoconf"
# Automate Makefile generation for GNU build systems
brew "automake"
# Cross-platform build system generator
brew "cmake"
# Classic make build orchestrator
brew "make"
# Language server powering Lua IDE features
brew "lua-language-server"
# Modal text editor with Lua-based configuration
brew "neovim"

# --- Package & Dependency Management ---
# Install and run Python CLI tools in isolated environments
brew "pipx"
# Audit and upgrade npm dependencies
brew "npm-check-updates"
# Universal runtime and toolchain manager
brew "mise"

# --- CI/CD & Automation ---
# Run GitHub Actions workflows locally
brew "act"
# IT automation engine (kept unlinked to avoid PATH conflicts)
brew "ansible", link: false

# --- Kubernetes & Container Tooling ---
# Lightweight Kubernetes clusters inside Docker
brew "k3d"
# Bootstrap k3s clusters on any remote host
brew "k3sup"
# Terminal UI for navigating Kubernetes clusters
brew "k9s"
# Official kubectl CLI for Kubernetes
brew "kubernetes-cli"
# Quickly switch between Kubernetes contexts and namespaces
brew "kubectx"
# Validate Kubernetes manifests against the API
brew "kubeval"
# Template-free Kubernetes configuration management
brew "kustomize"
# Package manager for Kubernetes applications
brew "helm"
# Language server for Helm charts
brew "helm-ls"
# Tail multiple Kubernetes pod logs centrally
brew "stern"

# --- Cloud Provider CLIs ---
# AWS command-line interface for managing AWS resources
brew "awscli"
# Azure command-line tools for Azure services
brew "azure-cli"
# Backblaze B2 storage management utilities
brew "b2-tools"
# Hetzner Cloud CLI for provisioning infrastructure
brew "hcloud"

# --- Infrastructure as Code ---
# Language server for Terraform configuration editing
brew "hashicorp/tap/terraform-ls"
# Interactive Terraform version switcher
brew "warrensbox/tap/tfswitch"

# --- Media & Imaging ---
# Encode and decode WebP images
brew "webp"
# Support for JPEG XL image format
brew "jpeg-xl"
# Read and edit EXIF metadata
brew "exiftool"
# Encode/decode High Efficiency Image File Format (HEIF)
brew "libheif"
# Swiss-army knife for image conversions
brew "imagemagick"
# Custom FFmpeg build with Fraunhofer FDK AAC support
brew "homebrew-ffmpeg/ffmpeg/ffmpeg", args: ["with-fdk-aac"]

# ========================================
# Homebrew Casks
# ========================================

# Remove outdated Xcode caches to reclaim disk space
cask "devcleaner"
# Vector illustration editor for SVG workflows
cask "inkscape"
# Customize macOS menu bar icons with themed variants
cask "jordanbaird-ice"

# ========================================
# Visual Studio Code Extensions
# ========================================

# --- Themes & Presentation ---
# Dracula-inspired dark theme
vscode "dracula-theme.theme-dracula"
# Dracula palette with refined UI accents
vscode "lakshits11.dracula-redefined"
# GitHubʼs official color themes
vscode "github.github-vscode-theme"
# Rich icon set for the VS Code explorer
vscode "vscode-icons-team.vscode-icons"

# --- Editing Productivity & UI ---
# Highlight and categorize TODO-style comments
vscode "aaron-bond.better-comments"
# Emoji auto-completion while typing
vscode "bierner.emojisense"
# Visualize TODOs and fixme notes in a tree view
vscode "gruntfuggly.todo-tree"
# Syntax-highlight ANSI color codes in output panes
vscode "ibm.output-colorizer"
# Side-by-side folder comparison utility
vscode "moshfeu.compare-folders-insider"
# Rainbow-colored indentation guides
vscode "oderwat.indent-rainbow"
# Highlight and trim trailing whitespace
vscode "shardulm94.trailing-spaces"
# Map commands to Elgato Stream Deck buttons
vscode "nicollasr.vscode-streamdeck"
# Encode and decode Base64 strings within the editor
vscode "adamhartford.vscode-base64"

# --- Formatting & Standards ---
# Enforce consistent editor settings across projects
vscode "editorconfig.editorconfig"
# Opinionated formatter supporting many languages
vscode "esbenp.prettier-vscode"

# --- Language & Schema Support ---
# Protobuf and Buf tooling integration
vscode "bufbuild.vscode-buf"
# Official Go language extension with debugging and tools
vscode "golang.go"
# YAML authoring with validation and schema support
vscode "redhat.vscode-yaml"
# Static analysis and query authoring for CodeQL
vscode "github.vscode-codeql"

# --- DevOps & Cloud Tooling ---
# Native Docker tooling from Docker Inc.
vscode "docker.docker"
# Azure-specific Docker tooling dashboards
vscode "ms-azuretools.vscode-docker"
# Manage Azure container apps and registries
vscode "ms-azuretools.vscode-containers"
# Manage GitHub repositories without leaving VS Code
vscode "github.remotehub"
# Author and monitor GitHub Actions workflows
vscode "github.vscode-github-actions"
# Review and manage GitHub pull requests
vscode "github.vscode-pull-request-github"

# --- Remote Development ---
# Develop inside containers using devcontainers
vscode "ms-vscode-remote.remote-containers"
# SSH into remote hosts for editing
vscode "ms-vscode-remote.remote-ssh"
# Edit remote SSH configuration files
vscode "ms-vscode-remote.remote-ssh-edit"
# Unified view of remote targets (SSH, WSL, Containers)
vscode "ms-vscode.remote-explorer"
# Work with remote repositories without cloning locally
vscode "ms-vscode.remote-repositories"
# Run and manage the VS Code server on remote machines
vscode "ms-vscode.remote-server"
