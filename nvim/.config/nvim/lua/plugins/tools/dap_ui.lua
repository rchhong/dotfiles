return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
       "mfussenegger/nvim-dap"
    },
    opts = {},
    keys = {
        {"<leader>du", function() require("dapui").toggle() end, desc = "DAP UI: Toggle UI"},
        {"<leader>de", function() require("dapui").eval() end, desc = "DAP UI: Eval", mode={"n", "v"}}
    },
    config = function(_, opts)
        require("dap.ext.vscode").load_launchjs()
       
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
    end,
}
