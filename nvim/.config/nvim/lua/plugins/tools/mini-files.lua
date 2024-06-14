return {
	"echasnovski/mini.files",
	version = false,
	keys = {
		{
			"<F6>",
			function()
				if not require("mini.files").close() then
					require("mini.files").open()
				end
			end,
			desc = "Mini.files: cwd",
			mode = { "n" },
		},
	},
	opts = {
		windows = {
			preview = true,
		},
	},
}
