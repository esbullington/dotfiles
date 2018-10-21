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

" Digraphs
digraphs no 172
digraphs xr 8853
digraphs tr 8868
digraphs fa 8869

" Better commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Define map leader as comma
let mapleader = "," 

" Allow us to use bash aliases in command line
let $BASH_ENV = "~/.bash_aliases"

" allow backspace
set backspace=indent,eol,start

" Insert single char after space in normal mode
nnoremap <Space> i_<Esc>r

" No temp files
set noundofile
set noswapfile
set nobackup 

" Make centered file header
" nnoremap <C-b> :center 40<cr>hhv0r*A<space><esc>20A*<esc>d40<bar>YppVr*kk.

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
set expandtab

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
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-abolish'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'frigoeu/psc-ide-vim'
Plugin 'reasonml-editor/vim-reason'
Plugin 'rhysd/vim-wasm'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ocaml_checkers = ['merlin']

" Ensure per project .vimrc is secure
set secure
