return {
    -- Requires external dependencies
    -- pip install pynvim jupyter_client cairosvg pnglatex plotly kaleido pyperclip nbformat
    "benlubas/molten-nvim",
    build = {
        "micromamba run -a \"\" -n base pip install notebook nbclassic jupyter-console cairosvg pnglatex plotly kaleido pyperclip",
        ":UpdateRemotePlugins"
    },
    dependencies = {
        "3rd/image.nvim",
    },
    ft = {
        "markdown",
        "python",
        "quarto"
    },
    keys = {
        {"<leader>me", "<cmd>MoltenEvaluateOperator<CR>", desc="Molten: evaluate operator", mode={"n"}, silent=true},
        {"<leader>mos", "<cmd>noautocmd MoltenEnterOutput<CR>", desc="Molten: open output window", mode={"n"}, silent=true},
        {"<leader>mrr", "<cmd>MoltenReevaluateCell<CR>", desc="Molten: re-evaluate cell", mode={"n"}, silent=true},
        {"<leader>mr", "<cmd><C-u>MoltenEvaluateVisual<CR>gv", desc="Molten: execute visual selection", mode={"v"}, silent=true},
        {"<leader>moh", "<cmd>MoltenHideOutput<CR>", desc="Molten: close output window", mode={"n"}, silent=true},
        {"<leader>mmd", "<cmd>MoltenDelete<CR>", desc="Molten: delete Molten cell", mode={"n"}, silent=true},
        {"<leader>mmx", "<cmd>MoltenOpenInBrowser<CR>", desc="Molten: open output in browser", mode={"n"}, silent=true},
    },
    init = function()
        -- Need to set a keybind for `:noautocmd MoltenEnterOutput` to open the output again
        vim.g.molten_auto_open_output = false

        -- Don't forget to setup and install the plugin if you want to view image outputs
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_use_border_highlights = true

        -- optional, I like wrapping. works for virt text and the output window
        vim.g.molten_wrap_output = true

        -- Output as virtual text. Allows outputs to always be shown, works with images, but can
        -- be buggy with longer images
        vim.g.molten_virt_text_output = true

        -- this will make it so the output shows up below the \`\`\` cell delimiter
        vim.g.molten_virt_lines_off_by_1 = true
    end
}