--[[
        http://github.com/fady0
---------------------------------------------------------------------
                                 settings
---------------------------------------------------------------------
--]]
local cmd = vim.cmd
-------------------------------GLOBAL OPTIONS------------------------------- {{{
--Remap space as leader key
vim.g.modelines=false					-- Disable modelines as a security precaution			
vim.opt.fileencoding='utf-8'				-- Set encoding and fileencoding to utf-8
vim.opt.encoding='UTF-8'				-- Set encoding UTF-8
vim.opt.autowrite = true 				-- enable auto write
vim.opt.clipboard = "unnamedplus" 			-- sync with system clipboard
vim.opt.confirm = true 					-- confirm to save changes before exiting modified buffer
vim.opt.mouse = "a" 					-- enable mouse mode
vim.opt.undolevels = 10000				-- Maximum number of changes that can be undone
vim.opt.undofile = true					-- automatically saves undo history
vim.opt.timeoutlen = 1000                               -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.g.did_load_filetypes = 0 -- Do not use built in filetype.vim as we use filetype.nvim instead
vim.g.neoterm_autoinsert = 0 -- Do not start terminal in insert mode
vim.opt.foldenable = true -- Enable folding
--------------------------------------------------------------------------- }}}
-- UI config 
vim.opt.guifont = "monospace:h17"               	-- the font used in graphical neovim applications
vim.opt.number= true					-- show line numbers
vim.opt.relativenumber = true 				-- Relative line numbers
vim.opt.pumblend = 10 					-- Popup blend
vim.opt.pumheight = 10 					-- Maximum number of entries in a popup
vim.opt.showmode = false 				-- dont show mode since we have a statusline
vim.opt.termguicolors = true 				-- True color support
vim.opt.signcolumn = "yes" 				-- Always show the signcolumn, otherwise it would shift the text each time
--vim.opt.wrap = false 					-- Disable line wrap
vim.opt.wildmode = "longest:full,full" 			-- Command-line completion mode
vim.opt.scrolloff = 8                           	-- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}
-- Search Settings
vim.opt.ignorecase = true 				-- Ignore case
vim.opt.inccommand = "split" 				-- preview incremental substitute
vim.opt.smartcase = true 				-- Don't ignore case with capitals
vim.opt.hlsearch = true                         	-- highlight all matches on previous search pattern

-- Window Settings
vim.opt.splitbelow = true                       	-- force all horizontal splits to go below current window
vim.opt.splitright = true                       	-- force all vertical splits to go to the right of current window

-- Tabs and Indentation
vim.opt.smartindent = true 				-- Insert indents automatically
vim.opt.expandtab = true 				-- Use spaces instead of tabs
vim.opt.shiftwidth = 2 		              		-- Size of an indent
vim.opt.tabstop = 2					-- Number of spaces tabs count for
vim.opt.numberwidth = 2                         	-- set number column width to 2 {default 4}
---------------------------------------------------------------------------- }}}
--------------------------DISABLE BUILT IN PLUGINS-------------------------- {{{
local disabled_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}
for _, plugin in pairs(disabled_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
---------------------------------------------------------------------------- }}}


--- colorscheme
local colorscheme = "edge*"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
