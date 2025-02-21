return {
	-- Requires external dependencies
	-- pip install pynvim jupyter_client cairosvg pnglatex plotly kaleido pyperclip nbformat
	"benlubas/molten-nvim",
	build = {
		'micromamba run -a "" -n base pip install pynvim jupyter_client cairosvg pnglatex plotly kaleido pyperclip nbformat pillow requests websocket-client',
		":UpdateRemotePlugins",
	},
	dependencies = {
		"3rd/image.nvim",
	},
	ft = {
		"markdown",
		"python",
		"quarto",
	},
	keys = {
		{
			"<leader>me",
			"<cmd>MoltenEvaluateOperator<CR>",
			desc = "Molten: evaluate operator",
			mode = { "n" },
			silent = true,
		},
		{
			"<leader>mos",
			"<cmd>noautocmd MoltenEnterOutput<CR>",
			desc = "Molten: open output window",
			mode = { "n" },
			silent = true,
		},
		{
			"<leader>mrr",
			"<cmd>MoltenReevaluateCell<CR>",
			desc = "Molten: re-evaluate cell",
			mode = { "n" },
			silent = true,
		},
		{
			"<leader>mr",
			"<cmd><C-u>MoltenEvaluateVisual<CR>gv",
			desc = "Molten: execute visual selection",
			mode = { "v" },
			silent = true,
		},
		{
			"<leader>moh",
			"<cmd>MoltenHideOutput<CR>",
			desc = "Molten: close output window",
			mode = { "n" },
			silent = true,
		},
		{ "<leader>mmd", "<cmd>MoltenDelete<CR>", desc = "Molten: delete Molten cell", mode = { "n" }, silent = true },
		{
			"<leader>mmx",
			"<cmd>MoltenOpenInBrowser<CR>",
			desc = "Molten: open output in browser",
			mode = { "n" },
			silent = true,
		},
		{ "<leader>mt", "<cmd>MoltenInterrupt<CR>", desc = "Molten: terminate kernel", mode = { "n" }, silent = true },
	},
	init = function()
		-- Need to set a keybind for `:noautocmd MoltenEnterOutput` to open the output again
		vim.g.molten_auto_open_output = false

		-- Don't forget to setup and install the plugin if you want to view image outputs
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_use_border_highlights = true

		-- optional, I like wrapping. works for virt text and the output window
		vim.g.molten_wrap_output = true

		-- Output as virtual text. Allows outputs to always be shown, works with images, but can
		-- be buggy with longer images
		vim.g.molten_virt_text_output = true

		-- this will make it so the output shows up below the \`\`\` cell delimiter
		vim.g.molten_virt_lines_off_by_1 = true

		-- execution time
		vim.g.molten_output_show_exec_time = true

		-- change the configuration when editing a python file
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.py",
			callback = function(e)
				if string.match(e.file, ".otter.") then
					return
				end
				if require("molten.status").initialized() == "Molten" then -- this is kinda a hack...
					vim.fn.MoltenUpdateOption("virt_lines_off_by_1", false)
					vim.fn.MoltenUpdateOption("virt_text_output", false)
				else
					vim.g.molten_virt_lines_off_by_1 = false
					vim.g.molten_virt_text_output = false
				end
			end,
		})

		-- Undo those config changes when we go back to a markdown or quarto file
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.qmd", "*.md", "*.ipynb" },
			callback = function(e)
				if string.match(e.file, ".otter.") then
					return
				end
				if require("molten.status").initialized() == "Molten" then
					vim.fn.MoltenUpdateOption("virt_lines_off_by_1", true)
					vim.fn.MoltenUpdateOption("virt_text_output", true)
				else
					vim.g.molten_virt_lines_off_by_1 = true
					vim.g.molten_virt_text_output = true
				end
			end,
		})

		-- automatically import output chunks from a jupyter notebook
		-- tries to find a kernel that matches the kernel in the jupyter notebook
		-- falls back to a kernel that matches the name of the active venv (if any)
		local imb = function(e) -- init molten buffer
			vim.schedule(function()
				local kernels = vim.fn.MoltenAvailableKernels()
				local try_kernel_name = function()
					local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
					return metadata.kernelspec.name
				end
				local ok, kernel_name = pcall(try_kernel_name)
				if not ok or not vim.tbl_contains(kernels, kernel_name) then
					kernel_name = nil
					local venv = os.getenv("VIRTUAL_ENV")
					if venv ~= nil then
						kernel_name = string.match(venv, "/.+/(.+)")
					end
				end
				if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
					vim.cmd(("MoltenInit %s"):format(kernel_name))
				end
				vim.cmd("MoltenImportOutput")
			end)
		end

		-- automatically import output chunks from a jupyter notebook
		vim.api.nvim_create_autocmd("BufAdd", {
			pattern = { "*.ipynb" },
			callback = imb,
		})

		-- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = { "*.ipynb" },
			callback = function(e)
				if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
					imb(e)
				end
			end,
		})

		-- automatically export output chunks to a jupyter notebook on write
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.ipynb" },
			callback = function()
				if require("molten.status").initialized() == "Molten" then
					vim.cmd("MoltenExportOutput!")
				end
			end,
		})
	end,
}
