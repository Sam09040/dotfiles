#!/bin/bash

echo "Starting syncronization"
cp -r ./.config/ ~/
cp -r ./bat/ ~/
cp -r ./.tmux/ ~/
cp -r ./.tmux.conf ~/
cp -r ./zsh/.* ~/
cp -r ./scripts ~/
echo "Finished syncronization"
