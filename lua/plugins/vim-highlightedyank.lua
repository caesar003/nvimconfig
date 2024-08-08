-- if true then return {} end
return {
  {
    'machakann/vim-highlightedyank',
    config = function()
      -- Set highlight duration
      vim.g.highlightedyank_highlight_duration = 200
    end,
  }
}
