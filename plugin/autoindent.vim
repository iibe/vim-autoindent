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

" Exposes the plugin's functions for use as commands in Vim.
command! -nargs=0 AiFixIndentation call autoindent#FixIndentation()
command! -nargs=0 AiAllIndentation call autoindent#AllIndentation()

command! -nargs=0 AiFixWhitespaces call autoindent#FixWhitespaces()
command! -nargs=0 AiAllWhitespaces call autoindent#AllWhitespaces()

command! -nargs=0 AiFormatFile call autoindent#FormatFile()
command! -nargs=0 AiFormatFiles call autoindent#FormatFiles()
