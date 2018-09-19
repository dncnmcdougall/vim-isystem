function! search#open(search)
    botright 1new +set\ ft=search
    execute "normal i ".a:search
endfunction

function! search#do(location)
    quit
    let l:searchString = getline(1)
    if empty(l:searchString) 
        return
    else
        execute ':'.a:location.'getexpr system(l:searchString) | botright '.a:location.'open'
    endif
endfunction

function! search#cdo()
    search#do("c")
endfunction

function! search#ldo()
    search#do("l")
endfunction

nnoremap <silent> <Plug>(search_quit) :q
