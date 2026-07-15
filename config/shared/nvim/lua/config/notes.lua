function DailyJournal()
    local date = os.date("%Y_%m_%d")
    local journal_dir = "~/sync/notes/persoonlijk/journal/"
    vim.cmd("edit" .. journal_dir .. date .. ".md")
end

function CompilePDF()
    local file = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r") .. ".pdf"
    vim.fn.jobstart({ 
        "pandoc",
        "--pdf-engine=xelatex",
        "-V", "geometry:margin=2.5cm",
        "-V", "fontsize=11pt",
        "-V", "linestretch=1.25",
        "-V", "mainfont=Latin Modern Roman",
        "-V", "colorlinks=true",
        "-V", "papersize=a4",
        file, "-o", output
    })
end

function CompileHTML()
    local file = vim.fn.expand("%:p")
    local output = vim.fn.expand("%:p:r") .. ".html"
    vim.fn.jobstart({ 
        "pandoc",
        "--standalone",
        "--highlight-style=pygments",
        file, "-o", output
    })
end

-- for taking notes
function Notes()
    -- options
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
    vim.opt_local.spellcapcheck = ""
    vim.opt_local.colorcolumn = ""
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2

    -- moving up and down wrapped lines
    vim.keymap.set("n", "j", "gj", { buffer = true })
    vim.keymap.set("n", "k", "gk", { buffer = true })

    vim.keymap.set("n", "<leader>nd", "<cmd>lua DailyJournal()<cr>", { buffer = true })
    vim.keymap.set("n", "<leader>ncp", "<cmd>lua CompilePDF()<cr>", { buffer = true })
    vim.keymap.set("n", "<leader>nch", "<cmd>lua CompileHTML()<cr>", { buffer = true })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" },
    callback = Notes
})
