return {
  {
    condition = function(self)
      return vim.api.nvim_get_option_value("modified", {buf = self.bufnr})
    end,
    provider = "[+]",
    hl = {fg = "green"}
  },
  {
    condition = function(self)
      return not vim.api.nvim_get_option_value("modifiable", {buf = self.bufnr}) or
        vim.api.nvim_get_option_value("readonly", {buf = self.bufnr})
    end,
    provider = function(self)
      if vim.api.nvim_get_option_value("buftype", {buf = self.bufnr}) == "terminal" then
        return "  "
      else
        return ""
      end
    end,
    hl = {fg = "orange"}
  }
}
