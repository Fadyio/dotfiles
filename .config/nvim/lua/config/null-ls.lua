local null_ls = require('null-ls')



null_ls.setup({
  sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.code_actions.gitsigns,
  
  
  },
 
 
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    end
    vim.cmd [[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
})
