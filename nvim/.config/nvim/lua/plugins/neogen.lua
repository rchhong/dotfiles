return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = { "Neogen" },
    keys = {
        {"<Leader>ng", function() require("neogen").generate() end, mode={"n"}, desc="Neogen"}
    },
    opts = {
        snippet_engine = "luasnip"
    },
    config = true,
}