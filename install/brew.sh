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
brew cask install visual-studio-code
brew cask install firefox
brew cask install iterm2
brew cask install slack
brew cask install spotify
brew cask install docker
brew cask install 1password

echo "👺 Cleanup..."
brew cleanup
