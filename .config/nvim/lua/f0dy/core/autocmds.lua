local M = {}
------------------------------DEFAULT COMMANDS------------------------------ {{{
function M.default_autocmds()
  local autocmds = {
    {
      name = "FiletypeIndentation",
      {
        "FileType",
        ":setlocal shiftwidth=2 tabstop=2",
        opts = {
          pattern = { "css", "java", "html", "lua", "javascript", "json", "c", "markdown" },
        },
      },
    },
    {
      name = "MarkdownLineWrapping",
      {
        "FileType",
        ":setlocal wrap",
        opts = {
          pattern = { "markdown" },
        },
      },
    },
    
    -- {
    --   name = "Packer reload and compile notification",
    --   {
    --     { "BufWritePost" },
    --     function()
    --       vim.g.packer_reloaded = true
    --       om.reload("Oli.plugins", true)
    --       require("packer").compile()
    --     end,
    --     opts = {
    --       pattern = { "*/Oli/plugins/*.lua" },
    --     },
    --   },
    --   {
    --     { "User" },
    --     function()
    --       vim.notify("Packer compile complete", nil, { title = "Packer" })
    --     end,
    --     opts = {
    --       pattern = { "PackerCompileDone" },
    --     },
    --   },
    -- },
  }

  -- Reload bufferline when the theme has been changed
  if om.safe_require("cokeline", { silent = true }) then
    table.insert(autocmds, {
      name = "RefreshBufferlineColors",
      {
        "ColorScheme",
        function()
          return require(config_namespace .. ".plugins.bufferline").setup()
        end,
        opts = { pattern = "*" },
      },
    })
  end

  -- Reload statusline when the theme has been changed
  if om.safe_require("feline", { silent = true }) then
    table.insert(autocmds, {
      name = "RefreshStatuslineColors",
      {
        "ColorScheme",
        function()
          require(config_namespace .. ".plugins.statusline").setup()
        end,
        opts = { pattern = "*" },
      },
    })
  end

  -- Highlight text when yanked
  table.insert(autocmds, {
    name = "YankHighlight",
    {
      "TextYankPost",
      vim.highlight.on_yank,
      opts = { pattern = "*" },
    },
  })
  return autocmds
end

---------------------------------------------------------------------------- }}}
-------------------------------------LSP------------------------------------ {{{



---------------------------------------------------------------------------- }}}
return M
