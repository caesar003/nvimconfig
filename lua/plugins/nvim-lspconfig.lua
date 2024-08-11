-- if true then return {} end

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Import the lspconfig module
      local lspconfig = require('lspconfig')

      -- Setup the TypeScript and JavaScript language server
      lspconfig.tsserver.setup({
        on_attach = function(client, bufnr)
          -- Disable tsserver's formatting capability if you use a different formatter
          client.server_capabilities.document_formatting = false

          -- Key mappings for LSP functions
          local opts = { noremap=true, silent=true }
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        end,
      })
    end
  },
  {
    "williamboman/mason.nvim", -- Optional: to manage LSP servers automatically
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim", -- Bridges mason with lspconfig
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "tsserver" }, -- Automatically install tsserver
      }
    end
  }
}



