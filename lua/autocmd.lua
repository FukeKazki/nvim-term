local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*",
  callback = function() vim.lsp.buf.format() end,
})

-- switch denols / ts_ls
autocmd("LspAttach", {
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    local curr_client = vim.lsp.get_client_by_id(args.data.client_id)
    if not curr_client then return end

    if curr_client.name == "denols" then
      for _, client in ipairs(vim.lsp.get_clients { bufnr = bufnr, name = "ts_ls" }) do
        vim.lsp.stop_client(client.id, true)
      end
    elseif curr_client.name == "ts_ls" then
      if next(vim.lsp.get_clients { bufnr = bufnr, name = "denols" }) then
        vim.lsp.stop_client(curr_client.id, true)
      end
    end
  end,
})
