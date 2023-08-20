return {
  t = {
    ["jj"] = { "<C-\\><C-n>" },
    ["<ESC>"] = { "<C-\\><C-n>" },
    -- terminal モード中の画面移動
    ["<C-k>"] = {
      function()
        require("smart-splits").move_cursor_up()
      end,
    },
    ["<C-j>"] = {
      function()
        require("smart-splits").move_cursor_down()
      end,
    },
    ["<C-h>"] = {
      function()
        require("smart-splits").move_cursor_left()
      end,
    },
    ["<C-l>"] = {
      function()
        require("smart-splits").move_cursor_right()
      end,
    },
  },
  n = {
    ["|"] = { "<cmd>vnew<cr><cmd>terminal<cr>", desc = "Vertical Split" },
    ["\\"] = { "<cmd>new<cr><cmd>terminal<cr>", desc = "Horizontal Split" },
  },
}
