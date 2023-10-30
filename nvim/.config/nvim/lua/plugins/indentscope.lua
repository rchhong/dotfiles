return {
    "echasnovski/mini.indentscope",
    version = "*",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
    --   symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
        opts.draw = { delay = 0, animation = require('mini.indentscope').gen_animation.none()}
        require('mini.indentscope').setup(opts)
    end
  }