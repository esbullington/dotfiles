#!/bin/bash

DOTFILES_DIR=$HOME/repos/dotfiles
HUB_VERSION=2.14.2

# bash completions
BASH_COMPLETION_DIR=$HOME/.local/share/bash-completion

# System dependencies
echo "Install system dependencies"
sudo apt-get install -y curl git vim tmux build-essential stow pass scdaemon hub wget rsync

# Symlink all dotfiles to home directory
echo "Symlinking repo dotfiles to home directory"
cd $DOTFILES_DIR
stow bash --target=$HOME --dir=$DOTFILES_DIR
stow git --target=$HOME --dir=$DOTFILES_DIR
stow tmux --target=$HOME --dir=$DOTFILES_DIR
stow vim --target=$HOME --dir=$DOTFILES_DIR
stow readline --target=$HOME --dir=$DOTFILES_DIR
stow bash-completion --target=$BASH_COMPLETION_DIR --dir=$DOTFILES_DIR

# Create environment file to store local user envvars
if [ ! -e $HOME/.bash/bash_local ]; then
    touch $HOME/.bash/bash_local
fi

# Set up new bashrc
while true; do
    read -p "Overwrite existing bashrc with dotfile bashrc?" yn
    case $yn in
        [Yy]* ) cp $DOTFILES_DIR/bash/.bashrc $HOME/.bashrc; source $HOME/.bashrc; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Install vim tools
echo "Installing vim tools"
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install conda
if ! sudo -H -u eric bash -c 'command -v $HOME/miniconda3/condabin/conda' &> /dev/null
then
	echo "conda not installed; installing now..."
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
	bash ~/miniconda.sh -b -p $HOME/miniconda
  rm ~/miniconda.sh
fi

# install hub
if ! command -v hub &> /dev/null
then
  HUB_NAME=hub-linux-amd64-$HUB_VERSION
	echo "hub not installed; installing now..."
  wget "https://github.com/github/hub/releases/download/v$HUB_VERSION/$HUB_NAME.tgz"
  tar xf $HUB_NAME.tgz
  ./$HUB_NAME/install
  rm -rf ./$HUB_NAME*
fi
