-- /home/caesar/.config/nvim/lua/plugins/vim-git.lua
return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		enabled = vim.fn.executable("git") == 1,
		opts = {
			signs = {
				add = { text = "█|" },
				change = { text = "█⫶" },
				delete = { text = "█▁" },
				topdelete = { text = "█▔" },
				changedelete = { text = "█▟" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "█|" },
				change = { text = "█⫶" },
				delete = { text = "█▁" },
				topdelete = { text = "█▔" },
				changedelete = { text = "█▟" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = { follow_files = true },
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			max_file_length = 40000,
			preview_config = { border = "single", style = "minimal", relative = "cursor", row = 0, col = 1 },
		},
	},

	{
		"tpope/vim-fugitive",
		-- keys = {
		-- 	{ "<leader>gac", "<cmd>G add %<cr>", desc = "Git Add Current File" },
		-- 	{ "<leader>gc", "<cmd>G commit<cr>", desc = "Git Commit" },
		-- 	{ "<leader>gp", "<cmd>G push<cr>", desc = "Git Push" },
		-- 	{ "<leader>gs", "<cmd>G<cr>", desc = "Git Status" },
		-- 	{ "<leader>gd", "<cmd>G diff<cr>", desc = "Git Diff" },
		-- 	{ "<leader>gl", "<cmd>G log --oneline --graph --decorate<cr>", desc = "Git Log" },
		-- },
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
