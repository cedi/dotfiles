""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorschemes and themes

" Because what the world needs is yet another vim colourscheme
Plug 'neutaaaaan/iosvkem'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Additional Vim syntax highlighting for C++ (including C++11/14)
Plug 'octol/vim-cpp-enhanced-highlight'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helpers

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" Tab completion of words inside of a search ('/')
Plug 'vim-scripts/SearchComplete'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plug 'bronson/vim-trailing-whitespace', {'on': 'FixWhitespace'}

" The BClose Vim plugin for deleting a buffer without closing the window
Plug 'rbgrouleff/bclose.vim'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linter and autocompletion

" This is a linter for Go source code.
Plug 'golang/lint'

" Provide easy code formatting in Vim by integrating existing code formatters.
Plug 'chiel92/vim-autoformat', {'on': 'Autoformat'}

"  Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language Plugins

" Go development plugin for Vim
Plug 'fatih/vim-go'

" Extra plugin for golang
Plug 'vim-jp/vim-go-extra'

" deoplete.nvim source for Python
Plug 'zchee/deoplete-jedi', {'do': 'make'}

" Asynchronous Go completion for Neovim. deoplete source for Go.
Plug 'zchee/deoplete-go', {'do': 'make'}

Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Vim syntax for TOML.
Plug 'cespare/vim-toml'

call plug#end()
