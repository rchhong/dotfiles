return {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    cmd = {"TodoTrouble"},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim"
    },
    opts = {
        signs = false
    },
    keys = {
        {"<leader>xt", "<cmd>TroubleToggle todo<cr>", desc = "TodoTrouble Toggle", mode={"n"}},
        {"<leader>st", "<cmd>TodoTelescope<cr>", desc = "TodoTrouble Toggle", mode={"n"}}
    },
}
