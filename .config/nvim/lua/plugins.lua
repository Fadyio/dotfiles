--[[
        http://github.com/fady0
---------------------------------------------------------------------
                                 My Neovim Plugins
---------------------------------------------------------------------
--]]
-- Bootstrapping Packer Plugins manager
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	git = {
		cmd = "git", -- The base command for git operations
		depth = 1, -- Git clone depth
		clone_timeout = 1000, -- Timeout, in seconds, for git clones
		default_url_format = "https://github.com/%s", -- Lua format string used for "aaa/bbb" style plugins
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
require("impatient")
return require("packer").startup(function(use)
	-- Let packer manage itself
	use("wbthomason/packer.nvim")
	-- Replace default filetype.vim which is slower
	use("nathom/filetype.nvim")
	-- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/popup.nvim")
	-- UI Component Library for Neovim.
	use("MunifTanjim/nui.nvim")
	-- Required dependency for many plugins. Super useful Lua functions
	use("nvim-lua/plenary.nvim")
	-- Fix neovim CursorHold and CursorHoldI autocmd events performance bug
	use("antoinemadec/FixCursorHold.nvim")
	-- Speeds up load times
	use("lewis6991/impatient.nvim")
	-- highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite
	use("tami5/sqlite.lua")
	---------------------------------------------------------------------------- }}}
	---------------------------------APPEARANCE--------------------------------- {{{
	-- customizable start screen for neovim.
	use("goolord/alpha-nvim")
	-- display a popup with possible key bindings of the command you started typing
	use("folke/which-key.nvim")
	-- adds indentation guides to all lines (including empty lines).
	use("lukas-reineke/indent-blankline.nvim")
	-- bufferline
	use("akinsho/bufferline.nvim")
	-- A high-performance color highlighter for Neovim
	use("norcalli/nvim-colorizer.lua")
	-- This plugin provides the same icons as well as colors for each icon.
	use("kyazdani42/nvim-web-devicons")
	-- Highlight words and lines on the cursor for Neovim
	use("yamatsum/nvim-cursorline")
	-- Neovim statusline written in Lua.
	use("nvim-lualine/lualine.nvim")
	-- simple status line component that shows context of the current cursor position in file.
	use("SmiteshP/nvim-gps")
	-- Start your search from a more comfortable place
	use("VonHeikemen/searchbox.nvim")
	--A fancy, configurable, notification manager for NeoVim
	use("rcarriga/nvim-notify")
	--  vscode-like pictograms for neovim lsp completion items
	use("onsails/lspkind.nvim")
	-- markdown previewer
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	-- nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("RRethy/nvim-treesitter-endwise")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	-- 	---------------------------------------------------------------------------- }}}
	-- 	-------------------------------LSP FEATURES------------------------------ {{{
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
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
			{ "Dosx001/cmp-commit" },
			{ "tamago324/cmp-zsh" },
			{ "Shougo/deol.nvim" },
			{ "dmitmel/cmp-cmdline-history" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			-- null-ls.nvim
			{ "jose-elias-alvarez/null-ls.nvim" },
			--copilot
--			{ "github/copilot.vim" },
--			{ "hrsh7th/cmp-copilot" },
		},
	})
	-- code runner
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	-- 	---------------------------------------------------------------------------- }}}
	-- 	-------------------------------EDITOR FEATURES------------------------------ {{{
	-- Smooth scrolling for ANY movement command
	use("declancm/cinnamon.nvim")
	-- Smart and Powerful commenting plugin for neovim
	use("numToStr/Comment.nvim")
	-- powerful autopair plugin for Neovim that supports multiple characters
	use("windwp/nvim-autopairs")
	--
	use("kyazdani42/nvim-tree.lua")
	-- Easily jumb between files
	use("ThePrimeagen/harpoon")
	-- GIT
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")
	use("kdheepak/lazygit.nvim")
	-- magit for neovim
	use("TimUntersberger/neogit")
	-- A pretty diagnostics, references, telescope results, quickfix and location list
	use("folke/trouble.nvim")
	-- white_check_mark Highlight, list and search todo comments in your projects
	use("folke/todo-comments.nvim")
	--TODO: hellp this problesm
	use("nvim-neorg/neorg")
	--  Neovim motions on speed!
	use("phaazon/hop.nvim")
	-- wakatime plugin
	use("wakatime/vim-wakatime")
	-------------- telescope.nvim
	use("nvim-telescope/telescope.nvim")
	use("crispgm/telescope-heading.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-github.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "nvim-telescope/telescope-frecency.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	---------------------------------------------------------------------------- }}}
	-------------------------------  colorScheme  ------------------------------ {{{

	use("folke/tokyonight.nvim")
	use("bluz71/vim-moonfly-colors")
	use("projekt0n/github-nvim-theme")
	use("mhartington/oceanic-next")
	use("bluz71/vim-nightfly-guicolors")
	use("titanzero/zephyrium")
	use("sainnhe/gruvbox-material")
	use("sainnhe/edge")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
