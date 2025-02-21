return {
	-- TODO: this could replace a ton of plugins I have
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		-- Dashboard on startup
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
		-- Indent guide + scopes
		indent = { enabled = true },
		-- UI for vim.ui.input
		input = { enabled = true },
		-- UI For vim.notify
		notifier = { enabled = true },
		-- Scope detection based on treesiter/indent
		scope = { enabled = true },
		-- Smooth scrolling for NeoVim
		scroll = { enabled = true },
		-- Pretty status column
		statuscolumn = { enabled = true },
		-- Toggle keymaps
		toggle = { enabled = true },
		-- Auto show LSP references + navigate between them
		words = { enabled = true },
		-- Deal with bigfiles
		bigfile = { enabled = true },
		-- Renders files faster
		quickfile = { enabled = true },
		-- Scratch file
	},
  -- stylua: ignore
  keys = {
    { "<leader>n", function()
      if Snacks.config.picker and Snacks.config.picker.enabled then
        Snacks.picker.notifications()
      else
        Snacks.notifier.show_history()
      end
    end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
  },
}
