local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

vim.cmd([[
  augroup lazy_user_sync
    autocmd!
    " autocmd BufWritePost plugins.lua source <afile> | Lazy sync
    " autocmd BufWritePost plugins.lua source <afile> | Lazy sync
  augroup end
]])

require("lazy").setup({


  -- General plugins
  "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  "numToStr/Comment.nvim", -- Easily comment stuff
  {
    "nvim-tree/nvim-web-devicons",
    tag = "nerd-v2-compat",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended ]]
      "MunifTanjim/nui.nvim",
    },
  },
  "s1n7ax/nvim-window-picker",
  tag = "v1.*",
  config = function()
    require("window-picker").setup()
  end,
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  {
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = function()
      require("toggleterm").setup()
    end,
  },
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
  "folke/which-key.nvim",
  "mhinz/vim-startify",             -- startify
  {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  },

  -- {
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   opts = {
  --     -- configurations go here
  --   },
  -- },


  {
    "rrethy/vim-hexokinase",
    build = "cd ~/.local/share/nvim/lazy/vim-hexokinase && make hexokinase",
  },
  -- 'norcalli/nvim-colorizer.lua', --uninstalling because it had no other options than background and foreground

  -- Colorschemes
  "folke/tokyonight.nvim",
  { 'rose-pine/neovim',           name = 'rose-pine' },
  "ray-x/aurora",
  'Mofiqul/dracula.nvim',
  "tanvirtin/monokai.nvim",
  "tanvirtin/monokai.nvim",
  "loctvl842/monokai-pro.nvim",
  "ellisonleao/gruvbox.nvim",
  "shaunsingh/moonlight.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp",        -- The completion plugin
  "hrsh7th/cmp-buffer",      -- buffer completions
  "hrsh7th/cmp-path",        -- path completions
  "hrsh7th/cmp-cmdline",     -- cmdline completions
  "hrsh7th/cmp-calc",
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "quangnguyen30192/cmp-nvim-ultisnips",
  { "mattn/emmet-vim" },           -- emmet (just install it this way and it's fine)
  { "mlaursen/vim-react-snippets" }, -- react snippets

  -- Snippets
  "L3MON4D3/LuaSnip",            --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to
  "SirVer/ultisnips",


  -- LSP
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
        },
        -- opts = { lsp = { auto_attach = true } }
      }
    },
  },
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  "ray-x/lsp_signature.nvim",
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  -- config = function()
  --     require("lspsaga").setup({})
  -- end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" }
  },


  -- Telescope and fzf
  "nvim-telescope/telescope.nvim", -- ripgrep and fd is important for livegrep so install it seperately by pacman
  { "nvim-telescope/telescope-file-browser.nvim" },
  --  "sharkdp/fd"
  "barrett-ruth/telescope-http.nvim",
  "nvim-telescope/telescope-media-files.nvim",
  "sudormrfbin/cheatsheet.nvim",
  "LinArcX/telescope-env.nvim",
  "debugloop/telescope-undo.nvim",
  "fhill2/telescope-ultisnips.nvim",
  "tsakirist/telescope-lazy.nvim",
  {
    "benfowler/telescope-luasnip.nvim",
    module = "telescope._extensions.luasnip", -- if you wish to lazy-load
  },


  -- Fzf
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "ibhagwan/fzf-lua",



  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    -- lazy=false,
    -- build = ":TSUpdate",
  },
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag",
  "RRethy/vim-illuminate",

  -- Dap
  {
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    'theHamsta/nvim-dap-virtual-text'
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      -- require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    -- config = function()
    --   local dap = require("dap")
    --   local dapui = require("dapui")
    --   dapui.setup()
    --   dap.listeners.after.event_initialized["dapui_config"] = function()
    --     dapui.open()
    --   end
    --   dap.listeners.before.event_terminated["dapui_config"] = function()
    --     dapui.close()
    --   end
    --   dap.listeners.before.event_exited["dapui_config"] = function()
    --     dapui.close()
    --   end
    -- end
  },
  {
    'simrat39/rust-tools.nvim'
  },
  "LiadOz/nvim-dap-repl-highlights",
  "rcarriga/cmp-dap",



  -- Git
  "lewis6991/gitsigns.nvim",
  --  "kdheepak/lazygit.nvim"-- was not working



  --Some extra stuff
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to  defaults
      })
    end,
  },
  "ThePrimeagen/vim-be-good",
  {
    "folke/noice.nvim",
    -- 'gelguy/wilder.nvim',
    -- dependencies= "rcarriga/nvim-notify"
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },

{
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

  }
},
})
