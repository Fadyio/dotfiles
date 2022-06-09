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
-- Required dependency for many plugins. Super useful Lua functions   
"nvim-lua/plenary.nvim";
-- Fix neovim CursorHold and CursorHoldI autocmd events performance bug
"antoinemadec/FixCursorHold.nvim";
-- Speeds up load times
"lewis6991/impatient.nvim";


---------------------------------------------------------------------------- }}}
---------------------------------APPEARANCE--------------------------------- {{{

-- customizable start screen for neovim.
"goolord/alpha-nvim";






---------------------------------------------------------------------------- }}}
-------------------------------EDITOR FEATURES------------------------------ {{{

-- Smooth scrolling for ANY movement command
"declancm/cinnamon.nvim";









}