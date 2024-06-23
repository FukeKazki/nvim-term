local lsp_names = function()
  local clients = vim.lsp.get_active_clients()
  local names = {}
  for _, client in pairs(clients) do
    if client.name == "null-ls" then
      local sources = {}
      for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
        table.insert(sources, source.name)
      end
      table.insert(names, "null-ls(" .. table.concat(sources, ", ") .. ")")
    else
      table.insert(names, client.name)
    end
  end

  return "LSP: " .. table.concat(names, ", ")
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      sections = {
        lualine_x = { lsp_names },
      },
    }
  end,
}
