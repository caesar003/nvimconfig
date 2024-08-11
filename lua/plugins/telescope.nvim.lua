return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
<<<<<<< HEAD
    config = function()

      local map = vim.api.nvim_set_keymap

      map( "n", "<leader>fw", ":Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Pattern" }) 
      map( "n", "<leader>fg", ":Telescope git_files<CR>", { noremap = true, silent = true, desc = "Git files" })
      map( "n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true, desc = "Files" }) 
=======

    
    config = function()

      local map = vim.api.nvim_set_keymap
      map( "n", "<leader>fw", ":Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Pattern" }) 
      map( "n", "<leader>fg", ":Telescope git_files<CR>", { noremap = true, silent = true, desc = "Git files" })
      map( "n", "<leader>ff", ":Telescope find_files theme=ivy<CR>", { noremap = true, silent = true, desc = "Files" }) 
>>>>>>> e078809 (initial-commit)
      map( "n", "<leader>bl", ":Telescope buffers<CR>", { noremap = true, silent = true, desc = "Buffers" })
    end,
  },

}
