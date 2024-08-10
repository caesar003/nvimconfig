-- if true then return {} end
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()

    local map = vim.api.nvim_set_keymap
    map('n', '<leader>fw', ':Telescope live_grep<CR>', { noremap = true, silent = true, desc = 'Pattern' })
    map('n', '<leader>fg', ':Telescope git_files<CR>', { noremap = true, silent = true, desc = 'Git files' })
    map('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true, desc = 'Files' })
  end
}
