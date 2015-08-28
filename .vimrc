" INSTALLATION:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

filetype on
filetype plugin on

hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=white ctermbg=red

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set clipboard^=unnamed
set ruler

syntax on

" Ocaml stuff
" set rtp+=/home/eric/opt/repos/ocp-indent-vim
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
autocmd FileType ocaml setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
" for Rust
au BufRead,BufNewFile *.rs setfiletype rust
autocmd FileType rust setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" for Racket
au BufRead,BufNewFile *.rkt setfiletype scheme
autocmd FileType scheme setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" for Rust
au BufRead,BufNewFile *.rs setfiletype rust
autocmd FileType rust setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" for Nginx
au BufRead,BufNewFile *.conf setfiletype nginx
autocmd FileType nginx setlocal smartindent expandtab shiftwidth=8 softtabstop=8 tabstop=8

" for SVG
au BufRead,BufNewFile *.svg setfiletype html
" autocmd FileType svg setlocal smartindent expandtab shiftwidth=4 softtabstop=4 tabstop=4

" for XML (Android)
au BufRead,BufNewFile *.xml setfiletype xml
autocmd FileType xml setlocal smartindent expandtab shiftwidth=4 softtabstop=4 tabstop=4

" for fsharp
au BufRead,BufNewFile *.fs setfiletype fsharp
autocmd FileType fs setlocal smartindent expandtab shiftwidth=4 softtabstop=4 tabstop=4

" for yaml
au BufRead,BufNewFile *.yaml setfiletype yaml
autocmd FileType yaml setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" for java
au BufRead,BufNewFile *.java setfiletype java
autocmd FileType java setlocal smartindent expandtab shiftwidth=4 softtabstop=4 tabstop=4

" for jade
au BufRead,BufNewFile *.jade setfiletype jade
autocmd FileType jade setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

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
autocmd BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead,BufNewFile *.py setfiletype python
autocmd FileType python setlocal smartindent expandtab shiftwidth=4 softtabstop=4 tabstop=4

" Set markdown line settings
autocmd BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Set scheme line settings
autocmd BufRead *.scm set filetype=scheme lisp showmatch
" autocmd FileType scheme setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

"Trim trailing white space on save for Python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e

" For HTML and other web
autocmd BufRead *.html set smartindent filetype=html
autocmd FileType html setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType css setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType less setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd BufRead *.tmpl set filetype=html

" for SCSS
au BufRead,BufNewFile *.scss setfiletype scss
autocmd FileType scss setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" for Typescript
au BufRead,BufNewFile *.ts setfiletype typescript
autocmd FileType typescript setlocal smartindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Find/replace
" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap  <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>/

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
Bundle 'groenewege/vim-less'
Bundle 'rust-lang/rust.vim'

call tcomment#DefineType("nimrod", '# %s')

filetype plugin indent on
