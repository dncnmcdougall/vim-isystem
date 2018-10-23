function! isystem#open(isystem, location)
    let l:cedit=&cedit
    let l:prefix = toupper(a:location)
    call feedkeys(":".l:prefix."ISystemDo ".a:isystem.l:cedit, "t")
endfunction

function! isystem#do(isystemString, location)
    let l:isystemString = shellescape(escape(a:isystemString,"|"))
    let l:isystemString = substitute(l:isystemString, "'\\\\''",'"',"g")

    if empty(a:isystemString) 
        return
    elseif a:location == 'c' || a:location == 'l'
        let l:cmd = ':'.a:location.'getexpr system('.l:isystemString.') | botright '.a:location.'open'
        execute l:cmd
    else
        botright new 
        let l:result = system(''.l:isystemString)
        call append(0,l:result)
    endif
endfunction

nnoremap <silent> <Plug>(isystem_quit) :q<CR>
