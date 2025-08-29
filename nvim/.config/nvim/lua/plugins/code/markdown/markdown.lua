return {
	"MeanderingProgrammer/markdown.nvim",
	build = {
		'micromamba run -a "" -n base pip install pylatexenc',
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-mini/mini.icons",
	},
	opts = {
		enabled = false,
		file_type = { "markdown", "quarto" },
	},
	main = "render-markdown",
	name = "render-markdown",
	cmd = { "RenderMarkdown" },
	keys = {
		{
			"<Leader>mdp",
			function()
				require("render-markdown").toggle()
			end,
			mode = { "n" },
			desc = "Markdown Preview Toggle",
		},
	},
}
