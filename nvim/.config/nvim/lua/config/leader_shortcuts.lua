local m = require("helpers/mapping")

--  Disable search highlight
m.nmap("<leader><space>", ":noh<CR>")

--  Pick first result fix spelling
m.nmap("<leader>f", "1z=")

--  Toggle spelling
m.nmap("<leader>s", ":set spell!<CR>")

--  Close current tab
-- m.nmap("<leader>q", ":tabclose<CR>")

--  Write current buffer
m.nmap("<leader>w", ":w<CR>")

--  Close Current Buffer
-- m.nmap("<leader>x", ":bd<CR>")
