return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end },
  },
  config = function()
    require("telescope").setup {}
    -- code actionをtelescopeで表示する
    require("telescope").load_extension "ui-select"
  end,
}
