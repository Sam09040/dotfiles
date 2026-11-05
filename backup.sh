#!/bin/bash

echo "Starting copies"

cp -r ~/.config/nvim/ ./.config/
cp -r ~/.config/umbriel/ ./.config/
cp -r ~/.zshrc ./zsh/

echo "Finished copies"
