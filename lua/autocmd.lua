local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- インサートモードでターミナルを開く
autocmd("termopen", {
  pattern = "*",
  command = "startinsert",
})
