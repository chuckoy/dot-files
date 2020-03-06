# Close any open System Preferences panes,
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "🍎 Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "🍎 Dock: orientation to the bottom"
defaults write com.apple.dock orientation -string bottom

echo "🍎 Dock: adjust tile size"
defaults write com.apple.dock tilesize -int 42

echo "☠️  Killing affected applications ☠️ "
for app in Finder Dock SystemUIServer; do killall "$app" >/dev/null 2>&1; done
