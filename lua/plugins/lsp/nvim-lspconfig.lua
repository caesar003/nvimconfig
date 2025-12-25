return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				local navic = require("nvim-navic")

				-- Attach navic
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end

				-- Helper for keymaps
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
				end

				-- Keybindings
				map("n", "gd", vim.lsp.buf.definition, "Go to definition")
				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
				map("n", "gr", vim.lsp.buf.references, "Go to reference")
				map("n", "gl", vim.diagnostic.open_float, "Open diagnostic float")
				map("n", "[d", vim.diagnostic.goto_prev, "Next diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Prev diagnostic")
				map("n", "<leader>lf", vim.lsp.buf.format, "Format document")
			end,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("jsonls", {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		local servers = { "lua_ls", "clangd", "ts_ls", "jsonls", "html", "cssls", "bashls" }
		for _, server in ipairs(servers) do
			vim.lsp.enable(server)
		end
	end,
}
