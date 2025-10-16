#!/bin/bash

echo "Starting syncronization"
cp -r ~/dotfiles ~/
cp -r ~/dotfiles/.config/ ~/.config/
cp -r ~/dotfiles/bat/ ~/
cp -r ~/dotfiles/.tmux/ ~/
cp -r ~/dotfiles/.tmux.conf ~/
cp -r ~/dotfiles/zsh/ ~/
echo "Finished syncronization"
