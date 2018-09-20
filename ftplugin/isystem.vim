if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:nowait = (v:version > 703 ? '<nowait>' : '')

if !hasmapto('<Plug>(isystem_quit)', 'n')
  execute 'nmap '.s:nowait.'<buffer> q <Plug>(isystem_quit)'
endif

execute 'nnoremap '.s:nowait.'<buffer><silent> c    :<C-U>.call isystem#cdo()<CR>'
execute 'nnoremap '.s:nowait.'<buffer><silent> <CR> :<C-U>.call isystem#cdo()<CR>'
execute 'nnoremap '.s:nowait.'<buffer><silent> l    :<C-U>.call isystem#ldo()<CR>'

execute 'xnoremap '.s:nowait.'<buffer><silent> C    :call isystem#cdo()<CR>'
execute 'xnoremap '.s:nowait.'<buffer><silent> <CR> :call isystem#cdo()<CR>'
execute 'xnoremap '.s:nowait.'<buffer><silent> L    :call isystem#ldo()<CR>'

nnoremap <buffer><silent>   g?    :help isystem-mappings<CR>

" Force autoload if `ft=isystem`
if !exists('*isystem#open')|try|call isystem#open()|catch|endtry|endif
