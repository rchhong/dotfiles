-- Credit LazyNvim
return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	-- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			-- Misc
			"codespell",
			"gitleaks",
			-- Python
			"ruff",
			-- :PylspInstall pylsp-rope
			"python-lsp-server",
			"basedpyright",
			"debugpy",
			-- TS/JS
			"firefox-debug-adapter",
			"js-debug-adapter",
			-- "prettier",
			"prettierd",
			"typescript-language-server",
			"emmet-ls",
			"tailwindcss-language-server",
			"eslint-lsp",
			-- Terraform
			"terraform-ls",
			-- Docker
			"docker-compose-language-service",
			"dockerfile-language-server",
			-- Lua
			"stylua",
			"lua-language-server",
			-- C
			"clangd",
			"clang-format",
			-- SQL
			"sqlfmt",
			"sqlfluff",
			-- Copilot
			"copilot-language-server"
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
	end,
}
