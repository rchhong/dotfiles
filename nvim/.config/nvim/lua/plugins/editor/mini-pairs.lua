return {
	"echasnovski/mini.pairs",
	lazy = true,
	event = "InsertEnter",
	keys = {
		{
			"<leader>up",
			function()
				vim.g.minipairs_disable = not vim.g.minipairs_disable
				if vim.g.minipairs_disable then
					print("Disabled auto pairs")
				else
					print("Enabled auto pairs")
				end
			end,
			desc = "Toggle auto pairs",
		},
	},
	opts = {},
}
