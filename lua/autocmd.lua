local autocmd = vim.api.nvim_create_autocmd

-- インサートモードでターミナルを開く
autocmd("termopen", {
  pattern = "*",
  command = "startinsert",
})

autocmd("BufWritePre", {
  pattern = "*",
  callback = function() vim.lsp.buf.format() end,
})
