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
function! autoindent#fix_indentation()
    let l:view = winsaveview()
    silent execute ':normal gg=G'
    call winrestview(l:view)
endfunction

" Fixes trailing spaces in the current buffer.
function! autoindent#fix_whitespaces()
    silent execute ':%s/\s\+$//e'
endfunction

" Fixes all at once
function! autoindent#fix_application()
    autoindent#fix#whitespaces()
    autoindent#fix#indentation()
endfunction

" Goes through each file resursively (without files specified in .gitignore).
function! autoindent#use_iterator()
    " TODO
endfunction

" Fixes indentation in all files (without files specified in .gitignore).
function! autoindent#all_indentation()
    echo "autoindent#all#indentation() was done"
endfunction

" Fixes trailing spaces in all files (without files specified in .gitignore).
function! autoindent#all_whitespaces()
    echo "autoindent#all#whitespaces() was done"
endfunction

" Fixes stylistic errors in all files at once (without files specified in .gitignore).
function! autoindent#all_application()
    echo "autoindent#all#application() was done"
endfunction

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 AiFixIndentation call autoindent#fix_indentation()
command! -nargs=0 AiAllIndentation call autoindent#all_indentation()

command! -nargs=0 AiFixWhitespaces call autoindent#fix_whitespaces()
command! -nargs=0 AiAllWhitespaces call autoindent#all_whitespaces()

command! -nargs=0 AiFixApplication call autoindent#fix_application()
command! -nargs=0 AiAllApplication call autoindent#all_application()
