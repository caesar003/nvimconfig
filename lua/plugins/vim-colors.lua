-- ~/.config/nvim/lua/plugins/vim-colors.lua
return {
	{
		"mustardfrog/pinkish_day",
		lazy = false,
		dependencies = { "rktjmp/lush.nvim" },
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd.colorscheme("pinkish_day")
		end,
	},
	{
		"AstroNvim/astrotheme",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			require("astrotheme").setup({
				-- Set your preferences here (optional)
				palette = "astrodark", -- or "astrolight"
				transparent = true, -- Set true if you want transparency
				inactive = true,
			})
			vim.cmd("colorscheme astromars") -- or "astrolight"
		end,
	},
}
