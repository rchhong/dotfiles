" dein {{{

" Auto install dein
let dein_present=1
let dein_readme=expand('~/.vim/bundle/dein.vim/README.md')
if !filereadable(dein_readme)
  echo "Installing dein.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !mkdir -p ~/.vim/plugin
  silent !git clone --depth=1 https://github.com/Shougo/dein.vim ~/.vim/bundle/dein.vim
  let dein_present=0
endif

set rtp+=~/.vim/bundle/dein.vim

let s:dein_dir = expand('~/.vim/bundle/dein.vim')
let g:config_dir = expand('~/.vim/config/')
let s:toml = g:config_dir .. 'dein.toml'
let s:lazy_toml = g:config_dir .. 'dein_lazy.toml'

if dein#min#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml, {'lazy':0})
  call dein#load_toml(s:lazy_toml, {'lazy':1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein_present == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  call dein#install()
endif

if dein#check_install()
 call dein#install()
endif
" }}}
" vim:foldmethod=marker:foldlevel=0
