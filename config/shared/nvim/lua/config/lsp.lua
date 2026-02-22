-- LSP keymaps on attach
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format { async = true } end, opts)
end

-- Setup language servers
local servers = { "rust_analyzer", "pyright", "ocamllsp", "marksman" }
for i, server in ipairs(servers) do
    vim.lsp.config(server, { on_attach = on_attach, capabilities = capabilities })
    vim.lsp.enable(server)
end

-- Diagnostic config
vim.diagnostic.config({ virtual_text = {} })
