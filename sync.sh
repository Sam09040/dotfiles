#!/bin/bash

echo "Starting syncronization"
cp -r ~/dotfiles/.config/nvim/ ~/.config/
cp -r ~/dotfiles/.tmux.conf ~/
cp -r ~/dotfiles/zsh/.zshrc ~/
echo "Finished syncronization"
