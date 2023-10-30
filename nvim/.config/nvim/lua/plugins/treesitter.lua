return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufWritePost", "BufNewFile"},
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-context"
    },
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
        require('nvim-treesitter.configs').setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python"},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (for "all")
            ignore_install = {},

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end

                    local to_disable = { }
                    for _, value in pairs(to_disable) do
                        if(lang == value) then
                            return true
                        end
                    end

                    return false
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            textobjects = {
                lsp_interop = {
                      enable = true,
                      border = 'none',
                      floating_preview_opts = {},
                      peek_definition_code = {
                        ["<leader>df"] = "@function.outer",
                        ["<leader>dc"] = "@class.outer",
                      },
                },
                move = {
                      enable = true,
                      set_jumps = true, -- whether to set jumps in the jumplist
                      goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]p"] = "@parameter.outer" },
                      goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]P"] = "@parameter.outer" },
                      goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[p"] = "@parameter.outer"},
                      goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[P"] = "@parameter.outer"},
                  },
                },
                autotag = {
                  enable = true,
                }
        })

        local m = require("helpers.mapping")
        m.nmap("[c", require("treesitter-context").go_to_context)
    end
}
