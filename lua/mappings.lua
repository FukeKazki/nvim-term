return {
  t = {
    ["jj"] = { "<C-\\><C-n>" },
    ["<ESC>"] = { "<C-\\><C-n>" },
    ["<C-k>"] = {
      function() require("smart-splits").move_cursor_up() end,
    },
    ["<C-j>"] = {
      function() require("smart-splits").move_cursor_down() end,
    },
    ["<C-h>"] = {
      function() require("smart-splits").move_cursor_left() end,
    },
    ["<C-l>"] = {
      function() require("smart-splits").move_cursor_right() end,
    },
  },
  n = {
    ["|"] = { "<cmd>vnew<cr>", desc = "Vertical Split" },
    ["\\"] = { "<cmd>new<cr>", desc = "Horizontal Split" },
  },
  i = {
    ["jj"] = { "<C-\\><C-n>" },
    ["<ESC>"] = { "<C-\\><C-n>" },
    ["<C-k>"] = {
      function() require("smart-splits").move_cursor_up() end,
    },
    ["<C-j>"] = {
      function() require("smart-splits").move_cursor_down() end,
    },
    ["<C-h>"] = {
      function() require("smart-splits").move_cursor_left() end,
    },
    ["<C-l>"] = {
      function() require("smart-splits").move_cursor_right() end,
    },
  },
}
