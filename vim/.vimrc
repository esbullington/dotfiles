" INSTALLATION:

filetype on
filetype plugin on
syntax on
" incremental search
set incsearch

" backup copy
set backupcopy=yes

" Allow us to use bash aliases in command line
let $BASH_ENV = "~/.bash_aliases"

" Enable solarized theme
let g:airline_theme='solarized'

" No temp files
set noundofile
set noswapfile
set nobackup

" search settings
set incsearch
" set hlsearch
nnoremap <CR> :noh<CR><CR>

" Proper default spacing
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

set nocompatible


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" Make sure you use single quotes
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" Initialize plugin system
call plug#end()
