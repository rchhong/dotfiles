-- Move session folder
vim.g.sessions_dir = vim.fn.expand("~/.config/nvim/sessions/")

-- Enable backups and move backup folder
vim.opt.backup = true
vim.opt.backupdir=vim.fn.expand("~/.config/nvim/backup/")

-- Automatically make backup before overwriting current buffer
vim.opt.writebackup = true

-- Enable persistent undo and move persistent undo folder
vim.opt.undofile = true
vim.opt.undodir=vim.fn.expand("~/.config/nvim/undo/")

-- Move swap file folder
vim.opt.directory=vim.fn.expand("~/.config/nvim/swp/")

-- Make directories if they don't exist
vim.api.nvim_command([[if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif]])
vim.api.nvim_command([[if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif]])
vim.api.nvim_command([[if !isdirectory(&directory) | call mkdir(&directory, "p") | endif]])
