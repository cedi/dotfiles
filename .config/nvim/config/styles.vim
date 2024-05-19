""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Style settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='deus'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other vim style stuff

" enable 256 colors
set t_Co=256

" enable line number
set number

" enable relative number also results in hybrid numbering
set relativenumber

" Set cursor line
set cursorline

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" Enable syntax highlighting
syntax enable

" Set colorscheme
colorscheme Iosvkem

" make netrw look like NERDTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Use a better indent marker
let g:indentLine_char = '⦙'

" better lint icons
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" I hate auto folding because I always forget how to unfold again... :D
set foldlevel=99
