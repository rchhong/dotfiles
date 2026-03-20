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
			"ty",
			"debugpy",
			-- TS/JS
			"firefox-debug-adapter",
			"js-debug-adapter",
			"prettierd",
			"typescript-language-server",
			"emmet-ls",
			"tailwindcss-language-server",
			"eslint-lsp",
			"svelte-language-server",
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
			"copilot-language-server",
			-- Golang
			"gopls",
			"goimports",
			"go-debug-adapter",
			"delve"
			-- Rust
			-- "rust-analyzer"
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
	end,
}
