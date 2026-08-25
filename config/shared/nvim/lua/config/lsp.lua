-- LSP keymaps on attach
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format { async = true } end, opts)
end

-- Server configurations table
local servers = {
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                diagnostics = { disabled = { "inactive-code" } },
            },
        },
    },
    pyright = {},
    ocamllsp = {},
    marksman = {},
    texlab = {},
    zls = {},
}

-- Apply configurations and enable servers
for name, config in pairs(servers) do
    config.on_attach = on_attach
    config.capabilities = capabilities
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
end

-- Diagnostic config
vim.diagnostic.config({ virtual_text = {} })
