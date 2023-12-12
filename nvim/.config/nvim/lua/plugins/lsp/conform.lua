return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<F3>",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "trim_whitespace" },
        markdown = { "vale" },
        javascript = { "prettier" },
        -- ["*"] = { "codespell" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
        async = true,
      },
      formatters = {},
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      require("conform").formatters.ruff_fix = {
        prepend_args = {"--extend-select", "E", "--extend-select", "I", "--extend-select", "D", "--force-exclude"},
      }
    end,
  }
