" Required for any vimrc
set nocompatible
" Plugins {{{
source ~/.vim/plugins.vim

" }}}
" Colors {{{
" Syntax highlighting
syntax on

" Full-color support
set termguicolors

" Dark background
set background=dark

" Color Scheme
colorscheme molokai

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" }}}
" Misc {{{
" Possibly needed in vim, but not neovim
" set encoding=utf-8

" Makes backspace more intuitive
set backspace=indent,eol,start

" Copy/paste to outside vim
set clipboard^=unnamed,unnamedplus

" Mouse support lol
set mouse=a

" Spellcheck US Words
set spell spelllang=en_us

" Remaps escape
inoremap jk <ESC>

" Use Ctrl-O and Ctrl-I when jumping multiple lines
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

" Toggle paste mode
set pastetoggle=<F3>

" Reload vimrc
command! Reload :so ~/.vimrc

" Hide buffers
set hidden

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

" Ignore certain types of files
set wildignore+=*.pyc,*.o,*.class,*.DS_Store,*/node_modules/*,*/.git/*,*/build/*

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
" netrw {{{

" Disabled (too buggy)
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
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

" Change to two spaces depending on the language
function TwoSpaces()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunc
"}}}
" Auto Completion {{{
" DISABLE IN FAVOR OF COC (for now)
" Turns on auto completion
" set omnifunc=syntaxcomplete#Complete

" Longest common text shows up, window still shows up with only one option
" set completeopt=longest,menuone

" Dictionary configuration
" set dictionary+=/usr/share/dict/words


" Makes navigation of omnimenu more natural
" inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "	 \<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" Menu item always highlighted
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Automatically start at longest match
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Open omni completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
           " \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" Open user completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
           " \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" }}}
" {{{ Autoclose
"autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"autoclose with ; and position cursor to write text inside
inoremap '; '';<left><left>
inoremap `; ``;<left><left>
inoremap "; "";<left><left>
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap {; {};<left><left>

"autoclose with , and position cursor to write text inside
inoremap ', '',<left><left>
inoremap `, ``,<left><left>
inoremap ", "",<left><left>
inoremap (, (),<left><left>
inoremap [, [],<left><left>
inoremap {, {},<left><left>

"autoclose and position cursor after
inoremap '<tab> ''
inoremap `<tab> ``
inoremap "<tab> ""
inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}

"autoclose with ; and position cursor after
inoremap ';<tab> '';
inoremap `;<tab> ``;
inoremap ";<tab> "";
inoremap (;<tab> ();
inoremap [;<tab> [];
inoremap {;<tab> {};

"autoclose with , and position cursor after
inoremap ',<tab> '',
inoremap `,<tab> ``,
inoremap ",<tab> "",
inoremap (,<tab> (),
inoremap [,<tab> [],
inoremap {,<tab> {},

"autoclose 2 lines below and position cursor in the middle
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O

"autoclose 2 lines below adding ; and position cursor in the middle
inoremap ';<CR> '<CR>';<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"autoclose 2 lines below adding , and position cursor in the middle
inoremap ',<CR> '<CR>',<ESC>O
inoremap `,<CR> `<CR>`,<ESC>O
inoremap ",<CR> "<CR>",<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O
inoremap {,<CR> {<CR>},<ESC>O
" }}}
" Sessions {{{
" Move where sessions are stored
let g:sessions_dir = "~/.vim/sessions"
" }}}
" Leader Shortcuts {{{

let mapleader=","
"asdf
" Disable search highlight
nnoremap <leader><space> :noh<CR>

" Pick first result fix spelling
nnoremap <leader>f 1z=

" Toggle spelling
nnoremap <leader>s :set spell!<CR>

" Close current tab
" nnoremap <leader>q :tabclose<CR>

" Write current buffer
nnoremap <leader>w :w<CR>

" Close Current Buffer
nnoremap <leader>x :bd<CR>

" Make sessions
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Load Sessions
exec 'nnoremap <Leader>sl :so ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'

"}}}
" AutoGroups {{{
augroup configgroup
    autocmd!

    " Automatically write to/load undo tree upon closing/opening files
    " autocmd BufDelete :wundo<CR>
    " autocmd BufAdd :rundo<CR>

    " Removes all extraneous whitespace upon closing file
    let ftToIgnore = ['latex', 'plaintex', "markdown"]
    autocmd BufWritePre * if index(ftToIgnore, &ft) < 0 | :call <SID>StripTrailingWhitespaces()

    " Groups splits by tab in python
    autocmd BufEnter *.py setlocal foldmethod=indent

    " 2 Spaces instead of 4 in some languages
    autocmd BufEnter *.css,*.sass,*.js,*.ts,*.html,*.jsx,*.sh,*.zsh :call TwoSpaces()

    " Changes tab back to actual tab (makefiles break otherwise)
    autocmd BufEnter Makefile setlocal noexpandtab

    " Assembly Syntax
    autocmd BufEnter *.asm,*.s setlocal ft=masm

    " Relative numbers in command mode, Absolute in insert
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
" }}}
" Backups, Buffers, UndoTrees {{{
" Enable backups and move backup folder
set backup
set backupdir=~/.vim/backup//

" Automatically make backup before overwriting current buffer
set writebackup

" Enable persistent undo and move persistent undo folder
set undofile
set undodir=~/.vim/undo//

" Move swap file folder
set directory=~/.vim/swp//

" Make directories if they don't exist
if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

" WARINING: WHEN USING WITH COC, CANNOT ENABLE THIS
set nobackup
set nowritebackup
" }}}
" vim:foldmethod=marker:foldlevel=0
