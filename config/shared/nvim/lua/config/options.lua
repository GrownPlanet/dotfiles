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

-- line at the 100th column
vim.o.colorcolumn = "100"

-- truecolor
vim.o.termguicolors = true
vim.cmd("colorscheme catppuccin-macchiato")

-- make columns less jumpy
vim.o.signcolumn = "yes:1"

-- for taking notes
function Notes()
    -- options
    vim.o.wrap = true
    vim.o.linebreak = true
    vim.o.spell = true
    vim.o.spelllang = "en,nl"
    vim.o.spellcapcheck = ""
    vim.o.colorcolumn = ""

    -- shortcuts for tags
    vim.cmd("abbreviate exp #explore") -- links to explore
    vim.cmd("abbreviate td #todo")
end
