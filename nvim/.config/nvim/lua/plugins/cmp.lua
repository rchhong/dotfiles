return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',     -- Required
    dependencies = {
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" }
    },
    config = function ()
        -- You need to setup `cmp` after lsp-zero
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
          sources = {
            {name = 'path'},
            {name = 'nvim_lsp'},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 2},
          },
          mapping = {
            -- `Enter` key to confirm completion
            ['<CR>'] = cmp.mapping.confirm({select = false}),

            -- Ctrl+Space to trigger completion menu
            ['<C-Space>'] = cmp.mapping.complete(),

            -- Navigate between snippet placeholder
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          },
          completion = {
            completeopt = 'menu,menuone,noinsert'
          }
        })
        -- Insert `(` after select function or method item
        cmp.event:on(
          'confirm_done',
          cmp_autopairs.on_confirm_done()
        )
    end
}
