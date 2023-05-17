return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('lualine').setup({
            options = {
                disabled_filetypes = { 'Lazy', 'NvimTree' },
                section_separators = '',
                component_separators = '',
            }
        })
    end
}
