if exists('g:loaded_search') || &cp || v:version < 700 || &cpo =~# 'C'
  finish
endif
let g:loaded_search = 1

command! -nargs=1 Search call search#open(<q-args>)

