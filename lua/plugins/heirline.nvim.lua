-- if true then return {} end
return {
  {
    "rebelot/heirline.nvim",
    config = function()
      local heirline = require "heirline"
      local conditions = require "heirline.conditions"
      local utils = require "heirline.utils"
      local colors = {
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
      local FileNameBlock = { init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end }
      local Git = {
        condition = conditions.is_git_repo,
        init = function(self)
          self.status_dict = vim.b.gitsigns_status_dict
          self.has_changes = self.status_dict.added ~= 0
          or self.status_dict.removed ~= 0
          or self.status_dict.changed ~= 0
        end,
        hl = { fg = colors.orange },
        {
          provider = function(self) return " " .. self.status_dict.head end,
          hl = { fg = colors.orange, bold = false },
        },
        { condition = function(self) return self.has_changes end, provider = "(", hl = { fg = colors.gray } },
        {
          provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
          end,
          hl = { fg = colors.git_add },
        },
        {
          provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
          end,
          hl = { fg = colors.git_del },
        },
        {
          provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
          end,
          hl = { fg = colors.git_change },
        },
        { condition = function(self) return self.has_changes end, provider = ")", hl = { fg = colors.gray } },
      }
      local ScrollBar = {
        static = { sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" } },
        provider = function(self)
          local curr_line = vim.api.nvim_win_get_cursor(0)[1]
          local lines = vim.api.nvim_buf_line_count(0)
          local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
          return string.rep(self.sbar[i], 2)
        end,
        hl = { fg = colors.gray, bg = colors.bright_bg },
      }
      local FileIcon = {
        init = function(self)
          local filename = self.filename
          local extension = vim.fn.fnamemodify(filename, ":e")
          self.icon, self.icon_color =
          require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        end,
        provider = function(self) return self.icon and (self.icon .. " ") end,
        hl = function(self) return { fg = self.icon_color or colors.gray } end,
      }
      local FileName = {
        provider = function(self)
          local filename = vim.fn.fnamemodify(self.filename, ":.")
          if filename == "" then return "[No Name]" end
          if not conditions.width_percent_below(#filename, 0.25) then filename = vim.fn.pathshorten(filename) end
          return filename
        end,
        hl = { fg = utils.get_highlight("Directory").fg },
      }
      local FileEncoding =
      { provider = function() return " " .. vim.bo.fileencoding .. " " end, hl = { fg = colors.gray } }

      local FileFlags = {
        { 
          condition = function() 
            return vim.bo.modified 
          end, 
          provider = "[+]", 
          hl = { fg = colors.light_blue } 
        },
        {
          condition = function() 
            return not vim.bo.modifiable or vim.bo.readonly 
          end,
          provider = "",
          hl = { fg = "Orange" },
        },
      }

      local TablineFileFlags = {
        {
          condition = function(self) 
            return vim.api.nvim_get_option_value("modified", { buf = self.bufnr }) 
          end,
          provider = "[+]",
          hl = { fg = colors.light_blue },
        },
        {
          condition = function(self)
            return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
            or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
          end,
          provider = function(self)
            if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
              return "  "
            else
              return ""
            end
          end,
          hl = { fg = "orange" },
        },
      }
      local FileNameModifer = {
        hl = function()
          if vim.bo.modified then return { fg = colors.cyan, bold = true, force = true } end
        end,
      }
      local FileType = {
        provider = function() return " " .. vim.bo.filetype .. " " end,
        hl = { fg = utils.get_highlight("Type").fg, bold = true },
      }
      local FileFormat = { 
        provider = function() return "[" .. vim.bo.fileformat .. "]" end, hl = { fg = colors.magenta } 
      }
      local Space = { provider = " " }
      local Ruler = { provider = "%7(%l/%3L%):%2c %P" }
      local TablinePicker = {
        condition = function(self) return self._show_picker end,
        init = function(self)
          local bufname = vim.api.nvim_buf_get_name(self.bufnr)
          bufname = vim.fn.fnamemodify(bufname, ":t")
          local label = bufname:sub(1, 1)
          local i = 2
          while self._picker_labels[label] do
            if i > #bufname then break end
            label = bufname:sub(i, i)
            i = i + 1
          end
          self._picker_labels[label] = self.bufnr
          self.label = label
        end,
        provider = function(self) return self.label end,
        hl = { fg = "red", bold = true },
      }
      local TablineFileName = {
        provider = function(self)
          local filename = self.filename
          filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
          return filename
        end,
        hl = function(self) return { bold = self.is_active or self.is_visible, italic = true } end,
      }


      local TablineBufnr = { provider = function(self) return tostring(self.bufnr) .. ". " end, hl = "Comment" }
      local ViMode = {
        init = function(self) self.mode = vim.fn.mode(1) end,
        static = {
          mode_names = {
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = "V_",
            Vs = "Vs",
            ["\22"] = "^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
          },
          mode_colors = {
            n = "red",
            i = "green",
            v = "cyan",
            V = "cyan",
            ["\22"] = "cyan",
            c = "orange",
            s = "purple",
            S = "purple",
            ["\19"] = "purple",
            R = "orange",
            r = "orange",
            ["!"] = "red",
            t = "red",
          },
        },
        provider = function(self) return self.mode_names[self.mode] end,
        hl = function(self)
          local mode = self.mode:sub(1, 1)
          return { fg = self.mode_colors[mode], bold = true }
        end,
        update = {
          "ModeChanged",
          pattern = "*:*",
          callback = vim.schedule_wrap(function() vim.cmd "redrawstatus" end),
        },
      }
      FileNameBlock =
      utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), FileFlags, { provider = "%<" })
      local StatusLine = {
        ViMode,
        Space,
        FileNameBlock,
        Space,
        FileType,
        Space,
        FileEncoding,
        Space,
        FileFormat,
        { provider = "%=" },
        Git,
        { provider = "%=" },
        Ruler,
        Space,
        ScrollBar,
      }
      local TablineFileNameBlock = {
        init = function(self) self.filename = vim.api.nvim_buf_get_name(self.bufnr) end,
        hl = function(self)
          if self.is_active then
            return "TabLineSel"
          else
            return "TabLine"
          end
        end,
        on_click = {
          callback = function(_, minwid, _, button)
            if button == "m" then
              vim.schedule(function() vim.api.nvim_buf_delete(minwid, { force = false }) end)
            else
              vim.api.nvim_win_set_buf(0, minwid)
            end
          end,
          minwid = function(self) return self.bufnr end,
          name = "heirline_tabline_buffer_callback",
        },
        TablineBufnr,
        FileIcon,
        TablineFileName,
        TablineFileFlags,
      }
      local TablineBufferBlock = utils.surround({ " ", " " }, function(self)
        if self.is_active then
          return utils.get_highlight("TabLineSel").bg
        else
          return utils.get_highlight("TabLine").bg
        end
      end, { TablineFileNameBlock, TablinePicker })
      local get_bufs = function()
        return vim.tbl_filter(
        function(bufnr) return vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) end,
        vim.api.nvim_list_bufs()
        )
      end
      local buflist_cache = {}
      vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
        callback = function()
          vim.schedule(function()
            local buffers = get_bufs()
            for i, v in ipairs(buffers) do
              buflist_cache[i] = v
            end
            for i = #buffers + 1, #buflist_cache do
              buflist_cache[i] = nil
            end
            if #buflist_cache > 1 then
              vim.o.showtabline = 2
            elseif vim.o.showtabline ~= 1 then
              vim.o.showtabline = 1
            end
          end)
        end,
      })
      local BufferLine = utils.make_buflist(
      TablineBufferBlock,
      { provider = " ", hl = { fg = "gray" } },
      { provider = " ", hl = { fg = "gray" } },
      function() return buflist_cache end,
      false
      )
      vim.keymap.set("n", "<leader>bb", function()
        local tabline = require("heirline").tabline
        local buflist = tabline._buflist[1]
        buflist._picker_labels = {}
        buflist._show_picker = true
        vim.cmd.redrawtabline()
        local char = vim.fn.getcharstr()
        local bufnr = buflist._picker_labels[char]
        if bufnr then vim.api.nvim_win_set_buf(0, bufnr) end
        buflist._show_picker = false
        vim.cmd.redrawtabline()
      end, { noremap = true, desc = "Go to" })
      heirline.setup {  tabline = BufferLine }
    end,
  },

}
