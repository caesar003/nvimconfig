-- if true then return {} end

return {
  {
    'justinsgithub/oh-my-monokai.nvim',
    opts = {
      transparent_background = true,
      terminal_colors = true,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      palette = "default", -- or create your own ^^ e.g. justinsgithub
      inc_search = "background", -- underline | background
      background_clear = {
        -- "float_win",
        "toggleterm",
        -- "telescope",
        "which-key",
        "renamer",
        "neo-tree"
      },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
        },
        indent_blankline = {
          context_start_underline = false,
        },
      },
      ---@param c Colorscheme
      override = function(c) end,
    }
  }
}
