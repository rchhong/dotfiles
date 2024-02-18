return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Persistence: Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Persistence: Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Persistence: Don't Save Current Session" },
    },
    opts = { options = vim.opt.sessionoptions:get() },

}