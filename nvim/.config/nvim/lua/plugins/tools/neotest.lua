return {
    'nvim-neotest/neotest',
    dependencies = {
        {"nvim-neotest/nvim-nio", version = "1.9.0"},
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python"
    },
    keys = {
        {"<leader>tr", function() require("neotest").run.run() end, desc = "Neotest: run nearest test"},
        {"<leader>tw", function() require("neotest").watch.toggle() end, desc = "Neotest: watch nearest test"},
        {"<leader>trc", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Neotest: run current test"},
        {"<leader>twc", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Neotest: watch current test"},
        {"<leader>ts", function() require("neotest").run.stop() end, desc = "Neotest: stop test"},
        {"<leader>ta", function() require("neotest").run.attach() end, desc = "Neotest: attach to test"},
        {"<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Neotest: debug test"},
        {"<leader>to", function() require("neotest").output.open({enter = true, auto_close = true}) end, desc = "Neotest: display output of test"},
        {"<leader>tl", function() require("neotest").summary.toggle() end, desc = "Neotest: list status of all tests"}
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
