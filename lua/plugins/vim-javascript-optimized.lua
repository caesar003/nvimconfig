if true then
	return {}
end

return {
	-- JavaScript & TypeScript Syntax Highlighting
	{
		"pangloss/vim-javascript",
		ft = "javascript",
		config = function()
			vim.g.javascript_plugin_jsdoc = 1
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("javascript_folding", { clear = true }),
				pattern = "javascript",
				command = "setlocal foldmethod=syntax",
			})
		end,
	},

	-- JSX & TSX Syntax Enhancements
	{
		"maxmellon/vim-jsx-pretty",
		config = function()
			vim.g.vim_jsx_pretty_disable_js = 0
			vim.g.vim_jsx_pretty_disable_tsx = 0
			vim.g.vim_jsx_pretty_template_tags = { "html", "jsx" }
			vim.g.vim_jsx_pretty_highlight_close_tag = 0
			vim.g.vim_jsx_pretty_colorful_config = 1
		end,
	},

	-- Prettier Formatter
	{
		"prettier/vim-prettier",
		build = "yarn install",
		ft = {
			"javascript",
			"typescript",
			"typescriptreact",
			"javascriptreact",
			"json",
			"markdown",
			"yaml",
			"html",
			"css",
			"scss",
			"less",
			"graphql",
			"vue",
		},
		config = function()
			vim.g["prettier#config#config_precedence"] = "file-override"
			vim.api.nvim_set_keymap(
				"n",
				"<leader>lp",
				":Prettier <CR>",
				{ noremap = true, silent = true, desc = "Prettier" }
			)
		end,
	},

	-- TypeScript Syntax & Indentation
	{
		"leafgarland/typescript-vim",
		ft = { "typescript", "typescriptreact" },
	},
}
