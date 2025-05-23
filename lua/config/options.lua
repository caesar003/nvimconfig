-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

local opts = vim.opt
local cmd = vim.cmd
local fun = vim.fn
local _g = vim.g
local autocmd = vim.api.nvim_create_autocmd

_g.mapleader = " "
_g.maplocalleader = "\\"

cmd("syntax on")

vim.o.guifont = "Fira Code:h11"

opts.mouse = ""
opts.autoread = true
opts.encoding = "utf-8"
opts.fileencoding = "utf-8"
opts.fileencodings = "utf-8"
opts.ttyfast = true
opts.backspace = { "indent", "eol", "start" }
opts.number = true
opts.relativenumber = true
opts.cursorcolumn = true
opts.cursorline = true
opts.conceallevel = 2
opts.path:append("**")
opts.wildignore:append("*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/")
opts.hidden = true
opts.timeout = true
opts.timeoutlen = 500
opts.ruler = true
opts.showmode = false
opts.wildmenu = true
opts.wildmode = { "list:longest", "full" }
opts.tabstop = 2
opts.softtabstop = 0
opts.shiftwidth = 2
opts.expandtab = true
opts.smartindent = true
opts.autoindent = true
opts.hlsearch = true
opts.incsearch = true
opts.ignorecase = true
opts.smartcase = true
opts.laststatus = 2
opts.linebreak = true
opts.wrap = true
opts.breakindent = true
opts.foldcolumn = "1"
opts.foldlevelstart = 99
opts.showtabline = 2
opts.showcmd = true

opts.termguicolors = true
opts.belloff = "all"
opts.visualbell = true
opts.scrolloff = 8

cmd('let &t_SI = "\\e[5 q"')
cmd('let &t_EI = "\\e[1 q"')
cmd("set t_ZH=^[[3m")
cmd("set t_ZR=^[[23m")

_g.loaded_perl_provider = 0
_g.loaded_ruby_provider = 0

opts.tags = "./tags,tags;$HOME"
_g.disable_bg = 1

_g.lazyvim_php_lsp = "intelephense"

_g.python3_host_prog = vim.fn.expand("~/.neovim-venv/bin/python")

if fun.has("unnamedplus") == 1 then
  opts.clipboard = "unnamed,unnamedplus"
end

if fun.has("termguicolors") == 1 then
  cmd('let &t_ZH="\\e[3m"')
  cmd('let &t_ZR="\\e[23m"')
end

autocmd("FileType", { pattern = "javascript", command = "setlocal foldmethod=syntax" })
autocmd("FileType", { pattern = "javascriptreact", command = "setlocal foldmethod=syntax" })
autocmd("FileType", { pattern = "typescript", command = "setlocal foldmethod=syntax" })
autocmd("FileType", { pattern = "typescriptreact", command = "setlocal foldmethod=syntax" })
autocmd("FileType", { pattern = "html", command = "setlocal foldmethod=indent" })
autocmd("FileType", { pattern = "css", command = "setlocal foldmethod=syntax" })
autocmd("FileType", { pattern = "vim", command = "setlocal foldmethod=marker" })
autocmd("FileType", { pattern = "json", command = "setlocal foldmethod=syntax" })
autocmd("FileType", { pattern = "sh", command = "setlocal foldmethod=syntax" })
autocmd("FileType", { pattern = "lua", command = "setlocal foldmethod=indent" })

autocmd({ "BufRead", "BufNewFile" }, { pattern = { ".env", ".env.*" }, command = "set filetype=sh" })

autocmd("BufWritePre", {
  pattern = { "*.php", "*.blade.php", "*.lua", "*.sh", "*.bash", "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.html", "*.json" },
  callback = function()
    -- vim.cmd("Prettier")
  end,
})
