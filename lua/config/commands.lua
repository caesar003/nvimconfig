-- Define custom commands
vim.cmd([[
  command! -nargs=0 Noh nohlsearch
  command! -nargs=0 NOH nohlsearch
  command! -nargs=0 Ls ls
  command! -nargs=0 LS ls
]])

-- Define a command with an expression
vim.cmd([[
  command! -nargs=0 Ef lua require('myplugin').explore_file()
]])

-- Example function for Ef command
local myplugin = {}

function myplugin.explore_file()
  local filename = vim.fn.expand("%:t")
  vim.cmd('Explore ' .. vim.fn.expand("%:h"))
  vim.cmd('normal n')
end

-- return myplugin
