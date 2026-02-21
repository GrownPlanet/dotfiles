vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function ()
        Notes()
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        local ok, err = pcall(vim.treesitter.start)
    end,
})
