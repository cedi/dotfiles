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

  # Accent color: Multicolor (-1 = multicolor, 0 = blue, 1 = purple, etc.)
  defaults write NSGlobalDomain AppleAccentColor -int -1
  print_status "Accent color: Multicolor"

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
  defaults write com.apple.screencapture disable-shadow -bool true
  print_status "Screenshot shadow disabled"

  # ── Screenshot Keyboard Shortcuts ──
  # Symbolic hotkey IDs: 28=screen to file, 29=screen to clipboard,
  #                      30=selection to file, 31=selection to clipboard, 184=options
  # Modifier values: Shift=131072, Cmd=1048576, Ctrl=262144
  # Shift+Cmd=1179648, Ctrl+Shift+Cmd=1441792

  # Copy picture of selected area to clipboard: ⇧⌘S (instead of default ⌃⇧⌘4)
  # S key: ASCII=115, keycode=1
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 31 "
    <dict>
      <key>enabled</key><true/>
      <key>value</key>
      <dict>
        <key>type</key><string>standard</string>
        <key>parameters</key>
        <array>
          <integer>115</integer>
          <integer>1</integer>
          <integer>1179648</integer>
        </array>
      </dict>
    </dict>
  "
  print_status "Copy selection to clipboard: ⇧⌘S"
}

# ═══════════════════════════════════════════════════════════════
# Safari (if used)
# ═══════════════════════════════════════════════════════════════

configure_safari() {
  print_header "Safari"

  # Show full URL in address bar
  defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
  print_status "Show full URL"

  # Enable developer menu
  defaults write com.apple.Safari IncludeDevelopMenu -bool true
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  print_status "Developer menu enabled"

  # Disable auto-open of "safe" downloads
  defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
  print_status "Disabled auto-open safe downloads"
}

# ═══════════════════════════════════════════════════════════════
# Activity Monitor
# ═══════════════════════════════════════════════════════════════

configure_activity_monitor() {
  print_header "Activity Monitor"

  # Show all processes
  defaults write com.apple.ActivityMonitor ShowCategory -int 0
  print_status "Show all processes"

  # Sort by CPU usage
  defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
  defaults write com.apple.ActivityMonitor SortDirection -int 0
  print_status "Sort by CPU usage (descending)"
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
  if systemsetup -getremotelogin 2>/dev/null | grep -q "On"; then
    print_status "Remote Login already enabled"
    return 0
  fi

  echo -e "  ${BLUE}→${NC} Enabling Remote Login (requires password)..."

  # Enable SSH
  sudo systemsetup -setremotelogin on

  if systemsetup -getremotelogin 2>/dev/null | grep -q "On"; then
    print_status "Remote Login (SSH) enabled"
  else
    echo -e "  ${YELLOW}○${NC} Failed to enable Remote Login"
    return 1
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
# Main
# ═══════════════════════════════════════════════════════════════

main() {
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BLUE}  macOS System Defaults${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

  configure_appearance
  configure_menubar
  configure_finder
  configure_keyboard
  configure_trackpad
  configure_screenshots
  configure_safari
  configure_activity_monitor
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
