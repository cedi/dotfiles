" Enable autocompletion on startup
let g:deoplete#enable_at_startup = 1

" Auto remove all trailing whitespaces on write
au BufWrite * :FixWhitespace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
" expand all tabs
autocmd BufNewFile,BufRead *.py set expandtab

" set vertical line
autocmd BufRead,BufNewFile *.py set colorcolumn=81

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
