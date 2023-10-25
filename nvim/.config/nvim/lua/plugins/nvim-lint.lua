return {
    "mfussenegger/nvim-lint",
    event = {"BufWritePost"},
    init = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            markdown = {'vale',},
            python = {'ruff',}
        }

        local ruff = require('lint').linters.ruff
        ruff.args = {
            "--extend-select",
            "E",
            "--extend-select",
            "I",
            "--extend-select",
            "D"
        }
    end,
    config = function()
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
              require("lint").try_lint()
            end,
        })
    end
}