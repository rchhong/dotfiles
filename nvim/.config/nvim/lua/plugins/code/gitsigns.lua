return {
    'lewis6991/gitsigns.nvim',
    opts = {},
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    keys = {
      {"]h", function()
        if vim.wo.diff then return ']h' end
        vim.schedule(function() require('gitsigns').next_hunk() end)
        return '<Ignore>'
      end, mode = "n", expr=true, desc = "Git signs: next hunk"},
      {"[h", function()
        if vim.wo.diff then return ']h' end
        vim.schedule(function() require('gitsigns').prev_hunk() end)
        return '<Ignore>'
      end, mode = "n", expr=true, desc = "Git signs: prev hunk"},
      {"<leader>gs", function() require('gitsigns').stage_hunk() end, mode = "n", desc = "Git: stage hunk"},
      {"<leader>gr", function() require('gitsigns').reset_hunk() end, mode = "n", desc = "Git: reset hunk"},
      {"<leader>gs", function() require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, mode = "v", desc = "Git: stage hunk"},
      {"<leader>gr", function() require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, mode = "v", desc = "Git: reset hunk"},
      {"<leader>gus", function() require('gitsigns').undo_stage_hunk() end, mode = "n", desc = "Git: undo stage hunk"},
      {"<leader>gp", function() require('gitsigns').preview_hunk() end, mode = "n", desc = "Git signs: preview hunk"},
      {"<leader>gS", function() require('gitsigns').stage_buffer() end, mode = "n", desc = "Git: stage buffer"},
      {"<leader>gR", function() require('gitsigns').reset_buffer() end, mode = "n", desc = "Git: reset buffer"},
      {"<leader>gb", function() require('gitsigns').blame_line({full=true}) end, mode = "n", desc = "Git: blame line"},
      {"<leader>gtb", function() require('gitsigns').toggle_current_line_blame() end, mode = "n", desc = "Git: toggle blame line"},
      {"<leader>gd", function() require('gitsigns').diffthis() end, mode = "n", desc = "Git: diff this file"},
      {"<leader>gD", function() require('gitsigns').diffthis('~') end, mode = "n", desc = "Git: diff all files"},
      {"<leader>gtd", function() require('gitsigns').toggle_deleted() end, mode = "n", desc = "Git: toggle deleted"},
    },
}
