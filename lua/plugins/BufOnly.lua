if true then return {} end
return {
  {
    'numtostr/BufOnly.nvim',
    config = function()
      local map = vim.api.nvim_set_keymap

      map('n', '<leader>bo', ':BufOnly<CR>', { noremap = true, silent = true, desc = "Close all but this" })
      map('n', '<leader>bO', ':BufOnly<space>', { noremap = true, desc = "Close all but ..." })
    end
  }
}
