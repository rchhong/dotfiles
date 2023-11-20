return {
    "folke/trouble.nvim",
    cmd = {
        "TroubleToggle",
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    keys = {
        {"<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Toggles Trouble", mode = {'n'}},
        {"<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Toggles Trouble (for workplace)", mode = {'n'}},
        {"<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Toggles Trouble (for document)", mode = {'n'}},
        -- {"<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Toggles Trouble", mode = {'n'}},
        -- {"<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix Items", mode = {'n'}},
        -- {"<leader>gr", "<cmd>TroubleToggle lsp_references<CR>", desc = "Toggles lsp Refernces", mode = {'n'}},
    },
}
