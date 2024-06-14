return {
	"echasnovski/mini.surround",
	event = "VeryLazy",
	opts = {
		mappings = {
			add = "ys", -- Add surrounding in Normal and Visual modes
			delete = "ds", -- Delete surrounding
			find = "fs", -- Find surrounding (to the right)
			find_left = "Fs", -- Find surrounding (to the left)
			highlight = "hs", -- Highlight surrounding
			replace = "cs", -- Replace surrounding
			update_n_lines = ",ns", -- Update `n_lines`
		},
	},
}
