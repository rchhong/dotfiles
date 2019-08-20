" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'erichdongubler/vim-sublime-monokai'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle'}
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
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
set spell spelllang=en_us
inoremap jk <ESC>
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
nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>q :tabclose<CR>
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd BufWritePre *.py,*.java,*.cpp,*.h,*.c :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.py setlocal foldmethod=indent
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *md setlocal ft=markdown
augroup END
" }}}
" Functions {{{
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunc
" }}}
" vim:foldmethod=marker:foldlevel=0
