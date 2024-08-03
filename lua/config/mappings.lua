-- {{{ Settings
-- {{{ Basic mappings
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':q!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>E', ':e<space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':enew<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ Window resize mappings
vim.api.nvim_set_keymap('n', '<leader><Up>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Down>', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ Configuration file mappings
vim.api.nvim_set_keymap('n', '<leader>T', ':e ~/.config/tmux/tmux.conf<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>K', ':e ~/.config/kitty/kitty.conf<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ FZF mappings
vim.api.nvim_set_keymap('n', '<leader>fw', ':Rg<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':GitFiles<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', ':set filetype=', { noremap = true })
-- }}}

-- {{{ Buffer navigation mappings
vim.api.nvim_set_keymap('n', '[b', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']b', ':bn<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>c', ':call HandleBufferClose()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b-', ':b#<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bo', ':BufOnly<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bO', ':BufOnly<space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>B', ':Buffers<cr>', { noremap = true })
-- }}}

-- {{{ Split window mappings
vim.api.nvim_set_keymap('n', '|', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\', ':split<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ Tmux navigator mappings
vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
-- }}}

-- {{{ Floaterm mappings

-- }}}

-- {{{ Session mappings
vim.api.nvim_set_keymap('n', '<leader>sr', ':SLoad<space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sc', ':SClose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ss', ':SSave<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sd', ':SDelete<CR>', { noremap = true })
-- }}}

-- {{{ Commentary mappings
vim.api.nvim_set_keymap('n', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>/', ':Commentary<CR>', { noremap = true, silent = true })
-- }}}

-- {{{ Disable arrow keys
vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true })
-- }}}

-- {{{ Git fugitive mappings
vim.api.nvim_set_keymap('n', '<leader>gs', ':G status<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':G diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':G pull<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':G commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ga', ':G add<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':G branch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', ':G log<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gh', ':help fugitive<CR>', { noremap = true })
-- }}}

-- {{{ Miscellaneous mappings
-- Toggle fold
vim.api.nvim_set_keymap('n', '<leader><leader>', 'za', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>uw', ':set wrap!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>un', ':set number!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ur', ':set relativenumber!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>H', ':execute "Startify"<CR>', { noremap = true, silent = true })
-- File info
vim.api.nvim_set_keymap('n', '<leader>i', ':f<CR>', { noremap = true, silent = true })
-- Quick escape
vim.api.nvim_set_keymap('i', 'jj', '<esc>', { noremap = true, silent = true })
-- }}}
-- }}}
