return {
	"echasnovski/mini.indentscope",
	version = "*",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = function()
		local no_animation = require("mini.indentscope").gen_animation.none()
		local opts = {
			symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
			draw = {
				delay = 0,
				animation = no_animation,
			},
		}
		return opts
	end,
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
