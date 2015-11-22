" INSTALLATION:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

filetype on
filetype plugin on
syntax on

" Define map leader as comma
let mapleader = "," 

" Allow us to use bash aliases in command line
let $BASH_ENV = "~/.bash_aliases"

" Use backup copy so vim doesn't write multiple intermediate files
" thus setting of file monitors like inotify
set backupcopy=yes

" Make centered file header
nnoremap <C-b> :center 40<cr>hhv0r*A<space><esc>20A*<esc>d40<bar>YppVr*kk.

" Set default register to be the same
" as the system clipboard registrar
set clipboard^=unnamedplus

" Always ruler showing
set ruler

" GLOBAL FORMATTING
" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2

" VUNDLE
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
" required! 
" My Bundles here:

filetype off                   " required!
filetype plugin off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " required
Plugin 'gmarik/Vundle.vim'
Plugin 'tComment'
Plugin 'tlib'
Plugin 'autoclose'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'nimrod.vim'
Plugin 'groenewege/vim-less'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'lfilho/cosco.vim'

filetype plugin indent on
