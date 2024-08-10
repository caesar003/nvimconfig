-- {{{ Settings
local map = vim.api.nvim_set_keymap
-- {{{ Basic mappings
map('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = 'File Explorer' })

map('n', '<leader>q', ':q<CR>', { noremap = true, desc = 'Exit' })
map('n', '<leader>Q', ':q!<CR>', { noremap = true, desc = 'Exit Discarding Changes' })
map('n', '<leader>w', ':w<CR>', { noremap = true, desc = 'Save' })
map('n', '<leader>E', ':e<space>', { noremap = true, desc = 'Open file' })
map('n', '<leader>n', ':enew<CR>', { noremap = true, silent = true, desc = 'Empty file' })
-- }}}

-- {{{ Window resize mappings
map('n', '<leader><Up>', ':resize +5<CR>', { noremap = true, silent = true })
map('n', '<leader><Down>', ':resize -5<CR>', { noremap = true, silent = true })
map('n', '<leader><Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })
map('n', '<leader><Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ Configuration file mappings
map('n', '<leader>T', ':e ~/.config/tmux/tmux.conf<CR>', { noremap = true, silent = true, desc = 'Edit Tmux Conf' })
map('n', '<leader>K', ':e ~/.config/kitty/kitty.conf<CR>', { noremap = true, silent = true, desc = 'Edit Kitty Conf' })
-- }}}

-- {{{ FZF mappings
map('n', '<leader>fw', ':Telescope live_grep<CR>', { noremap = true, silent = true, desc = 'Pattern' })
map('n', '<leader>fg', ':Telescope git_files<CR>', { noremap = true, silent = true, desc = 'Git files' })
map('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true, desc = 'Files' })
map('n', '<leader>ft', ':set filetype=', { noremap = true,  })
-- }}}

-- {{{ Buffer navigation mappings
map('n', '[b', ':bp<CR>', { noremap = true, silent = true, desc = 'Next Buffer' })
map('n', ']b', ':bn<CR>', { noremap = true, silent = true, desc = 'Previous Buffer' })
map('n', '<leader>b-', ':b#<CR>', { noremap = true, silent = true, desc = "Previous active Buffer" })
map('n', '<leader>bo', ':BufOnly<CR>', { noremap = true, silent = true, desc = "Close all but this" })
map('n', '<leader>bO', ':BufOnly<space>', { noremap = true, desc = "Close all but ..." })
map('n', '<leader>bl', ':Buffers<cr>', { noremap = true })
-- }}}

-- {{{ Split window mappings
map('n', '|', ':vsplit<CR>', { noremap = true, silent = true })
map('n', '\\', ':split<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ Tmux navigator mappings
map('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
map('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
map('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
map('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
map('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
map('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
map('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
map('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
-- }}}

-- {{{ Floaterm mappings
map('n', '<F6>', ':FloatermToggle<CR>', { noremap = true, silent = true })
map('n', '<F7>', ':FloatermNew<CR>', { noremap = true, silent = true })
map('n', '<F8>', ':FloatermPrev<CR>', { noremap = true, silent = true })
map('n', '<F9>', ':FloatermNext<CR>', { noremap = true, silent = true })
map('t', '<F6>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true })
map('t', '<F7>', '<C-\\><C-n>:FloatermNew<CR>', { noremap = true, silent = true })
map('t', '<F8>', '<C-\\><C-n>:FloatermPrev<CR>', { noremap = true, silent = true })
map('t', '<F9>', '<C-\\><C-n>:FloatermNext<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ Session mappings
map('n', '<leader>sr', ':SLoad<space>', { noremap = true })
map('n', '<leader>sc', ':SClose<CR>', { noremap = true })
map('n', '<leader>ss', ':SSave<CR>', { noremap = true })
map('n', '<leader>sd', ':SDelete<CR>', { noremap = true })
-- }}}

-- {{{ Commentary mappings
map('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true, desc = 'Comment' })
map('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true, desc = 'Comment' })
-- }}}

-- {{{ Disable arrow keys
map('i', '<Up>', '<NOP>', { noremap = true })
map('i', '<Down>', '<NOP>', { noremap = true })
map('i', '<Left>', '<NOP>', { noremap = true })
map('i', '<Right>', '<NOP>', { noremap = true })
map('n', '<Up>', '<NOP>', { noremap = true })
map('n', '<Down>', '<NOP>', { noremap = true })
map('n', '<Left>', '<NOP>', { noremap = true })
map('n', '<Right>', '<NOP>', { noremap = true })
-- }}}


-- {{{ Miscellaneous mappings
-- Toggle fold
map('n', '<leader><leader>', 'za', { noremap = true, silent = true, desc = 'Toggle fold' })
map('n', '<leader>uw', ':set wrap!<CR>', { noremap = true, silent = true, desc = 'Toggle Wrap' })
map('n', '<leader>un', ':set nu!<CR>', { noremap = true, silent = true, desc = 'Toggle Number' })
map('n', '<leader>ur', ':set rnu!<CR>', { noremap = true, silent = true, desc = 'Toggle Relative Number' })
map('n', '<leader>H', ':execute "Startify"<CR>', { noremap = true, silent = true, desc = 'Go home' })
-- File info
map('n', '<leader>i', ':f<CR>', { noremap = true, silent = true, desc = 'File information'})
-- Quick escape
map('i', 'jj', '<esc>', { noremap = true, silent = true })
map('i', 'JJ', '<esc>', { noremap = true, silent = true })


-- }}}
-- }}}
