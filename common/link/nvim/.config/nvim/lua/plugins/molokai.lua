return {
    'tanvirtin/monokai.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('monokai').setup({
            palette = require('monokai').soda
        })

        vim.cmd([[colorscheme monokai]])
    end,
}