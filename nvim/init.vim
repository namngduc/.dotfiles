if exists('g:vscode')
    " VSCode extension
    source $HOME/.config/nvim/vscode.vim
else
    " ordinary neovim
    " source $HOME/.config/nvim/nvim.vim
endif
set shell=/bin/bash
let mapleader = "\<Space>"

" Map ESC to Caps_Lock and redirects the standard output and error output to
" /dev/null discarded show warning
au BufEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' 1>/dev/null 2>&1 &
au BufLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock' 1>/dev/null 2>&1 &

set nocompatible
syntax on
filetype plugin indent on " enable file type detection
set autoindent " auto indent
set number " set line number
set incsearch " incremental search (as string is being typed)
set hls " hightlight search
set lbr " line break
" set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set ttimeout
set ttimeoutlen=100
set timeoutlen=300

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4

" set clipboard^=unnamed,unnamedplus
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" smart case-sensitive search
set ignorecase
set smartcase

" Sane split
set splitright
set splitbelow

" using clipboard rather buffer on vim
set clipboard=unnamedplus

" hightlight current line
set cursorline

" quicker window movement
nnoremap <silent> <C-j> <C-w>j<CR>
nnoremap <silent> <C-k> <C-w>k<CR>
nnoremap <silent> <C-h> <C-w>h<CR>
nnoremap <silent> <C-l> <C-w>l<CR>
" quicker quit window
nnoremap <silent> ,q <C-w>q<CR>

" Quick-save
nmap <C-s> :w<CR>

" <Crt-l> redraws the screen and removes any search highlighting
nnoremap <silent> \ :nohl<CR>

" Disable arrow keys to avoid bad habits
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <Space> :echoe "Leade key"<CR>

" increase the window size by a factor of 1.5 and decrease the window size by 0.67
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Quickly select text you just pasted
nnoremap gV `[v`]

" Switch between files
nnoremap <tab> :bp<CR> " Previous buffer file
nnoremap <S-tab> :bn<CR> " Next buffer file
nnoremap <Leader><Leader>c <c-^> " The last two files

" Force save file when I forgot run 'sudo vim file' With Great Power Comes Great Responsibility
cmap w!! %!sudo tee > /dev/null %

" Rename current file
function! RenameFile()
let old_name = expand('%')
let new_name = input('New file name: ', expand('%'), 'file')
if new_name != '' && new_name != old_name
exec ':saveas ' . new_name
exec ':silent !rm ' . old_name
redraw!
endif
endfunction
nnoremap <Leader>nf :call RenameFile()<cr>

" " Required by plugin ctrlspace
" set encoding=utf-8
" set hidden

" Install vim-plug: $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" =============================================================================
" # PLUGINS
" =============================================================================
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround' " vim-surround
" if !exists('g:vscode')
Plug 'preservim/nerdcommenter' " nerdcommenter
" endif
"Tagbar"
Plug 'majutsushi/tagbar'
" vim-airline and vim-airline-theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Fuzzy finder
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'
" Autocomplete plugin
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi' " python syntax
Plug 'ncm2/ncm2-pyclang' " c/c++ syntax
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" NERDcommenter <leader>cc to comment text, <leader>cu to uncomment text
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = "left"
let g:NERDAltDelims_python = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeShowBookmarks=1
let b:NERDCommenterDelims=1

"Enable tagbar on startup"
autocmd FileType py call tagbar#autoopen(0)
nmap <F8> :TagbarToggle<CR>

" Enable automatically display all buffers (vim-airline)
let g:airline#extensions#tabline#enabled = 1
" Set theme for vim-airline-theme
" let g:airline_theme='angr'

let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](node_modules|build|public|lib|dist)|(\.(git|svn))$',
\ 'file': 'tags\|tags.lock\|tags.temp',
\ }
" nord theme
if (has("termguicolors"))
set termguicolors
endif

colorscheme codedark

" " Use <TAB> to select the popup menu (ncm2 config)
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:airline_powerline_fonts = 1
" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1
" Can be enabled or disabled add glyphs to all modes
let g:webdevicons_enable_ctrlp = 1
let g:NERDTreeLimitedSyntax = 1
" take 2 characters prefix
nmap <silent> gw <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
