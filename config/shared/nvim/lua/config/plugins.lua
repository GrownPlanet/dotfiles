return {
    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- auto close brackets
    {
        'm4xshen/autoclose.nvim',
        init = function ()
            require("autoclose").setup()
        end,
    },
    -- color schemes
    { 'catppuccin/nvim' },
    -- status bar
    {
        'nvim-lualine/lualine.nvim',
        init = function ()
            require('lualine').setup({
                options = {
                    icons_enabled = false,
                    component_separators = '',
                    section_separators = '',
                },
            })
        end,
    },
    -- icons
    { 'nvim-tree/nvim-web-devicons' },
    -- gitsigns
    {
        'lewis6991/gitsigns.nvim',
        init = function ()
            require('gitsigns').setup()
        end
    },
    -- comments 
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({ toggler = { line = '<C-c>' } })
        end,
    },
    -- transparent bg
    { 'xiyaowong/transparent.nvim' },
    -- markdown/ notes
    {
        "lervag/wiki.vim",
        ft = "markdown",
        init = function()
            vim.g.wiki_root = "~/Sync/notes"
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = "markdown",
        config = function()
            require('render-markdown').setup({
                render_modes = { 'n', 'c', 't', 'i' },
                heading = { sign = false },
                code = { sign = false },
            })
        end,
    },
    -- snippets
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    -- completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'saadparwaiz1/cmp_luasnip' }
    },
    -- completions from current buffer
    { 'hrsh7th/cmp-buffer' },
    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
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
    -- context
    { 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
    -- lsp 
    {
        'williamboman/mason.nvim',
        init = function ()
            require("mason").setup()
        end,
    },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    -- tmux
    { 'christoomey/vim-tmux-navigator' },
};
