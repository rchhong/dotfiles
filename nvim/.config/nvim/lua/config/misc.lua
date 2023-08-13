-- Possibly needed in vim, but not neovim
vim.opt.encoding = "utf-8"

-- Makes backspace more intuitive
vim.opt.backspace = "indent,eol,start"

-- Copy/paste to outside vim
vim.opt.clipboard:append({'unnamed','unnamedplus'})

-- Mouse support lol
vim.opt.mouse = 'a'

-- Hide buffers
vim.opt.hidden = true


-- Spellcheck US Words
vim.opt.spell = true
vim.opt.spelllang = "en_us"

local m = require('helpers/mapping')

-- Remaps escape
m.imap('jk', '<ESC>')

-- Up/down are by visual line, instead of actual line
vim.keymap.set('n', 'j', "(v:count == 0 ? 'gj' : 'j')", { noremap = true, silent = true, expr = true })
vim.keymap.set('n', '<Down>', "(v:count == 0 ? 'gj' : 'j')", { noremap = true, silent = true, expr = true })

vim.keymap.set('n', 'k', "(v:count == 0 ? 'gk' : 'k')", { noremap = true, silent = true, expr = true })
vim.keymap.set('n', '<Up>', "(v:count == 0 ? 'gk' : 'k')", { noremap = true, silent = true, expr = true })


