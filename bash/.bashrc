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
#conda tab completion
source ~/.local/share/bash-completion/completions/conda_complete.sh

unset __conda_setup
conda deactivate
