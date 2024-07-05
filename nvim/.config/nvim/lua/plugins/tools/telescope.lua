return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	lazy = true,
	priority = 100,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"echasnovski/mini.icons",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-fzf-native.nvim",
		"folke/trouble.nvim",
		"neovim/nvim-lspconfig",
	},
	cmd = {
		"Telescope",
	},
	keys = {
		{
			"<C-p>",
			function()
				require("telescope.builtin").find_files({ hidden = true, no_ignore = false, no_ignore_parent = false })
			end,
			mode = { "n" },
			desc = "Telescope: find files",
		},
		{
			"<C-b>",
			function()
				require("telescope.builtin").buffers({ sort_mru = true, sort_lastused = true })
			end,
			mode = { "n" },
			desc = "Telescope: buffers",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = { "n" },
			desc = "Telescope: live grep",
		},
		{ '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Telescope: registers" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Telescope: marks" },
		{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Telescope: document diagnostics" },
		{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Telescope: Workspace diagnostics" },
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Telescope: document symbols",
		},
		{
			"<leader>sS",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "Telescope: workplace symbols",
		},
		{
			"<C-t>",
			-- function()
			--     local actions = require("telescope.actions")
			--     local trouble = require("trouble.providers.telescope")

			--     local telescope = require("telescope")

			--     trouble.open_with_trouble()
			-- end,
			mode = { "i", "n" },
			desc = "Telescope: open in trouble",
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = {
				".git/",
				"^node_modules/",
				"^build/",
				".cache",
				"%.pdf",
				"%.mkv",
				"%.mp4",
				"%.zip",
				"__pycache__/",
				".ipynb_checkpoints/",
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				no_ignore = false,
				no_ignore_parent = false,
			},
			oldfiles = {
				cwd_only = true,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
	init = function()
		-- Open telescope if directory given as input
		local is_git_dir = function()
			return os.execute("git rev-parse --is-inside-work-tree >> /dev/null 2>&1")
		end

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				local bufferPath = vim.fn.expand("%:p")
				if vim.fn.isdirectory(bufferPath) ~= 0 then
					local ts_builtin = require("telescope.builtin")
					vim.api.nvim_buf_delete(0, { force = true })
					ts_builtin.find_files({ hidden = true })
				end
			end,
		})
	end,
	config = function(_, opts)
		require("telescope").load_extension("fzf")

		local actions = require("telescope.actions")
		local trouble = require("trouble.sources.telescope")

		local telescope = require("telescope")

		opts.defaults.mappings = {
			i = { ["<c-t>"] = trouble.open },
			n = { ["<c-t>"] = trouble.open },
		}

		require("telescope").setup(opts)
	end,
}
