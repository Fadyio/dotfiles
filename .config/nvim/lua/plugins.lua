--[[
        http://github.com/fady0
---------------------------------------------------------------------
                                 My Neovim Plugins
---------------------------------------------------------------------
--]]
-- load paq Plugins manager
require "paq" {

-- Let Paq manage itself
"savq/paq-nvim";
-- Replace default filetype.vim which is slower
"nathom/filetype.nvim";
-- An implementation of the Popup API from vim in Neovim
"nvim-lua/popup.nvim";
-- Required dependency for many plugins. Super useful Lua functions   
"nvim-lua/plenary.nvim";
-- Fix neovim CursorHold and CursorHoldI autocmd events performance bug
"antoinemadec/FixCursorHold.nvim";
-- Speeds up load times
"lewis6991/impatient.nvim";
-- highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite 
"tami5/sqlite.lua";

---------------------------------------------------------------------------- }}}
---------------------------------APPEARANCE--------------------------------- {{{

-- customizable start screen for neovim.
"goolord/alpha-nvim";
-- display a popup with possible key bindings of the command you started typing
"folke/which-key.nvim";
-- adds indentation guides to all lines (including empty lines).
"lukas-reineke/indent-blankline.nvim";
-- A high-performance color highlighter for Neovim 
"norcalli/nvim-colorizer.lua";



---------------------------------------------------------------------------- }}}
-------------------------------EDITOR FEATURES------------------------------ {{{

-- Smooth scrolling for ANY movement command
"declancm/cinnamon.nvim";
-- Smart and Powerful commenting plugin for neovim
"numToStr/Comment.nvim";
-- powerful autopair plugin for Neovim that supports multiple characters
"windwp/nvim-autopairs";


-------------- telescope.nvim
"nvim-telescope/telescope.nvim";
"crispgm/telescope-heading.nvim";
"nvim-telescope/telescope-media-files.nvim";
"nvim-telescope/telescope-github.nvim";


}
