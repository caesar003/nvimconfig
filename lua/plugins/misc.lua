return {
	{
		"barrett-ruth/import-cost.nvim",
		build = "sh install.sh yarn",
		config = true,
	},
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"psliwka/vim-smoothie",
		lazy = false,
	},

	{
		"fladson/vim-kitty",
		event = "VeryLazy",
	},
	{
		"jiangmiao/auto-pairs",
	},
	{
		"brenoprata10/nvim-highlight-colors",
		event = "VeryLazy",
		opts = {
			render = "background",
			virtual_symbol = "■",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = " ",
			virtual_symbol_position = "inline",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = true,
			custom_colors = {
				{ label = "%-%-theme%-primary%-color", color = "#0f1219" },
				{ label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
			},
			exclude_filetypes = {},
			exclude_buftypes = {},
		},
	},

	{
		"machakann/vim-highlightedyank",
		event = "VeryLazy",
		config = function()
			vim.g.highlightedyank_highlight_duration = 200
		end,
	},

	{
		"vim-scripts/loremipsum",
	},
	{
		"voldikss/vim-floaterm",
		event = "VeryLazy",
		config = function()
			local map = vim.api.nvim_set_keymap

			vim.g.floaterm_height = 0.9
			vim.g.floaterm_width = 0.9
			vim.g.floaterm_title = " Floaterm: ($1|$2) "
			vim.g.floaterm_borderchars = "─│─│╭╮╯╰"

			map("n", "<F6>", ":FloatermToggle<CR>", { noremap = true, silent = true })
			map("n", "<F7>", ":FloatermNew<CR>", { noremap = true, silent = true })
			map("n", "<F8>", ":FloatermPrev<CR>", { noremap = true, silent = true })
			map("n", "<F9>", ":FloatermNext<CR>", { noremap = true, silent = true })

			map("t", "<F6>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
			map("t", "<F7>", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true, silent = true })
			map("t", "<F8>", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
			map("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })
		end,
	},
}
