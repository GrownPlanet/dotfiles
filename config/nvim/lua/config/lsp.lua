local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- add code actions
vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end)

require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "pyright",
    },
}

-- here you can setup the language servers
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')

-- autocomplete
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- show error message behind the line
vim.diagnostic.config({ virtual_text = {}, })

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },

    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

