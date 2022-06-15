--[[
        http://github.com/fady0
---------------------------------------------------------------------
                                 My Neovim Plugins
---------------------------------------------------------------------
--]]
-- Bootstrapping paq Plugins manager

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	paq_bootstrap = fn.system({ "git", "clone", "--depth", "1", "https://github.com/savq/paq-nvim", install_path })
end

require("paq")({

	-- Let Paq manage itself
	"savq/paq-nvim",
	-- Replace default filetype.vim which is slower
	"nathom/filetype.nvim",
	-- An implementation of the Popup API from vim in Neovim
	"nvim-lua/popup.nvim",
	-- UI Component Library for Neovim.
	"MunifTanjim/nui.nvim",
	-- Required dependency for many plugins. Super useful Lua functions
	"nvim-lua/plenary.nvim",
	-- Fix neovim CursorHold and CursorHoldI autocmd events performance bug
	"antoinemadec/FixCursorHold.nvim",
	-- Speeds up load times
	"lewis6991/impatient.nvim",
	-- highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite
	"tami5/sqlite.lua",

	---------------------------------------------------------------------------- }}}
	---------------------------------APPEARANCE--------------------------------- {{{

	-- customizable start screen for neovim.
	"goolord/alpha-nvim",
	-- display a popup with possible key bindings of the command you started typing
	"folke/which-key.nvim",
	-- adds indentation guides to all lines (including empty lines).
	"lukas-reineke/indent-blankline.nvim",
	-- bufferline
	"akinsho/bufferline.nvim",
	-- A high-performance color highlighter for Neovim
	"norcalli/nvim-colorizer.lua",
	-- This plugin provides the same icons as well as colors for each icon.
	"kyazdani42/nvim-web-devicons",
	-- Highlight words and lines on the cursor for Neovim
	"yamatsum/nvim-cursorline",
	-- Neovim statusline written in Lua.
	"nvim-lualine/lualine.nvim",
	-- simple status line component that shows context of the current cursor position in file.
	"SmiteshP/nvim-gps",
	-- Start your search from a more comfortable place
	"VonHeikemen/searchbox.nvim",
	--A fancy, configurable, notification manager for NeoVim
	"rcarriga/nvim-notify",
	-- nvim-treesitter
	{ "nvim-treesitter/nvim-treesitter", run = TSUpdate },
	"JoosepAlviste/nvim-ts-context-commentstring",
	"RRethy/nvim-treesitter-endwise",
	"windwp/nvim-ts-autotag",
	"p00f/nvim-ts-rainbow",

	---------------------------------------------------------------------------- }}}
	-------------------------------LSP FEATURES------------------------------ {{{

	{ "VonHeikemen/lsp-zero.nvim" },
	-- LSP Support
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/nvim-lsp-installer" },

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-cmdline" },
	-- null-ls.nvim
	"jose-elias-alvarez/null-ls.nvim",

	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
	-- copilot
	"github/copilot.vim",
	"hrsh7th/cmp-copilot",

	---------------------------------------------------------------------------- }}}
	-------------------------------EDITOR FEATURES------------------------------ {{{

	-- Smooth scrolling for ANY movement command
	"declancm/cinnamon.nvim",
	-- Smart and Powerful commenting plugin for neovim
	"numToStr/Comment.nvim",
	-- powerful autopair plugin for Neovim that supports multiple characters
	"windwp/nvim-autopairs",
	--
	"kyazdani42/nvim-tree.lua",
	--TODO Easily jumb between files
	"ThePrimeagen/harpoon",
	-- GIT
	"lewis6991/gitsigns.nvim",
	"TimUntersberger/neogit",
	"sindrets/diffview.nvim",
	-- magit for neovim
	"TimUntersberger/neogit",
	--TODO
	"folke/trouble.nvim",
	--TODO white_check_mark Highlight, list and search todo comments in your projects
	"folke/todo-comments.nvim",
	--TODO 
	"nvim-neorg/neorg";
	--  Neovim motions on speed! 
	"phaazon/hop.nvim";
	
	-- wakatime plugin
	"wakatime/vim-wakatime",
	-------------- telescope.nvim
	"nvim-telescope/telescope.nvim",
	"crispgm/telescope-heading.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", run = make },
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-github.nvim",
	---------------------------------------------------------------------------- }}}
	-------------------------------  colorScheme  ------------------------------ {{{

	"folke/tokyonight.nvim",
	"bluz71/vim-moonfly-colors",
	"projekt0n/github-nvim-theme",
	"mhartington/oceanic-next",
	"bluz71/vim-nightfly-guicolors",
	"titanzero/zephyrium",
	"sainnhe/gruvbox-material",
	"sainnhe/edge",
})
