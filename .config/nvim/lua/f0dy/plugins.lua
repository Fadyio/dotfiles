local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "lewis6991/impatient.nvim"  -- Improve startup time for Neovim 
  use "karb94/neoscroll.nvim" -- a smooth scrolling

  use "lukas-reineke/indent-blankline.nvim" -- Indent guides for Neovim 
  use "folke/which-key.nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff



  --------- Autocompletion, LSP, Snippets ---------------------------
  use {
     'VonHeikemen/lsp-zero.nvim',
      requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/nvim-lsp-installer'},
 
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
  }
}
 -- Telescope, fzf. file tree
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use 'kyazdani42/nvim-web-devicons'
  use "kyazdani42/nvim-tree.lua" -- A file explorer tree for neovim written in lua 
  use  "AckslD/nvim-neoclip.lua"
  -- LSP
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters


----------------  colorscheme  ----------------------------
  use "EdenEast/nightfox.nvim"
  use "folke/tokyonight.nvim"
  use "navarasu/onedark.nvim"
  use "projekt0n/github-nvim-theme"
  use "mhartington/oceanic-next"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
      -- Colorizer (for highlighting color codes).
  use "norcalli/nvim-colorizer.lua"
  use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }
  use "goolord/alpha-nvim"  
  use {'akinsho/bufferline.nvim', tag = "v2.*"}
use 'JoosepAlviste/nvim-ts-context-commentstring'


  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
