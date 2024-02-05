return {
  "GCBallesteros/jupytext.nvim",
  build = "pip3 install --user jupytext",
  -- Depending on your nvim distro or config you may need to make the loading not lazy
  -- lazy=false,
  opts = {
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
    -- custom_language_formatting = {
    --   python = {
    --     style = "markdown",
    --     output_extension = "md",
    --     force_ft = "markdown",
    --   },
    -- }
  }
}
