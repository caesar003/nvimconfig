-- Helper function to check if a buffer is modified
local function is_buffer_modified(buf)
  return vim.fn.getbufvar(buf, '&modified') == 1
end

-- Helper function to close the current buffer
local function close_buffer(force)
  if force then
    vim.cmd('bd!')  -- Force close the buffer without saving
  else
    vim.cmd('bd')   -- Close the buffer normally
  end
end

-- Helper function to switch to the previous buffer and close the current one
local function switch_and_close_buffer(force)
  vim.cmd('bp')        -- Switch to the previous buffer
  if force then
    vim.cmd('bd!#')    -- Force close the previously active buffer
  else
    vim.cmd('bd#')     -- Close the previously active buffer
  end
end

-- Function to handle buffer close
vim.api.nvim_create_user_command('HandleBufferClose', function()
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  local current_buf = vim.fn.bufnr('%')
  local current_buf_name = vim.fn.bufname(current_buf) or "[Unnamed]"

  if is_buffer_modified(current_buf) then
    print("Current buffer has unsaved changes. Do you want to save it? [y]es, [n]o, [C]ancel: ")
    local choice = vim.fn.nr2char(vim.fn.getchar()):lower()

    if choice == 'y' then
      vim.cmd('w')  -- Save the buffer
      if #buffers > 1 then
        switch_and_close_buffer(false)
      else
        close_buffer(false)
      end
      vim.notify(current_buf_name .. " saved and closed.", vim.log.levels.INFO)

    elseif choice == 'n' then
      if #buffers > 1 then
        switch_and_close_buffer(true)
      else
        close_buffer(true)
      end
      vim.notify(current_buf_name .. " closed without saving.", vim.log.levels.WARN)

    else
      vim.notify("Buffer close canceled.", vim.log.levels.INFO)
    end
  else
    if #buffers > 1 then
      switch_and_close_buffer(false)
    else
      close_buffer(false)
    end
    vim.notify(current_buf_name .. " closed.", vim.log.levels.INFO)
  end
end, {})

-- Languge snippet section

vim.api.nvim_create_user_command('InsertHTML5Boilerplate', function() 
  local lines = {
    '<!DOCTYPE html>',
    '<html lang="en">',
    '<head>',
    '  <meta charset="UTF-8">',
    '  <meta name="viewport" content="width=device-width, initial-scale=1.0">',
    '  <title>Document</title>',
    '</head>',
    '<body>',
    '',
    '</body>',
    '</html>'
  }
  vim.api.nvim_put(lines, 'l', true, true)
end, {})

vim.api.nvim_create_user_command('InsertArrowFunction', function() 
  local lines = {
    'const myFunction = () => {',
    '  // code here',
    '};'
  }
  vim.api.nvim_put(lines, 'l', true, true)
end, {})

vim.api.nvim_create_user_command('InsertJSFunctionExpression', function() 
  local lines = {
    'const myFunction = function() {',
    '  // code here',
    '};'
  }
   -- Insert the lines below the current line
  vim.api.nvim_put(lines, 'l', true, true)
  vim.cmd('normal! 2k0w')
end, {})

vim.api.nvim_create_user_command('InsertFunctionalReactComponent', function() 
  local lines = {
    'import React from "react";',
    '',
    'function MyComponent(props) {',
    '  return (',
    '    <div>',
    '      {/* JSX code here */}',
    '    </div>',
    '  );',
    '}',
    '',
    'export default MyComponent;'
  }
  vim.api.nvim_put(lines, 'l', true, true)
end, {})

vim.api.nvim_create_user_command('InsertJavaScriptSwitchStatement', function() 
  local lines = {
    'switch (expression) {',
    '  case value1:',
    '    // code here',
    '    break;',
    '  case value2:',
    '    // code here',
    '    break;',
    '  default:',
    '    // code here',
    '}'
  }
  vim.api.nvim_put(lines, 'l', true, true)
end, {})

vim.api.nvim_create_user_command('InsertNamedReactComponent', function() 
  local lines = {
    'import React from "react";',
    '',
    'const MyComponent = (props) => {',
    '  return (',
    '    <div>',
    '      {/* JSX code here */}',
    '    </div>',
    '  );',
    '};',
    '',
    'export default MyComponent;'
  }
  vim.api.nvim_put(lines, 'l', true, true)
end, {})


vim.api.nvim_create_user_command('Noh', 'nohlsearch', {})
vim.api.nvim_create_user_command('NOH', 'nohlsearch', {})
vim.api.nvim_create_user_command('Ls', 'ls', {})
vim.api.nvim_create_user_command('LS', 'ls', {})





