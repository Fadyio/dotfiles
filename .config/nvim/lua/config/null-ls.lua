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
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
local completion = null_ls.builtins.completion

null_ls.setup({
	sources = {
		-- formatting
		formatting.stylua, --lua
		--formatting.astyle, -- c and java
		formatting.clang_format, -- c and c++
		formatting.codespell, --fix common misspellings in text files
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
		diagnostics.ansiblelint,
		diagnostics.codespell,
		diagnostics.cppcheck,

		-- actions

		actions.gitsigns,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
		end
		vim.cmd([[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
	end,
})
