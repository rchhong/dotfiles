" Functions {{{

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

"}}}
" fzf {{{

" Disable statusline overwriting
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Enables per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Mirrors ctrl-P functionality
nnoremap <C-p> :call GFilesFallback()<CR>
nnoremap <C-b> :Buffers<CR>
autocmd! FileType fzf

" Cancels fzf
" autocmd FileType fzf tunmap <buffer> <Esc>
" }}}
" Leader Shortcuts {{{

let mapleader=","

" Calls the Silver Surfer (UT Server doesn't have RigGrep
nnoremap <leader>a :Ag<CR>

" Calls RigGrep
nnoremap <leader>r :Rg<CR>

"}}}

" vim:foldmethod=marker:foldlevel=0