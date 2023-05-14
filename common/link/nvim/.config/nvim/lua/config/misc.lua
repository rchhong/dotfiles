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

-- Toggle paste mode
vim.opt.pastetoggle = "<F3>"

-- Spellcheck US Words
-- set spell spelllang=en_us

local m = require('helpers/mapping')

-- Remaps escape
m.imap('jk', '<ESC>')

-- Use Ctrl-O and Ctrl-I when jumping multiple lines
-- m.nmap('k', "(v:count > 1 ? "m'" . v:count : '') . 'gk'")
-- m.nmap('j', "(v:count > 1 ? "m'" . v:count : '') . 'gj'")


