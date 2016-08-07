" INSTALLATION:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

filetype on
filetype plugin on
syntax on

" Digraphs
digraphs no 172
digraphs xr 8853
digraphs tr 8868
digraphs fa 8869

" Define map leader as comma
let mapleader = "," 

" Allow us to use bash aliases in command line
let $BASH_ENV = "~/.bash_aliases"

" allow backspace
set backspace=indent,eol,start

" Insert single char after space in normal mode
nnoremap <Space> i_<Esc>r

" Use different backup copy dir 
" so vim doesn't write multiple intermediate files to working dir
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

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

" Snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Pathogen
execute pathogen#infect()

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
"

filetype off                   " required!
filetype plugin off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " required

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'tComment'
Plugin 'tlib'
Plugin 'autoclose'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-abolish'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'frigoeu/psc-ide-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on
