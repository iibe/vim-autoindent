# vim-autoindent

Provides indent functions for buffer. Simple, fast, robust, with no side effects.

## Installation

Install using your favorite package manager, or manually:

### Plugin Manager

For [Pathogen](https://github.com/tpope/vim-pathogen):

```bash
git clone https://github.com/iibe/vim-autoindent ~/.vim/bundle/vim-autoindent
```

> Remember to run `:Helptags` to generate help tags.

For [neobundle.vim](https://github.com/shougo/neobundle.vim):

```vim
NeoBundle 'vim-autoindent/vim-autoindent'
```

For [Vundle.vim](https://github.com/vundlevim/vundle.vim):

```vim
Plugin 'vim-autoindent/vim-autoindent'
```

For [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'iibe/vim-autoindent'
```

For [vim-addon-manager](https://github.com/marcweber/vim-addon-manager):

```vim
call vam#ActivateAddons([ 'vim-autoindent' ])
```

For [dein.vim](https://github.com/shougo/dein.vim):

```vim
call dein#add('vim-autoindent/vim-autoindent')
```

For [minpac](https://github.com/k-takata/minpac):

```vim
call minpac#add('vim-autoindent/vim-autoindent')
```

### Manual

For [Neovim](https://neovim.io):

```bash
git clone https://github.com/iibe/vim-autoindent.git ~/.config/nvim/plugged/vim-autoindent
```

For [Vim](https://www.vim.org):

```bash
git clone https://github.com/iibe/vim-autoindent.git ~/.vim/bundle/vim-autoindent
```

For [Vim 8](https://www.vim.org) (pack):

```bash
git clone https://github.com/iibe/vim-autoindent ~/.vim/pack/dist/start/vim-autoindent
```

> Remember to run `:helptags ~/.vim/pack/dist/start/vim-autoindent/doc` to generate help tags.

## Setup

Keymap configuration example:

```vim
nnoremap <silent> <leader>ib  :VaiBuffer<CR>
nnoremap <silent> <leader>ibi :VaiBufferIndentation<CR>
nnoremap <silent> <leader>ibw :VaiBufferWhitespaces<CR>

nnoremap <silent> <leader>if  :VaiFolder<CR>
nnoremap <silent> <leader>ifi :VaiFolderIndentation<CR>
nnoremap <silent> <leader>ifw :VaiFolderWhitespaces<CR>
```

Format-on-save for current file:

````vim

autocmd BufWritePre \* call autoindent#FixBuffer()
    ```

    Format-on-save for all project (without `.gitignore` files):

        ```vim

autocmd BufWritePre \* call autoindent#FixFolder()
    ```

## Troubleshooting

    - If you get an error during installation, try to visit official repository for your package manager (since it's probably some typo or guide it outdated by itself).
    - If you have any suggestions for how the plugin works, feel free to do [pull request][pr].

## Feedback

    - If you think [vim-autoindent][repo] is useful, consider giving it a star.
    - If you have a bug or an idea, feel free to open an [issue][issues].

    [repo]: https://github.com/iibe/vim-autoindent
    [pr]: https://github.com/iibe/vim-autoindent/pulls
    [issues]: https://github.com/iibe/vim-autoindent/issues
    ````
