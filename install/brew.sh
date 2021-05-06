#!/bin/bash

if ! [ -x "$(command -v brew)" ]
then
  echo "👺 Homebrew installing..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "👺 Homebrew installed! Updating..."
  brew update
  brew upgrade
fi

echo "👺 Installing Homebrew packages..."
brew install git    # keep git updated with homebrew
brew install go     # Go programming language
brew install node   # Node.js
brew install python # Python programming language
brew install vim    # standard vim
brew install neovim # new vim
brew install nvm    # Node.js version manager

echo "👺 Installing nice casks..."
brew install --cask firefox             # internet browser
brew install --cask visual-studio-code  # code editor
brew install --cask iterm2              # better terminal
brew install --cask slack               # messaging client
brew install --cask spotify             # music client
brew install --cask docker              # *nix containers
brew install --cask 1password           # password manager
brew install --cask wombat              # gRPC GUI client
brew install --cask karabiner-elements  # Keyboard customiser
brew install --cask viscosity           # VPN client

echo "👺 Cleanup..."
brew cleanup
