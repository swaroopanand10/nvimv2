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
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Easily comment stuff
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- [[ "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended ]]
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
	"mhinz/vim-startify", -- startify
	{
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	},

	{
		"rrethy/vim-hexokinase",
		build = "cd ~/.local/share/nvim/lazy/vim-hexokinase && make hexokinase",
	},



	-- Colorschemes
	"folke/tokyonight.nvim",


	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/cmp-calc",
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"quangnguyen30192/cmp-nvim-ultisnips",
	{ "mattn/emmet-vim"}, -- emmet (just install it this way and it's fine)
	{ "mlaursen/vim-react-snippets"}, -- react snippets


	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to
	"SirVer/ultisnips",


	-- LSP
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

  {"neovim/nvim-lspconfig", -- enable LSP
    lazy=false,
  },

	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	--[[ ("jayp0521/mason-null-ls.nvim") ]]
	-- will install it later when needed
	"ray-x/lsp_signature.nvim",


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
	-- DAP
	-- "mfussenegger/nvim-dap",
	--  "theHamsta/nvim-dap-virtual-text"
	-- "rcarriga/nvim-dap-ui",
	--  "Pocco81/DAPInstall.nvim"
	--[[  "Pocco81/dap-buddy.nvim" ]]
	--[[  { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" } ]]
	-- "nvim-telescope/telescope-dap.nvim",

	-- ({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	-- ({
	-- "microsoft/vscode-js-debug",
	-- 	opt = true,
	-- 	run = "npm install --legacy-peer-deps && npm run compile",
	-- })
	-- "jayp0521/mason-nvim-dap.nvim",


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
})
