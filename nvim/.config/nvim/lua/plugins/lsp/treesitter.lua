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
		local parsers_to_install = vim.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(already_installed, parser)
			end)
			:totable()
		ts.install(parsers_to_install)

		-- Auto-install and start parsers for unknown filetypes
		vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
			callback = function(event)
				local bufnr = event.buf
				local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

				-- Skip if no filetype
				if filetype == "" then
					return
				end

				-- Get parser name based on filetype
				local parser_name = vim.treesitter.language.get_lang(filetype) -- WARNING: might return filetype (not helpful)
				if not parser_name then
					-- vim.notify(
					--   "Filetype " .. vim.inspect(filetype) .. " has no parser registered",
					--   vim.log.levels.WARN,
					--   { title = "core/treesitter" }
					-- )
					return
				end

				-- vim.notify(
				--   vim.inspect("Successfully got parser " .. parser_name .. " for filetype " .. filetype),
				--   vim.log.levels.DEBUG,
				--   { title = "core/treesitter" }
				-- )

				-- Check if parser_name is available in parser configs
				local parser_configs = require("nvim-treesitter.parsers")
				local parser_can_be_used = parser_configs[parser_name]
				if not parser_can_be_used then
					-- vim.notify(
					--   "Parser config does not have parser " .. vim.inspect(parser_name) .. ", skipping",
					--   vim.log.levels.WARN,
					--   { title = "core/treesitter" }
					-- )
					return -- Parser not ailable, skip silently
				end

				local parser_installed = vim.treesitter.get_parser(bufnr, parser_name) ~= nil

				-- If not installed, install parser synchronously
				if not parser_installed then
					require("nvim-treesitter").install({ parser_name }):wait(30000)
					if vim.fn.has("mac") == 1 then
						local parser_path = vim.fn.stdpath("data") .. "/site/parser/" .. parser_name .. ".so"
						if vim.fn.filereadable(parser_path) == 1 then
							vim.fn.system({ "codesign", "--force", "--sign", "-", parser_path })
						end
					end
				end

				-- Check so tree-sitter can see the newly installed parser
				parser_installed = vim.treesitter.get_parser(bufnr, parser_name) ~= nil
				if not parser_installed then
					vim.notify(
						"Failed to get parser for " .. parser_name .. " after installation",
						vim.log.levels.WARN,
						{ title = "core/treesitter" }
					)
					return
				end

				-- Start treesitter for this buffer
				vim.treesitter.start(bufnr, parser_name)
			end,
		})
	end,
}
