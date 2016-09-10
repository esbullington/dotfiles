
if !empty(system('which opam'))
  " Merlin plugin
  let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
  let g:syntastic_ocaml_checkers=['merlin']

  " Reason plugin which uses Merlin
  let s:reasondir=substitute(system('opam config var share'),'\n$','','') . "/reason"
  execute "set rtp+=".s:reasondir."/editorSupport/VimReason"
  let g:syntastic_reason_checkers=['merlin']
else

endif
