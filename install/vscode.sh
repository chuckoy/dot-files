#!/bin/sh

DF=$HOME/dot-files

echo "👾 Installing/Updating VS Code extensions..."

vscodeext="$DF/vscode/extensions"

while IFS= read -r ext; do
  echo "👾 Installing $ext..."
  code --install-extension "$ext" --force
done < "$vscodeext"
