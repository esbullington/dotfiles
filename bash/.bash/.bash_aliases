shopt -s expand_aliases  
# Aliases
alias sb='source ~/.bashrc'
alias st='tmux source-file ~/.tmux.conf'
alias armory='nohup python /usr/lib/armory/ArmoryQt.py --satoshi-datadir=/home/eric/storage/opt/.bitcoin --datadir=/home/eric/oldhome/eric/.armory > /home/eric/logs/armory.log &'
alias rusti='rlwrap rustup run nightly-2016-08-01 ~/.cargo/bin/rusti'
alias eb='vim ~/.bashrc'
alias ee='vim ~/.bash/.environment'
alias ea='vim ~/.bash/.bash_aliases'
alias es='vim ~/.bash/.secrets'
alias ev='vim ~/.vimrc'
alias ek='vim ~/.config/kak/kakrc'
alias et='vim ~/.tmux.conf'
alias gl='git status'
alias gvim='vim.gtk'
alias gp='git push'
alias git=hub
alias scalabootstrap='sbt new sbt/scala-seed.g8'
alias blogdate='date +"%Y-%m-%d"'
alias grabit='tmux attach-session -d'
alias jserve='bundle exec jekyll serve'
alias makepassword='cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1'
alias makehash='cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 16 | head -n 1'
alias showrecipients=showGPGRecipients
alias clearhistory='history -c && history -w'
alias mitscheme='rlwrap -r -c -f "$HOME"/opt/mit-scheme/mit_scheme_bindings.txt scheme'
alias javarepl='java -jar $HOME/bin/javarepl-428.jar'
alias qrepl='rlwrap q'
# `clipcopy' copies and `clippaste' pastes'
alias clipboard='xclip -sel clip'
alias xclipcopy='xclip -selection clipboard'
alias xclippaste='xclip -selection clipboard -o'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

