#!/bin/bash

echo "Starting syncronization"
cp -r ~/dotfiles/.config ~/.config/
cp -r ~/dotfiles/bat/ ~/
cp -r ~/dotfiles/.tmux ~/
cp -r ~/dotfiles/.tmux.conf ~/
echo "Finished syncronization"
