return {
  {
    "justinsgithub/oh-my-monokai.nvim",
    opts = {
      transparent_background = true,
      terminal_colors = true,
      devicons = true,
      palette = "default",
      inc_search = "background",
      background_clear = { "toggleterm", "which-key", "renamer", "neo-tree" },
      plugins = {
        bufferline = { underline_selected = false, underline_visible = false },
        indent_blankline = { context_start_underline = false },
      },
      override = function(c) end,
    },
  },

}
