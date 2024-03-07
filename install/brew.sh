#!/bin/bash

if ! [ -x "$(command -v brew)" ]
then
  echo "👺 Homebrew installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "👺 Homebrew installed! Updating..."
  brew update
  brew upgrade
fi

echo "👺 Installing Homebrew packages..."
brew install git    # keep git updated with homebrew
brew install go     # Go programming language
brew install node   # Node.js
brew install vim    # standard vim
brew install neovim # new vim
brew install nvm    # Node.js version manager
brew install gh	    # GitHub CLI

echo "👺 Installing nice casks..."
brew install --cask firefox             # internet browser
brew install --cask visual-studio-code  # code editor
brew install --cask iterm2              # better terminal
brew install --cask slack               # messaging client
brew install --cask docker              # *nix containers
brew install --cask 1password           # password manager
brew install --cask wombat              # gRPC GUI client
brew install --cask karabiner-elements  # Keyboard customiser
brew install --cask discord             # you know Discord
brew install --cask authy               # MFA client
brew install --cask rocket              # we want the emoji
brew install --cask rectangle		# nice window manipulation tool

echo "👺 Cleanup..."
brew cleanup
