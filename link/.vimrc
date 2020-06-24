" Vundle {{{

filetype off

" Auto install Vundle
let vundle_present=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let vundle_present=0
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin Manager
Plugin 'VundleVim/Vundle.vim'
" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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
" Theme (Molokai currently)
Plugin 'tomasr/molokai'
" Makes commenting/uncommenting easier
Plugin 'scrooloose/nerdcommenter'
" Autocomplete pairs
Plugin 'jiangmiao/auto-pairs'
call vundle#end()

if vundle_present == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
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

" Monokai colors
" TODO: Make customizable by putting these values in a separate file
if has('nvim')
    let g:terminal_color_0  = '#232526'
    let g:terminal_color_1  = '#EF5939'
    let g:terminal_color_2  = '#FD971F'
    let g:terminal_color_3  = '#E6DB74'
    let g:terminal_color_4  = '#70F0F0'
    let g:terminal_color_5  = '#BCA3A3'
    let g:terminal_color_6  = '#960050'
    let g:terminal_color_7  = '#465457'
    let g:terminal_color_8  = '#808080'
    let g:terminal_color_9  = '#F92672'
    let g:terminal_color_10  = '#A6E22E'
    let g:terminal_color_11  = '#C4BE89'
    let g:terminal_color_12  = '#66D9EF'
    let g:terminal_color_13  = '#AE81FF'
    let g:terminal_color_14  = '#7070F0'
    let g:terminal_color_15  = '#F8F8F0'
endif
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

" Toggle paste mode
set pastetoggle=<F3>

" Reload vimrc
command! Reload :so ~/.vimrc
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
" netrw {{{
" I'll come back to this
" }}}
" fzf {{{

" Disable statusline overwriting
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Enables per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mirrors ctrl-P functionality
nnoremap <C-p> :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <C-b> :Buffers<CR>
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

" Close Current Buffer
nnoremap <leader>x :bd<CR>

" Force Close Current Buffer
nnoremap <leader>f :bd!<CR>

" Custom function to open buffer
" nnoremap <leader>b :call ChangeBuffer()<CR>
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    
    " Removes all extraneous whitespace upon closing file
    autocmd BufWritePre *.py,*.java,*.cpp,*.h,*.c :call <SID>StripTrailingWhitespaces()
    
    " Groups splits by tab in python
    autocmd BufEnter *.py setlocal foldmethod=indent
    
    " Changes tab back to actual tab (makefiles break otherwise)
    autocmd BufEnter Makefile setlocal noexpandtab
    
    " Assembly Syntax
    autocmd BufEnter *.asm,*.s setlocal ft=masm 
    
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

" Swap buffer shortcut 
function ChangeBuffer()
    call inputsave()
    let bufferNumber = input("Buffer #: ")
    call inputrestore()
    execute bufferNumber . "b"
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
" Airline {{{

" Show buffers instead of tabs if there's only 1 tab
let g:airline#extensions#tabline#enabled = 1

" Show buffer numbers
" let g:airline#extensions#tabline#buffer_nr_show = 1

" Molokai Theme
let g:airline_theme='molokai'

" Powerline Symbols
" let g:airline_powerline_fonts = 1

" Improved File Title
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Remove unnecessary info
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline_detect_spelllang=0
let g:airline_detect_spell=0
let g:airline#extensions#virtualenv#enabled = 0

" Skip separators for sections that are empty
let g:airline_skip_empty_sections = 1

" Disables the buffer name that displays on the right of the tabline 
let g:airline#extensions#tabline#show_splits = 0

" Disable tab numbers
let g:airline#extensions#tabline#show_tab_nr = 0

" Don't show tab numbers on the right 
let g:airline#extensions#tabline#show_tab_count = 0

" Remove 'X' at the end of the tabline 
let g:airline#extensions#tabline#show_close_button = 0  

" Replace 'tabs' and 'buffers' with shorthand
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#buffers_label = 'b'

" Disable file paths in the tab
let g:airline#extensions#tabline#fnamemod = ':t' 
" }}}
" vim:foldmethod=marker:foldlevel=0
