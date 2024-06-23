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
}
