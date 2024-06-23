require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "gopls" },
}
require("mason-lspconfig").setup_handlers {
  function(server_name)
    local opt = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    require("lspconfig")[server_name].setup(opt)
  end,
}
