return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	cmd = {
		"SupermavenUseFree",
		"SupermavenUsePro",
	},
	keys = {
		{
			"<leader>ul",
			function()
				local api = require("supermaven-nvim.api")
				vim.g.ai_cmp = not vim.g.ai_cmp
				if vim.g.ai_cmp then
					api.stop()
					print("Disabled LLM completion")
				else
					api.start()
					print("Enabled LLM completion")
				end
			end,
			desc = "Toggle LLM completion",
		},
	},
	opts = {
		keymaps = {
			accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
		},
		disable_inline_completion = vim.g.ai_cmp,
		condition = function()
			return not vim.g.ai_cmp
		end,
		ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
	},
}
