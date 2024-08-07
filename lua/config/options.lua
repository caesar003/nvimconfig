-- {{{ Settings

vim.cmd('syntax on')
-- {{{ General Settings


vim.opt.mouse = ""
vim.opt.autoread = true
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'
vim.opt.ttyfast = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.conceallevel = 2
vim.opt.path:append('**')
vim.opt.wildignore:append('*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/')
vim.opt.hidden = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.ruler = true
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.wildmode = { 'list:longest', 'full' }
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.foldcolumn = '1'
vim.opt.foldlevelstart = 99
vim.opt.showtabline = 1
vim.opt.showcmd = true
vim.opt.termguicolors = true
vim.opt.belloff = 'all'
vim.opt.visualbell = true

vim.cmd('let &t_SI = "\\e[5 q"')
vim.cmd('let &t_EI = "\\e[1 q"')
vim.cmd('set t_ZH=^[[3m')
vim.cmd('set t_ZR=^[[23m')
-- }}}

-- {{{
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- }}}

-- {{{ Status Line Settings
-- vim.opt.statusline = '%f %m %r %y %{&ff} %h %= l:%l/%L c:%c %p%%'
vim.opt.tags = './tags,tags;$HOME'
-- }}}

-- {{{ Colorscheme and Theme Settings
vim.opt.background = 'dark'

vim.cmd('highlight Comment cterm=italic')
vim.cmd('highlight String cterm=italic gui=italic')
vim.cmd('highlight Function cterm=italic gui=italic')
vim.cmd('highlight Keyword cterm=italic gui=italic')
vim.g.disable_bg = 1
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi NonText ctermbg=NONE')
vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
vim.cmd('hi Floaterm guibg=NONE')
vim.cmd('hi FloatermBorder guibg=NONE guifg=white')


-- {{{ Floaterm configurations
vim.g.floaterm_height = 0.8
vim.g.floaterm_width = 0.8
vim.g.floaterm_title = ' Floaterm: ($1|$2) '
vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
-- }}}

if vim.fn.exists('+termguicolors') == 1 and vim.opt.termguicolors:get() then
    vim.cmd('hi Visual guifg=#000000 guibg=#FFA500')
    vim.cmd('hi Search guifg=#000000 guibg=#FFA500')
    vim.cmd('hi Cursor guifg=#FFA500 guibg=#1a1a1a')
else
    vim.cmd('hi Visual ctermfg=208 ctermbg=234')
    vim.cmd('hi Search ctermfg=208 ctermbg=234')
    vim.cmd('hi Cursor ctermfg=208 ctermbg=234')
end
-- }}}

-- {{{ Clipboard Settings
if vim.fn.has('unnamedplus') == 1 then
    vim.opt.clipboard = 'unnamed,unnamedplus'
end
if vim.fn.has('termguicolors') == 1 then
    vim.cmd('let &t_ZH="\\e[3m"')
    vim.cmd('let &t_ZR="\\e[23m"')
end
-- }}}

-- {{{ FileType Settings
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'javascript',
    command = 'setlocal foldmethod=syntax',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'html',
    command = 'setlocal foldmethod=indent',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'css',
    command = 'setlocal foldmethod=syntax',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'vim',
    command = 'setlocal foldmethod=marker',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'json',
    command = 'setlocal foldmethod=syntax',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'sh',
    command = 'setlocal foldmethod=syntax',
})


vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lua',
    command = 'setlocal foldmethod=indent',
})

-- }}}

-- }}}

