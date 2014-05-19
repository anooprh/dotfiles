#!/bin/bash

if [ -f ~/.zshrc ]; then 
    printf "Backing up existing .zshrc ... "
    mv ~/.zshrc ~/.zshrc.bkp
    printf "Done\n"
fi
printf "Setting up .zshrc ... "
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
printf "Done\n"
#chsh -s `which zsh`
# Requires root access , so commenting it out 


if [ -f ~/.vimrc ]; then 
    printf "Backing up existing .vimrc ... "
    mv ~/.vimrc ~/.vimrc.bkp
    printf "Done\n"
fi
if [ -e ~/.vim ]; then 
    printf "Backing up existing .vim ... "
    mv ~/.vim ~/.vim.bkp
    printf "Done\n"
fi
printf "Setting up .vim folder "
ln -s ~/dotfiles/vim ~/.vim
printf "Done\n"
printf "Setting up .vimrc.. "
ln -s ~/.vim/vimrc ~/.vimrc
printf "Done\n"

if [ -f ~/.tmux.conf ]; then 
    printf "Backing up existing .tmux.conf ... "
    mv ~/.tmux.conf ~/.tmux.conf.bkp
    printf "Done\n"
fi
printf "Setting up .tmux.conf ... "
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
printf "Done\n"


printf "Setting up terminator preferences"
mkdir ~/.config/terminator
ln -s ~/dotfiles/terminator/config ~/.config/terminator/config
printf "Done\n"
