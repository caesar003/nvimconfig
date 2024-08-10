local utils = require("heirline.utils")
local colors = require("plugins.heirline.colors")

return {
  provider = function()
    return " " .. vim.bo.filetype .. " "
  end,
  hl = {fg = utils.get_highlight("Type").fg, bold = true}
}
