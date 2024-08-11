
return {
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_title = " Floaterm: ($1|$2) "
      vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
      vim.api.nvim_set_keymap("n", "<F6>", ":FloatermToggle<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<F7>", ":FloatermNew<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<F8>", ":FloatermPrev<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<F9>", ":FloatermNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F6>", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F7>", "<C-\\><C-n>:FloatermNew<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F8>", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })
    end,
  },
}
