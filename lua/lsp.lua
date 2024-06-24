require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "gopls", "tsserver", "denols" },
}
require("mason-lspconfig").setup_handlers {
  function(server_name)
    local opt = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    -- tsserver
    if server_name == "tsserver" then opt.single_file_support = false end
    -- denols
    if server_name == "denols" then opt.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc") end

    require("lspconfig")[server_name].setup(opt)
  end,
}

-- こっちに寄せる
require("mason-null-ls").setup {
  ensure_installed = { "stylua", "jq", "prettierd" },
  handlers = {},
}
require("null-ls").setup {
  sources = {
    require "none-ls.diagnostics.eslint",
    require "none-ls.code_actions.eslint",
  },
}
