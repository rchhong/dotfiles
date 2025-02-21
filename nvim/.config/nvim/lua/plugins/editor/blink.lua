return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippets
		{ "echasnovski/mini.snippets" },
		{ "rafamadriz/friendly-snippets" },

		-- For jupyter notebook
		{ "jmbuhr/otter.nvim" },

		-- Helpers for nvim config
		{ "folke/lazydev.nvim", ft = "lua" },

		-- Supermaven
		{ "saghen/blink.compat" },
		{ "supermaven-inc/supermaven-nvim" },
	},

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = { preset = "enter" },

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "supermaven", "buffer" },
			providers = {
				supermaven = {
					name = "supermaven",
					module = "blink.compat.source",
					score_offset = 100,
					async = true,
				},
			},
		},
		-- Use mini.snippets
		snippets = { preset = "mini_snippets" },
		cmdline = {
			enabled = true,
		},
		completion = {
			menu = {
				draw = {
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- Optionally, you may also use the highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
