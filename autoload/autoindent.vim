" ------------------------------------------------------------------------------
" File: autoindent.vim
" Description: Provides indent functions for buffer. Simple, fast, robust,
" with no side effects.
" Author: iibe <kjiibe@gmail.com>
" Source: https://github.com/iibe/vim-autoindent
" Last Modified: 10 Aug 2022
" ------------------------------------------------------------------------------

" augroup AutoindentSession
"     autocmd!
"     autocmd BufWritePre * call autoindent#Buffer()
" augroup END

" Fixes indentation of the current buffer and returns cursor position at initial point.
function! autoindent#BufferIndentation() abort
    let view = winsaveview()
    silent execute ':normal gg=G'
    call winrestview(view)
endfunction

" Fixes trailing spaces in the current buffer.
function! autoindent#BufferWhitespaces() abort
    silent execute ':%s/\s\+$//e'
endfunction

" Fixes all stylistic errors in current file
function! autoindent#Buffer() abort
    call autoindent#BufferWhitespaces()
    call autoindent#BufferIndentation()
endfunction

" Fixes indentation in all files (without files specified in .gitignore).
function! autoindent#FolderIndentation() abort
    let editable = autoindent#utils#Editable()
    for path in editable
        silent execute ':edit ' . path
        call autoindent#BufferIndentation()
        silent execute ':write'
        silent execute ':bdelete'
    endfor
    echo editable
endfunction

call autoindent#FolderIndentation()

" Fixes trailing spaces in all files (without files specified in .gitignore).
function! autoindent#FolderWhitespaces() abort
    " TODO
endfunction

" Fixes stylistic errors in all files, if it's not specified in .gitignore
function! autoindent#Folder() abort
    call autoindent#FolderWhitespaces()
    call autoindent#FolderIndentation()
endfunction
