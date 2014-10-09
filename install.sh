
# Create environment file to store local user envvars
[ ! -f $HOME/.environment ] && touch $HOME/.environment

# Symlink all dotfiles to home directory
IFS=$'\n'; for f in $(find $PWD -name ".*" -type f); do echo $f $HOME/$(basename $f); done;

# System dependencies
sudo apt-get install curl, git, vim-gtk, tmux, build-essential

# Install vim tools
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
