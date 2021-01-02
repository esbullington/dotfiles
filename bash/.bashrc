# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f ~/.bash/bash_main ]; then
  . ~/.bash/bash_main
fi

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eric/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eric/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/eric/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eric/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# opam configuration
test -r /home/eric/.opam/opam-init/init.sh && . /home/eric/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
