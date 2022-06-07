local M = {}
-----------------------------------DEFAULT---------------------------------- {{{
function M.default_commands()
  return {
    {
      "LineNumbers",
      function()
        om.ToggleLineNumbers()
      end,
      description = "Toggle line numbers",
    },
    {
      "Sessions",
      function()
        vim.cmd [[Telescope persisted]]
      end,
      description = "Session: List",
    },
    {
      "Snippets",
      function()
        om.EditSnippet()
      end,
      description = "Edit Snippets",
    },
     {
      "Theme",
      function()
        om.ToggleTheme()
      end,
      description = "Toggle theme",
    },
   }
end
---------------------------------------------------------------------------- }}}
-----------------------------------PLUGINS---------------------------------- {{{
function M.plugin_commands()
  return {
    -- Alpha
    {
      "Dashboard",
      function()
        vim.cmd([[Alpha]])
      end,
      description = "Show the Alpha dashboard",
    },
    -- Colorizer
    {
      "Color Toggle",
      function()
        vim.cmd([[ColorizerToggle]])
      end,
      description = "Colorizer toggle",
    },

    -- GPS
    {
      "NvimGPS",
      function()
        if vim.g.enable_gps then
          vim.g.enable_gps = false
        else
          vim.g.enable_gps = true
        end
      end,
      description = "Toggle Nvim GPS",
    },
    -- Lazygit
    {
      "Lazygit",
      function()
        om.Lazygit():toggle()
      end,
      description = "Lazygit",
    },
    -- neogen
    {
      "Neogen",
      function()
        require("neogen").generate()
      end,
      description = "Generate annotation",
    },
    -- Packer
    {
      "PackerCompile",
      function()
        require(config_namespace .. ".plugins")
        require("packer").compile()
      end,
      description = "Packer: Compile",
    },
    {
      "PackerClean",
      function()
        require(config_namespace .. ".plugins")
        require("packer").clean()
      end,
      description = "Packer: Clean",
    },
    {
      "PackerSync",
      function()
        vim.cmd("PackerSync")
      end,
      description = "Packer: Sync",
    },
    {
      "PackerStatus",
      function()
        require(config_namespace .. ".plugins")
        require("packer").status()
      end,
      description = "Packer: Status",
    },
    {
      "PackerSnapshot",
      function()
        local snapshot = os.date("!%Y-%m-%d %H_%M_%S")
        require(config_namespace .. ".plugins")
        require("packer").snapshot(snapshot)
      end,
      description = "Packer: Create Snapshot",
    },
    {
      "PackerSnapshotDelete",
      function()
        om.select("Delete snapshot", om.GetSnapshots(), function(choice)
          if choice == nil then
            return
          end
          require(config_namespace .. ".plugins")
          require("packer.snapshot").delete(om.path_to_snapshots .. choice)
        end)
      end,
      description = "Packer: Delete Snapshot",
    },
    {
      "PackerRollback",
      function()
        vim.cmd("PackerRollback")
      end,
      description = "Packer: Rollback Snapshot",
    },

    -- Startup time
    {
      "Startup Time",
      function()
        vim.cmd([[StartupTime]])
      end,
      description = "Profile Neovim's startup time",
    }
  }
end
---------------------------------------------------------------------------- }}}
-------------------------------------LSP------------------------------------ {{{
function M.lsp_commands(client, bufnr)
  local commands = {
    {
      "LspRestart",
      description = "Restart any attached LSP clients",
      opts = { buffer = bufnr },
    },
    {
      "LspStart",
      description = "Start the LSP client manually",
      opts = { buffer = bufnr },
    },
    {
      "LspInfo",
      description = "Show attached LSP clients",
      opts = { buffer = bufnr },
    },
    {
      "LspLog",
      function()
        vim.cmd("edit " .. vim.lsp.get_log_path())
      end,
      description = "Show LSP logs",
    },
    {
      "LspInstall",
      function()
        for _, name in pairs(om.lsp.servers) do
          vim.cmd("LspInstall " .. name)
        end
      end,
      description = "Install LSP servers",
    },
    {
      "LspUninstall",
      function()
        vim.cmd("LspUninstallAll")
      end,
      description = "Uninstall LSP servers",
    },
  }

  if client.name == "null-ls" or client.name == "solargraph" then
    table.insert(commands, {
      "LspFormat",
      function()
        vim.b.format_changedtick = vim.b.changedtick
        vim.lsp.buf.formatting({})
      end,
      description = "Format the current document with LSP",
      opts = { buffer = bufnr },
    })
  end

  return commands
end
---------------------------------------------------------------------------- }}}
return M
