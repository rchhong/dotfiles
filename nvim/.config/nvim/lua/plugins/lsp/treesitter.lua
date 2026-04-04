return {
	"nvim-treesitter/nvim-treesitter",
    branch = "main",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"python",
			"typescript",
			"tsx",
			"javascript",
			"json",
			"yaml",
			"toml",
			"go",
		},
	},
	config = function(_, opts)
		-- Install things in ensure_installed
		local ts = require("nvim-treesitter")
		local ensure_installed = opts["ensure_installed"]
		local already_installed = ts.get_installed("parsers")
		local parsers_to_install = vim
			.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(already_installed, parser)
			end)
			:totable()
		ts.install(parsers_to_install)

		-- Auto-install and start parsers for unknown filetypes
		vim.api.nvim_create_autocmd({ "FileType" }, {
			desc = "Enable Treesitter",
			callback = function(event)
				local bufnr = event.buf
				local filetype = vim.bo[bufnr].filetype
				-- Skip if no filetype
				if filetype == "" then
					return
				end
				-- Set values to ignore ft
				---@diagnostic disable-next-line: unused-local
				local ignore_fts = {}

				-- Get parser name based on filetype
				local parser_name = vim.treesitter.language.get_lang(filetype)
				if not parser_name then
					utils.notify(vim.inspect("No treesitter parser found for filetype: " .. filetype), "WARN", "Treesitter")
					return
				end

				-- Try to get existing parser
				local parser_configs = require("nvim-treesitter.parsers")
				if not parser_configs[parser_name] then
					return -- Parser not available, skip silently
				end

				local parser_exists = pcall(vim.treesitter.get_parser, bufnr, parser_name)

				if not parser_exists then
					-- check if parser is already installed
					if vim.tbl_contains(already_installed, parser_name) then
						vim.notify("Parser for " .. parser_name .. " already installed.", vim.log.levels.INFO)
					else
						vim.notify("Installing parser for " .. parser_name, vim.log.levels.INFO)
						ts.install({ parser_name })
					end
				end

				vim.treesitter.start(bufnr, parser_name)
				-- vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
				-- vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
		-- Re-attach treesitter to already-open buffers.
		-- When a file is opened via snacks picker, BufReadPost fires to trigger lazy-loading
		-- treesitter, but by the time treesitter finishes loading and registers its autocmds,
		-- that BufReadPost event has already passed. Re-firing it here ensures the first
		-- buffer gets highlighted without needing a manual :e.
		vim.api.nvim_exec_autocmds("BufReadPost", { buffer = vim.api.nvim_get_current_buf() })
	end,
}
