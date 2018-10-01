if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:nowait = (v:version > 703 ? '<nowait>' : '')

if !hasmapto('<Plug>(isystem_quit)', 'n')
  execute 'nmap '.s:nowait.'<buffer> q <Plug>(isystem_quit)'
endif

execute 'nnoremap '.s:nowait.'<buffer><silent> <CR> :<C-U>.call isystem#do()<CR>'
execute 'imap '.s:nowait.'<buffer><silent> <CR> <ESC><CR>'

execute 'xnoremap '.s:nowait.'<buffer><silent> <CR> :call isystem#do()<CR>'

nnoremap <buffer><silent>   g?    :help isystem-mappings<CR>

" Force autoload if `ft=isystem`
if !exists('*isystem#open')|try|call isystem#open()|catch|endtry|endif
