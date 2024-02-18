return {
    'numToStr/Navigator.nvim',
    keys = {
        { "<C-h>", '<CMD>NavigatorLeft<CR>', mode = {"n", "t"}, desc = "Navigator: Navigate Left (respects tmux)"},
        { "<C-j>", '<CMD>NavigatorDown<CR>', mode = {"n", "t"}, desc = "Navigator: Navigate Down (respects tmux)"},
        { "<C-k>", '<CMD>NavigatorUp<CR>', mode = {"n", "t"}, desc = "Navigator: Navigate Up (respects tmux)"},
        { "<C-l>", '<CMD>NavigatorRight<CR>', mode = {"n", "t"}, desc = "Navigator: Navigate Right (respects tmux)"},
    },
    opts = {
        -- Save modified buffer(s) when moving to mux
        -- nil - Don't save (default)
        -- 'current' - Only save the current modified buffer
        -- 'all' - Save all the buffers
        auto_save = nil,

        -- Disable navigation when the current mux pane is zoomed in
        disable_on_zoom = false,

        -- Multiplexer to use
        -- 'auto' - Chooses mux based on priority (default)
        -- table - Custom mux to use
        mux = 'auto'
    },
}