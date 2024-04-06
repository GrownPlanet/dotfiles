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
        keys = {
          ["'"] = { close = false }
        },
        options = {
          pair_spaces = true,
        }
      })
    end,
  },
  -- color scheme
  require('plugins.colorscheme'),
  -- top bar
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function ()
      vim.g.barbar_auto_setup = true
    end,
    opts = {
      animation = false,
      clickable = false,
    },
  },
  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function ()
      require('lualine').setup()
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    init = function ()
      require('gitsigns').setup()
    end
  },
  -- file tree 
  {
    'nvim-tree/nvim-tree.lua',
    init = function ()
      require('nvim-tree').setup()
    end
  },
  -- startup screen
  {
    "Yoolayn/nvim-intro",
    opts = {
      intro = {
        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        "                                                       ",
        "                                                       ",
        "   󰈔 press <space>f    ->    to find files             ",
        "                                                       ",
        "   󰈭 press <space>g    ->    to find word              ",
        "                                                       ",
        "   󰙅 press <space>t    ->    to open a file tree       ",
        "                                                       ",
        "    press <space>n    ->    to create new file        ",
        "                                                       ",
        "    press <space>e    ->    to open a file explorer   ",
        "                                                       ",
        "                                                       ",
        "                    happy coding :)                    ",
      },
      color = "#f7f3f2",
      scratch = true,
      highlights = {
        ["<Enter>"] = "#187df0",
      }
    },

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
  -- treesitter
  require('plugins.treesitter'),
  -- lsp 
  {
    'williamboman/mason.nvim',
    init = function ()
      require("mason").setup()
    end,
  },
  {'williamboman/mason-lspconfig.nvim'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  -- tmux
  {
    'christoomey/vim-tmux-navigator'
  },
})
