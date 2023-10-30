return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    lazy = true,
    priority = 100,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-treesitter/nvim-treesitter',
        'nvim-telescope/telescope-fzf-native.nvim',
    },
    cmd = {
        "Telescope"
    },
    keys = {
        { "<C-p>", function() require('telescope.builtin').find_files({ hidden = true }) end, mode = {"n"} },
        { "<C-b>", function() require('telescope.builtin').buffers() end, mode = {"n"} },
        { '<leader>fg', function() require('telescope.builtin').live_grep() end, mode = {"n"} },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                ".git/",
                "^node_modules/",
                "^build/",
                ".cache",
                "%.pdf",
                "%.mkv",
                "%.mp4",
                "%.zip",
                "__pycache__/",
                ".ipynb_checkpoints/"
            }
        },
        pickers = {
            find_files = {
                hidden = true,
                no_ignore = false,
                no_ignore_parent = false
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                -- the default case_mode is "smart_case"
            },
        }
    },
    init = function()
        require('telescope').load_extension('fzf')
    end
}
