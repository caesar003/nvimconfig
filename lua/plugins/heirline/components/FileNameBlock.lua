return  {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end
}
