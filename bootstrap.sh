#!/bin/bash

DOTFILES_DIR=$HOME/repos/dotfiles

# System dependencies
sudo apt-get install -y curl git tmux build-essential stow

# Symlink all dotfiles to home directory
cd $DOTFILES_DIR
stow bash --target=$HOME --dir=$DOTFILES_DIR
stow git --target=$HOME --dir=$DOTFILES_DIR
stow tmux --target=$HOME --dir=$DOTFILES_DIR
stow vim --target=$HOME --dir=$DOTFILES_DIR
stow xmonad --target=$HOME --dir=$DOTFILES_DIR
stow X --target=$HOME --dir=$DOTFILES_DIR

# Create environment file to store local user envvars
if [ ! -e $HOME/.bash/.environment ]; then
    touch $HOME/.bash/.environment
fi

# Create secrets file to store local user secrets
if [ ! -e $HOME/.bash/.secrets ]; then
    touch $HOME/.bash/.secrets
fi

# Install vim tools
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
