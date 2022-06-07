-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/f0dy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/f0dy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/f0dy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/f0dy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/f0dy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/home/f0dy/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\nX\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\fcomment\20.plugins.others\21config_namespace\frequire\0" },
    keys = { { "", "gcc" }, { "", "gc" }, { "", "gbc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\0156\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\0016\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\4\0B\0\1\1K\0\1\0\rsnippets\nsetup\21.plugins.luasnip\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nY\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\23.plugins.dashboard\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cokeline.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\24.plugins.bufferline\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/cokeline.nvim",
    url = "https://github.com/noib3/cokeline.nvim"
  },
  ["copilot.vim"] = {
    commands = { "Copilot" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nY\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\rdressing\20.plugins.others\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\24.plugins.statusline\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vfidget\20.plugins.others\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\22.plugins.gitsigns\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n‰\1\0\0\4\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0006\2\4\0'\3\5\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\20.plugins.others\21config_namespace\fharpoon\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\14headlines\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vhlargs\20.plugins.others\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nT\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\bhop\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n[\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\15indentline\20.plugins.others\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["legendary.nvim"] = {
    config = { "\27LJ\2\nY\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\23.plugins.legendary\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["minimap.vim"] = {
    commands = { "MinimapToggle", "Minimap", "MinimapRefresh" },
    config = { "\27LJ\2\nX\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\fminimap\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/minimap.vim",
    url = "https://github.com/wfxr/minimap.vim"
  },
  ["move.nvim"] = {
    commands = { "MoveLine", "MoveBlock", "MoveHChar", "MoveHBlock" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/move.nvim",
    url = "https://github.com/fedepujol/move.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n^\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vconfig\27.plugins.file_explorer\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nI\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\21.plugins.null-ls\21config_namespace\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    after = { "tabout.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    commands = { "Colorizer*" },
    config = { "\27LJ\2\nZ\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\14colorizer\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\2\nT\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\bgps\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    after = { "null-ls.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-endwise", "treesitter-unit", "nvim-ts-context-commentstring", "nvim-ts-autotag", "nvim-treesitter-textobjects" },
    loaded = true,
    only_config = true
  },
  ["nvim-treesitter-endwise"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n]\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\17project_nvim\20.plugins.others\21config_namespace\frequire\0" },
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["qf_helper.nvim"] = {
    commands = { "copen", "lopen", "QFToggle", "LLToggle", "QFOpen", "LLOpen" },
    config = { "\27LJ\2\nZ\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\14qf_helper\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/qf_helper.nvim",
    url = "https://github.com/stevearc/qf_helper.nvim"
  },
  ["searchbox.nvim"] = {
    commands = { "SearchBox*" },
    config = { "\27LJ\2\nW\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vsearch\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/searchbox.nvim",
    url = "https://github.com/VonHeikemen/searchbox.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vtabout\20.plugins.others\21config_namespace\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    after = { "harpoon", "telescope-frecency.nvim", "telescope-project.nvim", "telescope-fzf-native.nvim" },
    loaded = true,
    only_config = true
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n^\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\18todo_comments\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["treesitter-unit"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/treesitter-unit",
    url = "https://github.com/David-Kunz/treesitter-unit"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\2\nY\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\rundotree\20.plugins.others\21config_namespace\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/f0dy/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^Comment"] = "Comment.nvim",
  ["^harpoon"] = "harpoon",
  ["^hop"] = "hop.nvim",
  ["^nvim%-gps"] = "nvim-gps",
  ["^searchbox"] = "searchbox.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nL\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\24.plugins.treesitter\21config_namespace\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\23.plugins.telescope\21config_namespace\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\rdressing\20.plugins.others\21config_namespace\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vconfig\27.plugins.file_explorer\21config_namespace\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\2\nE\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\17.plugins.lsp\21config_namespace\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: cokeline.nvim
time([[Config for cokeline.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\24.plugins.bufferline\21config_namespace\frequire\0", "config", "cokeline.nvim")
time([[Config for cokeline.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\23.plugins.dashboard\21config_namespace\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: legendary.nvim
time([[Config for legendary.nvim]], true)
try_loadstring("\27LJ\2\nY\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\23.plugins.legendary\21config_namespace\frequire\0", "config", "legendary.nvim")
time([[Config for legendary.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\nsetup\24.plugins.statusline\21config_namespace\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\0156\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\0016\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\4\0B\0\1\1K\0\1\0\rsnippets\nsetup\21.plugins.luasnip\21config_namespace\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n[\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\15indentline\20.plugins.others\21config_namespace\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vfidget\20.plugins.others\21config_namespace\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vhlargs\20.plugins.others\21config_namespace\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nL\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\24.plugins.completion\21config_namespace\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\22.plugins.gitsigns\21config_namespace\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\17project_nvim\20.plugins.others\21config_namespace\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope-frecency.nvim ]]

-- Config for: telescope-frecency.nvim
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")

vim.cmd [[ packadd telescope-fzf-native.nvim ]]

-- Config for: telescope-fzf-native.nvim
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")

vim.cmd [[ packadd telescope-project.nvim ]]

-- Config for: telescope-project.nvim
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0", "config", "telescope-project.nvim")

vim.cmd [[ packadd tabout.nvim ]]

-- Config for: tabout.nvim
try_loadstring("\27LJ\2\nW\0\0\4\0\4\0\b6\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\0029\0\3\0B\0\1\1K\0\1\0\vtabout\20.plugins.others\21config_namespace\frequire\0", "config", "tabout.nvim")

vim.cmd [[ packadd treesitter-unit ]]
vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd nvim-treesitter-endwise ]]
vim.cmd [[ packadd nvim-ts-autotag ]]
vim.cmd [[ packadd null-ls.nvim ]]

-- Config for: null-ls.nvim
try_loadstring("\27LJ\2\nI\0\0\4\0\3\0\0066\0\0\0006\2\1\0'\3\2\0&\2\3\2B\0\2\1K\0\1\0\21.plugins.null-ls\21config_namespace\frequire\0", "config", "null-ls.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Copilot lua require("packer.load")({'copilot.vim'}, { cmd = "Copilot", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MoveLine lua require("packer.load")({'move.nvim'}, { cmd = "MoveLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined SearchBox* ++once lua require"packer.load"({'searchbox.nvim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MoveHChar lua require("packer.load")({'move.nvim'}, { cmd = "MoveHChar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MoveHBlock lua require("packer.load")({'move.nvim'}, { cmd = "MoveHBlock", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file copen lua require("packer.load")({'qf_helper.nvim'}, { cmd = "copen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file lopen lua require("packer.load")({'qf_helper.nvim'}, { cmd = "lopen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file QFToggle lua require("packer.load")({'qf_helper.nvim'}, { cmd = "QFToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LLToggle lua require("packer.load")({'qf_helper.nvim'}, { cmd = "LLToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file QFOpen lua require("packer.load")({'qf_helper.nvim'}, { cmd = "QFOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LLOpen lua require("packer.load")({'qf_helper.nvim'}, { cmd = "LLOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MoveBlock lua require("packer.load")({'move.nvim'}, { cmd = "MoveBlock", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Minimap lua require("packer.load")({'minimap.vim'}, { cmd = "Minimap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Colorizer* ++once lua require"packer.load"({'nvim-colorizer.lua'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapRefresh lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gbc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gbc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'headlines.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
