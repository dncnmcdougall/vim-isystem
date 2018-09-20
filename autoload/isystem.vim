function! isystem#open(isystem)
    botright 1new +set\ ft=isystem
    execute "normal i ".a:isystem
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
endfunction

function! isystem#do(location)
    let l:isystemString = getline('.')
    quit
    if empty(l:isystemString) 
        return
    else
        let l:cmd = ':'.a:location.'getexpr system('.shellescape(l:isystemString).') | botright '.a:location.'open'
        echom l:cmd
        execute l:cmd
    endif
endfunction

function! isystem#cdo()
    call isystem#do("c")
endfunction

function! isystem#ldo()
    call isystem#do("l")
endfunction

nnoremap <silent> <Plug>(isystem_quit) :q<CR>
