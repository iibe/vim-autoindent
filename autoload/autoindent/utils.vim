" Returns list of files without `.gitignore` restrictions
function! autoindent#utils#Editable() abort
    let ignore = []
    for pattern in <SID>GitIgnoreGlobbingPatterns()
        let matches = globpath('.', pattern, 0, 1)
        for path in matches
            call add(ignore, path)
        endfor
    endfor

    let codebase = <SID>GetDotFiles() + <SID>GetSrcFiles()
    let editable = []
    for path in codebase
        if isdirectory(path)
            continue
        endif
        if index(ignore, path) < 0
            call add(editable, path)
        endif
    endfor

    return editable
endfunction

" Parses CWD (current working directory) and returns paths of hidden files.
function! s:GetDotFiles() abort
    let shallow  = globpath('.', '.[^.]*', 0, 1)
    let deep = globpath('.', '.[^.]*/**/*', 0, 1)
    let hidden = shallow + deep

    return hidden
endfunction

" Parses CWD (current working directory) and returns paths of public files.
function! s:GetSrcFiles() abort
    let public = globpath('.', '**/*', 0, 1)

    return public
endfunction

" Parses .gitignore file and returns list of `globbing patterns`
function! s:GitIgnoreGlobbingPatterns() abort
    let patterns = []
    for line in <SID>FileReader('.gitignore')
        let glob = substitute(line, '\s|\n|\r', '', 'g')
        if glob == ''   | continue | endif " empty line
        if glob =~ '^#' | continue | endif " comments
        if glob =~ '^!' | continue | endif " negation
        if glob =~ '/$'
            " ignore all files in directory
            call add(patterns, glob . '**/*')
            continue
        endif
        call add(patterns, glob)
    endfor

    return patterns
endfunction

function! s:FileReader(filename) abort
    if empty(a:filename) || filereadable(expand(a:filename)) == 0
        return []
    endif

    return readfile(a:filename)
endfunction

function! s:FileWriter(filename) abort
    if empty(a:filename) || filewritable(expand(a:filename)) == 0
        return []
    endif

    " TODO
endfunction
