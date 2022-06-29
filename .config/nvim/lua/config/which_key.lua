-- Written by @Fadynagh from http://fadyio.com
-- Email:me@fadyio.com
-- Github: @fady0
--
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["x"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
	["R"] = { "<cmd>SearchBoxReplace<CR>", "replace word" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["z"] = {
		"<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>",
		"Find hidden files",
	},
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["P"] = { "<cmd>Telescope file_browser<cr>", "file browser" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>LazyGit<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
	},
	r = {
		name = "code runner",
		d = { "<Cmd>SnipRun<CR>", "Line Run" },
		s = { "<cmd>SnipReset<CR>", "Snip Reset" },
		i = { "<cmd>SnipInfo<CR>", "Snip Info" },
	},
	m = {
		name = "Motions",
		w = {
			"<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
			"hop word",
		},
		p = { "<cmd>HopPattern<CR>", "Hop Pattern" },
		l = { "<cmd>HopLine<CR>", "Hop Line" },
	},
	h = {
		name = "Harpooning",
		a = { "<cmd>lua require 'harpoon.mark'.add_file()<CR>", "Add file" },
		t = { "<cmd>lua require 'harpoon.ui'.toggle_quick_menu()<CR>", "toggle quick menu" },
		n = { "<cmd>lua require 'harpoon.ui'.nav_next()<CR>", "Next file" },
		p = { "<cmd>lua require 'harpoon.ui'.nav_prev()<CR>", "previous file" },
	},

	t = {
		name = "Trouble",
		x = { "<cmd>Trouble<CR>", "Trouble Toggle " },
		w = { "<cmd>Trouble workspace_diagnostics<CR>", "workspace diagnostics" },
		d = { "<cmd>Trouble document_diagnostics<CR>", "document diagnostics" },
		l = { "<cmd>Trouble loclist<CR>", "Trouble loclist " },
		q = { "<cmd>Trouble quickfix<CR>", "Trouble quickfix " },
		r = { "<cmd>Trouble lsp_references<CR>", "lsp references" },
	},
	T = {
		name = "TODO",
		q = { "<cmd>TodoQuickFix<CR>", "Todo Quick Fix" }, --This uses the quickfix list to show all todos in your project.
		l = { "<cmd>TodoLocList<CR>", "Todo LocList" }, --This uses the location list to show all todos in your project.
		t = { "<cmd>TodoTelescope<CR>", "Todo Telescope" }, --Search through all project todos with Telescope
	},

	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
