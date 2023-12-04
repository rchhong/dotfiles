return {
    "kiyoon/jupynium.nvim",
    build = "micromamba install -n base --yes nb_conda_kernels 2> /dev/null && micromamba run -a \"\" -n base pip install notebook nbclassic jupyter-console && micromamba run -a \"\" -n base pip install ~/.local/share/nvim/lazy/jupytext.nvim/pyproject.toml",
    enabled = vim.fn.isdirectory(vim.fn.expand "~/micromamba/envs/base"),
    dependencies = {
      "rcarriga/nvim-notify",   -- optional
      "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
    },
    ft = {"python"},
    opts = {
        python_host = { "micromamba", "run", "-a", "\"\"", "-n", "base", "python" },
        jupyter_command = { "micromamba", "run", "-a", "\"\"", "-n", "base", "jupyter" },
        auto_start_server = {
            enable = true,
            file_pattern = { "*.ju.*", "*.ipynb" },
        },
        auto_attach_to_server = {
            enable = true,
            file_pattern = { "*.ju.*", "*.ipynb" },
        },
        auto_start_sync = {
            enable = true,
            file_pattern = { "*.ju.*", "*.ipynb" },
        },
        jupynium_file_pattern = { "*.ju.*", "*.ipynb" },
    }
}
