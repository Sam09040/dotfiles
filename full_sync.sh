#!/bin/bash

echo "Starting syncronization"
cp -r ./.config/ ~/
cp -r ./bat/ ~/
cp -r ./.tmux/ ~/
cp -r ./zsh/.* ~/
cp -r ./scripts ~/
cp ./.tmux.conf ~/
cp ./.gitconfig ~/
echo "Finished syncronization"
