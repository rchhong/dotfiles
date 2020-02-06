" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin Manager
Plugin 'VundleVim/Vundle.vim'
" Status bar at bottom
Plugin 'itchyny/lightline.vim'
" File explorer
Plugin 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle'}
" File finding
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" Allows easy change of surrounding characters
Plugin 'machakann/vim-sandwich'
" Makes tab do more things
Plugin 'ervandew/supertab'
" Adds more context targets
Plugin 'wellle/targets.vim'
" Allow indention level as context target
Plugin 'michaeljsmith/vim-indent-object'
" Solarized theme
Plugin 'lifepillar/vim-solarized8'
" Makes commenting/uncommenting easier
Plugin 'scrooloose/nerdcommenter' 
call vundle#end()
" }}}
" Colors {{{
" Syntax highlighting
syntax on
" Full-color support
set termguicolors
" Dark background
set background=dark
" Solarized color scheme
colorscheme solarized8
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" }}}
" Misc {{{
" Makes backspace more intuitive
set backspace=indent,eol,start
" Copy/paste to outside vim
set clipboard^=unnamed,unnamedplus
" Mouse support lol
set mouse=a
" Required for any vimrc
set nocompatible
" Spellcheck US Workds
set spell spelllang=en_us
" Remaps escape
inoremap jk <ESC>
" Use Ctrl-O and Ctrl-I when jumping multiple lines
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
" Solarized theme for lightline
let g:lightline = {'colorscheme': 'solarized'}
" Toggle paste mode
set pastetoggle=<F3>
"}}}
" Spaces & Tabs {{{
" Required stuff
filetype indent on
filetype plugin on
" Existing tabs show as 4 spaces
set tabstop=4
set softtabstop=4
" 4 Spaces when using >
set shiftwidth=4
" Tabs are now 4 spaces
set expandtab
" Enable modelines
set modelines=1
" Turns auto indent on
set autoindent
" }}}
" UI {{{
" Relative numbers
set number relativenumber
" Shows options when hitting tab on command mode
set wildmenu
" Optimize performance
set lazyredraw
" Jumps to other brace when adding one
set showmatch
" Highlights current line
set cursorline
" Always display status bar
set laststatus=2
" Always display tab bar
set showtabline=2
" Make command line completion more intuitive
set wildmode=longest:full,full
" Shows command mode text
set showcmd
" Change split character
set fillchars+=vert:┃
" Don't show current mode (due to lightline)
set noshowmode
" When splitting, start from Bottom and Right
set splitbelow
set splitright
" Don't break line at word
set linebreak
" }}}
" Searching {{{
" Ignore case when searching
set ignorecase
" Unless we use caps in search
set smartcase
" Enables incremental search (move highlight as we add characters) 
set incsearch
" Highlights 
set hlsearch
" }}}
" NERDTree Config {{{
" Show hidden files
let NERDTreeShowHidden=1
" Close NERDTree when opening file
let NERDTreeQuitOnOpen=1
" Toggles NERDTree
nmap <F6> :NERDTreeToggle<CR>
" }}}
" fzf {{{
" Enables per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Mirrors ctrl-P functionality
nnoremap <C-p> :Files <C-R>=expand('%:h')<CR><CR>
autocmd! FileType fzf
" Makes pop-up window look less goofy
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Cancels fzf
autocmd FileType fzf tunmap <buffer> <Esc>
" }}}
" Folding {{{
" Enables folding
set foldenable
" Fold by syntax by default
set foldmethod=syntax
" Set max folds
set foldnestmax=10
" Close some folds
set foldlevelstart=10
" Use space to open folds
nnoremap <space> za
" }}}
" Leader Shortcuts {{{
let mapleader=","
" Disable search highlight
nnoremap <leader><space> :noh<CR>
" Pick first result fix spelling
nnoremap <leader>f 1z=
" Toggle spelling
nnoremap <leader>s :set spell!<CR>
" Close current tab
nnoremap <leader>q :tabclose<CR>
" Write current buffer
nnoremap <leader>w :w<CR>
" Open terminal in other window
nnoremap <leader>t :call Terminal()<CR>
" Calls the Silver Surfer (UT Server doesn't have RigGrep
nnoremap <leader>a :Ag<CR>
" Calls RigGrep
nnoremap <leader>r :Rg<CR>
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    " Removes all extraneous whitespace upon closing file
    autocmd BufWritePre *.py,*.java,*.cpp,*.h,*.c :call <SID>StripTrailingWhitespaces()
    " Groups splits by tab in pyhthon
    autocmd BufEnter *.py setlocal foldmethod=indent
    " Changes tab back to actual tab (makefiles break otherwise)
    autocmd BufEnter Makefile setlocal noexpandtab
    " Relative numbers in command mode, Absolute in insert
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
" }}}
" Functions {{{
" Removes all extraneous whitespace
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunc

" Makes new terminal in new tab
function Terminal()
    tabnew
    terminal
    startinsert
endfunction
"}}}
" Auto Completion {{{
" Turns on auto completion
set omnifunc=syntaxcomplete#Complete
" Longest common text shows up, window still shows up with only one option
set completeopt=longest,menuone
" Dictionary configuration
set dictionary+=/usr/share/dict/words
" Makes navigation of omnimenu more natural
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "	 \<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" Menu item always highlighted
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" Automatically start at longest match
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" Open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" Open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" Make SuperTab work with autocompetion
let g:SuperTabDefaultCompletionType = "context"
" }}}
" Terminal {{{
" Swap between terminal and normal mode
tnoremap <C-v><Esc> <Esc>
" Makes escape work in terminal
autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
" }}}
" NERDCommenter {{{
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" }}}
" Lightline {{{
" Fixes random box with x in top-right corner
let g:lightline = {
    \   'tabline': {
    \     'left': [ ['tabs'], ['bufferline'] ],
    \     'right': []
    \   },
    \ }
" }}}
" vim:foldmethod=marker:foldlevel=0
