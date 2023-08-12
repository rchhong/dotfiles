return {
    "mbbill/undotree",
    cmd = {
        "TodoTreeToggle"
    },
    keys = {
        {'<F5>', mode = {"n"}}
    },
    config = function()
        local m = require("helpers.mapping")

        m.nmap('<F5>', ":UndotreeToggle<CR>")
    end
}

