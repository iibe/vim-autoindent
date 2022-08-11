function! autoindent#utils#Iterator() abort
    " TODO
endfunction

function! autoindent#utils#GitIgnore() abort
    return s:GitIgnoreFiles()
endfunction

" Reads .gitignore file
function! s:GitIgnoreFiles() abort
    let filename = '.gitignore'
    let entities = ''
    for linelist in readfile(filename)
        let line = substitute(linelist, '\s|\n|\r', '', "g")
        if line =~ '^#' | con | endif
        if line == ''   | con | endif
        if line =~ '^!' | con | endif
        if line =~ '/$' | let entities .= ',' . line . '*' | con | endif
        let entities .= ',' . line
    endfor
    let argument = substitute(entities, '^,', '', 'g')
    " silent execute 'set wildignore=' . argument
    echo entities
    echo argument
    return argument
endfunction

function! s:FileReader() abort
    " TODO
endfunction

function! s:FileWriter() abort
    " TODO
endfunction

