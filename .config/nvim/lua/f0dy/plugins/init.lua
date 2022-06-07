local present, packer = pcall(require, config_namespace .. ".plugins.packer")

if not present then
  return false
end

packer.startup({
  function(use, use_rocks)
    ----------------------------------AUTOLOAD---------------------------------- {{{
    use_rocks("penlight")
    use({
      "wbthomason/packer.nvim",
      opt = "true",
    })
    use({
      "nathom/filetype.nvim", -- Replace default filetype.vim which is slower
    })
    use({
      "nvim-lua/plenary.nvim", -- Required dependency for many plugins. Super useful Lua functions
    })
    use({
      "antoinemadec/FixCursorHold.nvim", -- Fix neovim CursorHold and CursorHoldI autocmd events performance bug
    })
    use({
      "lewis6991/impatient.nvim", -- Speeds up load times
    })
    ---------------------------------------------------------------------------- }}}
    ---------------------------------APPEARANCE--------------------------------- {{{
  use({
      "goolord/alpha-nvim", -- Dashboard for Neovim
      config = function()
        require(config_namespace .. ".plugins.dashboard").setup()
      end,
    })
    use({
      "feline-nvim/feline.nvim", -- Statusline
      requires = {
        { "kyazdani42/nvim-web-devicons" }, -- Web icons for various plugins
      })
     
    use({
      "noib3/cokeline.nvim", -- Bufferline
      config = function()
        require(config_namespace .. ".plugins.bufferline").setup()
      end,
    })
    use({
      "lewis6991/gitsigns.nvim", -- Git signs in the sign column
      config = function()
        require(config_namespace .. ".plugins.gitsigns")
      end,
    })
    use({
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "kyazdani42/nvim-web-devicons" },
        { "MunifTanjim/nui.nvim" },
      },
      config = function()
        require(config_namespace .. ".plugins.file_explorer").config()
      end,
    })
   --- TODO see if this work
    use({
      "stevearc/dressing.nvim", -- Utilises Neovim 0.6's new UI hooks to manage inputs, selects etc
      config = function()
        require(config_namespace .. ".plugins.others").dressing()
      end,
    })
    use({
      "norcalli/nvim-colorizer.lua", -- Highlight hex and rgb colors within Neovim
      cmd = { "Colorizer*" },
      config = function()
        require(config_namespace .. ".plugins.others").colorizer()
      end,
    })
    use({
      "lukas-reineke/headlines.nvim", -- Highlight headlines and code blocks in Markdown
      ft = "markdown",
      config = function()
        require(config_namespace .. ".plugins.others").headlines()
      end,
    })
    use({
      "wfxr/minimap.vim", -- Display a minimap
      cmd = { "MinimapToggle", "Minimap", "MinimapRefresh" },
      config = function()
        require(config_namespace .. ".plugins.others").minimap()
      end,
    })
    use({
      "lukas-reineke/indent-blankline.nvim", -- Show indentation lines
      config = function()
        require(config_namespace .. ".plugins.others").indentline()
      end,
    })
    use({
      "stevearc/qf_helper.nvim", -- Improves the quickfix and location list windows
      cmd = { "copen", "lopen", "QFToggle", "LLToggle", "QFOpen", "LLOpen" },
      config = function()
        require(config_namespace .. ".plugins.others").qf_helper()
      end,
    })
    ---------------------------------------------------------------------------- }}}
    -------------------------------EDITOR FEATURES------------------------------ {{{
    use({
      "nvim-telescope/telescope.nvim", -- Awesome fuzzy finder for everything
      requires = {
        {
          "nvim-telescope/telescope-project.nvim", -- Switch between projects
          after = "telescope.nvim",
          config = function()
            require("telescope").load_extension("project")
          end,
        },
        {
          "nvim-telescope/telescope-fzf-native.nvim", -- Use fzf within Telescope
          run = "make",
          after = "telescope.nvim",
          config = function()
            require("telescope").load_extension("fzf")
          end,
        },
        {
          "nvim-telescope/telescope-frecency.nvim", -- Get frequently opened files
          after = "telescope.nvim",
          requires = {
            { "tami5/sqlite.lua" },
          },
          config = function()
            require("telescope").load_extension("frecency")
          end,
        },
        {
          "ThePrimeagen/harpoon", -- Mark buffers for faster navigation
          module = "harpoon",
          after = "telescope.nvim",
          config = function()
            require("telescope").load_extension("harpoon")
            require(config_namespace .. ".plugins.others").harpoon()
          end,
        },
      },
      config = function()
        require(config_namespace .. ".plugins.telescope")
      end,
    })
    use({
      "mbbill/undotree", -- Visually see your undos
      cmd = "UndotreeToggle",
      config = function()
        require(config_namespace .. ".plugins.others").undotree()
      end,
    })
    use({
      "VonHeikemen/searchbox.nvim", -- Search box in the top right corner
      cmd = "SearchBox*",
      module = "searchbox",
      requires = {
        { "MunifTanjim/nui.nvim" },
      },
      config = function()
        require(config_namespace .. ".plugins.others").search()
      end,
    })
    use({
      "phaazon/hop.nvim", -- Speedily navigate anywhere in a buffer
      module = "hop",
      config = function()
        require(config_namespace .. ".plugins.others").hop()
      end,
    })
   use({
      "mrjones2014/legendary.nvim", -- A legend for all keymaps, commands and autocmds
      config = function()
        require(config_namespace .. ".plugins.legendary").setup()
      end,
    })
    ---------------------------------------------------------------------------- }}}
    ---------------------------------COMPLETION--------------------------------- {{{
    use({
      "hrsh7th/nvim-cmp", -- Code completion menu
      requires = {
        {
          "L3MON4D3/LuaSnip", -- Code snippets
          requires = {
            {
              "rafamadriz/friendly-snippets", -- Collection of code snippets across many languages
            },
          },
          config = function()
            require(config_namespace .. ".plugins.luasnip").setup()
            require(config_namespace .. ".plugins.luasnip").snippets()
          end,
        },
        { "onsails/lspkind-nvim" }, -- VS Code like icons
        -- cmp sources --
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
      },
      config = function()
        require(config_namespace .. ".plugins.completion")
      end,
    })
    ---------------------------------------------------------------------------- }}}
    -----------------------------------CODING----------------------------------- {{{
    use({
      "williamboman/nvim-lsp-installer", -- Install LSP servers from within Neovim
      requires = {
        { "neovim/nvim-lspconfig" }, -- Use Neovims native LSP config
        { "kosayoda/nvim-lightbulb" }, -- VSCode style lightbulb if there is a code action available
        {
          "j-hui/fidget.nvim", -- LSP progress notifications
          config = function()
            require(config_namespace .. ".plugins.others").fidget()
          end,
        },
      },
      config = function()
        require(config_namespace .. ".plugins.lsp")
      end,
    })
    use({
      "jose-elias-alvarez/null-ls.nvim", -- General language server for linting, formatting etc
      after = "nvim-lsp-installer",
      config = function()
        require(config_namespace .. ".plugins.null-ls")
      end,
    })
    use({
      "nvim-treesitter/nvim-treesitter", -- Smarter code understanding like syntax Highlight and navigation
      run = ":TSUpdate",
      requires = {
        {
          "windwp/nvim-ts-autotag", -- Autoclose and autorename HTML and Vue tags
          after = "nvim-treesitter",
        },
        {
          "JoosepAlviste/nvim-ts-context-commentstring", -- Smart commenting in multi language files - Enabled in Treesitter file
          after = "nvim-treesitter",
        },
        {
          "David-Kunz/treesitter-unit", -- Better selection of Treesitter code
          after = "nvim-treesitter",
        },
        {
          "RRethy/nvim-treesitter-endwise", -- add "end" in Ruby and other languages
          after = "nvim-treesitter",
        },
        {
          "nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects, select, move, swap, and peek support.
          after = "nvim-treesitter",
        },
        {
          "SmiteshP/nvim-gps", -- Show the current treesitter location in the statusline
          module = "nvim-gps",
          config = function()
            require(config_namespace .. ".plugins.others").gps()
          end,
        },
        {
          "m-demare/hlargs.nvim", --Highlight argument definitions
          config = function()
            require(config_namespace .. ".plugins.others").hlargs()
          end,
        },
      },
      config = function()
        require(config_namespace .. ".plugins.treesitter")
      end,
    })
    use({
      "nvim-treesitter/playground", -- View Treesitter definitions
      cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    })
    use({
      "abecodes/tabout.nvim", -- Tab out from parenthesis, quotes, brackets...
      after = "nvim-cmp",
      wants = "nvim-treesitter",
      config = function()
        require(config_namespace .. ".plugins.others").tabout()
      end,
    })
   use({
      "folke/todo-comments.nvim", -- Highlight and search for todo comments within the codebase
      event = "BufRead",
      config = function()
        require(config_namespace .. ".plugins.others").todo_comments()
      end,
    })
    use({
      "numToStr/Comment.nvim", -- Comment out lines with gcc
      module = "Comment",
      keys = { "gcc", "gc", "gbc" },
      config = function()
        require(config_namespace .. ".plugins.others").comment()
      end,
    })
    use({
      "fedepujol/move.nvim", -- Move lines and blocks
      cmd = { "MoveLine", "MoveBlock", "MoveHChar", "MoveHBlock" },
    })
   use({
      "ahmedkhalf/project.nvim", -- Automatically set the cwd to the project root
      config = function()
        require(config_namespace .. ".plugins.others").project_nvim()
      end,
    })
    use({
      "github/copilot.vim", -- AI programming
      cmd = "Copilot",
    })
  end,
})
