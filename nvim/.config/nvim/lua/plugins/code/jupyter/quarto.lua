return {
    'quarto-dev/quarto-nvim',
    dependencies = {
        'jmbuhr/otter.nvim',
        'hrsh7th/nvim-cmp',
        'neovim/nvim-lspconfig',
        'nvim-treesitter/nvim-treesitter',
    },
    keys = {
        {"<leader>qrc", function() require("quarto.runner").run_cell() end, desc="Quarto: run cell", silent=true},
        {"<leader>qra", function() require("quarto.runner").run_above() end, desc="Quarto: run cell and above", silent=true},
        {"<leader>qrA", function() require("quarto.runner").run_all() end, desc="Quarto: run all cells", silent=true},
        {"<leader>qrl", function() require("quarto.runner").run_line() end, desc="Quarto: run line", silent=true},
        {"<leader>qr", function() require("quarto.runner").run_range() end, desc="Quarto: run visual range", silent=true},
        {"<leader>qRA", function()
            local runner = require("quarto.runner").run_cell
            runner.run_all(true)
        end, desc="Quarto: run all cells of all languages", silent=true},
        {"<leader>qp", function() require("quarto").quartoPreview() end, desc="Quarto: run visual range", silent=true, noremap = true},
    },
    ft = {
        "quarto",
        "markdown"
    },
    opts = {
        lspFeatures = {
            -- NOTE: put whatever languages you want here:
            languages = { "python", "markdown" },
            chunks = "all",
            diagnostics = {
                enabled = true,
                triggers = { "BufWritePost" },
            },
            completion = {
                enabled = true,
            },
        },
        keymap = {
            -- NOTE: setup your own keymaps:
            hover = "H",
            definition = "gd",
            rename = "<F2>",
            references = "gr",
            format = "<F3>",
        },
        codeRunner = {
            enabled = true,
            default_method = "molten",
        },
    }
}