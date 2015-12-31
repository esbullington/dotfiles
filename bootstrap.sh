#!/bin/bash

DOTFILES_DIR=$HOME/repos/dotfiles

# System dependencies
sudo apt-get install -y curl git vim-gtk tmux build-essential stow

# Create environment file to store local user envvars
[ ! -f $HOME/.environment ] && touch $HOME/.environment

# Symlink all dotfiles to home directory
cd $DOTFILES_DIR
stow bash --target=$HOME --dir=$DOTFILES_DIR
stow git --target=$HOME --dir=$DOTFILES_DIR
stow tmux --target=$HOME --dir=$DOTFILES_DIR
stow vim --target=$HOME --dir=$DOTFILES_DIR

# Install vim tools
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
