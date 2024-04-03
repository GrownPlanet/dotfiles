-- underscore cursor
vim.o.guicursor= "n-v-c:hor25,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- no text wrapping
vim.o.wrap = false
-- line numbers
vim.o.number = true
-- relative line numbers
vim.o.relativenumber = true
-- line on the row of the cursor
-- vim.o.cursorline = true
-- ignore case when searching
vim.o.ignorecase = true
-- if searching contains uppercase char, don't ignore case
vim.o.smartcase = true
-- tabs with two spaces
vim.o.tabstop = 2
-- two spaces when auto indenting
vim.o.shiftwidth = 2
-- use spaces instead of tabs
vim.o.expandtab = true
-- leave some room when scrolling
vim.o.scrolloff = 5
-- auto indenting
vim.o.autoindent = true
-- stop errors
vim.o.signcolumn = 'yes:1'
