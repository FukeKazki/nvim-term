-- スペースをリーダーキーにする
vim.g.mapleader = " "

-- start lazy --
local lazypath = vim.fn.stdpath "data" .. "/nvim-term-lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup "plugins"
-- end --

-- colorscheme
vim.cmd [[colorscheme tokyonight-night]]

-- key mappings
require("utils").set_mappings(require "mappings")

-- autocmds
require "autocmd"

-- lsp
require "lsp"

-- option
require "options"
