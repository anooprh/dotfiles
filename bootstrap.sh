#!/bin/bash

if [ -f ~/.zshrc ]; then 
    printf "Backing up existing zshrc... "
    mv ~/.zshrc ~/.zshrc.bkp
    printf "Done\n"
fi

printf "Setting up zshrc... "
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
printf "Done\n"
