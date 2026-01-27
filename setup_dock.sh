#!/usr/bin/env bash
# ========================================
# macOS Dock Configuration Script
# ========================================
# Configures dock position, behavior, and app layout with
# conditional app addition (only adds apps that are installed).
#
# Usage: ./setup_dock.sh
#
# Features:
#   - Idempotent: safe to run multiple times
#   - Conditional: only adds installed apps
#   - Grouped: uses small spacers for visual organization

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ═══════════════════════════════════════════════════════════════
# Helper Functions
# ═══════════════════════════════════════════════════════════════

print_status() {
  local status=$1
  local message=$2
  case $status in
  "ok") echo -e "  ${GREEN}✓${NC} $message" ;;
  "skip") echo -e "  ${YELLOW}○${NC} $message ${YELLOW}(not installed)${NC}" ;;
  "add") echo -e "  ${BLUE}+${NC} $message" ;;
  "spacer") echo -e "  ${BLUE}│${NC} $message" ;;
  esac
}

# Add app to dock if it exists
# Usage: add_app "/path/to/App.app" "App Name"
add_app() {
  local app_path="$1"
  local app_name="$2"

  if [[ -e "$app_path" ]]; then
    dockutil --add "$app_path" --no-restart &>/dev/null
    print_status "add" "$app_name"
    return 0
  else
    print_status "skip" "$app_name"
    return 1
  fi
}

# Add small spacer (half-width)
add_spacer() {
  local group_name="${1:-}"
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
  if [[ -n "$group_name" ]]; then
    print_status "spacer" "── $group_name ──"
  fi
}

# ═══════════════════════════════════════════════════════════════
# Dock Preferences
# ═══════════════════════════════════════════════════════════════

configure_dock_preferences() {
  echo -e "\n${BLUE}Configuring dock preferences...${NC}"

  # Position: left side of screen
  defaults write com.apple.dock orientation -string left

  # Size and magnification
  defaults write com.apple.dock tilesize -int 48
  defaults write com.apple.dock largesize -int 48
  defaults write com.apple.dock magnification -bool false

  # Minimize effect
  defaults write com.apple.dock mineffect -string scale

  # Minimize to application icon
  defaults write com.apple.dock minimize-to-application -bool true

  # Don't rearrange spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false

  # Don't show recent/suggested apps
  defaults write com.apple.dock show-recents -bool false

  # Show indicator dots for open applications
  defaults write com.apple.dock show-process-indicators -bool true

  print_status "ok" "Dock preferences configured"
}

# ═══════════════════════════════════════════════════════════════
# Dock App Layout
# ═══════════════════════════════════════════════════════════════

configure_dock_apps() {
  echo -e "\n${BLUE}Configuring dock apps...${NC}"

  # Clear existing dock items
  dockutil --remove all --no-restart &>/dev/null
  print_status "ok" "Cleared existing dock items"

  echo ""

  # ────────────────────────────────────────────────────────────
  # Group 1: System & Utilities
  # ────────────────────────────────────────────────────────────
  add_app "/System/Applications/Apps.app" "Apps"
  add_app "/System/Applications/System Settings.app" "System Settings"

  add_spacer "System Utilities"

  add_app "/Applications/iStatistica Pro.app" "iStatistica Pro"
  # Browser: Chrome on work mac (zoe), Safari elsewhere
  if [[ "$(hostname -s)" == "zoe" ]]; then
    add_app "/Applications/Google Chrome.app" "Chrome" ||
      add_app "/Applications/Arc.app" "Arc" ||
      add_app "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app" "Safari"
  else
    add_app "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app" "Safari" ||
      add_app "/Applications/Safari.app" "Safari" ||
      add_app "/Applications/Arc.app" "Arc" ||
      add_app "/Applications/Google Chrome.app" "Chrome"
  fi

  add_app "/Applications/1Password.app" "1Password"

  # ────────────────────────────────────────────────────────────
  # Group 2: Communication
  # ────────────────────────────────────────────────────────────
  add_spacer "Communication"
  if [[ "$(hostname -s)" == "zoe" ]]; then
    add_app "/Applications/Slack.app" "Slack"
  else
    add_app "/Applications/Telegram.app" "Telegram"
  fi

  # Password manager

  add_spacer "Media & Productivity"

  # ────────────────────────────────────────────────────────────
  # Group 3: Media & Productivity
  # ────────────────────────────────────────────────────────────
  add_app "/Applications/Obsidian.app" "Obsidian"
  if [[ "$(hostname -s)" == "zoe" ]]; then
    add_app "/System/Applications/Calendar.app" "Calendar"
  else
    add_app "/System/Applications/Music.app" "Music"
    add_app "/System/Applications/Calendar.app" "Calendar"
  fi

  add_spacer "Development"

  # ────────────────────────────────────────────────────────────
  # Group 4: Development Tools
  # ────────────────────────────────────────────────────────────
  add_app "/Applications/Ghostty.app" "Ghostty" ||
    add_app "/Applications/iTerm.app" "iTerm" ||
    add_app "/System/Applications/Utilities/Terminal.app" "Terminal"

  add_app "/Applications/Cursor.app" "Cursor"

  add_spacer ""
}

# ═══════════════════════════════════════════════════════════════
# Main
# ═══════════════════════════════════════════════════════════════

main() {
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BLUE}  Dock Configuration${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

  # Check for dockutil
  if ! command -v dockutil &>/dev/null; then
    echo -e "  ${YELLOW}dockutil not found. Install with: brew install dockutil${NC}"
    exit 1
  fi

  configure_dock_preferences
  configure_dock_apps

  # Restart dock to apply changes
  echo -e "\n${BLUE}Restarting Dock...${NC}"
  killall Dock

  echo -e "\n${GREEN}✓ Dock configured successfully${NC}\n"
}

main "$@"
