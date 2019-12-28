" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle'}
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'machakann/vim-sandwich'
Plugin 'ervandew/supertab'
Plugin 'wellle/targets.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'lifepillar/vim-solarized8'
Plugin 'scrooloose/nerdcommenter' 
call vundle#end()
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
set nocompatible
set spell spelllang=en_us
inoremap jk <ESC>
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
let g:lightline = {'colorscheme': 'solarized'}
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
set smartindent
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
" fzf {{{
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <C-p> :Files <C-R>=expand('%:h')<CR><CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd FileType fzf tunmap <buffer> <Esc>
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
nnoremap <leader>t :call Terminal()<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>r :Rg<CR>
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

function Terminal()
    tabnew
    terminal
    startinsert
endfunction
"}}}
" Auto Completion {{{
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set dictionary+=/usr/share/dict/words
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "	 \<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
let g:SuperTabDefaultCompletionType = "context"
" }}}
" Terminal {{{
tnoremap <C-v><Esc> <Esc>
autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
" }}}
" NERDCommenter {{{
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" }}}
" vim:foldmethod=marker:foldlevel=0
