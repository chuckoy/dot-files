#!/bin/sh

DF=$HOME/dot-files

echo "👺 Creating symlinks..."
links=$(find -H "$DF" -maxdepth 3 -name '*.symlink')
for f in $links; do 
    t="$HOME/.$(basename $f ".symlink")"
    if [ -e $t ]; then
        echo "~${t#$HOME} already exists; skipping..."
    else
        echo "Creating symlink for $t..."
        ln -s $f $t
    fi 
done
