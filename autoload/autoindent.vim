" ------------------------------------------------------------------------------
" File: autoindent.vim
" Description: Provides indent functions for buffer. Simple, fast, robust,
" with no side effects.
" Author: iibe <kjiibe@gmail.com>
" Source: https://github.com/iibe/vim-autoindent
" Last Modified: 10 Aug 2022
" ------------------------------------------------------------------------------

" Test
augroup autoindent
    autocmd!
    autocmd BufWritePre <buffer> call autoindent#indent()
    autocmd BufWritePre <buffer> call autoindent#spaces()
augroup END
