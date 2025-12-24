local cmd = vim.api.nvim_create_user_command

cmd("Noh", "nohlsearch", {})
cmd("NOH", "nohlsearch", {})
cmd("Ls", "ls", {})
cmd("LS", "ls", {})



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
