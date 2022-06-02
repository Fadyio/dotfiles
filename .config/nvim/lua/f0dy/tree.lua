
-- following options are the default
require("nvim-tree").setup({
    update_focused_file = {
    enable = true,
  },
  filters = {
    custom = { ".git", "node_modules", ".cargo" },
  },
})



vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})