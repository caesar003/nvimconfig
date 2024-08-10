-- if true then return {} end
return {
  {
    'christoomey/vim-tmux-navigator',

    config = function()

      local map = vim.api.nvim_set_keymap
      vim.g.tmux_navigator_no_mappings = 1

      map('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
      map('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
      map('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
      map('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
    end
  }
}
