-- no wrapping 
vim.o.wrap = false

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = false

-- spaces instead of tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.scrolloff = 8

vim.o.autoindent = true

-- line at the 80th column
vim.o.colorcolumn = "80"

-- stop columns from jumping
vim.o.signcolumn = "yes"

-- truecolor
vim.o.termguicolors = true
vim.cmd("colorscheme onedark")

-- nicer borders
vim.o.winborder = "single"

-- spelling language
vim.o.spelllang = "nl,en"
