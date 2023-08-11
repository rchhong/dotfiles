return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim"
    },
    config = function()
        require("todo-comments").setup({
            signs = false
        })

        local m = require('helpers/mapping')
        m.nmap("<leader>xt", ":TodoTrouble<CR>")
    end
}
