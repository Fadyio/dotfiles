-- Written by @Fadynagh from http://fadyio.com
-- Email:me@fadyio.com
-- Github: @fady0
--
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
}

local location = {
	"location",
	padding = 0,
}

require("nvim-gps").setup()
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
		disabled_filetypes = { "alpha", "dashboard" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", diff, diagnostics },
		--	lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", filetype },
		lualine_y = { "progress" },
		lualine_z = { location },
	},
	tabline = {},
	extensions = {},
})
-- Lua
local gps = require("nvim-gps")

require("lualine").setup({
	sections = {
		lualine_c = {
			{ "filename" },
			{ gps.get_location, cond = gps.is_available },
		},
	},
})
