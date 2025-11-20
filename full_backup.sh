#!/bin/bash

echo "Starting copies"

cp -r ~/.config/nvim/ ./.config/
cp -r ~/.config/ghostty/ ./.config/
cp -r ~/.config/yazi/ ./.config/
cp -r ~/.zshrc ./zsh/
cp -r ~/.p10k.zsh ./zsh/
cp -r ~/bat/ ./
cp -r ~/.tmux.conf ./

echo "Finished copies"
