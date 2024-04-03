-- leader
vim.g.mapleader = " "

local map = vim.keymap.set

-- Move cursor to the righ twhen exiting normal mode
map('i', '<ESC>', '<Right><ESC>')

-- Map leader + 'y' to yank to clipboard
map('v', '<leader>y', '"+y')
map('n', '<leader>y', '"+y')

-- Map leader + 'p' to paste from clipboard
map('v', '<leader>p', '"+p')
map('n', '<leader>p', '"+p')

-- Map U to undo
map('n', 'U', '<C-r>')

-- explorer
map('n', '<leader>e', vim.cmd.Ex)

-- fuzzy finder
map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
map('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- buffers
map('n', 'gn', '<cmd>bn<cr>')
map('n', 'gp', '<cmd>bp<cr>')
map('n', '<leader>bc', '<cmd>bd<cr>')

-- don't move the cursor when combining lines
map("n", "J", "mzJ`z")
