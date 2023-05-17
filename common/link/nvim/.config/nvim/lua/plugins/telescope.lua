return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-treesitter/nvim-treesitter',
        'telescope-fzf-native.nvim',
    },
    cmd = {
        "Telescope"
    },
    config = function()
        require('telescope').setup({
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                    -- the default case_mode is "smart_case"
                }
            }
        })

        require('telescope').load_extension('fzf')

        local m = require('helpers/mapping')
        local builtin = require('telescope.builtin')

        local function files_fallback()
            vim.fn.system 'git rev-parse --is-inside-work-tree'
            -- local dropdown = require('telescope.themes').get_dropdown()
            if vim.v.shell_error == 0 then
                require('telescope.builtin').git_files(dropdown)
            else
                require('telescope.builtin').find_files(dropdown)
            end
        end
        -- TODO: Install undo tree
        m.nmap('<C-p>', files_fallback)
        m.nmap('<C-r>', builtin.live_grep)
        m.nmap('<C-b>', builtin.buffers)
    end
}
