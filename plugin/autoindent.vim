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

" Fixes indentation of current buffer and returns cursor at initial position.
function! autoindent#fix#indentation()
    let l:view = winsaveview()

    silent execute ':normal gg=G'

    call winrestview(l:view)
endfunction

" Fixes trailing spaces
function! autoindent#fix#whitespaces()
    silent execute ':%s/\s\+$//e'
endfunction

" Fixes all at once
function! autoindent#fix#application()
    autoindent#fix#whitespaces()
    autoindent#fix#indentation()
endfunction

function! autoindent#use#readthrough()
    " todo: go throught
endfunction

function! autoindent#all#indentation()
    echo "autoindent#all#indentation() was done"
endfunction

function! autoindent#all#whitespaces()
    echo "autoindent#all#whitespaces() was done"
endfunction

function! autoindent#all#application()
    echo "autoindent#all#application() was done"
endfunction

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 AiFixIndentation call autoindent#fix#indentation()
command! -nargs=0 AiAllIndentation call autoindent#all#indentation()

command! -nargs=0 AiFixWhitespaces call autoindent#fix#whitespaces()
command! -nargs=0 AiAllWhitespaces call autoindent#all#whitespaces()

command! -nargs=0 AiFixApplication call autoindent#fix#application()
command! -nargs=0 AiAllApplication call autoindent#all#application()
