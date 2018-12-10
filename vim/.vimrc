" INSTALLATION:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

filetype on
filetype plugin on
syntax on

" Set per project .vimrc
set exrc

noremap <C-j> <C-x>
noremap <C-i> <C-a>

" Better commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Define map leader as comma
let mapleader = "," 

" Allow us to use bash aliases in command line
let $BASH_ENV = "~/.bash_aliases"

" Insert single char after space in normal mode
nnoremap <Space> i_<Esc>r

" No temp files
set noundofile
set noswapfile
set nobackup 

" Always ruler showing
set ruler

" GLOBAL FORMATTING
" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2
set expandtab

" Pathogen
execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tComment'
Plugin 'autoclose'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-abolish'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Ensure per project .vimrc is secure
set secure
