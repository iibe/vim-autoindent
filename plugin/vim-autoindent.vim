" ------------------------------------------------------------------------------
" File: vim-autoindent.vim
" Description: Indent on file save
" Author: iibe <kjiibe@gmail.com>
" Source: https://github.com/iibe/vim-autoindent
" Last Modified: 10 Aug 2022
" ------------------------------------------------------------------------------

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists('g:loaded_vim-autoindent')
    finish
endif

let g:loaded_vim-autoindent = 1

function! vim-autoindent#buffer() abort
    let l:buffer = {}
    let l:buffer.id = getpos('.')[0]
    let l:buffer.offset = getpos('.')[3]
    let l:buffer.w = winwidth('%')
    let l:buffer.h = winheight('%')

    let l:buffer.cursor = {}
    let l:buffer.cursor.position = getpos('.')
    let l:buffer.cursor.x = getpos('.')[2]
    let l:buffer.cursor.y = getpos('.')[1]

    return buffer
endfunction

function! vim-autoindent#indent() abort
    let l:prev = call vim-autoindent#buffer()

    execute "normal gg=G"

    let l:curr = call vim-autoindent#buffer()

    if l:curr.cursor.x != l:prev.cursor.x  || l:curr.cursor.y != l:prev.cursor.y
        call setpos('.', prev.cursor.position)
    endif

    echo 'Format:' . ' ' .  string(l:ide.cursor.x)
endfunction

function! vim-autoindent#spaces() abort
    " autocmd BufWritePre * :%s/\s\+$//e
endfunction

function! vim-autoindent#format() abort
endfunction

function! vim-autoindent#indent_all() abort
endfunction

function! vim-autoindent#spaces_all() abort
endfunction

function! vim-autoindent#format_all() abort
endfunction

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 AiFormat call autoindent#indent()
command! -nargs=0 AiFormatAll call autoindent#indent_all()

command! -nargs=0 AiSpaces call autoindent#spaces()
command! -nargs=0 AiSpacesAll call autoindent#spaces_all()

command! -nargs=0 AiFormat call autoindent#format()
command! -nargs=0 AiFormatAll call autoindent#format_all()
