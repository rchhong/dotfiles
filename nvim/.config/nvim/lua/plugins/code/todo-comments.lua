return {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    cmd = {"TodoTrouble"},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        'nvim-telescope/telescope.nvim'
    },
    keys = {
        {"<leader>xt", "<cmd>TroubleToggle todo<cr>", desc = "TodoTrouble Toggle", mode={"n"}},
        {"<leader>st", "<cmd>TodoTelescope<cr>", desc = "TodoTelescope Toggle", mode={"n"}}
    },
    opts = {
        signs = false
    },
}
