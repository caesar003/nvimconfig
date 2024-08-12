vim.api.nvim_create_user_command('HandleBufferClose', function()
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  local current_buf = vim.fn.bufnr('%')
  
  -- Check if the current buffer has unsaved changes
  local modified = vim.fn.getbufvar(current_buf, '&modified') == 1
  
  if modified then
    -- Prompt the user with options
    vim.ui.input({
      prompt = "Current buffer has unsaved changes. Do you want to save it? [y]es, [n]o, [C]ancel: ",
    }, function(choice)
      if choice == 'y' or choice == 'Y' then
        -- Save changes, switch to the previous buffer, and then close the current buffer
        vim.cmd('w')  -- Save the buffer
        vim.cmd('bp') -- Switch to the previous buffer
        vim.cmd('bd#')-- Close the previous buffer
      elseif choice == 'n' or choice == 'N' then
        -- Discard changes, switch to the previous buffer, and then close the current buffer
        vim.cmd('bp')    -- Switch to the previous buffer
        vim.cmd('bd!#')  -- Force close the current buffer
      -- No action needed for cancel
      end
    end)
  else
    if #buffers == 1 then
      -- Only one buffer is open, just close it
      vim.cmd('bd')
    else
      -- More than one buffer is open
      vim.cmd('bp')   -- Switch to the previous buffer
      vim.cmd('bd#')  -- Close the current buffer
    end
  end
end, {})

vim.api.nvim_create_user_command('Noh', 'nohlsearch', {})
vim.api.nvim_create_user_command('NOH', 'nohlsearch', {})
vim.api.nvim_create_user_command('Ls', 'ls', {})
vim.api.nvim_create_user_command('LS', 'ls', {})

