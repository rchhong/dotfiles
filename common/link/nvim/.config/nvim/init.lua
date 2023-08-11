-- Leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = " "
vim.loader.enable()

-- Disable built-in functions for plugins
require('config/disable_builtin')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    dev = {
      path = "~/local_plugins",
      fallback = false,
    },
  })

require('config/init')
