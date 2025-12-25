return {
	{
		"caesar003/vim-closebuffer",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>x",
				":CloseBuffer<CR>",
				{ noremap = true, silent = true, desc = "Delete Buffer" }
			)
		end,
	},

	{
		"numtostr/BufOnly.nvim",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>bo",
				":BufOnly<CR>",
				{ noremap = true, silent = true, desc = "Close all but this" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>bO",
				":BufOnly<space>",
				{ noremap = true, desc = "Close all but ..." }
			)
		end,
	},
}
