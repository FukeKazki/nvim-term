return {
  n = {
    ["|"] = { "<cmd>vnew<cr>", desc = "Vertical Split" },
    ["\\"] = { "<cmd>new<cr>", desc = "Horizontal Split" },
    ["<Leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
    ["<Leader>q"] = { "<cmd>q<cr>", desc = "Quit" },
    ["<Leader>w"] = { "<cmd>w<cr>", desc = "Write" },
    ["<Leader>z"] = { "<cmd>ZenMode<cr>", desc = "Zen" },
    ["<Leader>ff"] = { function() require("telescope.builtin").find_files() end },
    ["<Leader>fg"] = { function() require("telescope.builtin").live_grep() end },
    ["<Up>"] = {
      function() require("smart-splits").move_cursor_up() end,
    },
    ["<Down>"] = {
      function() require("smart-splits").move_cursor_down() end,
    },
    ["<Left>"] = {
      function() require("smart-splits").move_cursor_left() end,
    },
    ["<Right>"] = {
      function() require("smart-splits").move_cursor_right() end,
    },
  },
  i = {
    ["jj"] = { "<C-\\><C-n>" },
    ["<ESC>"] = { "<C-\\><C-n>" },
  },
}
