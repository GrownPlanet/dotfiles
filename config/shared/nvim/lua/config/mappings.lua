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
map("n", "<leader>f", "<cmd>Telescope find_files<CR>")
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>b", "<cmd>Telescope buffers<CR>")

-- don"t move the cursor when combining lines
map("n", "J", "mzJ`z")

-- void replace
map("x", "<leader>rp", "\"_dP")

-- buffers
map("n", "gn", ":bn<CR>")
map("n", "gb", ":bb<CR>")

-- leap
map({'n', 'x', 'o'}, 's', '<Plug>(leap)')
