return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Spectre: Replace in files" },
  },
  opts = { open_cmd = "noswapfile vnew" },
}