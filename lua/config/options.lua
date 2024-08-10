-- {{{ Settings

local opts = vim.opt
local comm = vim.cmd
local fun = vim.fn 
local _g = vim.g
local autocmd = vim.api.nvim_create_autocmd

comm('syntax on')
-- {{{ General Settings

opts.mouse = ""
opts.autoread = true
opts.encoding = 'utf-8'
opts.fileencoding = 'utf-8'
opts.fileencodings = 'utf-8'
opts.ttyfast = true
opts.backspace = { 'indent', 'eol', 'start' }
opts.number = true
opts.relativenumber = true
opts.cursorcolumn = true
opts.cursorline = true
opts.conceallevel = 2
opts.path:append('**')
opts.wildignore:append('*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/')
opts.hidden = true
opts.timeout = true
opts.timeoutlen = 500
opts.ruler = true
opts.showmode = false
opts.wildmenu = true
opts.wildmode = { 'list:longest', 'full' }
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
opts.foldcolumn = '1'
opts.foldlevelstart = 99
opts.showtabline = 2
opts.showcmd = true
opts.termguicolors = true
opts.belloff = 'all'
opts.visualbell = true

comm('let &t_SI = "\\e[5 q"')
comm('let &t_EI = "\\e[1 q"')
comm('set t_ZH=^[[3m')
comm('set t_ZR=^[[23m')
-- }}}

-- {{{
_g.loaded_perl_provider = 0
_g.loaded_ruby_provider = 0
-- }}}

-- {{{ Status Line Settings
-- vim.opt.statusline = '%f %m %r %y %{&ff} %h %= l:%l/%L c:%c %p%%'
opts.tags = './tags,tags;$HOME'
-- }}}

-- {{{ Colorscheme and Theme Settings
opts.background = 'dark'
_g.disable_bg = 1

comm('highlight Comment cterm=italic')
comm('highlight String cterm=italic gui=italic')
comm('highlight Function cterm=italic gui=italic')
comm('highlight Keyword cterm=italic gui=italic')
comm('hi Normal guibg=NONE ctermbg=NONE')
comm('hi NonText ctermbg=NONE')
comm('hi SignColumn ctermbg=NONE guibg=NONE')
comm('hi LineNr ctermbg=NONE guibg=NONE')
comm('hi Floaterm guibg=NONE')
comm('hi FloatermBorder guibg=NONE guifg=white')


if fun.exists('+termguicolors') == 1 and vim.opt.termguicolors:get() then
    comm('hi Visual guifg=#000000 guibg=#FFA500')
    comm('hi Search guifg=#000000 guibg=#FFA500')
    comm('hi Cursor guifg=#FFA500 guibg=#1a1a1a')
else
    comm('hi Visual ctermfg=208 ctermbg=234')
    comm('hi Search ctermfg=208 ctermbg=234')
    comm('hi Cursor ctermfg=208 ctermbg=234')
end
-- }}}

-- {{{ Clipboard Settings
if fun.has('unnamedplus') == 1 then
    opts.clipboard = 'unnamed,unnamedplus'
end
if fun.has('termguicolors') == 1 then
    comm('let &t_ZH="\\e[3m"')
    comm('let &t_ZR="\\e[23m"')
end
-- }}}

-- {{{ FileType Settings
autocmd('FileType', {
    pattern = 'javascript',
    command = 'setlocal foldmethod=syntax',
})

autocmd('FileType', {
    pattern = 'html',
    command = 'setlocal foldmethod=indent',
})

autocmd('FileType', {
    pattern = 'css',
    command = 'setlocal foldmethod=syntax',
})

autocmd('FileType', {
    pattern = 'vim',
    command = 'setlocal foldmethod=marker',
})

autocmd('FileType', {
    pattern = 'json',
    command = 'setlocal foldmethod=syntax',
})

autocmd('FileType', {
    pattern = 'sh',
    command = 'setlocal foldmethod=syntax',
})

autocmd('FileType', {
    pattern = 'lua',
    command = 'setlocal foldmethod=indent',
})

-- }}}

-- }}}

