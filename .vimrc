" filetype on
filetype plugin on

hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=white ctermbg=red

syntax on

" for Rust
au BufRead,BufNewFile *.rs setfiletype rust
autocmd FileType rust setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" for ejs
au BufRead,BufNewFile *.ejs setfiletype html

" for Nimrod
au BufRead,BufNewFile *.nim setfiletype nimrod 
autocmd FileType nimrod setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2 
	\ cinwords=if,else,elif,for,of,while,try,except,finally,proc,suite,test

" autocmd BufWritePre *.go Fmt
au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go setlocal smartindent expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Set python line settings
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4

"Trim trailing white space on save for Python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e

" For HTML and other web
autocmd BufRead *.html set smartindent filetype=html
autocmd FileType html setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

call pathogen#infect()

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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tComment'
Bundle 'tlib'
Bundle 'surround.vim'
Bundle 'Blackrush/vim-gocode'
Bundle 'nimrod.vim'

call tcomment#DefineType("nimrod", '# %s')

filetype plugin indent on
