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

-- Lua can see luarocks packages
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- python3 path here \/.
vim.g.python3_host_prog = vim.fn.expand("$HOME") .. "/micromamba/bin/python3"

require("lazy").setup("plugins", {
    dev = {
      path = "~/local_plugins",
      fallback = false,
    },
  })



require('config/init')
