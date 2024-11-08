return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap-python",
	},
	keys = {
		{
			"<leader>dbB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "DAP: Breakpoint Condition",
		},
		{
			"<leader>dbb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "DAP: Toggle Breakpoint",
		},
		{
			"<leader>dbc",
			function()
				require("dap").continue()
			end,
			desc = "DAP: Continue",
		},
		{
			"<leader>dba",
			function()
				require("dap").continue({ before = get_args })
			end,
			desc = "DAP: Run with Args",
		},
		{
			"<leader>dbC",
			function()
				require("dap").run_to_cursor()
			end,
			desc = "DAP: Run to Cursor",
		},
		{
			"<leader>dbg",
			function()
				require("dap").goto_()
			end,
			desc = "DAP: Go to line (no execute)",
		},
		{
			"<leader>dbi",
			function()
				require("dap").step_into()
			end,
			desc = "DAP: Step Into",
		},
		{
			"<leader>dbj",
			function()
				require("dap").down()
			end,
			desc = "DAP: Down",
		},
		{
			"<leader>dbk",
			function()
				require("dap").up()
			end,
			desc = "DAP: Up",
		},
		{
			"<leader>dbl",
			function()
				require("dap").run_last()
			end,
			desc = "DAP: Run Last",
		},
		{
			"<leader>dbo",
			function()
				require("dap").step_out()
			end,
			desc = "DAP: Step Out",
		},
		{
			"<leader>dbO",
			function()
				require("dap").step_over()
			end,
			desc = "DAP: Step Over",
		},
		{
			"<leader>dbp",
			function()
				require("dap").pause()
			end,
			desc = "DAP: Pause",
		},
		{
			"<leader>dbr",
			function()
				require("dap").repl.toggle()
			end,
			desc = "DAP: Toggle REPL",
		},
		{
			"<leader>dbs",
			function()
				require("dap").session()
			end,
			desc = "DAP: Session",
		},
		{
			"<leader>dbt",
			function()
				require("dap").terminate()
			end,
			desc = "DAP: Terminate",
		},
		{
			"<leader>dbw",
			function()
				require("dap.ui.widgets").hover()
			end,
			desc = "DAP: Widgets",
		},
	},
	config = function()
		-- python
		require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

		-- firefox debugger
		local dap = require("dap")

		dap.adapters.firefox = {
			type = "executable",
			command = "bash",
			args = { vim.fn.stdpath("data") .. "/mason/bin/firefox-debug-adapter" },
		}

		-- Node
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "bash",
				-- 💀 Make sure to update this path to point to your installation
				args = { vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter", "${port}" },
			},
		}

		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				name = "Debug with Firefox",
				type = "firefox",
				request = "launch",
				reAttach = true,
				url = "http://localhost:3000",
				webRoot = "${workspaceFolder}",
				-- TODO: Change this
				firefoxExecutable = "/usr/bin/firefox",
			},
		}

		dap.configurations.javascript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				name = "Debug with Firefox",
				type = "firefox",
				request = "launch",
				reAttach = true,
				url = "http://localhost:3000",
				webRoot = "${workspaceFolder}",
				-- TODO: Change this
				firefoxExecutable = "/usr/bin/firefox",
			},
		}

		-- For web browsers, need to assign browser to ts/js
		require("dap.ext.vscode").load_launchjs(nil, {
			firefox = { "typescript", "javascript" },
			chrome = { "typescript", "javascript" },
		})

		-- Go
		dap.adapters.delve = {
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}" },
				-- add this if on windows, otherwise server won't open successfully
				-- detached = false
			},
		}

		-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
		dap.configurations.go = {
			{
				type = "delve",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "delve",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			-- works with go.mod packages and sub packages
			{
				type = "delve",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
			},
		}
	end,
}
