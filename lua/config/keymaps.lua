local map = vim.api.nvim_set_keymap

map("n", "<leader>q", ":q<CR>", { noremap = true, desc = "Exit" })
map("n", "<leader>Q", ":q!<CR>", { noremap = true, desc = "Exit Discarding Changes" })
map("n", "<leader>w", ":w<CR>", { noremap = true, desc = "Save" })
map("n", "<leader>E", ":e<space>", { noremap = true, desc = "Open file" })
map("n", "<leader>n", ":enew<CR>", { noremap = true, silent = true, desc = "Empty file" })

map("n", "<leader><Up>", ":resize +5<CR>", { noremap = true, silent = true })
map("n", "<leader><Down>", ":resize -5<CR>", { noremap = true, silent = true })
map("n", "<leader><Right>", ":vertical resize +5<CR>", { noremap = true, silent = true })
map("n", "<leader><Left>", ":vertical resize -5<CR>", { noremap = true, silent = true })

map("n", "<leader>ft", ":set filetype=", { noremap = true })

map("n", "[b", ":bp<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
map("n", "]b", ":bn<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
map("n", "<leader>b-", ":b#<CR>", { noremap = true, silent = true, desc = "Previous active Buffer" })

map("n", "|", ":vsplit<CR>", { noremap = true, silent = true })
map("n", "\\", ":split<CR>", { noremap = true, silent = true })

map("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })

map("n", "<Up>", "<NOP>", { noremap = true })
map("n", "<Down>", "<NOP>", { noremap = true })
map("n", "<Left>", "<NOP>", { noremap = true })
map("n", "<Right>", "<NOP>", { noremap = true })

map("n", "<leader><leader>", "za", { noremap = true, silent = true, desc = "Toggle fold" })

map("n", "<leader>uw", ":set wrap!<CR>", { noremap = true, silent = true, desc = "Toggle Wrap" })
map("n", "<leader>un", ":set nu!<CR>", { noremap = true, silent = true, desc = "Toggle Number" })
map("n", "<leader>ur", ":set rnu!<CR>", { noremap = true, silent = true, desc = "Toggle Relative Number" })
map("n", "<leader>i", ":f<CR>", { noremap = true, silent = true, desc = "File information" })
map("i", "jj", "<esc>", { noremap = true, silent = true })
map("i", "JJ", "<esc>", { noremap = true, silent = true })

map("n", "<leader>d", ":InsertDate<CR>", { noremap = true, silent = true })

map(
  "n",
  "<leader>r",
  ":%s/\\r//g<CR><C-O>",
  { noremap = true, silent = true, desc = "Remove carriage returns (^M) and restore cursor" }
)

map(
  "n",
  "<leader>I",
  [[:lua vim.fn.setreg('a', vim.fn.execute('silent! f'))<CR>"ap]],
  { noremap = true, silent = true, desc = "Print file info" }
)
