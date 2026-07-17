-- leadermap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Map leader + "y" to yank to clipboard
vim.keymap.set({"v", "n"}, "<leader>y", "\"+y")

-- Map leader + "p" to paste from clipboard
vim.keymap.set({"v", "n"}, "<leader>p", "\"+p")
vim.keymap.set({"v", "n"}, "<leader>P", "\"+P")

-- Map U to undo
vim.keymap.set("n", "U", "<C-r>")

-- fuzzy finder
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>Pick buffers<CR>")

-- spelling
vim.keymap.set("n", "Z", "1z=")

-- leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")

-- windows
vim.keymap.set("n", "<c-h>", ":wincmd h<cr>")
vim.keymap.set("n", "<c-j>", ":wincmd j<cr>")
vim.keymap.set("n", "<c-k>", ":wincmd k<cr>")
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>")
