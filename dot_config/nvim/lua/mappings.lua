require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- Map 'y' to yank
map('v', 'y', 'y')

-- Map 'p' to paste
map('v', 'p', 'p')

-- Map leader + 'y' to yank to clipboard
map('v', '<Leader>y', '"+y')

-- Map leader + 'p' to paste from clipboard
map('v', '<Leader>p', '"+p')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
