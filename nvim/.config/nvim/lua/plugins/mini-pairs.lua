return {
    "echasnovski/mini.pairs",
    lazy = true,
    event = "InsertEnter",
    opt = {},
    keys = {
        {
          "<leader>up",
          function()
            vim.g.minipairs_disable = not vim.g.minipairs_disable
            if vim.g.minipairs_disable then
                nvim_echo("Disabled auto pairs", false)
            else
                nvim_echo("Enabled auto pairs", false)
            end
          end,
          desc = "Toggle auto pairs",
        },
      },
}
