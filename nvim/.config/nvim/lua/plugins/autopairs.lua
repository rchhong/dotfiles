return {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/nvim-cmp',
        'nvim-treesitter/nvim-treesitter',
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("nvim-autopairs").setup({
            disable_filetype = {
                "TelescopePrompt",
                "Trouble",
                "vim"
            },
            enable_check_bracket_line = false,
            check_ts = true,
            -- on these treesitter nodes, autocomplete will not work
            ts_config = {
                lua = {'string'},
                javascript = {'template_string', 'string'},
                python = {'string'},
            },
        })

        require('nvim-autopairs').enable()
    end
}
