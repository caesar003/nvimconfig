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
  {'oahlen/iceberg.nvim'},
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    transparency = true,
  },
  {'nyoom-engineering/oxocarbon.nvim'},
  {'folke/tokyonight.nvim'},
  {
    'rebelot/kanagawa.nvim',
    opts = {
      compile = false,             -- enable compiling the colorscheme
      undercurl = true,            -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,         -- do not set background color
      dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
      terminalColors = true,       -- define vim.g.terminal_color_{0,17}
      colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "wave",              -- Load "wave" theme when 'background' option is not set
      background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
      },
    }
  },
  {
    'ellisonleao/gruvbox.nvim', 
    priority = 1000, 
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    }
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent_background = true,
    }
  },
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
        "telescope",
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
