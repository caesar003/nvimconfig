-- /home/caesar/.config/nvim/lua/plugins/todo-comments.lua

-- I put this here as cheatsheet
-- FIX: there's huge error here
-- TODO: take care of error handling here
-- HACK: there's actually a better way of writing it but I prefer this cleaner option
-- WARN: be cautious when using this built-in method as it often leads to unexpected behaviour
-- PERF: consider writing
-- NOTE: this is important to
-- TEST:
-- DEBUG: debugging only

return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

    keywords = {
      DEBUG = {
        icon = "", -- pick any symbol you like
        color = "warning", -- highlight color
        alt = { "TEMP", "CLEANUP" }, -- also highlight TEMP: / CLEANUP:
      },
    },
  },
}

-- return {
-- 	"folke/todo-comments.nvim",
-- 	event = "VeryLazy",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	opts = {
-- 		keywords = {
-- 			FIX = { icon = "", color = "error", alt = { "BUG", "FIXME" } },
-- 			TODO = { icon = "", color = "info" },
-- 			HACK = { icon = "", color = "warning" },
-- 			WARN = { icon = "", color = "warning" },
-- 			PERF = { icon = "", color = "hint" },
-- 			NOTE = { icon = "", color = "hint" },
-- 			TEST = { icon = "ﭧ", color = "test" },
-- 		},
-- 		highlight = {
-- 			pattern = [[\b(KEYWORDS)\b]], -- match keywords like FIX, TODO, etc.
-- 			keywords = "FIX,TODO,HACK,WARN,PERF,NOTE,TEST",
-- 		},
-- 		search = {
-- 			command = "TodoComments",
-- 			args = { "--", "-t", "TODO,FIX,WARN" },
-- 		},
-- 	},
-- }
