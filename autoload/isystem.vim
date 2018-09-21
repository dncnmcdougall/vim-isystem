function! isystem#open(isystem, result)
    botright 1new +set\ ft=isystem
    call setline(1,a:isystem)
    " execute "normal i ".a:isystem
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
    let b:isystem_location = a:result
endfunction

function! isystem#do()
    let l:isystemString = shellescape(escape(getline('.'),"|"))
    let l:isystemString = substitute(l:isystemString, "'\\\\''",'"',"g")

    if !exists('b:isystem_location')
        let l:location = 'c'
    else
        let l:location = b:isystem_location
    endif

    quit
    if empty(l:isystemString) 
        return
    elseif l:location == 'c' || l:location == 'l'
        let l:cmd = ':'.l:location.'getexpr system('.l:isystemString.') | botright '.l:location.'open'
        execute l:cmd
    else
        botright new 
        let l:result = system(''.l:isystemString)
        call append(0,l:result)
    endif
endfunction

nnoremap <silent> <Plug>(isystem_quit) :q<CR>
