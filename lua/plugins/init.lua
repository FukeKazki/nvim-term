return {
  {
    "mrjones2014/smart-splits.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        close_if_last_window = true,
        filesystem = {
          filterd_items = {
            hide_dotfiles = false,
            hide_gitignore = false,
            never_show = {
              ".DS_Store",
            },
          },
        },
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy", -- これがないと動かない
    config = function() require("nvim-ts-autotag").setup {} end,
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function() require("nvim-autopairs").setup() end,
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("lualine").setup() end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = 0.85,
          height = 0.85,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
          },
        },
        plugins = {
          options = {
            laststatus = 0,
          },
          tmux = { enabled = true },
          alacritty = {
            enabled = true,
            font = "14", -- font size
          },
        },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      require("cmp").setup {
        snippet = {
          expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
        },
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = {
          ["<C-n>"] = require("cmp").mapping.select_next_item(),
        },
      }
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
  },
}
