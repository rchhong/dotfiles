return {
	"GCBallesteros/jupytext.nvim",
	build = 'micromamba run -a "" -n base pip install jupytext',
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
	},
}
