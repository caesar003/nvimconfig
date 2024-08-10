local colors = require("plugins.heirline.colors")

return {
  provider = function()
    return "[" .. vim.bo.fileformat .. "]"
  end,
  hl = {fg = colors.magenta}
}
