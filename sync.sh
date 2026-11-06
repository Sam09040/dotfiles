#!/bin/bash

echo "Starting syncronization"
cp -r ./.config/nvim/ ~/.config/
cp -r ./.config/umbriel/ ~/.config/
cp -r ./.tmux.conf ~/
cp -r ./zsh/.zshrc ~/
echo "Finished syncronization"
