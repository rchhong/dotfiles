return {
	"nvimdev/dashboard-nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	event = "VimEnter",
	opts = function()
		local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]]

		logo = string.rep("\n", 8) .. logo .. "\n\n"

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = {
					{ key = "f", icon = "", desc = " Find File", action = ":Telescope find_files hidden=true" },
					{ key = "e", icon = "", desc = " New file", action = "ene | startinsert" },
					{ key = "r", icon = "", desc = " Recent Files", action = "Telescope oldfiles" },
					{ key = "g", icon = "", desc = " Find Text", action = "Telescope live_grep" },
					{ key = "t", icon = "", desc = " Todo List", action = "TodoTrouble" },
					{
						key = "s",
						icon = "",
						desc = " Restore Session",
						action = function()
							require("persistence").load({ last = true })
						end,
					},
					{ key = "l", icon = "󰒲", desc = " Lazy", action = "Lazy" },
					{ key = "q", icon = "", desc = " Quit Neovim", action = "qa" },
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "DashboardLoaded",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		return opts
	end,
}
