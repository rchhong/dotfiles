-- Credit LazyNvim
return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    -- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        -- Misc
        'codespell',
        'gitleaks',
        -- Python
        'ruff',
        'ruff-lsp',
        -- :PylspInstall pylsp-rope
        'python-lsp-server',
        'pyright',
        'debugpy',
        -- TS/JS
        'firefox-debug-adapter',
        'js-debug-adapter',
        'prettier',
        'typescript-language-server',
        'emmet-ls',
        'tailwindcss-language-server',
        'eslint-lsp',
        -- Terraform
        'terraform-ls',
        -- Docker
        'docker-compose-language-service',
        'dockerfile-language-server',
        -- Lua
        'stylua',
        'lua-language-server',
        -- C
        'clangd',
        'clang-format',
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)

      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  }
