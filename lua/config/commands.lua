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


-- Function to insert the output of the ':f' command at the current cursor position
function InsertFileInfo()
    -- Capture the output of the ':f' command using vim.fn.execute
    local file_info = vim.fn.execute('silent! f')
    
    -- Get the current cursor position
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    
    -- Get the current line
    local current_line = vim.api.nvim_get_current_line()
    
    -- Insert the file info at the cursor position
    local new_line = current_line:sub(1, col) .. file_info .. current_line:sub(col + 1)
    vim.api.nvim_set_current_line(new_line)
    
    -- Move the cursor to the end of the inserted text
    vim.api.nvim_win_set_cursor(0, {row, col + #file_info})
end

-- Map the function to <leader>pf in normal mode
-- vim.api.nvim_set_keymap('n', '<leader>pf', ':lua InsertFileInfo()<CR>', { noremap = true, silent = true })

-- Function to reload Neovim configuration
vim.api.nvim_create_user_command('ReloadConfig', function() 
  -- Unload Lua modules
  for name,_ in pairs(package.loaded) do
    if name:match('^config') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end

  -- Reload the init.lua file
  dofile(vim.fn.stdpath('config') .. '/init.lua')
end, {})

-- Map a key to reload the configuration
vim.api.nvim_set_keymap('n', '<leader>r', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })

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

vim.api.nvim_create_user_command('InsertJavascriptTryCatchBlock', function() 

  local lines = {
    'try { ',
    '',
    '} catch (err) {',
    '',
    '};',
  }
  vim.api.nvim_put(lines, 'l', true, true)

end, {})


vim.api.nvim_create_user_command('InsertJavascriptTryCatchFinallyBlock', function() 
  local lines = {
    'try {',
    '',
    '} catch (err) {',
    '',
    '} finally {',
    '',
    '};',
  }
  vim.api.nvim_put(lines, 'l', true, true)

end, {})


vim.api.nvim_create_user_command('Noh', 'nohlsearch', {})
vim.api.nvim_create_user_command('NOH', 'nohlsearch', {})
vim.api.nvim_create_user_command('Ls', 'ls', {})
vim.api.nvim_create_user_command('LS', 'ls', {})

