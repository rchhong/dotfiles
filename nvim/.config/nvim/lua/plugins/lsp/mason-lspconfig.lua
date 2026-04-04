return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
        -- Refer to https://github.com/mason-org/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/filetype_mappings.lua
		ensure_installed = {
			-- Python
			"ruff",
			"ty",
			-- Lua
            "lua_ls",
			"stylua",
			-- C
			"clangd",
			-- SQL
			"sqruff",
			-- Golang
			"gopls",
            -- Docker
			"docker_language_server",
			"docker_compose_language_service",
            -- Terraform
			"terraformls",
			-- TS/JS
			"ts_ls",
			"tailwindcss",
			"eslint",
            "emmet_ls"
			-- Rust
			-- "rust_analyzer"
		},
	},
}

