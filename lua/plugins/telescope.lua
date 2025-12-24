return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local map = vim.api.nvim_set_keymap
      map(
        "n",
        "<leader>fw",
        ":Telescope live_grep theme=dropdown<CR>",
        { noremap = true, silent = true, desc = "Pattern" }
      )
      map(
        "n",
        "<leader>fg",
        ":Telescope git_files theme=dropdown<CR>",
        { noremap = true, silent = true, desc = "Git files" }
      )
      map(
        "n",
        "<leader>ff",
        ":Telescope find_files theme=dropdown<CR>",
        { noremap = true, silent = true, desc = "Files" }
      )
      map(
        "n",
        "<leader>bl",
        ":Telescope buffers theme=dropdown<CR>",
        { noremap = true, silent = true, desc = "Buffers" }
      )


      map(
        "n",
        "<leader>gd",
        ":Telescope git_status theme=ivy<CR>",
        { noremap = true, silent = true, desc = "Git diff" }
      )
    end,
  },
}
