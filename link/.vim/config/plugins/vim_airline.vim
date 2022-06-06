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