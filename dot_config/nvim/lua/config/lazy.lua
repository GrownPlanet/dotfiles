local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup({
    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- auto close brackets
    {
        'm4xshen/autoclose.nvim',
        init = function ()
            require("autoclose").setup({
                keys = { ["'"] = { close = false } },
                options = { pair_spaces = true, }
            })
        end,
    },
    -- color schemes
    { 'navarasu/onedark.nvim' },
    { 'folke/tokyonight.nvim' },
    { 'catppuccin/nvim' },
    { 'dasupradyumna/midnight.nvim' },
    -- status bar
    {
        'nvim-lualine/lualine.nvim',
        init = function ()
            require('lualine').setup({
                options = {
                    theme = 'onedark',
                    icons_enabled = false,
                    component_separators = '',
                    section_separators = '',
                },
            })
        end,
    },
    -- icons
    {
        'nvim-tree/nvim-web-devicons',
    },
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
            require('Comment').setup({
                toggler = {
                    line = '<C-c>',
                    block = '<C-x>',
                },
            })
        end,
    },
    -- snippets
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
            require("luasnip.loaders.from_vscode").lazy_load()

            local ls = require("luasnip")

            vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})
        end,
    },
    -- treesitter
    require('plugins.treesitter'),
    -- lsp 
    {
        'williamboman/mason.nvim',
        init = function ()
            require("mason").setup()
        end,
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    -- tmux
    { 'christoomey/vim-tmux-navigator' },
    { 'xiyaowong/transparent.nvim' },
    { 'ThePrimeagen/vim-be-good' },
})
