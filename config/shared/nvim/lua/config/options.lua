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

-- truecolor
vim.o.termguicolors = true
vim.cmd("colorscheme catppuccin-macchiato")

-- for taking notes
function Notes()
    -- options
    vim.o.wrap = true
    vim.o.linebreak = true
    vim.o.spell = true
    vim.o.spelllang = "en,nl"
    vim.o.spellcapcheck = ""
    vim.o.colorcolumn = ""
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2

    -- moving up and down wrapped lines
    vim.keymap.set("n", "j", "gj")
    vim.keymap.set("n", "k", "gk")
end
