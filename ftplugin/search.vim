if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:nowait = (v:version > 703 ? '<nowait>' : '')

if !hasmapto('<Plug>(search_quit)', 'n')
  execute 'nmap '.s:nowait.'<buffer> q <Plug>(search_quit)'
endif

execute 'nnoremap '.s:nowait.'<buffer><silent> c    :<C-U>.call search#cdo()<CR>'
execute 'nnoremap '.s:nowait.'<buffer><silent> <CR> :<C-U>.call search#cdo()<CR>'
execute 'nnoremap '.s:nowait.'<buffer><silent> l    :<C-U>.call search#ldo()<CR>'

execute 'xnoremap '.s:nowait.'<buffer><silent> C    :call search#cdo()<CR>'
execute 'xnoremap '.s:nowait.'<buffer><silent> <CR> :call search#cdo()<CR>'
execute 'xnoremap '.s:nowait.'<buffer><silent> L    :call search#ldo()<CR>'

nnoremap <buffer><silent>   g?    :help search-mappings<CR>

" Force autoload if `ft=search`
if !exists('*search#open')|try|call search#open()|catch|endtry|endif
