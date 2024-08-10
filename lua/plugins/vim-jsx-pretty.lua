 if truen then return {} end
return {
  {
    'maxmellon/vim-jsx-pretty',
    config = function()
      -- Disable JS syntax highlighting (0 to enable, 1 to disable)
      vim.g.vim_jsx_pretty_disable_js = 0

      -- Disable TSX syntax highlighting (0 to enable, 1 to disable)
      vim.g.vim_jsx_pretty_disable_tsx = 0

      -- Highlight JSX inside the tagged template string (set to [] to disable)
      vim.g.vim_jsx_pretty_template_tags = { 'html', 'jsx' }

      -- Highlight the close tag separately from the open tag
      vim.g.vim_jsx_pretty_highlight_close_tag = 0

      -- Colorful config flag
      vim.g.vim_jsx_pretty_colorful_config = 1
    end,
  }
}
