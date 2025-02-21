return {
	"jmbuhr/otter.nvim",
    dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	lazy = true,
	opts = {
		buffers = {
			set_filetype = true,
			write_to_disk = true,
		},
	},
}
