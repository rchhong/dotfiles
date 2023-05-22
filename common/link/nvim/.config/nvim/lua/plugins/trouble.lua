return {
    "folke/trouble.nvim",
    cmd = {
        "TroubleToggle",
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        require('trouble').setup({

        })

        local m = require("helpers/mapping")
        local trouble = require("trouble")

        m.nmap("<leader>xx", ":TroubleToggle<CR>")
        m.nmap("<leader>xw", ":TroubleToggle workspace_diagnostics<CR>")
        m.nmap("<leader>xd", ":TroubleToggle document_diagnostics<CR>")
        m.nmap("<leader>xl", ":TroubleToggle loclist<CR>")
        m.nmap("<leader>xq", ":TroubleToggle quickfix<CR>")
        m.nmap("gR", ":TroubleToggle lsp_references<CR>")
    end
}
