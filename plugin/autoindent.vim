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

function! autoindent#indent()
    let view = winsaveview()
    " execute 'normal gg=G'
    silent normal gg=G
    call winrestview(view)
    echo "autoindent#indent() was done"
endfunction

function! autoindent#spaces()
    " autocmd BufWritePre * :%s/\s\+$//e
    echo "autoindent#spaces() was done"
endfunction

function! autoindent#format()
    echo "autoindent#format() was done"
endfunction

function! autoindent#indent_all()
    echo "autoindent#indent_all() was done"
endfunction

function! autoindent#spaces_all()
    echo "autoindent#spaces_all() was done"
endfunction

function! autoindent#format_all()
    echo "autoindent#format_all() was done"
endfunction

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 AiIndent call autoindent#indent()
command! -nargs=0 AiIndentAll call autoindent#indent_all()

command! -nargs=0 AiSpaces call autoindent#spaces()
command! -nargs=0 AiSpacesAll call autoindent#spaces_all()

command! -nargs=0 AiFormat call autoindent#format()
command! -nargs=0 AiFormatAll call autoindent#format_all()
