""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure Key Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map the leader to ,
map "," <leader>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Faster navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function Keys

" easy switching between paste and normal insert mode
set pastetoggle=<F12>

" Open FileExplorrer
noremap <silent> <F2> :Vexplore<CR>

" Easy Buffer Switching
nnoremap <F3> :buffers<CR>:buffer<Space>

" clear highliging using space
noremap <silent> <Space> :noh<CR>

" Set list toggle
noremap <silent> <F4> :set list!<CR>

