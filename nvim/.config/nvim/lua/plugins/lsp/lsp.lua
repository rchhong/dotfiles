return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = {
      -- LSP Support
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Config files
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },

    -- Helpers for nvim config
    { "folke/neodev.nvim", opts = {} },

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  },
  config = function()
    local lspconfig = require('lspconfig')
    local lsp_defaults = lspconfig.util.default_config

    -- Needed for nvim-ufo
    local ufo_capabilities = vim.lsp.protocol.make_client_capabilities()
    ufo_capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }

    lsp_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lsp_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities(),
      ufo_capabilities
    )

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
      end
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({})

    require("mason-lspconfig").setup_handlers({
      function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
      end,
    })

    require('lspconfig').ruff_lsp.setup({
      init_options = {
        settings = {
          -- Any extra CLI arguments for `ruff` go here.
          -- args = {"--extend-select", "E", "--extend-select", "I", "--extend-select", "D"},
          args = {"--extend-select", "I", "--extend-select", "D", "--force-exclude"},
        }
      }
    })

    require('lspconfig').pylsp.setup({
      settings = {
        pylsp = {
          configurationSources = {"pycodestyle"},
          plugins = {
            autopep8 = {
              enabled = false
            },
            flake8 = {
              enabled = false
            },
            jedi_completion = {
              enabled = true,
              include_params = true
            },
            pycodestyle = {
              ignore = {"E501", "E121", "E123", "E126", "E226", "E24", "E704", "W503", "W504"}
            },
            pydocstyle = {
              enabled = false,
              convention = 'numpy'
            },
            pylint = {
              enabled = false
            },
            rope_autoimport = {
              enabled = true,
              completions = {
                enabled = false
              },
              code_actions = {
                enabled = true
              }
            },
            yapf = {
              enabled = false
            }
          },
        },
      }, on_attach = on_attach, capabilities = capabilities
    })

    require('lspconfig').pyright.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

  end
}

