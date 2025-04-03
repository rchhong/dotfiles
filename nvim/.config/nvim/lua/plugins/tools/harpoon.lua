return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			mode = { "n" },
			desc = "Harpoon: Add to list",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 1",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 2",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 3",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 4",
		},
		{
			"<leader>h5",
			function()
				require("harpoon"):list():select(5)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 5",
		},
		{
			"<leader>h6",
			function()
				require("harpoon"):list():select(6)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 6",
		},
		{
			"<leader>h7",
			function()
				require("harpoon"):list():select(7)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 7",
		},
		{
			"<leader>h8",
			function()
				require("harpoon"):list():select(8)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 8",
		},
		{
			"<leader>h9",
			function()
				require("harpoon"):list():select(9)
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to file 9",
		},
		{
			"<leader>hn",
			function()
				require("harpoon"):list():next()
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to next buffer",
		},
		{
			"<leader>hp",
			function()
				require("harpoon"):list():prev()
			end,
			mode = { "n" },
			desc = "Harpoon: Jump to previous buffer",
		},
		{
			"<leader>hl",
			function()
				require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())
			end,
			mode = { "n" },
			desc = "Harpoon: Show all harpoon marks",
		},
	},
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = false,
				sync_on_ui_close = false,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })
			end,
		})

		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
	end,
}
