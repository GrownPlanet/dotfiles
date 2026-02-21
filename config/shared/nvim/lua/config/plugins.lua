return {
    -- fuzzy finder
    {
        "nvim-mini/mini.pick",
        config = function ()
            require("mini.pick").setup()
        end
    },

    -- color schemes
    { "navarasu/onedark.nvim" },

    -- auto pair brackets
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function ()
            require("nvim-autopairs").setup({
                enable_check_bracket_line = false,
            })
        end
    },

    -- completion
    { "hrsh7th/nvim-cmp", },
    { "hrsh7th/cmp-buffer" },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c", "cpp", "json", "lua", "markdown", "rust", "toml", "bash"
            }
        }
    },

    -- lsp 
    {
        "williamboman/mason.nvim",
        init = function ()
            require("mason").setup()
        end,
    },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },

    -- markdown
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        config = function()
            require("render-markdown").setup({
                render_modes = true,
                heading = { backgrounds = {}, signs = {} },
            })
        end
    },

    -- leap
    { "https://codeberg.org/andyg/leap.nvim" },
};
