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
       if is_git_dir() == 0 then
         ts_builtin.git_files({ show_untracked = true })
       else
         ts_builtin.find_files()
       end
     end
   end,
 })

