return {
    "folke/trouble.nvim",
    cmd = {
        "TroubleToggle",
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    keys = {
        {"<leader>xx", function() require("trouble").toggle() end, desc = "Trouble: toggle", mode = {'n'}},
        {"<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Trouble: workspace diagnostics", mode = {'n'}},
        {"<leader>xd", function() require("trouble").toggle("document_diagnostics") end, desc = "Trouble: document diagnostics", mode = {'n'}},
        {"<leader>xl", function() require("trouble").toggle("quickfix") end, desc = "Trouble: quickfix menu", mode = {'n'}},
        {"<leader>xq", function() require("trouble").toggle("loclist") end, desc = "Trouble: location list", mode = {'n'}},
        {"<leader>xr", function() require("trouble").toggle("lsp_references") end, desc = "Trouble: LSP references", mode = {'n'}},
    },
    opts = {
        auto_open = false,
        auto_close = false,
    },
}
