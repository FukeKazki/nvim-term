return {
  n = {
    ["|"] = { "<cmd>vnew<cr>", desc = "Vertical Split" },
    ["\\"] = { "<cmd>new<cr>", desc = "Horizontal Split" },
    ["<Leader>q"] = { "<cmd>q<cr>", desc = "Quit" },
    ["<Leader>w"] = { "<cmd>w<cr>", desc = "save" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Go to References" },
    -- code Action
    ["<Leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  },
  i = {
    ["jj"] = { "<C-\\><C-n>" },
    ["<ESC>"] = { "<C-\\><C-n>" },
  },
}
