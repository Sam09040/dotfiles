#!/bin/bash

echo "Starting copies"

cp -r ~/.config/nvim/ ~/dotfiles/.config/
cp -r ~/.config/ghostty/ ~/dotfiles/.config/
cp -r ~/.config/yazi/ ~/dotfiles/.config/
cp -r ~/.zshrc ~/dotfiles/zsh/
cp -r ~/.p10k.zsh ~/dotfiles/zsh/
cp -r ~/bat/ ~/dotfiles
cp -r ~/.tmux.conf ~/dotfiles

echo "Finished copies"
