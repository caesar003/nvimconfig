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
}
