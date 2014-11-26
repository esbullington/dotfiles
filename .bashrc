# the most important thing!
set -o vi

# API keys and other sensitive environmental variables
source ~/.environment

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

# Attaches existing tmux sessions by id
function attachit() {
  tmux attach-session -d -t "$@";
}

# Aliases
alias sb='source ~/.bashrc'
alias armory='nohup python /usr/lib/armory/ArmoryQt.py --satoshi-datadir=/home/eric/storage/opt/.bitcoin --datadir=/home/eric/oldhome/eric/.armory > /home/eric/logs/armory.log &'
alias eb='vim ~/.bashrc'
alias ee='vim ~/.environment'
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias gl='git status'
alias gp='git push'
alias grabit='tmux attach-session -d'
alias jserve='bundle exec jekyll serve'
alias makepassword='cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1'
alias showrecipients=showGPGRecipients
alias clipboard='xclip -sel clip'
alias clearhistory='history -c && history -w'
alias mitscheme='rlwrap -r -c -f "$HOME"/opt/mit-scheme/mit_scheme_bindings.txt scheme'
