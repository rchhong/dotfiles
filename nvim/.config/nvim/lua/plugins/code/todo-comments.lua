return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	cmd = { "TodoTrouble" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/snacks.nvim",
		"folke/trouble.nvim",
	},
	keys = {
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
		},

		{ "<leader>xt", "<cmd>Trouble todo<cr>", desc = "TodoTrouble Toggle", mode = { "n" } },
	},
	opts = {
		signs = false,
	},
}
