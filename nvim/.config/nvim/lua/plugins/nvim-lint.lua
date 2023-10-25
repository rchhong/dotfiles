return {
    "mfussenegger/nvim-lint",
    event = {"BufWritePost"},
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            markdown = {'vale',},
            python = {'ruff'}
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
              require("lint").try_lint()
            end,
        })
    end
}