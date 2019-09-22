" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ervandew/supertab'
Plug 'lifepillar/vim-solarized8'
call plug#end()
" }}}
" Colors {{{
syntax on
set termguicolors
set background=dark
colorscheme solarized8
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" 
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
set number relativenumber
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
set noshowmode
set splitbelow
set splitright
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
nnoremap <leader>w :w<CR>
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd BufWritePre *.py,*.java,*.cpp,*.h,*.c :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.py setlocal foldmethod=indent
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *md setlocal ft=markdown
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
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
" Auto Completion {{{
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set dictionary+=/usr/share/dict/words
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
let g:SuperTabDefaultCompletionType = "context"
" }}}
" vim:foldmethod=marker:foldlevel=0
