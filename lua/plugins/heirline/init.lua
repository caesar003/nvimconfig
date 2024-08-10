return { 
  {
    "rebelot/heirline.nvim",
    config = function()
      local heirline = require("heirline")
      local conditions = require("heirline.conditions")
      local utils = require("heirline.utils")
      local colors = require("plugins.heirline.colors")

      -- local ViMode = require("plugins.heirine.components.ViMode")
      local FileNameBlock = require("plugins.heirline.components.FileNameBlock")
      local Git = require("plugins.heirline.components.Git")
      local ScrollBar = require("plugins.heirline.components.ScrollBar")
      local FileIcon = require("plugins.heirline.components.FileIcon")
      local FileName = require("plugins.heirline.components.FileName")
      local FileEncoding = require("plugins.heirline.components.FileEncoding")
      local FileFlags = require("plugins.heirline.components.FileFlags")
      local FileNameModifer = require("plugins.heirline.components.FileNameModifer")
      local FileType = require("plugins.heirline.components.FileType")
      local FileFormat = require("plugins.heirline.components.FileFormat")
      local Space = require("plugins.heirline.components.Space")
      local Ruler = require("plugins.heirline.components.Ruler")

      local TablinePicker = require("plugins.heirline.components.TablinePicker")
      local TablineFileName = require("plugins.heirline.components.TablineFileName")
      local TablineFileFlags = require("plugins.heirline.components.TablineFileFlags")
      local TablineBufnr = require("plugins.heirline.components.TablineBufnr")


      local ViMode = require("plugins.heirline.components.ViMode") 

      FileNameBlock =
        utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), FileFlags, {provider = "%<"})

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
        {provider = "%="},
        Git,
        {provider = "%="},
        Ruler,
        Space,
        ScrollBar
      }

      local TablineFileNameBlock = {
        init = function(self)
          self.filename = vim.api.nvim_buf_get_name(self.bufnr)
        end,
        hl = function(self)
          if self.is_active then
            return "TabLineSel"
          else
            return "TabLine"
          end
        end,
        on_click = {
          callback = function(_, minwid, _, button)
            if (button == "m") then -- close on mouse middle click
              vim.schedule(
                function()
                  vim.api.nvim_buf_delete(minwid, {force = false})
                end
              )
            else
              vim.api.nvim_win_set_buf(0, minwid)
            end
          end,
          minwid = function(self)
            return self.bufnr
          end,
          name = "heirline_tabline_buffer_callback"
        },
        TablineBufnr,
        FileIcon,
        TablineFileName,
        TablineFileFlags
      }

      local TablineBufferBlock =
        utils.surround(
        {" ", " "},
        function(self)
          if self.is_active then
            return utils.get_highlight("TabLineSel").bg
          else
            return utils.get_highlight("TabLine").bg
          end
        end,
        {
          TablineFileNameBlock,
          -- TablineCloseButton,
          TablinePicker
        }
      )

      local get_bufs = function()
        return vim.tbl_filter(
          function(bufnr)
            return vim.api.nvim_get_option_value("buflisted", {buf = bufnr})
          end,
          vim.api.nvim_list_bufs()
        )
      end

      local buflist_cache = {}

      vim.api.nvim_create_autocmd(
        {"VimEnter", "UIEnter", "BufAdd", "BufDelete"},
        {
          callback = function()
            vim.schedule(
              function()
                local buffers = get_bufs()
                for i, v in ipairs(buffers) do
                  buflist_cache[i] = v
                end
                for i = #buffers + 1, #buflist_cache do
                  buflist_cache[i] = nil
                end

                if #buflist_cache > 1 then
                  vim.o.showtabline = 2 -- always
                elseif vim.o.showtabline ~= 1 then
                  vim.o.showtabline = 1
                end
              end
            )
          end
        }
      )

      local BufferLine =
        utils.make_buflist(
        TablineBufferBlock,
        {provider = " ", hl = {fg = "gray"}},
        {provider = " ", hl = {fg = "gray"}},
        function()
          return buflist_cache
        end,
        false
      )

      vim.keymap.set(
        "n",
        "<leader>bb",
        function()
          local tabline = require("heirline").tabline
          local buflist = tabline._buflist[1]
          buflist._picker_labels = {}
          buflist._show_picker = true
          vim.cmd.redrawtabline()
          local char = vim.fn.getcharstr()
          local bufnr = buflist._picker_labels[char]
          if bufnr then
            vim.api.nvim_win_set_buf(0, bufnr)
          end
          buflist._show_picker = false
          vim.cmd.redrawtabline()
        end,
        {
          noremap = true,
          desc = "Go to"
        }
      )

      heirline.setup(
        {
          statusline = StatusLine,
          tabline = BufferLine
        }
      )
    end
  }
}
