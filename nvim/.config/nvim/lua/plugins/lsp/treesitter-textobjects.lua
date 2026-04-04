return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        vim.g.no_plugin_maps = true
    end,
    keys = {
        {
            "]f",
            function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of next function",
        },
        {
            "]c",
            function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of next class",
        },
        {
            "]a",
            function() require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of next parameter",
        },
        {
            "]b",
            function() require("nvim-treesitter-textobjects.move").goto_next_start("@code_cell.inner", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of next code block",
        },
        -- goto_next_end
        {
            "]F",
            function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of next function",
        },
        {
            "]C",
            function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of next class",
        },
        {
            "]A",
            function() require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of next parameter",
        },
        {
            "]B",
            function() require("nvim-treesitter-textobjects.move").goto_next_end("@code_cell.inner", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of next code block",
        },
        -- goto_previous_start
        {
            "[f",
            function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of previous function",
        },
        {
            "[c",
            function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of previous class",
        },
        {
            "[a",
            function() require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of previous parameter",
        },
        {
            "[b",
            function() require("nvim-treesitter-textobjects.move").goto_previous_start("@code_cell.inner", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to start of previous code block",
        },
        -- goto_previous_end
        {
            "[F",
            function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of previous function",
        },
        {
            "[C",
            function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of previous class",
        },
        {
            "[A",
            function() require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of previous parameter",
        },
        {
            "[B",
            function() require("nvim-treesitter-textobjects.move").goto_previous_end("@code_cell.inner", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: Go to end of previous code block",
        },
        -- Most of the other text objects in this case are handled by mini.ai
        {
            "ib",
            function() require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.inner", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: select the inner contents of a code cell",
        },
        {
            "ab",
            function() require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.outer", "textobjects") end,
            mode = { "n", "x", "o" },
            desc = "Treesitter: select the outer contents",
        },
    },
    opts = {
        select = {
            lookahead = true,
            selection_modes = {
                ['@.outer'] = 'V', -- linewise
            },
            include_surrounding_whitespace = false,
        },
        move = {
            set_jumps = true,
        },
    },
}