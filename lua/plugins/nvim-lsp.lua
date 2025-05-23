return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local function set_keymap(bufnr, mode, lhs, rhs, opts)
				local default_opts = { noremap = true, silent = true }
				opts = vim.tbl_extend("force", default_opts, opts or {})
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
			end

			lspconfig.lua_ls.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.document_formatting = true

					set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
					set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
					set_keymap(
						bufnr,
						"n",
						"<leader>lr",
						"<Cmd>lua vim.lsp.buf.rename()<CR>",
						{ desc = "Rename symbol" }
					)
					set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to reference" })
					set_keymap(
						bufnr,
						"n",
						"gl",
						"<Cmd>lua vim.diagnostic.open_float()<CR>",
						{ desc = "Open diagnostic float" }
					)
					set_keymap(
						bufnr,
						"n",
						"[d",
						"<Cmd>lua vim.diagnostic.goto_prev()<CR>",
						{ desc = "Next diagnostic" }
					)
					set_keymap(
						bufnr,
						"n",
						"]d",
						"<Cmd>lua vim.diagnostic.goto_next()<CR>",
						{ desc = "Prev diagnostic" }
					)
					set_keymap(
						bufnr,
						"n",
						"<leader>lf",
						"<Cmd>lua vim.lsp.buf.format()<CR>",
						{ desc = "Format document" }
					)
				end,

				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize `vim` as a global to avoid undefined warnings
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
							checkThirdParty = false, -- Prevent annoying popups about third-party libraries
						},
						telemetry = { enable = false }, -- Disable telemetry
					},
				},
			})
			lspconfig.clangd.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.document_formatting = true

					set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
					set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
					set_keymap(
						bufnr,
						"n",
						"<leader>lr",
						"<Cmd>lua vim.lsp.buf.rename()<CR>",
						{ desc = "Rename symbol" }
					)
					set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to reference" })
					set_keymap(
						bufnr,
						"n",
						"gl",
						"<Cmd>lua vim.diagnostic.open_float()<CR>",
						{ desc = "Open diagnostic float" }
					)
					set_keymap(
						bufnr,
						"n",
						"[d",
						"<Cmd>lua vim.diagnostic.goto_prev()<CR>",
						{ desc = "Next diagnostic" }
					)
					set_keymap(
						bufnr,
						"n",
						"]d",
						"<Cmd>lua vim.diagnostic.goto_next()<CR>",
						{ desc = "Prev diagnostic" }
					)

					-- Add keybinding for formatting
					set_keymap(
						bufnr,
						"n",
						"<leader>lf",
						"<Cmd>lua vim.lsp.buf.format()<CR>",
						{ desc = "Format document" }
					)
				end,
			})

			lspconfig.ts_ls.setup({
				on_attach = function(client, bufnr)
					client.server_capabilities.document_formatting = true

					set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
					set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
					set_keymap(
						bufnr,
						"n",
						"<leader>lr",
						"<Cmd>lua vim.lsp.buf.rename()<CR>",
						{ desc = "Rename symbol" }
					)
					set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to reference" })
					set_keymap(
						bufnr,
						"n",
						"gl",
						"<Cmd>lua vim.diagnostic.open_float()<CR>",
						{ desc = "Open diagnostic float" }
					)
					set_keymap(
						bufnr,
						"n",
						"[d",
						"<Cmd>lua vim.diagnostic.goto_prev()<CR>",
						{ desc = "Next diagnostic" }
					)
					set_keymap(
						bufnr,
						"n",
						"]d",
						"<Cmd>lua vim.diagnostic.goto_next()<CR>",
						{ desc = "Prev diagnostic" }
					)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"html",
					"lua_ls",
					"cssls",
					"bashls",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({

				ensure_installed = {
					"php",
					"javascript",
					"bash",
					"html",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"tsx",
					"typescript",
					"vim",
					"yaml",
					"css",
				},
				sync_install = true,
				auto_install = true,
			})
		end,
	},
	{

		--"jose-elias-alvarez/null-ls.nvim",
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {

					null_ls.builtins.formatting.phpcsfixer.with({
						command = "php-cs-fixer",
					}),
					null_ls.builtins.formatting.blade_formatter.with({
						command = "blade-formatter",
					}),
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.gofmt,

					-- null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.formatting.clang_format,
				},
			})
		end,
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
}
