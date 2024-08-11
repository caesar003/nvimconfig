return {
  {
    "numtostr/BufOnly.nvim",
    config = function()
<<<<<<< HEAD
      vim.api.nvim_set_keymap(
      "n",
      "<leader>bo",
      ":BufOnly<CR>",
      { noremap = true, silent = true, desc = "Close all but this" }
      )
=======
      vim.api.nvim_set_keymap( "n", "<leader>bo", ":BufOnly<CR>", { noremap = true, silent = true, desc = "Close all but this" })
>>>>>>> e078809 (initial-commit)
      vim.api.nvim_set_keymap("n", "<leader>bO", ":BufOnly<space>", { noremap = true, desc = "Close all but ..." })
    end,
  },
}
<<<<<<< HEAD

=======
>>>>>>> e078809 (initial-commit)
