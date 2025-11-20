#!/bin/bash

echo "Starting syncronization"
cp -r ./.config/ ~/.config/
cp -r ./bat/ ~/
cp -r ./.tmux/ ~/
cp -r ./.tmux.conf ~/
cp -r ./zsh/* ~/
echo "Finished syncronization"
