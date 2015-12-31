# the most important thing!
set -o vi

# No annoying bells
set bell-style none

# API keys and other sensitive environmental variables
source ~/.environment

# Ensure a display is set
export DISPLAY=:0.0

# AWS CLI command completion
complete -C aws_completer aws

# Various path additions
PATH=$PATH:$HOME/bin
export PATH

# "Herodotus was the father of history, you know"
export HISTSIZE=50000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignorespace:ignoredups

# Custom functions
showGPGRecipients() {
  gpg --status-fd 1 --list-only $1
}

# Fetches files for a given commit
function gitfiles() { 
  /usr/bin/git diff-tree --no-commit-id --name-only -r "$@";
}

function smbcmd() {
 smbclient //tomato/shared_files -A $HOME/.smb -c "$@"
}

# Attaches existing tmux sessions by id
function attachit() {
  tmux attach-session -d -t "$@";
}

function wpwww() {
  sudo -u www-data /usr/bin/php /home/eric/bin/wp "$@";
}

# Composer
function composer() {
  php $HOME/.composer/composer.phar "$@";
}

# Fingerprints of ssh public keys
function fingerprints() {
  local file="$1"
  while read l; do
    [[ -n $l && ${l###} = $l ]] && ssh-keygen -l -f /dev/stdin <<<$l
  done < $file
}

# Image optimization tools
# Via Rob W at:
# http://stackoverflow.com/a/19327447
png() {
    pngcrush -brute "$1"{,.} && du -b "$1"{,.}
}
gif() {
    gifsicle -O "$1" -o "$1." && du -b "$1"{,.}
}
jpeg() {
    jpegtran "$1" > "$1." && du -b "$1"{,.}
}
# Just for easy access in history
mpng() {
    mv "$1"{.,}
}
mgif() {
    newsize=$(wc -c <"$1.")
    oldsize=$(wc -c <"$1")
    if [ $oldsize -gt $newsize ] ; then
        mv "$1"{.,}
    else
        rm "$1."
    fi  
}
mjpeg() {
    mv "$1"{.,}
}

source $HOME/.bash_aliases
