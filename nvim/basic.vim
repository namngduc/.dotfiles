set nocompatible

syntax on

filetype plugin indent on " enable file type dectection 
set autoindent " auto indent 

set nu
set incsearch " incremental search (as string is being typed)
set hls " hightlight search
set lbr " line break
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search 
set ignorecase
set smartcase

set splitright
set splitbelow

" using clipboard rather buffer on vim
set clipboard=unnamedplus

" highlight current line
set cursorline

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

