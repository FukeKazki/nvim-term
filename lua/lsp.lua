require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "gopls", "tsserver" },
}
require("mason-lspconfig").setup_handlers {
  function(server_name)
    local opt = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    require("lspconfig")[server_name].setup(opt)
  end,
}

-- こっちに寄せる
require("mason-null-ls").setup {
  ensure_installed = { "stylua", "jq" },
  handlers = {},
}
-- null-lsには何も設定しない
require("null-ls").setup {
  sources = {},
}
