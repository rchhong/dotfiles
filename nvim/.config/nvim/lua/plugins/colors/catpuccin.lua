return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false, -- disables setting the background color.
		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
		term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
		dim_inactive = {
			enabled = false, -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15, -- percentage of the shade to apply to the inactive window
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		no_underline = false, -- Force no underline
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = function(colors)
			return {
				MoltenOutputBorderSuccess = { fg = colors.green, bold = true },
				MoltenOutputBorderFail = { fg = colors.red, bold = true },
				MoltenOutputFooter = { link = "Comment" },
				MoltenOutputBorder = { link = "Normal" },
				MoltenOutputWin = { link = "Normal" },
			}
		end,
		integrations = {
			blink_cmp = true,
			dap = true,
			dap_ui = true,
			dashboard = true,
			flash = true,
			gitsigns = true,
			harpoon = true,
			illuminate = {
				enabled = true,
				lsp = false,
			},
			indent_blankline = {
				enabled = true,
				scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
				colored_indent_levels = false,
			},
			lsp_trouble = true,
			markdown = true,
			mason = true,
			mini = {
				enabled = true,
				indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
			},
			neotest = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			ufo = true,
			telescope = {
				enabled = true,
			},
			which_key = true,
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			-- Custom integrations for:
			-- Bufferline
			-- Lualine
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)

		-- DAP - custom signs
		local sign = vim.fn.sign_define

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

		vim.cmd.syntax("enable")
		vim.cmd.colorscheme("catppuccin")
	end,
}
