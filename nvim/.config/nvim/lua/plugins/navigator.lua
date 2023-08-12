return {
    'numToStr/Navigator.nvim',
    keys = {
        { "<C-h>", mode = {"n", "t"} },
        { "<C-j>", mode = {"n", "t"} },
        { "<C-k>", mode = {"n", "t"} },
        { "<C-l>", mode = {"n", "t"} },
    },
    config = function()
        require('Navigator').setup({
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
        })

        local m = require('helpers/mapping')

        m.nmap('<C-h>', '<CMD>NavigatorLeft<CR>')
        m.nmap('<C-j>', '<CMD>NavigatorDown<CR>')
        m.nmap('<C-k>', '<CMD>NavigatorUp<CR>')
        m.nmap('<C-l>', '<CMD>NavigatorRight<CR>')

        m.tmap('<C-h>', '<CMD>NavigatorLeft<CR>')
        m.tmap('<C-j>', '<CMD>NavigatorDown<CR>')
        m.tmap('<C-k>', '<CMD>NavigatorUp<CR>')
        m.tmap('<C-l>', '<CMD>NavigatorRight<CR>')
    end
}