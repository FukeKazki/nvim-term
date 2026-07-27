require("mason").setup()

local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(custom_capabilities),
})

vim.lsp.config("ts_ls", {
  root_markers = { "tsconfig.json" },
  single_file_support = false,
})

vim.lsp.config("denols", {
  root_markers = { "deno.json", "deno.jsonc" },
})

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "denols",
    "tailwindcss",
    "perlnavigator",
    "astro",
    "mdx_analyzer",
    "eslint", -- lintはこちらのネイティブLSPに寄せる(EslintFixAllが使える)
  },
}
