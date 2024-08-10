-- if true then return {} end
return {
  { 
    'tpope/vim-commentary',
    config = function()
      local map = vim.api.nvim_set_keymap
      map('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true, desc = 'Comment' })
      map('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true, desc = 'Comment' })
    end

  }
}
