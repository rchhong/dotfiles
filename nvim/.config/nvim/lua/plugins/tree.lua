return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {
            "<F6>",
            function()
                require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
            end,
            desc="NeoTree (cwd)",
            mode={"n"}
        },
    },
    opts = {
        -- When opening files, do not select windows with these types
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        default_component_configs = {
            indent = {
              with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
              expander_collapsed = "",
              expander_expanded = "",
              expander_highlight = "NeoTreeExpander",
            },
        },
        event_handlers = {
            {
              event = "file_opened",
              handler = function(file_path)
                -- auto close
                -- vimc.cmd("Neotree close")
                -- OR
                require("neo-tree.command").execute({ action = "close" })
              end
            },
        },
        filesystem = {
            -- This will find and focus the file in the active buffer every time
            -- the current file is changed while the tree is open.
            follow_current_file = { enabled = true },
            -- Use OS file watcher
            use_libuv_file_watcher = true,
            -- Show hidden files
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false,
            },
        },
    }
}