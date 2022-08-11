" ------------------------------------------------------------------------------
" File: autoindent.vim
" Description: Provides indent functions for buffer. Simple, fast, robust,
" with no side effects.
" Author: iibe <kjiibe@gmail.com>
" Source: https://github.com/iibe/vim-autoindent
" Last Modified: 10 Aug 2022
" ------------------------------------------------------------------------------

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists('g:loaded_autoindent')
    finish
endif

let g:loaded_autoindent = 1

" Fixes indentation of the current buffer and returns cursor position at initial point.
function! autoindent#FixIndentation()
    let view = winsaveview()
    silent execute ':normal gg=G'
    call winrestview(view)
endfunction

" Fixes trailing spaces in the current buffer.
function! autoindent#FixWhitespaces()
    silent execute ':%s/\s\+$//e'
endfunction

" Reads .gitignore file
function! autoindent#GitIgnore()
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

" Goes through each file resursively (without files specified in .gitignore).
function! autoindent#Iterator()
    " TODO
endfunction

" Fixes indentation in all files (without files specified in .gitignore).
function! autoindent#AllIndentation()
    " TODO
endfunction

" Fixes trailing spaces in all files (without files specified in .gitignore).
function! autoindent#AllWhitespaces()
    " TODO
endfunction

" Fixes all stylistic errors in current file
function! autoindent#FormatFile()
    autoindent#FixWhitespaces()
    autoindent#FixIndentation()
endfunction

" Fixes stylistic errors in all files, if it's not specified in .gitignore
function! autoindent#FormatFiles()
    autoindent#AllWhitespaces()
    autoindent#AllIndentation()
endfunction

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 AiFixIndentation call autoindent#FixIndentation()
command! -nargs=0 AiAllIndentation call autoindent#AllIndentation()

command! -nargs=0 AiFixWhitespaces call autoindent#FixWhitespaces()
command! -nargs=0 AiAllWhitespaces call autoindent#AllWhitespaces()

command! -nargs=0 AiFormatFile call autoindent#FormatFile()
command! -nargs=0 AiFormatFiles call autoindent#FormatFiles()
