return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end },
    -- NOTE 拡張したlive_grep_argsを使う
    { "<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end },
    -- NOTE カーソル下の単語でgrepする
    {
      "fc",
      function() require("telescope-live-grep-args.shortcuts").grep_word_under_cursor() end,
    },
  },
  config = function()
    require("telescope").setup {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    }
    -- code actionをtelescopeで表示する
    require("telescope").load_extension "ui-select"
    require("telescope").load_extension "live_grep_args"
  end,
}
