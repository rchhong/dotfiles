return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	cmd = { "TodoTrouble" },
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
		{
			"<leader>xt",
			function()
				require("trouble").toggle("todo")
			end,
			mode = { "n" },
			desc = "TodoTrouble Toggle",
		},
	},
	opts = {
		signs = false,
	},
}
