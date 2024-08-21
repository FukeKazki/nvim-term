return {
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      { "<Up>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", desc = "Move cursor up" },
      { "<Down>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>", desc = "Move cursor down" },
      { "<Left>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>", desc = "Move cursor left" },
      { "<Right>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>", desc = "Move cursor right" },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
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
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = {
              ".DS_Store",
            },
          },
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
        },
      }
    end,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    },
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    cmd = {
      "Neogit",
    },
    config = function()
      require("neogit").setup {
        integration = {
          diffview = true,
        },
      }
    end,
    keys = {
      { "<leader>lg", "<cmd>Neogit<cr>", desc = "Neogit" },
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
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
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
          ["<Down>"] = require("cmp").mapping.select_next_item(),
          ["<Up>"] = require("cmp").mapping.select_prev_item(),
          ["<CR>"] = require("cmp").mapping.confirm { select = true },
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
      "nvimtools/none-ls-extras.nvim",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = { auto_refresh = false },
        suggestion = { auto_trigger = true, debounce = 150, keymap = {
          accept = "<Tab>",
        } },
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
      }
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype) return { "treesitter", "indent" } end,
      }
    end,
  },
}
