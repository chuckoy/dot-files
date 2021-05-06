#!/bin/bash

echo "👺 Starting installation... 👺"

source ./install/link.sh
source ./install/brew.sh
source ./install/osx.sh
source ./install/vscode.sh

echo "Changing default shell to bash..."
chsh -s /bin/bash

echo "👺 Done installing! 👺"
exit 0
