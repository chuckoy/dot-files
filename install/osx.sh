# Close any open System Preferences panes,
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "🍎 Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "🍎 Finder: show Path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "🍎 Dock: orientation to the bottom"
defaults write com.apple.dock orientation -string bottom

echo "🍎 Dock: adjust tile size"
defaults write com.apple.dock tilesize -int 42

echo "🍎 Dock: wipe all (default) app icons"
defaults write com.apple.dock persistent-apps -array

echo "🍎 Dock: add default app icons"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Firefox.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>";
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>";
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>";
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>";
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Authy Desktop.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>";
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Discord.app/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>";

echo "🍎 Dock: Don't show recent applications"
defaults write com.apple.dock recent-apps -array

echo "🍎 iTerm2: specify the preferences directory"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dot-files/iterm2"

echo "🍎 iTerm2: use the custom preferences in the directory"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "🍎 Trackpad: set to correct scrolling direction"
defaults write com.apple.swipescrolldirection -bool false

echo "🍎 Language: show languages on menu bar"
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

echo "🍎 Keyboard: allow press and hold key repeat (not accent marks)"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "☠️  Killing affected applications ☠️ "
for app in Finder Dock SystemUIServer; do killall "$app" >/dev/null 2>&1; done
