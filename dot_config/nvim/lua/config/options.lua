-- cursor
vim.o.guicursor= "n-v-c:hor25,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.o.cursorline = true

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

-- spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.scrolloff = 8

vim.o.autoindent = true

vim.o.signcolumn = 'yes:2'

-- no backup
vim.o.swapfile = false
vim.o.backup = false

-- line at the 100th column
-- vim.o.colorcolumn = '100'

-- truecolor
vim.o.termguicolors = true
