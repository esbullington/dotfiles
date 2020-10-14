#!/bin/bash

DOTFILES_DIR=$HOME/repos/dotfiles

# System dependencies
echo "Install system dependencies"
sudo apt-get install -y curl git vim tmux build-essential stow pass scdaemon hub

# Symlink all dotfiles to home directory
echo "Symlinking repo dotfiles to home directory"
cd $DOTFILES_DIR
stow bash --target=$HOME --dir=$DOTFILES_DIR
stow git --target=$HOME --dir=$DOTFILES_DIR
stow tmux --target=$HOME --dir=$DOTFILES_DIR
stow vim --target=$HOME --dir=$DOTFILES_DIR
stow readline --target=$HOME --dir=$DOTFILES_DIR

# Create environment file to store local user envvars
if [ ! -e $HOME/.bash/bash_local ]; then
    touch $HOME/.bash/bash_local
fi

# Set up new bashrc
while true; do
    read -p "Overwrite existing bashrc with dotfile bashrc?" yn
    case $yn in
        [Yy]* ) cp bashrc $HOME/.bashrc; source $HOME/.bashrc; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Install vim tools
echo "Installing vim tools"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
