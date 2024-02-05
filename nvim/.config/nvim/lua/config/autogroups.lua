-- Relative numbers in command mode, Absolute in insert
local numbertoggle_augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = numbertoggle_augroup,
   callback = function()
      if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = numbertoggle_augroup,
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         vim.cmd("redraw")
      end
   end,
})

-- Open telescope if directory given as input
local is_git_dir = function()
   return os.execute('git rev-parse --is-inside-work-tree >> /dev/null 2>&1')
end

vim.api.nvim_create_autocmd('VimEnter', {
   callback = function()
     local bufferPath = vim.fn.expand('%:p')
     if vim.fn.isdirectory(bufferPath) ~= 0 then
       local ts_builtin = require('telescope.builtin')
       vim.api.nvim_buf_delete(0, { force = true })
       ts_builtin.find_files({hidden=true})
     end
   end,
 })

-- automatically import output chunks from a jupyter notebook
-- tries to find a kernel that matches the kernel in the jupyter notebook
-- falls back to a kernel that matches the name of the active venv (if any)
local imb = function(e) -- init molten buffer
   vim.schedule(function()
       local kernels = vim.fn.MoltenAvailableKernels()
       local try_kernel_name = function()
           local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
           return metadata.kernelspec.name
       end
       local ok, kernel_name = pcall(try_kernel_name)
       if not ok or not vim.tbl_contains(kernels, kernel_name) then
           kernel_name = nil
           local venv = os.getenv("VIRTUAL_ENV")
           if venv ~= nil then
               kernel_name = string.match(venv, "/.+/(.+)")
           end
       end
       if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
           vim.cmd(("MoltenInit %s"):format(kernel_name))
       end
       vim.cmd("MoltenImportOutput")
   end)
end

-- automatically import output chunks from a jupyter notebook
vim.api.nvim_create_autocmd("BufAdd", {
   pattern = { "*.ipynb" },
   callback = imb,
})

-- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = { "*.ipynb" },
   callback = function(e)
       if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
           imb(e)
       end
   end,
})

-- automatically export output chunks to a jupyter notebook on write
vim.api.nvim_create_autocmd("BufWritePost", {
   pattern = { "*.ipynb" },
   callback = function()
       if require("molten.status").initialized() == "Molten" then
           vim.cmd("MoltenExportOutput!")
       end
   end,
})

-- change the configuration when editing a python file
vim.api.nvim_create_autocmd("BufEnter", {
   pattern = "*.py",
   callback = function(e)
     if string.match(e.file, ".otter.") then
       return
     end
     if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
       vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
       vim.fn.MoltenUpdateOption("virt_text_output", false)
     else
       vim.g.molten_virt_lines_off_by_1 = false
       vim.g.molten_virt_text_output = false
     end
   end,
 })

 -- Undo those config changes when we go back to a markdown or quarto file
 vim.api.nvim_create_autocmd("BufEnter", {
   pattern = { "*.qmd", "*.md", "*.ipynb" },
   callback = function(e)
     if string.match(e.file, ".otter.") then
       return
     end
     if require("molten.status").initialized() == "Molten" then
       vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
       vim.fn.MoltenUpdateOption("virt_text_output", true)
     else
       vim.g.molten_virt_lines_off_by_1 = true
       vim.g.molten_virt_text_output = true
     end
   end,
 })