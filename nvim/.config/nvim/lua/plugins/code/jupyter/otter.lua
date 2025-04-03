return {
	"jmbuhr/otter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	-- name = "otter.nvim",
	-- dev = true,
	lazy = true,
	opts = {
		buffers = {
			set_filetype = true,
			write_to_disk = true,
		},
	},
	config = function(_, opts)
		require("otter").setup(opts)
		-- require("otter").activate()
	end,
}
