return {
  { 
    "prettier/vim-prettier",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>p", ":Prettier <CR>", { noremap = true, silent = true, desc = "Prettier" })
    end
  },
}
