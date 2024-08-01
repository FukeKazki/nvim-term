local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*",
  callback = function() vim.lsp.buf.format() end,
})

-- switch denols tsserver
autocmd("LspAttach", {
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    local curr_client = vim.lsp.get_client_by_id(args.data.client_id)

    if curr_client and curr_client.name == "denols" then
      local clients = (vim.lsp.get_clients or vim.lsp.get_active_clients) {
        bufnr = bufnr,
        name = "tsserver",
      }
      for _, client in ipairs(clients) do
        vim.lsp.stop_client(client.id, true)
      end
    end

    -- if tsserver attached, stop it if there is a denols server attached
    if curr_client and curr_client.name == "tsserver" then
      if next((vim.lsp.get_clients or vim.lsp.get_active_clients) { bufnr = bufnr, name = "denols" }) then
        vim.lsp.stop_client(curr_client.id, true)
      end
    end
  end,
})
