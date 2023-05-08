" Functions {{{
" Refresh NERDTree
function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" }}}
" NERDTree {{{

" Show hidden files
let NERDTreeShowHidden=1

" Close NERDTree when opening file
let NERDTreeQuitOnOpen=1

" Toggles NERDTree
nmap <F6> :call NERDTreeToggleAndRefresh()<CR>

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

" Make sure file highlighted in NERDTree is same as file currently open
autocmd BufEnter * call SyncTree()
" }}}