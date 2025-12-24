-- lua/plugins/nvim-color.lua
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,       -- ← THIS
        disable_float_background = true, -- optional (for popups)
      })

      vim.cmd("colorscheme rose-pine")
    end,
  },
}
