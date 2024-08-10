return {
  {
    "alvan/vim-closetag",
    config = function()
      vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx"
      vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx,*.tsx"
      vim.g.closetag_xhtml_filetypes = "xhtml,javascript.jsx,jsx"
      vim.g.closetag_filetypes = "html,xhtml,phtml,javascriptreact,typescriptreact"
      vim.g.closetag_emptyTags_caseSensitive = 1
      vim.g.closetag_shortcut = ">"
      vim.g.closetag_close_shortcut = "<leader>>"
      vim.api.nvim_create_autocmd(
      { "BufNewFile", "BufRead" },
      { pattern = { "*.js", "*.jsx" }, callback = function() vim.bo.filetype = "javascript.jsx" end }
      )
    end,
  },
}

