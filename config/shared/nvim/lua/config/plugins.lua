return {
    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            require("telescope").setup({
                defaults = {
                    borderchars = {
                        prompt  = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                        results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    },
                },
            })
        end,
    },
    -- color schemes
    { "navarasu/onedark.nvim" },
    -- status bar
    {
        "nvim-lualine/lualine.nvim",
        init = function()
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    component_separators = "",
                    section_separators = "",
                },
            })
        end,
    },
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
    -- completions from current buffer
    { "hrsh7th/cmp-buffer" },
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        init = function()
            require("nvim-treesitter.query_predicates")
        end,
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash", "c", "cpp", "lua", "markdown", "toml", "rust", "json"
            }
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
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
                completions = { lsp = { enabled = true } },
                heading = { backgrounds = {}, signs = {} },
            })
        end
    },
    -- leap
    { "https://codeberg.org/andyg/leap.nvim" },
};
