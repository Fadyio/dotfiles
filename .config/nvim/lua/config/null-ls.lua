-- Written by @Fadynagh from http://fadyio.com
-- Email:me@fadyio.com
-- Github: @fady0
--

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		-- formatting
		formatting.stylua, --lua
		--formatting.astyle, -- c and java
		formatting.clang_format, -- c and c++
		formatting.prettier_d_slim, -- prettier for javascript and css etc..
		formatting.rustfmt, -- for rust
		formatting.scalafmt, -- for scala
		formatting.shfmt, -- for shell
		formatting.markdownlint, --for markdown
		formatting.cmake_format, --for cmake files
		formatting.sqlfluff, -- for sql and postgres
		formatting.yapf, --for python
		formatting.isort, -- for python
		-- for macos    formatting.swiftformat, -- for swift

		-- diagnostics
		diagnostics.ansiblelint, -- for ansible
		diagnostics.codespell, -- for text files
		diagnostics.cppcheck, -- for c and c++
		diagnostics.curlylint, -- for html and nunjucks
		diagnostics.eslint_d, -- for javascript
		diagnostics.flake8, -- for python
		diagnostics.gitlint, -- for git
		diagnostics.luacheck, -- for lua
		diagnostics.markdownlint, -- for markdown
		diagnostics.proselint, -- for english prose
		diagnostics.shellcheck, -- for shell
		diagnostics.semgrep, -- Static analysis at ludicrous speedo
		diagnostics.stylelint, -- for css
		diagnostics.zsh, -- for zsh
		diagnostics.write_good, -- for english prose
		diagnostics.yamllint, -- for yaml

		-- actions
		actions.gitsigns,
	},
})
