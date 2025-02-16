return {
	{
		"tpope/vim-commentary",
		event = "VeryLazy", -- Lazy load the plugin
		config = function()
			-- Normal and visual mode key bindings for commenting
			vim.api.nvim_set_keymap("n", "<leader>/", ":Commentary<CR>", {
				noremap = true,
				silent = true,
				desc = "Comment",
			})
			vim.api.nvim_set_keymap("v", "<leader>/", ":Commentary<CR>", {
				noremap = true,
				silent = true,
				desc = "Comment",
			})
		end,
	},
}
