if true then return {} end
-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim" },
      { "saghen/blink.cmp" },
    },
    config = function()
      -- 1. Get the list of servers you want
      local servers = { "vtsls", "lua_ls", "bashls", "jsonls" }

      -- 2. Use the new 0.11 native activation
      -- This tells Neovim to use lspconfig's database but 
      -- handles the "setup" via the native engine.
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      -- 3. Specific overrides (like for your nvim config)
      -- In 0.11, we use vim.lsp.config to modify settings
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          },
        },
      })
    end,
  },
{
    "saghen/blink.cmp",
    version = "*",
    opts = {
      keymap = { preset = "default" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
