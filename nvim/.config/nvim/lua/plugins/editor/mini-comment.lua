return {
	"nvim-mini/mini.comment",
	keys = {
		{ "gcc", mode = { "n" } },
		{ "gc", mode = { "n", "v" } },
	},
	opts = {
		options = {
			custom_commentstring = function()
				return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
			end,
		},
	},
}
