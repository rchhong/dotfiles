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
" Dev Icons
Plugin 'ryanoasis/vim-devicons'
" Show git status
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Show git status in file
Plugin 'airblade/vim-gitgutter'
" tmux integration
Plugin 'christoomey/vim-tmux-navigator'
" Formatting
" Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Emnet Expansion
Plugin 'mattn/emmet-vim'
" Autocompletion
Plugin 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
call vundle#end()


if vundle_present == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif
" }}}
" Functions {{{

" Refresh NERDTree
function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

" Toggle git-gutter diff
let g:gitgutter_diff_open = 0
let g:gitgutter_preview_win_floating = 1
function! GitGutterDiffOrigToggle()
   if ! g:gitgutter_diff_open
       GitGutterDiffOrig
   else
       +clo
    endif
    let g:gitgutter_diff_open = !g:gitgutter_diff_open
endfunction

" Use GitFiles unless git repo doesn't exist, then just normal files
function! GFilesFallback()
  let output = system('git rev-parse --show-toplevel') " Is there a faster way?
  let prefix = get(g:, 'fzf_command_prefix', '')
  if v:shell_error == 0
    exec "normal :" . prefix . "GFiles\<CR>"
  else
    exec "normal :" . prefix . "Files\<CR>"
  endif
  return 0
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
"}}}
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
" fzf {{{

" Disable statusline overwriting
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Enables per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mirrors ctrl-P functionality
nnoremap <C-p> ::call GFilesFallback()<CR>
nnoremap <C-v> :Buffers<CR>
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
let g:airline_powerline_fonts = 1

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

" Remove search count
let g:airline#extensions#searchcount#enabled = 0
" }}}
" GitGutter {{{

" }}}
" Leader Shortcuts {{{

let mapleader=","

" Calls the Silver Surfer (UT Server doesn't have RigGrep
nnoremap <leader>a :Ag<CR>

" Calls RigGrep
nnoremap <leader>r :Rg<CR>

" Close Current Buffer
nnoremap <leader>x :bd<CR>

" Show diff
nnoremap <silent> <leader>gd :call GitGutterDiffOrigToggle()<CR>

" Show preview
nnoremap <leader>gp <Plug>(GitGutterPreviewHunk)
"}}}
" COC {{{
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " " " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " " " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <M-a>  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <M-e>  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <M-c>  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <M-o>  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <M-s>  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <M-j>  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <M-k>  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <M-p>  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" }}}
" Emnet {{{
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
" }}}
" vim:foldmethod=marker:foldlevel=0
