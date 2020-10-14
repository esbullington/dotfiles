#!/bin/bash

DOTFILES_DIR=$HOME/repos/dotfiles

# System dependencies
sudo apt-get install -y curl git vim tmux build-essential stow pass scdaemon hub

# Symlink all dotfiles to home directory
cd $DOTFILES_DIR
stow bash --target=$HOME --dir=$DOTFILES_DIR
stow git --target=$HOME --dir=$DOTFILES_DIR
stow tmux --target=$HOME --dir=$DOTFILES_DIR
stow vim --target=$HOME --dir=$DOTFILES_DIR
stow readline --target=$HOME --dir=$DOTFILES_DIR

# Create environment file to store local user envvars
if [ ! -e $HOME/.bash/.environment ]; then
    touch $HOME/.bash/.environment
fi

# Install vim tools
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
