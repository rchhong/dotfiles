return {
	"nvim-mini/mini.surround",
	keys = {
		{ "ys", desc = "Add Surrounding", mode = { "n", "x" } },
		{ "ds", desc = "Delete Surrounding" },
		{ "fs", desc = "Find Right Surrounding" },
		{ "Fs", desc = "Find Left Surrounding" },
		{ "hs", desc = "Highlight Surrounding" },
		{ "cs", desc = "Replace Surrounding" },
		{ ",ns", desc = "Update mini-surround n_lines" },
	},
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
