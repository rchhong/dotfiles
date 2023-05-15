return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    lazy = true,
    keys = {
        {"<F6>", mode = "n"},
    },
    config = function()
        local function my_on_attach(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            -- use all default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- Overrides
            vim.keymap.set('n', '<CR>', api.node.open.no_window_picker, opts('Open: No Window Picker'))
            ---
        end

        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            auto_reload_on_write = true,
            hijack_unnamed_buffer_when_opening = false,
            view = {
                width = {}
            },
            renderer = {
              group_empty = true,
              indent_markers = {
                enable = true,
              }
            },
            actions = {
                open_file = {
                  resize_window = true,
                  quit_on_open = true,
                },
            },
            on_attach = my_on_attach,
        })

        local m = require('helpers.mapping')
        local api = require('nvim-tree.api')

        m.nmap("<F6>", api.tree.toggle)
    end
}
