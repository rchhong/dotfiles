" Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'erichdongubler/vim-sublime-monokai'
Plugin 'altercation/vim-colors-solarized'
" }}}
" Colors {{{
syntax on
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" colorscheme sublimemonokai
" colorscheme solarized
set termguicolors
" }}}
" Misc {{{
set backspace=indent,eol,start
set clipboard^=unnamed,unnamedplus
set mouse=a
set nocompatible
"}}}
" Spaces & Tabs {{{
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI {{{
set number
set wildmenu
set lazyredraw
set showmatch
set cursorline
set laststatus=2
set showtabline=2
set wildmode=longest:full,full
set showcmd
set showmatch
set fillchars+=vert:┃
" }}}
" Searching {{{
set ignorecase
set incsearch
set hlsearch
" }}}
" NERDTree Config {{{
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
nmap <F6> :NERDTreeToggle<CR>
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" }}}
" Folding {{{
set foldenable
set foldmethod=syntax
set foldnestmax=10
set foldlevelstart=10
nnoremap <space> za
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader><space> :noh<CR>
" }}}
" vim:foldmethod=marker:foldlevel=0
