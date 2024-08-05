if true then return {} end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_window = true,
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    }
  },
}
