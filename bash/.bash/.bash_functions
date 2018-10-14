# Custom functions
showGPGRecipients() {
  gpg --status-fd 1 --list-only $1
}

gi() { 
  curl -L -s https://www.gitignore.io/api/"$@"
}

hashcompare() {
  if [[ $1 == $2 ]]; then echo "Match!"; else echo "No Match!"; fi
}

nicepass() {
  makepasswd --chars="${1:-16}" --string=$(python -c "import string,sys; sys.stdout.write(string.ascii_lowercase)")
}

cddir() { 
  mkdir -p "$@" && cd "$@"
}

mem() {                                                                                                      
  ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

weather() {
    curl wttr.in/?2"${1:~Elgin,SC}"
}

ssha() {
  ssh -i ~/.ssh/terraform root@$(ansible -m setup "$@" | sed -n 4p | tr -d ',"' | awk '{$1=$1;print}' | perl -pe 'chomp')
}

batik-rasterizer() {
  java -jar $HOME/opt/batik-1.8/batik-rasterizer-1.8.jar "$@"
}

clingit() {
  rlwrap $HOME/opt/cling/bin/cling "$@"
}

condaenv() {
  source opt/miniconda3/bin/activate "$@"
}

# Fetches files for a given commit
gitfiles() { 
  /usr/bin/git diff-tree --no-commit-id --name-only -r "$@";
}

smbcmd() {
 smbclient //tomato/shared_files -A $HOME/.smb -c "$@"
}

# Attaches existing tmux sessions by id
attachit() {
  tmux attach-session -d -t "$@";
}

wpwww() {
  sudo -u www-data /usr/bin/php /home/eric/bin/wp "$@";
}

# Composer
composer() {
  php $HOME/.composer/composer.phar "$@";
}

# Fingerprints of ssh public keys
fingerprints() {
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
grabtmux() {
  tmux attach-session -d -t "$1"
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
p4json() {
    python /home/eric/repos/p4lang/p4c-bm/p4c_bm/__main__.py "$@"
}
