return {
    -- fuzzy finder
    { "nvim-mini/mini.pick", opts = {} },

    -- color schemes
    { "navarasu/onedark.nvim" },

    -- auto pair brackets
    { "nvim-mini/mini.pairs", opts = {} },

    -- completion
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = { 
            completion = {
                documentation = { auto_show = true },
                list = { selection = { preselect = false } },
            }
        },
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c", "cpp", "json", "lua", "markdown", "rust", "toml", "bash"
            }
        }
    },

    -- lsp 
    { "williamboman/mason.nvim", opts = {} },
    { "neovim/nvim-lspconfig" },

    -- markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        opts = {
            render_modes = true,
            heading = { backgrounds = {}, signs = {} },
        }
    },
};
