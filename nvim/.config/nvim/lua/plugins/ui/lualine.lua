return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-mini/mini.icons",
	},
	opts = function()
		--- @param always_truncate boolean always truncate
		--- @param trunc_width number truncates component when screen width is less then trunc_width
		--- @param trunc_len number truncates component to trunc_len number of chars
		--- @param hide_width number hides component when window width is smaller then hide_width
		--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
		--- return function that can format the component accordingly
		local function trunc(always_truncate, trunc_width, trunc_len, hide_width, no_ellipsis)
			return function(str)
				local win_width = vim.fn.winwidth(0)
				if always_truncate and trunc_len then
					if str:len() == 0 then
						return ""
					end
					if str:len() < trunc_len then
						return str
					end
					return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
				elseif hide_width and win_width < hide_width then
					return ""
				elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
					return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
				end
				return str
			end
		end

		return {
			options = {
				theme = "catppuccin",
				disabled_filetypes = { "Lazy", "NvimTree", "Trouble" },
				section_separators = "",
				component_separators = "",
			},
			sections = {
				lualine_b = {
					{ "branch", fmt = trunc(true, nil, 20, nil, false) },
					"diff",
					"diagnostics",
				},
			},
		}
	end,
}
