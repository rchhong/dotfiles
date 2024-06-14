return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	cmd = { "Neogen" },
	keys = {
		{
			"<leader>ng",
			function()
				require("neogen").generate()
			end,
			mode = { "n" },
			desc = "Neogen",
		},
	},
	opts = {
		snippet_engine = "luasnip",
		languages = {
			python = {
				template = {
					annotation_convention = "numpydoc",
				},
			},
		},
	},
	config = true,
}
