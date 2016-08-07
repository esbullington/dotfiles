
" set softtabstop=4

set tabstop=4
set shiftwidth=4
set expandtab


" Must have syntastic >= 3.5.0-29
" Use Python 3 when the shebang calls for it.
" let b:syntastic_python_python_exec = 
"   \ syntastic#util#parseShebang()['exe']  =~# '\m\<python3'
"   \ ? 'python3'
"   \ : 'python'

let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_flake8_args='--ignore=E221'
