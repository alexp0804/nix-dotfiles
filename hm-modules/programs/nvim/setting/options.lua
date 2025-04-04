-- use NvimTree by default
-- vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- auto save, no backups
opt.autowrite = true
opt.backup = false

-- numbers, relative numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 5

--- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- linewrap
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- colors
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.colorcolumn = "100"

-- keep signcolumn on by default
opt.signcolumn = "yes"

-- minimum number of screen lines above and below cursor
opt.scrolloff = 10

-- shows substitute effects that occur off-screen
opt.inccommand = "split"

-- statusline on every window
opt.laststatus = 2

-- don't show "-- INSERT --", etc because its already in the lualine
opt.showmode = false

opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- highlight end of buffer line numbers
vim.cmd([[set fillchars+=eob:\-]])

-- split window behavior (new vertical windows on right, new horizontal windows below)
opt.splitright = true
opt.splitbelow = true
