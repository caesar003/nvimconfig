local cmd = vim.api.nvim_create_user_command

cmd("Noh", "nohlsearch", {})
cmd("NOH", "nohlsearch", {})
cmd("Ls", "ls", {})
cmd("LS", "ls", {})

local function is_neotree_open()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    if ft == "neo-tree" then
      return true
    end
  end
  return false
end

cmd("ToggleNeoTree", function()
  if is_neotree_open() then
    vim.cmd("Neotree toggle")
  else
    vim.cmd("Neotree reveal position=float")
  end
end, {})

cmd("InsertDate", function()
  vim.api.nvim_put({ tostring(os.date("%a %b %d %Y, %H.%M")) }, "l", true, true)
end, {})



-- NEW: Add console.log abbreviation only for JS/TS-like filetypes
local function setup_console_log_abbrev()
  local supported_filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  }

  local current_filetype = vim.bo.filetype
  for _, ft in ipairs(supported_filetypes) do
    if current_filetype == ft then
      -- Define insert mode abbreviation
      vim.cmd([[iabbrev <buffer> clg console.log();<Esc>F(a]])
      return
    end
  end
end

-- Run when entering a buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
  callback = setup_console_log_abbrev,
})
