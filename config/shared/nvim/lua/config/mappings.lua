-- leadermap
vim.g.mapleader = " "

local map = vim.keymap.set

-- Map leader + "y" to yank to clipboard
map("v", "<leader>y", "\"+y")
map("n", "<leader>y", "\"+y")

-- Map leader + "p" to paste from clipboard
map("v", "<leader>p", "\"+p")
map("n", "<leader>p", "\"+p")
map("v", "<leader>P", "\"+P")
map("n", "<leader>P", "\"+P")

-- Map U to undo
map("n", "U", "<C-r>")

-- fuzzy finder
map("n", "<leader>f", "<cmd>Pick files<CR>")
map("n", "<leader>g", "<cmd>Pick grep_live<CR>")
map("n", "<leader>b", "<cmd>Pick buffers<CR>")
