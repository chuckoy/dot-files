#!/bin/bash

DF=$HOME/dot-files

echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "chucklogan.lim@gmail.com"

echo "Starting SSH agent..."
ssh-agent -s

t="$HOME/.ssh/config"
if ! [ -e $t ]
then
  echo "Creating ssh config file..."
  cat $DF/ssh/config >> $t
else
  echo "ssh config file already exists, skipping..."
fi

echo "Adding passphrase to keychain..."
ssh-add -K ~/.ssh/id_ed25519

echo "Pasting SSH key to clipboard..."
pbcopy < ~/.ssh/id_ed25519.pub

echo "Done! Please add SSH key to Github account"
