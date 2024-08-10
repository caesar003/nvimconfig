if true then return {} end
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      -- {
      --   "<leader>?",
      --   function()
      --     require("which-key").show({ global = false })
      --   end,
      --   desc = "Buffer Local Keymaps (which-key)",
      -- },
    },

    config = function()

      local wk = require("which-key")

      wk.add({
        { "<leader>f", group = "File" },
        { "<leader>b", group = "Buffers" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "GitGutter Hunk" },
        { "<leader>s", group = "Session" },
        { "<leader>u", group = "UI" },
      })
    end
  }
}
