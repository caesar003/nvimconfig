
--[[
  .vimrc
  Author: caesar - https://github.com/caesar003
  Repository: https://github.com/caesar003/nvimconfig
  Last Modified: "2024-07-14"
]]

-- Display a startup message
vim.api.nvim_echo({{'>^.^<', 'Normal'}}, false, {})

require("config.lazy")
require("config.options")
require("config.mappings")
require("config.commands")
