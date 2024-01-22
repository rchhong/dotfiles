return {
    'mfussenegger/nvim-dap',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        'mfussenegger/nvim-dap-python'
    },
    keys = {
        { "<leader>dbB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<leader>dbb", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>dbc", function() require("dap").continue() end, desc = "Continue" },
        { "<leader>dba", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
        { "<leader>dbC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
        { "<leader>dbg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
        { "<leader>dbi", function() require("dap").step_into() end, desc = "Step Into" },
        { "<leader>dbj", function() require("dap").down() end, desc = "Down" },
        { "<leader>dbk", function() require("dap").up() end, desc = "Up" },
        { "<leader>dbl", function() require("dap").run_last() end, desc = "Run Last" },
        { "<leader>dbo", function() require("dap").step_out() end, desc = "Step Out" },
        { "<leader>dbO", function() require("dap").step_over() end, desc = "Step Over" },
        { "<leader>dbp", function() require("dap").pause() end, desc = "Pause" },
        { "<leader>dbr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>dbs", function() require("dap").session() end, desc = "Session" },
        { "<leader>dbt", function() require("dap").terminate() end, desc = "Terminate" },
        { "<leader>dbw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    config = function()
        -- python
        require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

        -- firefox debugger
        local dap = require('dap')

        dap.adapters.firefox = {
            type = 'executable',
            command = 'node',
            args = {vim.fn.stdpath("data") .. '/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js'},
        }

        dap.configurations.typescript = {
            {
            name = 'Debug with Firefox',
            type = 'firefox',
            request = 'launch',
            reAttach = true,
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            firefoxExecutable = '/opt/homebrew/bin/firefox'
            }
        }

        dap.configurations.javascript = {
            {
            name = 'Debug with Firefox',
            type = 'firefox',
            request = 'launch',
            reAttach = true,
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            firefoxExecutable = '/opt/homebrew/bin/firefox'
            }
        }

        -- Node
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
              command = "node",
              -- 💀 Make sure to update this path to point to your installation
              args = {"/path/to/js-debug/src/dapDebugServer.js", "${port}"},
            }
        }

        dap.configurations.typescript = {
            {
              type = 'pwa-node',
              request = 'launch',
              name = "Launch file",
              runtimeExecutable = "deno",
              runtimeArgs = {
                "run",
                "--inspect-wait",
                "--allow-all"
              },
              program = "${file}",
              cwd = "${workspaceFolder}",
              attachSimplePort = 9229,
            },
        }

        dap.configurations.javascript = {
            {
              type = 'pwa-node',
              request = 'launch',
              name = "Launch file",
              runtimeExecutable = "deno",
              runtimeArgs = {
                "run",
                "--inspect-wait",
                "--allow-all"
              },
              program = "${file}",
              cwd = "${workspaceFolder}",
              attachSimplePort = 9229,
            },
        }
    end
}
