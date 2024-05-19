""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable utf-8 everywhere
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" make backspace works properly
set backspace=2

" enable mouse
if has("mouse")
	set mouse=a
endif

" use system clipboard
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define search options
set ignorecase
set smartcase
set incsearch
set hlsearch
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup indention and spaces to tab/tab to spaces conversion
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer settings
" allow a unsaved buffer to be hidden
set hidden

if has("autocmd")
	" When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
		  \ endif
endif " if hash("autocmd")


