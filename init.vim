syntax on
set tabstop=4
set softtabstop=4
set expandtab
set number
set wildmenu
set lazyredraw
set showmatch
set mouse=r
set showtabline=2
set wildmode=longest:full,full
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
nmap <F6> :NERDTreeToggle<CR>

set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=10
nnoremap <F1> za

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'erichdongubler/vim-sublime-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle'}
call plug#end()
