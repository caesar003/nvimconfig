local colors = require("plugins.heirline.colors")

return {
  hl = function()
    if vim.bo.modified then
      return {fg = colors.cyan, bold = true, force = true}
    end
  end
}

