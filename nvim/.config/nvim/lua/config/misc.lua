-- Possibly needed in vim, but not neovim
vim.opt.encoding = "utf-8"

-- Makes backspace more intuitive
vim.opt.backspace = "indent,eol,start"

-- Copy/paste to outside vim
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Mouse support lol
vim.opt.mouse = "a"

-- Hide buffers
vim.opt.hidden = true

-- Spellcheck US Words
vim.opt.spell = true
vim.opt.spelllang = "en_us"

local m = require("helpers/mapping")

-- Remaps escape
m.imap("jk", "<ESC>")

-- Up/down are by visual line, instead of actual line
vim.keymap.set("n", "j", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, silent = true, expr = true })
vim.keymap.set("n", "<Down>", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, silent = true, expr = true })

vim.keymap.set("n", "k", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, silent = true, expr = true })
vim.keymap.set("n", "<Up>", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, silent = true, expr = true })

-- Better indenting
m.vmap("<", "<gv")
m.vmap(">", ">gv")

-- Move lines around
m.map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
m.map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
m.map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
m.map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
m.map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
m.map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Move lines around
m.map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
m.map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
m.map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
m.map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
m.map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
m.map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
