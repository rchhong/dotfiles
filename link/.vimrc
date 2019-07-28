set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle'}

syntax enable
set tabstop=4
set softtabstop=4
set expandtab
set number
set wildmenu
set lazyredraw
set showmatch
set mouse=r
set laststatus=2
set showtabline=2
set wildmode=longest:full,full

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
nmap <F6> :NERDTreeToggle<CR>

set foldenable
set foldmethod=syntax
set foldnestmax=10
set foldlevelstart=10
nnoremap <space> za
