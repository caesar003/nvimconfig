local cmd = vim.api.nvim_create_user_command

cmd("Noh", "nohlsearch", {})
cmd("NOH", "nohlsearch", {})
cmd("Ls", "ls", {})
cmd("LS", "ls", {})

cmd("InsertDate", function()
  vim.api.nvim_put({ os.date("%a %b %d %Y, %H.%M") }, "l", true, true)
end, {})

cmd("ToggleJSDebug", function()
  -- List of filetypes where eslint-disable is applicable
  local supported_filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  }

  -- Check current filetype
  local current_filetype = vim.bo.filetype

  -- Check if current filetype is supported
  local is_supported = false
  for _, ft in ipairs(supported_filetypes) do
    if current_filetype == ft then
      is_supported = true
      break
    end
  end

  if not is_supported then
    vim.notify("eslint-disable not applicable for " .. current_filetype .. " files", vim.log.levels.WARN)
    return
  end

  -- Check if the first line already has the eslint-disable comment
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
  if first_line:match("^%s*/%* eslint%-disable no%-console %*/") then
    -- If already present, remove the comment
    vim.api.nvim_buf_set_lines(0, 0, 1, false, { "" })
    vim.notify("Removed eslint-disable comment", vim.log.levels.INFO)
  else
    -- Insert the eslint-disable comment at the top of the file
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { "/* eslint-disable no-console */" })
    vim.notify("Added eslint-disable comment", vim.log.levels.INFO)
  end
end, {})
