return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "LspAttach" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<F3>",
			function()
				require("conform").format({ lsp_fallback = true, async = true })
			end,
			desc = "Conform: Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format", "trim_whitespace" },
			c = { "clang_format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			less = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			["markdown.mdx"] = { "prettier" },
			graphql = { "prettier" },
			handlebars = { "prettier" },
			terraform = { "terraform_fmt" },
			["*"] = { "codespell" },
		},
		format_on_save = function(bufnr)
			if vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat then
				return nil
			end
			return { timeout_ms = 1000, lsp_fallback = true }
		end,
		formatters = {},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		require("conform").formatters.ruff_fix = {
			prepend_args = { "--extend-select", "E", "--extend-select", "I", "--extend-select", "D" },
		}

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					["start"] = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })

		-- format enable/disable commands
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
