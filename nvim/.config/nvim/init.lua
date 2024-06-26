-- Leader keys
vim.g.mapleader = ","
vim.g.maplocalleader = " "
vim.loader.enable()

-- Disable built-in functions for plugins
require("config/disable_builtin")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Lua can see luarocks packages
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

-- python3 path here \/.
vim.g.python3_host_prog = vim.fn.expand("$HOME") .. "/micromamba/bin/python3"

require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
  	-- colorscheme that will be used when installing plugins.
  	install = { colorscheme = { "catppuccin" } },
  	-- automatically check for plugin updates
  	checker = { enabled = true },
})

require("config/init")
