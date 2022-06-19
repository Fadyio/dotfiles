-- Written by @Fadynagh from http://fadyio.com
-- Email:me@fadyio.com
-- Github: @fady0
--
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				-- Configuration here
			},
		},
		["external.context"] = {},
		["core.norg.dirman"] = {

			config = {
				workspaces = {
					work = "~/Dropbox/notes/work",
					fady = "~/Dropbox/notes/fady",
				},
			},
		},
	},
})
