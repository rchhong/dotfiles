return {
	"echasnovski/mini.icons",
	opts = {},
	lazy = true,
	priority = 1000,
	init = function()
		require("mini.icons").setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
}
