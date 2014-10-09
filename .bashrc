
# the most important thing!
set -o vi

# API keys and other sensitive environmental variables
source ~/.environment

# Various path additions
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/opt/nimrod_0.9.4_linux_amd64/bin
PATH=$PATH:$HOME/opt/nimrod_0.9.4_linux_amd64/compiler/c2nim
PATH=$PATH:$HOME/repos/openocd/src
PATH=$PATH:$HOME/repos/bitnotify/node_modules/bower/bin
export PATH

# Go
export GOPATH=$HOME/scripts/golang
export GOROOT=$HOME/opt/go
export PATH=$PATH:$GOPATH/bin

# NodeJs
export NODE_PATH=$NODE_PATH:/home/eric/.local/share/npm/lib/node_modules
PATH=$PATH:$HOME/opt/node-v0.10.30-linux-x64/bin
PATH=$PATH:$HOME/.local/share/npm/bin
export PATH

# Java
JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export JAVA_HOME
PATH=$JAVA_HOME/bin:$PATH
export PATH

# Android
export PATH=$PATH:$HOME/opt/adt-bundle-linux-x86_64/sdk/tools
export PATH=$PATH:$HOME/opt/adt-bundle-linux-x86_64/sdk/platform-tools
export NDK=$PATH:$HOME/opt/android-ndk-r9d
export PATH=$PATH:$NDK

# Custom functions
showGPGRecipients() {
  gpg --status-fd 1 --list-only $1
}

# Aliases
alias sb='source ~/.bashrc'
alias armory='nohup python /usr/lib/armory/ArmoryQt.py --satoshi-datadir=/home/eric/storage/opt/.bitcoin --datadir=/home/eric/oldhome/eric/.armory > /home/eric/logs/armory.log &'
alias eb='vim ~/.bashrc'
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias grabit='tmux attach-session -d'
alias jserve='bundle exec jekyll serve'
alias makepassword='cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1'
alias showrecipients=showGPGRecipients
