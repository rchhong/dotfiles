return {
	"olimorris/codecompanion.nvim",
	cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionToggle", "CodeCompanionAdd", "CodeCompanionChat" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<C-a>",
			"<cmd>CodeCompanionActions<cr>",
			desc = "CodeCompanion Actions",
			mode = { "n", "v" },
			silent = true,
			noremap = true,
		},
		{
			"<leader>ua",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "Toggle CodeCompanion",
			mode = { "n", "v" },
			silent = true,
			noremap = true,
		},
		{
			"ga",
			"<cmd>CodeCompanionChat Add<cr>",
			desc = "CodeCompanion add to context",
			mode = { "v" },
			silent = true,
			noremap = true,
		},
	},
	opts = function()
		local adapters = require("codecompanion.adapters")
		return {
			log_level = "ERROR",
			language = "English",
			adapters = {
				anthropic = function()
					return adapters.extend("anthropic", {
						env = {
							api_key = "cmd:cat ~/.dotfiles/private/anthropic_key.txt | awk '{$1=$1;print}'",
						},
					})
				end,
				-- llama3 = function()
				-- 	return require("codecompanion.adapters").extend("ollama", {
				-- 		name = "llama3", -- Give this adapter a different name to differentiate it from the default ollama adapter
				-- 		schema = {
				-- 			model = {
				-- 				default = "llama3:latest",
				-- 			},
				-- 			num_ctx = {
				-- 				default = 16384,
				-- 			},
				-- 			num_predict = {
				-- 				default = -1,
				-- 			},
				-- 		},
				-- 	})
				-- end,
			},
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
			},
		}
	end,
	config = true,
}
