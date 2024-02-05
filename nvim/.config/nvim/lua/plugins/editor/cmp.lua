return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",     -- Required
    dependencies = {
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" },
        { "jmbuhr/otter.nvim" }
    },
    config = function ()
        -- You need to setup `cmp` after lsp-zero
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
          sources = {
            -- {name = "jupynium", priority = 1000 },
            {name = "otter"},
            {name = 'nvim_lsp'},
            {name = 'luasnip'},
            {name = 'path'},
            {name = 'buffer'},
          },
          mapping = {
            -- `Enter` key to confirm completion
            ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),

            -- Ctrl+Space to trigger completion menu
            ['<C-Space>'] = cmp.mapping.complete(),

            -- Abort completion, sometimes needed when trying to fill out snippets
            ["<C-e>"] = cmp.mapping.abort(),

            -- Super-tab handles completion vs snippet variable
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- that way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<Down>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
              -- that way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<U>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          },
          completion = {
            completeopt = 'menu,menuone,noinsert'
          },
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body)
            end,
          },
          sorting = {
            priority_weight = 1.0,
            comparators = {
              cmp.config.compare.score,            -- Jupyter kernel completion shows prior to LSP
              cmp.config.compare.recently_used,
              cmp.config.compare.locality,
            },
          }
        })
    end
}
