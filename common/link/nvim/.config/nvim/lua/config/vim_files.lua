-- Move session folder
vim.g.sessions_dir = "sessions/"

-- Enable backups and move backup folder
vim.opt.backup = true
vim.opt.backupdir="backup/"

-- Automatically make backup before overwriting current buffer
vim.opt.writebackup = true

-- Enable persistent undo and move persistent undo folder
vim.opt.undofile = true
vim.opt.undodir="undo/"

-- Move swap file folder
vim.opt.directory="swp/"

-- Make directories if they don't exist
-- if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
-- if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
-- if !isdirectory(&directory) | call mkdir(&directory, "p") | endif