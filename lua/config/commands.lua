-- Handle buffer close
vim.api.nvim_create_user_command('HandleBufferClose', function()
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  local current_buf = vim.fn.bufnr('%')
  local current_buf_name = vim.fn.bufname(current_buf) or "[Unnamed]"

  -- Check if the current buffer has unsaved changes
  local modified = vim.fn.getbufvar(current_buf, '&modified') == 1

  if modified then
    -- Prompt the user with options
    print("Current buffer has unsaved changes. Do you want to save it? [y]es, [n]o, [C]ancel: ")
    local choice = vim.fn.nr2char(vim.fn.getchar())

    if choice == 'y' or choice == 'Y' then
      -- Save changes, switch to the previous buffer, and then close the current buffer
      vim.cmd('w')  -- Save the buffer
      vim.cmd('bp') -- Switch to the previous buffer
      vim.cmd('bd#')-- Close the previous buffer
      vim.notify(current_buf_name .. " saved and closed.", vim.log.levels.INFO)
    elseif choice == 'n' or choice == 'N' then
      -- Discard changes, switch to the previous buffer, and then close the current buffer
      vim.cmd('bp')    -- Switch to the previous buffer
      vim.cmd('bd!#')  -- Force close the current buffer
      vim.notify(current_buf_name .. " closed without saving.", vim.log.levels.WARN)
    else
      vim.notify("Buffer close canceled.", vim.log.levels.INFO)
    end
  else
    if #buffers == 1 then
      -- Only one buffer is open, just close it
      vim.cmd('bd')
      vim.notify(current_buf_name .. " closed.", vim.log.levels.INFO)
    else
      -- More than one buffer is open
      vim.cmd('bp')   -- Switch to the previous buffer
      vim.cmd('bd#')  -- Close the current buffer
      vim.notify(current_buf_name .. " closed.", vim.log.levels.INFO)
    end
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


