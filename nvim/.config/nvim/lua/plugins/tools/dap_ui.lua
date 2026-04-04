return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",
	},
	keys = {
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "DAP UI: Toggle UI",
		},
		{
			"<leader>de",
			function()
				require("dapui").eval()
			end,
			desc = "DAP UI: Eval",
			mode = { "n", "v" },
		},
	},
	opts = {},
	config = function(_, opts)
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup(opts)
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
