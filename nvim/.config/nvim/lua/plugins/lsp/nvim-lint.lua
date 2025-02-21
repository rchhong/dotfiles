return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "InsertLeave" },
	keys = {
		{
			"<leader>l",
			function()
				require("lint").try_lint()
			end,
			mode = "n",
			desc = "Lint: trigger linting for current file.",
		},
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			-- markdown = {'vale',},
			-- python = {'ruff',}
			sql = { "sqlfluff" },
		}

		local ruff = require("lint").linters.ruff
		ruff.args = {
			"--extend-select",
			"E",
			"--extend-select",
			"I",
			"--extend-select",
			"D",
			"--force-exclude",
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
