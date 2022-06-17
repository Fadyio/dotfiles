local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	view = {
		entries = { name = "custom", selection_order = "near_cursor" }, -- can be "custom", "wildmenu" or "native"
	},

	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")"

			return kind
		end,
	},

	sources = {
		{ name = "treesitter" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "copilot" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	experimental = {
		ghost_text = true,
	},
	{
		PmenuSel = { bg = "#C34", fg = "NONE" },
		Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

		CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
		CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
		CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },

		CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
		CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
		CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

		CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
		CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
		CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

		CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
		CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
		CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

		CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

		CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
		CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

		CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
		CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
		CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

		CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
		CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
		CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

		CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
		CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
		CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
	},
	  enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture("comment") 
          and not context.in_syntax_group("Comment")
      end
    end
})
