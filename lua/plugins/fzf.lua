return {
  { "junegunn/fzf", build = "./install --bin" },
  { "junegunn/fzf.vim" },

  --[[ { 
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
    end
  }, --]]
}
