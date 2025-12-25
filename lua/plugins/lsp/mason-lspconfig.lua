return {
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
}
