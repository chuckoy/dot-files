#!/bin/sh

DF=$HOME/dot-files

echo "👾 Installing/Updating VS Code extensions..."

vscodeext="$DF/vscode/extensions"

while read ext || [[ -n $ext ]];
  echo "👾 Installing $ext..."
  do code --install-extension "$ext" --force
done < $vscodeext
