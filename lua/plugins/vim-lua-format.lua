-- if true then return {} end
return {
  {
    'andrejlevkovitch/vim-lua-format',
   config = function()
      -- Add your autocommand configuration here
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.lua",
        command = "call LuaFormat()",
      })
    end,
  }
}
