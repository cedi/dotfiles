#!/usr/bin/env bash
# ========================================
# macOS System Defaults Configuration
# ========================================
# Configures system preferences via defaults commands.
#
# Usage: ./setup_macos_defaults.sh
#
# Note: Some changes require logout/restart to take effect.

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() {
  echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BLUE}  $1${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_status() {
  echo -e "  ${GREEN}✓${NC} $1"
}

# ═══════════════════════════════════════════════════════════════
# Appearance
# ═══════════════════════════════════════════════════════════════

configure_appearance() {
  print_header "Appearance"

  # Dark mode
  defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
  print_status "Dark mode enabled"

  # Highlight color: Automatic (delete the key to use automatic)
  defaults delete NSGlobalDomain AppleHighlightColor 2>/dev/null || true
  print_status "Highlight color: Automatic"

  # Sidebar icon size: Small (1 = small, 2 = medium, 3 = large)
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
  print_status "Sidebar icon size: Small"

  # Show scroll bars: Automatic
  # WhenScrolling, Automatic, Always
  defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"
  print_status "Scroll bars: Automatic"

  # Click scroll bar to: Jump to next page (false) or jump to spot (true)
  defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool false
  print_status "Scroll bar click: Jump to next page"
}

# ═══════════════════════════════════════════════════════════════
# Menu Bar
# ═══════════════════════════════════════════════════════════════

configure_menubar() {
  print_header "Menu Bar"

  # Auto-hide menu bar: In Full Screen Only
  # 0 = Never, 1 = In Full Screen Only, 2 = Always
  defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -bool true
  defaults write NSGlobalDomain _HIHideMenuBar -bool false
  print_status "Menu bar: visible (auto-hide in full screen only)"

  # Recent documents, applications and servers
  defaults write NSGlobalDomain NSRecentDocumentsLimit -int 10
  print_status "Recent items: 10"

  # ── Clock Settings ──
  # Show date in menu bar
  defaults write com.apple.menuextra.clock ShowDate -int 1
  print_status "Clock: Show date"

  # Show day of week
  defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
  print_status "Clock: Show day of week"

  # Digital clock (not analog)
  defaults write com.apple.menuextra.clock IsAnalog -bool false
  print_status "Clock: Digital style"

  # Don't flash time separators
  defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
  print_status "Clock: No flashing separators"

  # Don't show seconds
  defaults write com.apple.menuextra.clock ShowSeconds -bool false
  print_status "Clock: No seconds"

  # ── Battery Settings ──
  # Show battery percentage
  defaults write com.apple.menuextra.battery ShowPercent -string "YES"
  print_status "Battery: Show percentage"

  # ── Control Center Items ──
  # These control visibility in Control Center / Menu Bar
  # Values: 1 = Show in Menu Bar, 2 = Don't Show, 8 = Show When Active, 18 = Always Show in Menu Bar

  # WiFi: Show in menu bar
  defaults -currentHost write com.apple.controlcenter WiFi -int 18
  print_status "Menu bar: WiFi (always)"

  # Bluetooth: Don't show
  defaults -currentHost write com.apple.controlcenter Bluetooth -int 2
  print_status "Menu bar: Bluetooth (hidden)"

  # AirDrop: Don't show
  defaults -currentHost write com.apple.controlcenter AirDrop -int 2
  print_status "Menu bar: AirDrop (hidden)"

  # Focus: Show when active
  defaults -currentHost write com.apple.controlcenter FocusModes -int 8
  print_status "Menu bar: Focus (when active)"

  # Screen Mirroring: Show when active
  defaults -currentHost write com.apple.controlcenter ScreenMirroring -int 8
  print_status "Menu bar: Screen Mirroring (when active)"

  # Display: Show when active
  defaults -currentHost write com.apple.controlcenter Display -int 8
  print_status "Menu bar: Display (when active)"

  # Sound: Always show
  defaults -currentHost write com.apple.controlcenter Sound -int 18
  print_status "Menu bar: Sound (always)"

  # Now Playing: Show when active
  defaults -currentHost write com.apple.controlcenter NowPlaying -int 8
  print_status "Menu bar: Now Playing (when active)"

  # ── Other Menu Extras ──
  # Siri: Don't show
  defaults write com.apple.Siri StatusMenuVisible -bool false
  print_status "Menu bar: Siri (hidden)"

  # Spotlight: Don't show in menu bar (use Cmd+Space)
  defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true
  print_status "Menu bar: Spotlight (hidden)"

  # Time Machine: Show
  defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.TimeMachine" -bool true
  print_status "Menu bar: Time Machine (shown)"
}

# ═══════════════════════════════════════════════════════════════
# Finder
# ═══════════════════════════════════════════════════════════════

configure_finder() {
  print_header "Finder"

  # Show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  print_status "Show all file extensions"

  # Show hidden files
  defaults write com.apple.finder AppleShowAllFiles -bool true
  print_status "Show hidden files"

  # Show path bar
  defaults write com.apple.finder ShowPathbar -bool true
  print_status "Show path bar"

  # Show status bar
  defaults write com.apple.finder ShowStatusBar -bool true
  print_status "Show status bar"

  # Default view style: List (Nlsv = list, icnv = icon, clmv = column, glyv = gallery)
  defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
  print_status "Default view: Column"

  # Keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true
  print_status "Folders on top when sorting"

  # Disable warning when changing file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  print_status "Disabled extension change warning"

  # Avoid creating .DS_Store files on network and USB volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
  print_status "Disabled .DS_Store on network/USB volumes"
}

# ═══════════════════════════════════════════════════════════════
# Keyboard & Input
# ═══════════════════════════════════════════════════════════════

configure_keyboard() {
  print_header "Keyboard & Input"

  # Fast key repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 2
  print_status "Fast key repeat rate"

  # Short delay until repeat
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  print_status "Short delay until key repeat"

  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  print_status "Disabled auto-correct"

  # Disable auto-capitalization
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  print_status "Disabled auto-capitalization"

  # Disable smart quotes
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  print_status "Disabled smart quotes"

  # Disable smart dashes
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  print_status "Disabled smart dashes"

  # Disable period substitution (double-space to period)
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
  print_status "Disabled period substitution"

  # ── Spotlight Shortcuts ──
  # Change Spotlight shortcut from Cmd+Space to Option+Space (for Raycast compatibility)
  # Key 64 = Show Spotlight search
  # Key 65 = Show Finder search window
  # Modifier values: Cmd=1048576, Option=524288, Cmd+Option=1572864
  # Space key: ASCII=32, keycode=49

  # Show Spotlight search: Option+Space (⌥Space)
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "
    <dict>
      <key>enabled</key><true/>
      <key>value</key>
      <dict>
        <key>type</key><string>standard</string>
        <key>parameters</key>
        <array>
          <integer>32</integer>
          <integer>49</integer>
          <integer>524288</integer>
        </array>
      </dict>
    </dict>
  "
  print_status "Spotlight search: Option+Space (⌥Space)"

  # Show Finder search window: Option+Cmd+Space (⌥⌘Space)
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "
    <dict>
      <key>enabled</key><true/>
      <key>value</key>
      <dict>
        <key>type</key><string>standard</string>
        <key>parameters</key>
        <array>
          <integer>32</integer>
          <integer>49</integer>
          <integer>1572864</integer>
        </array>
      </dict>
    </dict>
  "
  print_status "Finder search: Option+Cmd+Space (⌥⌘Space)"
}

# ═══════════════════════════════════════════════════════════════
# Trackpad
# ═══════════════════════════════════════════════════════════════

configure_trackpad() {
  print_header "Trackpad"

  # Enable tap to click
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  print_status "Tap to click enabled"

  # Enable three-finger drag
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
  print_status "Three-finger drag enabled"
}

# ═══════════════════════════════════════════════════════════════
# Screenshots
# ═══════════════════════════════════════════════════════════════

configure_screenshots() {
  print_header "Screenshots"

  # Save screenshots to ~/Pictures/Screenshots
  local screenshot_dir="$HOME/Pictures/Screenshots"
  mkdir -p "$screenshot_dir"
  defaults write com.apple.screencapture location -string "$screenshot_dir"
  print_status "Screenshots save to ~/Pictures/Screenshots"

  # Save screenshots as PNG
  defaults write com.apple.screencapture type -string "png"
  print_status "Screenshot format: PNG"

  # Disable shadow in screenshots
  defaults write com.apple.screencapture disable-shadow -bool false
}

# ═══════════════════════════════════════════════════════════════
# Activity Monitor
# ═══════════════════════════════════════════════════════════════

configure_activity_monitor() {
  print_header "Activity Monitor"

  # Show all processes
  defaults write com.apple.ActivityMonitor ShowCategory -int 0
  print_status "Show all processes"
}

# ═══════════════════════════════════════════════════════════════
# Touch ID for sudo
# ═══════════════════════════════════════════════════════════════

configure_sudo_touchid() {
  print_header "Touch ID for sudo"

  local sudo_local="/etc/pam.d/sudo_local"
  local template="/etc/pam.d/sudo_local.template"

  # Check if already configured
  if [[ -f "$sudo_local" ]] && grep -q "^auth.*pam_tid.so" "$sudo_local" 2>/dev/null; then
    print_status "Touch ID for sudo already enabled"
    return 0
  fi

  # Check if template exists (macOS Sonoma+)
  if [[ ! -f "$template" ]]; then
    echo -e "  ${YELLOW}○${NC} sudo_local.template not found (requires macOS Sonoma+)"
    return 1
  fi

  echo -e "  ${BLUE}→${NC} Enabling Touch ID for sudo (requires password)..."

  # Create sudo_local with pam_tid.so enabled
  sudo bash -c "sed 's/^#auth/auth/' '$template' > '$sudo_local'"

  if [[ -f "$sudo_local" ]] && grep -q "^auth.*pam_tid.so" "$sudo_local" 2>/dev/null; then
    print_status "Touch ID for sudo enabled"
  else
    echo -e "  ${YELLOW}○${NC} Failed to enable Touch ID for sudo"
    return 1
  fi
}

# ═══════════════════════════════════════════════════════════════
# Remote Login (SSH)
# ═══════════════════════════════════════════════════════════════

configure_remote_login() {
  print_header "Remote Login (SSH)"

  # Check if already enabled
  if sudo systemsetup -getremotelogin 2>/dev/null | grep -q "On"; then
    print_status "Remote Login already enabled"
  fi

  echo -e "  ${BLUE}→${NC} Enabling Remote Login (requires password)..."

  # Enable SSH
  sudo systemsetup -setremotelogin on

  if sudo systemsetup -getremotelogin 2>/dev/null | grep -q "On"; then
    print_status "Remote Login (SSH) enabled"
  else
    echo -e "  ${YELLOW}○${NC} Failed to enable Remote Login"
  fi
}

# ═══════════════════════════════════════════════════════════════
# Security (Gatekeeper)
# ═══════════════════════════════════════════════════════════════

configure_security() {
  print_header "Security"

  # Enable Gatekeeper (App Store & Known Developers)
  if spctl --status 2>/dev/null | grep -q "enabled"; then
    print_status "Gatekeeper already enabled"
  else
    echo -e "  ${BLUE}→${NC} Enabling Gatekeeper (requires password)..."
    sudo spctl --master-enable
    print_status "Gatekeeper enabled"
  fi
  print_status "Allow apps from: App Store & Known Developers"

  # FileVault (full disk encryption)
  if fdesetup status | grep -q "FileVault is On"; then
    print_status "FileVault already enabled"
  else
    echo -e "  ${YELLOW}○${NC} FileVault is Off - enable manually in System Settings > Privacy & Security"
    echo -e "    ${YELLOW}(Requires recovery key setup which needs user interaction)${NC}"
  fi

  # Accessories: Automatically allow when unlocked
  # 1 = Ask, 2 = Automatically allow when unlocked, 3 = Always allow
  sudo defaults write /Library/Preferences/com.apple.security.smartcard allowSmartCard -bool true 2>/dev/null || true
  defaults write com.apple.security.authorization allowAccessories -int 2 2>/dev/null || true
  print_status "Accessories: Automatically allow when unlocked"
}

# ═══════════════════════════════════════════════════════════════
# Computer Name
# ═══════════════════════════════════════════════════════════════

configure_computer_name() {
  print_header "Computer Name"

  local current_name
  current_name=$(scutil --get ComputerName 2>/dev/null)

  # Check if name is still a default (contains "MacBook", "iMac", "Mac mini", etc.)
  if [[ "$current_name" =~ ^(MacBook|iMac|Mac\ mini|Mac\ Pro|Mac\ Studio) ]]; then
    echo -e "  ${YELLOW}○${NC} Computer name appears to be default: $current_name"
    echo -n "  Enter new computer name (or press Enter to skip): "
    read -r new_name

    if [[ -n "$new_name" ]]; then
      sudo scutil --set ComputerName "$new_name"
      sudo scutil --set LocalHostName "$new_name"
      sudo scutil --set HostName "$new_name"
      print_status "Computer name set to: $new_name"
    else
      print_status "Skipped - keeping: $current_name"
    fi
  else
    print_status "Computer name: $current_name"
  fi
}

# ═══════════════════════════════════════════════════════════════
# Night Shift
# ═══════════════════════════════════════════════════════════════

configure_night_shift() {
  print_header "Night Shift"

  nightlight schedule start
  nightlight temp 50

  print_status "Night Shift: Sunset to Sunrise"
}

# ═══════════════════════════════════════════════════════════════
# Mouse
# ═══════════════════════════════════════════════════════════════

configure_mouse() {
  print_header "Mouse"

  # Mouse tracking speed (0.0 to 3.0, default is ~1.0)
  defaults write NSGlobalDomain com.apple.mouse.scaling -float 2.0
  print_status "Mouse tracking speed: 2.0"

  # Scroll wheel speed
  defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.5
  print_status "Scroll wheel speed: 0.5"

  # Natural scrolling (true = natural, false = traditional)
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
  print_status "Natural scrolling: enabled"

  # Bluetooth mouse settings
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string "OneButton"
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseHorizontalScroll -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseMomentumScroll -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseVerticalScroll -bool true
  print_status "Bluetooth mouse: momentum scroll, horizontal scroll"
}

# ═══════════════════════════════════════════════════════════════
# Login Items
# ═══════════════════════════════════════════════════════════════

configure_login_items() {
  print_header "Login Items"

  # Function to add login item if app exists
  add_login_item() {
    local app_path="$1"
    local app_name="$2"

    if [[ -e "$app_path" ]]; then
      # Check if already a login item
      if osascript -e "tell application \"System Events\" to get the name of every login item" 2>/dev/null | grep -q "$app_name"; then
        print_status "$app_name (already set)"
      else
        osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"$app_path\", hidden:false}" 2>/dev/null
        print_status "$app_name"
      fi
    fi
  }

  # Add common apps as login items (only if installed)
  add_login_item "/Applications/Raycast.app" "Raycast"
  add_login_item "/Applications/1Password.app" "1Password"
  add_login_item "/Applications/iStatistica Pro.app" "iStatistica Pro"
  add_login_item "/Applications/Rectangle.app" "Rectangle"
  add_login_item "/Applications/Ice.app" "Ice"
  add_login_item "/Applications/BetterMouse.app" "BetterMouse"
  add_login_item "/Applications/OrbStack.app" "OrbStack"
  add_login_item "/Applications/Elgato Control Center.app" "Elgato Control Center"
  add_login_item "/Applications/Bartender 5.app" "Bartender 5"
  add_login_item "/Applications/Alfred 5.app" "Alfred 5"
  add_login_item "/Applications/Synology Drive Client.app" "Synology Drive Client"
}

# ═══════════════════════════════════════════════════════════════
# Raycast Settings
# ═══════════════════════════════════════════════════════════════

configure_raycast() {
  print_header "Raycast Settings"

  local DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
  local raycast_plist="$HOME/Library/Preferences/com.raycast.macos.plist"
  local backup_plist="$DOTFILES_DIR/.raycast.plist"

  # If backup exists in dotfiles, restore it
  if [[ -f "$backup_plist" ]]; then
    if [[ -f "$raycast_plist" ]]; then
      print_status "Raycast settings exist, skipping restore"
      echo -e "  ${YELLOW}To restore from backup: cp $backup_plist $raycast_plist${NC}"
    else
      cp "$backup_plist" "$raycast_plist"
      print_status "Raycast settings restored from dotfiles"
    fi
  else
    # No backup in dotfiles - offer to create one
    if [[ -f "$raycast_plist" ]]; then
      echo -e "  ${YELLOW}○${NC} No Raycast backup in dotfiles"
      echo -n "  Export current Raycast settings to dotfiles? [y/N] "
      read -r response
      if [[ "$response" =~ ^[Yy]$ ]]; then
        cp "$raycast_plist" "$backup_plist"
        print_status "Raycast settings exported to .raycast.plist"
      else
        print_status "Skipped Raycast backup"
      fi
    else
      print_status "Raycast not configured yet"
    fi
  fi
}

# ═══════════════════════════════════════════════════════════════
# Main
# ═══════════════════════════════════════════════════════════════

main() {
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BLUE}  macOS System Defaults${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

  configure_computer_name
  configure_appearance
  configure_menubar
  configure_finder
  configure_keyboard
  configure_trackpad
  configure_mouse
  configure_night_shift
  configure_screenshots
  configure_activity_monitor
  configure_login_items
  configure_raycast
  configure_sudo_touchid
  configure_remote_login
  configure_security

  echo -e "\n${YELLOW}Note: Some changes require logout or restart to take effect.${NC}"
  echo -e "${GREEN}✓ macOS defaults configured${NC}\n"

  # Restart affected applications
  echo -e "${BLUE}Restarting affected applications...${NC}"
  killall Finder 2>/dev/null || true
  killall SystemUIServer 2>/dev/null || true
  killall ControlCenter 2>/dev/null || true
  print_status "Done"
}

main "$@"
