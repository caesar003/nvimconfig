local heirline = require("heirline")
local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local colors = require("plugins.heirline.colors")

return {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  hl = {fg = colors.orange},
  {
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = {fg = colors.orange, bold = false}
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = "(",
    hl = {fg = colors.gray}
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = {fg = colors.git_add}
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = {fg = colors.git_del}
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = {fg = colors.git_change}
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
    hl = {fg = colors.gray}
  }
}
