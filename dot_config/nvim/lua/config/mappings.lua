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
map('n', '<leader>f', '<cmd>Telescope find_files<CR>')
map('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>bf', '<cmd>Telescope buffers<CR>')

-- buffers
map('n', 'gn', '<cmd>BufferNext<CR>')
map('n', 'gp', '<cmd>BufferPrevious<CR>')
map('n', '<leader>bp', '<cmd>BufferPick<CR>')
map('n', '<leader>bc', '<cmd>BufferClose<CR>')

-- don't move the cursor when combining lines
map('n', 'J', 'mzJ`z')

-- filetree
map('n', '<leader>t', '<cmd>NvimTreeToggle<CR>')

-- better moving throught file
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- new file
function CreateFile()
    local filename = vim.fn.input('> ')
    vim.cmd('edit ' .. filename)
end

map('n', '<leader>n', '<cmd>lua CreateFile()<CR>')

-- void replace
map("x", "<leader>p", [["_dP]])
