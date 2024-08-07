return {
  {
    "rebelot/heirline.nvim",
    config = function()
      local heirline = require("heirline")
      local conditions = require("heirline.conditions")
      local utils = require("heirline.utils")

      local colors = {
        -- Tailwind CSS colors
        bright_bg = "#f9fafb", -- Tailwind's `gray-50` for a light background
        bright_fg = "#374151", -- Tailwind's `gray-700` for a more subdued foreground
        red = "#ef4444", -- Tailwind's `red-500` for errors
        dark_red = "#b91c1c", -- Tailwind's `red-800` for a darker red
        green = "#10b981", -- Tailwind's `green-500` for success or positive
        blue = "#3b82f6", -- Tailwind's `blue-500` for functions or primary actions
        gray = "#6b7280", -- Tailwind's `gray-500` for neutral or non-text
        orange = "#f97316", -- Tailwind's `orange-500` for constants
        purple = "#8b5cf6", -- Tailwind's `purple-500` for statements
        cyan = "#06b6d4", -- Tailwind's `cyan-500` for special elements
        diag_warn = "#f59e0b", -- Tailwind's `yellow-500` for warnings
        diag_error = "#ef4444", -- Tailwind's `red-500` for errors
        diag_hint = "#3b82f6", -- Tailwind's `blue-500` for hints
        diag_info = "#10b981", -- Tailwind's `green-500` for informational messages
        git_del = "#ef4444", -- Tailwind's `red-500` for deleted lines
        git_add = "#10b981", -- Tailwind's `green-500` for added lines
        git_change = "#f97316", -- Tailwind's `orange-500` for changed lines
        magenta = "#d946ef", -- Tailwind's `pink-500` for magenta
        light_blue = "#bfdbfe" -- Tailwind's `blue-100` for light blue highlights
      }

      local Git = {
        condition = conditions.is_git_repo,
        init = function(self)
          self.status_dict = vim.b.gitsigns_status_dict
          self.has_changes =
          self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
        end,
        hl = {fg = colors.orange},
        {
          -- git branch name
          provider = function(self)
            return " " .. self.status_dict.head
          end,
          hl = {fg = colors.blue, bold = true}
        },
        {
          -- Handle delimiters, icons, and counts
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

      -- Define FileNameBlock component
      local FileNameBlock = {
        init = function(self)
          self.filename = vim.api.nvim_buf_get_name(0)
        end
      }

      local FileIcon = {
        init = function(self)
          local filename = self.filename
          local extension = vim.fn.fnamemodify(filename, ":e")
          self.icon, self.icon_color =
          require("nvim-web-devicons").get_icon_color(filename, extension, {default = true})
        end,
        provider = function(self)
          return self.icon and (self.icon .. " ")
        end,
        hl = function(self)
          return {fg = self.icon_color or colors.gray}
        end
      }

      local FileName = {
        provider = function(self)
          local filename = vim.fn.fnamemodify(self.filename, ":.")
          if filename == "" then
            return "[No Name]"
          end
          if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
          end
          return filename
        end,
        hl = {fg = colors.cyan}
      }

      local FileFlags = {
        {
          condition = function()
            return vim.bo.modified
          end,
          provider = "[+]",
          hl = {fg = colors.green}
        },
        {
          condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
          end,
          provider = "",
          hl = {fg = "Orange"}
        }
      }

      local FileNameModifer = {
        hl = function()
          if vim.bo.modified then
            return {fg = colors.cyan, bold = true, force = true}
          end
        end
      }

      FileNameBlock =
      utils.insert(
      FileNameBlock,
      FileIcon,
      utils.insert(FileNameModifer, FileName),
      FileFlags,
      {provider = "%<"}
      )

      -- Define additional components
      local FileType = {
        provider = function()
          return " " .. vim.bo.filetype .. " "
        end,
        hl = {fg = colors.purple, bold = true}
      }

      local FileEncoding = {
        provider = function()
          return " " .. vim.bo.fileencoding .. " "
        end,
        hl = {fg = colors.gray}
      }

      local FileFormat = {
        provider = function()
          return " " .. vim.bo.fileformat .. " "
        end,
        hl = {fg = colors.magenta}
      }

      local LineNumber = {
        provider = function()
          local current_line = vim.fn.line(".")
          local total_lines = vim.fn.line("$")
          return string.format(" l:%d/%d ", current_line, total_lines)
        end,
        hl = {fg = colors.cyan}
      }

      local LineColumn = {
        provider = function()
          local column_number = vim.fn.col(".")
          return string.format(" c:%d ", column_number)
        end,
        hl = {fg = colors.blue}
      }

      local Percentage = {
        provider = function()
          local current_line = vim.fn.line(".")
          local total_lines = vim.fn.line("$")
          local percentage = math.floor(current_line * 100 / total_lines)
          return string.format(" %d%%%% ", percentage)
        end,
        hl = {fg = colors.orange}
      }

      -- Define statusline components
      local statusline = {
        FileNameBlock,
        {provider = " "},
        FileType,
        {provider = " "},
        FileEncoding,
        {provider = " "},
        FileFormat,
        {provider = "%="},
        Git,
        {provider = "%="},
        LineNumber,
        LineColumn,
        Percentage
      }

      -- Set up heirline with the statusline
      heirline.setup({statusline = statusline})
    end
  }
}
