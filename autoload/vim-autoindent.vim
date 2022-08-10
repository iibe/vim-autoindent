" ------------------------------------------------------------------------------
" File: vim-autoindent.vim
" Description: Indent on file save
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
