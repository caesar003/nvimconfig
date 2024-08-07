-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "failed to clone lazy.nvim:\n", "errormsg" },
      { out, "warningmsg" },
      { "\npress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true },

})

vim.cmd.colorscheme "oh-my-monokai"

local wk = require("which-key")

wk.add({
  { "<leader>f", group = "File" },
  { "<leader>b", group = "Buffers" },
  { "<leader>g", group = "Git" },
  { "<leader>h", group = "GitGutter Hunk" },
  { "<leader>s", group = "Session" },
  { "<leader>u", group = "UI" },
})


vim.g.highlightedyank_highlight_duration = 300


-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     vim.cmd("FzfLua setup_fzfvim_cmds")
--   end
-- })


