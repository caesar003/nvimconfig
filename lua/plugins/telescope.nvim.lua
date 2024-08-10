return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.api.nvim_set_keymap(
      "n",
      "<leader>fw",
      ":Telescope live_grep<CR>",
      { noremap = true, silent = true, desc = "Pattern" }
      )
      vim.api.nvim_set_keymap(
      "n",
      "<leader>fg",
      ":Telescope git_files<CR>",
      { noremap = true, silent = true, desc = "Git files" }
      )
      vim.api.nvim_set_keymap(
      "n",
      "<leader>ff",
      ":Telescope find_files<CR>",
      { noremap = true, silent = true, desc = "Files" }
      )
      vim.api.nvim_set_keymap(
      "n",
      "<leader>bl",
      ":Telescope buffers<CR>",
      { noremap = true, silent = true, desc = "Buffers" }
      )
    end,
  },

}
