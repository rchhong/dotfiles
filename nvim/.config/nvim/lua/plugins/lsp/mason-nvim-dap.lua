return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
		"mason-org/mason.nvim",
    },
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
        automatic_installation = true,
        -- Refer to https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
        ensure_installed = {
            "python",
            -- Golang
            "delve",
            -- TS/JS
			"firefox-debug-adapter",
            "js"
        },
        -- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
        handlers = {
            function(config)
                require('mason-nvim-dap').default_setup(config)
            end
        },
    }
}