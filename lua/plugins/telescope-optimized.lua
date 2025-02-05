if true then
	return {}
end
return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local map = vim.api.nvim_set_keymap

			-- File Searching
			map(
				"n",
				"<leader>fw",
				":Telescope live_grep theme=dropdown<CR>",
				{ noremap = true, silent = true, desc = "Pattern" }
			)
			map(
				"n",
				"<leader>fg",
				":Telescope git_files theme=dropdown<CR>",
				{ noremap = true, silent = true, desc = "Git files" }
			)
			map(
				"n",
				"<leader>ff",
				":Telescope find_files theme=dropdown<CR>",
				{ noremap = true, silent = true, desc = "Files" }
			)

			-- Buffers & Help
			map(
				"n",
				"<leader>bl",
				":Telescope buffers theme=ivy<CR>",
				{ noremap = true, silent = true, desc = "Buffers" }
			)
			map(
				"n",
				"<leader>fh",
				":Telescope help_tags theme=dropdown<CR>",
				{ noremap = true, silent = true, desc = "Help Tags" }
			)

			-- Additional Features
			map(
				"n",
				"<leader>fc",
				":Telescope commands theme=dropdown<CR>",
				{ noremap = true, silent = true, desc = "Commands" }
			)
			map(
				"n",
				"<leader>fd",
				":Telescope diagnostics theme=dropdown<CR>",
				{ noremap = true, silent = true, desc = "Diagnostics" }
			)

			-- Optional Preview Setup (tweak it if necessary)
			require("telescope").setup({
				defaults = {
					preview = {
						files = {
							width = 0.6, -- You can adjust width of file preview
							height = 0.6,
						},
					},
				},
			})
		end,
	},
}
