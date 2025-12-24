if true then return {} end
-- ~/.config/nvim/lua/plugins/mason.lua
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "vtsls",   -- TS/JS/React/React Native
        "lua_ls",  -- Lua
        "bashls",  -- Shell
        "jsonls",  -- JSON
      },
    },
  },
}
