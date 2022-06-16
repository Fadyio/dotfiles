local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- SearchBox
keymap('n','<leader>s',':SearchBoxIncSearch<CR>',{noremap = true})
keymap('n','<leader>r',':SearchBoxReplace<CR>',{noremap = true})
keymap('n','<leader>se',':SearchBoxIncSearch exact=true<CR>',{noremap = true})

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- keymaps cinnamon
--Smooth scrolling for ...
--Half-window movements:      <C-U> and <C-D>
--Page movements:             <C-B>, <C-F>, <PageUp> and <PageDown>
-- Smooth scrolling for ...
--
-- Start/end of file:          gg and G
-- Line number:                [count]G
-- Start/end of line:          0, ^ and $
-- Paragraph movements:        { and }
-- Prev/next search result:    n, N, *, #, g* and g#
-- Prev/next cursor location:  <C-O> and <C-I>
-- Screen scrolling:           zz, zt, zb, z., z<CR>, z-, z^, z+, <C-Y> and <C-E>
-- Horizontal scrolling:       zH, zL, zs, ze, zh and zl
