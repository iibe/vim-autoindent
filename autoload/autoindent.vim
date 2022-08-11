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
if exists('g:autoloaded_autoindent')
    finish
endif

let g:autoloaded_autoindent = 1

function! autoindent#Autoload()
    autocmd BufWritePre * call autoindent#FixWhitespaces()
    autocmd BufWritePre * call autoindent#FixIndentation()
endfunction
