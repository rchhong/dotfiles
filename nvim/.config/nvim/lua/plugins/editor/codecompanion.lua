return {
	"olimorris/codecompanion.nvim",
	cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionToggle", "CodeCompanionAdd", "CodeCompanionChat" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<C-a>",
			"<cmd>CodeCompanionActions<cr>",
			desc = "CodeCompanion Actions",
			mode = { "n", "v" },
			silent = true,
			noremap = true,
		},
		{
			"<leader>ua",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "Toggle CodeCompanion",
			mode = { "n", "v" },
			silent = true,
			noremap = true,
		},
		{
			"ga",
			"<cmd>CodeCompanionChat Add<cr>",
			desc = "CodeCompanion add to context",
			mode = { "v" },
			silent = true,
			noremap = true,
		},
	},
	opts = {
		log_level = "ERROR",
		language = "English",
	},
	config = true,
}
