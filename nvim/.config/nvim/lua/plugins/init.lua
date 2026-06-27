-- Native Plugin Manager (vim.pack) Initialization
local pack = vim.pack

pack.add({
  -- UI & theme
  { src = "https://github.com/goolord/alpha-nvim.git",                       name = "alpha" },
  { src = "https://github.com/norcalli/nvim-colorizer.lua.git",              name = "colorizer" },
  { src = "https://github.com/folke/tokyonight.nvim.git",                    name = "tokyonight" },
  { src = "https://github.com/ellisonleao/gruvbox.nvim",                     name = "gruvbox" },
  { src = "https://github.com/folke/trouble.nvim",                           name = "trouble" },
  { src = "https://github.com/folke/which-key.nvim",                         name = "which-key" },
  { src = "https://github.com/lewis6991/gitsigns.nvim",                      name = "gitsigns" },
  { src = "https://github.com/folke/todo-comments.nvim",                     name = "todo-comments" },
  { src = "https://github.com/xiyaowong/transparent.nvim.git",               name = "transparent" },
  { src = "https://github.com/vimpostor/vim-tpipeline.git",                  name = "tpipeline" },

  -- Navigation
  { src = "https://github.com/folke/flash.nvim.git",                         name = "flash" },
  { src = "https://github.com/ThePrimeagen/harpoon.git",                     name = "harpoon" },
  { src = "https://github.com/nvim-lua/plenary.nvim.git",                    name = "plenary" },
  { src = "https://github.com/nvim-telescope/telescope.nvim.git",            name = "telescope" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", name = "telescope-fzf-native",   build = "make" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim.git",  name = "telescope-ui-select" },

  -- Completion & Snippets
  { src = "https://github.com/nvim-tree/nvim-web-devicons.git",              name = "nvim-web-devicons" },
  { src = "https://github.com/hrsh7th/nvim-cmp.git",                         name = "nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git",                     name = "cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer.git",                       name = "cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path.git",                         name = "cmp-path" },
  { src = "https://github.com/L3MON4D3/LuaSnip.git",                         name = "luasnip" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip.git",                 name = "cmp_luasnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets.git",             name = "friendly-snippets" },
  { src = "https://github.com/onsails/lspkind-nvim.git",                     name = "lspkind" },

  -- Terminal & Multiplexer
  { src = "https://github.com/christoomey/vim-tmux-navigator.git",           name = "tmux-navigator" },

  -- AI
  { src = "https://github.com/github/copilot.vim",                           name = "copilot" },

  -- LSP, Formatting, Linting
  { src = "https://github.com/neovim/nvim-lspconfig",                        name = "nvim-lspconfig" },
  { src = "https://github.com/williamboman/mason.nvim",                      name = "mason" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim",            name = "mason-lspconfig" },
  { src = "https://github.com/stevearc/conform.nvim",                        name = "conform" },
  { src = "https://github.com/mfussenegger/nvim-lint",                       name = "nvim-lint" },

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",              name = "nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-context",      name = "nvim-treesitter-context" },

  -- Editing Enhancements
  { src = "https://github.com/echasnovski/mini.nvim.git",                    name = "mini" },
})

-- Safe load helper
local function safe_require(module)
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify("Error loading " .. module .. ": " .. err, vim.log.levels.ERROR)
  end
end

-- Core Plugin Configs
safe_require("plugins.alpha")
--safe_require("plugins.colorizer")
safe_require("plugins.colorscheme")
safe_require("plugins.conform")
safe_require("plugins.lspconfig")
safe_require("plugins.nvim-cmp")
safe_require("plugins.telescope")
safe_require("plugins.transparent")
safe_require("plugins.treesitter")
safe_require("plugins.trouble")

-- Restored Defaults & Extras
safe_require("plugins.flash")
safe_require("plugins.gitsigns")
safe_require("plugins.harpoon")
safe_require("plugins.mini")
safe_require("plugins.todo-comments")
safe_require("plugins.which-key")
