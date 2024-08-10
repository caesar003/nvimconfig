 if true then return {} end 

return {
  {
    'pangloss/vim-javascript',
    ft = 'javascript', -- Load only for JavaScript files
    config = function()
      -- Equivalent settings in Lua
      vim.g.javascript_plugin_jsdoc = 1

      -- Set up folding
      vim.api.nvim_create_augroup('javascript_folding', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = 'javascript_folding',
        pattern = 'javascript',
        command = 'setlocal foldmethod=syntax',
      })

      -- Set conceal characters
      vim.g.javascript_conceal_function             = "ƒ"
      vim.g.javascript_conceal_null                 = "ø"
      vim.g.javascript_conceal_this                 = "@"
      vim.g.javascript_conceal_return               = "⇚"
      vim.g.javascript_conceal_undefined            = "¿"
      vim.g.javascript_conceal_NaN                  = "ℕ"
      vim.g.javascript_conceal_prototype            = "¶"
      vim.g.javascript_conceal_static               = "•"
      vim.g.javascript_conceal_super                = "Ω"
      vim.g.javascript_conceal_arrow_function       = "⇒"
      vim.g.javascript_conceal_noarg_arrow_function = "🞅"
      vim.g.javascript_conceal_underscore_arrow_function = "🞅"

      -- Set conceallevel
      vim.opt.conceallevel = 1
    end,
  }
}
