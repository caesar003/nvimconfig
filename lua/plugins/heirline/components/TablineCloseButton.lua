local TablineCloseButton = {
  condition = function(self)
    return not vim.api.nvim_get_option_value("modified", {buf = self.bufnr})
  end,
  {provider = " "},
  {
    provider = "✖",
    hl = {fg = "gray"},
    on_click = {
      callback = function(_, minwid)
        vim.schedule(
          function()
            vim.api.nvim_buf_delete(minwid, {force = false})
            vim.cmd.redrawtabline()
          end
        )
      end,
      minwid = function(self)
        return self.bufnr
      end,
      name = "heirline_tabline_close_buffer_callback"
    }
  }
}
