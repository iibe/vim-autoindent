function! autoindent#utils#Iterator() abort
    " TODO
endfunction

function! autoindent#utils#GitIgnore() abort
    " silent execute 'set wildignore=' . argument
    echo s:GitIgnorePaths()
endfunction

call autoindent#utils#GitIgnore()

" Reads .gitignore file
function! s:GitIgnorePaths() abort
    let filename = '.gitignore'
    let entities = []
    for line in readfile(filename)
        let glob = substitute(line, '\s|\n|\r', '', 'g')
        if glob =~ '^#' | continue | endif
        if glob == ''   | continue | endif
        if glob =~ '^!' | continue | endif
        if glob =~ '/$'
            call add(entities, glob . '*')
            continue
        endif
        call add(entities, glob)
    endfor
    return entities
endfunction

function! s:FileReader() abort
    " TODO
endfunction

function! s:FileWriter() abort
    " TODO
endfunction

