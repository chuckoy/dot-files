#!/bin/sh

DF=$HOME/dot-files

echo "👺 Creating symlinks..."
links=$(find -H "$DF" -maxdepth 3 -name '*.symlink')
for f in $links; do 
    t="$HOME/.$(basename $f ".symlink")"
    if [ -e $t ]; then
        printf "\t"
        echo "👺 ~${t#$HOME} already exists; skipping..."
    else
        printf "\t"
        echo "👺 Creating symlink for $t..."
        ln -s $f $t
    fi 
done

echo "𝒱 Linking neovim to vim..."
cat $DF/.config/nvim/init.vim > $HOME/.config/nvim/init.vim
