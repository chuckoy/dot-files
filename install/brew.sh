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
brew install git
brew install go
brew install node
brew install python
brew install vim
brew install neovim
brew install nvm

echo "👺 Installing nice casks..."
brew install --cask visual-studio-code
brew install --cask firefox
brew install --cask iterm2
brew install --cask slack
brew install --cask spotify
brew install --cask docker
brew install --cask 1password

echo "👺 Cleanup..."
brew cleanup
