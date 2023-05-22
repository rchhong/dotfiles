--  Enables folding
vim.opt.foldenable = true

--  Fold by syntax by default
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

--  Set max folds
vim.opt.foldnestmax = 10

--  Close some folds
vim.opt.foldlevelstart = 10

--  Use space to open folds
local m = require('helpers/mapping')
m.nmap("<space>", "za")
