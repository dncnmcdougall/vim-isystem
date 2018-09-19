function! search#open(search)
    botright 1new +set\ ft=search
    execute "normal i ".a:search
    setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
endfunction

function! search#do(location)
    let l:searchString = getline('.')
    quit
    if empty(l:searchString) 
        return
    else
        let l:cmd = ':'.a:location.'getexpr system('.shellescape(l:searchString).') | botright '.a:location.'open'
        echom l:cmd
        execute l:cmd
    endif
endfunction

function! search#cdo()
    call search#do("c")
endfunction

function! search#ldo()
    call search#do("l")
endfunction

nnoremap <silent> <Plug>(search_quit) :q<CR>
