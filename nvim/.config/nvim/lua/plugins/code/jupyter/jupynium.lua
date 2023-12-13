return {
    "kiyoon/jupynium.nvim",
    build = "micromamba install -n base --yes nb_conda_kernels 2> /dev/null && micromamba run -a \"\" -n base pip install notebook nbclassic jupyter-console && micromamba run -a \"\" -n base pip install ~/.local/share/nvim/lazy/jupytext.nvim/pyproject.toml",
    enabled = vim.fn.isdirectory(vim.fn.expand "~/micromamba/envs/base"),
    dependencies = {
      "rcarriga/nvim-notify",   -- optional
      "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
      'kevinhwang91/nvim-ufo',
    },
    keys = {
        {"<leader>jk", "<cmd>JupyniumSelectKernel<CR>", desc="Jupynium: Select Kernel"},
        {"<leader>jr", "<cmd>JupyniumRestartKernel<CR>", desc="Jupynium: Restart Kernel"},
        {"<leader>jj", "<cmd>JupyniumStartAndAttachToServer<CR>", desc="Jupynium: Start and Attach to Server"},
        {"<leader>js", "<cmd>JupyniumStartSync<CR>", desc="Jupynium: Start sync"},
    },
    opts = {
        python_host = { "micromamba", "run", "-a", "\"\"", "-n", "base", "python" },
        jupyter_command = { "micromamba", "run", "-a", "\"\"", "-n", "base", "jupyter" },
        auto_start_server = {
            enable = false,
            file_pattern = { "*.ju.*", "*.ipynb" },
        },
        auto_attach_to_server = {
            enable = false,
            file_pattern = { "*.ju.*", "*.ipynb" },
        },
        auto_start_sync = {
            enable = false,
            file_pattern = { "*.ju.*", "*.ipynb" },
        },
        jupynium_file_pattern = { "*.ju.*", "*.ipynb" },
    },
    config = function(_, opts)
        local jupynium = require("jupynium")
        jupynium.setup(opts)
        jupynium.set_default_keymaps()
        require("jupynium.textobj").set_default_keymaps()
    end
}
