if exists('g:loaded_isystem') || &cp || v:version < 700 || &cpo =~# 'C'
  finish
endif
let g:loaded_isystem = 1

command! -nargs=1 ISystem call isystem#open(<q-args>, 'c')
command! -nargs=1 CISystem call isystem#open(<q-args>, 'c')
command! -nargs=1 LISystem call isystem#open(<q-args>, 'l')
command! -nargs=1 BISystem call isystem#open(<q-args>, 'b')

