return {
  { 
    "prettier/vim-prettier",
    -- build = 'yarn install',
    -- ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html' },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>p", ":Prettier <CR>", { noremap = true, silent = true, desc = "Prettier" })
    end
  },
}
