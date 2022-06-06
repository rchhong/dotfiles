" Source: https://jnrowe-vim.readthedocs.io/autoload/plugins/dein.html
" load configuration files for plugins
if has('nvim')
    function! plugins#dein#load_config(plugin = v:null) abort
        if has_key(g:dein#plugin, "name")
            const l:name = substitute(g:dein#plugin.name, '-', '_', 'g')
            execute 'source ~/.vim/config/plugins/' .. l:name .. '.vim'
        endif
    endfunction
else
    function! plugins#dein#load_config(plugin = v:none) abort
        const l:name = substitute(g:dein#plugin.name, '-', '_', 'g')
        execute 'source ~/.vim/config/plugins/' .. l:name .. '.vim'
    endfunction
endif

" add a prefix to a list of strings
function! plugins#dein#prefix(prefix, args) abort
    return mapnew(a:args, {_, s -> a:prefix .. s})
endfunction

" add a suffix to a list of strings
function! plugins#dein#suffix(suffix, args) abort
    return mapnew(a:args, {_, s -> s .. a:suffix})
endfunction

" check for installed command
let s:has_exec_cache = {}
function! plugins#dein#has_exec(command) abort
    if !has_key(s:has_exec_cache, a:command)
        let s:has_exec_cache[a:command] = executable(a:command)
    endif
    return s:has_exec_cache[a:command]
endfunction