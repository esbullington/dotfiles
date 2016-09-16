# Custom functions
showGPGRecipients() {
  gpg --status-fd 1 --list-only $1
}

function ssha() {
	ssh -i ~/.ssh/terraform root@$(ansible -m setup "$@" | sed -n 4p | tr -d ',"' | awk '{$1=$1;print}' | perl -pe 'chomp')
}

function batik-rasterizer() {
  java -jar $HOME/opt/batik-1.8/batik-rasterizer-1.8.jar "$@"
}

function clingit() {
  rlwrap $HOME/opt/cling/bin/cling "$@"
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
