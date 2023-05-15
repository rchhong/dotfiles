-- Relative numbers except for current line
vim.wo.number = true
vim.wo.relativenumber = true

-- Shows options when hitting tab on command mode
vim.opt.wildmenu = true

-- Ignore certain types of files
vim.opt.wildignore:append({
    "*.pyc",
    "*.o",
    "*.class",
    "*.DS_Store",
    "*/node_modules/*",
    "*/.git/*",
    "*/build/*",
})

-- Optimize performance
vim.opt.lazyredraw = true

-- Jumps to other brace when adding one
vim.opt.showmatch = true

-- Highlights current line
vim.opt.cursorline = true

-- Always display status bar
vim.opt.laststatus = 2

-- Always display tab bar
vim.opt.showtabline = 2

-- Make command line completion more intuitive
vim.opt.wildmode = "longest:full,full"

-- Shows command mode text
vim.opt.showcmd = true

-- Change split character
vim.opt.fillchars:append("vert:┃")

-- Don't show current mode (due to lightline)
vim.opt.showmode = false

-- When splitting, start from Bottom and Right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Don't break line at word
vim.opt.linebreak = true
