return {
	"folke/trouble.nvim",
	cmd = {
		"TroubleToggle",
	},
	dependencies = {
		"echasnovski/mini.icons",
	},
	keys = {
		{
			"<leader>xx",
			function()
				require("trouble").toggle({ mode = "diagnostics" })
			end,
			desc = "Trouble: toggle",
			mode = { "n" },
		},
		{
			"<leader>xw",
			function()
				require("trouble").toggle({
					mode = "diagnostics", -- inherit from diagnostics mode
					filter = {
						any = {
							buf = 0, -- current buffer
							{
								-- limit to files in the current project
								function(item)
									return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
								end,
							},
						},
					},
				})
			end,
			desc = "Trouble: workspace diagnostics",
			mode = { "n" },
		},
		{
			"<leader>xd",
			function()
				require("trouble").toggle({
					mode = "diagnostics", -- inherit from diagnostics mode
					filter = {
						any = {
							buf = 0, -- current buffer
						},
					},
				})
			end,
			desc = "Trouble: document diagnostics",
			mode = { "n" },
		},
		{
			"<leader>xq",
			function()
				require("trouble").toggle({
					mode = "qflist",
				})
			end,
			desc = "Trouble: quickfix menu",
			mode = { "n" },
		},
		{
			"<leader>xL",
			function()
				require("trouble").toggle({ mode = "loclist" })
			end,
			desc = "Trouble: location list",
			mode = { "n" },
		},
		{
			"<leader>xl",
			function()
				require("trouble").toggle({ mode = "lsp" })
			end,
			desc = "Trouble: LSP references",
			mode = { "n" },
		},
	},
	opts = {
		-- auto opens when there are items
		auto_open = false,
		-- auto opens when there are no items
		auto_close = false,
		-- focus when window is opened
		focus = true,
	},
}
