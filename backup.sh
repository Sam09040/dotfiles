#!/bin/bash

echo "Starting copies"

cp -r ~/.config/nvim/ ./.config/
cp -r ~/.zshrc ./zsh/
cp -r ~/.tmux.conf ./

echo "Finished copies"
