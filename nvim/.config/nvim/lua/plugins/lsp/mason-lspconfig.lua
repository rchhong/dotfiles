return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
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
			"sqruff",
			-- Copilot
			"copilot-language-server",
			-- Golang
			"gopls",
			"goimports",
			"go-debug-adapter",
			"delve",
			-- Rust
			-- "rust-analyzer"
		},
	},
}

