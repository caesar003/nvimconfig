local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo(
      { { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." } },
      true,
      {}
    )
    vim.fn.getchar()
    os.exit(1)
  end
end

local opts = vim.opt
local comm = vim.cmd
local fun = vim.fn
local _g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap

vim.opt.rtp:prepend(lazypath)


require("config.options")
require("config.keymaps")

require("lazy").setup {
  spec = {
    import = "plugins"
  },
  checker = { enabled = true },
}

vim.cmd.colorscheme "oh-my-monokai"
if fun.exists "+termguicolors" == 1 and vim.opt.termguicolors:get() then
  comm "hi Visual guifg=#000000 guibg=#FFA500"
  comm "hi Search guifg=#000000 guibg=#FFA500"
  comm "hi Cursor guifg=#FFA500 guibg=#1a1a1a"
else
  comm "hi Visual ctermfg=208 ctermbg=234"
  comm "hi Search ctermfg=208 ctermbg=234"
  comm "hi Cursor ctermfg=208 ctermbg=234"
end
