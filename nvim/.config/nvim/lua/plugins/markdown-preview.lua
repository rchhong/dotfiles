-- install without yarn or npm
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
        {"<Leader>mdp", "<cmd>MarkdownPreviewToggle<CR>", mode={"n"}, desc="Markdown Preview Toggle"}
    },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}