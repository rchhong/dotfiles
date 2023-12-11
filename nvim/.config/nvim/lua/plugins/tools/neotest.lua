return {
    'nvim-neotest/neotest',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python"
    },
    event = "LspAttach",
    keys = {
        {"<leader>dr", function() require("neotest").run.run() end, desc = "Neotest: run nearest test"},
        {"<leader>dw", function() require("neotest").watch.toggle() end, desc = "Neotest: watch nearest test"},
        {"<leader>drc", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Neotest: run current test"},
        {"<leader>dwc", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Neotest: watch current test"},
        {"<leader>ds", function() require("neotest").run.stop() end, desc = "Neotest: stop test"},
        -- {"<leader>da", function() require("neotest").run.attach() end, desc = "Neotest: attach to test"},
        {"<leader>dd", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Neotest: debug test"},
        {"<leader>do", function() require("neotest").output.open({enter = true, auto_close = true}) end, desc = "Neotest: display output of test"},
        {"<leader>dl", function() require("neotest").summary.toggle() end, desc = "Neotest: list status of all tests"}
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = {
                        justMyCode = false,
                    }
                })
            }
        })
    end,
}
