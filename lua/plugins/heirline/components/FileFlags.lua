local colors = require("plugins.heirline.colors")
return {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = {fg = colors.light_blue}
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
    hl = {fg = "Orange"}
  }
}

