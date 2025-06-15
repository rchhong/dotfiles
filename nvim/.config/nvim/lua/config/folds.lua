--  Enables folding
vim.opt.foldenable = true

--  Fold by syntax by default
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

--  Set default fold level high -> no folds by default
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"

vim.o.foldtext = ""
vim.opt.fillchars:append({ fold = " " })
--  Use space to open folds
local m = require("helpers/mapping")
m.nmap("<space>", "za")
