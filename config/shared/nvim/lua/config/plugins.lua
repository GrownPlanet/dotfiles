vim.pack.add({
    "https://github.com/nvim-mini/mini.pick", -- fuzzy finder
    "https://github.com/navarasu/onedark.nvim", -- color scheme
    "https://github.com/windwp/nvim-autopairs", -- auto pair brakcets
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
    "https://github.com/williamboman/mason.nvim", -- lsp manager
    "https://github.com/neovim/nvim-lspconfig", -- lsp configs
    "https://github.com/MeanderingProgrammer/render-markdown.nvim", -- markdown
    "https://codeberg.org/andyg/leap.nvim", -- navigation
    "https://github.com/nvim-treesitter/nvim-treesitter", -- treesitter
})

local pick = require("mini.pick")
pick.setup({ source = { show = pick.default_show } })

require("nvim-autopairs").setup({ enable_check_bracket_line = false })

require("blink.cmp").setup({
    completion = {
        documentation = { auto_show = true },
        list = { selection = { preselect = false } },
        menu = { draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" } } } }
    }
})

require("mason").setup({})

require("render-markdown").setup({
  render_modes = true,
  heading = { backgrounds = {}, signs = {} },
})

ts_languages = { "bash", "c", "cpp", "lua", "markdown", "toml", "rust", "json" }

require("nvim-treesitter").install(ts_languages)

vim.api.nvim_create_autocmd("FileType", {
    pattern = ts_languages,
    callback = function() vim.treesitter.start() end
})
