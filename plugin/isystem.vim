if exists('g:loaded_isystem') || &cp || v:version < 700 || &cpo =~# 'C'
  finish
endif
let g:loaded_isystem = 1

command! -nargs=1 ISystem call isystem#open(<q-args>)

