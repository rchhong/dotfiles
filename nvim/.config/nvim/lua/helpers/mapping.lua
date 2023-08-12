local M = {}

function M.map(mode, shortcut, command, opts)
    local user_opts = opts or {}
    local opts = { noremap = true, silent = true }
    
    -- Merge extra options and given options
    for k,v in pairs(user_opts) do
        opts[k] = v
    end

    vim.keymap.set(mode, shortcut, command, opts)
end

function M.nmap(shortcut, command)
    M.map('n', shortcut, command)
end

function M.imap(shortcut, command)
    M.map('i', shortcut, command)
end

function M.vmap(shortcut, command)
    M.map('v', shortcut, command)
end

function M.cmap(shortcut, command)
    M.map('c', shortcut, command)
end

function M.tmap(shortcut, command)
    M.map('t', shortcut, command)
end

return M
