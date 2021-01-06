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
Plugin 'tpope/vim-surround'
" Make . work nicely with some plugins
Plugin 'tpope/vim-repeat'
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
" File Browser that's less buggy
Plugin 'preservim/nerdtree'
" See Undo History
Plugin 'mbbill/undotree'
" Language Pack
Plugin 'sheerun/vim-polyglot'
call vundle#end()

if vundle_present == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
" }}}
" NERDTree {{{

" Show hidden files
let NERDTreeShowHidden=1

" Close NERDTree when opening file
let NERDTreeQuitOnOpen=1

" Toggles NERDTree
nmap <F6> :call SmartToggleNERDTree()<CR>

" Opens NERDTree if no files specified, unless using session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

" Open NERDTree if directory specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Automatically delete buffer of deleted files
let NERDTreeAutoDeleteBuffer = 1

" UI Tweaks
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Quit on opening file
let NERDTreeQuitOnOpen = 1

" Close if only NERDTREE Left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Respect wildignore
let NERDTreeRespectWildIgnore = 1

" Ignore certain directories
let NERDTreeIgnore = ['^.git$', '^node_modules$', '^build$']

" }}}
" fzf {{{

" Disable statusline overwriting
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Enables per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mirrors ctrl-P functionality
nnoremap <C-p> :GFiles <C-R>=expand('%:h')<CR><CR>
nnoremap <C-b> :Buffers<CR>
autocmd! FileType fzf

" Makes pop-up window look less goofy
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Cancels fzf
autocmd FileType fzf tunmap <buffer> <Esc>
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
let g:airline#extensions#tabline#buffer_nr_show = 1

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
" Leader Shortcuts {{{

let mapleader=","

" Calls the Silver Surfer (UT Server doesn't have RigGrep
nnoremap <leader>a :Ag<CR>

" Calls RigGrep
nnoremap <leader>r :Rg<CR>

" Close Current Buffer
nnoremap <leader>x :bd<CR>

"}}}
" Functions {{{

" Correctly opens/closes NERDTree
function SmartToggleNERDTree()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        echom "NERD Tree Closed"
        execute ":NERDTreeClose"
    else
        echom "NERD Tree Open"
        execute ":NERDTreeFind"
    endif
endfunc

"}}}
" Auto Completion {{{

" Make SuperTab work with autocompetion
let g:SuperTabDefaultCompletionType = "context"
" }}}
" vim:foldmethod=marker:foldlevel=0
