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
        { "<C-p>", mode = {"n"} },
        { "<C-b>", mode = {"n"} },
        { '<leader>fg', mode = {"n"} },
    },
    config = function()
        require('telescope').setup({
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
        })

        require('telescope').load_extension('fzf')

        local m = require('helpers/mapping')
        local builtin = require('telescope.builtin')
        local extension = require('telescope').extensions


        local function find_all()
            require('telescope.builtin').find_files({
                hidden = true,
            })
        end

        -- local function files_fallback()
        --     vim.fn.system 'git rev-parse --is-inside-work-tree'
        --     -- local dropdown = require('telescope.themes').get_dropdown()
        --     if vim.v.shell_error == 0 then
        --         require('telescope.builtin').git_files(dropdown)
        --     else
        --         require('telescope.builtin').find_files({hidden=true})
        --     end
        -- end

        m.nmap('<C-p>', find_all)
        m.nmap('<C-b>', builtin.buffers)

        m.nmap('<leader>fg', builtin.live_grep)
        -- m.nmap('<leader>fa', find_all)

    end
}
