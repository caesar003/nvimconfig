local colors = require("plugins.heirline.colors")
return {
  provider = function()
    return " " .. vim.bo.fileencoding .. " "
  end,
  hl = {fg = colors.gray}
}




