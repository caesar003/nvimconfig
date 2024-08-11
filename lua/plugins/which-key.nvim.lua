-- if true then return {} end
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},

    keys = {},
    config = function()
      local wk = require "which-key"
      wk.add {
        { "<leader>f", group = "File" },
        { "<leader>b", group = "Buffers" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "GitGutter Hunk" },
        { "<leader>s", group = "Session" },
        { "<leader>u", group = "UI" },
      }
    end,
  },
}

