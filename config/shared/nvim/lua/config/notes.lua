function DailyJournal()
    local date = os.date("%Y%m%d")
    vim.cmd("edit journal/" .. date .. ".md")
end

-- for taking notes
function Notes()
    -- options
    vim.o.wrap = true
    vim.o.linebreak = true
    vim.o.spell = true
    vim.o.spellcapcheck = ""
    vim.o.colorcolumn = ""
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2

    -- moving up and down wrapped lines
    vim.keymap.set("n", "j", "gj")
    vim.keymap.set("n", "k", "gk")

    vim.keymap.set("n", "<leader>nd", "<cmd>lua DailyJournal()<cr>")
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" },
    callback = function()
        Notes()
    end
})
